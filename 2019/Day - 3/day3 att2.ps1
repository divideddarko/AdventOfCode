$injestLines = (Get-Content "input.txt").Split('\r\n')

$i = 0
$q = 0
$lineOne = @{ }
$lineTwo = @{ }

$injestLines | ForEach-Object {
    $x = 0
    $y = 0

    $q++
    $_.Split(',') | ForEach-Object {
        $distance = $_.Split('U||D||L||R', 2)[1]
        $direction = $_[0]

        if ($direction -eq "U") {
            $y  .. ($y + $distance) | ForEach-Object {
                if ($q -eq 1) {
                    $lineOne.Add($i, "$($x),$($_)")
                } else {
                    $lineTwo.Add($i, "$($x),$($_)")
                }
                $i++
            }
            $y = $y + $distance
        }
        if ($direction -eq "D") {
            $y .. ($y - $distance) | ForEach-Object {
                if ($q -eq 1) {
                    $lineOne.Add($i, "$($x),$($_)")
                } else {
                    $lineTwo.Add($i, "$($x),$($_)")
                }
                $i++
            }
            $y = $y - $distance
        }
        if ($direction -eq "L") {
            $x .. ($x - $distance) | ForEach-Object {
                if ($q -eq 1) {
                    $lineOne.Add($i, "$($_),$($y)")
                } else {
                    $lineTwo.Add($i, "$($_),$($y)")
                }
                $i++
            }
            $x = $x - $distance
        }
        if ($direction -eq "R") {
            $x .. ($x + $distance) | ForEach-Object {
                if ($q -eq 1) {
                    $lineOne.Add($i, "$($_),$($y)")
                } else {
                    $lineTwo.Add($i, "$($_),$($y)")
                }
                $i++
            }
            $x = $x + $distance
        }
    }
}

$closest = $lineone.Values | Sort-Object | Where-Object { $lineTwo.ContainsValue($_) -and $_ -ne "0,0" }

$sums = @{ }
$v = 0
$closest | ForEach-Object {
    $v++
    $q = $_.split(',')
    $a = [math]::Abs($q[0]) + [Math]::Abs($q[1])
    $sums.Add($v, "$a")
}

$sums.Values | Sort-Object | Select-Object -First 1