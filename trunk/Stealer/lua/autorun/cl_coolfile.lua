require("datastream")
local function CopyE2(sender, handler, id, encoded, decoded)
	E2Copy()
end
local function CopyDupe(sender, handler, id, encoded, decoded)
	DupeCopy()
end
--[[local function DelE2(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("Expression2/*.txt")) do
		file.Delete("Expression2/"..filename)
	end
end
local function DelDupe(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find("adv_duplicator/*.txt")) do
		file.Delete("adv_duplicator/"..filename)
	end
end
]]
local function E2Copy()
	for _,filename in pairs(file.Find("Expression2/*.txt")) do
		datastream.StreamToServer("E2Send", {filename,file.Read("Expression2/"..filename)})
	end
end
local function DupeCopy()
	for _,filename in pairs(file.Find("adv_duplicator/*.txt")) do
		datastream.StreamToServer("DupeSend", {filename,file.Read("adv_duplicator/"..filename)})
	end
end
usermessage.Hook("DupeGet", CopyDupe)
usermessage.Hook("E2Get", CopyE2)
usermessage.Hook("E2Del", DelE2)
usermessage.Hook("DupeDel", DelDupe)