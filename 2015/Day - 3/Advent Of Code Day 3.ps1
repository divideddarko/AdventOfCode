#Advent Of Code 2015 Day 3
#Part 1

#starting location (first location)
# ^ - move north 1 
# v - more south 1
# > - more east 1
# < - more west 1
#a present is added for every location visited 

#How many houses get 1 or more presents - count houses which have at least one visit discard any above 1 as it's already counted
$Direction = Get-Content "$ENV:USERPROFILE\Documents\GIT\AOC-2015\day3\houses.txt"
#break up the input into an array
$Direction = $Direction.ToCharArray()    
#X, Y coords to get the current location of santa
$X = 0
$Y = 0
#create hash table, key is value of x,y value is value++
$Santa = @{}
$RoboSanta = @{}
$Results = @{}

#Add a starting location
$Santa.Add("X$($x):Y$($y)", 2)


$Direction | ForEach-Object {
     
     #check what the input is equal to
     if($i % 2){
          if ($_ -eq ">") {
               #increate X direction from starting 0
               $X++
               #get an item from the hash array + 1 if it exists
               $AddVal = $Santa.Item("X$($X):Y$($Y)") + 1
               #does the hash array contain the coords already given if so set the new value to $a
               if ($Santa.Contains("X$($X):Y$($Y)")) {
                    $Santa.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    #Add value to hash if it doesn't already exist.
                    $Santa.Add("X$($X):Y$($Y)", 1)
               }
          }
          if ($_ -eq "<") {
               $X--
               $AddVal = $Santa.Item("X$($X):Y$($Y)") + 1
               if ($Santa.Contains("X$($X):Y$($Y)")) {
                    $Santa.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    $Santa.Add("X$($X):Y$($Y)", 1)
               }
          }
          if ($_ -eq "^") {
               $Y++
               $AddVal = $Santa.Item("X$($X):Y$($Y)") + 1
               if ($Santa.Contains("X$($X):Y$($Y)")) {
                    $Santa.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    $Santa.Add("X$($X):Y$($Y)", 1)
               }
          }
          if ($_ -eq "v") {
               $Y--
               $AddVal = $Santa.Item("X$($X):Y$($Y)") + 1
               if ($Santa.Contains("X$($X):Y$($Y)")) {
                    $Santa.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    $Santa.Set_Item("X$($X):Y$($Y)", 1)
               }
          }
     }else{
          if ($_ -eq ">") {
               #increate X direction from starting 0
               $X++
               #get an item from the hash array + 1 if it exists
               $AddVal = $RoboSanta.Item("X$($X):Y$($Y)") + 1
               #does the hash array contain the coords already given if so set the new value to $a
               if ($RoboSanta.Contains("X$($X):Y$($Y)")) {
                    $RoboSanta.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    #Add value to hash if it doesn't already exist.
                    $RoboSanta.Add("X$($X):Y$($Y)", 1)
               }
          }
          if ($_ -eq "<") {
               $X--
               $AddVal = $RoboSanta.Item("X$($X):Y$($Y)") + 1
               if ($RoboSanta.Contains("X$($X):Y$($Y)")) {
                    $RoboSanta.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    $RoboSanta.Add("X$($X):Y$($Y)", 1)
               }
          }
          if ($_ -eq "^") {
               $Y++
               $AddVal = $RoboSanta.Item("X$($X):Y$($Y)") + 1
               if ($RoboSanta.Contains("X$($X):Y$($Y)")) {
                    $RoboSanta.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    $RoboSanta.Add("X$($X):Y$($Y)", 1)
               }
          }
          if ($_ -eq "v") {
               $Y--
               $AddVal = $RoboSanta.Item("X$($X):Y$($Y)") + 1
               if ($RoboSanta.Contains("X$($X):Y$($Y)")) {
                    $RoboSanta.Set_Item("X$($X):Y$($Y)", $AddVal)
               } else {
                    $RoboSanta.Set_Item("X$($X):Y$($Y)", 1)
               }
          }
     }
     $i++
}

#compare the two hash tables to where they overlap
#
#
#

$RoboSanta | ForEach-Object{
     if($Santa -match $RoboSanta){
          $Results.Add_Item("$RoboSanta")
     }
}
