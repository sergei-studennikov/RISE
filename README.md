# RISE - Remote Isolation and Secure Execution - MVP

RISE is a minimal, easy-to-deploy prototype of remote browser isolation.

It runs a web browser inside a container and exposes it via a browser-based remote session. The user interacts with the browser through pixels only, while execution remains isolated from the host system.

This repository focuses on a **working MVP** that is:
- easy to deploy
- easy to reproduce
- easy to evaluate

The full architecture and security model are described separately.

---

## Core Idea

- Browser runs inside an isolated environment
- User connects via web browser
- Interaction is limited to remote display (pixels + input)
- No direct data channel between browser and host

---

## Key Features

- **Easy Deployment:** Single-command build and run using Docker
- **Browser-Based Access:** No client installation required
- **Isolated Execution:** Web content runs inside container, not on host
- **Reproducible MVP:** Deterministic environment for testing and evaluation
- **Real-World Target:** Demonstrated with WhatsApp Web

---

## Repository Structure

- `Dockerfile` — container definition
- `build.sh` — build script
- `run.sh` — run script
- `clear-art.sh` — cleanup script
- `USAGE.md` — usage details

---

## Installation & Launch

### Build

```bash
./build.sh
````

### Run

```bash
./run.sh
```

### Access

Open in browser:

```
http://localhost:6080
```

---

## Scope (MVP)

This repository provides:

* a working remote-isolated browser
* browser-based access
* reproducible environment

This repository does NOT yet provide:

* strong isolation guarantees
* strict network controls
* production hardening

