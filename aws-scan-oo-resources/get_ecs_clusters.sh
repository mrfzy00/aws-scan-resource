#!/bin/bash

list_ecs_clusters() {
    # Get a list of all clusters
    clusters=$(aws ecs list-clusters --output json --query 'clusterArns')

    # Check if the list is not empty
    if [ ${#clusters} -ne 0 ]; then
        # Loop through each cluster
        for cluster in $(echo "${clusters}" | jq -r '.[]'); do
            # Get the status as an array
            status_array=($(aws ecs describe-clusters --clusters $cluster --output json --query 'clusters[*].[status]' | jq -r '.[]'))
            clusterName=$(aws ecs describe-clusters --clusters $cluster --output table --query 'clusters[*].[clusterName]')
        
            # Check if any element in the array contains "ACTIVE"
            if [[ " ${status_array[@]} " =~ "ACTIVE" ]]; then
                echo "Cluster name: $clusterName"
                echo "The cluster $cluster is active."

                # You can add more checks or actions here if needed

            else
                echo "The cluster $cluster is in status: ${status_array[@]}. It might be unused."

                # You can take actions like deleting unused clusters if required
            fi
        done
    else
        echo "No clusters found."
    fi
}
echo "List of Clusters:"
list_ecs_clusters
echo "-----------------"