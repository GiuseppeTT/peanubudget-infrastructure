#!/bin/bash

# Instructions
## Remember to run the `azure-login.sh` script first

az ad sp create-for-rbac \
    --name peanubudget-terraform-cloud \
    --role Owner \
    --scopes /subscriptions/${SUBSCRIPTION_ID}
