# Linux

## 📚 Modules
- Understand GNU/Linux.
- Basic Linux commands.
- Server administration.

## 🛠️ Labs
- Install Ubuntu 22.04.
- Server administration practice.

---

## 🐧 Introduction to Linux

Linux is **not an operating system (OS)** by itself — it is a **kernel**.  
The story begins with the **GNU Project**, which aimed to create a free operating system to compete with AT&T’s proprietary UNIX.

GNU successfully developed user-space programs (such as games, music players, and editors) but **lacked a kernel** to complete the system.

**Kernel**:  
> A kernel is core software that acts as a bridge between applications and hardware.

In 1991, **Linus Torvalds** developed the **Linux kernel**. When combined with GNU tools, it created a complete, free operating system known as **GNU/Linux** (commonly referred to simply as "Linux").

---

## 🏡 Linux Distributions (Distros)

Linux has various versions called **distributions (distros)**, each customized for different purposes:

| Distro  | Description                    |
|---------|---------------------------------|
| Ubuntu  | A beginner-friendly and widely used Linux distribution. |
| Kali    | A specialized distribution for penetration testing and cybersecurity. |
| Fedora  | A bleeding-edge, community-driven distro focusing on the latest technologies. |
| Debian  | A stable and reliable base, popular for servers and systems that require robustness. |

---

## 🗂️ Linux Directory Structure

Here’s a basic overview of the Linux directory structure:

| Directory | Purpose |
|-----------|---------|
| `/home`   | Personal files and directories for users. |
| `/usr`    | User-installed software and utilities. |
| `/proc`   | Virtual filesystem containing runtime system information (e.g., `/proc/meminfo`). |
| `/etc`    | Configuration files for the system (e.g., `passwd`, `hosts.allow`). |
| `/tmp`    | Temporary files created by programs. |
| `/bin`    | Essential executable programs (e.g., `ssh`, `telnet`, `kill`, `less`). |
| `/sbin`   | System binaries: essential system administration commands (e.g., `reboot`, `shutdown`). |
| `/local`  | Locally installed software and user data. |

![image](https://linuxhandbook.com/content/images/2020/06/linux-directory-structure.png)
[Source](https://linuxhandbook.com/linux-directory-structure/)

---

## 💻 Shell, Console, Terminal Explained

| Term     | Meaning |
|----------|---------|
| **Console** | Physical device to interact with the computer (e.g., monitor, keyboard, mouse). |
| **Terminal** | A software application that acts as a wrapper to input commands. |
| **Shell** | A command-line interpreter that receives and executes user commands. |

---

## 🖥️ What is Command Line?

The **command line interface (CLI)** is a **text-based interface** that allows you to interact directly with the operating system by typing commands.

A basic command line has:
- A **prompt** waiting for your input.
- **Typed command** to perform an action.
- **Computer response** showing output or result.

---

## 🛠️ Basic Linux Commands

| Function                  | Common Commands                |
|----------------------------|---------------------------------|
| Navigate the file system   | `cd`, `pwd`, `ls`               |
| Manipulate files           | `cp`, `touch`, `mkdir`, `mv`, `rm` |
| View files                 | `cat`, `head`, `tail`           |
| User manual (help)         | `man`                           |
| Search for files           | `find . -name "*.log" -size +1G` |
| Other useful commands      | `history`, `clear`, `shutdown`, `reboot`, `uptime` |

> Fun fact: A directory in Linux is itself a type of file that holds the names of other files.

---

## 🔥 Interesting Commands

| Action | Command |
|--------|---------|
| Replace all `unix` words with `linux` | `sed 's/unix/linux/g' geekfile.txt` |
| Stop Docker containers containing "minio" | `docker ps -a \| grep "minio" \| awk 'NR>1 {print $1}' \| xargs docker stop` |
| Find large files or folders (>1GB) | `find / -type f -size +1G OR find / -type d -size +1G` |
| Check disk usage summary | `du -sh *` |

---

## 👥 Server Administration Basics: User Management

| Task                         | Command Example |
|-------------------------------|-----------------|
| Add a user                    | `useradd username` |
| Update a user's password      | `passwd username` |
| Delete a user                 | `userdel username` |
| Give a user permission on a file | `chown username filepath && chmod 644 filepath` |
| Add a new group               | `groupadd groupname` |
| Add a user to an existing group | `usermod -aG groupname username` |
| Access a user account         | `su username -s /bin/bash` |

> **Permissions**:  
> `r = read`, `w = write`, `x = execute`.

Use `chmod` to change permissions, e.g., `chmod 777 filename` (full access).

![image](https://www.reddit.com/media?url=https%3A%2F%2Fpreview.redd.it%2Fvkxuqbatopk21.png%3Fwidth%3D320%26crop%3Dsmart%26auto%3Dwebp%26s%3D96478a76704cce2fcdf85f234fe54708d285a038)
[Source](https://www.reddit.com/r/linux/comments/ayditr/chmod_cheatsheet/)

---

## 📖 References

- [How to Install Ubuntu 22.04 Alongside Windows 11 (Dual Boot)](https://linuxsimply.com/linux-basics/os-installation/dual-boot/windows-11-and-ubuntu/)
- [Introduction to Unix/Linux File Permissions (RIT SIMG211 Course)](https://www.cis.rit.edu/class/simg211/unixintro/Access_Permissions.html)
- [The Missing Semester of Your CS Education (MIT Course)](https://missing.csail.mit.edu/)
- [Understanding the chmod Command in Linux (Linuxize)](https://linuxize.com/post/chmod-command-in-linux/)



