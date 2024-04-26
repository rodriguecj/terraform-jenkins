## Creation of Jenkins using Terradorm

### Init and download necessary plugins

```bash
terraform init
```

### Check the infrastructure
```bash
terraform plan -var-file all_variable.tfvars
```

### Apply the infrastructure
```bash
terraform apply -var-file all_variable.tfvars -auto-approve
```

### Destroy the infrastructure
```bash
terraform destroy -var-file all_variable.tfvars -auto-approve
```
