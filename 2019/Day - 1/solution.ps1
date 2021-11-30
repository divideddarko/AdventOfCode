# Part A
$input = Get-Content -Path 'C:\users\divid\documents\powershell\Advent Of Code\2019\Day1\input.txt'
$Sum = 0
$input | ForEach-Object {
    $sum += [Math]::Floor($_ / 3 - 2)
}
Write-Host "$sum"

# shorthand
$s = 0; gc 'C:\users\divid\documents\powershell\Advent Of Code\2019\Day1\input.txt' | % { $s += [Math]::Floor($_ / 3 - 2)}; $s


# Part B
$input = Get-Content -Path 'C:\users\divid\documents\powershell\Advent Of Code\2019\Day1\input.txt'
$total = 0
foreach ($i in $input){
    while ([Math]::Floor($i / 3 - 2) -ge 0) {
        $i = [Math]::Floor($i / 3 - 2)
        $total = $total + $i
    }
}
Write-Host "$total"

#Shorthand
$t = 0; gc 'C:\users\divid\documents\powershell\Advent Of Code\2019\Day1\input.txt'| % {$i = $_; while([Math]::Floor($i / 3 - 2) -ge 0){$i = [Math]::Floor($i / 3 - 2); $t = $t + $i}}; $t