---
title : Deploying Elastic with Terraform: Part 1
feed: show
date : 11-12-2022
---

For my day job with Elastic, I have had several customers deploying their clusters with Terraform. I have no experience using Terraform and so I thought it would be worth some investigation.

I started with [this post](https://www.elastic.co/blog/using-terraform-with-elastic-cloud) from the Elastic blog, which was an excellent starting point, but it didn't give much history on Terraform or an intro to it. It probably assumed people going there have some familairity with TF, which I don't 😅. Indeed I didn't even have Terraform installed!

## Installing Terraform

I'm on a Mac, so I used brew to install Terraform following the official docs.


## Creating our first cluster

Below is the Terraform configuration file I started with `starter.tf`, I'm going to break down my current understand of what the blocks are and what they mean:

```
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
  version = "8.1.3"
  deployment_template_id = "gcp-memory-optimized-v2"
  
  elasticsearch {}
  
  kibana {}
}
```

The first block is mostly used for configuring Terraform itself. The current version of TF (as of Nov 12th, 2022) is 1.3.4, which is what I installed.