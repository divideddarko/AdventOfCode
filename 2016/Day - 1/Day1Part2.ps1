$CurrentDirection = "N"
$currentXAxis = 0
$currentYAxis = 0
$seenLocations = @{}
$Counter = 0

$inputVal = Get-Content(".\inputtest.txt")

function CheckLocations { 
    param(
        [string]$inputaaaa
    )

    Write-Host "Checking $($inputaaaa)"
    Write-Host "Currently have $($SeenLocations.Values)"

    if ( $seenLocations.ContainsValue("$inputaaaa") ) {
        Write-Host "Found a match: $($CurrentXAxis):$($CurrentYAxis)" -ForegroundColor Red -BackgroundColor DarkYellow
    } else { 
        $seenLocations.Add($Counter, "$($CurrentXAxis):$($CurrentYAxis)")
    }
}

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

    Write-Host "Current Direction: $CurrentDirection"
    
    

    if ($CurrentDirection -match "[W|E]") {

        if ($CurrentDirection -match "[W]") {
            $Distance = $CurrentXAxis - $Distance
        }

        $CurrentXAxis .. $Distance | ForEach-Object {
            Write-Host "X: $CurrentXAxis - Distance: $Distance"
            $Counter++
            if ($CurrentXAxis -ne $Distance) {
                if ($CurrentDirection -match "[W]") {
                    $CurrentXAxis--
                } else {
                    $CurrentXAxis++
                }
            }
            # CheckLocations "$($CurrentXAxis):$($CurrentYAxis)"
        }
    } else {

        if ($CurrentDirection -match "[N]") {
            $Distance = $Distance - $CurrentYAxis
        }

        $CurrentYAxis .. $Distance | ForEach-Object { 
            Write-Host "Y: $CurrentYAxis - Distance: $Distance"
            $Counter++
            if ($CurrentYAxis -ne $Distance) {
                if ($CurrentDirection -match "[S]") {
                    $CurrentYAxis--
                } else { 
                    $CurrentYAxis++
                }
            }
            # CheckLocations "$($CurrentXAxis):$($CurrentYAxis)"
        }
    }
}



#     

#     Write-Host "The Maths part $([math]::Abs($CurrentXAxis)) + $([math]::Abs($currentYAxis))"
#     if ($CurrentDirection -match "[N|E]") {
#         Write-Host "North or east"
#         $nce = [math]::Abs($CurrentXAxis) + [math]::Abs($currentYAxis)
#         write-host "$($nce)"
#     } else { 
#         Write-Host "South or West"
#         $nce = [math]::Abs($currentXAxis) - [math]::Abs($currentYAxis)
#         write-host "$($nce)"
#     }
    
#     # Write-Host "Current Location: $CurrentDirection : $Direction $($nce)"
#     if($seenLocations.ContainsValue("$($nce)")){
#         Write-Host "We've been here before $($nce)"
#     } else {
#         $counter++
#         $seenLocations.Add($counter, "$($nce)")
#         Write-host "Seen : $($seenLocations.Values)"
#     }
# }

# $FinalDistance = [math]::Abs($CurrentXAxis) + [math]::Abs($currentYAxis)
Write-Host "Final Distance: $Distance"