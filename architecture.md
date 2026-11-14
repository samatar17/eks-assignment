# AWS EKS DevOps Architecture

## Infrastructure | CI/CD | Security | Monitoring

```mermaid
flowchart TB

    DEV["Developer / VS Code"]
    GIT["GitHub Repository"]

    subgraph CICD["CI/CD PIPELINE - GITHUB ACTIONS"]
        direction LR
        BUILD["1. Build"]
        TEST["2. Test"]
        TRIVY["3. Trivy Scan"]
        CHECKOV["4. Checkov Scan"]
        DEPLOY["5. Deploy"]
        BUILD --> TEST --> TRIVY --> CHECKOV --> DEPLOY
    end

    TF["Terraform Infrastructure as Code"]

    subgraph AWS["AWS CLOUD - TERRAFORM INFRASTRUCTURE"]
        direction TB

        R53["Route 53 DNS"]

        subgraph VPC["AWS VPC"]
            direction TB
            PUBLIC["Public Subnets"]
            PRIVATE["Private Subnets"]
            LB["AWS Load Balancer"]

            subgraph EKS["AMAZON EKS - KUBERNETES"]
                direction TB
                NGINX["NGINX Ingress"]
                SVC["Kubernetes Service"]
                APP["Application Pods"]
                CERT["cert-manager"]
                DNS["ExternalDNS"]

                NGINX --> SVC --> APP
                CERT -. "Let's Encrypt TLS" .-> NGINX
            end

            PUBLIC --> LB
            LB --> NGINX
            PRIVATE -.-> APP
        end

        DNS -. "DNS automation" .-> R53
    end

    USER["Application Users"]
    HTTPS["HTTPS / Let's Encrypt"]

    subgraph MONITOR["MONITORING - PROMETHEUS & GRAFANA"]
        direction LR
        METRICS["Cluster & App Metrics"]
        PROM["Prometheus"]
        GRAF["Grafana Dashboards"]
        ALERT["Alerts"]
        METRICS --> PROM
        PROM --> GRAF
        PROM --> ALERT
    end

    DEV --> GIT
    GIT --> BUILD
    DEV --> TF
    TF --> VPC
    TF --> EKS
    DEPLOY -. "Deployment workflow" .-> EKS

    USER --> R53
    R53 --> HTTPS
    HTTPS --> LB

    APP -. "Monitoring integration" .-> METRICS

    classDef developer fill:#2563eb,stroke:#1d4ed8,color:#ffffff
    classDef pipeline fill:#7c3aed,stroke:#5b21b6,color:#ffffff
    classDef security fill:#dc2626,stroke:#991b1b,color:#ffffff
    classDef infrastructure fill:#ea580c,stroke:#c2410c,color:#ffffff
    classDef networking fill:#16a34a,stroke:#166534,color:#ffffff
    classDef kubernetes fill:#0891b2,stroke:#155e75,color:#ffffff
    classDef monitoring fill:#0f766e,stroke:#115e59,color:#ffffff

    class DEV,GIT,USER developer
    class BUILD,TEST,DEPLOY pipeline
    class TRIVY,CHECKOV security
    class TF infrastructure
    class R53,PUBLIC,PRIVATE,LB,HTTPS,DNS networking
    class NGINX,SVC,APP,CERT kubernetes
    class METRICS,PROM,GRAF,ALERT monitoring

    style CICD fill:#312e81,stroke:#a78bfa,color:#ffffff
    style AWS fill:#172554,stroke:#60a5fa,color:#ffffff
    style VPC fill:#1e293b,stroke:#f59e0b,color:#ffffff
    style EKS fill:#164e63,stroke:#22d3ee,color:#ffffff
    style MONITOR fill:#134e4a,stroke:#2dd4bf,color:#ffffff
```

## Architecture Overview

### 1. CI/CD Pipeline
GitHub Actions is used for CI automation and security scanning. The architecture shows the target workflow: Build, Test, Trivy, Checkov and Deploy.

### 2. AWS Infrastructure
Terraform defines the AWS VPC, public and private subnets, networking resources and Amazon EKS infrastructure.

### 3. Kubernetes
Amazon EKS hosts the Kubernetes environment, including NGINX Ingress, Kubernetes Services and application pods.

### 4. DNS and HTTPS
Route 53 and ExternalDNS support DNS management. cert-manager integrates with Let's Encrypt for TLS certificate management.

### 5. Security
Trivy performs vulnerability scanning, while Checkov checks Terraform infrastructure configuration for security issues.

### 6. Monitoring Architecture
The diagram illustrates a Prometheus and Grafana monitoring design for application and cluster metrics, dashboards and alerting.