## Branch Naming Note
Initial branches (`MM-1`, `MM-2`, `MM-3`) reflect the original setup phase.  
From this point forward, we adopt semantic branch naming (`feature/`, `bugfix/`, `chore/`) for clarity.

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
