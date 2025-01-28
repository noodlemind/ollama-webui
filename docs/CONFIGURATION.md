# Configuration Guide

This guide explains all configuration options available in the Ollama WebUI Docker setup.

## Docker Compose Configuration

### Resource Limits

In `docker/docker-compose.yml`, you can adjust the following:
```yaml
  deploy:
    resources:
      limits:
        memory: "32g" # Adjust based on your system
        cpus: "8" # Adjust based on your CPU cores
```
### Environment Variables

Key environment variables that can be configured:

| Variable | Default | Description |
|----------|---------|-------------|
| OLLAMA_PORT | 11434 | Ollama API port |
| WEBUI_PORT | 3000 | WebUI access port |
| ENABLE_SIGNUP | true | Enable/disable new user registration |

## Model Configuration

### Default Model Settings

The default model configuration can be modified in `scripts/models-init.sh`:
```bash
	# Example of changing default model
	ollama pull deepseek-r1:7b # Change to desired model
```

### Hardware-Specific Optimizations

#### For Apple Silicon (M1/M2/M3)
- Metal GPU support is automatically enabled
- Optimized for Neural Engine

#### For NVIDIA GPUs
- CUDA support is automatically detected
- Requires NVIDIA Container Toolkit

## Security Configuration

### User Authentication

1. First-time setup:
	- Enable signup: `ENABLE_SIGNUP=true`
	- Create admin account
	- Disable signup: `ENABLE_SIGNUP=false`

### Network Security

1. Default exposed ports:
	- Ollama API: 11434
	- WebUI: 3000

2. To change ports:
   ```yaml 
   		ports:
			"custom_port:11434" # For Ollama
			"custom_port:8080" # For WebUI
	```

## Advanced Configuration

### Custom Model Configuration

Create custom model configurations in `config/models/`:
```bash
	# Example custom model configuration
	ollama pull custom-model:latest
```

### Logging Configuration
Adjust logging in docker-compose.yml:
```yaml
    logging:
      driver: "json-file"
      options:
        max-size: "10m"
        max-file: "3"
```
