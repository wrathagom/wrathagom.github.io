---
layout: post
title:  "Multiple Monitoring Clusters with CCS"
date:   2022-11-16
category: Elastic
tags:
  - terraform
  - Elastic Cloud
  - How To
comments: false
---

Full disclosure, this is actually were my Terraform journey began. I had a customer who was going to need to create monitoring clusters in many regions across multiple providers. I wanted a single Terraform script that could create all of the monitoring clusters, as well as a CCS (Cross Cluster Search) cluster to bring all of the monitoring data together.

This Terraform configuration does exactly that, and it only has 5 more lines than the config we used to create a single cluster and monitoring cluster in my last post, [[Monitoring Cluster with Terraform]].

It takes advantage of two, what I would consider to be advanced, Terraform arguements: The [for_each](https://developer.hashicorp.com/terraform/language/meta-arguments/for_each) meta-arguement and the [dynamic blocks](https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks).

The `for_each` block allows you to create multiple resource from a single resource block:

```terraform
resource "aws_iam_user" "the-accounts" {
  for_each = toset( ["Todd", "James", "Alice", "Dottie"] )
  name = each.key
}
```

And `dynamic blocks` allow you repeat ***nested*** blocks using the for_each arguement:

```terraform
dynamic "setting" {
  for_each = var.settings
  content {
    namespace = setting.value["namespace"]
    name = setting.value["name"]
    value = setting.value["value"]
  }
}
```

And here is what it all looked like when I put it together with the Elastic Cloud Terraform provider:

```terraform
terraform {
  required_version = ">= 1.0.0"

  required_providers {
    ec = {
      source  = "elastic/ec"
      version = "0.5.0"
    }
  }
}

provider "ec" {
}

resource "ec_deployment" "monitoring-clusters" {
  for_each = toset( ["us-east-1", "us-west-1", "aws-eu-central-1"] )
  
  name                   = "monitoring-${each.key}"

  region                 = each.key
  version                = "8.5.0"
  deployment_template_id = "aws-compute-optimized-v3"

  elasticsearch {}

}

resource "ec_deployment" "monitoring-ccs" {
  name				= "monitoring-ccs"

  region			= "us-east-1"
  version			= "8.5.0"
  deployment_template_id	= "aws-compute-optimized-v3"

  elasticsearch {

    dynamic "remote_cluster" {
      for_each = ec_deployment.monitoring-clusters
      
      content {
        deployment_id = remote_cluster.value.id
        alias         = remote_cluster.value.name
        ref_id        = remote_cluster.value.elasticsearch.0.ref_id
      }
    }
  }

  kibana {}

}
```

To create multiple monitoring clusters in several different regions I added a `for_each` arguement to the `monitoring-clusters` resoruce block:

```terraform
for_each = toset( ["us-east-1", "us-west-1", "aws-eu-central-1"] )
```

I even used the region as part of the name of the cluster:

```terraform
name                   = "monitoring-${each.key}"
```

Then inside of the CCS cluster, I needed to create multiple `remote_cluster` sections, which I did using a dynamic block:

```terraform
    dynamic "remote_cluster" {
      for_each = ec_deployment.monitoring-clusters
      
      content {
        deployment_id = remote_cluster.value.id
        alias         = remote_cluster.value.name
        ref_id        = remote_cluster.value.elasticsearch.0.ref_id
      }
    }
```

Putting all of this together is really starting to show me the value of Terraform. For the real-life use case of the above I created 12 monitoring clusters and 1 CCS cluster from a single `terraform apply` command. Talk about time savings!