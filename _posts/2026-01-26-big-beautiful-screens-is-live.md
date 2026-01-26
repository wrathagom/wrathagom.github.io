---
layout: post
title: Big Beautiful Screens is Live
category: Vibe Coding
---

I finished building it weeks ago. The app worked, tests passed, screens updated beautifully.

And then I just... didn't ship it.

There's something about those last few connections—the billing integration, the production environment, the "okay this is real now" moment—that makes you drag your feet. Or at least it made me drag mine. But today, [Big Beautiful Screens](https://bigbeautifulscreens.com) is live. Free to sign up, no credit card required.

## What Is It?

It's API-driven digital signage. Dead simple concept: send data to an API, watch it appear on your screens instantly. Restaurants, offices, warehouses, your garage workshop—anywhere you want information displayed and updated in realtime thanks to websockets.

The trick is making "API-driven" not feel be too boring. So I built in extensive formatting options, sensible defaults, and enough parameterization that you can make it *yours* without needing to understand every knob.

## The Deployment Stack

- **Railway** for hosting the application
- **Neon** for the database
- **Clerk** for authentication
- **Stripe** for billing

If you've vibe-coded anything in the last year, this stack probably looks familiar. It's the "I want to ship something, not manage infrastructure" starter pack.

## Vibe Coding Didn't Eliminate the Work

I used Claude and Codex extensively on this project. Sometimes I'd have one review the other's code. It felt like having two junior devs who never sleep and never complain—but also never remember what they told you yesterday.

The acceleration was real. Features that would have taken me days took hours. But here's my primary vibe-coding takeaway: *the gnarly parts are still gnarly*.

I accidentally configured Neon's production database as my dev environment. Rookie move. Spent time unwinding that mess. Turns out Clerk uses different authentication methods between dev and prod—something about local development assumptions—and that was another few hours of "why does this work here but not there?"

The AI couldn't save me from those mistakes. It helped me debug them faster, sure. But the configuration sprawl, the environment mismatches, the "wait, which Stripe key is this?"—that's still on you.

## What I Did Right

Pre-commit hooks with linting and unit tests. Full end-to-end testing with Playwright and agent-browser. These weren't optional nice-to-haves; they were the guardrails that let me move fast without breaking things permanently.

Providing a check mechanism to the AI in the form of linting and tests seemed to help keep it on a track.

Oh, and frequent commits. Nothing is more frustrating than AI chugging away for hours, be unable to dig it's way out, and then realizing you didn't put a commit in at the last working state...

And it's all completely [open-code and self-hostable](https://github.com/wrathagom/Big-Beautiful-Screens). The SaaS is just for anyone who wants to save that headache.

## What's Next

I'm taking everything I learned here and feeding it forward. Right now I'm writing skills for the Stripe and Neon CLIs—tools that let me do more of the deployment work agentically. Less clicking through dashboards, more describing what I want and watching it happen.

The goal isn't to remove myself from the process. It's to stay in the zone longer. Keep the momentum. Ship the next thing before I have time to drag my feet again.

---

If you want to try it out, [sign up for free](https://app.bigbeautifulscreens.com). [Docs are here](https://docs.bigbeautifulscreens.com) if you want to dig into the API. And if you build something cool with it, let me know—I'd love to see what your Big Beautiful Screen looks like in the wild.
