$command="net"
$arg="accounts"
$results=@()
$netaccounts=& $command $arg 
for($i=1;$i-lt (($netaccounts.count)-2);$i++){
$line=$netaccounts[$i] -split ":"
$line[1]=$line[1] -replace(" ","")
    $resultsobj= New-Object psobject
    $resultsobj | Add-Member -MemberType NoteProperty -Name property  -Value $line[0] -force
    $resultsobj | Add-Member -MemberType NoteProperty -Name Value -PassThru  -Value $line[1] -force 
    $results+=$resultsobj 
}
return $results