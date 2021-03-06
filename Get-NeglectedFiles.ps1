# Script: Get-NeglectedFiles.ps1
# Author: John Pasula
# Original script created by Ed Wilson, MSFT and posted here:
#	https://blogs.technet.microsoft.com/heyscriptingguy/2014/02/07/use-powershell-to-find-files-that-have-not-been-accessed/
# Github: https://github.com/Ackis/Get-NeglectedFiles


Function Get-NeglectedFiles
{
	Param([string[]]$path, [int]$numberMonths)
	#$MyDocs=[Environment]::GetFolderPath("MyDocuments")
	if (TEST-PATH -path $path) {
		$cutOffDate = (Get-Date).AddMonths(-$numberMonths)
		Get-ChildItem $path -Recurse | Where-Object {$_.LastAccessTime -le $cutOffDate} | Select Name, LastAccessTime
	} else {
		WRITE-ERROR -message "Error: $path does not exist." -category 'WriteError'
	}
}
