---
layout: default
title: Home
---

<div class="intro">
  <img src="{{ '/assets/images/profile.jpg' | relative_url }}" alt="Caleb on horseback" class="profile-photo">
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
    {% if latest_post.category %}<a class="category-tag" href="{{ '/blog' | relative_url }}#category={{ latest_post.category | slugify }}">{{ latest_post.category }}</a>{% endif %}
  </div>
  <h3><a href="{{ latest_post.url | relative_url }}">{{ latest_post.title }}</a></h3>
  <p>{{ latest_post.content | strip_html | truncate: 200 }}</p>
</article>

<div class="section-link">
  <a href="/blog">View all posts &rarr;</a>
</div>
{% else %}
No posts yet.
{% endif %}

## Top Projects

- **[AI Discord Bot](https://github.com/wrathagom/ai-discord-bot)** - Discord bot for vibe-coding with Claude and Codex
- **[Big Beautiful Screens](https://github.com/wrathagom/Big-Beautiful-Screens)** - Real-time, API-drive display screens ([LIVE](https://bigbeautifulscreens.com))
- **[Analytical Ecosystem](https://github.com/wrathagom/analytical-ecosystem)** - Easy-start Dockerized ecosystems of data tools
- **[Life Calendar](https://github.com/wrathagom/life-calendar)** - Visual life calendar in weeks ([LIVE](https://calebmkeller.com/life-calendar/))
- **[Generative Art](https://github.com/wrathagom/generative-art)** - Creative coding experiments with generative art ([LIVE](https://calebmkeller.com/generative-art/))

<div class="section-link">
  <a href="/projects">View all projects &rarr;</a>
</div>
