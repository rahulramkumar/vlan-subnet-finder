#!/bin/bash
echo "SSH Pass?"
read -s -e password
echo "UNID?"
read -e username
#echo "VLAN number to find Subnet for?"
#read -e vlan
echo -ne '\n'
echo "Which router? (This only works with routers)"
read -e hostname
for vlan in `cat vlan-list.txt`; do
./subnet_test.exp $hostname $username $password $vlan > subnet_output_temp.txt;
ip=$(cat subnet_output_temp.txt | grep -oE "[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}/[0-9]{2}");
echo -ne "VLAN $vlan\n$ip\n\n" >> subnet_list.txt;
done
echo "Done. Results may be found in subnet_list.txt."
