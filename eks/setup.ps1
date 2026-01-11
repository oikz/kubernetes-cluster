aws login
terraform init
terraform apply --auto-approve
aws eks --region ap-southeast-2 update-kubeconfig --name eks-cluster 

helm upgrade --install karpenter oci://public.ecr.aws/karpenter/karpenter --namespace kube-system --values ../apps/helm/karpenter/values.yaml --create-namespace --version 1.8.3 --wait
kubectl apply -f ../apps/svc/karpenter/karpenter.yaml

helm upgrade --install argocd argo/argo-cd --namespace argocd --values ../apps/helm/argocd/values.yaml --create-namespace --version 9.2.3 --wait
kubectl apply -f ../all-apps.yaml