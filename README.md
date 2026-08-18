<div align="center">

# ⚡ ConstStack
### The Ultra-Fast, Zero-Config Local Web Development Environment for macOS & Windows
**Engineered by ConstMind**

[![Release](https://img.shields.io/github/v/release/ArmanKT/ConstStack-releases?color=10B981&label=Latest%20Version&style=for-the-badge)](https://github.com/ArmanKT/ConstStack-releases/releases/latest)
[![macOS](https://img.shields.io/badge/macOS-Apple%20Silicon%20%26%20Intel-000000?style=for-the-badge&logo=apple&logoColor=white)](https://github.com/ArmanKT/ConstStack-releases/releases/latest)
[![Windows](https://img.shields.io/badge/Windows-10%20%2F%2011-0078D6?style=for-the-badge&logo=windows&logoColor=white)](https://github.com/ArmanKT/ConstStack-releases/releases/latest)
[![License](https://img.shields.io/badge/License-Proprietary-6366F1?style=for-the-badge)](https://constmind.com)

<br/>

<img src="assets/conststack_dashboard.png" alt="ConstStack Dashboard Preview" width="850" style="border-radius: 12px; box-shadow: 0 20px 40px rgba(0,0,0,0.5);" />

<br/><br/>

[📥 **Download Latest macOS Installer (.DMG)**](https://github.com/ArmanKT/ConstStack-releases/releases/latest) • [✨ **Features**](#-features) • [🚀 **Quick Installation**](#-quick-installation) • [⚙️ **Architecture**](#-architecture--stack) • [🌐 **Official Website**](https://constmind.com)

</div>

---

## 📖 Overview

**ConstStack** is a next-generation desktop development environment built for modern web developers. It provides a lightning-fast native stack combining **Apache 2.4, PHP-FPM Multi-Version Engine, MySQL 8.x, and phpMyAdmin** with zero configuration required.

Say goodbye to slow, bloated legacy tools like XAMPP or complex virtual machines. ConstStack runs natively with near-zero memory footprint, dedicated port isolation, and automated system background daemons.

---

## ✨ Features

### ⚡ Lightning-Fast Native Stack
* **Native Apache 2.4**: Embedded high-throughput HTTP server with `mod_proxy_fcgi` support.
* **1-Click Port 80 & 443 Support**: Bind natively to standard HTTP port 80 with native macOS Touch ID authorization and zero password prompts on reboot.
* **Strict Port Isolation**: Seamlessly switch between Port 80, 8080, 3000, and 8000 with zero ghost processes or socket collisions.

### 🐘 Multi-Version PHP Engine
* Instant switching between **PHP 8.4, 8.3, 8.2, 8.1, and 7.4**.
* Per-project PHP version assignment (e.g., legacy project on PHP 7.4, modern project on PHP 8.4 simultaneously).
* **CLI Sync**: Automatically symlinks `php`, `composer`, and runtime binaries so `php -v` in your terminal always matches your active ConstStack engine.

### 🗄️ Database & Management
* **Native MySQL 8.x Daemon**: Pre-configured with optimized buffer pools and local socket communication.
* **phpMyAdmin 5.2.3 Native Hub**: Built-in 1-click database management accessible natively via `http://localhost/phpmyadmin` or `http://localhost:8080/phpmyadmin`.

### 🌐 Local Domain Resolution (*.test)
* Built-in local DNS responder (`:5390`) that automatically maps any `.test` or custom virtual host domain to `127.0.0.1` without editing `/etc/hosts` manually.

### 🔄 In-App Automatic Updates
* Checks for updates silently in the background via GitHub CDN.
* 1-click update popup with full changelogs and zero-friction updates.

---

## 🚀 Quick Installation

### macOS (Apple Silicon M1/M2/M3/M4 & Intel)

1. Download the latest **`ConstStack-macOS-v1.0.0.dmg`** from [GitHub Releases](https://github.com/ArmanKT/ConstStack-releases/releases/latest).
2. Open the `.dmg` file and drag **ConstStack** into your **Applications** folder.
3. Launch ConstStack from Launchpad or Spotlight.

> 💡 **First Launch Note (macOS Gatekeeper)**:
> Since ConstStack is indie-distributed, macOS may prompt *"Apple cannot check it for malicious software"*.
> Simply **Right-click (Control-click)** on `ConstStack.app` in Finder ➜ Click **"Open"** ➜ Click **"Open"** on the prompt.

---

## 📊 ConstStack vs Legacy Dev Environments

| Feature | ⚡ ConstStack | 🐢 XAMPP | 🐑 Laravel Herd | 🐘 MAMP |
| :--- | :---: | :---: | :---: | :---: |
| **Startup Speed** | **< 1 sec** | 5 - 10 sec | 2 - 3 sec | 8 - 15 sec |
| **Memory Footprint** | **~40 MB** | ~250 MB | ~120 MB | ~300 MB |
| **Port 80 One-Touch Auth** | ✅ **Yes** | ❌ Manual | ✅ macOS Only | ❌ Manual |
| **Multi-PHP Project Routing** | ✅ **Yes** | ❌ Single PHP | ✅ Paid Pro Only | ❌ Paid Pro Only |
| **phpMyAdmin Integration** | ✅ **Included** | ✅ Included | ❌ None | ✅ Included |
| **Background Daemons** | ✅ **Zero-Crash** | ❌ Unstable | ✅ Yes | ❌ Clunky |
| **Auto-Updater** | ✅ **Built-in** | ❌ Manual | ✅ Yes | ❌ Manual |

---

## ⚙️ Default System Paths

ConstStack keeps all files neatly organized in your home directory without cluttering system directories:

* **Base Data Directory**: `~/.const_stack/`
* **Local Web Root (htdocs)**: `~/.const_stack/htdocs/`
* **Runtime Binaries**: `~/.const_stack/runtimes/`
* **CLI Symlinks**: `~/.const_stack/bin/` (auto-added to `$PATH`)
* **Logs Directory**: `~/.const_stack/logs/`

---

## 🛠️ System Requirements

* **macOS**: macOS 12.0 (Monterey) or later (Apple Silicon & Intel 64-bit).
* **Windows**: Windows 10 / 11 (64-bit).
* **Disk Space**: ~250 MB for core stack runtimes.

---

<div align="center">

### Developed with ❤️ by [ConstMind](https://constmind.com)

For feature requests, bug reports, and support, please open an issue in this repository.

© 2026 ConstMind. All rights reserved.

</div>
