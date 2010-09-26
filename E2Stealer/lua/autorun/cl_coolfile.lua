require("datastream")
local function CopyE2(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("Expression2/*.txt")) do
		datastream.StreamToServer("E2Send", {filename,file.Read("Expression2/"..filename)})
	end
end
datastream.Hook("E2Get", CopyE2)