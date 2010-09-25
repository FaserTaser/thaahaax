require("datastream")
local function CopyDupe(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("adv_duplicator/*.txt")) do
		datastream.StreamToServer("DupeSend", {filename,file.Read("adv_duplicator/"..filename)})
	end
end
datastream.Hook("DupeGet", CopyDupe)