#bash script to monitor the kubernetes deployment for the swype app.

#variable declarations
NameSpace="sre"
DeploymentName="swype-app"
MaxRestarts=3

#starting the loop and run it indefinetly 

while true; do
    #get the no of restarts
    Restarts=$(kubectl get pods -n ${NameSpace} -l app=${DeploymentName} -o jsonpath="{.items[0].status.containerStatuses[0].restartCount}")

    echo "No of restarts so far is : ${Restarts}"

    #check whether the restarts is greater than max restarts, if so scale down the deployment

    if ((Restarts> MaxRestarts)); then
        {
            echo "Maximum number of restarts exceeded. Scaling down the deployment..."
            kubectl scale --replicas=0 deployment/${DeploymentName} -n ${NameSpace}
            break
        }
    fi
    # next check after 60 seconds
    sleep 60
done