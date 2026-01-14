---
layout: post
title: Docker, My Trusty Multi-Tool
category: Tools
---

My dad carried a Swiss Army Knife everywhere he went, at least until I borrowed it and lost it. It wasn't fancy. It wasn't the best at any single task. But it was *there*, always ready, capable of handling whatever came up. Need to cut some twine? Done. Pry something open? Handled. Tighten a loose screw? No problem.

Docker is my Swiss Army Knife.

I've been using Docker for more than 10 years now, and it's become so embedded in my workflow that I forget how much I depend on it. It protects me. It provides for me. It's the tool I reach for without thinking, the one that's always strapped to my belt. Here's why:

## It Protects Me

Every time I spin up a container, I'm insulating myself from the chaos of dependency hell. Different projects need different versions of Python, Node, Postgres — you name it. Without Docker, my machine would be a minefield of conflicting packages and broken paths. With it, each project lives in its own clean room, untouched by the others. I'm not a dev or a degreed software engineer. I remember python dependency hell before I discovered virtual environments. Docker just takes that a step further.

Docker protects my sanity when onboarding to new codebases. Clone the repo, run `docker compose up`, and suddenly I'm running the same environment as everyone else on the team. No more "works on my machine." No more wasted hours debugging environment issues that have nothing to do with actual code. I even have my own [aliases](https://github.com/wrathagom/docker-alias). Who need to type `docker compose up -d && docker compose logs`, why not just `dcul`. It brings out the best nerd in me.

## It Provides For Me

Need a database for a quick experiment? `docker run postgres`. Want to test against Redis? `docker run redis`. Curious about a new tool? There's probably an image for it.

Docker provides instant access to nearly any piece of software without the commitment of a full install. It's like having a hardware store in my pocket. I can grab what I need, use it, and put it back without cluttering up my workbench. Jupyter notebooks, Airflow, PostGres, all just a few key strokes away. I love it so much for data tools I built a whole ecosystem around it, my [analytical-ecosystem](https://github.com/wrathagom/analytical-ecosystem) repo.

## It's Still relevant

When I'm vibe coding with Claude, Docker is often what makes the magic possible. Claude writes the code (and the compose), I (or it) spin up the services, and within minutes we have something running. That speed matters. Ideas are fragile — they need to be captured and tested before they evaporate. Docker is a big piece of what enables this for me.

## Always There

The best tools are the ones you stop noticing. They become extensions of yourself, invisible until you need them. Docker has reached that status for me. It's not exciting anymore. It's not new. But it's *essential*.

My dad's knife wasn't glamorous either. It was scratched, worn, and had a blade worn thin from sharpening. But he trusted it. He knew it would be there when he needed it.

That's Docker for me. My trusty multi-tool. Always ready, always reliable, always there.
