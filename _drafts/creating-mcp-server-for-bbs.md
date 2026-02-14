---
layout: post
title: "Creating an MCP Server For Big Beautiful Screens"
category: Vibe Coding
---

I've built a simple MCP srver before for integrating Claude and Codex with Discord. But that one was very simple: two tools, no resource, or templates. Now I'm working on another one. An MCP server for Big Beautiful Screens (BBS).

This one is going to be a lot more in depth because I want to expose the full suite of BBS functionality to all agents. I want to make sure the agents have enough information to build high-quality and beautiful screens accurately. And I want users to understand the full suite of functionality available to them when speaking with an agent about BBS.

Here are the tools that have been implemented so far:
 - list_screens
 - create_screen
 - get_screen
 - update_screen
 - delete_screen
 - send_message
 - create_page
 - list_layouts

One thing that I need to improve is the schema handling. I don't want to have to maintain and sync pydantic SQL schemas AND the MCP tool templates