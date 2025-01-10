---
title: Supporters
image_url: "https://reaper.is/assets/one-a-month.png"
---

[![](/assets/one-a-month.png)](https://ko-fi.com/barelyreaper)

# One a month

[One a Month Club](http://oneamonth.club) is an initiative started by
[Manu](http://manuelmoreale.com) for his People and Blog series and a lot of
people have joined the initiative to create a non gated access to content
whether you support or not.

It's a tiny support system totally based on the kindness of people and so I
wished to be a part of it as well.

# How ?

You can support me by sponsoring on one of the links below:

- [Github Sponsors](https://github.com/sponsors/barelyhuman)
- [Ko-Fi](https://ko-fi.com/barelyreaper)
- [Gumroad](https://barelyreaper.gumroad.com/coffee)

# Supporters

People that are making it possible for me to make and maintain more projects

{{if .Data.sponsors.current}}
### Current
<div class="flex flex-wrap gap-3 items-center">
{{ range .Data.sponsors.current}}
<div class="flex flex-col items-center">
    <img src="{{.avatar}}" class="w-6 h-6 rounded-full" />
    <span class="text-xs">{{.username}}</span>
</div>
{{ end }}
</div>
{{end}}

{{if .Data.sponsors.past}}
### Past
<div class="flex flex-wrap gap-3 items-center">
{{ range .Data.sponsors.past}}
<div class="flex flex-col items-center">
    <img src="{{.avatar}}" class="w-6 h-6 rounded-full" />
    <span class="text-xs">{{.username}}</span>
</div>
{{ end }}
</div>
{{ end }}