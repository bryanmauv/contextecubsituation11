###############################
# Nom : exerciceAUDIT4ad.ps1 #
# Auteur : MAUVOISIN Bryan    #
# Date : 11/04/2023           #
# version : 1                 #
###############################


# Récupération de la date actuelle
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# Récupération de tous les comptes utilisateurs dans Active Directory
$users = Get-ADUser -Filter *

# Création du fichier d'audit et écriture des informations sur les comptes utilisateurs
New-Item -ItemType File -Path "$scriptPath\auditAD.txt" -Force | Out-Null
Add-Content -Path "$scriptPath\auditAD.txt" -Value "Date de lancement du script : $date"
foreach ($user in $users) {
    $name = $user.Name
    $name2 = "nom : $name"
    $username = $user.SamAccountName
    $username2 = "nom d'utilisateur : $username"
    $email = $user.EmailAddress
    $email2 = "adresse mail : $email"
    $description = $user.Description
    $description2 = "description du compte : $description"
    $line = "$name2 | $username2 | $email2 | $description2"
    Add-Content -Path "$scriptPath\auditAD.txt" -Value $line
    Add-Content -Path "$scriptPath\auditAD.txt" -Value "-------------------------------------------------------------------------------------------------------------------------------------"
}
