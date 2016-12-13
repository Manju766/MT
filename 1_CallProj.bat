C:
cd/


cd Windows\Microsoft.NET\Framework\

cd v4.0.30319

@set LogPath=%BatchPath%%year%%month%%day%
msbuild.exe "C:\Working_Directory\CodeRepository\AutomationScripts\DASH_M05_Automation\Dash_M05_MT\DashMT_Build.proj" 




pause