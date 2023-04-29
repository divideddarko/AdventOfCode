$content = Get-Content "test-input.txt"


#$DirsTotals = @{}
$DirsTotals = @()
$i = 0
$currentDirectoryLevel = 0
$currentCount = 0

$content | ForEach-Object {

	if ($_[0] -eq "$") {
	#	write-host "action " -nonewline
	#	Write-host "$_" -ForegroundColor Green

		if ($_ -match '\$ cd \W.') {
			$currentDirectoryLevel--
		}

		if ($_ -match "\$ cd [a-z]") {
			$currentDirectoryLevel++
		}

		#Write-Host "currentDirectoryLevel " -NoNewline
		#Write-Host "$currentDirectoryLevel" -ForegroundColor Red


	}

	if ($_[0] -match "[0-9]") {
	#	Write-host "what is $($_.split(" ")[0])"
	#		write-host "working with $_"
			if ($currentDirectoryLevel -gt 0) {
				$currentCount = $currentCount + [int]($_.Split(" ")[0])
			} else { 
				$currentCount = 0
			}
		}

		Write-host "currentCount $currentCount"

}
















<#	#write-host "first char $($_[0])"

	#simon says do action $
#	if ("$($_[0])" -eq "$") { 
#		$terminalAction = $_.split(" ")[1].split(" ")[0]
#		write-host "action $terminalAction"
#	}	

	if ("$($_.split(" ")[0])" -match "[0-9]") { 
		[int]$currentCount += "$($_.split(" ")[0])"
		#write-host "currentcount: $currentCount"
	}

	if ("$($_[0])" -notmatch "[0-9]") {
		
		$previousCommand = $_
		<#if ($currentCount -gt 0) { 
			$result = new-object psobject
		
			$result | Add-member -membertype "noteproperty" -name "sum" -value $currentCount

			$DirsTotals += $result
		}#>
#>
		<#		if ($_ -match "dir") { 
			$directory = $_.split(" ")[1]
		}

		if ($currentCount -gt 0) {
			$result = New-Object psobject
			$result | Add-Member -MemberType NoteProperty -Name "Int" -Value $i
			$result | Add-Member -MemberType NoteProperty -Name "Drive" -Value $directory
			$result | Add-Member -MemberType NoteProperty -Name "total" -Value $currentCount
			$DirsTotals += $result
		}

		<#if ($currentCount -gt 0) {
			$DirsTotals.Add($i - $directory, $currentCount)
			$i++
		}#>
#>
		<#
		$currentCount = 0
	}
}

write-host "---"
$DirsTotals
write-host "---"


$counter = $DirsTotals.GetEnumerator() | Where-Object {$_.value -gt 100000}
$result = 0
$counter.Value | ForEach-Object { 
	$result = $result + [int]$_
}

write-host "found: " -NoNewline
Write-Host "$result" -ForegroundColor Green
#>
