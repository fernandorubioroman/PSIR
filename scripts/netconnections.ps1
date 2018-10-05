
$OSVersion = [Version](Get-WmiObject Win32_OperatingSystem).Version
$OSMajorMinor = "$($OSVersion.Major).$($OSVersion.Minor)"
if(($OSMajorMinor -eq "10.0") -or ($OSMajorMinor -eq "6.3")){
$results=Get-NetTCPConnection
}
else{
$results=@()
$netstat=netstat.exe -ano
for ($i=4;$i -lt $netstat.count;$i++)
{
    $resultsobj= New-Object psobject
    $entry=$netstat[$i]
    $parts = $entry.trim() -Split '\s+' | out-null
    $split=($parts[1].split(":"))
    if ($split.count -eq 2){
        $resultsobj | Add-Member -MemberType NoteProperty -Name LocalAddress   -Value $split[0] -force 
        $resultsobj | Add-Member -MemberType NoteProperty -Name LocalPort  -Value $split[1] -force 
    }
    else{
        $resultsobj | Add-Member -MemberType NoteProperty -Name LocalAddress   -Value $parts[1] -force    
        $resultsobj | Add-Member -MemberType NoteProperty -Name LocalPort  -Value $split[-1] -force    
    }
    $resultsobj | Add-Member -MemberType NoteProperty -Name protocol  -Value $parts[0] -force
    $resultsobj | Add-Member -MemberType NoteProperty -Name RemoteAddress  -Value $parts[2] -force 
    $resultsobj | Add-Member -MemberType NoteProperty -Name State  -Value $parts[3] -force 
    $results+=$resultsobj  
    }

}
return $results