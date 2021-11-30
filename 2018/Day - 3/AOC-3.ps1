$fabricData = get-content "$ENV:USERPROFILE\Desktop\fabric.txt"

$fabHash = @{}

$fabricData | ForEach-Object{
   [int]$fabricHeight = $_.split(' ').split(',')[2]
   [int]$fabricWidth = $_.split(' ').Split(',').Split(':')[3]
   [int]$heightadd = $_.split(' ').Split(',').Split(':').Split('x')[5]
   [int]$widthadd = $_.split(' ').Split(',').Split(':').Split('x')[6]

   ($fabricHeight + 1)  .. ($fabricHeight + $heightadd) | ForEach-Object{
      $h = $_
      ($fabricWidth + 1) .. ($fabricWidth + $widthadd) | ForEach-Object{
         $w = $_
         $a = $fabHash.item("$H H $w W") + 1
         if($fabHash.Contains("$H H $w W")){
            $fabHash.Set_Item("$H H $w W", $a)
         }else{
            $fabHash.Add("$H H $w W", 1)
         }
      }
   }
}

$OverlapFabric = 0
$results = $fabHash.GetEnumerator() | Group-Object Value
$results | ForEach-Object{
   if($_.Name -gt 1){
      $OverlapFabric += $_.Count      
   }
}
"Overlapping Fabric: $OverlapFabric"