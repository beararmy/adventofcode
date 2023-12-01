$bar = Get-Content -Path "./input"
try {
    foreach ($foo in $bar) {
        $foo = $foo -replace 'one', 'o1e'
        $foo = $foo -replace 'two', 't2o'
        $foo = $foo -replace 'three', 't3e'
        $foo = $foo -replace 'four', 'f4r'
        $foo = $foo -replace 'five', 'f5e'
        $foo = $foo -replace 'six', 's6x'
        $foo = $foo -replace 'seven', 's7n'
        $foo = $foo -replace 'eight', 'e8t'
        $foo = $foo -replace 'nine', 'n9e'
        $foo = $foo -replace '[a-zA-Z]', ''
        [int]$smunge = [string]$foo[0] + [string]$foo[-1]
        [int]$running_total = $running_total + $smunge
        Write-Host -Foregroundcolor $(Get-Random ("Red", "Green")) -NoNewline "First: $($foo[0]), "
        Write-Host -Foregroundcolor $(Get-Random ("Red", "Green")) -NoNewline "Last: $($foo[-1]). "
        Write-Host -Foregroundcolor $(Get-Random ("Red", "Green")) -NoNewline "Munged: $smunge, "
        Write-Host -Foregroundcolor $(Get-Random ("Red", "Green")) "Running Total: $running_total."
    }
}
catch {
    $_.Exception
}
finally {
    Write-Host -Foregroundcolor $(Get-Random ("Red", "Green")) "Grand total is: $running_total."
}
