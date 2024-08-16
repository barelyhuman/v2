---
title: The barelyhuman.xyz crash
date: 20/06/2024
published: true
---

I don't know how long the site's have been down since I haven't had the chance
to work on any of my public projects.

If you are someone who uses any of the following for your use case or for
learning and it was down, I apologize for the downtime and they are now back up.

https://og.barelyhuman.xyz https://music.barelyhuman.xyz https://barelyhuman.dev
https://pdf.barelyhuman.xyz https://hits.barelyhuman.xyz https://minweb.site

For anyone else that'd like to know what happened to them, the short answer is
_Nothing_.

The longer one is, the in-memory pm2 process restarted during an on going
maintenance phase at digital ocean and due to a version mismatch because of the
various node versions that the server has there was a restoration conflict and
pm2 couldn't do anything to restore the processes.

This is now fixed with a system level node install with a system level pm2
install, though there's 2 node based apps on that server and both would need a
little maintenance update to avoid something like this from happening again.

All in all, my bad for not being able to keep up with my own speed of creating
and launching projects and apologies for that.
