
while ($true) {
	$x=Get-NetTCPConnection | Where-Object {$_.RemoteAddress -eq '35.89.227.215' -and $_.RemotePort -eq '443'}
	if ($x) {
		foreach ($conn in $x) {
			Write-Host "----------------------------------------------"
			$Process=(Get-Process -Id $conn.OwningProcess).Name
			$CommandLine=(Get-CimInstance Win32_Process -Filter "Handle='$($conn.OwningProcess)'").CommandLine
		
			Write-Host "Local Address: $($conn.LocalAddress)"
			Write-Host "Local Port: $($conn.LocalPort)"
			Write-Host "Remote Address: $($conn.RemoteAddress)"
			Write-Host "Remote Port: $($conn.RemotePort)"
			Write-Host "State: $($conn.State)"
			Write-Host "Process: $Process"
			Write-Host "Command Line: $CommandLine"
		}
	}
	Start-Sleep -Seconds 1
}