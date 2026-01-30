# astro-field-controller

# Astro Mini PC Field Setup Guide (Windows 11 + NINA)

This document describes the complete configuration used to turn a Windows 11 mini PC into a reliable, field-ready astrophotography controller.

Target hardware: Fanless mini PC (Intel N5105 class) running Windows 11 Pro.

---

## Goals

- Headless operation (no monitor/keyboard in the field)
- Automatic recovery after power loss
- Stable USB and network connections
- Reliable Wi-Fi hotspot
- Battery-friendly operation
- No random sleep, updates, or interruptions

---

## BIOS Configuration

Enter BIOS (DEL / F2 at boot) and configure:

### Power
- Auto Power On: Enabled
- Low Power S0 Idle: Disabled

### Connectivity
- CNVi / Wi-Fi: Enabled
- Bluetooth: Enabled (optional)

### Boot
- Fast Boot: Disabled
- Boot Mode: UEFI

### Network Stack
- PXE / Network Boot: Disabled

Result: System automatically powers on when power is applied and avoids low-power sleep states.

---

## Windows Power and Sleep Settings

### Settings → System → Power and Battery

- Power Mode: Best Performance
- Screen Off: Never
- Sleep: Never

### Control Panel → Power Options → Advanced

- USB Selective Suspend: Disabled
- PCIe Link State Power Management: Off
- Processor Min/Max: 100% / 100%
- Hard Disk Sleep: Never
- Hibernate: Disabled
- Hybrid Sleep: Off

### Startup Behavior

Disable Fast Startup.

Result: No USB dropouts, no random sleep, stable long sessions.

---

## Automatic Login

Enable automatic login:

1. Press Win + R
2. Run:


netplwiz


3. Disable "Users must enter a password"
4. Confirm credentials

Result: System boots directly to desktop without interaction.

---

## Startup and Background Cleanup

### Disable Startup Apps

Disable:

- OneDrive
- Teams
- Xbox Services
- Terminal
- Widgets
- PC Manager

Keep Enabled:

- Windows Security
- Intel and GPU Drivers

### Notifications

- Disable non-essential notifications
- Enable Focus Assist for night sessions

---

## Windows Updates

Pause updates during imaging season:

Settings → Windows Update → Pause (2–4 weeks)

Prevents forced reboots mid-session.

---

## Wi-Fi Hotspot Configuration

### Disable Wi-Fi Power Saving

Device Manager:

- Network Adapters → Intel Wi-Fi → Properties
- Power Management Tab
- Uncheck: Allow the computer to turn off

### Mobile Hotspot Settings

Settings → Network → Mobile Hotspot

- Share over: Wi-Fi
- Band: 2.4 GHz
- Power Saving: Off
- Auto-off when unused: Off

---

## Automatic Hotspot Startup (PowerShell Method)

Uses Windows Tethering API script.

### Script Location

Recommended folder: C:\Users\Michael\Documents\Astro\Hotspot\


Contains:

- hotspot.ps1
- hotspot.cmd

### CMD Wrapper Example

`powershell.exe -ExecutionPolicy Bypass -File "C:\Users\Michael\Documents\Astro\Hotspot\hotspot.ps1"`


---

## Task Scheduler Setup (Auto Start Hotspot)

Create Task:

### General
- Name: Auto Start Hotspot
- Run with highest privileges
- Run whether user is logged on or not
- Configure for: Windows 10

### Trigger
- At startup
- Delay: 1 minute

### Action
- Start program: hotspot.cmd

### Conditions
- Disable "Start only on AC power"
- Disable "Stop if on battery"

Result: Hotspot starts automatically after boot.

---

## Storage Strategy

Internal drive (128 GB) used only for:

- OS
- Drivers
- Astro software

Recommended:

- External USB SSD
- Offload data after sessions
- Avoid long-term internal storage

---

## Astro Software Stack

Install in order:

1. ASCOM Platform
2. Mount ASCOM Driver
3. Canon DSLR Driver or ASCOM DSLR
4. NINA
5. PHD2
6. ASTAP

Reboot after installation.

---

## NINA Baseline Settings

### Plate Solving

- Primary Solver: ASTAP
- Blind Solver: Enabled
- Binning: 2x2
- Timeout: 10–15 seconds

### Sequencing

- Use Advanced Sequencer
- Dither every 2–3 frames
- Minimize autofocus runs

---

## Guiding (PHD2)

- Exposure: 1–2 seconds
- Multi-star guiding: Enabled
- Dither via NINA
- Calibrate once per setup

---

## Field Workflow

### Startup

1. Connect battery
2. PC auto boots
3. Hotspot starts
4. Connect laptop or phone
5. Remote in
6. Launch NINA

### Imaging

1. Polar align
2. Plate solve
3. Start sequence
4. Monitor remotely

### Shutdown

1. Stop sequence
2. Park mount
3. Shutdown Windows
4. Disconnect power

---

## Practices to Avoid

- Do not use Sleep mode
- Do not use system optimizers
- Do not allow Windows updates during sessions
- Do not enable USB power saving
- Do not fill system drive

---

## Validation Checklist

Before field use:

- [ ] Auto power-on works
- [ ] Hotspot appears after boot
- [ ] All devices reconnect
- [ ] NINA connects cleanly
- [ ] Plate solving succeeds
- [ ] Guiding stable for 15+ minutes

---

## Result

After this configuration, the system behaves as a dedicated, silent, battery-powered observatory controller.

Minimal interaction. Maximum reliability.

---

Last updated: 2026
