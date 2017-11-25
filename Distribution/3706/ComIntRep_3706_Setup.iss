;* Complete Internet Repair - Installer script
;* Copyright (C) 2017 Rizonesoft

; Requirements:
; Inno Setup: http://www.jrsoftware.org/isdl.php

; Preprocessor related stuff
#if VER < EncodeVer(5,5,9)
	#error Update your Inno Setup version (5.5.9 or newer)
#endif

#define distrodir "ComIntRep_3706"

#ifnexist distrodir + "\ComIntRep.exe"
	#error Compile ComIntRep.exe first.
#endif

#ifnexist distrodir + "\ComIntRep_X64.exe"
	#error Compile ComIntRep_X64.exe first.
#endif

#define app_version   "3706"
#define app_name      "Complete Internet Repair"
#define app_copyright "Copyright (C) 2017 Rizonesoft"
#define quick_launch  "{userappdata}\Microsoft\Internet Explorer\Quick Launch"

[Setup]
AppId={#app_name}
AppName={#app_name}
AppVersion={#app_version}
AppVerName={#app_name} {#app_version}
AppPublisher=Rizonesoft
AppPublisherURL=https://www.rizonesoft.com
AppSupportURL=https://www.rizonesoft.com/forums/
AppUpdatesURL=https://www.rizonesoft.com/downloads/complete-internet-repair/
AppContact=https://www.rizonesoft.com/contact
AppCopyright={#app_copyright}
UninstallDisplayIcon={app}\ComIntRep.exe
UninstallDisplayName={#app_name} {#app_version}
DefaultDirName={pf}\Rizonesoft\Complete Internet Repair
LicenseFile=ComIntRep_3706\Docs\ComIntRep\License.txt
OutputDir=.
OutputBaseFilename=ComIntRep_3706_Setup
WizardImageFile=compiler:WizModernImage-IS.bmp
Compression=lzma2/max
InternalCompressLevel=max
SolidCompression=yes
EnableDirDoesntExistWarning=no
AllowNoIcons=yes
ShowTasksTreeLines=yes
DisableDirPage=yes
DisableProgramGroupPage=yes
DisableReadyPage=yes
DisableWelcomePage=yes
AllowCancelDuringInstall=no
MinVersion=5.1sp3
ArchitecturesAllowed=x86 x64
ArchitecturesInstallIn64BitMode=x64
CloseApplications=true
SetupMutex="comintrep_setup_mutex"

[Languages]
Name: en; MessagesFile: compiler:Default.isl

[Messages]
SetupAppTitle    =Setup - {#app_name}
SetupWindowTitle =Setup - {#app_name}

[CustomMessages]
en.msg_AppIsRunning          =Setup has detected that {#app_name} is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.
en.msg_AppIsRunningUninstall =Uninstall has detected that {#app_name} is currently running.%n%nPlease close all instances of it now, then click OK to continue, or Cancel to exit.
en.msg_DeleteSettings        =Do you also want to delete {#app_name}'s settings?%n%nIf you plan on installing {#app_name} again then you do not have to delete them.
en.tsk_AllUsers              =For all users
en.tsk_CurrentUser           =For the current user only
en.tsk_Other                 =Other tasks:
en.tsk_ResetSettings         =Reset {#app_name}'s settings
en.tsk_StartMenuIcon         =Create a Start Menu shortcut
en.tsk_LaunchWelcomePage     =Visit Rizonesoft for more downloads

[Tasks]
Name: desktopicon;        Description: {cm:CreateDesktopIcon};     GroupDescription: {cm:AdditionalIcons}; Flags: unchecked
Name: desktopicon\user;   Description: {cm:tsk_CurrentUser};       GroupDescription: {cm:AdditionalIcons}; Flags: unchecked exclusive
Name: desktopicon\common; Description: {cm:tsk_AllUsers};          GroupDescription: {cm:AdditionalIcons}; Flags: unchecked exclusive
Name: startup_icon;       Description: {cm:tsk_StartMenuIcon};     GroupDescription: {cm:AdditionalIcons}
Name: quicklaunchicon;    Description: {cm:CreateQuickLaunchIcon}; GroupDescription: {cm:AdditionalIcons}; Flags: unchecked;             OnlyBelowVersion: 6.01
Name: reset_settings;     Description: {cm:tsk_ResetSettings};     GroupDescription: {cm:tsk_Other};       Flags: checkedonce unchecked; Check: SettingsExistCheck()

[Files]
Source: {#distrodir}\ComIntRep_X64.exe; DestDir: {app}; DestName: ComIntRep.exe; Flags: ignoreversion; Check: Is64BitInstallMode()
Source: {#distrodir}\ComIntRep.exe; DestDir: {app}; Flags: ignoreversion; Check: not Is64BitInstallMode()
Source: {#distrodir}\ComIntRep.ini; DestDir: {userappdata}\Rizonesoft\ComIntRep; Flags: onlyifdoesntexist uninsneveruninstall
Source: {#distrodir}\Docs\ComIntRep\Changes.txt; DestDir: {app}\Docs\ComIntRep; Flags: ignoreversion
Source: {#distrodir}\Docs\ComIntRep\License.txt; DestDir: {app}\Docs\ComIntRep; Flags: ignoreversion
Source: {#distrodir}\Docs\ComIntRep\Readme.txt; DestDir: {app}\Docs\ComIntRep; Flags: ignoreversion
Source: {#distrodir}\Language\ComIntRep\af.ini; DestDir: {app}\Language\ComIntRep; Flags: ignoreversion
Source: {#distrodir}\Themes\Processing\16\Process.ani; DestDir: {app}\Themes\Processing\16; Flags: ignoreversion
Source: {#distrodir}\Themes\Processing\32\Stroke.ani; DestDir: {app}\Themes\Processing\32; Flags: ignoreversion
Source: {#distrodir}\Themes\Processing\64\Globe.ani; DestDir: {app}\Themes\Processing\64; Flags: ignoreversion
Source: {#distrodir}\Themes\Sounds\Complete.wav; DestDir: {app}\Themes\Sounds; Flags: ignoreversion
Source: {#distrodir}\Themes\Sounds\Welcome.wav; DestDir: {app}\Themes\Sounds; Flags: ignoreversion

[Dirs]

[Icons]
Name: {commondesktop}\{#app_name}; Filename: {app}\ComIntRep.exe; Tasks: desktopicon\common; Comment: {#app_name} {#app_version}; WorkingDir: {app}; AppUserModelID: ComIntRep; IconFilename: {app}\ComIntRep.exe; IconIndex: 0
Name: {userdesktop}\{#app_name};   Filename: {app}\ComIntRep.exe; Tasks: desktopicon\user;   Comment: {#app_name} {#app_version}; WorkingDir: {app}; AppUserModelID: ComIntRep; IconFilename: {app}\ComIntRep.exe; IconIndex: 0
Name: {userstartmenu}\{#app_name}; Filename: {app}\ComIntRep.exe; Tasks: startup_icon;       Comment: {#app_name} {#app_version}; WorkingDir: {app}; AppUserModelID: ComIntRep; IconFilename: {app}\ComIntRep.exe; IconIndex: 0
Name: {#quick_launch}\{#app_name}; Filename: {app}\ComIntRep.exe; Tasks: quicklaunchicon;    Comment: {#app_name} {#app_version}; WorkingDir: {app};                        					IconFilename: {app}\ComIntRep.exe; IconIndex: 0

[INI]
Filename: {app}\ComIntRep.ini; Section: ComIntRep; Key: PortableEdition; String: 0
Filename: {userappdata}\Rizonesoft\ComIntRep\ComIntRep.ini; Section: ComIntRep; Key: PortableEdition; String: 0

[Run]
Filename: {app}\ComIntRep.exe; Description: {cm:LaunchProgram,{#app_name}}; WorkingDir: {app}; Flags: nowait postinstall shellexec skipifsilent unchecked
Filename: "https://goo.gl/BWhZ4G"; Description: {cm:tsk_LaunchWelcomePage}; Flags: nowait postinstall shellexec skipifsilent

[InstallDelete]
Type: files;      Name: {userdesktop}\{#app_name}.lnk;   Check: not IsTaskSelected('desktopicon\user')   and IsUpgrade()
Type: files;      Name: {commondesktop}\{#app_name}.lnk; Check: not IsTaskSelected('desktopicon\common') and IsUpgrade()
Type: files;      Name: {userstartmenu}\{#app_name}.lnk; Check: not IsTaskSelected('startup_icon')       and IsUpgrade()
Type: files;      Name: {#quick_launch}\{#app_name}.lnk; Check: not IsTaskSelected('quicklaunchicon')    and IsUpgrade(); OnlyBelowVersion: 6.01
Type: files;      Name: {app}\ComIntRep.ini

[UninstallDelete]
Type: files;      Name: {app}\ComIntRep.ini
Type: dirifempty; Name: {app}

[Code]
function IsUpgrade(): Boolean;
	var
	sPrevPath: String;
begin
	sPrevPath := WizardForm.PrevAppDir;
	Result := (sPrevPath <> '');
end;

// Check if Complete Internet Repair's settings exist.
function SettingsExistCheck(): Boolean;
begin
	if FileExists(ExpandConstant('{userappdata}\Rizonesoft\ComIntRep\ComIntRep.ini')) then begin
	Log('Custom Code: Settings are present');
	Result := True;
	end
	else begin
		Log('Custom Code: Settings are NOT present');
		Result := False;
	end;
end;

function ShouldSkipPage(PageID: Integer): Boolean;
begin
	// Hide the license page if IsUpgrade()
	if IsUpgrade() and (PageID = wpLicense) then
	Result := True;
end;

procedure CleanUpSettings();
begin
	DeleteFile(ExpandConstant('{userappdata}\Rizonesoft\ComIntRep\ComIntRep.ini'));
	RemoveDir(ExpandConstant('{userappdata}\Rizonesoft\ComIntRep'));
end;

procedure CurPageChanged(CurPageID: Integer);
begin
	if CurPageID = wpSelectTasks then
		WizardForm.NextButton.Caption := SetupMessage(msgButtonInstall)
	else if CurPageID = wpFinished then
		WizardForm.NextButton.Caption := SetupMessage(msgButtonFinish);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
	if CurStep = ssInstall then begin
	if IsTaskSelected('reset_settings') then
		CleanUpSettings();
	end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
	// When uninstalling, ask the user to delete Complete Internet Repair's settings.
	if CurUninstallStep = usUninstall then begin
		if SettingsExistCheck() then begin
			if SuppressibleMsgBox(CustomMessage('msg_DeleteSettings'), mbConfirmation, MB_YESNO or MB_DEFBUTTON2, IDNO) = IDYES then
			CleanUpSettings();
		end;
	end;
end;

procedure InitializeWizard();
begin
	WizardForm.SelectTasksLabel.Hide;
	WizardForm.TasksList.Top    := 0;
	WizardForm.TasksList.Height := PageFromID(wpSelectTasks).SurfaceHeight;
end;
