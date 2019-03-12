# gentoo-stage4

All of us know that a Gentoo install takes some time compared to any other distro. Since some years, I'm installing via an auto-installer 
script which on each install does the some repetitive operations, so why not have a tarball which has already everything I add on each 
install?

The idea borns also from the fact that some Hosting Providers (like Hetzner) do not provide a Gentoo image on their cloud virtual servers, so 
this is an EASY and FAST way to have Gentoo Installed everywhere.

The repository contains two scripts:
- ***stage4*** ( For general usage )
- ***stage4-hetzner-cloud*** ( For Hetzner Cloud )

If your cloud provider provides a rescue system, you probably will be able to install the general stage4.  
Do you want to have your favourite cloud provider fully supported here? Just open a ticket and I will provide to add the support.

Why more scripts instead of one?  
The **goal** is keep the script more simple as possible without dozens of if/for, so people will be able to understand quickly what it does.

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

Service added to the runlevel:
~~~~
syslog-ng
acpid
cronie
net.eth0 (only for stage4-hetzner-cloud)
ntp
sshd
~~~~

The future changes in the stage4 can be relevant to:
- kernel
- packages update
- any other modification in the configuration

Since the kernel is maintained outside, releases will **not** be frequently and will be done after major upstream changes (gcc,glibc)
In any case you can install it anytime and update via emerge with:

` ~ $ emerge -DuNav world`

---

\# Gentoo hetzner cloud  
\# Gentoo stage4  
\# Gentoo cloud  
