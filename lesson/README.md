# Terraform Overview

- IaC act as a **Single Source of Truth** for all your infrastructure.
- `.tf` file extension for terraform files using the **HashiCorp Configuration Language (HCL)**
- **declarative** syntax to build, change and version infrastructure
- **Declarative** = You define the **desired state** and terraform works its magic to reach that state

## HCL Overview

```
block parameter identifier {
    argument=values
}
```

## HCL Components

- **block** = A container for the configuration.
  Keywords: `resource`, `output`, `variable`, `data`

- **parameter** = Type of the block.
  Keywords: `local_file`, `aws_instance`, `aws_s3_bucket`

- **identifier** = Local name of the block, you can name it whatever you want
  Example: `my-default-vpc`, `my-default-sg`, `my-key-pair`

- **argument (input attribute)** = Configuration.
  Keywords: `filename`, `content`, `ami`, `instance_type`

- **values** = Values of the configuration. The value can be a string, number, boolean, list, map, or another resource or output.

- **attribute (output or exported attribute)** = The specific properties or data fields associated with a block. Terraform generates these after infrastructure is created. They cannot be used as arguments.

## Terraform Workflow

- `terraform init` Initializes the working directory, downloads necessary providers, and sets up the environment
- `terraform validate` Validates the configuration files for syntax errors
- `terraform plan` Creates an execution plan, showing what changes will be made
- `terraform apply` Applies the changes to the infrastructure.
- `terraform destroy` Destroys the infrastructure.

> Use `-auto-approve` flag to skip interactive mode (a yes prompt) in apply and destroy.

## HCL Block & Components

- **resource** = A resource block is creates, updates, or destroys infrastructure.
  Example: `resource "aws_instance" "my-ubuntu-instance" {}`

> **user_data** = An optional argument to run commands or scripts on the instance when it is launched.

- **provider** = A plugin that interacts with a specific API.
  Examples: `aws`, `azure`, `google-cloud` ( GCP ), `kubernetes`, `helm`, `local`, etc.

> **interpolation** = A way to refer the value of the block.\
> Syntax:\
> `parameter.identifier.attribute`
> Example:\
> `aws_default_vpc.my-default-vpc.id`

- **variable** = A variable block is inputs, used to store a value, which can be used in multiple places in the configuration.
  Reference: `instance_type = var.ec2-instance_type`

- **data** = A data block is lookups, used to retrieve an existing information from your environment that you don't control, such as a list of available cloud regions or an existing server ID.  
  Reference: `ami = data.aws_ami.ubuntu.id`

- **output** = An output block is outputs, used to output the value of a resource or variable.  
  Example: `ec2-public-ip = aws_instance.my-ubuntu-instance.public_ip`
