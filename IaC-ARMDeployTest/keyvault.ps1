#param (
##    [string] $environment
#)
#Global
Import-Module Az.KeyVault
#write-host $environment
#If {#($environment -eq 'DEV') {
$KeyVault = "kvdemo-05"
#HINT: KeyVault Name
#}
#Loading Default Secrets
$secrets = Import-Csv 'IaC-ARMDeployTest\keyvault.csv'
#HINT: Drop Location
Add-Type -AssemblyName 'System.Web'
function New-RandomPassword() {
    param (
        [int]$size
    )
    $minLength = 15 ## characters
    $maxLength = $size ## characters
    $length = Get-Random -Minimum $minLength -Maximum $maxLength
    $nonAlphaChars = 5
    $password = [System.Web.Security.Membership]::GeneratePassword($length, $nonAlphaChars)

    return $password
}
foreach ($secret in $secrets) {
    If ($secret.secret -eq 'random') {
        $tmpSecret = ConvertTo-SecureString (New-RandomPassword -size 18) -AsPlainText -Force
    }
    Else {
        $tmpSecret = ConvertTo-SecureString $secret.secret -AsPlainText -Force
    }
    if (!(Get-AzKeyVaultSecret -VaultName $KeyVault -name $secret.name)) {
        $tmpsecret = Set-AzKeyVaultSecret -VaultName $KeyVault -Name $secret.name -SecretValue $tmpSecret
    }
    Else {
        Write-Host "Secret is already in the Key Vault. No change is required."
    }
}