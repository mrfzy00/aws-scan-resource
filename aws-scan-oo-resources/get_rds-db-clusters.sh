#!/bin/bash

list_db_clusters (){
    aws rds describe-db-clusters --query "DBClusters[*].[DBClusterIdentifier, Status]" --output table
}

echo "List all DB Clusters:"
list_db_clusters