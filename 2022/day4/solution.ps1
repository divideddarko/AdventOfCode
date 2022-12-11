$puzzleInput = Get-Content -Path .\input.txt
$count = 0
$puzzleInput | ForEach-Object { 
	[int]$one = "$_".Split("-")[0]
	[int]$two = "$_".Split("-")[1].split(",")[0]
	[int]$three = "$_".Split(",")[1].Split("-")[0]
	[int]$four = "$_".Split(",")[1].Split("-")[1]

if (($one -le $three -and $two -ge $four) -or ($three -le $one -and $four -ge $two)) {
	$count++
}

}

write-host "count: $count"

#part 2
$puzzleInput = Get-Content -Path .\input.txt
$count = 0
$puzzleInput | ForEach-Object { 
	[int]$one = "$_".Split("-")[0]
	[int]$two = "$_".Split("-")[1].split(",")[0]
	[int]$three = "$_".Split(",")[1].Split("-")[0]
	[int]$four = "$_".Split(",")[1].Split("-")[1]

	if (($one -le $three -and $two -ge $three) -or ($three -le $one -and $four -ge $one)){

    	$count++
	}
}
write-host "count: $count"
