## Introduction

The HR Assistant is an AI-powered application that simulates a comprehensive HR assistant for employees to ask HR-related questions. It demonstrates enterprise-grade LLM integration with comprehensive observability through OpenTelemetry and OpenLit, showcasing how organizations can monitor and trace AI/LLM interactions in production.

## Core Applications

### HR Assistant
The main conversational interface that answers employee questions about company policies, benefits, procedures, and more using an AI language model.

### Employee Handbook
A specialized RAG (Retrieval Augmented Generation) application that indexes HR documents (employee handbook, benefits guide, company policies) into a vector database and retrieves relevant information to answer employee questions with accuracy.

### HR Policy Database
A backend service that provides structured access to HR policies and procedures, supporting the other applications with verified policy information.

## Key Features

- **Intelligent Document Retrieval**: Uses LangChain with Milvus vector database to index and search HR documents
- **Multi-Model Support**: Leverages Ollama for running local LLM models (llama3.2:1b for generation, bge-large for embeddings)
- **Comprehensive Observability**: Full OpenTelemetry instrumentation to monitor and trace all LLM interactions
- **CronJob Automation**: Scheduled testing of all services to ensure continuous availability
- **Production-Ready**: Deployed on Kubernetes with proper health checks and resource management
