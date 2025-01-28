# Ollama WebUI

A comprehensive Docker setup for running Ollama with OpenWebUI, optimized for various platforms including Apple Silicon (M1/M2/M3). Run powerful AI models locally with a user-friendly web interface.

## 🚀 Features

- **Easy Setup**: Interactive CLI for seamless installation and management.
- **AI Model Support**: Support for multiple AI models (DeepSeek R1 series).
- **Cross-Platform Optimization**: Optimized for Apple Silicon and other platforms.
- **Persistent Storage**: Models and data are stored persistently.
- **User-Friendly Interface**: Accessible web-based GUI for end-users.
- **Complete Privacy**: All processing is performed locally, ensuring data privacy.

## 🔧 Requirements

- **Software Requirements**:
	- Docker Desktop or Docker Engine
	- Git

- **Hardware Requirements**:
	- Minimum:
		- **RAM**: 8GB (16GB+ recommended)
		- **Storage**: 1TB recommended for hosting multiple models
	- For Apple Silicon:
		- **Metal GPU Support**: GPU acceleration is handled automatically.

## 📦 Quick Start

1. **Clone the repository**:
   ```bash
   git clone https://github.com/noodlemind/ollama-webui.git
   cd ollama-webui
   ```

2. **Start services using the management script**:
   ```bash
   ./scripts/manage.sh start
   ```

3. **Access the web interface**:  
   Open your browser and go to:  
   `http://localhost:3000`

## 💻 Usage

The project includes an interactive management script for easy control.

### Manage Services
Run the following command for available actions:
```bash
./scripts/manage.sh
```

**Available Commands**:
- `start`: Start all services
- `stop`: Stop all services
- `models`: Manage AI models (download/update/remove)
- `logs`: View logs for active services
- `status`: Check the system and service status

## 🤖 Supported Models

This project supports the following DeepSeek models:

- **DeepSeek R1 1.5B**: Lightweight (~2GB), suitable for quick tasks.
- **DeepSeek R1 7B**: Recommended for most users (~8GB).
- **DeepSeek R1 70B**: Full-featured model with maximum capability (~40GB).

For more information, see the [Models Documentation](docs/MODELS.md).

## ⚙️ Configuration

Key configuration areas include:
- **Resource Limits**: CPU, memory, and GPU usage settings.
- **Model Selection**: Specify which models to use.
- **Network Settings**: Customize ports and external access.
- **Security Options**: Configure authentication or access restrictions.

Refer to the full guide: [Configuration Guide](docs/CONFIGURATION.md).

## 📚 Documentation

- [Installation Guide](docs/INSTALLATION.md)
- [Configuration Guide](docs/CONFIGURATION.md)
- [Models Documentation](docs/MODELS.md)

## 🤝 Contributing

We welcome contributions from the community! Feel free to fork the repository, work on your changes, and submit a Pull Request. For major changes, consider opening an issue to discuss your proposal first.

## 📄 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.

## 🙏 Acknowledgments

- [Ollama](https://github.com/ollama/ollama) for the outstanding model management.
- [OpenWebUI](https://github.com/open-webui/open-webui) for their intuitive web interface.
- DeepSeek for providing their powerful AI models.

---

This setup is designed to empower users to run advanced AI workloads locally while maintaining a strong focus on performance, privacy, and user experience.