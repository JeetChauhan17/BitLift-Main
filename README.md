<p align="center">
  <img src="https://raw.githubusercontent.com/JeetChauhan17/BitLift-Main/refs/heads/master/assets/logo.png" alt="BitLift Logo" width="200"/>
</p>

<p align="center">
  <b>Self-hosted Vercel alternative with GitHub repo integration, Redis queues, workers & more</b>
</p>

<p align="center">
  <a href="https://github.com/JeetChauhan17/BitLift-Main/stargazers"><img src="https://img.shields.io/github/stars/JeetChauhan17/BitLift-Main?style=social" alt="GitHub stars"/></a>
  <a href="https://github.com/JeetChauhan17/BitLift-Main/issues"><img src="https://img.shields.io/github/issues/JeetChauhan17/BitLift-Main" alt="GitHub issues"/></a>
  <a href="https://github.com/JeetChauhan17/BitLift-Main/network"><img src="https://img.shields.io/github/forks/JeetChauhan17/BitLift-Main" alt="GitHub forks"/></a>
  <a href="https://github.com/JeetChauhan17/BitLift-Main/blob/main/LICENSE"><img src="https://img.shields.io/github/license/JeetChauhan17/BitLift-Main" alt="License"/></a>
  
</p>

---

## 📦 Overview

**BitLift** is a self-hosted deployment platform inspired by Vercel. It automates the deployment of GitHub repositories using Redis queues and workers. It supports static frontend hosting, background job processing, and cloud storage – all built using modern tools like TypeScript, React, Redis, and Backblaze B2.

---


## ✨ Features

- ⚙️ `bitlift` CLI — deploy sites from terminal  
- 🌐 `bitlift-deploy-service` — handles uploads  
- 🔁 `bitlift-request-handler` — background processor  
- 📊 Frontend UI — view deployments  
- ⚡ Fast local-first setup using Redis & Node.js  

---

## 🛠 Tech Stack

- **Backend**: Node.js, TypeScript, Express  
- **CLI**: Custom-built CLI using Node.js + TypeScript  
- **Queue System**: Redis + BullMQ (message brokering and job queues)  
- **Worker**: Dedicated background service for deployment processing  
- **File Handling**: `adm-zip`, `fs`, `path`  
- **Static Hosting**: `http-server`  
- **Frontend**: Vite + React  
- **CI/CD**: GitHub API integration (repo-based deployments)  
- **Cloud Storage**: Backblaze B2 Object Storage  
- **Dev Tools**: `ts-node` for TypeScript runtime, Docker (for Redis)  

---

## 🚀 Getting Started

### Prerequisites

- Node.js (v18+)
- Redis
- Docker (optional, for Redis)
- Unix shell (`bash`, `zsh`, etc.)

---


### 📥 Clone the repo

```bash
git clone https://github.com/JeetChauhan17/BitLift-Main.git
cd BitLift-Main
```

### 🔧 Setup with script (recommended)

```bash
chmod +x setup.sh
./setup.sh
```

This script installs dependencies, ensures Redis is running (via Docker), and starts your development servers.

> 📦 `setup.sh` handles:
> - Installing server/client dependencies  
> - Starting Redis via Docker  
> - Launching backend and frontend  

---

## 🧪 Manual Setup for Individual Services

### 1. `bitlift` (CLI)

```bash
cd bitlift
npm install
npm run dev
```

Usage:

```bash
bitlift deploy ./your-static-site-folder
```

---

### 2. `bitlift-deploy-service`

Runs on port `3001`. Accepts uploads from CLI.

```bash
cd bitlift-deploy-service
npm install
npm run dev
```

---

### 3. `bitlift-request-handler`

Redis-powered background worker.

```bash
cd bitlift-request-handler
npm install
npm run dev
```

---

### 4. `frontend`

A Vite-based UI to view deployed projects.

```bash
cd frontend
npm install
npm run dev
```

Visit: [http://localhost:5173](http://localhost:5173)

---
> Make sure Redis is running on port `6379`

You can use Docker:
```bash
docker run -d --name bitlift-redis -p 6379:6379 redis
```

---

## 🌟 Star History 
<a href="https://star-history.com/#JeetChauhan17/BitLift-Main&Date"><img src="https://api.star-history.com/svg?repos=JeetChauhan17/BitLift-Main&type=Date" alt="Star History Chart" width="800"/></a>

---

## 🧠 Credits

Made with ❤️ by [Jeet Chauhan](https://github.com/JeetChauhan17) 

---

## 📄 License

This project is licensed under the MIT License. See [`LICENSE`](LICENSE) for details.
