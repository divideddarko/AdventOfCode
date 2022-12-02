$content = Get-Content("input.txt")

$BingoNumbers = $content.Split(" ")[0]

$BingoNumbersCalled = $BingoNumbers -Split "," | ForEach-Object { 
    
    Write-Host "Working with num $_"
    $numtocheck = $_

    start-sleep -s 3

    $content.split(" ")[2].IndexOf("$_") .. $content.Length | ForEach-Object { 
        Write-Host "Working on $_ "
        start-sleep -s 3
        if ($_ -eq $numtocheck) { 
            Write-Host "found $_ "
            start-sleep -s 3
        }
    }

}


<# as it's a 5x5 board I can check to see if antyhing is highlighted by visibles of 5

1   2  3  4  5
6   7  8  9 10
11 12 13 14 15
16 17 18 19 20
21 22 23 24 25


so if it matches 1,2,3,4,5 or 1,6,11,16,21
#>

