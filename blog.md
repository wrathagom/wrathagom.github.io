---
layout: default
title: Blog
---

# Blog

{% assign sorted_categories = site.categories | sort %}
{% if sorted_categories.size > 0 %}
<nav class="category-nav" aria-label="Categories">
  <h2>Jump to a category</h2>
  <ul class="category-list">
  {% for category in sorted_categories %}
    {% assign category_name = category[0] %}
    {% assign category_posts = category[1] %}
    <li>
      <a href="#category-{{ category_name | slugify }}">{{ category_name }}</a>
      <span class="category-count">{{ category_posts | size }}</span>
    </li>
  {% endfor %}
  </ul>
</nav>
{% endif %}

{% if sorted_categories.size > 0 %}
  {% for category in sorted_categories %}
    {% assign category_name = category[0] %}
    {% assign category_posts = category[1] %}
    <section class="category-section" id="category-{{ category_name | slugify }}">
      <h2>{{ category_name }}</h2>
      <ul class="post-list">
      {% for post in category_posts %}
        <li>
          <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
          {% if post.category %}<span class="category-tag">{{ post.category }}</span>{% endif %}
          <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
          <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
        </li>
      {% endfor %}
      </ul>
    </section>
  {% endfor %}
{% else %}
  <ul class="post-list">
  {% for post in site.posts %}
    <li>
      <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
      {% if post.category %}<span class="category-tag">{{ post.category }}</span>{% endif %}
      <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
      <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
    </li>
  {% endfor %}
  </ul>
{% endif %}

{% if site.posts.size == 0 %}
<p>No posts yet.</p>
{% endif %}
