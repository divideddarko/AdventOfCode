$inp = Get-Content .\input.txt

$arr = @{ }

$q = 0
$inp -split (',') | ForEach-Object {
    $arr.Add($q, $_)
    $q++
}

$arr.set_Item(1, 12)
$arr.set_Item(2, 2)

for ($i = 0; $i -lt $arr.Count; $i = $i + 4) {
    switch ($arr.item($i)) {
        1 {
            [int]$pos1 = $arr.Item($i + 1)
            [int]$pos2 = $arr.Item($i + 2)
            [int]$pos3 = $arr.Item($i + 3)
            $count = [int]$arr.Item($pos1) + [int]$arr.Item($pos2)
            $arr.Set_Item($pos3, $count)
        }
        2 {
            [int]$pos1 = $arr.Item($i + 1)
            [int]$pos2 = $arr.Item($i + 2)
            [int]$pos3 = $arr.Item($i + 3)
            $count = [int]$arr.Item($pos1) * [int]$arr.Item($pos2)
            $arr.Set_Item($pos3, $count)
        }
        99 {
            break
        }
    }
}

$arr.item(0)


# part 2

function inp {
    [CmdletBinding()]
    param (
        [Parameter()]
        [hashtable]
        $arr
    )
    for ($i = 0; $i -lt $arr.Count; $i = $i + 4) {

        if ([int]$arr.Item(0) -match '19690720') {
            "$($arr.Item(1)) $($arr.Item(2))"
            return
        }

        switch ($arr.item($i)) {
            1 {
                [int]$pos1 = $arr.Item($i + 1)
                [int]$pos2 = $arr.Item($i + 2)
                [int]$pos3 = $arr.Item($i + 3)
                $count = [int]$arr.Item($pos1) + [int]$arr.Item($pos2)
                $arr.Set_Item($pos3, $count)
            }
            2 {
                [int]$pos1 = $arr.Item($i + 1)
                [int]$pos2 = $arr.Item($i + 2)
                [int]$pos3 = $arr.Item($i + 3)
                $count = [int]$arr.Item($pos1) * [int]$arr.Item($pos2)
                $arr.Set_Item($pos3, $count)
            }
            99 {
                break
            }
        }
    }
}

$inp = Get-Content .\input.txt

for ($n = 0; $n -lt 100; $n++) {
    for ($j = 0; $j -lt 100; $j++) {
        $arr = @{ }

        $q = 0
        $inp -split (',') | ForEach-Object {
            $arr.Add($q, $_)
            $q++
        }
        $arr.Set_Item(1, $j)
        $arr.Set_Item(2, $n)

        inp($arr)
    }
}
