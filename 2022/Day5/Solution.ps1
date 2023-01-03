$PuzzleInput = Get-Content .\input.txt
$words = @{}
$num = @{}

#expect num
# 6, 2
# 2, 1
# 10, 3

$PuzzleInput | ForEach-Object { 
    if ($_ -match "\[") {
        $rowValue = "$_".ToCharArray()
        $charPosition = 0
        $rowValue | ForEach-Object {
            $charPosition++
            
            if ($_ -match "[a-zA-Z]") {
                if (!$num.ContainsKey($charPosition)) {
                    $num.Add($charPosition, 1)
                }
            }
        }
    }
}

$i = 1
$num.GetEnumerator() | Sort-Object Name | Select-Object -Expand Name Value | ForEach-Object {
    $num.Set_Item($($_), $i)
    $i++
}


$PuzzleInput | Where-Object {$_ -match "\["} | ForEach-Object {
        $rowValue = "$_".ToCharArray()
        $charPosition = 0
        $rowValue | ForEach-Object { 
            $charPosition++
            if ($num.$charPosition -and $_ -match "[a-zA-Z]") { 
                $correctCharPos = $($num.$charPosition)
                if ($words.ContainsKey($correctCharPos)) {
                    $newWord = "$($words.$correctCharPos)$_"

                    $words.Set_Item($correctCharPos, $newWord)
                } else {
                    $words.Add($correctCharPos, $_)
                }
            }
        }
}

$PuzzleInput | Where-object {$_ -match "move"} | Foreach-object { 
   $previous = $words

    [int]$m = "$_".Split("move ")[1].Split(" ")[0]
    [int]$fc = "$_".Split("from ")[1].Split(" ")[0]
    [int]$tc = "$_".Split("to ")[1].Split(" ")[0]

    1 .. $m | ForEach-Object {
        $letter = "$($words.$fc[0])".Trim()
        $words.Set_Item($fc, $words.$fc.SubString(1, $words.$fc.Length - 1))

        $newWord = "$($Words.$tc)".Trim()
        $words.Set_item($tc, "$($letter)$($newword)")
    }
}

$output = $words | Foreach { if ($_.Values.Length -gt 0) { $_.Values.SubString(0,1)}} 
$output = $output.ToCharArray()
[array]::Reverse($output)
$output = -join($output)
write-host "output: $output"


#part 2
$PuzzleInput = Get-Content .\input.txt
$words = @{}
$num = @{}

#expect num
# 6, 2
# 2, 1
# 10, 3

$PuzzleInput | ForEach-Object { 
    if ($_ -match "\[") {
        $rowValue = "$_".ToCharArray()
        $charPosition = 0
        $rowValue | ForEach-Object {
            $charPosition++
            
            if ($_ -match "[a-zA-Z]") {
                if (!$num.ContainsKey($charPosition)) {
                    $num.Add($charPosition, 1)
                }
            }
        }
    }
}

$i = 1
$num.GetEnumerator() | Sort-Object Name | Select-Object -Expand Name Value | ForEach-Object {
    $num.Set_Item($($_), $i)
    $i++
}


$PuzzleInput | Where-Object {$_ -match "\["} | ForEach-Object {
        $rowValue = "$_".ToCharArray()
        $charPosition = 0
        $rowValue | ForEach-Object { 
            $charPosition++
            if ($num.$charPosition -and $_ -match "[a-zA-Z]") { 
                $correctCharPos = $($num.$charPosition)
                if ($words.ContainsKey($correctCharPos)) {
                    $newWord = "$($words.$correctCharPos)$_"

                    $words.Set_Item($correctCharPos, $newWord)
                } else {
                    $words.Add($correctCharPos, $_)
                }
            }
        }
}
$PuzzleInput | Where-object {$_ -match "move"} | Foreach-object { 
   $previous = $words

write-host "$_"

write-host "before"
$words

    [int]$m = "$_".Split("move ")[1].Split(" ")[0]
    [int]$fc = "$_".Split("from ")[1].Split(" ")[0]
    [int]$tc = "$_".Split("to ")[1].Split(" ")[0]
    
    $letterstomove = "$($words.$fc)".SubString(0, $m)
    if (($words.$fc.Length) -gt $m) {
        $lettersstaying = "$($words.$fc)".SubString($m, ($words.$fc.Length - $m))
    } else { 
        $lettersstaying = ""
    }
    write-host "letters to move : $letterstomove"
    write-host "remaining letters $lettersstaying"
    $words.Set_Item($fc, $lettersstaying)

    $newWord = "$($Words.$tc)".Trim()
    $words.Set_Item($tc, "$($LettersToMove)$($NewWord)")


}

write-host "---"
$words
$output = $words | Foreach { if ($_.Values.Length -gt 0) { $_.Values.SubString(0,1)}} 
$output = $output.ToCharArray()
[array]::Reverse($output)
$output = -join($output)
write-host "output: $output"
