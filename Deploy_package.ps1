#backup the Code before Deployment

$a="MT"
#write-host $a
$Dest_path="\\mad-rfg-dvdshw2\DashApps\DASH_MT_M05\V4\"
$path=New-Item -ItemType Directory -Path "\\10.248.9.25\BackUP\$((Get-Date).ToString('yyyy-MM-dd'))-$a" -force
copy $Dest_path $path -force -recurse  
Get-ChildItem  $path >\\10.248.9.25\Logs\"MT-$((Get-Date).ToString('yyyy-MM-dd'))-Log.txt"
Write-Host "------------------------- $a Logs are Copied to \\10.248.9.25\Logs----------------------------" -ForegroundColor Cyan
 Write-Host " " -NoNewline
    Write-Host " " -NoNewline

 Write-Host "***********Code Backup has been Completed Sucessfuly****************" -BackgroundColor Red -ForegroundColor Yellow




#create active credential object
    $Username = "rfg\malleman"
    $Password = ConvertTo-SecureString ‘Realogy.2’ -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential $Username, $Password


#Package path 
Write-Host "***********Package Deployment is in Progress****************" -BackgroundColor Green -ForegroundColor Yellow
    $packagepath="C:\Working_Directory\Deployment\Pre-QA_Builds\DashMain_MT\"

$latest = Get-ChildItem -Path $packagepath | Sort-Object LastAccessTime -Descending | Select-Object -First 1

Copy-Item $packagepath\$latest\* \\mad-rfg-dvdshw2\DashApps\DASH_MT_M05\V4\dash_MT\ -force -recurse



Write-Host "***********Package Deployment has been Completed****************" -BackgroundColor Green -ForegroundColor Yellow