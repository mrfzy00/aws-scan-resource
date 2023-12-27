#!/bin/bash

list_eks_cluster(){
   clusterName=$(aws eks list-clusters --output text --query "clusters")
   nodegroupName=$(aws eks list-nodegroups --cluster-name $clusterName --query "nodegroups" --output text)

   aws eks describe-cluster --name $clusterName --output json

   if [ ${#nodegroupName[@]} -eq 0 ]; then
        echo "No Nodegroup found"
   else
      for ng_name in ${nodegroupName[@]}; do
         echo "Checking for nodegroup:"
      
         target_ng=$(aws eks describe-nodegroup --cluster-name $clusterName --nodegroup-name $ng_name  --output json) 

         if [ -z "$target_ng" ]; then
            echo "Target Nodegroup $target_ng is empty or not attached to any instances"
         else
            echo "Target Nodegroup $target_ng in use"
      fi
      echo "-----------------------------"
   done

  fi

}
list_eks_cluster