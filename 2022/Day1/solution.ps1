$input = Get-Content ".\input.txt"

$total = 0

$input | ForEach-Object { 
	if ($_ -ne "") {
		$runningTotal = $runningTotal + [int]($_)
    } else { 
		if ($runningTotal -gt $total){
			$total = $runningTotal
		}
		$runningTotal = 0
	}
}

Write-Host "Total: $($total)"

#Part 2

$puzzleinput = Get-Content ".\input.txt"
$runningTotal = 0
$totals = @{}
$i = 1
$q = 1
$count = $puzzleinput.count

$puzzleinput | ForEach-Object {
	$m = $_
	write-host "$_ - q $q - count $count" -ForegroundColor green
	if (($q -eq $count) -or ($_ -eq "")) {
		    $i++
		if ($q -eq $count) {
            $m = [int]$m + $runningTotal
			$totals.Add($i, $m)
		} else {
    		$totals.Add($i, $runningTotal)
		}
		$runningTotal = 0
	}
    $q++
	$runningTotal = $runningTotal + [int]($_)
}


$a = $totals.GetEnumerator() | Sort-Object -Property Value | Select -Last 3
$result = 0
$a.Value | ForEach-Object {
     $result = $result + [int]$_
}

Write-Host "Top 3: $($a.Value) Total: $($result)"
