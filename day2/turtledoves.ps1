$bar = Get-Content -Path "./input"

foreach ($foo in $bar) {
    [int]$game_number = $foo.split(":")[0].Replace(" ", "") -replace '[a-zA-Z]'
    $pull_results = $foo.split(":")[1]
    $pull_split = $pull_results.Split(";")
    $failed = 0
    foreach ($split in $pull_split) {
        $colour_split = $split.Split(",")
        $blues_highest = 0
        $reds_highest = 0
        $greens_highest = 0
        foreach ($colour in $colour_split) {
            if ($colour.Contains("blue") ) {
                $blues = ([int]($colour -replace '[a-zA-Z]').Replace(" ", ""))
                if ($blues_highest -lt $blues) {
                    $blues_highest = $blues
                }
                $failed = $failed + 1
            }
            elseif ($colour.Contains("red")) {
                $reds = ([int]($colour -replace '[a-zA-Z]').Replace(" ", ""))
                if ($reds_highest -lt $reds) {
                    $reds_highest = $reds
                }
                $failed = $failed + 1
            }
            elseif ($colour.Contains("green")) {
                $greens = ([int]($colour -replace '[a-zA-Z]').Replace(" ", ""))
                if ($greens_highest -lt $greens) {
                    $greens_highest = $greens
                }
                $failed = $failed + 1
            }
        }
        if ($greeny_highest -lt $greens_highest) {
            $greeny_highest = $greens_highest
        }
        if ($redy_highest -lt $reds_highest) {
            $redy_highest = $reds_highest
        }
        if ($bluey_highest -lt $blues_highest) {
            $bluey_highest = $blues_highest
        }
    }
    $christmas_power = $greeny_highest * $redy_highest * $bluey_highest
    Write-Host "G: $game_number R:$redy_highest G:$greeny_highest B:$bluey_highest P:$christmas_power"
    $sum_christmas_power = $sum_christmas_power + $christmas_power
}
Write-Host $sum_christmas_power
