# Script: Get-NeglectedFiles.ps1
# Author: Ed Wilson, MSFT
# Date: 01/27/2014 16:57:52
# Keywords: Storage, Files
# Comments: HSG-2-7-14

Function Get-NeglectedFiles

{

 Param([string[]]$path,

       [int]$numberDays)

 $cutOffDate = (Get-Date).AddDays(-$numberDays)

 Get-ChildItem -Path $path |

 Where-Object {$_.LastAccessTime -le $cutOffDate}

}
