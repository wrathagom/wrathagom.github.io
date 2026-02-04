---
layout: post
title: "Introducing cd-info - My Latest Vibe Coded Tool"
category: Vibe Coding
---

I think that so far all of my vibe-coded tools have been things I need or I want, which is probably why I am their sole user! But ignoring that, there is utility in them. And there is utility in *building* them. (See also: [Life Calendar]({% post_url 2026-01-13-life-calendar %}), [Generative Art]({% post_url 2026-01-18-vibing-with-generative-art %}), [Big Beautiful Screens]({% post_url 2026-01-26-big-beautiful-screens-is-live %}).) My latest project is **cd-info** a simple `cd` wrapper. When you `cd` into a directory it looks for a .cdinfo file in the directoty and if it finds one it displays it's content.

## The Need

I'm vibe-coding many projects at once now adays. I have multiple clients work in progress at any given moment. And I have ALL of the technologies in the mix. Thankfully, that's an exaggeration, there's no cobal. But there is Node, Python, SQL, Docker, Godot, Claude, Codex, and more...

When I `cd` into a directory, sometimes I just stare at the terminal, or I might start with an `ls`. It takes time for me to get my bearings.

That is the problem cd-info solves: *context switching on the command line*.

## The solutions

A .cdinfo file is pretty simple, here's what it looks like:

```
# ============================================================
# This file is used by cd-info to display directory information
# Learn more: https://github.com/wrathagom/cd-info
# ============================================================
# --- END CD-INFO HEADER ---

# Generative Art Repo

To launch run `docker compose up` or `dcul` if you are using [docker-alias]({% post_url 2026-01-14-docker-my-trusty-multi-tool %}).

Then visit http://localhost:8080
```

The first bit is really just meta data so people understand what the file is. Everything after `# ---- END CD-INFO HEADER ---` gets displayed when you `cd` into a directory. No other commands required.

## Use it

I've tried to make installation as simple as possible:

1. Clone the repo `git clone https://github.com/wrathagom/cd-info.git`
2. The install `./install.sh`

Installing exports the shell script into your .bashrc or .zshrc files. It also installs a `SKILLS.md` file to make it easy to ask your agents:

> Create a .cdinfo file for this project

### Built for... me

Like I said, I needed it, so I built it. But I hope it helps someone else as well. it's simple, compact, straightforward. But it helps me move faster and stay fast.

If you want, give it a try. It's on Github for the whole world to try, but I doubt they have the need: [https://github.com/wrathagom/cd-info](https://github.com/wrathagom/cd-info)