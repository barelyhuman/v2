# Writing

<div class="flex items-center justify-end gap-3">
    <a href="{{.Meta.BaseURL}}rss.xml">
        RSS
    </a>
    <a href="/devlogs">
        Dev Logs &rarr;
    </a>
</div>
<ul class="p-0 px-0">
<hr class="h-1 border-light"/>
{{range .Data.writing.pages}}
<li class="flex items-center justify-between gap-3 py-4 flex-direction">
<a class="text-gray !hover:no-underline !no-underline hover:text-dark" href="{{print  "/writing/" .slug}}">
<div class="inline-block">{{.title}}</div>
</br>
<div class="inline-block" class="date">{{.formatteddate}}</div>
</a>
</li>
{{end}}
</ul>
