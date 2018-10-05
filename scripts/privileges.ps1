if (!(test-path C:\temp)){new-item c:\temp -type Directory}
if ((test-path C:\temp\privileges.txt)){remove-item c:\temp\privileges.txt -force}
secedit /export /mergedpolicy /areas USER_RIGHTS /cfg "c:\temp\privileges.txt"
$privileges=Get-Content -Path C:\temp\privileges.txt
return $privileges


