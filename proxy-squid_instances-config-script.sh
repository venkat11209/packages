#!/bin/bash

for i in {3..5} {7..9}
do
                #echo "making directory"
                #sudo mkdir /etc/squid/squid_instance"$i"

                echo "copying squid_instance2 squid file to folder squid_instance$i"
                sudo cp /etc/squid/squid_instance2/squid.conf /etc/squid/squid_instance"$i"/squid.conf
                #echo "copying systemd squid_instance2 service file to next squid_instance$i service file"
                #sudo cp /etc/systemd/system/squid_instance2.service /etc/systemd/system/squid_instance"$i".service

                #echo "changing the name in squid_instance$i service file"
                #find /etc/systemd/system/squid_instance"$i".service -type f -exec sed -i -e "s/Squid_instance_2/Squid_instance_${i}/g" {} \;
                #find /etc/systemd/system/squid_instance"$i".service -type f -exec sed -i -e "s/squid_instance2/squid_instance${i}/g" {} \;

                echo "changing the parameters in squid_instance$i config file"
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/103.166.220.2/103.166.220.${i}/g" {} \;
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/7002/700${i}/g" {} \;
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/instance2/instance${i}/g" {} \;


                #echo "enabling the instance_$i"
                #sudo systemctl enable squid_instance"$i"

                echo "starting the instance_$i"
                sudo systemctl start squid_instance"$i"
                sleep 1
done
for i in {10..26} 28 {30..41} 43 44 47 48 {50..55} 57 58 59 61 {63..73} 75 76 {78..83} {85..92} {95..99}
do
                #echo "making directory"
                #sudo mkdir /etc/squid/squid_instance"$i"

                echo "copying squid_instance2 squid file to folder squid_instance$i"
                sudo cp /etc/squid/squid_instance2/squid.conf /etc/squid/squid_instance"$i"/squid.conf
                #echo "copying systemd squid_instance2 service file to next squid_instance$i service file"
                #sudo cp /etc/systemd/system/squid_instance2.service /etc/systemd/system/squid_instance"$i".service

                #echo "changing the name in squid_instance$i service file"
                #find /etc/systemd/system/squid_instance"$i".service -type f -exec sed -i -e "s/Squid_instance_2/Squid_instance_${i}/g" {} \;
                #find /etc/systemd/system/squid_instance"$i".service -type f -exec sed -i -e "s/squid_instance2/squid_instance${i}/g" {} \;

                echo "changing the parameters in squid_instance$i config file"
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/103.166.220.2/103.166.220.${i}/g" {} \;
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/7002/70${i}/g" {} \;
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/instance2/instance${i}/g" {} \;


                #echo "enabling the instance_$i"
                #sudo systemctl enable squid_instance"$i"

                echo "starting the instance_$i"
                sudo systemctl start squid_instance"$i"
                sleep 1
done
for i in {100..102} {104..116} {118..128}
do
                #echo "making directory"
                #sudo mkdir /etc/squid/squid_instance"$i"

                echo "copying squid_instance2 squid file to folder squid_instance$i"
                sudo cp /etc/squid/squid_instance2/squid.conf /etc/squid/squid_instance"$i"/squid.conf
                #echo "copying systemd squid_instance2 service file to next squid_instance$i service file"
                #sudo cp /etc/systemd/system/squid_instance2.service /etc/systemd/system/squid_instance"$i".service

                #echo "changing the name in squid_instance$i service file"
                #find /etc/systemd/system/squid_instance"$i".service -type f -exec sed -i -e "s/Squid_instance_2/Squid_instance_${i}/g" {} \;
                #find /etc/systemd/system/squid_instance"$i".service -type f -exec sed -i -e "s/squid_instance2/squid_instance${i}/g" {} \;

                echo "changing the parameters in squid_instance$i config file"
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/103.166.220.2/103.166.220.${i}/g" {} \;
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/7002/7${i}/g" {} \;
                find /etc/squid/squid_instance"$i"/squid.conf -type f -exec sed -i -e "s/instance2/instance${i}/g" {} \;


                #echo "enabling the instance_$i"
                #sudo systemctl enable squid_instance"$i"

                echo "starting the instance_$i"
                sudo systemctl start squid_instance"$i"
                sleep 1
done
