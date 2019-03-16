# gentoo-stage4

## Table of Contents
- [Idea](#Idea)
- [Stage4 TYPES](#Stage4-types)
- [Scripts](#Scripts)
- [Support for others Cloud Providers](#Support-for-others-Cloud-Providers)
- [Packages](#Packages)
- [Services](#Services)
- [Kernels](#Kernels)
- [Future changes and releases](#Future-changes-and-releases)
- [Changelog](#Changelog)
- [What you need to do...](#What-you-need-to-do...)

## Idea
All of us know that a Gentoo install takes some time compared to any other distro. Since some years, I'm installing via an auto-installer script which takes few minutes, but on each install does the some repetitive operations, so why not have a tarball which has already the basics I add on each install?

The idea borns also from the fact that some Hosting Providers (like Hetzner) do not provide a Gentoo image on their cloud virtual servers, so this is an EASY and FAST way to have Gentoo Installed everywhere.

## Stage4 TYPES
I'm providing two types of stage4:
- ***Standard***  
 It uses the standard profile (default/linux/amd64/17.0). Since nowadays the compiler forces pie and ssp, this stage4 aims to avoid to compile with ssp/pie/relro and other protections, **to speed-up as more as possible** where the protection flags are not needed, otherwise it would look very similar to the hardened stage4.  
 If you are looking for something compiled with hardened protections then look at the Hardened stage.
- ***Hardened***  
 It uses the hardened profile (default/linux/amd64/17.0/hardened) without any modifications, so all protections are enabled.

The package `app-admin/checksec` provides a script which can help you to understand the status of the compiled binaries:
~~~~
~ $ checksec --proc-all
~~~~

## Scripts
I'm providing two scripts:
- ***stage4*** ( For general usage )
- ***stage4-hetzner-cloud*** ( For Hetzner Cloud )

Why more scripts instead of one?  
The **goal** is keep the script more simple as possible without dozens of if/for, so people will be able to understand quickly what it does.  

**If your cloud provider provides a rescue system, you probably will be able to install the general stage4.**

## Support for others Cloud Providers
Do you want to have your favourite cloud provider fully supported here? Just open a ticket and I will provide to add the support.

## Packages
Packages included into the stage4:

~~~~
app-admin/checksec
app-admin/logrotate
app-admin/spectre-meltdown-checker
app-admin/syslog-ng
app-misc/delay
app-misc/tmux
app-portage/eix
app-portage/gentoolkit
net-misc/ntpsec
sys-boot/grub
sys-kernel/linux-firmware
sys-power/acpid
sys-process/cronie
sys-process/htop
~~~~

## Services
Service added to the runlevel:
~~~~
syslog-ng
acpid
cronie
net.eth0 (only for stage4-hetzner-cloud)
ntp
sshd
~~~~

## Kernels
For the *stage4-hetzner-cloud* a custom Monolithic Kernel is provided. It is based on the Hetzner Cloud hardware. If you need to include some other modules, the related Kernel config is provided, so you can start from there.  
For the *stage4*, a common genkernel-based kernel is provided.

## Future changes and releases
The future changes in the stage4 can be relevant to:
- kernel
- packages update
- any other modification in the configuration

Releases will not be frequently.  
This doesn't mean that the project is not maintained, but simply is not needed have a release every week.  
Usually a release will be done after major upstream **stable** changes (gcc, glibc) and for each toolchain update, a complete `emerge -e world` will be done before make a new release.  

In any case you can install the stage4 **anytime** and update to the latest stable packages available via emerge with:

` ~ $ emerge -DuNav world`

## Changelog
To avoid to navigate and search in the git history, a plaintext Changelog is provided, which will summarize and track the changes between the releases

## What you need to do...
If you are using something from this repository, I appreciate if you "Star" the repository. This will give me the idea on how much 
people are using this stuff and then how much effort I need to put, to maintain the project in a good status.

---

\# Gentoo hetzner cloud  
\# Gentoo stage4  
\# Gentoo cloud  
