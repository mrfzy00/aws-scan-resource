#!/bin/bash

list_target_healths() {
    tg_arns=($(aws elbv2 describe-target-groups --query 'TargetGroups[*].[TargetGroupArn]' --output text))

    if [ ${#tg_arns[@]} -eq 0 ]; then
        echo "No target groups found"
    else
        for tg_arn in "${tg_arns[@]}"; do
            echo "Checking target group $tg_arn"

            target_health=$(aws elbv2 describe-target-health --target-group-arn "$tg_arn" --query 'TargetHealthDescriptions' --output json)

            if [ -z "$target_health" ]; then
                echo "Target group $tg_arn is empty or not attached to any instances"
            else
                echo "Target group $tg_arn in use"
                echo "Target health details"
                echo "$target_health"
            fi
            echo "-----------------------------"
        done
    fi
}

list_target_healths