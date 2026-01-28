---
layout: post
title: "Killing Dashboards"
date: 2026-01-27
categories: data ai
---

I was a data analyst for a very long time. Fifteen years watching the same cycle repeat itself: business asks for a dashboard, analyst builds it, business uses it for a day, dashboard rots in the corner of some BI tool. Rinse, repeat.

Dashboards are the bane of any analyst's existence. Not because they're hard to build—they're not—but because they represent a fundamental misallocation of talent. We spend the precious time of data engineers, analysts, and even data scientists to create artifacts that, if we're being honest, rarely drive action.

A dashboard is only valuable if it changes behavior: if someone looks at a chart and does something different than they would have otherwise. How often does that actually happen? In my experience, dashboards become wallpaper. Pretty, expensive, ignored wallpaper. And it's helluh difficult to remove later on.

## The Real Problem

The dashboard industrial complex exists because of access. Business users can't get to the data themselves. They don't know SQL. They don't understand the data model. They can't remember which table has the right version of "revenue." So they ask an analyst, who builds a dashboard, which captures maybe 80% of what they actually wanted to know—and zero percent of the follow-up questions they'll have tomorrow.

Every analyst knows this pain. You ship a dashboard. Within a week someone asks "can you add a filter for X?" Then "can we break this down by Y?" Then "actually, I need a completely different view." The dashboard becomes a graveyard of compromise, and the analyst becomes a short-order cook instead of a strategic partner.

## What If We Just... Killed It?

I've been thinking about a platform that could make dashboards obsolete. Not by building better dashboards—that's been tried. But by fundamentally changing who has access to data and how.

Imagine something agentic. Chat-based, so we can put it in the hands of anyone and everyone. Mobile-enabled for the exec who wants numbers during their commute. Slack-enabled for the PM who lives in channels. Email-enabled for the old-school ops manager who still runs the place from their inbox.

But here's the key: built to handle all the excuses. Every data engineer has their reasons why self-service won't work. The data model is too complex. The joins are tricky. People will write bad queries and crash the warehouse. Some of those concerns are legitimate. Most are gatekeeping dressed up as technical constraints.

## Making It Actually Work

A few things would need to be true:

**Skills that guide users toward simpler queries.** Not raw SQL access, but structured pathways that help people ask questions the data can actually answer. Think of it like guardrails on a bowling lane—you can still throw the ball, but you're much more likely to hit pins.

**Rich metadata.** The AI needs to know what tables exist, what columns mean, how things join together. This is where most self-service BI has failed—the semantic layer becomes its own maintenance burden. But with good metadata, an LLM can navigate complexity that would confuse a human.

**Social features to surface the best content.** When someone asks a great question and gets a great answer, that should bubble up. Let the crowd curate what matters. Kill the static dashboard, replace it with a living feed of insights that people actually find useful.

## Let the Business Do It

This is the part that will make some analysts uncomfortable: maybe our job isn't to build dashboards. Maybe it never was.

The highest-leverage thing an analyst can do is understand the business deeply enough to ask questions no one else is asking. To spot patterns that change strategy. To be curious in ways that a chat interface can't replicate. But that requires getting out of the dashboard factory.

No more analyst-generated dashboards. Let the business generate their own answers. Give them the tools, the guardrails, and the support—and then get out of the way.

The analysts who thrive in this world won't be the ones who cling to dashboard ownership. They'll be the ones who become advisors, strategists, question-askers. The ones who realized dashboards were always a means to an end, and the end was insight.

Dashboards had a good run. Time to kill them.
