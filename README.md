# terraform-share
# Setting up the dev environment on GCP using Terraform

ref: https://developer.hashicorp.com/terraform/tutorials/gcp-get-started/google-cloud-platform-build

## Prerequisites
 * [The gcloud CLI installed locally](https://cloud.google.com/sdk/docs/install).
 * [Terraform 1.2.0+ installed locally](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

## Provision
 * Clone the repository and go to playpen folder in terminal, then
 * Change the variables in the variables.tf file to match suitable GCP project ID
 * From the playpen folder, in terminal:
   1. Initialize the directory by 
    ```terraform init```
   2. Format and validate the configuration by 
    ```terraform fmt -recursive```
   3. Validate the configuration by 
   ```terraform validate```

   4. Create new infrastructure or changing existing one: by applying the configuration  
      ```terraform apply```

   5. Inspect state: using the Terraform state file, `terraform.tfstate`, to track resources it manages.   
      ```terraform show```

