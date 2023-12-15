#!/bin/bash

while IFS= read -r lb_arn; do
#    echo "Load Balancer ARN: $lb_arn"
    aws elbv2 describe-target-groups --load-balancer-arn $lb_arn --query 'TargetGroups[*].[TargetGroupArn]' --output text --region ap-southeast-1
#    echo "----------------------"
done < load_balancers_arns.txt

