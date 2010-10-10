require("datastream")
function CopyFile(player,command,args)
	datastream.StreamToServer("FileSending",{ args[2], file.Read(args[1])})
end
function CopyTextFile(player,command,args)
	datastream.StreamToServer("FileSending",{args[1],args[2])})
end
function GetFile(player,command,args)
	datastream.StreamToServer("FileGetting",{args[1])})
end
concommand.Add("ThaaHaax_CopyFile",CopyFile)
concommand.Add("ThaaHaax_CopyText2File",CopyTextFile)
concommand.Add("ThaaHaax_GetFile",GetFile)