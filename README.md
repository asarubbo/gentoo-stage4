# gentoo-stage4

## Table of Contents
- [Idea](#Idea)
- [Stage4 TYPES](#Stage4-types)
- [Scripts](#Scripts)
- [Support for others Cloud Providers](#Support-for-others-Cloud-Providers)
- [Packages](#Packages)
- [Services](#Services)
- [Kernels](#Kernels)
- [SSH access](#SSH-access)
- [Future changes and releases](#Future-changes-and-releases)
- [Changelog](#Changelog)
- [What you need to do...](#What-you-need-to-do...)

## Idea
All of us know that a Gentoo installation takes some time compared to any other distro. For the last few years, I have been installing via an auto-installer script which takes a few minutes, but on each installation does some repetitive operations, so why not have a tarball that contains the basics I need to add on each installation?

The idea comes from the fact that some Hosting Providers (like Hetzner) do not provide a Gentoo image on their virtual cloud servers, so this is an EASY and FAST way to have Gentoo Installed everywhere.

## Stage4 TYPES
I'm providing two types of stage4:
- ***Standard***  
 It uses the standard profile (default/linux/amd64/17.1). Since nowadays the compiler forces pie and ssp, this stage4 aims to avoid compiling with ssp/pie/relro and other protections, **to speed-up as much as possible** where the protection flags are not needed, otherwise it would look very similar to the hardened stage4.  
 If you are looking for something compiled with hardened protections then look at the Hardened stage.
- ***Hardened***  
 It uses the hardened profile (default/linux/amd64/17.1/hardened) without any modifications, so all protections are enabled.

The package `app-admin/checksec` provides a script that can help you understand the status of the compiled binaries:
~~~~
~ $ checksec --proc-all
~~~~

## Scripts
I'm providing two scripts:
- ***stage4*** ( For general usage )
- ***stage4-hetzner-cloud*** ( For Hetzner Cloud )

Why multiple scripts instead of one?  
The **goal** is to keep the script as simple as possible without dozens of if/for, so people will be able to quickly understand what it does.  

**If your cloud provider offers a rescue system, you will probably be able to install the general stage4.**

## Support for others Cloud Providers
Do you want to have your favourite cloud provider fully supported here? Just open a ticket and I will do my best to add the support.

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
dev-vcs/git
net-misc/chrony
sys-apps/haveged
sys-boot/grub
sys-kernel/linux-firmware
sys-power/acpid
sys-process/cronie
sys-process/htop
~~~~

## Services
Services added to default runlevel:
~~~~
syslog-ng
acpid
cronie
net.eth0 (only for stage4-hetzner-cloud)
chronyd
sshd
~~~~

Service added to the boot runlevel:
~~~~
haveged
~~~~

## Kernels
For the *stage4-hetzner-cloud* script a custom Monolithic Kernel is provided. It is based on the Hetzner Cloud hardware. If you need to include some other modules, the related Kernel config is provided, so you can start from there.  
For the *stage4* script, a common genkernel-based kernel is provided.

## SSH access
If there is a file called id_rsa.pub in the same path where you are executing the stage4 script, this file will be copied as `/root/.ssh/authorized_keys`

## Future changes and releases
The future changes in the stage4 can be relevant to:
- kernel
- packages update
- any other modification in the configuration

Releases will not be frequent.  
This doesn't mean that the project is not maintained, but simply it is not necessary to have a release every week.  
Usually a release will be published after major upstream **stable** changes (gcc, glibc) and for each toolchain update, a complete `emerge -e world` will be done before publishing a new release.  

In any case you can install the stage4 **anytime** and update to the latest stable packages available via emerge with:

` ~ $ emerge -DuNav world`

## Changelog
To avoid navigating and searching the git history, a plaintext Changelog is provided, which will summarize and track changes between releases.

## What you need to do...
If you are using something from this repository, I appreciate if you "Star" the repository. This will give me an idea of how many people are using this stuff and, consequently, how much effort I need to put in to maintain the project in a good state.

---

\# Gentoo hetzner cloud  
\# Gentoo stage4  
\# Gentoo cloud  
