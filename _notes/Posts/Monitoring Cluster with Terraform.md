---
title : Monitoring Cluster with Terraform
feed: show
date : 13-11-2022
---

This is a follow on post to [[First Elastic Cluster with Terraform]], it's best practice to monitor your Elasticsearch clusters with a dedicated monitoring cluster. I'm going to take the example we started with in my first Terraform post and add a monitoring cluster to it.

Here's the script we ended with in the last post, plus everything we need to add a monitoring cluster.

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

resource "ec_deployment" "elastic-cluster" {
  name = "My deployment identifier"
  
  region = "gcp-europe-west3"
  version = "8.5.0"
  deployment_template_id = "gcp-memory-optimized-v2"
  
  elasticsearch {}
  
  kibana {}

  observability {
    deployment_id = ec_deployment.monitoring-cluster.id
  }
}

resource "ec_deployment" "monitoring-cluster" {
  name = "My deployment identifier"
  
  region = "gcp-europe-west3"
  version = "8.5.0"
  deployment_template_id = "gcp-memory-optimized-v2"
  
  elasticsearch {
    topology {
      id   = "hot_content"
      size = "4g"
    }

    topology {
      id = "ml"
    }
  }
  
  kibana {}
}
```

We're going to add a second cluster by adding another resource block, and we'll call it the monitoring cluster. Inside of the `elastic-cluster` resource block you'll see that we've added the [observability arguement](https://registry.terraform.io/providers/elastic/ec/latest/docs/resources/ec_deployment#observability), which is what connects the elastic cluster to the monitoring cluster.

```terraform
  observability {
    deployment_id = ec_deployment.monitoring-cluster.id
  }
```

While we're here I am going to make two other changes to the monitoring cluster. For one, I am going to make it a little bit smaller than the default of the deployment template. I am also going to add in an ML node at the default sizing. Machine Learning will allow me to run ML jobs to monitor cluster health. I make both of these changes by specifying [topology arguements](https://registry.terraform.io/providers/elastic/ec/latest/docs/resources/ec_deployment#size) inside of the `elasticsearch`  arguement of the monitoring cluster.

```terraform
  elasticsearch {
    topology {
      id   = "hot_content"
      size = "4g"
    }

    topology {
      id = "ml"
    }
  }
```

With all of this done if I execute `terraform plan` it will show me that it is creating two resources.

```sh
Plan: 2 to add, 0 to change, 0 to destroy.
```

And applying the config indeed creates two clusters, and the Terraform cluster is connected to the monitoring cluster for logs and metrics:

![New Clusters Showing in Elastic Cloud Console](https://raw.githubusercontent.com/wrathagom/wrathagom.github.io/927d5dbc974ca93a92b301c12a593eed4a7540e5/assets/img/blogImages/Screen%20Shot%202022-11-15%20at%209.35.51%20AM.png)
![Monitoring Logs Being Shipped to Monitoring Cluster](https://github.com/wrathagom/wrathagom.github.io/blob/927d5dbc974ca93a92b301c12a593eed4a7540e5/assets/img/blogImages/Screen%20Shot%202022-11-15%20at%209.37.10%20AM.png?raw=true)

## 🚨 Tips and Tricks
Working with Topology blocks can be a bit interesting. The team behind the Terraform provider is working on some big changes, but for now the ***topology blocks have to be in alphabetical order*** of `id`. That is `hot_content` has to come before `ml`.

Additionally, just removing a toplogy block and re-applying via terraform, wont necessarily remove the nodes from the cluster. To ***remove the nodes form the cluster you must set their size to 0g***, not just remove them.


**Tags: [[Elastic]], [[Terraform]], [[Programming]]**

Does this work?

![Testing](Images/true.png)