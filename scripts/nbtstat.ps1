#TODO this is a snipset using Mac, needs to work this out
$results=@()
$entries=(nbtstat -c) -Match '\s\s\d' 
ForEach ($entry in $entries) {
   $parts = $entry.trim() -Split '\s+'
    $resultsobj= New-Object psobject
    $resultsobj | Add-Member -MemberType NoteProperty -Name IP  -Value $parts[0] -force
    $resultsobj | Add-Member -MemberType NoteProperty -Name MAC -PassThru  -Value $parts[1] -force 
    $resultsobj | Add-Member -MemberType NoteProperty -Name Type  -Value $parts[2] -force 
    $results+=$resultsobj  
   }
return $results