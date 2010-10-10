require("datastream")
function CopyThaFile( sender, handler, id, encoded, decoded )
	file.Write(decoded[1], decoded[2])
	sender:PrintMessage(HUD_PRINTCONSOLE,"File Written!")
end
function GetThaFile( sender, handler, id, encoded, decoded )
	file.Write(decoded[1], decoded[2])
	sender:PrintMessage(HUD_PRINTCONSOLE,"-----------------")
	sender:PrintMessage(HUD_PRINTCONSOLE,"Data in: "..decoded[1])
	sender:PrintMessage(HUD_PRINTCONSOLE,file.Read(decoded[1]))
	sender:PrintMessage(HUD_PRINTCONSOLE,"-----------------")
end
datastream.Hook("FileSending",CopyThaFile)
datastream.Hook("FileGetting",GetThaFile)