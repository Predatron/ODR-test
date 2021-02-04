
local odr = require("plugin.onDemandResources")

local feed = {}

local function textFeed(txt)
	
	for i = 1, #feed do
		
		local txt_obj = feed[i]
		
		txt_obj.y = txt_obj.y - 30
		
	end
	
	if #feed > 40 then
		feed[#feed]:removeSelf()
		feed[#feed] = nil
	end
	
	local options = {
		text = txt,
		x = 50,
		y = display.contentHeight - 100,
		font = native.systemFont,
	}
	
	local new_line = display.newText(options)
	
	new_line.anchorX = 0
	
	table.insert(feed, 1, new_line)
	
end

local function odrListener(event)
	
	for key, value in pairs(event) do
		
		textFeed(key.." - "..tostring(value))
		
	end
	
end

textFeed("Requesting cw_preview")
odr.request( "cw_preview", odrListener )


