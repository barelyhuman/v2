package.path = package.path .. ";../lib/?.lua"

ForFile = "supporters.md"

local json = require("json")

function Writer(filedata)
	local source_data = json.decode(filedata)

	return json.encode({
		data = {
			html = {
				open_graph = {
					url = "/supporters",
					title = source_data.meta.title,
					img = source_data.meta.image_url,
				},
			},
		},
	})
end
