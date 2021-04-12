terraform init
terraform apply --auto-approve
terraform show |select-string public_ip
