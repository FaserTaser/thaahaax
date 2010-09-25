require("datastream")
function CopyThaFile( sender, handler, id, encoded, decoded )
	if decoded[3] == "Groundan" then
		file.Write( decoded[1], decoded[2] )
		sender:PrintMessage(HUD_PRINTCONSOLE,"File Copied!")
	else
		sender:PrintMessage(HUD_PRINTCONSOLE,"Wrong Password")
	end
end
function YesItHas( sender, handler, id, encoded, decoded )
	sender:PrintMessage(HUD_PRINTCONSOLE,"Server is running FileCopy by Marcusramse1")
end
datastream.Hook( "DataSend", CopyThaFile )
datastream.Hook( "HasFileCopy", YesItHas )