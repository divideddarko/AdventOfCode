$a = Get-Content $ENV:USERPROFILE\desktop\input.txt
$b = 0

$a | ForEach-Object {

     if ($_ -match '.+[0-9]') {
          $b = $b + $_
     } elseif ($_ -match '.-[0-9]') {
          $b = $b - $_
     }
}
Write-Host $b