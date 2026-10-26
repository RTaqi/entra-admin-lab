try {
    $au = New-MgDirectoryAdministrativeUnit -DisplayName "AU-Sales" -Description "Sales Department Users" -ErrorAction Stop
    Write-Host "AU created : $($au.Id)" -ForegroundColor Green
}
catch {
    <#Do this if a terminating exception happens#>
    Write-Host "AU creation failed: $($.Exception.Message)" -ForegroundColor Red
}