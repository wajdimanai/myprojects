$users = Get-LocalUser
foreach ($user in $users) {
    if ($user.Name -like "*built*" -or $user.Name -like "*hobbit*" -or $user.Description -like "*built-in*") {
        continue
    }
    
    $lastLogon = $user.LastLogon
    if ($lastLogon) {
        $inactiveDays = (New-TimeSpan -Start $lastLogon -End (Get-Date)).Days
        if ($inactiveDays -gt 45) {
            Disable-LocalUser -Name $user.Name
            Set-LocalUser -Name $user.Name -Description "Account disabled due to inactivity"
        }
    }
}
