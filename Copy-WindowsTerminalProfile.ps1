[CmdletBinding()]
param()

$windowsTerminalDirectory = "$env:LocalAppData\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"

$jsonProfiles = Get-ChildItem -Path $windowsTerminalDirectory profiles.json -File -Recurse

if ($jsonProfiles.Count -eq 1) {
    Write-Verbose "Copying current Windows Terminal profiles.json to current directory."
    Copy-Item $jsonProfiles.FullName .\profiles.json -Force
}
else {
    Write-Warning -Message "More than one profiles.json found in Windows Terminal application directory, discarding copy."
}