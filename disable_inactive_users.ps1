$users = Get-LocalUser
foreach ($user in $users) {
      if ($user.Name -like "*built*" -or $user.Name -like "*test*" -or $user.Description -like "*test*" -or $user.Description -like "*managed and used by the system*") {
        continue
    }     $lastLogon = $user.LastLogon
    if (($lastLogon) -and ($user.Enabled)) {
        $inactiveDays = (New-TimeSpan -Start $lastLogon -End (Get-Date)).Days
        if ($inactiveDays -lt 45) {
            Disable-LocalUser -Name $user.Name
            $UDS = $user.Description
            $UDS += " Disabled on $(Get-Date -Format 'yyyy-MM-dd')"
            Set-LocalUser -Name $user.Name -Description $UDS
        }
    }
}
