# Kubernetes Cluster

GitOps repository for an Oracle OKE cluster managed by ArgoCD.

## General Info
- Runs on Oracle Kubernetes Engine
  - Full Terraform setup using Oracle OKE module
  - Runs 2 ARM-based VM.Standard.A1.Flex worker nodes with 1vCPU and 6GB of memory (within the OCI free tier)
- Utilises ArgoCD for all deployed resources
  - Auto bootstrap with one `kubectl apply` of the `all-apps.yaml` file
- Uses Traefik for Reverse Proxy
  - Managed Network Load Balancer for ingress
- `*.oikz.dev` DNS managed by external-dns pointing to the NLB
- CloudNativePG provides in-cluster postgres containers
- Hosts GitHub Actions self-hosted runners (.github/workflows/terraform-apply.yaml uses this)
- Utilised New Relic for monitoring/observability using `nri-bundle` chart
  - Automatically injects .NET APM agent into `website` namespace for .NET monitoring
  - `postgres` monitoring integration
- Hosts Stringdicator Discord bot 
  - Utilises in-cluster `postgres` database
- Hosts Website (templated .NET API) 
  - Utilises in-cluster `postgres` database
  - Full New Relic monitoring integrations
  - Utilises Kustomize for templating to support prod/test environments
  - Horizontal Pod Autoscaler set up to autoscale deployment based on CPU usage
- Automatic Terraform deployments using GitHub Actions
