$OSVersion = [Version](Get-WmiObject Win32_OperatingSystem).Version
$OSMajorMinor = "$($OSVersion.Major).$($OSVersion.Minor)"
if(($OSMajorMinor -eq "10.0") -or ($OSMajorMinor -eq "6.3")){
$route=Get-NetRoute
}
else{
#getting allowed programs
$command='route'
$arg='print'
$route=& $command $arg
}
return $route