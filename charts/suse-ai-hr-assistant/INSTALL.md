# Installation Guide - SUSE AI HR Assistant Demo

## Prerequisites

1. **Kubernetes Cluster** with SUSE Observability installed
2. **GPU Support** (optional but recommended for full demo value)
3. **Helm 3.x** installed
4. **SUSE Application Collection** access

## Quick Installation

### 1. Add the Chart Repository
```bash
helm repo add suse-ai-greendocs https://your-org.github.io/suse-ai-greendocs
helm repo update
```

### 2. Install with Default Settings
```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant
```

### 3. Install with GPU Support (Recommended)
```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant \
  --set ollama.gpu.enabled=true \
  --set collectGpuStats=true
```

## Custom Configuration

### Configure Endpoints
```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant \
  --set otlpEndpoint="http://your-otel-collector:4318" \
  --set ollamaEndpoint="http://your-ollama:11434"
```

### Adjust Resource Limits
```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant \
  --set resources.requests.memory="1Gi" \
  --set resources.limits.memory="2Gi" \
  --set ollama.resources.requests.memory="4Gi"
```

### Modify Demo Traffic Schedule
```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant \
  --set schedule="*/10 * * * *"  # Every 10 minutes
```

## Verification

### Check Pod Status
```bash
kubectl get pods -l app.kubernetes.io/name=suse-ai-hr-assistant
```

### View Generated Traffic
```bash
kubectl logs -l app.component=hr-assistant -f
```

### Check CronJob Status
```bash
kubectl get cronjobs
kubectl get jobs
```

## Accessing the Demo

### Port Forward to Applications
```bash
# HR Assistant
kubectl port-forward svc/hr-assistant-hr-assistant 8080:8000

# HR Policy Database  
kubectl port-forward svc/hr-assistant-hr-policy-db 8081:8000

# Employee Handbook
kubectl port-forward svc/hr-assistant-employee-handbook 8082:8000
```

### Test Endpoints
```bash
# Test HR Assistant
curl http://localhost:8080/ask

# Test HR Policy Database
curl http://localhost:8081/ask

# Test Employee Handbook
curl http://localhost:8082/ask
```

## Troubleshooting

### Common Issues

1. **Pods stuck in Pending**: Check resource requests and node capacity
   ```bash
   kubectl describe pod <pod-name>
   ```

2. **Image pull errors**: Verify `imagePullSecrets` configuration
   ```bash
   kubectl get secrets
   ```

3. **GPU not detected**: Ensure GPU operator is installed and nodes are labeled
   ```bash
   kubectl get nodes -l nvidia.com/gpu.present=true
   ```

4. **Ollama models not loading**: Check persistent volume claims and model download
   ```bash
   kubectl logs -l app.kubernetes.io/name=ollama
   ```

### Logs and Debugging

```bash
# View all HR Assistant logs
kubectl logs -l app.kubernetes.io/name=suse-ai-hr-assistant

# Check Ollama status
kubectl logs -l app.kubernetes.io/name=ollama

# View CronJob logs
kubectl logs job/<job-name>
```

## Uninstallation

```bash
helm uninstall hr-assistant
```

## Advanced Configuration

Create a custom `values.yaml` file:

```yaml
# custom-values.yaml
ollama:
  gpu:
    enabled: true
    number: 2
  models:
    - llama3.2:latest
    - mistral:7b
    - bge-large:latest

resources:
  requests:
    memory: '2Gi'
    cpu: '1000m'
  limits:
    memory: '4Gi'
    cpu: '2000m'

schedule: '*/3 * * * *'  # Every 3 minutes
collectGpuStats: true

# Custom OTLP endpoint
otlpEndpoint: 'http://custom-otel-collector.monitoring.svc.cluster.local:4318'
```

Install with custom values:
```bash
helm install hr-assistant suse-ai-greendocs/suse-ai-hr-assistant -f custom-values.yaml
```