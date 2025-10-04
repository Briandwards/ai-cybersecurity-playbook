# 🛡️ Small Business Cybersecurity Playbook

## Overview
This playbook provides a simple, step-by-step cybersecurity framework tailored for small businesses and nonprofits. It’s designed to be clear, actionable, and affordable — no dedicated IT team required.

---

## 1. Core Security Principles

### 1.1 Least Privilege
Users should only have the access they need to perform their duties.  
- Remove admin rights from daily accounts.  
- Create separate admin accounts for configuration tasks.

### 1.2 Patch Management
Unpatched software is one of the top causes of breaches.  
- Enable automatic updates for Windows, browsers, and key apps.  
- Schedule weekly update checks.

### 1.3 Backup & Recovery
Regular backups prevent ransomware losses.  
- Use **3-2-1 rule**: 3 copies, 2 media types, 1 offsite.  
- Test restores monthly.

### 1.4 Secure Configuration
Disable unnecessary services and default passwords.  
- Rename the default “Administrator” account.  
- Disable Guest accounts.  
- Enforce password length and complexity policies.

### 1.5 User Awareness
Train employees to recognize phishing and social engineering.  
- Conduct quarterly training.  
- Send simulated phishing tests to improve awareness.

---

## 2. Threat Areas

| Threat | Description | Mitigation |
|--------|--------------|-------------|
| **Phishing** | Fake emails tricking users into revealing credentials | Awareness training, MFA |
| **Ransomware** | Malicious encryption of files | Backups, patching, limited privileges |
| **Insider Threats** | Misuse by employees | Role-based access, logging |
| **Unpatched Systems** | Old software exploited | Automatic updates |
| **Weak Passwords** | Easily guessed passwords | Password managers, MFA |

---

## 3. Response Planning
When incidents occur, every second counts.  
- Follow the **Incident Response Template** provided in `IncidentResponseTemplates.md`.  
- Document incidents and lessons learned.  
- Review and update controls quarterly.

---

## 4. Ongoing Maintenance

| Task | Frequency | Responsible |
|------|------------|-------------|
| Review user access | Monthly | IT/Admin |
| Check Windows updates | Weekly | Admin |
| Verify backups | Daily | IT/Owner |
| Review failed logins | Weekly | IT/Admin |
| Conduct training | Quarterly | HR/Admin |

---

## 5. Automation Option
Run `SecurityHealthCheck.ps1` weekly to automatically generate a security status report, covering:
- Patch status  
- Inactive accounts  
- Failed login attempts  
- Backup verification  

---

**Author:** CIS Capstone Student  
**Created with AI assistance (ChatGPT) and manual validation.**
