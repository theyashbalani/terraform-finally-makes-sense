# Terraform Overview

- IaC act as a **Single Source of Truth** for all your infrastructure.
- `.tf` file extension for terraform files using the **HashiCorp Configuration Language (HCL)**
- **declarative** syntax to build, change and version infrastructure
- **Declarative** = You define the **desired state** and terraform works its magic to reach that state

## HCL Formula and Syntax

```
block parameter {
    argument=values
}
```

- **block** = A container for the configuration.
  Keywords: `resource`, `output`, `variable`, `data`

- **parameter** = Type of the configuration.
  Keywords: `local_file`, `aws_instance`, `aws_s3_bucket`

- **identifier** = local name of the resource, you can name it whatever you want
  Example: `my-default-vpc`, `my-default-sg`, `my-key-pair`

- **argument (input attribute)** = Configuration.
  Keywords: `filename`, `content`, `ami`, `instance_type`

- **values** = Values of the configuration. The value can be a string, number, boolean, list, map, or another resource or output.

- **attribute (output or exported attribute)** = The specific properties or data fields associated with a resource. Terraform generates these after infrastructure is created. They cannot be used as arguments.

- **provider** = A plugin that allows Terraform to interact with a specific infrastructure/configuration.
  Examples: `aws`, `azure`, `google-cloud` ( GCP ), `kubernetes`, `helm`, `local`, etc.

- **interpolation** = extract the value from the block
  Syntax: ${parameter.identifier.attribute}
  Example: ${aws_default_vpc.my-default-vpc.id}

## Terraform Workflow

- `terraform init` Initializes the working directory, downloads necessary providers, and sets up the environment
- `terraform validate` Validates the configuration files for syntax errors
- `terraform plan` Creates an execution plan, showing what changes will be made
- `terraform apply` Applies the changes to the infrastructure. Use `-auto-approve` flag to skip interactive mode.
- `terraform destroy` Destroys the infrastructure. Use `-auto-approve` flag to skip interactive mode.
