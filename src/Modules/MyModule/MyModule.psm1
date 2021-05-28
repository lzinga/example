$folders = @("public", "private")
foreach($folder in $folders){

    $folderPath = Join-Path -Path $PSScriptRoot -ChildPath $folder
    If (Test-Path -Path $folderPath)
    {
        Write-Verbose -Message "Importing from $folder"
        $functions = Get-ChildItem -Path $folderPath -Filter '*.ps1'
        foreach ($function in $functions)
        {
            Write-Verbose -Message "Importing $($function.BaseName)"
            . $function.FullName
        }
    }


}

$publicFunctions = (Get-ChildItem -Path "$PSScriptRoot\public" -Filter '*.ps1' -Recurse).BaseName
Export-ModuleMember -Function $publicFunctions