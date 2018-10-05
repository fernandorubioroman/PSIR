#this script returns the list of entries in the ARP table as a single list
$results=@()
$entries=(arp -a) -Match '\s\s\d' 
ForEach ($entry in $entries) {
   $parts = $entry.trim() -Split '\s+'
    $resultsobj= New-Object psobject
    $resultsobj | Add-Member -MemberType NoteProperty -Name IP  -Value $parts[0] -force
    $resultsobj | Add-Member -MemberType NoteProperty -Name MAC   -Value $parts[1] -force 
    $resultsobj | Add-Member -MemberType NoteProperty -Name Type  -Value $parts[2] -force 
    $results+=$resultsobj  
   }
return $results
