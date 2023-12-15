#!/bin/bash

region=<> # The target region that need to scan
target_group_arn=<>    # The ARN of target group from the Load Balancer results.
# Check the health of targets in the specified target group
target_health=$(aws elbv2 describe-target-health --target-group-arn $target_group_arn --query 'TargetHealthDescriptions' --output text --region $region)

if [ -z "$target_health" ]; then
    echo "Target group is empty or not attached to any instances"
else
    echo "Target group is in use"
    echo "Target health details:"
    echo "$target_health"
fi
