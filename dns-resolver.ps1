#Collaborated with Matt Bobbitt
param($network, $server)
$ip = 1
DO
{
$var=(Resolve-DnsName -DnsOnly "$network.$ip" -Server $server -ErrorAction Ignore).NameHost
if ($var -ne $null) 
{
Write-Output "$network.$ip,$var"
}
$ip++
}While ($ip -le 254)
