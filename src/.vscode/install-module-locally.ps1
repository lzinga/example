param (
    [System.IO.FileInfo] $WorkspaceFolder,
    [string] $ModuleName
)

Write-Host "Workspace Folder: $WorkspaceFolder"

$source = "$WorkspaceFolder\Modules\$ModuleName"
$destination = "$env:ProgramFiles\WindowsPowerShell\Modules"

Write-Host "Copying '$source' to '$destination'."
Copy-Item -Path $source -Destination $destination -Recurse -Force
Write-Host "Copying Complete. You can now use import the module."