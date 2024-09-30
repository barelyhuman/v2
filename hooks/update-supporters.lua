package.path = package.path .. ";../lib/?.lua"

local http = require("http")
local json = require("json")

ForFile = "supporters.md"

local gh_url = "https://ghs.vercel.app/v3/sponsors/barelyhuman"

local function get_sponsor_names()
	local response, error_message = http.get(gh_url)
	local body_json = json.decode(response.body)
	return body_json.sponsors
end

function Writer(filedata)
	local source_data = json.decode(filedata)
	local sponsors = get_sponsor_names()
	return json.encode({
		data = {
			sponsors = {
				current = sponsors.current,
				past = sponsors.past
			},
			html = {
				title = source_data.meta.title,
				description = source_data.meta.description,
				open_graph = {
					url = "/supporters",
					title = source_data.meta.title,
					img = source_data.meta.image_url,
				},
			},
		},
	})
end
