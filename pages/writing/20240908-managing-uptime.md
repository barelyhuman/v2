---
title: Managing Site Uptime and dealing with the state of urgency
published: true
date: 08/09/2024
---

We've had a our fair share of down time with the side projects that I build and
since there's not a lot of users the downtime mostly goes unnoticed unless I
need the app for something.

Recently, [goblin.run](https://goblin.run) started gaining some traction and
it's become important to have the site running all the time. The number of users
are unknown because there's no analytics on the site but the assumption that
there's a few users is based off the fact that the repository has started
gaining attention. It's also something that's displayed on `air`'s (a live
reload tool for go lang) README and I think that's the reason for the rise.

Keeping the site up isn't that hard but then there's always shit that goes south
very quickly. Things changes, environment that's running the app change, etc,
etc. An easier way is to have some kind of notification that can inform you that
somethings not working and that's basically what uptime monitoring systems are
supposed to be.

I started looking for alternatives and found a few which ranged from $7/month -
$24/month for the most basic features and then add additional and advanced
features. All these are business oriented apps so it made sense to price them
around that range but I wasn't sure if I wanted to pay that much for 1 site.

A few of them also offered a ton of features for free but I didn't really like
the whole "GIVE ME YOUR CARD!" approach for a "free" signup and so we moved onto
checking the self-hosted options.

Self hosted + OSS had much better options and were super feature packed but I
found a few written in PHP and one in Haskell that I really liked except that
would make it hard for me to fix the uptime tool itself and I'd like to avoid
that considering I'm already short on time nowadays.

After evaluating a few I decided to write something super tiny and functional to
just satisfy the need for goblin and create a tiny service called
[Ping](https://ping.barelyhuman.dev).

It's in _beta_ right now and you don't need to sign up to use it, there are
limitations to how many sites you can register for yourself but that's because
I'd like to avoid getting DOS'd as soon as it goes up. There's no catch for it
being free, I would just open the whole thing to have a 100-200 sites limit but
then servers aren't free unless DigitalOcean decides to sponsor the project
(which I don't think is happening any time soon).

The other part is that the project is a part of the
[$1 a month](https://reaper.is/supporters) movement so you are free to help
increase the overall limit. If the project does get some traction I might add a
more robust set of uptime monitoring and handling though I'm not sure how I'd
find out if it is getting traction because just like every other project I've
made, this one doesn't have analytics either (I'm both lazy and ethical at the
same time..., suck at business development though).

Though it did lead me to questioning the whole thing, what if the site is down
for a few hours, what if goblin.run doesn't build a certain binary for your
system because the version of `go` used by the CLI itself is too new and I've
not verified if the build system successfully builds it at that version of go.
Do I rush to get it back up or do I do it properly after I figure out the issue
that caused the crash in the first place?

Most people would want me to rush and just get it back up if there's a constant
crash though that shouldn't happen unless something big has changed in which
case I wouldn't actually deploy it in the first place. As a solo dev, it's
idiotic to throw changes into production without checking them locally or
running a simulator on them to verify things work. The state of urgency
shouldn't exist but in case it does happen, I need to be able to deploy faster
and fix things as fast as I can which in turn creates a gap in the development
process and you might push something that you aren't very sure of just to get
rid of the crash or system failure.

Something else that's worse could happen, the server hosting it might go down
and I would have to re-setup the whole thing again from scratch. These thoughts
led to another set of issues which deals with the simplifying the process of
deploying an app from the ground up on a new server or even sending through hot
patches. I'm still figuring out ways to make it simple and fast without relying
too much on the existing set of standards because they are slow. I'll get into
detail about the alternatives and finding in a follow up post soon.

For now, Adios!
