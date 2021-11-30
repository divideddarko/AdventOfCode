# R8,U5,L5,D3
# U7,R6,D4,L4

#Get the first line and second line

$injestLines = (Get-Content "input.txt").Split('\r\n')

$i = 0
$q = 0

$lineOne = @{ }
$lineTwo = @{ }

$stopwatch = New-Object System.Diagnostics.Stopwatch
$stopwatch.Start()

$injestLines | ForEach-Object {
    [int]$x = 0
    [int]$y = 0

    $q++

    $_.Split(',') | ForEach-Object {

        $distance = $_ -Split "(U|D|L|R)"
        $distance = $distance[2]
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
$stopwatch.Stop()

"Part 1 : $($stopwatch.Elapsed)"
$stopwatch.Reset()

$stopwatch.Start()

#$closest = $lineOne.GetEnumerator() | Select-Object Value | % { $q = $_ ; $lineTwo.GetEnumerator() | Select-Object Value | % { if ($q -match $_ -and $_ -notmatch "0,0") { "$($_.Value)" } } }

$closest = $lineone.Values | Sort-Object | Where-Object { $lineTwo.ContainsValue($_) -and $_ -ne "0,0" }

$stopwatch.Stop()

"Part 2 : $($stopwatch.Elapsed)"

$stopwatch.Reset()

$stopwatch.Start()
$sums = @{ }
$v = 0
$closest | ForEach-Object {
    $v++
    $q = $_ -split (',') -split ('=') -split (';')
    $a = [math]::Abs($q[0]) + [Math]::Abs($q[1])
    $sums.Add($v, "$a")
}

$sums.GetEnumerator() | Sort-Object Value -Descending | Select-Object -Last 1

$stopwatch.Stop()

"Part 3 : $($stopwatch.Elapsed)"