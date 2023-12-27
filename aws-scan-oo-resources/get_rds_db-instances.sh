#!/bin/bash
list_db_instances(){
    aws rds describe-db-instances --query "DBInstances[?DBInstanceStatus=='available'].[DBInstanceIdentifier, DBInstanceStatus]" --output table
}
list_unused_db_instances() {
    aws rds describe-db-instances --query "DBInstances[?DBInstanceStatus!='available'].[DBInstanceIdentifier, DBInstanceStatus]" --output table
}

echo "List DB Instances:"
list_db_instances

echo "List Unused DB Instances:"
list_unused_db_instances