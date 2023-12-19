#!/bin/bash

region=ap-southeast-1
list_db_clusters (){
    aws rds describe-db-clusters --query "DBClusters[*].[DBClusterIdentifier, Status]" --region $region
}

echo "List all DB Clusters:"
list_db_clusters