10383* kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1
10384* kubectl get deployments
10385* kubectl proxy
10387* export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')\necho Name of the Pod: $POD_NAME
10389* kubectl get pods
10390* kubectl describe pods
10391* kubectl logs "$POD_NAME"
10392* kubectl exec "$POD_NAME" -- env
10393* kubectl exec -ti $POD_NAME -- bash
10394* kubectl get pods
10395* kubectl get services
10396* kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080\n\n
10397* kubectl get services
10398  kubectl describe services/kubernetes-bootcamp\n\n
10399  export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')"\necho "NODE_PORT=$NODE_PORT"
10407  kubectl cluster-info --context kind-test
10408  kubectl cluster-info dump
10409  kubectl get nodes
10410  kubectl get nodes -o wide
10413  kubectl get pods -o wide
10414  kubectl get pods -o wide --show-labels
10419  kubectl describe deployment
10420  kubectl get services -l app=kubernetes-bootcamp
10421  export POD_NAME="$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')"\necho "Name of the Pod: $POD_NAME"
10422  kubectl label pods "$POD_NAME" version=v1
10423  kubectl describe pods "$POD_NAME"
10424  kubectl get pods -l version=v1
10425  kubectl delete service -l app=kubernetes-bootcamp
10426  kubectl get services
10427  kubectl exec -ti $POD_NAME -- curl http://localhost:8080
10428  kubectl expose deployment/kubernetes-bootcamp --type="LoadBalancer" --port 8080
10429  kubectl get services
10430  kubectl get deployments
10431  kubectl get rs
10432  kubectl scale deployments/kubernetes-bootcamp --replicas=4
10433  kubectl get rs
10434  kubectl get deployments
10435  kubectl get pods -o wide
10436  kubectl describe services/kubernetes-bootcamp
10437  export NODE_PORT="$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')"
kubectl apply --server-side -f \
  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/release-1.24/releases/cnpg-1.24.1.yaml
10459  kubectl get deployment -n cnpg-system cnpg-controller-manager\n
10460  kubectl apply -f cluster-example.yaml
10461  kubectl get pods\n
10466  kubectl get pods\n
10467  kubectl get crds
10468  kubectl get svc
10469  kubectl get pods\n
10470  kubectl apply -f - <<EOF\n---\napiVersion: postgresql.cnpg.io/v1\nkind: Cluster\nmetadata:\n  name: cluster-with-metrics\nspec:\n  instances: 3\n\n  storage:\n    size: 1Gi\n\n  monitoring:\n    enablePodMonitor: true\nEOF
10471  kubectl get pods\n
10472  kubectl port-forward svc/prometheus-community-kube-prometheus 9090
10473  kubectl apply -f \\n  https://raw.githubusercontent.com/cloudnative-pg/cloudnative-pg/main/docs/src/samples/monitoring/prometheusrule.yaml
10474  kubectl get prometheusrules
10475  kubectl port-forward svc/prometheus-community-kube-prometheus 9090
10476  kubectl get pods\n
10477  kubectl port-forward svc/prometheus-community-grafana 3000:80
10478  kubectl get pods\n
10480  kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.30/deploy/local-path-storage.yaml
10481  kubectl get pods\n
10482  kubectl -n local-path-storage get pod
10483  kubectl -n local-path-storage logs -f -l app=local-path-provisioner
10484  kubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pvc/pvc.yaml\nkubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pod/pod.yaml
10485  kubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pod/pod.yaml
10486  kubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pvc/pvc.yaml
10487  kubectl -n local-path-storage get pod
10488  kubectl get pods\n
10489  kubectl get pv
10490  kubectl get pvc
10491  kubectl exec volume-test -- sh -c "echo local-path-test > /data/test"
10492  kubectl delete -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pod/pod.yaml
10493  kubectl create -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pod/pod.yaml
10494  kubectl delete -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pod/pod.yaml\nkubectl delete -f https://raw.githubusercontent.com/rancher/local-path-provisioner/master/examples/pvc/pvc.yaml
10495  kubectl get pods\n
10496  kubectl get nodes\n
10497  kubectl port-forward svc/prometheus-community-grafana 3000:80

# Cluster information
$ kubectl cluster-info
$ kubectl get nodes -o wide

# Check runnint Services
$ kubectl get services -o wide --all-namespaces

# Check running Ingress
$ kubectl get ingresses --all-namespaces

# Display all the running Pod
$ kubectl get pods -A -o wide

# Get logs for an specific Pod
$ kubectl logs -f <your_pod> -n <your_pod_namespace>

# Get information about an specific Pod
$ kubectl describe pod <your_pod> -n <your_pod_namespace>

kubectl create namespace argocd
kubectl config set-context --current --namespace=argocd
kubectl apply -n argocd -f ./argocd-install.yaml

install cloudbeaver on k8s