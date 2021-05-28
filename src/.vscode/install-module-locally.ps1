$ScriptRoot = $PSScriptRoot

$source = "$ScriptRoot\..\Modules\MyModule"
$destination = "$env:ProgramFiles\WindowsPowerShell\Modules"

Write-Host "Copying '$source' to '$destination'."
Copy-Item -Path $source -Destination $destination -Recurse -Force
Write-Host "Copying Complete. You can now use import the module."