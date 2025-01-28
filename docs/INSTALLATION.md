# Installation Guide

This guide will help you set up Ollama with OpenWebUI on your local machine.

## Prerequisites

- Docker Desktop installed
- Git installed
- Minimum Requirements:
	- 8GB RAM (16GB+ recommended)
	- 1TB storage recommended for multiple models
	- For M3 Max users: Metal GPU support is automatic

## Quick Installation

1. Clone the repository:
	```bash
 		git clone https://github.com/noodlemind/ollama-webui.git cd ollama-webui
	```
2. Make scripts executable:
    ```bash
    	bash chmod +x scripts/manage.sh chmod +x scripts/models-init.sh
	```
3. Start the services:
    ```bash
    	./scripts/manage.sh start
	```
4. Access the web interface:
- Open your browser and navigate to `http://localhost:3000`
- Create your account on first login

## Manual Installation

If you prefer to run services individually:

1. Create a Docker network:
	```bash 
		docker network create ollama-network 
	```
2. Start Ollama:
	```bash
		docker network create ollama-network 
	```
3. Start OpenWebUI:
	```bash
		docker compose up -d openwebui 
	```

## Troubleshooting

### Common Issues

1. Port Conflicts:
	- Ensure ports 11434 and 3000 are available
	- Modify docker-compose.yml if needed

2. GPU Access:
	- Verify Docker has GPU access
	- Check Metal support on macOS

3. Memory Issues:
	- Adjust memory limits in docker-compose.yml
	- Monitor resource usage

## Updating

To update to the latest version:
```bash
    git pull docker compose pull ./scripts/manage.sh restart
```