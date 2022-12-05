$puzzelInput = Get-Content .\input.txt

$total = 0

$puzzelInput | ForEach-Object { 
	 $halfway = ($_.Length / 2)

	 $compartmentOne = "$_".Substring(0, $halfway)
	 $compartmentTwo = "$_".Substring($halfway, $halfway)

     $diff = ($compartmentOne.ToCharArray() | ForEach-Object { $c = $_; $compartmentTwo.ToCharArray() | ForEach-Object { $d = $_; Compare-Object $c $d -ExcludeDifferent } }).InputObject

     $diff = "$diff".substring(0,1)




     if ($diff -cmatch "[a-z]") {
         $total = $total + ([byte][char]$diff - 96)
     } else { 
	     $total = $total + ([byte][char]$diff - 38)
     }


}

Write-Host "total: $total"

$puzzelInput = (Get-Content .\input.txt)

$total = 0

for ($i = 0; $i -lt $puzzelinput.Count; $i += 3) { 
    $one = "$($puzzelInput[$i])"
    $two = "$($puzzelInput[$i + 1])"
    $three = "$($puzzelInput[$i + 2])"

    $diffOne = ($one.ToCharArray() | ForEach-Object { 
        $charOne = $_

        $two.ToCharArray() | ForEach-Object { 
            $charTwo = $_

            Compare-Object $charOne $charTwo -ExcludeDifferent
        }
    }).InputObject

$result = ($three.ToCharArray() | ForEach-Object {
        $charThree = $_
        $diffOne | Foreach-object {
        Compare-Object $charThree $_ -ExcludeDifferent
        }
     }).InputObject

     $result = "$result".Substring(0,1)
     if ($result -cmatch "[a-z]") { 
         $total = $total + ([byte][char]$result - 96)
     } else { 
         $total = $total + ([byte][char]$result - 38)
     }
}
Write-host "total: $total"
