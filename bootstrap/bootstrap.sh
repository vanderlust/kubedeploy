export MASTER_IP=165.227.160.117 && \
export AGENT_IP=46.101.102.18

k3sup --k3s-extra-args '--cluster-init —disable traefik'  install  --ip $MASTER_IP --user root 

cp /Users/michael/devel/kubedeploy/do_prov/node-01/kubeconfig /Users/michael/.kube/config

# Disable Traefik

ssh root@$MASTER_IP << EOF
  rm -rf /var/lib/rancher/k3s/server/manifests/traefik.yaml; 
  systemctl restart k3s
EOF

helm uninstall traefik traefik-crd -n kube-system

kubectl get node
kubectl version --output=yaml
kubectl cluster-info
kubectl get node

echo "Installing cert-manager..."

helm repo add jetstack https://charts.jetstack.io --force-update
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.15.0/cert-manager.crds.yaml
kubectl get crds | grep cert-manager.io


helm install \
  cert-manager jetstack/cert-manager \
  --namespace cert-manager \
  --create-namespace \
  --version v1.15.0

echo "Installing ArgoCD..."
# Install ArgoCD With Helm
kubectl create namespace argocd 
helm repo add argo https://argoproj.github.io/argo-helm 
helm install argocd argo/argo-cd --namespace argocd
# Patch ArgoCD-server to accept http, avoiding https redirect loop
kubectl patch configmap -n argocd  argocd-cmd-params-cm -p '{"data":{"server.insecure":"true"}}' 
kubectl rollout restart -n argocd deployment argocd-server 
# Update Argocd admin password
apt-get -y install apache2-utils 
kubectl -n argocd patch secret argocd-secret -p '{"stringData": {"admin.password": "'$(htpasswd -bnBC 10 "" $ARGOCD_PASSWORD | tr -d ':\n' | sed 's/$2y/$2a/')'", "admin.passwordMtime": "'$(date +%FT%T%Z)'"}}'
