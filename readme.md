# Prisma Cloud Policy As Code Demonstration

## Overview

This demonstration is built to show how you could control the Prisma Cloud Policies using a GitOps process by simply modifying a simple YAML file. In this case the YAML file is `custom-policies.yaml`.

Once this YAML file is changes the policies can be pushed directly to Prisma Cloud via a GitHub Action or other CI/CD workflow, allowing for automation of the policy deployment.

## Prerequists

* TERRAFORM CLI installed on your computer.
* GIT CLI installed on your computer (although you could just download the files manually)
* Prisma Cloud Access Key and Secret Key with access to create Policies.
* The correct API endpoing address for your Prisma Cloud instance.

## Setting up this demonstration

1. Git Clone the Git Repository to your computer by running `git clone https://github.com/salsop/prisma-cloud-policy-as-code-demo`.

2. You will need to create a file called `.prismacloud_auth.json` in the route of the folder to store the credentials to connect with Prisma Cloud. There is an `.gitignore` file to prevent this to be added to Git.

You will need to sustiture the values that have been *** out with you Access Key and Secret Key from Prisma Cloud, as well as specifying your Customer Name as defined in Prisma Cloud. You may also need to update the URL to the correct API endpoint for your instance of Prisma Cloud.

```
{
  "url": "api.eu.prismacloud.io",
  "username": "15******-****-****-****-**********47",
  "password": "Eo*****************0=",
  "customer_name": "E***********E"
}
```

## Using the demostration

Once you've complete the setup steps, just ensure you're in the correct folder and run the following steps:

1. Run `terraform init` to initalize Terraform and Download the required providers

2. Run `terraform plan` to see what chnages will be made and to validate you've configured the credentials in the `.prismacloud_auth.json` file correctly.

3. If you're happy with the changes that will be made run `terraform apply` to show the plan once more before approving the chnages to be made.

