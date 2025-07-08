# GitOps Platform: ThriveAI

## 💡 Project Purpose
End to end GitOps deployment using ArgoCD, TLS via Cert-manager, and Cloudflare DNS. 


| Task | What You'll Learn |
|------|-------------------|
| 🔄 Automate cert-manager secrets via Sealed Secrets | Secret management in GitOps |
| 📦 Deploy apps via HelmRelease (with values overrides) | Helm + GitOps pattern |
| 🔐 Integrate ExternalDNS | Dynamic DNS updates (advanced) |
| 🔍 Add Prometheus/Grafana | Observability in GitOps |
| 🚀 Setup CI (e.g., GitHub Actions) | GitOps pipelines |
| 🔐 Rotate Let’s Encrypt certs with alerts | TLS lifecycle management |



## 🌐 Domain Setup
- Domain: thriveai.website
- DNS provider: Cloudflare
- Subdomian: myapp.thriveai.website


## 🧱 Stack Overview
- Kubernetes (EKS)
- ArgoCD
- Kustomize (base + overlays)
- cert-manager + ClusterIssuer
- NGINX Ingress
- Let’s Encrypt (DNS01)

## 🔧 Folder Structure

-  /apps contains the application files for the backend,frontend and cert-manager.
-  /bootstrap contains the root-app yaml file which enables argo-cd to configure the entire repository
-  /envs selects the environment by using the kustomization file to select the directories which will be used by argo-cd

  
## 🐛 Troubleshooting Notes

- `ERR_TOO_MANY_REDIRECTS`: check NGINX + Cloudflare SSL mode.
- Staging certs: check `ClusterIssuer` `server:` field.
- Origin DNS error: check ELB DNS in Cloudflare A record.

## 🔐 Secrets

These are *not* committed to Git. Create manually:
```bash
kubectl -n cert-manager create secret generic cloudflare-api-token-secret \
  --from-literal=mykey=cloudflareapiktoken



