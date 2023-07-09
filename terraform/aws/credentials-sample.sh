#!/bin/bash

# create a copy file from this file with name credentials.sh
# and run the script with: 
# chmod +x credentials.sh
# source credentials.sh 
# or 
# ./credentials.sh

export ACCOUNT_ID=$(aws --profile=default sts get-caller-identity --query 'Account' --output text)
export BUCKET_STATES=""
export ACCESS_KEY=$(aws --profile=default configure get aws_access_key_id)
export SECRET_KEY=$(aws --profile=default configure get aws_secret_access_key)