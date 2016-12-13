  @echo off
   ====================================================
   ::MODIFY THIS SECTION TO POINT TO DEPLOYMENT FOLDER
   ====================================================
   ::Get the folder from where the script was launched.
  ::Get the current batch file's short path
  for %%x in (%0) do set BatchPath=%%~dpsx
  for %%x in (%BatchPath%) do set BatchPath=%%~dpsx

  @SET DEPLOYMENT=C:\Working_Directory\Deployment\Temp\

  for /f "tokens=1-4 delims=/ " %%i in ("%date%") do (
    set dow=%%i
    set month=%%j
    set day=%%k
    set year=%%l
  )

  @set LogPath=%BatchPath%%year%%month%%day%
  echo BatchPath = %BatchPath%
  echo LogPath = %LogPath%

  echo %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT
  if not Exist %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT goto A
  rd %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT /s /q

  :A
  md %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT


  echo ***********below code represents MT Publish--%DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT*************

  
 copy "C:\Program Files\Jenkins\workspace\dashMain-M05_MT\bin\_PublishedWebsites\Host\" %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT\
 
 mkdir %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT\Bin
 copy "C:\Program Files\Jenkins\workspace\dashMain-M05_MT\bin\_PublishedWebsites\Host\bin\*.*" %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT\Bin\
 ::copy "C:\Program Files\Jenkins\workspace\dashMain-M05_MT\dashMiddleTier\Host\obj\Debug\Package\PackageTmp\bin\*.*" %DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT\Bin
 
 echo ***********drop Unwanted files from Published Folder**************
::Del "%DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT\bin\*.pdb" 
::Del "%DEPLOYMENT%%year%%month%%day%_Pre-QA_DASH-MT\bin\*.xml"



 

 pause