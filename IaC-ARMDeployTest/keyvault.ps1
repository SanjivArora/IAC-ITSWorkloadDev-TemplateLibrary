#param (
#    [string] $environment
#)
#Global
Import-Module Az.KeyVault
#write-host $environment
#If {#($environment -eq 'DEV') {
$KeyVault = "kvdemo-04"
#HINT: KeyVault Name
#}
#Loading Default Secrets
$secrets = Import-Csv 'IaC-ARMDeployTest\keyvault.csv'
#HINT: Drop Location
function New-RandomPassword() {
    param (
        [int]$size
    )
    $minLength = 8 ## characters
    $maxLength = $size ## characters
    $lengh = Get-Random -Minimum $minLength -Maximum $maxLength
    $nonAlphaChars = $minLength
    $password = membership.GeneratePassword($lengh, $nonAlphaChars);
    return $password
}
foreach ($secret in $secrets) {
    If ($secret.secret -eq 'random') {
        $tmpSecret = ConvertTo-SecureString (New-RandomPassword -size 14) -AsPlainText -Force
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