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

- **meta argument** = built-in configuration keys used inside resource, data, and module blocks to control how Terraform manages and deploys infrastructure, rather than defining the properties of the infrastructure itself.
  Keywords: `count`, `for_each`, `depends_on`, `lifecycle`, `provider`

- **values** = Values of the configuration. The value can be a string, number, boolean, list, map, or another resource or output.

- **attribute (output or exported attribute)** = The specific properties or data fields associated with a block. Terraform generates these after infrastructure is created. They cannot be used as arguments.

- **splat expression** = It is used to extract a specific attribute value from a list of resources.
  Example: `aws_instance.my-ubuntu-instance[*].public_ip`

### Terraform Workflow

- `terraform init` Initializes the working directory, downloads necessary providers, and sets up the environment
- `terraform validate` Validates the configuration files for syntax errors
- `terraform plan` Creates an execution plan, showing what changes will be made
- `terraform apply` Applies the changes to the infrastructure.
- `terraform destroy` Destroys the infrastructure.

> Use `-auto-approve` flag to skip interactive mode (a yes prompt) in apply and destroy.

## HCL Block & its Components

- **resource** = A resource block is creates, updates, or destroys infrastructure.
  Example: `resource "aws_instance" "my-ubuntu-instance" {}`

> **user_data** = An optional argument to run commands or scripts on the instance when it is launched.

- **provider** = A plugin that interacts with a specific API.
  Examples: `aws`, `azure`, `google-cloud` ( GCP ), `kubernetes`, `helm`, `local`, etc.

> **interpolation** = A way to refer the value of the block.\
>  Syntax: `parameter.identifier.attribute`\
>  Example: `aws_default_vpc.my-default-vpc.id`

- **variable** = A variable block is inputs, used to store a value, which can be used in multiple places in the configuration.
  Reference: `instance_type = var.ec2-instance_type`

- **data** = A data block is lookups, used to retrieve an existing information from your environment that you don't control, such as a list of available cloud regions or an existing server ID.  
  Reference: `ami = data.aws_ami.ubuntu.id`

- **output** = An output block is outputs, used to output the value of a resource or variable.  
  Example: `ec2-public-ip = aws_instance.my-ubuntu-instance.public_ip`

- **count** = It is a meta argument which helps to create multiple resources from a single resource block.

- **for_each** = It is a meta argument which helps to create multiple resources from a single resource block.

  > ` each` = an object which has two attributes `key` and `value`

  > `for` loop is compatible in output block with `for_each`\
  > Syntax: `for [attribute] in [list]: [expression]`\
  > Example: `for instance in aws_instance.my-ubuntu-instance: instance.public_ip`

- **depends_on** = It is a meta argument which helps to create a dependency between resources.  
  Example: `depends_on = [parameter.identifier , ...]`

- **conditional statement** = if condition is true then execute the first expression else execute the second expression.\

  > Syntax: `condition ? true : false` (ternary operator)\
  > Example: `var.env == "prd" ? 20 : var.ec2-root-storage-size`

- **locals** = It is a local variable which is used to store a value, which can be used in multiple places in the configuration.  
  Syntax: `local = { name1 = "value1", name2 = "value2", ... }`  
  Reference: `local.name`

## Terraform State Management

- `.tfstate` file that keeps track of all the resources that terraform has created.
- `.tfstate.backup` file that keeps track of all the resources that terraform has created before the previous apply.
- terraform can be used to manage local resources
- ** Issues **
  - state can be lost (when you delete .tfstate file)
  - state can be corrupted (state conflict, when two or more users try to apply terraform code at the same time)
  - state cannot be shared across multiple users or systems (no commit on github)
- ** Solution **
  - use remote backend (aws s3)
  - use lock and release mechanism (aws dynamodb)
- **backend** = A backend block (in `terraform.tf`) is used to store the state file in a remote location.

### Terraform State Management Commands

- `terraform refresh` : It is used to update the state file with the actual values of the resources in the cloud.
- `terraform state list` : It is used to list all the resources in the state file.
- `terraform state show <parameter.identifier>` : It is used to show the details of the resources in the state file.
- `terraform state rm <parameter.identifier>` : It is used to remove the resources from the state file.
- `terraform import <parameter.identifier> <resource_id>` : It is used to import the resources into the state file.
  > Example: `terraform import aws_intance.my-existing-instance <instance-id>`
- `terraform state mv <old_parameter.identifier> <new_parameter.identifier>` : It is used to move the resources from the state file.

## Terraform Workspace Management

- Workspaces allow you to manage multiple environments with the same configuration.

  > Example: `dev`, `stg`, `prd`, etc.

- **default** = Default workspace

### Terraform Workspace Management Commands

- `terraform workspace new <workspace-name>` : It is used to create a new workspace.
- `terraform workspace select <workspace-name>` : It is used to select a workspace.
- `terraform workspace show` : It is used to show the current workspace.
- `terraform workspace list` : It is used to list all the workspaces.
- `terraform workspace delete <workspace-name>` : It is used to delete a workspace.
