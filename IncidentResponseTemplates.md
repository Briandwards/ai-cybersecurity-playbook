#  Incident Response Templates

## Template 1: Phishing Email Reported

**Goal:** Contain and analyze a suspected phishing attempt.

1. Instruct the employee *not* to click or reply.
2. Forward the email as an attachment to IT or security contact.
3. Verify sender domain and header information.
4. Block sender in email system.
5. If credentials were entered, reset passwords immediately.
6. Document incident in log file or ticket.
7. Conduct awareness follow-up.

---

## Template 2: Ransomware Detected

**Goal:** Contain and recover while preserving evidence.

1. Immediately disconnect the affected machine from the network.  
2. Notify management and IT team.  
3. Preserve system logs and note file names of encrypted data.  
4. Identify backup status — restore from the most recent clean version.  
5. Report to law enforcement if needed.  
6. Conduct post-incident analysis and update backups.

---

## Template 3: Unauthorized Login Attempts

**Goal:** Detect brute-force or compromised account activity.

1. Review `SecurityHealthCheck.ps1` or Windows Event Viewer for failed logins.  
2. Lock the affected account if unusual activity is confirmed.  
3. Force a password reset and enable MFA.  
4. Check for lateral movement in network logs.  
5. Document all actions taken.

---

## Template 4: Data Breach

**Goal:** Comply with regulations and notify impacted parties.

1. Contain the breach (disable access, isolate systems).  
2. Identify the affected data and systems.  
3. Notify leadership and legal counsel.  
4. Contact regulatory bodies if personal data involved.  
5. Inform impacted users/customers if applicable.  
6. Conduct post-incident review and patch vulnerabilities.

---

**Use these templates as living documents** — customize to your organization’s contacts, tools, and communication channels.
