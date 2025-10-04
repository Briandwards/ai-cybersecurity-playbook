<#
.SYNOPSIS
    Security Health Check Script
.DESCRIPTION
    Performs Windows security audit:
    - Checks updates
    - Firewall status
    - Local admin accounts
    - Antivirus status
    - Generates a report
#>

Write-Host "===== Running Security Health Check =====" -ForegroundColor Cyan

# Create output directory
$OutputPath = "$env:USERPROFILE\SecurityReports"
if (-not (Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null
}

$ReportFile = Join-Path $OutputPath "SecurityHealthReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

# Report header
"Security Health Check Report - $(Get-Date)" | Out-File $ReportFile
"==========================================" | Out-File $ReportFile -Append

# 1️⃣ Windows Update
Write-Host "Checking Windows Update..." -ForegroundColor Yellow
"--- Windows Update ---" | Out-File $ReportFile -Append
Try {
    Get-HotFix | Sort InstalledOn -Descending | Select-Object -First 5 | Format-Table -AutoSize | Out-String | Out-File $ReportFile -Append
} Catch { "Could not retrieve updates." | Out-File $ReportFile -Append }

# 2️⃣ Firewall Status
Write-Host "Checking Firewall..." -ForegroundColor Yellow
"--- Firewall Status ---" | Out-File $ReportFile -Append
Try {
    Get-NetFirewallProfile | ForEach-Object { "Profile: $($_.Name) | Enabled: $($_.Enabled)" | Out-File $ReportFile -Append }
} Catch { "Firewall check failed." | Out-File $ReportFile -Append }

# 3️⃣ Local Admin Accounts
Write-Host "Listing local admin accounts..." -ForegroundColor Yellow
"--- Local Admin Accounts ---" | Out-File $ReportFile -Append
Try {
    Get-LocalGroupMember -Group "Administrators" | ForEach-Object { "Account: $($_.Name)" | Out-File $ReportFile -Append }
} Catch { "Cannot retrieve local admins. Run as Administrator." | Out-File $ReportFile -Append }

# 4️⃣ Antivirus Status
Write-Host "Checking Antivirus..." -ForegroundColor Yellow
"--- Antivirus Status ---" | Out-File $ReportFile -Append
Try {
    Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct | ForEach-Object { "Name: $($_.displayName) | State: $($_.productState)" | Out-File $ReportFile -Append }
} Catch { "Cannot retrieve antivirus info." | Out-File $ReportFile -Append }

# Summary
"--- End of Report ---" | Out-File $ReportFile -Append
Write-Host "Report saved to: $ReportFile" -ForegroundColor Green
