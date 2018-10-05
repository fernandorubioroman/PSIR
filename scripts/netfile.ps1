$netfile = [ADSI]"WinNT://localhost/LanmanServer"
$collection=@()
$netfile.Invoke("Resources") | foreach {
 try{
 $collection += New-Object PsObject -Property @{
 Id = $_.GetType().InvokeMember("Name", 'GetProperty', $null, $_, $null)
 itemPath = $_.GetType().InvokeMember("Path", 'GetProperty', $null, $_, $null)
 UserName = $_.GetType().InvokeMember("User", 'GetProperty', $null, $_, $null)
 LockCount = $_.GetType().InvokeMember("LockCount", 'GetProperty', $null, $_, $null)
 Server = $computer
 }
 }
 catch{
 if ($verbose){write-warning $error[0]}
 }
 }
Return $collection
 
