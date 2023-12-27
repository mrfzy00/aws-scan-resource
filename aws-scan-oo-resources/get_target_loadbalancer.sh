#!/bin/bash

list_loadbalancer_resources(){
    aws elbv2 describe-load-balancers --query 'LoadBalancers[*].[LoadBalancerName,LoadBalancerArn,DNSName,Type]' --output json
}

echo "List all loadbalancers:"
list_loadbalancer_resources