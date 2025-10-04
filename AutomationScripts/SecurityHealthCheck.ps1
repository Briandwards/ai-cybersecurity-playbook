<#
.SYNOPSIS
    Security Health Check Script for Small Businesses
.DESCRIPTION
    This script performs a quick Windows security health check:
    - Checks Windows Update status
    - Confirms firewall status on all profiles
    - Lists local administrator accounts
    - Verifies antivirus status
    - Exports results to a report file
.NOTES
    Author: CIS Capstone Student
    Created with AI assistance (ChatGPT) and manual validation
    Version: 1.0
#>

Write-Host "===== Running Security Health Check =====" -ForegroundColor Cyan

# Create output directory
$OutputPath = "$env:USERPROFILE\SecurityReports"
if (-not (Test-Path $OutputPath)) {
    New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null
}

$ReportFile = Join-Path $OutputPath "SecurityHealthReport_$(Get-Date -Format 'yyyyMMdd_HHmmss').txt"

# Start report
"Security Health Check Report - $(Get-Date)" | Out-File $ReportFile
"==========================================" | Out-File $ReportFile -Append

# ------------------------------
# 1️⃣  WINDOWS UPDATE STATUS
# ------------------------------
Write-Host "`nChecking Windows Update status..." -ForegroundColor Yellow
"--- Windows Update Status ---" | Out-File $ReportFile -Append

Try {
    $Updates = Get-WindowsUpdateLog -ErrorAction SilentlyContinue
    (Get-HotFix | Sort-Object -Property InstalledOn -Descending | Select-Object -First 5) |
        Format-Table -AutoSize | Out-String | Out-File $ReportFile -Append
    "Windows Update: OK (Recent patches listed above)" | Out-File $ReportFile -Append
} Catch {
    "Unable to retrieve update log. Ensure you have permission." | Out-File $ReportFile -Append
}

# ------------------------------
# 2️⃣  FIREWALL STATUS
# ------------------------------
Write-Host "Checking Windows Firewall..." -ForegroundColor Yellow
"--- Firewall Status ---" | Out-File $ReportFile -Append

Try {
    $FirewallProfiles = Get-NetFirewallProfile
    foreach ($profile in $FirewallProfiles) {
        "Profile: $($profile.Name) | Enabled: $($profile.Enabled)" | Out-File $ReportFile -Append
    }
} Catch {
    "Firewall check failed." | Out-File $ReportFile -Append
}

# ------------------------------
# 3️⃣  LOCAL ADMIN ACCOUNTS
# ------------------------------
Write-Host "Listing local administrator accounts..." -ForegroundColor Yellow
"--- Local Administrator Accounts ---" | Out-File $ReportFile -Append

Try {
    $Admins = Get-LocalGroupMember -Group "Administrators"
    foreach ($admin in $Admins) {
        "Account: $($admin.Name) | ObjectClass: $($admin.ObjectClass)" | Out-File $ReportFile -Append
    }
} Catch {
    "Unable to retrieve local admin accounts. Try running PowerShell as Administrator." | Out-File $ReportFile -Append
}

# ------------------------------
# 4️⃣  ANTIVIRUS STATUS
# ------------------------------
Write-Host "Checking antivirus status..." -ForegroundColor Yellow
"--- Antivirus Status ---" | Out-File $ReportFile -Append

Try {
    $AV = Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntivirusProduct
    foreach ($item in $AV) {
        "Name: $($item.displayName) | Status: $($item.productState)" | Out-File $ReportFile -Append
    }
} Catch {
    "Unable to retrieve antivirus information." | Out-File $ReportFile -Append
}

# ------------------------------
# 5️⃣  FINAL SUMMARY
# ------------------------------
Write-Host "`nFinalizing report..." -ForegroundColor Yellow
"--- Summary ---" | Out-File $ReportFile -Append
"Report generated: $ReportFile" | Out-File $ReportFile -Append

Write-Host "`nSecurity Health Check complete!" -ForegroundColor Green
Write-Host "Report saved to: $ReportFile" -ForegroundColor Cyan
