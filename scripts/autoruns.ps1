$import=import-module C:\pswolf\prereq\autoruns\autoruns.psd1
$autoruns=Get-PSAutorun -All -ShowFileHash 
return $autoruns
