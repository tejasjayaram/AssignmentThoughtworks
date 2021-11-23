# AssignmentThoughtworks
https://docs.google.com/document/d/15uvNxWgnQkN3a5S8fX2CQouvR8huTmuR2ljfXwjRqSE/edit?usp=sharing

Steps to install Jenkins
Login to VM where you want to install Jenkins

Run the following
sudo apt update
sudo apt install default-jdk

wget -q -O - https://pkg.jenkins.io/debian/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'


sudo apt update
sudo apt install jenkins

sudo systemctl enable --now jenkins


To access jenkins from local system, you have to edit the Firewall rule details
--> add the systems IP from where you want to access Jenkins console in "Source IPv4 ranges"

Jenkins will be running at externalipOfVM:8080


add admin password during first login
Copy password from "sudo cat /var/lib/jenkins/secrets/initialAdminPassword"

Install suggested plugins 
create admin user and continue




