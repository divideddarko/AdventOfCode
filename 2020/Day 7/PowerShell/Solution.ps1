$input = Get-Content .\testInput.txt

$input | ForEach-Object { 
    Write-Host "> $_"
}