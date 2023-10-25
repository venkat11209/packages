##Digitalocean agent installation:
curl -sSL https://repos.insights.digitalocean.com/install.sh | sudo bash

##sudo nano /etc/apt/sources.list.d/digitalocean-agent.list
##Ensure Inside the digitalocean-agent.list file,the following line available:
#deb https://repos.insights.digitalocean.com/apt/do-agent/ main main

curl https://repos.insights.digitalocean.com/sonar-agent.asc | sudo apt-key add -

sudo apt-get update

sudo apt-get install do-agent

##verify the agent is running:
ps aux | grep do-agent
