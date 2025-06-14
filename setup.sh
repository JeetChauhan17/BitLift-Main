
#!/bin/bash

# BitLift Automated Setup Script 
# Author: Jeet Chauhan

# Set colors
GREEN="\e[32m"
RED="\e[31m"
END="\e[0m"

# Exit on any error
set -e

echo -e "${GREEN}>> BitLift Setup Starting...${END}"

# Check Redis
echo -e "${GREEN}>> Checking Redis status...${END}"
if ! pgrep redis-server > /dev/null; then
    echo -e "${RED}Redis not running. Attempting to start...${END}"

    if command -v systemctl &> /dev/null; then
        sudo systemctl start redis || true
    fi

    if ! pgrep redis-server > /dev/null; then
        echo -e "${GREEN}Starting Redis with Docker...${END}"
        docker run -d -p 6379:6379 redis
    fi
else
    echo -e "${GREEN}Redis is running ✅${END}"
fi

# Clone project (optional)
# git clone https://github.com/JeetChauhan17/BitLift-Main.git
# cd BitLift-Main

# Install dependencies
for dir in bitlift bitlift-deploy-service bitlift-request-handler frontend; do
    echo -e "${GREEN}>> Installing in $dir...${END}"
    cd $dir
    npm install
    cd ..
done

# Function to open new terminal and run service
run_in_terminal() {
    CMD=$1
    TITLE=$2

    if command -v gnome-terminal &> /dev/null; then
        gnome-terminal -- bash -c "$CMD; exec bash"
    elif command -v xfce4-terminal &> /dev/null; then
        xfce4-terminal --title="$TITLE" --hold -e "$CMD"
    elif command -v konsole &> /dev/null; then
        konsole --new-tab -e bash -c "$CMD; exec bash"
    else
        echo -e "${RED}No supported terminal emulator found, running in background...${END}"
        bash -c "$CMD &"
    fi
}

# Start services
echo -e "${GREEN}>> Starting backend services...${END}"
run_in_terminal "cd bitlift && npm run dev" "bitlift"
run_in_terminal "cd bitlift-deploy-service && npm run dev" "deploy-service"
run_in_terminal "cd bitlift-request-handler && npm run dev" "request-handler"

# Start frontend
echo -e "${GREEN}>> Starting frontend...${END}"
cd frontend
npm run dev &
cd ..

# Output final status
echo -e "${GREEN}✅ All services started:${END}"
echo "  🔹 bitlift               → http://localhost:3000"
echo "  🔹 deploy-service        → http://localhost:3001"
echo "  🔹 request-handler       → http://localhost:3002"
echo "  🔹 frontend (Vite UI)    → http://localhost:5173"
