$content = Get-Content (".\testinput.txt")
$sum = 0

for ($i = 0; $i -lt $content.Length; $i++) { 
    Write-Host "Working on $($Content[$i])"
    Write-Host "Position to check against $([math]::round($content[($content.Length + [System.Int32]::Parse($i) / 2) ]))"
    if ($content[$i] -eq $content[($content.Length + $i) / 2 ]) {
        Write-Host "yes"
        $sum += [System.Int32]::Parse($content[$i])
    }
}

# Write-Host "last char $($content.Substring($content.Length -1, 1))"
# if ($content[0] -eq $content.Substring($content.Length -1, 1))  { 
#     $sum += [System.Int32]::Parse($content[0])
# }

Write-Host "Total: $sum"