# terraform-create-jenkins
Jenkins con Terradorm

# Inicializar y hacer la descarga de los plugins necesarios
terraform init

# Check the infraestructure
terraform plan -var-file all_variable.tfvars

# Apply the infraestructure
terraform apply -var-file all_variable.tfvars -auto-approve

# Destroy the infraestructure
terraform destroy -var-file all_variable.tfvars -auto-approve
