New-Item -ItemType File -Path "$PSScriptRoot\auditServices.txt"
# Obtenir le chemin du dossier o� se trouve le script
$scriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path

# Cr�er le fichier auditServices.txt dans le m�me dossier que le script
New-Item -ItemType File -Path "$scriptPath\auditServices.txt" -Force

# Ajouter la date de lancement du script au fichier
$dateTime = Get-Date
Add-Content -Path "$scriptPath\auditServices.txt" -Value "Date de lancement du script : $dateTime"

# V�rifier les services DHCP, DN et SAD
$services = "DHCP", "DNS", "ADWS"
foreach ($service in $services) {
    $status = Get-Service -Name $service | Select-Object -ExpandProperty Status
    $serviceInfo = "Le service $service est actuellement : $status"
    Add-Content -Path "$scriptPath\auditServices.txt" -Value $serviceInfo
}
