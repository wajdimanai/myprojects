$users = Get-LocalUser
foreach ($user in $users) {
    while ($user.Name -notlike "*built*" -and $user.Name -notlike "*hobbit*") {
        if ((Get-Date) - $user.LastLogon -gt 45d) {
            Disable-LocalUser -Name $user.Name
            break
        }
        break
    }
}
