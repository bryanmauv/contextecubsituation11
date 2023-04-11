###############################
# Nom : exerciceAUDIT3dns.ps1 #
# Auteur : MAUVOISIN Bryan    #
# Date : 11/04/2023           #
# version : 1                 #
###############################


# Récupération de la date actuelle
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Récupération de tous les enregistrements DNS de type A sur la machine locale
$dnsRecords = Get-DnsServerResourceRecord -ZoneName "local.frankfurt.cub.sioplc.fr" -RRType A

# Création du fichier d'audit et écriture des informations sur les enregistrements DNS
New-Item -ItemType File -Path "$PSScriptRoot\auditDNS.txt" -Force | Out-Null
Add-Content -Path "$scriptPath\auditDNS.txt" -Value "Date de lancement du script : $date"
foreach ($record in $dnsRecords) {
    $name = $record.HostName
    $ip = $record.RecordData.Ipv4Address.IPAddressToString
    $line = "$name - $ip"
    Add-Content -Path "$PSScriptRoot\auditDNS.txt" -Value $line
}
