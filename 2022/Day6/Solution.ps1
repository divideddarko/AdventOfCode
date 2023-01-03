$puzInput = (get-Content .\input.txt).ToCharArray()

[int]$distinctCount = Read-Host "How many distinct characters?"
$distinctCount = ($distinctCount - 1)

for ($i = $distinctCount; $i -lt $puzInput.Length; $i++) { 
	$letters = @{}

    $i .. $($i - $distinctCount) | foreach-object {
		$q = $_
		if ($($letters.Keys) -notcontains "$($puzInput[$q])") {
			$letters.Add("$($puzInput[$q])", 1)
		} else {
			$letters.Set_Item("$($puzinput[$q])", 2)
		}
	}

	if ($letters.Values -notcontains 2) {
		write-host "Found $($puzInput[$i]) at $($i + 1)"
		break
	}
}
