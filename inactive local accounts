$users = Get-LocalUser
foreach ($user in $users) {
    if ($user.Name -like "*built*" -or $user.Name -like "*hobbit*") {continue} #skip any account that has hobbit or built (add whatever name you want to exclude)
    
    if ((Get-Date) - $user.LastLogon -gt 45d) #test if user logon date>45, meaning inactive
    { 
        Disable-LocalUser -Name $user.Name
    }
}
