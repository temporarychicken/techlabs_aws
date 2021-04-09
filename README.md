# Welcome to Techlabs Axway API Manager!

![Axway Image](https://www.axway.com/sites/default/files/2019-09/axway.png)

This project will allow the rapid instantiation of Axway API Manager V7 and API gateway into AWS for any Axway partner or customer.

You choose the subdomain for the **techlab** workshop, for example:
**mycompanyname**.axwaydemo.net

The default subdomain is **techlab0001**.

## Instructions for use

### Prerequisites
1. The AWS cli client tool for your environment (either Windows or OSX).  To use this tool for programmatic access towards your AWS target account, you will need to create a client secret and key from within the AWS portal 'My Security Credentials/Create Access Key'.
2. Run 'aws configure' to install the above credentials into the AWS Cli, together with your target AWS region.
3. Install the terraform command line utility from Hashicorp.

### Download the github project

    git clone https://github.com/temporarychicken/techlabs_aws

### Choose your subdomain name

    .\configure_workshop_name_Powershell_Windows.ps1

### Create your certificate for TLS access to your chosen subdomain name

    cd .\1_terraform-create-or-refresh-certs\
    .\create_certificate.ps1

### Instantiate your APIManager

    cd ..\3_terraform-deploy-platform\
    .\deploy_axway_v7_platform_in_AWS.ps1
    
### Access your online Axway Resources

#### API Manager

https://apimanager.mycompanyname.axwaydemo.net

#### API Gateway Manager

https://apigateway.mycompanyname.axwaydemo.net

#### API Builder

https://apibuilder.mycompanyname.axwaydemo.net



