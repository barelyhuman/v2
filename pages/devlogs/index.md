# Developer Logs

<ul class="p-0 px-0">
<hr class="h-1 border-light"/>
{{range .Data.devlogs.pages}}
<li class="flex gap-3 justify-between items-start py-4 flex-direction">
<a class="text-gray !hover:no-underline !no-underline hover:text-dark" href="{{print  "#" .slug}}">
<div class="inline-block" class="date">{{.formatteddate}}</div>
</a>
<div class="inline-block">{{.content}}</div>
</li>
{{end}}
</ul>
