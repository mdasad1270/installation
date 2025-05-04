# Installation
## 1. Install Helm
```
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```
## 2. Install Kube Prometheus Stack
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add stable https://charts.helm.sh/stable
helm repo update
kubectl create namespace monitoring
helm install kind-prometheus prometheus-community/kube-prometheus-stack --namespace monitoring --set prometheus.service.nodePort=30000 --set prometheus.service.type=NodePort --set grafana.service.nodePort=31000 --set grafana.service.type=NodePort --set alertmanager.service.nodePort=32000 --set alertmanager.service.type=NodePort --set prometheus-node-exporter.service.nodePort=32001 --set prometheus-node-exporter.service.type=NodePort
kubectl get svc -n monitoring
kubectl get namespace
```

## 3. Prometheus Queries
```
sum (rate (container_cpu_usage_seconds_total{namespace="default"}[1m])) / sum (machine_cpu_cores) * 100

sum (container_memory_usage_bytes{namespace="default"}) by (pod)


sum(rate(container_network_receive_bytes_total{namespace="default"}[5m])) by (pod)
sum(rate(container_network_transmit_bytes_total{namespace="default"}[5m])) by (pod)

```
## 4. Connect AKS
```
az aks get-credentials --resource-group jenkins --name my-k8s-cluster
```

## 5. Install and configure SonarQube (Master machine)
```
docker run -itd --name SonarQube-Server -p 9000:9000 sonarqube:lts-community
```
- **Install and Configure ArgoCD (Master Machine)**
  - **Create argocd namespace**
     ```
      kubectl create namespace argocd
     ```
  - **Apply argocd manifest**
     ```
      kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
     ```

  - **Make sure all pods are running in argocd namespace**
     ```
      watch kubectl get pods -n argocd
     ```

  - **Install argocd CLI**
    ```
      sudo curl --silent --location -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/download/v2.4.7/argocd-linux-amd64
    ```

  - **Provide executable permission**
      ```
      sudo chmod +x /usr/local/bin/argocd
      ```

  - **Check argocd services**
      ```
      kubectl get svc -n argocd
      ```

  - **Change argocd server's service from ClusterIP to NodePort**
    ```
      kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "NodePort"}}'
    ```
  - **Confirm service is patched or not**
    ```
      kubectl get svc -n argocd
    ```
