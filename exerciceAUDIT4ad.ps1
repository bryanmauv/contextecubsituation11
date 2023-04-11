###############################
# Nom : exerciceAUDIT4ad.ps1 #
# Auteur : MAUVOISIN Bryan    #
# Date : 11/04/2023           #
# version : 1                 #
###############################


# R�cup�ration de la date actuelle
$date = Get-Date -Format "yyyy-MM-dd HH:mm:ss"

# R�cup�ration de tous les comptes utilisateurs dans Active Directory
$users = Get-ADUser -Filter *

# Cr�ation du fichier d'audit et �criture des informations sur les comptes utilisateurs
New-Item -ItemType File -Path "$scriptPath\auditAD.txt" -Force | Out-Null
Add-Content -Path "$scriptPath\auditAD.txt" -Value "Date de lancement du script : $date"
foreach ($user in $users) {
    $name = $user.Name
    $username = $user.SamAccountName
    $email = $user.EmailAddress
    $description = $user.Description
    $line = "$name - $username - $email - $description"
    Add-Content -Path "$scriptPath\auditAD.txt" -Value $line
}
