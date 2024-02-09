#Firewall for instances
#!/bin/bash

sudo ufw disable
sudo ufw reset
sudo ufw allow 5456

for i in {2..5} {7..9}
do
        echo "allowing firewall 700$i"
        #ufw allow 700$i
                ufw allow from 103.170.86.7 to any port 700$i
                ufw allow from 103.170.86.68 to any port 700$i
                ufw allow from 103.170.86.69 to any port 700$i
                ufw allow from 103.170.86.21 to any port 700$i
                ufw allow from 103.78.16.34 to any port 700$i
                ufw allow from 103.170.86.83 to any port 700$i
                ufw allow from 103.170.86.99 to nay port 700$i
                sleep 1
done

for i in {10..26} 28 {30..41} 43 44 47 48 {50..55} 57 58 59 61 {63..73} 75 76 {78..83} {85..92} {95..99}
do
        echo "allowing firewall 70$i"
        #ufw allow 70$i
        ufw allow from 103.170.86.7 to any port 70$i
                ufw allow from 103.170.86.68 to any port 70$i
                ufw allow from 103.170.86.69 to any port 70$i
                ufw allow from 103.170.86.21 to any port 70$i
                ufw allow from 103.78.16.34 to any port 70$i
                ufw allow from 103.170.86.83 to any port 70$i
                ufw allow from 103.170.86.99 to nay port 70$i
                sleep 1
done

for i in {100..102} {104..116} {118..128}
do
        echo "allowng firewall 7$i"
        #ufw allow 7$i
                ufw allow from 103.170.86.7 to any port 7$i
                ufw allow from 103.170.86.68 to any port 7$i
                ufw allow from 103.170.86.69 to any port 7$i
                ufw allow from 103.170.86.21 to any port 7$i
                ufw allow from 103.78.16.34 to any port 7$i
                ufw allow from 103.170.86.83 to any port 7$i
                ufw allow from 103.170.86.99 to nay port 7$i
                sleep 1
done

sudo ufw enable
