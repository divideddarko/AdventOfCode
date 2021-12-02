$input = Get-Content ("input.txt")

#Part 1
$Hor, $Ver = 0

$input | ForEach-Object { 
    $Direction = $($_ -split " ")[0]
    [int]$Count = $($_ -split " ")[1]

    switch ($Direction) { 
        "Up" { $Ver = $Ver - $Count }
        "Down" { $Ver = $Ver + $Count }
        "Forward"  { $Hor = $Hor + $Count }
    }
    
}

Write-Host "Final Position: $($Hor * $Ver)"

#Part 2
$Hor, $Ver, $Aim = 0

$input | ForEach-Object { 
    $Direction = $($_ -split " ")[0]
    [int]$Count = $($_ -split " ")[1]

    switch ($Direction) { 
        "Up" { 
            $Ver = $Ver - $Count
            $LastDirection = $Ver 
        }
        "Down" { 
            $Ver = $Ver + $Count
            $LastDirection = $Ver
        }
        "Forward"  { 
            $Hor = $Hor + $Count
            $Aim = $Aim + $count * $LastDirection
        }
    }
}

Write-Host "Final Position: $($Hor * $Aim)"