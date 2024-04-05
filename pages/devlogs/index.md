# Developer Logs

<ul class="p-0 px-0">
<hr class="h-1 border-light"/>
{{range .Data.devlogs.pages}}
<li class="flex flex-col flex-wrap gap-3 justify-between items-start py-4 sm:flex-row">
<div class="block">
<a class="text-gray !hover:no-underline !no-underline hover:text-dark" href="{{print  "#" .slug}}">
    <div class="date">{{.formatteddate}}</div>
</a>
</div>
<div class="flex-1">{{.content}}</div>
</li>
{{end}}
</ul>
