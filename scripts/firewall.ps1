$OSVersion = [Version](Get-WmiObject Win32_OperatingSystem).Version
$OSMajorMinor = "$($OSVersion.Major).$($OSVersion.Minor)"
if(($OSMajorMinor -eq 10.0) -or ($OSMajorMinor -eq 6.3) -or ($OSMajorMinor -eq 6.2)){
$prof=get-netfirewallprofile
$rules=get-netfirewallrule
$resultsobj = New-Object psobject
$resultsobj | Add-Member -MemberType NoteProperty -Name profile  -Value $prof -force
$resultsobj | Add-Member -MemberType NoteProperty -Name rules  -Value $rules -force
}
else{
#getting allowed programs
$command='netsh.exe'
$arg='firewall'
$arg2='show'
$arg3='allowedprogram'
$allowed=& $command $arg $arg2 $arg3
$resultsobj = New-Object psobject
$resultsobj | Add-Member -MemberType NoteProperty -Name Allowedprogram  -Value $allowed -force
$arg='advfirewall'
$arg2='show'
$arg3='allprofiles'
$allprofiles=& $command $arg $arg2 $arg3
$resultsobj | Add-Member -MemberType NoteProperty -Name Allprofiles  -Value $allprofiles -force
}
return $resultsobj