<#$content = Get-Content (".\input.txt")
$contentLength = $content.Length

$positionNum = @{}

$content | ForEach-Object { 
    $CharArray = $_.ToCharArray()
    
    for ($i = 0; $i -lt $CharArray.Length; $i++) {

        if ($CharArray[$i] -eq "1") {
            if (!$positionNum.ContainsKey($i)) { 
                $positionNum.Add($i, 1)
            } else { 
                $currentCount = $positionNum.Item($i)
                $positionNum.Set_Item($i, $($currentCount + 1))
            }
        }
    }
}

$positionNum.GetEnumerator() | Sort-Object -Property Name | ForEach-Object { 
    if ($_.Value -gt $($contentLength / 2)) { 
        $Gamma += "1"
        $Epsilon += "0"
    } else {
        $Gamma += "0"
        $Epsilon += "1"
    }
}

$g = [Convert]::ToInt32($Gamma, 2)
$e = [Convert]::ToInt32($Epsilon, 2)

Write-host "Gamma: $($g) Epsilon: $($e) `nResults: $($g * $e)"
#>

# Part 2
function Get-Data { 
    [System.Collections.ArrayList]$content = Get-Content (".\testinput.txt")
    $Counter = @()
    $conLength = $content.Count

    $pos = 0
    $content[0].ToCharArray() | ForEach-Object {
        $CounterObject = New-Object PSObject
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "CharPos" -Value $pos
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "One" -Value 0 -Force
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "Zero" -Value 0 -Force  
        $Counter += $CounterObject
        $pos++
    }

    $content | ForEach-Object {
        $pos = 0
        $_.ToCharArray() | ForEach-Object {
            $v = [int]::Parse($_)

            if ($v -eq "1") {
                $Counter[$pos].One = $($Counter[$pos].One + 1)
            } else { 
                $Counter[$pos].Zero = $($Counter[$pos].Zero + 1)
            }
            $pos++
        }
    }
}


# function get-cotwo {
#     [System.Collections.ArrayList]$content = Get-Content (".\testinput.txt")
#     $Counter = @()
#     $conLength = $content.Count

#     $pos = 0
#     $content[0].ToCharArray() | ForEach-Object {
#         $CounterObject = New-Object PSObject
#         $CounterObject | Add-Member -MemberType "NoteProperty" -Name "CharPos" -Value $pos
#         $CounterObject | Add-Member -MemberType "NoteProperty" -Name "One" -Value 0 -Force
#         $CounterObject | Add-Member -MemberType "NoteProperty" -Name "Zero" -Value 0 -Force  
#         $Counter += $CounterObject
#         $pos++
#     }

#     $content | ForEach-Object {
#         $pos = 0
#         $_.ToCharArray() | ForEach-Object {
#             $v = [int]::Parse($_)

#             if ($v -eq "1") {
#                 $Counter[$pos].One = $($Counter[$pos].One + 1)
#             } else { 
#                 $Counter[$pos].Zero = $($Counter[$pos].Zero + 1)
#             }
#             $pos++
#         }
#     }
#     # Works don't touch
#     Do { 
#         $content | ForEach-Object { 
#         $RemoveAt = 0
#         $c = $_
#         # Write-host "Count: $($Content.Count)"
#         # Start-Sleep -s 1
#         $pos = 0
#         $_.ToCharArray() | ForEach-Object { 
#             $v = [int]::Parse($_)

#             # Write-host "$($c)" -ForegroundColor Green
            
#             if ($v -eq "0") { 
#                 # Write-host "Working num: $v Check against $($Counter[$pos].One) -lt $($Counter[$pos].Zero) :::  removeat $($RemoveAt)"
#                 if (($Counter[$pos].One) -le ($Counter[$pos].Zero)) {
#                     # Write-host "Rom"
#                     $content.RemoveAt($RemoveAt)
#                     continue
#                 }
#             } 
#             # else { 
#             #     # Write-host ">>>Working num: $v Check against $($Counter[$pos].Zero) -lt $($Counter[$pos].Zero) removeat $($RemoveAt)"
#             #     if ($($Counter[$pos].Zero) -le $($Counter[$pos].One)) { 
#             #         # Write-host "ove"
#             #         $content.RemoveAt($RemoveAt)
#             #         continue
#             #     }
#             # }
#             $pos++
#         }
#         $RemoveAt++
#         $Content
#     }
#     } until ($content.Count -eq 1)

