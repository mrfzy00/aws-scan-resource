#!/bin/bash


list_db_snapshots() {
    aws rds describe-db-snapshots --query 'DBSnapshots[*].[DBSnapshotIdentifier,DBInstanceIdentifier,SnapshotCreateTime]' --output table
}

echo "List all snapshots from AWS Resources:"
list_db_snapshots