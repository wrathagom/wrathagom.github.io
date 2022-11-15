---
title : Reverse Proxy with Tinyproxy
feed: hide
date : 14-11-2022
---

It all started with a weather station, specifically I have the WS2000 from Ambient Weather. Well a recent update of the firmware on the base station allows for a push of weather data to a custom endpoint.

But that endpoint is very picky! As best I can tell:
 - It can only push to local endpoints
 - doesn't like 10.x IP Addresses, only 192.x
 - Can't handle https
 - Only makes GET requests

I started off trying to send the data to a Lambda and then a tiny EC2 instance, but then came to the conlusion the device couldn't reach the public internet. I tried with direct IP connections and DNS domains.

But I really wanted to push the data into a Node-RED flow so that I can send it to Elasticsearch and a few other places.

I tried to find a iptables of ssh solution that could work, but ended up installing tinyproxy on a Raspberry Pi that I have running something else in the house and using it to forward the requests.

