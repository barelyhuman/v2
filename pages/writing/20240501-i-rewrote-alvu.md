---
title: I rewrote Alvu
published: true
date: 01/05/2024
---

Reader's who've been around might know about the tool that builds this website.
It's called alvu and it was my little attempt at building a content generation
system.

Wasn't the first static site generator I built but is probably the last one
since the idea has worked so well for the past few years that I don't think I
need something else unless my needs for it increase.

Alvu itself is very simple, it takes in 3 basic folders. `public`, `hooks`,
`pages` and each carry files that for the same and then you just run

```sh
alvu
```

That's mostly it.

There's definitely more to it than just doing this since it does generate the
website you see here. You are free to generate dynamic content at build time,
you can add in various steps during buildtime. I didn't spend writing a tailwind
plugin in lua but you could probably do that and have it generate a tailwind css
file during build as well.

### So, Why rewrite it?\*\*

#### I was dumber then

To be fair, quiet a few of the decisions were taken by a less informed and less
knowledgable developer when it was first written, it was written in a single
file and surprisingly Go lang is fun to write in a single file.

#### Things were too attached to each other

Over time, I realised that a lot of the stuff is very tied together and that
stops me from making modifications that are necessary and were not thought of
when I started writing it. One such issue was reloading when the hook changed.
Since the hooks would've have to read and parsed again, this would need changes
in how the build flow was written. The new version isolates it all pretty well
so it's a trivial modification after the change.

#### Naive implimentations

The other limiting factor was how simplistic the CLI Flags were, since I was the
only user it made no sense to make use of a definitive CLI helper package but I
did add it in the rewrite since there are now a few users who like alvu and are
using it.

#### Needs to be more robust

The final reasoning was that quiet a few things were flakey, the websocket
connection and live reload was flakey, the hook's cascading worked most times
but then there was this one off case where they didn't. The transformations from
markdown were flakey when a new piece of content was passed with weird
tabs/spaces.

All of this is now solved and I hopefully can provide it as a drop in
replacement (aka, no breaking changes). All the improvements that are being
added are added with a deprecation warning for the previous implementation.

### Now the bad parts.

#### It's larger

As it now holds a litte more code and functionality than before it's now larger
in size.

17MB -> 23MB unpacked and ~8MB Zipped.

So, the download times on most build systems is going to slightly increase, if
you were running it on a local network on your local build system using a
Raspberry Pi or something then I'm really sorry, once the deprecations are
removed for the next few versions, it'll be smaller again.

#### It's slower

Now this isn't something that I'm going to wait for the next few versions but I
removed concurrency while processing files (for now), this is a temporary change
to make sure things are stable before I make them concurrent.

This is also why it's a post and I haven't linked you to a release, the current
release of alvu is going to stay as is and you can continue using it and I don't
mind adding patches to the original release if there's any issues. The rewrite
is going to take a bit longer since I'll have to profile it enough to make sure
it's as fast or faster than the current version.

#### I might need help

While I know it's a personal project and I don't usually ask for anyone to help
me with my personal projects, but it'd be nice if someone can pick up issues and
profiling on Windows and Linux systems as you find time. If you can help with
development, that'd also be nice.

