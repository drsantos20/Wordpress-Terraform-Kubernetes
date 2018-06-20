
# Infrastructure as a code with terraform

![kubernetes](kubernetes.png)    ![terraform](terraform.png)

This is a simple example to provide wordpress into kubernetes cluster

Some commands like local-exec in inside of `cluster.tf` maybe the external IP of the wordpress service will be load with <pending> status, so to get the IP just run `kubectl get service mysql`

# requirements

- You will need the credentials-file (e.g ${file("~/default.json")}" ) to refer into `provider.tf` which should be a service account in gcloud
- Chek if you will need to change the `variables.tf` with project name that has a compute API enabled

# Just run

`terraform init`

# Then

`terraform apply`

# To remove

`terraform destroy`
