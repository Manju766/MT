 #initilizing credential object
    $Username = "rfg\malleman"
    $Password = ConvertTo-SecureString ‘Realogy.2’ -AsPlainText -Force
    $cred = New-Object System.Management.Automation.PSCredential $Username, $Password
    
#below code is to create package
    #Package path 
    $packagepath="C:\Working_Directory\Deployment\Pre-QA_Builds\DashMain_MT"
   

    #$dir = "C:\Working_Directory"
    $latest = Get-ChildItem -Path $packagepath | Sort-Object LastAccessTime -Descending | Select-Object -First 1
    $latest.Name
   
    if($latest.Name -match "$((Get-Date).ToString('yyyy-MM-dd'))_MT")
    
    {
       [int]$substr=$latest.Name.Substring(14)
      
       $incre=$substr+1
      

        $path=New-Item -ItemType Directory -Path "C:\Working_Directory\Deployment\Pre-QA_Builds\DashMain_MT\$((Get-Date).ToString('yyyy-MM-dd'))_MT-$incre" -force
        
             
    
    }
    else
    {
        $path=New-Item -ItemType Directory -Path "C:\Working_Directory\Deployment\Pre-QA_Builds\DashMain_MT\$((Get-Date).ToString('yyyy-MM-dd'))_MT" -force
       
    }

   
    Copy "C:\Program Files\Jenkins\workspace\dashMain-M05_MT\bin\_PublishedWebsites\Host\*" $path -Force -Recurse
    
  Remove-Item $path\Web.config

   
  Write-Host "-------------------------New package has been $path Created for MT With Published code----------------------------" -ForegroundColor DarkYellow
   
