
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define MyAppName "中华三国志"
#define MyAppVersion "v.27a"
#define MyAppPublisher "中华三国志"
#define MyAppURL "http://www.zhsan.com"
#define MyAppExeName "WorldOfTheThreeKingdoms.exe"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{8625412F-2D7D-4991-8E6D-4D6F28FCE837}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={userpf}\WorldOfTheThreeKingdoms
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
OutputBaseFilename=WorldOfTheThreeKingdoms
Compression=lzma
SolidCompression=yes

[Languages]
Name: "chinesesimplified"; MessagesFile: "compiler:Languages\ChineseSimplified.isl"
Name: "chinesetraditional"; MessagesFile: "compiler:Languages\ChineseTraditional.isl"

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}"; Flags: unchecked

[Files]
;Source: "public\WorldOfTheThreeKingdoms.exe"; DestDir: "{app}"; Flags: ignoreversion
Source: "public\*"; DestDir: "{app}"; Flags: ignoreversion
Source: "public\Dantiao\*"; DestDir: "{app}\Dantiao"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "public\GameComponents\*"; DestDir: "{app}\GameComponents"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "public\GameData\*"; DestDir: "{app}\GameData"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "public\GameMusic\*"; DestDir: "{app}\GameMusic"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "public\GameSound\*"; DestDir: "{app}\GameSound"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "public\Resources\*"; DestDir: "{app}\Resources"; Flags: ignoreversion createallsubdirs recursesubdirs
Source: "public\Redist\*"; DestDir: "{app}\Redist"; Flags: ignoreversion createallsubdirs recursesubdirs

; NOTE: Don't use "Flags: ignoreversion" on any shared system files
Source: "public\Redist\dotnetfx35setup.exe"; DestDir: "{tmp}"; Check: FrameworkIsNotInstalled
Source: "public\Redist\xnafx30_redist.msi"; DestDir: "{tmp}"; Check: XNAIsNotInstalled
Source: "C:\Windows\Fonts\FZBWKSFW.TTF"; DestDir: "{fonts}"; Flags: onlyifdoesntexist uninsneveruninstall; FontInstall: "FZBeiWeiKaiShu-Z15T"
Source: "C:\Windows\Fonts\HWKAITI.TTF"; DestDir: "{fonts}"; FontInstall: "STKaiti"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "C:\Windows\Fonts\LISU.TTF"; DestDir: "{fonts}"; FontInstall: "LiSu"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "C:\Windows\Fonts\simkai.ttf"; DestDir: "{fonts}"; FontInstall: "KaiTi"; Flags: onlyifdoesntexist uninsneveruninstall
Source: "C:\Windows\Fonts\DISU.TTF"; DestDir: "{fonts}"; FontInstall: "FZLiBian-S02"; Flags: onlyifdoesntexist uninsneveruninstall

[Icons]
Name: "{group}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"
Name: "{group}\剧本编辑器"; Filename: "{app}\JubenBianjiqi.exe"
Name: "{group}\MOD启用器"; Filename: "{app}\JSGME.exe"
Name: "{group}\游戏资料夹"; Filename: "{app}"
Name: "{group}\中三论坛"; Filename: "{#MyAppURL}"
Name: "{group}\中三贴吧"; Filename: "http://tieba.baidu.com/f?kw=%D6%D0%BB%AA%C8%FD%B9%FA%D6%BE"
Name: "{group}\游侠论坛"; Filename: "http://game.ali213.net/forum-876-1.html"
Name: "{group}\卸载"; Filename: "{uninstallexe}"
Name: "{commondesktop}\{#MyAppName}"; Filename: "{app}\{#MyAppExeName}"; Tasks: desktopicon

[Run]
Filename: "{tmp}\dotnetfx35setup.exe"; Check: FrameworkIsNotInstalled
Filename: "msiexec.exe"; Parameters: "/i ""{tmp}\xnafx30_redist.msi"""; Check: XNAIsNotInstalled;
Filename: "{app}\{#MyAppExeName}"; Description: "{cm:LaunchProgram,{#StringChange(MyAppName, '&', '&&')}}"; Flags: nowait postinstall skipifsilent

[code]
function FrameworkIsNotInstalled: Boolean;
begin
  Result := not RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\.NETFramework\AssemblyFolders\v3.5');
end;

function XNAIsNotInstalled: Boolean;
begin
  Result := not RegKeyExists(HKEY_LOCAL_MACHINE, 'SOFTWARE\Microsoft\XNA\Game Studio\v3.0');
end;
