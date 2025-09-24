# SUSE AI Helm Charts Repository

Enterprise-ready AI applications with comprehensive observability and security.

## Available Charts

### 🏢 SUSE AI HR Assistant
**Chart:** `suse-ai-hr-assistant`
**Description:** Comprehensive LLM observability demo with OpenLit and SUSE AI stack.

```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant
```

### 🔄 SUSE AI Compare (Upstream)
**Chart:** `suse-ai-compare`
**Description:** Enterprise AI response comparison platform with comprehensive observability.

```bash
helm install ai-compare suse-ai-greendocs/suse-ai-compare
```

### 🟢 SUSE AI Compare SUSE Edition
**Chart:** `suse-ai-compare-suse`
**Description:** Enterprise-hardened version with SUSE BCI containers and NeuVector security.

```bash
helm install ai-compare-suse suse-ai-greendocs/suse-ai-compare-suse
```

### 📊 SUSE AI Compare OpenTelemetry Edition
**Chart:** `suse-ai-compare-opentelemetry`
**Description:** Advanced GenAI observability with token tracking, cost analysis, and performance monitoring.

```bash
helm install ai-compare-otel suse-ai-greendocs/suse-ai-compare-opentelemetry
```

## Repository Setup

```bash
helm repo add suse-ai-greendocs https://your-org.github.io/suse-ai-greendocs
helm repo update
```

## Chart Features

### Common Features
- **GPU Support:** NVIDIA GPU acceleration
- **Load Simulation:** HTTP traffic generation for observability
- **Security Integration:** NeuVector DLP demonstrations
- **Enterprise Images:** SUSE BCI (Base Container Images)

### AI Compare Specific Features
- **Multi-LLM Comparison:** Side-by-side response comparison
- **Ollama Integration:** Local LLM serving
- **Open WebUI:** Web interface with pipeline support
- **Observability:** SUSE Observability and OpenTelemetry integration

### Edition Differences

| Feature | Upstream | SUSE Edition | OpenTelemetry |
|---------|----------|--------------|---------------|
| Load Simulator Default | OFF | OFF | ON |
| NeuVector Security | Optional | Default ON | Optional |
| OTLP Endpoint | ❌ | ❌ | ✅ |
| Advanced Observability | ❌ | ❌ | ✅ (Always On) |
| GPU Statistics | ❌ | ❌ | ✅ |

## Deployment Examples

### Quick Start (Basic)
```bash
helm install ai-compare suse-ai-greendocs/suse-ai-compare
```

### Enterprise with Security (SUSE Edition)
```bash
helm install ai-compare-suse suse-ai-greendocs/suse-ai-compare-suse \
  --set neuvector.enabled=true \
  --set ollama.gpu.enabled=true
```

### Full Observability (OpenTelemetry Edition)
```bash
helm install ai-compare-otel suse-ai-greendocs/suse-ai-compare-opentelemetry \
  --set otlpEndpoint="http://your-otel-collector:4318" \
  --set collectGpuStats="true"
```

## Chart Development

Charts are automatically released when `Chart.yaml` versions are updated on the `charts-for-ai-demo-apps` or `main` branches.

Manual releases can be triggered via GitHub Actions workflow dispatch.