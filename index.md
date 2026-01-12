---
layout: default
title: Home
---

<div class="intro">
  <img src="/assets/images/profile.jpg" alt="Caleb on horseback" class="profile-photo">
  <div class="intro-text">
    <h1>Hi, I'm Caleb</h1>
    <p>Data crunching, software developing, horse riding - Cyborg.</p>
  </div>
</div>

## Latest Post

{% assign latest_post = site.posts.first %}
{% if latest_post %}
<article class="latest-post">
  <div class="post-meta">
    <time datetime="{{ latest_post.date | date_to_xmlschema }}">{{ latest_post.date | date: "%B %d, %Y" }}</time>
    {% if latest_post.category %}<span class="category-tag">{{ latest_post.category }}</span>{% endif %}
  </div>
  <h3><a href="{{ latest_post.url | relative_url }}">{{ latest_post.title }}</a></h3>
  <p>{{ latest_post.content | strip_html | truncate: 200 }}</p>
</article>

[View all posts &rarr;](/blog)
{% else %}
No posts yet.
{% endif %}

## Projects

- [ai-discord-bot](https://github.com/wrathagom/ai-discord-bot) - AI-powered Discord bot
- [Big-Beautiful-Screens](https://github.com/wrathagom/Big-Beautiful-Screens) - Real-time display screens
- [production-worthy-jupyter](https://github.com/wrathagom/production-worthy-jupyter) - Production-ready notebooks
- [analytical-ecosystem](https://github.com/wrathagom/analytical-ecosystem) - Dockerized data engineering tools
