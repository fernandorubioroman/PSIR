#Download updated wsusscn2.cab on collection machine using 
#invoke-webrequest http://go.microsoft.com/fwlink/?LinkId=76054 -OutFile "C:\pswolf\prereq\wsusscn2.cab"
$file= "C:\pswolf\prereq\wsusscn2.cab"
$UpdateServiceManager = New-Object -ComObject 'Microsoft.Update.ServiceManager'
$UpdateService = $UpdateServiceManager.AddScanPackageService("wsusscn2 file", $file)
$Searcher = New-Object -ComObject Microsoft.Update.Searcher 
$Searcher.ServerSelection = 3 
$Searcher.IncludePotentiallySupersededUpdates = 1
$Searcher.ServiceID = $UpdateService.ServiceID 
$SearchResult = $Searcher.Search("IsInstalled=0")
#we need this as remoting do not forward objects within objects 
$missingfixes=@()
foreach ($missingfix in $searchresult.updates){
$missingfixes+=$missingfix
}
#cleaning com objects and prereq files
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($Searcher)
[System.Runtime.Interopservices.Marshal]::ReleaseComObject($UpdateServiceManager)
return $missingfixes