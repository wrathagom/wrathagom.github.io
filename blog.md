---
layout: default
title: Blog
---

# Blog

{% assign sorted_categories = site.categories | sort %}
{% if sorted_categories.size > 0 %}
<nav class="category-nav" aria-label="Categories">
  <h2>Browse by category</h2>
  <div class="category-list">
    <a class="category-tag category-nav-tag" href="#category=all">All</a>
  {% for category in sorted_categories %}
    {% assign category_name = category[0] %}
    {% assign category_posts = category[1] %}
    <a class="category-tag category-nav-tag" href="#category={{ category_name | slugify }}" data-category="{{ category_name | slugify }}">
      {{ category_name }} <span class="category-count">{{ category_posts | size }}</span>
    </a>
  {% endfor %}
  </div>
</nav>
{% endif %}

<ul class="post-list">
{% for post in site.posts %}
  <li data-category="{{ post.category | slugify }}">
    <time datetime="{{ post.date | date_to_xmlschema }}">{{ post.date | date: "%Y-%m-%d" }}</time>
    {% if post.category %}<a class="category-tag" href="#category={{ post.category | slugify }}">{{ post.category }}</a>{% endif %}
    <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
    <p>{{ post.excerpt | strip_html | truncate: 160 }}</p>
  </li>
{% endfor %}
</ul>

{% if sorted_categories.size > 0 %}
<script>
  (() => {
    const posts = Array.from(document.querySelectorAll(".post-list li"));
    const tags = Array.from(document.querySelectorAll(".category-nav-tag"));
    const normalize = (value) => (value || "").replace(/^category=/, "");
    const setActive = (slug) => {
      tags.forEach((tag) => {
        const tagSlug = tag.dataset.category || "all";
        tag.classList.toggle("category-tag--active", tagSlug === slug);
      });
    };
    const applyFilter = () => {
      const hash = normalize(location.hash.replace(/^#/, ""));
      const active = hash || "all";
      posts.forEach((post) => {
        const postCategory = post.dataset.category || "";
        const show = active === "all" || postCategory === active;
        post.style.display = show ? "" : "none";
      });
      setActive(active);
    };
    applyFilter();
    window.addEventListener("hashchange", applyFilter);
  })();
</script>
{% endif %}

{% if site.posts.size == 0 %}
<p>No posts yet.</p>
{% endif %}
