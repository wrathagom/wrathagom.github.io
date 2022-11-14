---
title : First Elastic Cluster with Terraform
feed: show
date : 12-11-2022
---

Tags: [[Elastic]]


For my day job with Elastic, I have had several customers deploying their clusters with Terraform. I have no experience using Terraform and so I thought it would be worth some investigation.

I started with [this post](https://www.elastic.co/blog/using-terraform-with-elastic-cloud) from the Elastic blog, which was an excellent starting point, but it didn't give much history on Terraform or an intro to it. It probably assumed people going there have some familairity with TF, which I don't 😅. Indeed I didn't even have Terraform installed!

## Installing Terraform

I'm on a Mac, so I used brew to install Terraform following the [official docs](https://developer.hashicorp.com/terraform/downloads). Two commands and I had everything installed as needed:

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/terraform
```

Now that we've got everything installed I'm ready to create my first cluster with Terraform!

## Creating our first cluster

Below is the Terraform configuration file I started with `starter.tf`, I'm going to break down my current understand of what the blocks are and what they mean:

```terraform
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    ec = {
      source = "elastic/ec"
      version = "0.5.0"
    }
  }
}

provider "ec" { }

resource "ec_deployment" "custom-deployment-id" {
  name = "My deployment identifier"
  
  region = "gcp-europe-west3"
  version = "8.5.0"
  deployment_template_id = "gcp-memory-optimized-v2"
  
  elasticsearch {}
  
  kibana {}
}
```

The first block, also known as the `terraform block` is used for configuring Terraform itself. The current version of TF (as of Nov 12th, 2022) is 1.3.4, which is what I installed.  If you want to know the latest current version it is shown at the top of their [downloads page](https://developer.hashicorp.com/terraform/downloads).

In the `required_providers` block I specificy that I need the [Elastic Cloud provider](https://registry.terraform.io/providers/elastic/ec/latest/docs). There is a full list of providers available [here](https://registry.terraform.io/browse/providers). I am excited to play with some of the others!

The `provider block` allows configuration required for each individual provider. For Elastic Cloud the [provider configuration](https://registry.terraform.io/providers/elastic/ec/latest/docs#argument-reference) is mostly around authentication. But I am using an environment variable to house my API key and leverage [API Key Authentication](https://registry.terraform.io/providers/elastic/ec/latest/docs#api-key-authentication-recommended), which is the recommended method. Instead I ran the below command to set the env variable needed.

```sh
export EC_API_KEY="<apikey value>"
```

The final block of the above config is the `resource block`, which is where we define exactly what it is we want Terraform to create with the provider we're connecting to. I think the details of the resource block are best saved for a second post when I am ready to go deeper, but the [Elastic Cloud resource block](https://registry.terraform.io/providers/elastic/ec/latest/docs/resources/ec_deployment#basic) options are documented fairly well.

Breaking down what is included in this first example aboe:
 - `name` - The name of the deployment we are going to create.
 - `region` - The Region we are deploying into, available regions are listed [here](https://www.elastic.co/guide/en/cloud/current/ec-regions-templates-instances.html).
 - `version` - Which version of Elastic to deploy, latest as of today is `8.5.0`
 - `deploymeny_template_id` - You can find these by visiting the regions link above and clicking on the region you are deploying to. Compared to the Elastic Cloud UI, these are the Hardware profiles.

The next two lines just tell Elastic Cloud to create an Elasticsearch cluster with the default size and settings and create a kibana node with the default size and settings.

Now to get it all running we're going to run three more commands:

```sh
terraform init
terraform plan
terraform apply
```

`Init` just installs the providers as needed, `plan` shows you what Terraform is going to do, and `apply` does it!

More to come as I explore more on this topic!