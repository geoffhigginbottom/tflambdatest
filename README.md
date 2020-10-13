# Terraform Lambda Testing

Testing deploying Lambda Functions using Terraform, and also setting up Splunk APM (formerly known as SignalFx).

Deploys 2 Lambda Functions, RetailParent and RetailChild. RetailParent triggers RetailChild which then passes information back to RetailParent.

## terraform.tfvars

Rename 'terraform.tfvars.example' to 'terraform.tfvars' and update the values with your unique settings.  The AWS Variables assume you have aws cli configured and have a credentials file, typically located in ~/.aws

'profile' is the name of the aws profile from your ~/.aws/credentials file which tells the AWS CLI which account / environment to use.

'SFx Variables' are used to link to your SignalFx environment for APM

    ### AWS Variables ###
    profile = "xxx"
    #region = "2"

    ### SFx Variables ###
    access_token = "xxx"
    realm = "eu0"
    metrics_url = "https://ingest.eu0.signalfx.com"
    metrics_tracing = "https://ingest.eu0.signalfx.com/v2/trace"
    apm_environment = "https://ingest.eu0.signalfx.com/v2/trace"

## Deployment
Run the following commands - has been tested with terraform v0.13.4

    terraform init
    terraform apply

## Lambda Test Event

Once the functions have been deployed, create a 'Test Event' for the RetailParent function using the following code:

    {
    "ProductName": "iphone",
    "Quantity": 2
    }