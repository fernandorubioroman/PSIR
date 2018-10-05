$command='C:\pswolf\prereq\dumpbin\dumpbin.exe'
$arg='/headers'
$filelist=Get-ChildItem -Path c:\windows  -Recurse| Where-Object {$_.extension -eq ".exe"} | Where-Object{$_.PSIsContainer -ne $true} | Where-Object{(Get-AuthenticodeSignature $_.FullName).Status -ne "Valid"}
$results=@()
foreach($file in $filelist){
$arg2=$file.FullName
$headers=& $command $arg $arg2
$resultsobj= New-Object psobject
$resultsobj | Add-Member -MemberType NoteProperty -Name filename  -Value $file.FullName -force
$resultsobj | Add-Member -MemberType NoteProperty -Name headers -PassThru  -Value $headers -force 
$results+=$resultsobj  
}
return $results
