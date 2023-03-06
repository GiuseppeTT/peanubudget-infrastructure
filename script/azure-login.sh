#!/bin/bash

az login

export SUBSCRIPTION_ID=$(az account show --query id -o tsv)
