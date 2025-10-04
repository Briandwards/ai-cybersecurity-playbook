#  AI-Assisted Cybersecurity Playbook for Small Businesses

## Overview
Practical cybersecurity toolkit including:
- Security Playbook
- Incident Response Templates
- Security Checklist
- Automation Script (`SecurityHealthCheck.ps1`)

Designed for small organizations to **implement, monitor, and improve security**.

---

## Business Value
- Actionable guidance for non-technical users
- Automated audit of Windows environment
- Reduces risk of breaches, ransomware, and misconfigurations
- Portfolio-ready demonstration of cybersecurity skills

---

## File Summary

| File | Description |
|------|------------|
| SecurityPlaybook.md | Core guide and best practices |
| IncidentResponseTemplates.md | Step-by-step incident handling |
| SecurityChecklist.md | Self-assessment checklist |
| AutomationScripts/SecurityHealthCheck.ps1 | Automated Windows audit script |
| Reflection.md | AI brainstorming and learning reflection |

---

## Usage

### Run Automation Script
```powershell
Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
cd .\AutomationScripts\
.\SecurityHealthCheck.ps1
