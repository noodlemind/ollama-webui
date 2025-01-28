# Models Guide

This guide covers available models and their configurations.

## Supported Models

### DeepSeek R1 Models

1. **DeepSeek R1 1.5B**
	- Size: ~2GB
	- RAM Required: 4GB minimum
    - Best for: Basic tasks, testing
	```bash
        ./scripts/manage.sh pull deepseek-r1:1.5b
	```

2. **DeepSeek R1 7B** (Recommended)
	- Size: ~8GB
	- RAM Required: 16GB minimum
	- Best for: General use, balanced performance
   ```bash
	   ./scripts/manage.sh pull deepseek-r1:7b
   ```


## Hardware Requirements

### Minimum Requirements by Model

| Model | RAM | Storage | GPU Memory |
|-------|-----|---------|------------|
| 1.5B  | 4GB | 5GB    | Optional   |
| 7B    | 16GB| 16GB   | 8GB        |
| 70B   | 32GB| 80GB   | 24GB       |

### Platform-Specific Optimizations

#### Apple Silicon (M1/M2/M3)
- Optimized for Metal
- Neural Engine support
- Better performance with native ARM64 builds

#### NVIDIA GPUs
- CUDA acceleration
- Tensor Cores utilization
- Multi-GPU support

## Model Management

### Basic Commands

1. List installed models:
   ```bash
    ./scripts/manage.sh models list
   ```
2. Pull a new model:
	```bash 
    ./scripts/manage.sh models pull MODEL_NAME
    ```

3. Remove a model:
   ```bash 
   ./scripts/manage.sh models remove MODEL_NAME
   ```


### Best Practices

1. Model Selection:
	- Start with 7B model for testing
	- Upgrade based on needs
	- Consider hardware limitations

2. Performance Optimization:
	- Use GPU acceleration when available
	- Monitor memory usage
	- Clean unused models

3. Storage Management:
	- Regular cleanup of unused models
	- Monitor disk space
	- Backup important configurations

## Troubleshooting

### Common Issues

1. Out of Memory
	- Reduce model size
	- Close unnecessary applications
	- Adjust Docker memory limits

2. Slow Performance
	- Check GPU utilization
	- Monitor system resources
	- Consider using a smaller model

3. Model Loading Failures
	- Verify hardware requirements
	- Check network connectivity
	- Ensure sufficient disk space