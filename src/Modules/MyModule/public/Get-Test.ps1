function Write-Message {
    [CmdletBinding()]
    param(
        [Parameter(Mandatory = $true)]
        [object] $Message,
        
        [ValidateSet("success", "failure", "warning", "command", "verbose")]
        [string] $Type
    )

    $time = Get-Date
    $color = [System.ConsoleColor]::White
    $log = "INF"
    switch ( $Type.ToLower() )
    {
        "success" {
                $color = [System.ConsoleColor]::Green
                $log = "SUCCESS"
            }
        "failure" {
                $color = [System.ConsoleColor]::Red
                $log = "ERROR  "
            }
        "warning" {
                $color = [System.ConsoleColor]::Yellow
                $log = "WARNING"
            }
        "command" {
                $color = [System.ConsoleColor]::Gray
                $log = "COMMAND"
            }
        "verbose" {
                $color = [System.ConsoleColor]::Cyan
                $log = "VERBOSE"
            }
        default {
                $color = [System.ConsoleColor]::White
                $log = "INFO   "
            }
    }


    if(!$APS.ShowMessages -and $VerbosePreference -eq "SilentlyContinue"){
        return
    }


    Write-Host "$($time): [$($log.ToUpper())]`t$Message" -ForegroundColor $color

}