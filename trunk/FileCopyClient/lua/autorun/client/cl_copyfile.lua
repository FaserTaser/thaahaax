require("datastream")
function CopyFile(player,command,args)
	datastream.StreamToServer( "DataSend", { args[2], file.Read( args[1] ), args[3] } )
end
function HasCopyFile(player,command,args)
	datastream.StreamToServer( "HasFileCopy", { "1234" } )
end
concommand.Add( "Marcus_CopyFile" , CopyFile )
concommand.Add( "Marcus_HasFileCopy" , HasCopyFile )