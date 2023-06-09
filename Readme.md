

Legacy Application Cloud Infrastructure Setup
=============================================

This repository contains the necessary code to prepare the cloud infrastructure (<b>AWS</b>) for hosting a legacy application using <b>Terraform</b> and installing a security agent on the instance with <b>Ansible</b>.

There are two simple modules. The one is `network-core` provisions the network part (VPC, subnet, etc.) and another is `compute` module creates EC2 instance. Instance public IP address is associated with DNS record, tfstate stored in S3 bucket

Prerequisites
-------------

Developed and tested with following versions:

-   Terraform v1.4.6
-   Ansible v2.12.3

Make sure you have the required credentials and access to your cloud provider's infrastructure.

Setup Instructions
------------------

Follow the steps below to set up the cloud infrastructure and install the security agent:

1.  Clone the repository to your local machine:

    `git clone git@github.com:osas1111/CloudOps_Challenge.git`

2.  Change into the project's terraform directory:

    `cd CloudOps_Challenge/terraform`

3.  Initialize Terraform by running the following command:

    `terraform init`

4.  Review the Terraform execution plan to ensure everything is set up correctly:

    `terraform plan`

5.  Create the cloud infrastructure by running the following command:

    `terraform apply`

    You will be prompted to confirm the infrastructure changes. Enter "yes" to proceed.

6.  Run the Ansible playbook to install the security agent with script at `CloudOps_Challenge/ansible`:

    `./install_security_agent.sh --private-key=<path_to_your_private_key>`

    Replace `<path_to_your_private_key>` with the path to your private key file.

7.  Once the script completes, the security agent should be installed on the instance successfully.

Cleaning Up
-----------

To clean up and remove the infrastructure created by Terraform, run the following command:

`terraform destroy`

You will be prompted to confirm the destruction of resources. Enter "yes" to proceed.

Note: Be cautious while running the `terraform destroy` command as it will remove all the resources created by Terraform.