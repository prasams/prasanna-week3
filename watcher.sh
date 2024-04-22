#bash script to monitor the kubernetes deployment for the swype app.

#variable declarations
NameSpace="sre"
DeploymentName ="swype-app"
MaxRestarts = 3

#starting the loop and run it indefinetly 

while true; do
