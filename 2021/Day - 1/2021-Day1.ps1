# part 1
$content = get-content(".\input.txt")
$previous, $count = 0

for ($i = 0; $i -lt $content.Length; $i++) {
    [int]$num = $content[$i]
    if ($i -eq 0) {
        write-host "$($num) (N/A - No previous measurement)"
        continue
    } 

    if ($num -gt $previous) { 
        write-host "$($content[$i]) (increase)"
        $count++
    } else {
        write-host "$($content[$i]) (decrease)"
    }
    $previous = $content[$i]
}

write-host "$($count)"


# part 2

$content = get-content(".\input.txt")
$previous, $count = 0

for ($i = 0; $i -lt $content.Length; $i++) { 
    [int]$CurrentRowNum = $([int]$content[$i] + [int]$content[$i + 1] + [int]$content[$i + 2])

    if ([int]$content[$i + 2] -eq "") { 
        continue
    }

    if ($i -eq 0) {
        write-host "$($CurrentRowNum) (N/A - No previous measurement)"
        continue
    } 

    if ($CurrentRowNum -gt $PreviousRowNum) { 
        write-host "$($CurrentRowNum) (increase)"
        $count++
    } else {
        write-host "$($CurrentRowNum) (decrease)"
    }
    $PreviousRowNum = $CurrentRowNum
}

write-host "$($count)"