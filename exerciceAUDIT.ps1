Add-Type -AssemblyName System.Windows.Forms
[System.Windows.Forms.Application]::EnableVisualStyles()

# Création de la fenêtre principale
$Form = New-Object System.Windows.Forms.Form
$Form.ClientSize = '400,200'
$Form.Text = 'Audit Services'

# Création des boutons et des EventHandlers correspondants
$Button1 = New-Object System.Windows.Forms.Button
$Button1.Location = New-Object System.Drawing.Point(20, 20)
$Button1.Width = 120
$Button1.Height = 40
$Button1.Text = 'Cliquer audit Services'
$Button1.Add_Click({
    Invoke-Expression -Command "powershell.exe -File '$scriptPath\exerciceAUDIT1services.ps1'"
})

$Button2 = New-Object System.Windows.Forms.Button
$Button2.Location = New-Object System.Drawing.Point(260, 20)
$Button2.Width = 120
$Button2.Height = 40
$Button2.Text = 'Cliquer audit DHCP'
$Button2.Add_Click({
    Invoke-Expression -Command "powershell.exe -File '$scriptPath\exerciceAUDIT2dhcp.ps1'"
})

$Button3 = New-Object System.Windows.Forms.Button
$Button3.Location = New-Object System.Drawing.Point(20, 120)
$Button3.Width = 120
$Button3.Height = 40
$Button3.Text = 'Cliquer audit DNS'
$Button3.Add_Click({
    Invoke-Expression -Command "powershell.exe -File '$scriptPath\exerciceAUDIT3dns.ps1'"
})

$Button4 = New-Object System.Windows.Forms.Button
$Button4.Location = New-Object System.Drawing.Point(260, 120)
$Button4.Width = 120
$Button4.Height = 40
$Button4.Text = 'Cliquer audit AD'
$Button4.Add_Click({
    Invoke-Expression -Command "powershell.exe -File 'C:\Users\Administrateur\Desktop\contextecubsituation11\exerciceAUDIT4ad.ps1'"
})

# Ajout des contrôles à la fenêtre principale
$Form.Controls.AddRange(@($Button1, $Button2, $Button3, $Button4))

# Affichage de la fenêtre principale
$Form.ShowDialog()