#     $cotwo = $content
#     Write-host "Cotwo $cotwo" -ForegroundColor Red
#     return $cotwo
# }


function get-Oxygen {
    [System.Collections.ArrayList]$content = Get-Content (".\testinput.txt")
    $Counter = @()

    $pos = 0
    $content[0].ToCharArray() | ForEach-Object {
        $CounterObject = New-Object PSObject
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "CharPos" -Value $pos
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "One" -Value 0 -Force
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "Zero" -Value 0 -Force  
        $Counter += $CounterObject
        $pos++
    }

    $content | ForEach-Object {
        $pos = 0
        $_.ToCharArray() | ForEach-Object {
            $v = [int]::Parse($_)

            if ($v -eq "1") {
                $Counter[$pos].One = $($Counter[$pos].One + 1)
            } else { 
                $Counter[$pos].Zero = $($Counter[$pos].Zero + 1)
            }
            $pos++
        }
    }
    
    $i = 0
    do { 
        $q = 0
        $content | Foreach-object {
            $q++

            $v = [int]::Parse($_[$i])

            if ($v -eq 1) {
                if (($Counter[$i].One) -gt ($Counter[$i].Zero)) { 
                    if ($q -eq $content.count) {
                        $i++
                    }
                    $content.Remove("$($_)")
                    return        
                }
            }
        }
        if ($q -eq $content.count) {
            $i++
        }
    } until ( $content.Count -eq 1 )


    
    $oxygen = [int]::Parse($content)
    Write-host "Oxygen $Oxygen" -ForegroundColor Red
    return $Oxygen
}

function get-z {
    [System.Collections.ArrayList]$content = Get-Content (".\testinput.txt")
    $Counter = @()

    $pos = 0
    $content[0].ToCharArray() | ForEach-Object {
        $CounterObject = New-Object PSObject
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "CharPos" -Value $pos
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "One" -Value 0 -Force
        $CounterObject | Add-Member -MemberType "NoteProperty" -Name "Zero" -Value 0 -Force  
        $Counter += $CounterObject
        $pos++
    }

    $content | ForEach-Object {
        $pos = 0
        $_.ToCharArray() | ForEach-Object {
            $p = [int]::Parse($_)

            if ($p -eq "1") {
                $Counter[$pos].One = $($Counter[$pos].One + 1)
            } else { 
                $Counter[$pos].Zero = $($Counter[$pos].Zero + 1)
            }
            $pos++
        }
    }

    # write-host $Counter
    
    $i = 0

    do { 
        $q = 0
        $content | Foreach-object {
            $q++
    
            $v = [int]::Parse($_[$i])
            write-host "i: $i current number: $v working with: $_"
            # start-sleep -s 3
            
            if (($v -eq 0) -and ($q -eq $content.Count) -and ((($Counter[$i].Zero) -gt ($Counter[$i].One)))) {
                    $i++
                
                    write-host "Removing $_" -ForegroundColor Blue 
                    Start-Sleep -seconds 3
                    # $content.Remove("$($_)")
                    return        
            }
            
        
            if ($q -eq $content.count) {
                $i++
            }
        }
    } until ( $content.Count -eq 1 )

    $z = [int]::Parse($content)
    Write-host "Oxygen $z" -ForegroundColor Red
    return $z
}


# Get-Data
$Oxygen = get-Oxygen
$cotwo = get-z


$a = [convert]::ToInt32($cotwo, 2)
$b = [convert]::ToInt32($Oxygen, 2)

Write-host "Results: $($a * $b)"

# hold value for each input into an array
# check each input "$input[$i]"
# check each var hold value of the count of 0 and 1
# count them and put into a hashtable check the values $contentLength /2 
# see if 1 or 0 is the most 
# remove the values that has fewer
# repreat to second char of input