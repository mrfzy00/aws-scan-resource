#!/bin/bash

while IFS= read -r tg_arn; do
    echo "Target Group ARN: $tg_arn"

    # Check the health of targets in the specified target group
    target_health=$(aws elbv2 describe-target-health --target-group-arn "$tg_arn" --query 'TargetHealthDescriptions' --output json)

    if [ -z "$target_health" ]; then
        echo "Target group is empty or not attached to any instances"
    else
        echo "Target group is in use"
        echo "Target health details:"
        echo "$target_health"
    fi

    echo "----------------------"
done < target_group_arns.txt

