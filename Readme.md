# Usage

## Initialize Project's Backend

create `backend.conf` with this configuration

```conf
bucket     = "${AWS_S3_BUCKET}"
encrypt    = "true"
region     = "${AWS_REGION}"
key        = "${AWS_S3_STORE_KEY}"
access_key = "${AWS_ACCESS_ID}"
secret_key = "${AWS_SECRET_ACCESS_ID}"
```

execute this command
```
terraform init -backend-config backend.conf
```

## Deploy the project

create enviromental configuration for deployment, example `test.tfvars`

```tfvars
subnet_id       = ["subnet-XXXXXX"]
broker_name     = "rabbitmq"
username        = "test-rabbitmq"
password        = "${RABBITMQ_PASSWORD}"
vpc_id          = "${AWS_VPC_ID}"


```

execute this command

```
terraform apply -var-file {enviromental_configuration}.tfvars 
```


## Destroy this project
```
terraform destroy -var-file {enviromental_configuration}.tfvars 
```