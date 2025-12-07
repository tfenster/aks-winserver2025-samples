az extension add --name aks-preview
az extension update --name aks-preview

az feature register --namespace "Microsoft.ContainerService" --name "AksWindows2025Preview"
az feature show --namespace Microsoft.ContainerService --name AksWindows2025Preview
az provider register --namespace Microsoft.ContainerService

$name = "akswin2025"
$region = "germanywestcentral"
$vmSize = "Standard_B4ls_v2"
az group create --name $name --location $region
az aks create -g $name -n $name --node-count 1 -s $vmSize --tier free --network-plugin azure --enable-app-routing --no-ssh-key --vm-set-type VirtualMachineScaleSets --network-plugin azure
az aks nodepool add --resource-group $name --cluster-name $name --os-type Windows --os-sku Windows2025 --name npwin --node-count 1 --ssh-access disabled --enable-fips-image
az aks get-credentials --resource-group $name --name $name --overwrite-existing

kubectl get nodes -o wide
