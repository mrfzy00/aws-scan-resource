#!/bin/bash

region=ap-southeast-1
list_loadbalancer_resources(){
    aws elbv2 describe-load-balancers --query 'LoadBalancers[*].[LoadBalancerName,LoadBalancerArn,DNSName,Type]' --output json --region $region 
}

echo "List all loadbalancers:"
list_loadbalancer_resources