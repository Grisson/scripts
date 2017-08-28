// 2 * 8

az group create --name PACSG --location westus

acs create --orchestrator-type=kubernetes --resource-group=PACSG --name=k8C1 --generate-ssh-keys --agent-count=2 --agent-vm-size=Standard_DS4_v2  --location westus

sudo az acs kubernetes install-cli

acs kubernetes get-credentials --resource-group=PACSG --name=k8C1
//This command downloads the cluster credentials to $HOME/.kube/config, where kubectl expects it to be located.


kubectl get nodes
kubectl describe pods


acr list --resource-group MediationHub --query "[].{acrLoginServer:loginServer}" --output table


kubectl create -f ./prebidServer.yaml

kubectl get service prebidserver-svc --watch
kubectl describe services/kprebidserver-svc


kubectl scale --replicas=64 deploy/prebidserver-deployment
kubectl set image deployments/prebidserver-deployment  prebidserver-deployment= 
kubectl rollout status deployments/prebidserver-deployment
kubectl rollout undeo deployments/prebidserver-deployment


//
// 16 * 1 
//


az group create --name PACSG2 --location westus

acs create --orchestrator-type=kubernetes --resource-group=PACSG2 --name=k8C2 --generate-ssh-keys --agent-count=16 --agent-vm-size=Standard_DS1_v2  --location westus

acs kubernetes get-credentials --resource-group=PACSG2 --name=k8C2

kubectl get nodes

acr list --resource-group MediationHub --query "[].{acrLoginServer:loginServer}" --output table


kubectl create -f ./prebidServer.yaml

kubectl get service prebidserver-svc --watch


kubectl scale --replicas=64 deploy/prebidserver-deployment