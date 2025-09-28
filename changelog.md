## Branch Naming Note
Initial branches (`MM-1`, `MM-2`, `MM-3`) reflect the original setup phase.  
From this point forward, we adopt semantic branch naming (`feature/`, `bugfix/`, `chore/`) for clarity.
## [chore/readme] - 28/09/2025
- Updated readme to reflect current repo and added a diagram for the workflow

## [chore/githubactions] - 16/09/2025
- Standardized GitHub Actions pipeline for frontend and backend
  - Build Docker image tagged with commit SHA.
  - Inject commit SHA into frontend HTML automatically.
  - Scan Docker image locally with Trivy for vulnerabilities.
  - Static code analysis with SonarCloud (branch-aware, main branch coverage).
  - Push image to immutable ECR repository.
  - Patch  Kustomize overlays with new image tag automatically.
  - Commit changes to a CI bump branch.

- Backend pipeline scaffold created (image build + Kustomize patch).

- Updated GitHub Actions to use environment variables for tags to reduce duplication and improve readability.

- Secured secrets usage in CI/CD (AWS credentials, Sonar token).


## [feature/prometheus-grafana] - 11/09/2025
- Prometheus deployed via helm chart, similar set-up to grafana for now

## [feature/prometheus-grafana] - 09/09/2025
- Grafana deployed via Helm chart through ArgoCD App of Apps pattern.

- Initially used inline Helm values in the Application spec (Ingress + secret wiring worked).

- Switched to file-based overrides (values.yaml) → ArgoCD rendered defaults (Ingress missing, admin secret ignored).

- Root cause: ArgoCD’s single-source Helm integration cannot load values from our Git repo if the chart comes from an external Helm repo.

- Fix: adopted ArgoCD multiple sources:
    Source A → external Grafana Helm chart.
    Source B → our Git repo with values.yaml (referenced via $grafana-values/...).

- This approach makes values Git-managed, reusable across environments, and upgrade-friendly (separates vendor chart from our overrides).

- Verified via helm template, ArgoCD manifest view, and cluster resources (kubectl get ing, deploy, svc -n monitoring).

## [MM-3] 
- Added GitHub Actions pipeline for build → ECR → Kustomize patch
- Fixed ingress redirect loop
- Added workflow_dispatch for manual runs
- Added changelog.md

## [MM-2] 
- Bootstrapped ingress + cert-manager
- Nginx-controller installed using set-up script
- Set-up to work with CloudFlare  host
- Added readme

## [MM-1] 
- Provisioned EKS infra via Terraform
- Integrated ArgoCD App of Apps pattern
- Deployed frontend + backend apps via overlays
