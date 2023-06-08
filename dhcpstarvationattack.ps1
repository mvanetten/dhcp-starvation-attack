# Mr PowerShell
#
# Belangrijke mededeling: 
# 
# Hacken is ten strengste verboden en valt onder de categorie computervredebreuk. 
# Het is absoluut ontoelaatbaar om zonder toestemming toegang te verkrijgen tot computersystemen, 
# netwerken of andere digitale apparaten. Deze daad wordt beschouwd als een ernstige 
# overtreding en kan leiden tot strafrechtelijke vervolging en juridische consequenties.
#
# https://www.om.nl/onderwerpen/cybercrime/hack_right/wetsartikel-computervredebreuk
#

$NetAdapterName = "" # Voorbeeld    $NetAdapterName = "Ethernet"

for ($i = 0;$i -lt 10;$i++){
    $bit1 = Get-Random -Minimum 0 -Maximum 9
    $bit2 = Get-Random -Minimum 0 -Maximum 9
    $randomMAC = ([string]::Format("{0:X2}:{1:X2}:{2:X2}:{3:X2}:{4:X2}:{5:X2}", (Get-Random -Minimum 0 -Maximum 255), (Get-Random -Minimum 0 -Maximum 255), (Get-Random -Minimum 0 -Maximum 255), (Get-Random -Minimum 0 -Maximum 255), (Get-Random -Minimum 0 -Maximum 255), (Get-Random -Minimum 0 -Maximum 255)))
    Set-NetAdapter -Name $NetAdapterName -MacAddress $randomMAC -Confirm:$false
    Invoke-Expression -Command "ipconfig /release" #DHCP Release
    Invoke-Expression -Command "ipconfig /renew"   #DHCP Renew
    Start-Sleep -Seconds 2
}

