#identify if it is a DC and if not get the local groups membership
$domainrole=(Get-WmiObject Win32_ComputerSystem).DomainRole
if ($domainrole -ge 4)
{
    return "LOCAL_GROUPS_NOT_COLLECTED_DC"    
}
else{
$localgroups=Get-CimInstance win32_group -filter "LocalAccount='True'" |
Select PSComputername,Name,@{Name="Members";Expression={
 (Get-CimAssociatedInstance -InputObject $_ -ResultClassName Win32_UserAccount).Name -join ";"
}}
return $localgroups
}