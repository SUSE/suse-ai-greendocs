# AI Compare - Upstream Edition

## Overview

**AI Compare** is a comprehensive AI response comparison tool that demonstrates differences between direct model access and pipeline-enhanced responses. Built on upstream open-source components, it provides an ideal platform for AI/ML demonstrations, education, and development while showcasing the security differences between upstream images and enterprise-hardened alternatives.

## 🏗️ Architecture Components

This chart deploys a complete AI comparison stack with four main components:

### 🦙 Ollama - Local LLM Server
- **Purpose**: Local large language model inference
- **Technology**: Open-source LLM runtime
- **Models**: TinyLlama, Llama2, and custom models
- **Features**: GPU acceleration, model caching, API access

### 🌐 Open WebUI - Web Interface
- **Purpose**: Modern web interface for LLM interactions
- **Technology**: FastAPI + Vue.js frontend
- **Features**: Chat interface, model management, user authentication
- **Integration**: Pipeline support for enhanced responses

### 🔗 Open WebUI Pipelines - Response Enhancement
- **Purpose**: Middleware for response processing and enhancement
- **Technology**: Python-based pipeline framework
- **Features**: Multi-level responses (Kid, Student, Scientific), automatic configuration
- **Demo**: Educational response adaptation

### 🐍 AI Compare Chat - Custom Comparison App
- **Purpose**: Side-by-side AI response comparison
- **Technology**: Python + Gradio web framework
- **Features**: Direct Ollama vs Pipeline-enhanced responses, automation, security demos
- **Monitoring**: OpenTelemetry observability integration

## ✨ Key Features

### 🔄 **Response Comparison**
- Side-by-side comparison of direct model responses vs pipeline-enhanced responses
- Real-time response analysis and metrics
- Educational demonstrations with different complexity levels

### 🚀 **Easy Deployment**
- One-click installation via Rancher Apps & Marketplace
- Automatic service discovery and configuration
- GPU acceleration support with NVIDIA runtime

### 📊 **Observability Ready**
- OpenTelemetry integration with SUSE Observability
- Request tracing, token usage monitoring, and performance metrics
- GPU statistics collection and monitoring

### 🔒 **Security Demonstrations**
- **Data Leak Prevention (DLP)**: Dual data type transmission (credit card + SSN)
- **Availability Monitoring**: External connectivity and network policy testing
- **NeuVector Integration**: Automated security policy deployment and DLP detection

### ⚙️ **Automation**
- Automated testing and response generation
- Configurable prompt rotation and scheduling
- Background traffic generation for monitoring demos

## 🚀 Quick Start

1. **Install from Rancher Apps & Marketplace**
   - Navigate to Apps & Marketplace
   - Search for "AI Compare"
   - Click Install

2. **Basic Configuration**
   - Choose your deployment namespace
   - Enable GPU support if available
   - Configure storage preferences

3. **Access the Application**
   - AI Compare Chat: `http://<cluster-ip>:<node-port>`
   - Open WebUI: `http://<cluster-ip>:<webui-port>`
   - Ollama API: `http://<cluster-ip>:<ollama-port>`

## 📋 Prerequisites

- **Kubernetes Cluster**: v1.24+
- **Storage**: Persistent volumes for model caching (recommended)
- **GPU Support**: NVIDIA GPU Operator (optional but recommended)
- **Memory**: 4GB+ available for model loading
- **CPU**: 2+ cores recommended

## ⚙️ Configuration Options

### Basic Settings
- **Namespace**: Target deployment namespace
- **Model Selection**: Choose from available LLM models
- **Service Types**: NodePort, ClusterIP, or LoadBalancer
- **Resource Limits**: CPU and memory allocation

### Advanced Settings (Optional)
- **GPU Acceleration**: Enable NVIDIA GPU support
- **Persistent Storage**: Model caching and data persistence
- **Observability**: OpenTelemetry and SUSE Observability integration
- **Security**: NeuVector DLP policy automation
- **Automation**: Background testing and monitoring

### Enterprise Features
- **Image Pull Secrets**: Private registry access
- **Pipeline Integration**: Response enhancement configuration
- **Development Mode**: SSH access and code persistence

## 🔧 Customization

The chart supports extensive customization through Helm values:

```yaml
# GPU acceleration
ollama:
  gpu:
    enabled: true
    type: nvidia

# Observability
aiCompare:
  observability:
    enabled: true
    otlpEndpoint: "http://your-collector:4318"

# Security integration
neuvector:
  enabled: true
  controllerUrl: "https://your-neuvector:10443"
```

## 📈 Monitoring & Observability

- **OpenTelemetry**: Automatic instrumentation with OpenLIT
- **Metrics**: Request latency, token usage, GPU utilization
- **Tracing**: End-to-end request tracing across components
- **Dashboards**: Compatible with SUSE Observability

## 🛡️ Security Features

- **Enhanced DLP Demonstrations**:
  - Dual sensitive data transmission (Credit Card: `3412-1234-1234-2222`, SSN: `123-45-6789`)
  - Single-button multi-pattern detection testing
  - Clean popup interface for security demos
- **Network Monitoring**: Availability and connectivity testing
- **NeuVector Integration**: Automated security policy deployment and real-time DLP detection
- **Container Security**: SUSE BCI-based images (SUSE variant)

## 🆘 Support & Documentation

- **Documentation**: [Full documentation](https://github.com/wiredquill/ai-demos)
- **Issues**: [GitHub Issues](https://github.com/wiredquill/ai-demos/issues)
- **Examples**: [Demo scripts and tutorials](https://github.com/wiredquill/ai-demos/tree/main/demo-*.md)

## 🏷️ Version Information

- **Chart Version**: 0.1.144
- **App Version**: 1.0.0
- **Upstream Components**: Latest stable releases
- **Compatibility**: Kubernetes 1.24+, Rancher 2.6+

---

*Built with ❤️ using upstream open-source components for maximum compatibility and flexibility.*
