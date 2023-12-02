$limit_r = 12
$limit_g = 13
$limit_b = 14

$bar = Get-Content -Path "./input"

foreach ($foo in $bar) {
    [int]$game_number = $foo.split(":")[0].Replace(" ", "") -replace '[a-zA-Z]'
    $pull_results = $foo.split(":")[1]
    $pull_split = $pull_results.Split(";")
    $failed = 0
    foreach ($split in $pull_split) {
        $colour_split = $split.Split(",")
        foreach ($colour in $colour_split) {
            if ($colour.Contains("blue") -and ([int]($colour -replace '[a-zA-Z]').Replace(" ", "")) -gt $limit_b ) {
                $failed = $failed + 1
            }
            elseif ($colour.Contains("red") -and ([int]($colour -replace '[a-zA-Z]').Replace(" ", "")) -gt $limit_r ) {
                $failed = $failed + 1
            }
            elseif ($colour.Contains("green") -and ([int]($colour -replace '[a-zA-Z]').Replace(" ", "")) -gt $limit_g ) {
                $failed = $failed + 1
            }
        }
    }
    if ($failed -eq 0) {
        Write-Host "$game_number passed ze tests"
        [int]$sum = $sum + $game_number
        Write-Host "Sum of successes is $sum"
    }
}
