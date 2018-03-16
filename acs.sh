// 2 * 8

az group create --name PACSG --location westus

acs create --orchestrator-type=kubernetes --resource-group=PACSG --name=k8C1 --generate-ssh-keys --agent-count=2 \
    --agent-vm-size=Standard_DS4_v2 --ssh-key-value ~/.ssh/mediation.int.id_rsa.pub --location westus

sudo az acs kubernetes install-cli

acs kubernetes get-credentials --resource-group=PACSG --name=k8C1
//This command downloads the cluster credentials to $HOME/.kube/config, where kubectl expects it to be located.
acs kubernetes get-credentials --resource-group Mediation-Int --name Mediation-Int --ssh-key-file /Users/grisson/.ssh/mediation.int.id_rsa

kubectl get nodes
kubectl describe pods


acr list --resource-group MediationHub --query "[].{acrLoginServer:loginServer}" --output table


kubectl create -f ./prebidServer.yaml

kubectl get service prebidserver-svc --watch
kubectl describe services/kprebidserver-svc


kubectl scale --replicas=64 deploy/prebidserver-deployment
az acs scale -g myResourceGroup -n containerservice-myACSName --new-agent-count 10


kubectl set image deployments/prebidserver-deployment  prebidserver-deployment= 
kubectl rollout status deployments/prebidserver-deployment
kubectl rollout undo deployments/prebidserver-deployment


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

// to check dns service. https://github.com/kubernetes/kubernetes/blob/master/cluster/addons/dns/README.md#how-do-i-configure-it
kubectl get services kube-dns --namespace=kube-system


kubectl create secret generic <name> --from-file=<path> --from-file=<path>
kubectl get secrets
kubectl get secret <name> -o yaml

// yaml to create secret
apiVersion: v1
kind: Secret
metadata:
  name: mysecret
type: Opaque
data:
  username: YWRtaW4=
  password: MWYyZDFlMmU2N2Rm


// yaml to use secret 
apiVersion: v1
kind: Pod
metadata:
  name: secret-env-pod
spec:
  containers:
    - name: mycontainer
      image: redis
      env:
        - name: SECRET_USERNAME
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: username
        - name: SECRET_PASSWORD
          valueFrom:
            secretKeyRef:
              name: mysecret
              key: password
  restartPolicy: Never

kubectl get pods/podname -o yaml,  you can see the spec.serviceAccountName field has 
  serviceAccountName: default





// Add new data center
docker run --rm -it -v ${HOME}:/root microsoft/azure-cli
docker run --rm -it -v ${HOME}:/root azuresdk/azure-cli-python

az account set --subscription NativeAds-INT

az group create 

  acs create --orchestrator-type=kubernetes --resource-group=M-PPE-WUS --name=M-PPE-WUS \
    --ssh-key-value ~/.ssh/mediation.ppe.id_rsa.pub --location westus \
    --master-count=3 --master-vm-size=Standard_D2_v2 \
    --agent-count=16 --agent-vm-size=Standard_DS3_v2

Standard_D4s_v3   -- Dsv3
Standard_DS3_v2
Standard_D3_v2
20180125073000

acs kubernetes get-credentials --resource-group=Mediation-PPE-DB --name=Mediation-PPE-DB --ssh-key-value ~/.ssh/mediation.ppe.id_rsa



kubectl autoscale deployment mediation-deployment --min=1 --max=20 --cpu-percent=10