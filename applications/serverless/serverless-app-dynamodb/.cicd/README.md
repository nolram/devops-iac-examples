export RepositoryName="<REPO_NAME>"
export FullRepositoryId="<ACCOUNT>/<REPO_NAME>"
export Setup=true

## Dev

export ConnectionArn="<CONNECTION_ARN_AWS>"
export BranchName="develop"
export EnvName="dev"
export AwsRegion="us-east-1"
export AwsRegionDeploy="us-east-1"
export ServerlessFile="serverless.yml"

aws cloudformation deploy --stack-name $EnvName-pipeline-$RepositoryName --template-file .cicd/Pipeline.yml \
--parameter-overrides RepositoryName=$RepositoryName FullRepositoryId=$FullRepositoryId ServerlessFile=$ServerlessFile \
BranchName=$BranchName ConnectionArn=$ConnectionArn EnvName=$EnvName AwsRegion=$AwsRegion Setup=$Setup AwsRegionDeploy=$AwsRegionDeploy \
--region $AwsRegion --capabilities CAPABILITY_NAMED_IAM

aws cloudformation delete-stack --stack-name $EnvName-pipeline-$RepositoryName --region $AwsRegion
