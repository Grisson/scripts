// 2 * 8

az group create --name PACSG --location westus

acs create --orchestrator-type=kubernetes --resource-group=PACSG --name=k8C1 --generate-ssh-keys --agent-count=2 --agent-vm-size=Standard_DS4_v2  --location westus

acs kubernetes get-credentials --resource-group=PACSG --name=k8C1

kubectl get nodes

acr list --resource-group MediationHub --query "[].{acrLoginServer:loginServer}" --output table


kubectl create -f ./prebidServer.yaml

kubectl get service prebidserver-svc --watch


kubectl scale --replicas=5 deployment/prebidserver-deployment


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


kubectl scale --replicas=5 deployment/prebidserver-deployment