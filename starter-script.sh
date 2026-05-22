#!/bin/bash


# Login to Azure (if not already logged in)
# az account show 1> /dev/null || az login   Already logged in on local environment

rg=tf-state-rg
sa=tfstatestore2024
container=apimstatecontainer

# Resource group
az group create --name $rg --location uksouth --tags 'Project=Terraform' 'Env=State'

# account
az storage account create --resource-group $rg --name $sa --sku Standard_LRS --encryption-services blob

# container
az storage container create --name $container --account-name $sa