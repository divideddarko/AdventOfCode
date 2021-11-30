# Part 1
$count = 0

172930 .. 683082 | ForEach-Object {
    $a = $_ -split ('')

    if ($a[1] -le $a[2] -and $a[2] -le $a[3] -and $a[3] -le $a[4] -and $a[4] -le $a[5] -and $a[5] -le $a[6]) {
        if ($a[1] -eq $a[2] -or $a[2] -eq $a[3] -or $a[3] -eq $a[4] -or $a[4] -eq $a[5] -or $a[5] -eq $a[6]) {
            $count++
        }
    }
}


# part2

$count = 0

$results = @{ }

# 172930 .. 683082 | ForEach-Object {
111222 .. 112233 | % {
    $a = $_ -split ('')

    if ($a[1] -le $a[2] -and $a[2] -le $a[3] -and $a[3] -le $a[4] -and $a[4] -le $a[5] -and $a[5] -le $a[6]) {
        if (($a[1] -eq $a[2])) {
            $results.Add("$($count) // $(Get-Random -Minimum 999 -Maximum 90909090990) ", "$($_)  A")
            $count++
            if (($a[1] -eq $a[2] -and $a[1] -le $a[3] -and $a[1] -le $a[4])) {
                $results.Add("$($count) // $(Get-Random -Minimum 999 -Maximum 90909090990) ", "$($_)  B")
            }
        }
    }
}

$count