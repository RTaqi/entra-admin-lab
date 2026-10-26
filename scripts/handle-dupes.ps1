$dupes = 'sara.ahmed2','u.tariq','danish.iqbal.old'
foreach ($d in $dupes) {
    

  $upn = "$d@YOURTENANT.onmicrosoft.com"
  Update-MgUser -UserId $upn -AccountEnabled:$false
  Revoke-MgUserSignInSession -UserId $upn
}