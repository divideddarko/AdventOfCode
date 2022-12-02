#Part 1
$puzzelInput = Get-Content .\input.txt

#A = 1 Rock
#B = 2 Paper
#C = 3 Scissors

#X = 1 Rock
#Y = 2 Paper
#Z = 3 Scissors

$PlayerOneInput = @{}
$PlayerOneInput.Add(1, "A")
$PlayerOneInput.Add(2, "B")
$PlayerOneInput.Add(3, "C")

$PlayerTwoInput = @{}
$PlayerTwoInput.Add(1, "X")
$PlayerTwoInput.Add(2, "Y")
$PlayerTwoInput.Add(3, "Z")


$PlayerOneScore = 0
$PlayerTwoScore = 0

$puzzelInput | ForEach-Object { 
	$PlayerOnePlay = ($_ -split " ")[0]
	$PlayerTwoPlay = ($_ -split " ")[1]

	#Get the base score of the input
	$PlayerOneScoreInput = $PlayerOneInput.GetEnumerator() | Where-Object {$_.Value -match "$PlayerOnePlay"} | Select-Object -ExpandProperty Name
	$PlayerTwoScoreInput = $PlayerTwoInput.GetEnumerator() | Where-Object {$_.Value -match "$PlayerTwoPlay"} | Select-Object -ExpandProperty Name

# a 1 draws x 1 
# a 1 loses y 2
# a 1 beats z 3
#
# b 2 beats x 1 
# b 2 draws y 2
# b 2 loses z 3
#
# c 3 loses x 1
# c 3 beats y 2
# c 3 draws z 3
#
# A - Y 
# B - X 
# C - Z 

    if ($PlayerOnePlay -match "a") { 
        if ($PlayerOneScoreInput -match $PlayerTwoScoreInput) { 
			$PlayerTwoScore = $PlayerTwoScore + 3 + [int]$PlayerTwoScoreInput
            #draw
        } elseif ($PlayerTwoScoreInput -eq 2) { 
			$PlayerTwoScore = $PlayerTwoScore + 6 + [int]$PlayerTwoScoreInput
	        #loses
    	} else { 
			$PlayerTwoScore = $PlayerTwoScore + [int]$PlayerTwoScoreInput
            #wins
	    }
    }

    if ($PlayerOnePlay -match "b") {
	    if ($PlayerOneScoreInput -match $PlayerTwoScoreInput) {
			$PlayerTwoScore = $PlayerTwoScore + 3 + [int]$PlayerTwoScoreInput
		    #draw
    	} elseif ($PlayerTwoScoreInput -eq 3) { 
			$PlayerTwoScore = $PlayerTwoScore + 6 + [int]$PlayerTwoScoreInput
	    	#loses
    	} else {
			$PlayerTwoScore = $PlayerTwoScore + [int]$PlayerTwoScoreInput
			#wins
	    }
    }

    if ($PlayerOnePlay -match "c") {
	    if ($PlayerOneScoreInput -match $PlayerTwoScoreInput) {
			$PlayerTwoScore = $PlayerTwoScore + 3 + [int]$PlayerTwoScoreInput
		    #draw
    	} elseif ($PlayerTwoScoreInput -eq 1) { 
			$PlayerTwoScore = $PlayerTwoScore + 6 + [int]$PlayerTwoScoreInput
	    	#loses
    	} else {
			$PlayerTwoScore = $PlayerTwoScore + [int]$PlayerTwoScoreInput
	    	#wins
    	}
    }
}

write-host "Final Score Part One: $($PlayerTwoScore)" -ForegroundColor Green




#Part 2
$puzzelInput = Get-Content .\input.txt

#A = 1 Rock
#B = 2 Paper
#C = 3 Scissors

#X = Lose
#Y = Draw
#Z = Win

$PlayerOneInput = @{}
$PlayerOneInput.Add(1, "A")
$PlayerOneInput.Add(2, "B")
$PlayerOneInput.Add(3, "C")

$PlayerTwoInput = @{}
$PlayerTwoInput.Add(1, "X")
$PlayerTwoInput.Add(2, "Y")
$PlayerTwoInput.Add(3, "Z")


$PlayerOneScore = 0
$PlayerTwoScore = 0

$puzzelInput | ForEach-Object { 
	$PlayerOnePlay = ($_ -split " ")[0]
	$PlayerTwoPlay = ($_ -split " ")[1]

	#Get the base score of the input
	$PlayerOneScoreInput = $PlayerOneInput.GetEnumerator() | Where-Object {$_.Value -match "$PlayerOnePlay"} | Select-Object -ExpandProperty Name
	$PlayerTwoScoreInput = $PlayerTwoInput.GetEnumerator() | Where-Object {$_.Value -match "$PlayerTwoPlay"} | Select-Object -ExpandProperty Name

    if ($PlayerOnePlay -match "a") { 
		if ($PlayerTwoPlay -match "x") {
			#lose 
			$PlayerTwoScore = $PlayerTwoScore + 3
		} elseif ($PlayerTwoPlay -match "y") { 
			#draw
			$PlayerTwoScore = $PlayerTwoScore + 3 + [int]$PlayerOneScoreInput
		} else { 
			#win
			$PlayerTwoScore = $PlayerTwoScore + 6 + 2

		}
    }

    if ($PlayerOnePlay -match "b") {
		if ($PlayerTwoPlay -match "x") {
			#lose
			$PlayerTwoScore = $PlayerTwoScore + 1
		} elseif ($PlayerTwoPlay -match "y") { 
		   #draw
			$PlayerTwoScore = $PlayerTwoScore + 3 + [int]$PlayerOneScoreInput
		} else { 
			#win
			$PlayerTwoScore = $PlayerTwoScore + 6 + 3
	    }
    }

    if ($PlayerOnePlay -match "c") {
		if ($PlayerTwoPlay -match "x") {
            #lose
			$PlayerTwoScore = $PlayerTwoScore + 2
		} elseif ($PlayerTwoPlay -match "y") { 
			#draw
			$PlayerTwoScore = $PlayerTwoScore + 3 + [int]$PlayerOneScoreInput
		} else { 
			#win
			$PlayerTwoScore = $PlayerTwoScore + 6 + 1
	    }
    }
}

write-host "Final Score Part Two: $($PlayerTwoScore)" -ForegroundColor Green
