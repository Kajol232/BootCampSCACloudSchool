#Shebang statements
#!/bin/sh

create_vpc () {
echo "input name of network to create"
read network

echo "Choose subnet mode"
echo "auto"
echo "custom"
read subnet

echo "Choose routing mode"
echo "global"
echo "regional"
read route

echo "Choose MTU"
echo "1460"
echo "1500"
read mtu

gcloud compute networks create $network --subnet-mode=$subnet --bgp-routing-mode=$route --mtu=$mtu
}

 

create_subnet () {
echo "input name of thesubnet"
read name

echo "Choose Network"
gcloud compute networks list
read network

gcloud compute regions list
read region

echo "Do you want to enable google access"
echo "on"
echo "off"
read access

echo "input IP range of the subnet in the format 10.0.0.0/0"
read ip

gcoud compute networks subnet create $name --network=$network --range=$ip --region=$region --enable-private-ip-google-access=$access
}

create_server () {
echo "instances name"
read name

echo "Choose subnet"
gcloud compute networks subnets list
read subnet

echo "choose zone"
gcloud compute zones list
read zone
gcloud compute instances create $name --subnet $subnet --zone $zone 
}
create_vpc
create_subnet
create_server
