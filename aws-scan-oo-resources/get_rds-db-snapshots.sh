#!/bin/bash

region=ap-southeast-1
list_db_snapshots() {
    aws rds describe-db-snapshots --query 'DBSnapshots[*].[DBSnapshotIdentifier,DBInstanceIdentifier,SnapshotCreateTime]' --region $region --output json
}

echo "List all snapshots from AWS Resources:"
list_db_snapshots
echo "--------------------------------------"