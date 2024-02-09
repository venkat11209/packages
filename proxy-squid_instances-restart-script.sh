#!/bin/bash

for i in {2..5} {7..9} {10..26} 28 {30..41} 43 44 47 48 {50..55} 57 58 59 61 {63..73} 75 76 {78..83} {85..92} {95..99} {100..102} {104..116} {118..128}
do
        echo "starting the instance_$i"
        sudo systemctl restart squid_instance"$i".service
        sleep 2
done
