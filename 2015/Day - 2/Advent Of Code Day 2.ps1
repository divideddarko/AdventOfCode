#Day 2 of Advent of Code 2015, Part one
#How much fabric is required
$TotalFabric = 0

#Get the content of the fabric file
$Fabric = Get-Content "$ENV:USERPROFILE\documents\GIT\powershell\AOC-2015\day2\fabric.txt"

#read each line of the fabric
$Fabric | ForEach-Object{
   #break each value for length, width and height, set as int to allow sums to be applied
   [int]$l = $_.Split('x')[0]
   [int]$w = $_.Split('x')[1]
   [int]$h = $_.Split('x')[2]
   
   #Get the values of each area
   $a = 2 * $l * $w
   $b = 2 * $w * $h
   $c = 2 * $h * $l
  
   #find the smallest summed number
   $Smallest = $l * $w

   if(($w * $h) -lt $Smallest){
      $Smallest = $w * $h
   }

   if(($h * $l) -lt $Smallest){
      $Smallest = $h * $l
   }
   #Add total to fabric
   $TotalFabric = ($TotalFabric + $a + $b + $c + $Smallest)
}
#Display Total Fabric after all sums completed
"Total Fabric $TotalFabric"


#Part 2
#get ribbon length

#set length to 0
$ribbonLength = 0
#get input content
$Fabric = Get-Content "$ENV:USERPROFILE\documents\GIT\powershell\AOC-2015\day2\fabric.txt"
#filter through each line
$Fabric | ForEach-Object {
   #create an array of data
   $array = @()
   #add to the array each value from the length, width, height
   $array += [int]$_.Split('x')[0]
   $array += [int]$_.Split('x')[1]
   $array += [int]$_.Split('x')[2]
   #sort from smallest to largest values
   $array = $array | Sort-Object
   #find the length for each line of data and add it to ribbon length total
   $ribbonLength += 2 * $array[0] + 2 * $array[1] + $array[0] * $array[1] * $array[2]
}
#print data
"Total Ribbon: $ribbonLength"