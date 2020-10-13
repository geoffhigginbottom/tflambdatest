### AWS Variables  ###

variable "key_name" {
  default = []
}

variable "profile" {
  default = []
}

variable "region" {
  description = "Select region (1:eu-west-1, 2:eu-west-3, 3:us-east-1, 4:us-east-2, 5:us-west-1, 6:us-west-2, 7:ap-southeast-1, 8:ap-southeast-2, 9:sa-east-1 )"
}

variable "aws_region" {
  description = "Provide the desired region"
    default = {
      "1" = "eu-west-1"
      "2" = "eu-west-3"
      "3" = "us-east-1"
      "4" = "us-east-2"
      "5" = "us-west-1"
      "6" = "us-west-2"
      "7" = "ap-southeast-1"
      "8" = "ap-southeast-2"
      "9" = "sa-east-1"
    }
}

variable "region_wrapper" {
  default = {
    "1" = "arn:aws:lambda:eu-west-1:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "2" = "arn:aws:lambda:eu-west-3:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "3" = "arn:aws:lambda:us-east-1:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "4" = "arn:aws:lambda:us-east-2:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "5" = "arn:aws:lambda:us-west-1:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "6" = "arn:aws:lambda:us-west-2:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "7" = "arn:aws:lambda:ap-southeast-1:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "8" = "arn:aws:lambda:ap-southeast-2:254067382080:layer:signalfx-lambda-python-wrapper:10"
    "9" = "arn:aws:lambda:sa-east-1:254067382080:layer:signalfx-lambda-python-wrapper:10"  
  }
}

### SFx Variables ###
variable "access_token" {
  default = []
}

variable "realm" {
  default = []
}

variable "metrics_url" {
  default = []
}

variable "metrics_tracing" {
  default = []
}

variable "apm_environment" {
  default = []
}
