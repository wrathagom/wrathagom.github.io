---
layout: post
title:  "Reverse Proxy with Tinyproxy"
date:   2022-11-14
category: Data
tags:
  - terraform
  - Elastic Cloud
  - How To
comments: false
---

It all started with a weather station, specifically I have the WS2000 from Ambient Weather. Well a recent update of the firmware on the base station allows for a push of weather data to a custom endpoint, but only to a local endpoint. So how then do I get it to a cloud hosted NodeRed?

<!--more-->

But that endpoint is very picky! As best I can tell:
 - It can only push to local endpoints
 - doesn't like 10.x IP Addresses, only 192.x
 - Can't handle https
 - Only makes GET requests

I started off trying to send the data to a Lambda and then a tiny EC2 instance, but then came to the conlusion the device couldn't reach the public internet. I tried with direct IP connections and DNS domains.

But I really wanted to push the data into a Node-RED flow so that I can send it to Elasticsearch and a few other places.

I tried to find a iptables or ssh solution that could work, but ended up installing tinyproxy on a Raspberry Pi that I have running somewhere else in the house and using it to forward the requests.

Here is the tinyproxy config that I ended up with:

```
Port 3000
Listen 0.0.0.0
Timeout 600
Allow 192.168.86.24
MaxClients 5
StartServers 1
ConnectPort 80
ConnectPort 1880
ReversePath "/" "http://my-node-red-url:3000/aw/"
ReverseOnly Yes
ReverseMagic Yes
```

It's all clearnet, no sensitive information so i wasn't too worried about SSL. Breaking down what I think the above does: