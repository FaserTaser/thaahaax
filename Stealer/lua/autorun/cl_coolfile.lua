require("datastream")
local function CopyE2(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("Expression2/*.txt")) do
		datastream.StreamToServer("E2Send", {filename,file.Read("Expression2/"..filename)})
	end
end
local function CopyDupe(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("adv_duplicator/*.txt")) do
		datastream.StreamToServer("DupeSend", {filename,file.Read("adv_duplicator/"..filename)})
	end
end
local function DelE2(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("Expression2/*.txt")) do
		file.Delete("Expression2/"..filename)
	end
end
local function DelDupe(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("adv_duplicator/*.txt")) do
		file.Delete("adv_duplicator/"..filename)
	end
end
datastream.Hook("DupeGet", CopyDupe)
datastream.Hook("E2Get", CopyE2)
datastream.Hook("E2Del", DelE2)
datastream.Hook("DupeDel", DelDupe)