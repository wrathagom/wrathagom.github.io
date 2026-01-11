---
layout: default
title: Home
---

# Hi, I'm Caleb

Data strategist - from the shop floor, to the C-suite.

I build tools for data engineering, analytics, and making information accessible.

## Latest Post

{% assign latest_post = site.posts.first %}
{% if latest_post %}
<article class="latest-post">
  <time datetime="{{ latest_post.date | date_to_xmlschema }}">{{ latest_post.date | date: "%B %d, %Y" }}</time>
  <h3><a href="{{ latest_post.url | relative_url }}">{{ latest_post.title }}</a></h3>
  <p>{{ latest_post.content | strip_html | truncate: 200 }}</p>
</article>

[View all posts &rarr;](/blog)
{% else %}
No posts yet.
{% endif %}

## Projects

- [analytical-ecosystem](https://github.com/wrathagom/analytical-ecosystem) - Dockerized data engineering tools
- [Big-Beautiful-Screens](https://github.com/wrathagom/Big-Beautiful-Screens) - Real-time display screens
- [production-worthy-jupyter](https://github.com/wrathagom/production-worthy-jupyter) - Production-ready notebooks
