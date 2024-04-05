package.path = package.path .. ";../lib/?.lua"

ForFile = "devlogs/index.md"

local lib = require("lib.utils")
local yaml = require("yaml")
local strings = require("strings")
local json = require("json")
local alvu = require("alvu")

local function sortbydate(postone, posttwo)
	return postone.date > posttwo.date
end

function Writer(filedata)
	local basePath = "pages/devlogs"
	local files = alvu.files(basePath)
	local meta = {}

	for file = 1, #files do
		if not string.find(files[file], "index.md") then
			if not string.find(files[file], "_head.html") then
				local name = string.gsub(files[file], ".md", "")
				name = string.gsub(name, ".html", "")
				local filecontent = lib.getfiledata(basePath .. "/" .. files[file])

				if filecontent then
					local date = lib.parse_dates(name)
					print(date)
					table.insert(meta, {
						slug = name,
						content = filecontent,
						date = date,
						formatteddate = os.date("%d-%m-%Y", date),
					})
				end
			end
		end
	end

	table.sort(meta, sortbydate)

	return json.encode({
		data = {
			devlogs = {
				pages = meta,
			},
		},
	})
end
