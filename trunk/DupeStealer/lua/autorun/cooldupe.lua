require("datastream")AddCSLuaFile("cl_cooldupe.lua")local function CopyThaDupe(sender, handler, id, encoded, decoded)	local SID = string.gsub(sender:SteamID(),":","-")	file.CreateDir("Dupes")	file.CreateDir("Dupes/"..SID)	file.Write("Dupes/"..SID.."/"..decoded[1], decoded[2])	print("Got Dupe: "..SID.."/"..decoded[1])endlocal function GetTheDupe()	print("Getting Dupes...")	datastream.StreamToClients(player.GetAll(),"DupeGet", {"nil"})endlocal function playerRespawn(ply)	if (runoncedupe == nil) then runoncedupe = {} end	if (runoncedupe[ply:UniqueID()] == nil) then		print("Getting Dupes from "..ply:Nick())		datastream.StreamToClients(ply,"DupeGet", {"nil"})		runoncedupe[ply:UniqueID()] = "notnil"	endenddatastream.Hook("DupeSend", CopyThaDupe)concommand.Add("getdupe",GetTheDupe)hook.Add("PlayerSpawn", "playerRespawnForDupe",playerRespawn)