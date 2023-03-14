---
layout: default
title: Categories
permalink: /categories/
group: navigation
---
I primarily write about things in one of these categories:

{% for category in site.categories %}
  - [{{category | first}}]({{site.url}}{{site.baseurl}}{{page.url}}{{category | first}})
{% endfor %}

<!-- But my posts are generally speaking always tagged as well, so more specifically here is what I write about:

<p class="post-meta" style="text-align: justify;">
	{% capture site_tags %}{% for tag in site.tags %}{{ tag | first }}{% unless forloop.last %},{% endunless %}{% endfor %}{% endcapture %}
	{% assign tags = site_tags | split:',' | sort %}
	{% include tag_cloud.html %}
</p> -->
