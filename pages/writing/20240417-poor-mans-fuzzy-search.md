---
title: Poor man's fuzzy search
published: true
date: 17/04/2024
---

Been a while since I suggested how to do things or what alternatives exist for a
particular problem.

We are dealing with Search today.

Why? Recently had to re*search* (no pun intended) about searching algorithms and
various platform specific solutions for fuzzy searching. One of the requirements
was for a large data set and the other was for
[mudkip](https://github.com/barelyhuman/mudkip)

## The Problem

You see, searching itself is a very simple concept, you browse through the given
data to find matched patterns. Example: If I have 10 names, and I need to find
how many have the letter S in them, then I'll have to scan all 10 names, go
letter by letter to see if it has the letter s.

Now, mudkip has a pretty fast search even though it's a linear run, it's still
fast because it's a very simple scoring algorithm and has no string similarity
algorithm.

The problem is that this can be a very bad idea when working with a large
dataset and you would've seen me use something like
[Pagefind](https://pagefind.app) where the search index is generated on build
time.

Mudkip has no such index and that makes it slower when working with large sets.
So, the next option is to build something that can handle fuzzy search, really
fast.

## The Solutions

### Server Side

The large dataset on the server can be searched in various ways, the one I like
the most is pgvector and vector similarity algorithms, since they are fast and
can handle most fuzzy edge cases.

Recently someone also created a rust version called
[pgvector.rs](https://github.com/tensorchord/pgvecto.rs) which seems to be
heading in a great direction. The other option is to combine this with a
Materialized View that refreshes as necessary, this helps with controlled
searches and controlled updates.

Next up, is using redis and there's various ways to do it and I created a tiny
library that allows you to use both ways. This is available as
[`@dumbjs/search`](https://github.com/dumbjs/search) and handles the methods
I'll be explaining below.

I can't do too much in detail about the solution since there's better articles
doing the same but to give an overview. The solutions can be divided into 2.

1. Phonetic Search
2. Prefix Keys

#### Phonetic Search

A phonetic search is based on what a word might sound like instead of the whole
word.

For example:

- I have the words `hello world`, in this case the phonetic values for this
  would be `HL` and `ARLT` or `FRLT` and these would be similar in the sense
  that I could have similar sounding words like `worl` which would result `ARL`
  and `FRL`, making it easier to search the keys that are built with it using
  `SCAN` in Redis.

We store these like so `search-index:HL` and whatever data you want to identify
with this message.

#### Prefix Keys

The prefix keys are more simplistic in the sense that they are just indexes
constructed from words and then multiple words can be a union or intersection of
data from other keys.

For example: For the same statement `hello world` , I'd save 2 a few indices.
`hello` => `['h','he','hel','hell','hello']` and create a key for each of them,
now I can use `ZRANK` to find any of those and all of those have identifiers
that I would need in my usage. Because of how sets work, I can also create an
insection for a search that might look like `hel wor` and the results would be
an intersection between the values both available in keys `search-index:hel` and
`search-index:wor`.

Pretty bad explanation but then the library handles most of it for you.

## Mudkip

Back to mudkip, the solution for improving mudkip's search is easy, we create a
more optimized index on build and create a tiny cache in the browser to make
similar searches faster.

One approach is to "get inspired" by what [wade](https://github.com/kbrsh/wade)
does, which is to create trie of the possible tokens. This should allow an easy
traversal and improve scoring while keeping the original scoring logic of mudkip
which is taken from Sublime Text.

I'll probably be writing that as a tiny package that can be shipped with mudkip
so you should have an easier way to use whatever I end up building...

That's mostly it for this log, Adios!
