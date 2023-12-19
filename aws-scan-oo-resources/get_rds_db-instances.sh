#!/bin/bash

region=ap-southeast-1

list_db_instances(){
    aws rds describe-db-instances --query "DBInstances[?DBInstanceStatus=='available'].[DBInstanceIdentifier, DBInstanceStatus]" --output json --region $region
}
list_unused_db_instances() {
    aws rds describe-db-instances --query "DBInstances[?DBInstanceStatus!='available'].[DBInstanceIdentifier, DBInstanceStatus]" --output json --region $region
}

echo "List DB Instances:"
list_db_instances

echo "List Unused DB Instances:"
list_unused_db_instances