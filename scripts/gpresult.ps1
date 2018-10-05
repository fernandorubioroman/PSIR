#TODO:this does not work if the user does not have a local profile at the destination machine
#https://blogs.technet.microsoft.com/meamcs/2015/09/24/powershell-retrieve-group-policy-details-for-remote-computer/
$command="gpresult"
$arg="/v"
$arg2="/scope"
$arg3="COMPUTER"
$gpresult=& $command $arg $arg2 $arg3
return $gpresult
