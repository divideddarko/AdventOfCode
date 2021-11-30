$CurrentDirection = "N"
$currentXAxis = 0
$currentYAxis = 0
$seenLocations = @{}
$Counter = 0

$inputVal = Get-Content(".\input.txt")

$inputVal.Split(", ") | ForEach-Object {
    $Direction = $_.Substring(0, 1)
    $Distance = $_.Substring(1)

    switch ($Direction) {
        "R" {
            if ($CurrentDirection -match "N") {
                $CurrentDirection = "E"
            } elseif ($CurrentDirection -match "E") {
                $CurrentDirection = "S"
            } elseif ($CurrentDirection -match "S") {
                $CurrentDirection = "W"
            } elseif ($CurrentDirection -match "W") {
                $CurrentDirection = "N"
            }
        }
        "L" {
            if ($CurrentDirection -match "N") {
                $CurrentDirection = "W"
            } elseif ($CurrentDirection -match "W") {
                $CurrentDirection = "S"
            } elseif ($CurrentDirection -match "S") {
                $CurrentDirection = "E"
            } elseif ($CurrentDirection -match "E") {
                $CurrentDirection = "N"
            }
        }
    }

    switch ($CurrentDirection) {
        'N' { $CurrentYAxis += $Distance }
        'E' { $CurrentXAxis += $Distance }
        'S' { $CurrentYAxis -= $Distance }
        'W' { $CurrentXAxis -= $Distance }
    }

    
    Write-Host "The Maths part $([math]::Abs($CurrentXAxis)) + $([math]::Abs($currentYAxis))"
    $nce = [math]::Abs($CurrentXAxis) + [math]::Abs($currentYAxis)
    
    Write-Host "Current Location: $CurrentDirection : $Direction $($nce)"
    if($seenLocations.ContainsValue("$($nce)")){
        Write-Host "We've been here before $($nce)"
    } else {
        $counter++
        $seenLocations.Add($counter, "$($nce)")
    }

    

}

$FinalDistance = [math]::Abs($CurrentXAxis) + [math]::Abs($currentYAxis)
Write-Host "Final Distance: $FinalDistance"