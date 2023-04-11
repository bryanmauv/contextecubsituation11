# Initialisation des variables
$auditFile = "$PSScriptRoot\auditDHCP.txt"
$dateAudit = Get-Date

# Récupération des informations DHCP
$DHCPscopes = Get-DhcpServerv4Scope

# Création / Ouverture du fichier d'audit
$auditStream = New-Item -Path $auditFile -ItemType File -Force

# Ajout de la date d'audit dans le fichier
Add-Content -Path $auditFile -Value "Audit DHCP effectué le : $dateAudit"

# Parcours des plages DHCP
foreach ($scope in $DHCPscopes) {
    $scopeName = $scope.Name
    $scopeState = $scope.State

    # Formatage des informations pour affichage
    $displayString = "Plage DHCP : $scopeName - Statut : $scopeState"

    # Enregistrement des informations dans le fichier d'audit
    Add-Content -Path $auditFile -Value $displayString

    # Affichage à l'écran
    if ($scopeState -eq "Active") {
        Write-Host $displayString -ForegroundColor Green
    } else {
        Write-Host $displayString -ForegroundColor Red
    }
}

