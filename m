Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4A3597E72
	for <lists+xen-devel@lfdr.de>; Thu, 18 Aug 2022 08:18:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.389256.626103 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOYrR-00081W-9l; Thu, 18 Aug 2022 06:18:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 389256.626103; Thu, 18 Aug 2022 06:18:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oOYrR-0007sX-1b; Thu, 18 Aug 2022 06:18:33 +0000
Received: by outflank-mailman (input) for mailman id 389256;
 Thu, 18 Aug 2022 06:18:31 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=E7Ox=YW=gmail.com=asr7247@srs-se1.protection.inumbo.net>)
 id 1oOYrP-0007oz-FQ
 for xen-devel@lists.xenproject.org; Thu, 18 Aug 2022 06:18:31 +0000
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 905e5aee-1ebd-11ed-bd2e-47488cf2e6aa;
 Thu, 18 Aug 2022 08:18:25 +0200 (CEST)
Received: by mail-ed1-x530.google.com with SMTP id r4so619294edi.8;
 Wed, 17 Aug 2022 23:18:24 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 905e5aee-1ebd-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=Ij63T/oJdPZRo0LBW5lu0Lxar0NtQCOxB49tBvruI54=;
        b=JQ40uNpgy5fmY+g3m+z4V1eiitpfyozDUGycu6BF6pw2pjcFUtviUWVARVNX7WI96R
         rpj+fhDjxlC6wi1T48DmFdwS8ifG7eRZuWHpPZIl1r9AWHaVSg0XIdRWpehXglLxNjxf
         TpBmJ0VHrp/EQtUR6m5HI2tyM5F3XJkNYzSK38goTGPVgS05nudhzQmkM+/P/27XVKof
         97VjepxwlkXERo4swvquL6LEIOLprHgEqbHxGswbgx06G3u+vneFqExscbZhxO8q3juE
         FT/E45i5M2/qXo5kjOujhxkvDLP7zQhs4i7sKKxtzKPZKvoybD6JkmxYPEajOZDmi39c
         YF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=Ij63T/oJdPZRo0LBW5lu0Lxar0NtQCOxB49tBvruI54=;
        b=GFTNB9fiqp9csJSYRwlmsErSavxrF8z0l2/yZK+ehxJ+KOBYxAONB4xvJTj5gCWo/7
         wO8+iI2E6GWJKbJaBSyWd7rxL7VvIox1ov+zr82chgpRADSuDjBkZsoPYqx8pCInhIXh
         FfwWwMx9ksjXNUTuOS5tUZQNNXo6280izZcME3JzkdJXlKYqzewm+KKx5NQxnXPij+bU
         4nW9jfJnHHdfN5wwELj87b+egY3x0d8+3GslxOPn3fDdQEXIeSfFM+9nU79aUPTGqQ9T
         KrKDxmmFtwybFYjElw7brjb8yqHxfLWutrEB8MmUzw3sVUfPbdcK41tybNkxAr441QLU
         I26w==
X-Gm-Message-State: ACgBeo3qJhUMzlU9RvMvDDai1WM+/I0sDTDRdCtCw5LVoxH5NrQx98UD
	+91sYZVVWCQmdK2b/0w6oBWmSnHR9G66GBGjRje9TYVydi6JmQ==
X-Google-Smtp-Source: AA6agR5L5HdPX7I1/ljYI8jjv/3Gnw3fF9ydunEpUvWNUikpwdpAeiAZ2Y9tBYDm8pvd7VlpC0XXn9RZl1Hgx/2uMFg=
X-Received: by 2002:a05:6402:27d2:b0:43e:3ff6:ad58 with SMTP id
 c18-20020a05640227d200b0043e3ff6ad58mr1073896ede.234.1660803501906; Wed, 17
 Aug 2022 23:18:21 -0700 (PDT)
MIME-Version: 1.0
From: A Sudheer <asr7247@gmail.com>
Date: Thu, 18 Aug 2022 11:48:09 +0530
Message-ID: <CABg_PyJ5M4tXoT4OO6xKn8csWMiwpZKoQjtPaWykvV6_wP5Pow@mail.gmail.com>
Subject: USB passthrough fails with 64GB drive but works fine with 8GB drive
To: xen-devel@lists.xenproject.org, xen-users@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000c5fabd05e67df247"

--000000000000c5fabd05e67df247
Content-Type: text/plain; charset="UTF-8"

Hi All

On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-DomU, I tried to do a USB mass
storage device passthrough to DomU.
I followed the PVUSB method mentioned in
https://wiki.xenproject.org/wiki/Xen_USB_Passthrough.

With 8GB sandisk pen drive, i am able to do USB passthrough to DomU.
But with 64GB sandisk pendrive, though able to mount/umount in Dom0, not
able to do passthrough to DomU.
I see IO errors in dmesg  when tried to access the usb disk folder in DomU.
Both 8GB and 64GB disks are 3.2Gen1. (Not tried with 16GB & 32GB drives).

Does anyone know why 64GB usb disk passthrough fails with the below error ?

Dmesg Error:
-----------------
[  128.333409] usb 2-1: reset high-speed USB device number 2 using ehci-pci
[  128.502872] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=DID_ERROR
driverbyte=DRIVER_OK cmd_age=0s
[  128.502881] sd 2:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 7a b7 00
00 3f 00
[  128.502883] blk_update_request: I/O error, dev sda, sector 31415 op
0x0:(READ) flags 0x80700 phys_seg 63 prio class 0

Complete dmesg log:
---------------------------
[    0.000000] Linux version 5.15.0-25-generic (buildd@ubuntu) (gcc (Ubuntu
11.2.0-19ubuntu1) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #25-Ubuntu
SMP Wed Mar 30 15:54:22 UTC 2022 (Ubuntu 5.15.0-25.25-generic 5.15.30)
[    0.000000] Command line: BOOT_IMAGE=/boot/vmlinuz-5.15.0-25-generic
root=UUID=a1f59e2d-4208-42bb-90ad-f19c9608db6b ro quiet splash vt.handoff=7
[    0.000000] KERNEL supported cpus:
[    0.000000]   Intel GenuineIntel
[    0.000000]   AMD AuthenticAMD
[    0.000000]   Hygon HygonGenuine
[    0.000000]   Centaur CentaurHauls
[    0.000000]   zhaoxin   Shanghai
[    0.000000] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point
registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.000000] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.000000] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.000000] x86/fpu: Enabled xstate features 0x7, context size is 832
bytes, using 'compacted' format.
[    0.000000] signal: max sigframe size: 1776
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009fbff] usable
[    0.000000] BIOS-e820: [mem 0x000000000009fc00-0x000000000009ffff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000000f0000-0x00000000000fffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000efffefff] usable
[    0.000000] BIOS-e820: [mem 0x00000000effff000-0x00000000efffffff]
reserved
[    0.000000] BIOS-e820: [mem 0x00000000fc000000-0x00000000fc00afff] ACPI
NVS
[    0.000000] BIOS-e820: [mem 0x00000000fc00b000-0x00000000ffffffff]
reserved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000010f7fffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] SMBIOS 2.4 present.
[    0.000000] DMI: Xen HVM domU, BIOS 4.16.2-pre 07/23/2022
[    0.000000] Hypervisor detected: Xen HVM
[    0.000000] Xen version 4.16.
[    0.000000] platform_pci_unplug: Netfront and the Xen platform PCI
driver have been compiled for this kernel: unplug emulated NICs.
[    0.000000] platform_pci_unplug: Blkfront and the Xen platform PCI
driver have been compiled for this kernel: unplug emulated disks.
               You might have to change the root device
               from /dev/hd[a-d] to /dev/xvd[a-d]
               in your root= kernel command line option
[    0.000348] HVMOP_pagetable_dying not supported
[    0.019897] tsc: Fast TSC calibration using PIT
[    0.019899] tsc: Detected 2096.153 MHz processor
[    0.019901] tsc: Detected 2096.060 MHz TSC
[    0.020426] e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.020429] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.020434] last_pfn = 0x10f800 max_arch_pfn = 0x400000000
[    0.020507] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT

[    0.020726] last_pfn = 0xeffff max_arch_pfn = 0x400000000
[    0.022710] found SMP MP-table at [mem 0x000f5aa0-0x000f5aaf]
[    0.022731] Using GB pages for direct mapping
[    0.022866] RAMDISK: [mem 0x309b9000-0x344d3fff]
[    0.022871] ACPI: Early table checksum verification disabled
[    0.022876] ACPI: RSDP 0x00000000000F59F0 000024 (v02 Xen   )
[    0.022880] ACPI: XSDT 0x00000000FC00A660 000054 (v01 Xen    HVM
 00000000 HVML 00000000)
[    0.022885] ACPI: FACP 0x00000000FC00A370 0000F4 (v04 Xen    HVM
 00000000 HVML 00000000)
[    0.022890] ACPI: DSDT 0x00000000FC001040 0092A3 (v02 Xen    HVM
 00000000 INTL 20200925)
[    0.022893] ACPI: FACS 0x00000000FC001000 000040
[    0.022895] ACPI: FACS 0x00000000FC001000 000040
[    0.022897] ACPI: APIC 0x00000000FC00A470 000080 (v02 Xen    HVM
 00000000 HVML 00000000)
[    0.022899] ACPI: HPET 0x00000000FC00A570 000038 (v01 Xen    HVM
 00000000 HVML 00000000)
[    0.022901] ACPI: WAET 0x00000000FC00A5B0 000028 (v01 Xen    HVM
 00000000 HVML 00000000)
[    0.022903] ACPI: SSDT 0x00000000FC00A5E0 000031 (v02 Xen    HVM
 00000000 INTL 20200925)
[    0.022905] ACPI: SSDT 0x00000000FC00A620 000031 (v02 Xen    HVM
 00000000 INTL 20200925)
[    0.022907] ACPI: Reserving FACP table memory at [mem
0xfc00a370-0xfc00a463]
[    0.022908] ACPI: Reserving DSDT table memory at [mem
0xfc001040-0xfc00a2e2]
[    0.022909] ACPI: Reserving FACS table memory at [mem
0xfc001000-0xfc00103f]
[    0.022910] ACPI: Reserving FACS table memory at [mem
0xfc001000-0xfc00103f]
[    0.022910] ACPI: Reserving APIC table memory at [mem
0xfc00a470-0xfc00a4ef]
[    0.022911] ACPI: Reserving HPET table memory at [mem
0xfc00a570-0xfc00a5a7]
[    0.022912] ACPI: Reserving WAET table memory at [mem
0xfc00a5b0-0xfc00a5d7]
[    0.022912] ACPI: Reserving SSDT table memory at [mem
0xfc00a5e0-0xfc00a610]
[    0.022913] ACPI: Reserving SSDT table memory at [mem
0xfc00a620-0xfc00a650]
[    0.023846] No NUMA configuration found
[    0.023847] Faking a node at [mem 0x0000000000000000-0x000000010f7fffff]
[    0.023853] NODE_DATA(0) allocated [mem 0x10f7d6000-0x10f7fffff]
[    0.024106] Zone ranges:
[    0.024106]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.024108]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.024109]   Normal   [mem 0x0000000100000000-0x000000010f7fffff]
[    0.024110]   Device   empty
[    0.024111] Movable zone start for each node
[    0.024113] Early memory node ranges
[    0.024114]   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.024115]   node   0: [mem 0x0000000000100000-0x00000000efffefff]
[    0.024116]   node   0: [mem 0x0000000100000000-0x000000010f7fffff]
[    0.024117] Initmem setup node 0 [mem
0x0000000000001000-0x000000010f7fffff]
[    0.024121] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.024147] On node 0, zone DMA: 97 pages in unavailable ranges
[    0.034654] On node 0, zone Normal: 1 pages in unavailable ranges
[    0.034688] On node 0, zone Normal: 2048 pages in unavailable ranges
[    0.036207] ACPI: PM-Timer IO Port: 0xb008
[    0.036257] IOAPIC[0]: apic_id 1, version 17, address 0xfec00000, GSI
0-47
[    0.036260] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.036262] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)
[    0.036263] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low level)
[    0.036263] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 low level)
[    0.036266] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.036267] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.036276] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
[    0.036286] PM: hibernation: Registered nosave memory: [mem
0x00000000-0x00000fff]
[    0.036288] PM: hibernation: Registered nosave memory: [mem
0x0009f000-0x0009ffff]
[    0.036289] PM: hibernation: Registered nosave memory: [mem
0x000a0000-0x000effff]
[    0.036289] PM: hibernation: Registered nosave memory: [mem
0x000f0000-0x000fffff]
[    0.036290] PM: hibernation: Registered nosave memory: [mem
0xeffff000-0xefffffff]
[    0.036291] PM: hibernation: Registered nosave memory: [mem
0xf0000000-0xfbffffff]
[    0.036291] PM: hibernation: Registered nosave memory: [mem
0xfc000000-0xfc00afff]
[    0.036292] PM: hibernation: Registered nosave memory: [mem
0xfc00b000-0xffffffff]
[    0.036293] [mem 0xf0000000-0xfbffffff] available for PCI devices
[    0.036294] Booting paravirtualized kernel on Xen HVM
[    0.036298] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.036305] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4
nr_node_ids:1
[    0.036720] percpu: Embedded 61 pages/cpu s212992 r8192 d28672 u524288
[    0.036725] pcpu-alloc: s212992 r8192 d28672 u524288 alloc=1*2097152
[    0.036727] pcpu-alloc: [0] 0 1 2 3
[    0.036749] xen: PV spinlocks enabled
[    0.036751] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes,
linear)
[    0.036757] Built 1 zonelists, mobility grouping on.  Total pages:
1029919
[    0.036758] Policy zone: Normal
[    0.036759] Kernel command line:
BOOT_IMAGE=/boot/vmlinuz-5.15.0-25-generic
root=UUID=a1f59e2d-4208-42bb-90ad-f19c9608db6b ro quiet splash vt.handoff=7
[    0.036818] Unknown kernel command line parameters "splash
BOOT_IMAGE=/boot/vmlinuz-5.15.0-25-generic", will be passed to user space.
[    0.037443] Dentry cache hash table entries: 524288 (order: 10, 4194304
bytes, linear)
[    0.037771] Inode-cache hash table entries: 262144 (order: 9, 2097152
bytes, linear)
[    0.037813] mem auto-init: stack:off, heap alloc:on, heap free:off
[    0.073557] Memory: 3942040K/4185716K available (16393K kernel code,
4385K rwdata, 10784K rodata, 2952K init, 4796K bss, 243416K reserved, 0K
cma-reserved)
[    0.073573] random: get_random_u64 called from
kmem_cache_open+0x2b/0x320 with crng_init=0
[    0.073845] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=4, Nodes=1
[    0.073871] ftrace: allocating 50352 entries in 197 pages
[    0.090580] ftrace: allocated 197 pages with 4 groups
[    0.090692] rcu: Hierarchical RCU implementation.
[    0.090693] rcu: RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=4.
[    0.090694] Rude variant of Tasks RCU enabled.
[    0.090695] Tracing variant of Tasks RCU enabled.
[    0.090695] rcu: RCU calculated value of scheduler-enlistment delay is
25 jiffies.
[    0.090696] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=4
[    0.093376] NR_IRQS: 524544, nr_irqs: 864, preallocated irqs: 16
[    0.093409] xen:events: Using FIFO-based ABI
[    0.093414] xen:events: Xen HVM callback vector for event delivery is
enabled
[    0.093618] random: crng done (trusting CPU's manufacturer)
[    0.093648] Console: colour dummy device 80x25
[    0.093656] printk: console [tty0] enabled
[    0.093682] ACPI: Core revision 20210730
[    0.093792] clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff,
max_idle_ns: 30580167144 ns
[    0.093843] APIC: Switch to symmetric I/O mode setup
[    0.094256] x2apic: IRQ remapping doesn't support X2APIC mode
[    0.096199] ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=0 pin2=0
[    0.117318] tsc: Marking TSC unstable due to TSCs unsynchronized
[    0.117326] Calibrating delay loop (skipped), value calculated using
timer frequency.. 4192.12 BogoMIPS (lpj=8384240)
[    0.117328] pid_max: default: 32768 minimum: 301
[    0.117354] LSM: Security Framework initializing
[    0.117364] landlock: Up and running.
[    0.117365] Yama: becoming mindful.
[    0.117390] AppArmor: AppArmor initialized
[    0.117420] Mount-cache hash table entries: 8192 (order: 4, 65536 bytes,
linear)
[    0.117432] Mountpoint-cache hash table entries: 8192 (order: 4, 65536
bytes, linear)
[    0.117710] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.117751] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512
[    0.117752] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, 1GB 0
[    0.117756] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user
pointer sanitization
[    0.117758] Spectre V2 : Mitigation: Retpolines
[    0.117758] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling RSB
on context switch
[    0.117759] Spectre V2 : Enabling Restricted Speculation for firmware
calls
[    0.117760] Spectre V2 : mitigation: Enabling conditional Indirect
Branch Prediction Barrier
[    0.117761] Speculative Store Bypass: Mitigation: Speculative Store
Bypass disabled via prctl and seccomp
[    0.121847] Freeing SMP alternatives memory: 40K
[    0.121917] clocksource: xen: mask: 0xffffffffffffffff max_cycles:
0x1cd42e4dffb, max_idle_ns: 881590591483 ns
[    0.121921] Xen: using vcpuop timer interface
[    0.121927] installing Xen timer for CPU 0
[    0.121969] smpboot: CPU0: AMD Ryzen Embedded V2516 with Radeon Graphics
(family: 0x17, model: 0x60, stepping: 0x1)
[    0.121990] cpu 0 spinlock event irq 52
[    0.122104] Performance Events: PMU not available due to virtualization,
using software events only.
[    0.122129] rcu: Hierarchical SRCU implementation.
[    0.122481] NMI watchdog: Perf NMI watchdog permanently disabled
[    0.122523] smp: Bringing up secondary CPUs ...
[    0.122593] installing Xen timer for CPU 1
[    0.122629] x86: Booting SMP configuration:
[    0.122629] .... node  #0, CPUs:      #1
[    0.201732] cpu 1 spinlock event irq 57
[    0.201732] installing Xen timer for CPU 2
[    0.201732]  #2
[    0.281442] cpu 2 spinlock event irq 62
[    0.281442] installing Xen timer for CPU 3
[    0.281484]  #3
[    0.361387] cpu 3 spinlock event irq 67
[    0.361409] smp: Brought up 1 node, 4 CPUs
[    0.361413] smpboot: Max logical packages: 1
[    0.361414] smpboot: Total of 4 processors activated (16782.38 BogoMIPS)
[    0.361965] devtmpfs: initialized
[    0.361965] x86/mm: Memory block size: 128MB
[    0.361965] ACPI: PM: Registering ACPI NVS region [mem
0xfc000000-0xfc00afff] (45056 bytes)
[    0.361965] clocksource: jiffies: mask: 0xffffffff max_cycles:
0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.361965] futex hash table entries: 1024 (order: 4, 65536 bytes,
linear)
[    0.361965] pinctrl core: initialized pinctrl subsystem
[    0.361965] PM: RTC time: 10:03:51, date: 2022-08-16
[    0.361965] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.361965] DMA: preallocated 512 KiB GFP_KERNEL pool for atomic
allocations
[    0.361965] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic
allocations
[    0.361965] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for
atomic allocations
[    0.361965] audit: initializing netlink subsys (disabled)
[    0.361971] audit: type=2000 audit(1660644231.158:1): state=initialized
audit_enabled=0 res=1
[    0.361971] thermal_sys: Registered thermal governor 'fair_share'
[    0.361971] thermal_sys: Registered thermal governor 'bang_bang'
[    0.361971] thermal_sys: Registered thermal governor 'step_wise'
[    0.361971] thermal_sys: Registered thermal governor 'user_space'
[    0.361971] thermal_sys: Registered thermal governor 'power_allocator'
[    0.361971] EISA bus registered
[    0.361971] cpuidle: using governor ladder
[    0.361971] cpuidle: using governor menu
[    0.365559] ACPI: bus type PCI registered
[    0.365559] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.365690] PCI: Using configuration type 1 for base access
[    0.365690] PCI: Using configuration type 1 for extended access
[    0.366624] Kprobes globally optimized
[    0.366633] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
[    0.366633] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
[    0.369383] ACPI: Added _OSI(Module Device)
[    0.369385] ACPI: Added _OSI(Processor Device)
[    0.369385] ACPI: Added _OSI(3.0 _SCP Extensions)
[    0.369386] ACPI: Added _OSI(Processor Aggregator Device)
[    0.369387] ACPI: Added _OSI(Linux-Dell-Video)
[    0.369388] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
[    0.369388] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
[    0.374303] ACPI: 3 ACPI AML tables successfully acquired and loaded
[    0.375004] xen: --> pirq=16 -> irq=9 (gsi=9)
[    0.382575] ACPI: Interpreter enabled
[    0.382587] ACPI: PM: (supports S0 S3 S4 S5)
[    0.382588] ACPI: Using IOAPIC for interrupt routing
[    0.382603] PCI: Using host bridge windows from ACPI; if necessary, use
"pci=nocrs" and report a bug
[    0.382912] ACPI: Enabled 2 GPEs in block 00 to 0F
[    0.389818] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.389825] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM
ClockPM Segments MSI HPX-Type3]
[    0.390288] acpiphp: Slot [3] registered
[    0.390343] acpiphp: Slot [4] registered
[    0.390374] acpiphp: Slot [5] registered
[    0.390407] acpiphp: Slot [6] registered
[    0.390437] acpiphp: Slot [7] registered
[    0.390467] acpiphp: Slot [8] registered
[    0.390497] acpiphp: Slot [9] registered
[    0.390529] acpiphp: Slot [10] registered
[    0.390559] acpiphp: Slot [11] registered
[    0.390588] acpiphp: Slot [12] registered
[    0.390619] acpiphp: Slot [13] registered
[    0.390649] acpiphp: Slot [14] registered
[    0.390679] acpiphp: Slot [15] registered
[    0.390710] acpiphp: Slot [16] registered
[    0.390742] acpiphp: Slot [17] registered
[    0.390771] acpiphp: Slot [18] registered
[    0.390801] acpiphp: Slot [19] registered
[    0.390831] acpiphp: Slot [20] registered
[    0.390862] acpiphp: Slot [21] registered
[    0.390892] acpiphp: Slot [22] registered
[    0.390924] acpiphp: Slot [23] registered
[    0.390953] acpiphp: Slot [24] registered
[    0.390983] acpiphp: Slot [25] registered
[    0.391014] acpiphp: Slot [26] registered
[    0.391044] acpiphp: Slot [27] registered
[    0.391074] acpiphp: Slot [28] registered
[    0.391105] acpiphp: Slot [29] registered
[    0.391136] acpiphp: Slot [30] registered
[    0.391166] acpiphp: Slot [31] registered
[    0.391193] PCI host bridge to bus 0000:00
[    0.391195] pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.391196] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.391197] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.391198] pci_bus 0000:00: root bus resource [mem
0x000a0000-0x000bffff window]
[    0.391200] pci_bus 0000:00: root bus resource [mem
0xf0000000-0xfbffffff window]
[    0.392097] pci 0000:00:00.0: [8086:1237] type 00 class 0x060000
[    0.395106] pci 0000:00:01.0: [8086:7000] type 00 class 0x060100
[    0.398764] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180
[    0.401310] pci 0000:00:01.1: reg 0x20: [io  0xc200-0xc20f]
[    0.402042] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io
 0x01f0-0x01f7]
[    0.402046] pci 0000:00:01.1: legacy IDE quirk: reg 0x14: [io  0x03f6]
[    0.402048] pci 0000:00:01.1: legacy IDE quirk: reg 0x18: [io
 0x0170-0x0177]
[    0.402050] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io  0x0376]
[    0.403095] pci 0000:00:01.2: [8086:7020] type 00 class 0x0c0300
[    0.408382] pci 0000:00:01.2: reg 0x20: [io  0xc200-0xc21f]
[    0.411492] pci 0000:00:01.3: [8086:7113] type 00 class 0x068000
[    0.414058] pci 0000:00:01.3: quirk: [io  0xb000-0xb03f] claimed by
PIIX4 ACPI
[    0.414125] pci 0000:00:01.3: quirk: [io  0xb100-0xb10f] claimed by
PIIX4 SMB
[    0.415904] pci 0000:00:02.0: [5853:0001] type 00 class 0xff8000
[    0.416975] pci 0000:00:02.0: reg 0x10: [io  0xc000-0xc0ff]
[    0.417744] pci 0000:00:02.0: reg 0x14: [mem 0xf0000000-0xf0ffffff pref]
[    0.423658] pci 0000:00:03.0: [1af4:1050] type 00 class 0x030000
[    0.424674] pci 0000:00:03.0: reg 0x10: [mem 0xf1000000-0xf17fffff pref]
[    0.426331] pci 0000:00:03.0: reg 0x18: [mem 0xf1850000-0xf1853fff 64bit
pref]
[    0.427343] pci 0000:00:03.0: reg 0x20: [mem 0xf1854000-0xf1854fff]
[    0.429328] pci 0000:00:03.0: reg 0x30: [mem 0xf1840000-0xf184ffff pref]
[    0.429561] pci 0000:00:03.0: Video device with shadowed ROM at [mem
0x000c0000-0x000dffff]
[    0.442223] ACPI: PCI: Interrupt link LNKA configured for IRQ 5
[    0.445589] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
[    0.446086] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
[    0.446565] ACPI: PCI: Interrupt link LNKD configured for IRQ 5
[    0.452471] xen:balloon: Initialising balloon driver
[    0.452504] iommu: Default domain type: Translated
[    0.452504] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.452504] SCSI subsystem initialized
[    0.452504] libata version 3.00 loaded.
[    0.453475] pci 0000:00:03.0: vgaarb: setting as boot VGA device
[    0.453478] pci 0000:00:03.0: vgaarb: VGA device added:
decodes=io+mem,owns=io+mem,locks=none
[    0.453482] pci 0000:00:03.0: vgaarb: bridge control possible
[    0.453484] vgaarb: loaded
[    0.453513] ACPI: bus type USB registered
[    0.453533] usbcore: registered new interface driver usbfs
[    0.453543] usbcore: registered new interface driver hub
[    0.453553] usbcore: registered new device driver usb
[    0.453586] pps_core: LinuxPPS API ver. 1 registered
[    0.453588] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo
Giometti <giometti@linux.it>
[    0.453592] PTP clock support registered
[    0.453619] EDAC MC: Ver: 3.0.0
[    0.454282] NetLabel: Initializing
[    0.454282] NetLabel:  domain hash size = 128
[    0.454282] NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.454282] NetLabel:  unlabeled traffic allowed by default
[    0.454282] PCI: Using ACPI for IRQ routing
[    0.454282] PCI: pci_cache_line_size set to 64 bytes
[    0.454282] pci 0000:00:01.1: can't claim BAR 4 [io  0xc200-0xc20f]:
address conflict with 0000:00:01.2 [io  0xc200-0xc21f]
[    0.454282] e820: reserve RAM buffer [mem 0x0009fc00-0x0009ffff]
[    0.454282] e820: reserve RAM buffer [mem 0xeffff000-0xefffffff]
[    0.454282] e820: reserve RAM buffer [mem 0x10f800000-0x10fffffff]
[    0.454282] hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.454282] hpet0: 3 comparators, 64-bit 62.500000 MHz counter
[    0.460486] clocksource: Switched to clocksource xen
[    0.472984] VFS: Disk quotas dquot_6.6.0
[    0.473001] VFS: Dquot-cache hash table entries: 512 (order 0, 4096
bytes)
[    0.473105] AppArmor: AppArmor Filesystem Enabled
[    0.473124] pnp: PnP ACPI init
[    0.473202] system 00:00: [mem 0x00000000-0x0009ffff] could not be
reserved
[    0.473273] system 00:01: [io  0x08a0-0x08a3] has been reserved
[    0.473275] system 00:01: [io  0x0cc0-0x0ccf] has been reserved
[    0.473275] system 00:01: [io  0x04d0-0x04d1] has been reserved
[    0.473304] xen: --> pirq=17 -> irq=8 (gsi=8)
[    0.473363] xen: --> pirq=18 -> irq=12 (gsi=12)
[    0.473388] xen: --> pirq=19 -> irq=1 (gsi=1)
[    0.473414] xen: --> pirq=20 -> irq=6 (gsi=6)
[    0.473417] pnp 00:05: [dma 2]
[    0.473473] system 00:06: [io  0xae00-0xae0f] has been reserved
[    0.473475] system 00:06: [io  0xb044-0xb047] has been reserved
[    0.475437] pnp: PnP ACPI: found 7 devices
[    0.482559] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,
max_idle_ns: 2085701024 ns
[    0.482606] NET: Registered PF_INET protocol family
[    0.482689] IP idents hash table entries: 65536 (order: 7, 524288 bytes,
linear)
[    0.483191] tcp_listen_portaddr_hash hash table entries: 2048 (order: 3,
32768 bytes, linear)
[    0.483225] TCP established hash table entries: 32768 (order: 6, 262144
bytes, linear)
[    0.483322] TCP bind hash table entries: 32768 (order: 7, 524288 bytes,
linear)
[    0.483357] TCP: Hash tables configured (established 32768 bind 32768)
[    0.483430] MPTCP token hash table entries: 4096 (order: 4, 98304 bytes,
linear)
[    0.483462] UDP hash table entries: 2048 (order: 4, 65536 bytes, linear)
[    0.483475] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes,
linear)
[    0.483502] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.483506] NET: Registered PF_XDP protocol family
[    0.483517] pci 0000:00:01.1: BAR 4: assigned [io  0x1000-0x100f]
[    0.483647] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.483648] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.483649] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff
window]
[    0.483650] pci_bus 0000:00: resource 7 [mem 0xf0000000-0xfbffffff
window]
[    0.483750] pci 0000:00:01.0: PIIX3: Enabling Passive Release
[    0.483803] pci 0000:00:00.0: Limiting direct PCI/PCI transfers
[    0.483855] pci 0000:00:01.0: Activating ISA DMA hang workarounds
[    0.484244] xen: --> pirq=21 -> irq=23 (gsi=23)
[    0.485535] PCI: CLS 0 bytes, default 64
[    0.485545] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.485546] software IO TLB: mapped [mem
0x00000000ebfff000-0x00000000effff000] (64MB)
[    0.485628] Trying to unpack rootfs image as initramfs...
[    0.486028] Initialise system trusted keyrings
[    0.486049] Key type blacklist registered
[    0.486122] workingset: timestamp_bits=36 max_order=20 bucket_order=0
[    0.486920] zbud: loaded
[    0.487097] squashfs: version 4.0 (2009/01/31) Phillip Lougher
[    0.487273] fuse: init (API version 7.34)
[    0.487499] integrity: Platform Keyring initialized
[    0.490112] Key type asymmetric registered
[    0.490112] Asymmetric key parser 'x509' registered
[    0.490129] Block layer SCSI generic (bsg) driver version 0.4 loaded
(major 243)
[    0.490202] io scheduler mq-deadline registered
[    0.490536] shpchp: Standard Hot Plug PCI Controller Driver version: 0.4
[    0.490642] input: Power Button as
/devices/LNXSYSTM:00/LNXPWRBN:00/input/input0
[    0.490669] ACPI: button: Power Button [PWRF]
[    0.490694] input: Sleep Button as
/devices/LNXSYSTM:00/LNXSLPBN:00/input/input1
[    0.490703] ACPI: button: Sleep Button [SLPF]
[    0.491294] xen: --> pirq=22 -> irq=28 (gsi=28)
[    0.502206] xen: --> pirq=23 -> irq=24 (gsi=24)
[    0.502508] xen:grant_table: Grant tables using version 1 layout
[    0.502550] Grant table initialized
[    0.503306] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.506090] Linux agpgart interface v0.103
[    0.512183] loop: module loaded
[    0.513365] ata_piix 0000:00:01.1: version 2.13
[    0.513594] ata_piix 0000:00:01.1: enabling device (0000 -> 0001)
[    0.518007] blkfront: xvda: flush diskcache: enabled; persistent grants:
disabled; indirect descriptors: disabled;
[    0.520138] scsi host0: ata_piix
[    0.520399] scsi host1: ata_piix
[    0.520445] ata1: PATA max MWDMA2 cmd 0x1f0 ctl 0x3f6 bmdma 0x1000 irq 14
[    0.520449] ata2: PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0x1008 irq 15
[    0.520658] tun: Universal TUN/TAP device driver, 1.6
[    0.520757] PPP generic driver version 2.4.2
[    0.520870] xen_netfront: Initialising Xen virtual ethernet driver
[    0.521168]  xvda: xvda1 xvda2 xvda3
[    0.521950] VFIO - User Level meta-driver version: 0.3
[    0.522059] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
[    0.522064] ehci-pci: EHCI PCI platform driver
[    0.522072] ehci-platform: EHCI generic platform driver
[    0.522076] ohci_hcd: USB 1.1 'Open' Host Controller (OHCI) Driver
[    0.522078] ohci-pci: OHCI PCI platform driver
[    0.522081] ohci-platform: OHCI generic platform driver
[    0.522087] uhci_hcd: USB Universal Host Controller Interface driver
[    0.523764] uhci_hcd 0000:00:01.2: UHCI Host Controller
[    0.523779] uhci_hcd 0000:00:01.2: new USB bus registered, assigned bus
number 1
[    0.523910] uhci_hcd 0000:00:01.2: detected 2 ports
[    0.524363] uhci_hcd 0000:00:01.2: irq 23, io base 0x0000c200
[    0.524805] usb usb1: New USB device found, idVendor=1d6b,
idProduct=0001, bcdDevice= 5.15
[    0.524812] usb usb1: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[    0.524815] usb usb1: Product: UHCI Host Controller
[    0.524818] usb usb1: Manufacturer: Linux 5.15.0-25-generic uhci_hcd
[    0.524820] usb usb1: SerialNumber: 0000:00:01.2
[    0.524995] hub 1-0:1.0: USB hub found
[    0.525002] hub 1-0:1.0: 2 ports detected
[    0.525428] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at
0x60,0x64 irq 1,12
[    0.527062] xen_netfront: backend supports XDP headroom
[    0.529071] serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.529083] serio: i8042 AUX port at 0x60,0x64 irq 12
[    0.529290] mousedev: PS/2 mouse device common for all mice
[    0.530692] input: AT Translated Set 2 keyboard as
/devices/platform/i8042/serio0/input/input2
[    0.531233] rtc_cmos 00:02: registered as rtc0
[    0.532070] rtc_cmos 00:02: setting system clock to 2022-08-16T10:03:51
UTC (1660644231)
[    0.532110] rtc_cmos 00:02: alarms up to one day, 114 bytes nvram, hpet
irqs
[    0.532128] i2c_dev: i2c /dev entries driver
[    0.532168] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled.
Duplicate IMA measurements will not be recorded in the IMA log.
[    0.532221] device-mapper: uevent: version 1.0.3
[    0.532343] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised:
dm-devel@redhat.com
[    0.532392] platform eisa.0: Probing EISA bus 0
[    0.532395] platform eisa.0: EISA: Cannot allocate resource for mainboard
[    0.532398] platform eisa.0: Cannot allocate resource for EISA slot 1
[    0.532400] platform eisa.0: Cannot allocate resource for EISA slot 2
[    0.532402] platform eisa.0: Cannot allocate resource for EISA slot 3
[    0.532403] platform eisa.0: Cannot allocate resource for EISA slot 4
[    0.532405] platform eisa.0: Cannot allocate resource for EISA slot 5
[    0.532407] platform eisa.0: Cannot allocate resource for EISA slot 6
[    0.532408] platform eisa.0: Cannot allocate resource for EISA slot 7
[    0.532410] platform eisa.0: Cannot allocate resource for EISA slot 8
[    0.532412] platform eisa.0: EISA: Detected 0 cards
[    0.532528] ledtrig-cpu: registered to indicate activity on CPUs
[    0.532550] vesafb: mode is 640x480x32, linelength=2560, pages=0
[    0.532552] vesafb: scrolling: redraw
[    0.532552] vesafb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.532568] vesafb: framebuffer at 0xf1000000, mapped to
0x000000006e7c94d5, using 1216k, total 1216k
[    0.532629] fbcon: Deferring console take-over
[    0.532630] fb0: VESA VGA frame buffer device
[    0.532721] drop_monitor: Initializing network drop monitor service
[    0.532841] NET: Registered PF_INET6 protocol family
[    0.842492] Freeing initrd memory: 60524K
[    0.850586] Segment Routing with IPv6
[    0.850608] In-situ OAM (IOAM) with IPv6
[    0.850657] NET: Registered PF_PACKET protocol family
[    0.850754] Key type dns_resolver registered
[    0.851230] IPI shorthand broadcast: enabled
[    0.851247] sched_clock: Marking stable (851343609,
-194696)->(857336759, -6187846)
[    0.851532] registered taskstats version 1
[    0.851696] Loading compiled-in X.509 certificates
[    0.852907] Loaded X.509 cert 'Build time autogenerated kernel key:
c887ab1fa6442665629113512b4db089a7808038'
[    0.853729] Loaded X.509 cert 'Canonical Ltd. Live Patch Signing:
14df34d1a87cf37625abec039ef2bf521249b969'
[    0.854530] Loaded X.509 cert 'Canonical Ltd. Kernel Module Signing:
88f752e560a1e0737e31163a466ad7b70a850c19'
[    0.854534] blacklist: Loading compiled-in revocation X.509 certificates
[    0.854568] Loaded X.509 cert 'Canonical Ltd. Secure Boot Signing:
61482aa2830d0ab2ad5af10b7250da9033ddcef0'
[    0.854781] zswap: loaded using pool lzo/zbud
[    0.855324] Key type ._fscrypt registered
[    0.855328] Key type .fscrypt registered
[    0.855330] Key type fscrypt-provisioning registered
[    0.857364] usb 1-1: new full-speed USB device number 2 using uhci_hcd
[    0.859895] Key type encrypted registered
[    0.859902] AppArmor: AppArmor sha1 policy hashing enabled
[    0.859910] ima: No TPM chip found, activating TPM-bypass!
[    0.859918] Loading compiled-in module X.509 certificates
[    0.861118] Loaded X.509 cert 'Build time autogenerated kernel key:
c887ab1fa6442665629113512b4db089a7808038'
[    0.861122] ima: Allocated hash algorithm: sha1
[    0.861133] ima: No architecture policies found
[    0.861149] evm: Initialising EVM extended attributes:
[    0.861150] evm: security.selinux
[    0.861152] evm: security.SMACK64
[    0.861153] evm: security.SMACK64EXEC
[    0.861154] evm: security.SMACK64TRANSMUTE
[    0.861155] evm: security.SMACK64MMAP
[    0.861156] evm: security.apparmor
[    0.861157] evm: security.ima
[    0.861158] evm: security.capability
[    0.861160] evm: HMAC attrs: 0x1
[    0.861788] xenbus_probe_frontend: Device with no driver: device/vkbd/0
[    0.861870] PM:   Magic number: 2:786:72
[    0.862376] RAS: Correctable Errors collector initialized.
[    0.865608] Freeing unused decrypted memory: 2036K
[    0.866378] Freeing unused kernel image (initmem) memory: 2952K
[    0.889375] Write protecting the kernel read-only data: 30720k
[    0.890318] Freeing unused kernel image (text/rodata gap) memory: 2036K
[    0.890802] Freeing unused kernel image (rodata/data gap) memory: 1504K
[    0.936352] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.936636] Run /init as init process
[    0.936643]   with arguments:
[    0.936645]     /init
[    0.936646]     splash
[    0.936648]   with environment:
[    0.936649]     HOME=/
[    0.936650]     TERM=linux
[    0.936651]     BOOT_IMAGE=/boot/vmlinuz-5.15.0-25-generic
[    1.036484] piix4_smbus 0000:00:01.3: SMBus Host Controller not enabled!
[    1.036490] fbcon: Taking over console
[    1.039250] Console: switching to colour frame buffer device 80x30
[    1.055941] FDC 0 is a S82078B
[    1.078207] usb 1-1: New USB device found, idVendor=0627,
idProduct=0001, bcdDevice= 0.00
[    1.078215] usb 1-1: New USB device strings: Mfr=1, Product=3,
SerialNumber=10
[    1.078218] usb 1-1: Product: QEMU USB Tablet
[    1.078220] usb 1-1: Manufacturer: QEMU
[    1.078221] usb 1-1: SerialNumber: 42
[    1.098463] hid: raw HID events driver (C) Jiri Kosina
[    1.104173] usbcore: registered new interface driver usbhid
[    1.104177] usbhid: USB HID core driver
[    1.108771] input: QEMU QEMU USB Tablet as
/devices/pci0000:00/0000:00:01.2/usb1/1-1/1-1:1.0/0003:0627:0001.0001/input/input5
[    1.109051] hid-generic 0003:0627:0001.0001: input,hidraw0: USB HID
v0.01 Mouse [QEMU QEMU USB Tablet] on usb-0000:00:01.2-1/input0
[    1.242332] EXT4-fs (xvda3): mounted filesystem with ordered data mode.
Opts: (null). Quota mode: none.
[    1.353433] systemd[1]: Inserted module 'autofs4'
[    1.372606] systemd[1]: systemd 249.11-0ubuntu3 running in system mode
(+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT +GNUTLS
-OPENSSL +ACL +BLKID +CURL +ELFUTILS -FIDO2 +IDN2 -IDN +IPTC +KMOD
+LIBCRYPTSETUP -LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2 +LZ4
+XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=unified)
[    1.372690] systemd[1]: Detected virtualization xen.
[    1.372697] systemd[1]: Detected architecture x86-64.
[    1.373227] systemd[1]: Hostname set to <HVM-GUEST>.
[    1.590054] systemd[1]: Queued start job for default target Graphical
Interface.
[    1.592059] systemd[1]: Created slice Slice /system/modprobe.
[    1.592607] systemd[1]: Created slice Slice /system/serial-getty.
[    1.593111] systemd[1]: Created slice Slice /system/systemd-fsck.
[    1.593423] systemd[1]: Created slice User and Session Slice.
[    1.593540] systemd[1]: Started Forward Password Requests to Wall
Directory Watch.
[    1.593816] systemd[1]: Set up automount Arbitrary Executable File
Formats File System Automount Point.
[    1.593945] systemd[1]: Reached target User and Group Name Lookups.
[    1.593972] systemd[1]: Reached target Remote File Systems.
[    1.593994] systemd[1]: Reached target Slice Units.
[    1.594047] systemd[1]: Reached target Local Verity Protected Volumes.
[    1.594241] systemd[1]: Listening on Syslog Socket.
[    1.594362] systemd[1]: Listening on fsck to fsckd communication Socket.
[    1.594450] systemd[1]: Listening on initctl Compatibility Named Pipe.
[    1.594705] systemd[1]: Listening on Journal Audit Socket.
[    1.594833] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.594992] systemd[1]: Listening on Journal Socket.
[    1.595593] systemd[1]: Listening on udev Control Socket.
[    1.595751] systemd[1]: Listening on udev Kernel Socket.
[    1.596837] systemd[1]: Mounting Huge Pages File System...
[    1.598024] systemd[1]: Mounting POSIX Message Queue File System...
[    1.599213] systemd[1]: Mounting Kernel Debug File System...
[    1.600394] systemd[1]: Mounting Kernel Trace File System...
[    1.603377] systemd[1]: Starting Journal Service...
[    1.605041] systemd[1]: Starting Set the console keyboard layout...
[    1.606625] systemd[1]: Starting Create List of Static Device Nodes...
[    1.608115] systemd[1]: Starting Load Kernel Module configfs...
[    1.609446] systemd[1]: Starting Load Kernel Module drm...
[    1.610757] systemd[1]: Starting Load Kernel Module fuse...
[    1.611025] systemd[1]: Condition check resulted in File System Check on
Root Device being skipped.
[    1.614076] systemd[1]: Starting Load Kernel Modules...
[    1.616455] systemd[1]: Starting Remount Root and Kernel File Systems...
[    1.624748] systemd[1]: Starting Coldplug All udev Devices...
[    1.627022] systemd[1]: Mounted Huge Pages File System.
[    1.627141] systemd[1]: Mounted POSIX Message Queue File System.
[    1.627227] systemd[1]: Mounted Kernel Debug File System.
[    1.627315] systemd[1]: Mounted Kernel Trace File System.
[    1.627636] systemd[1]: Finished Create List of Static Device Nodes.
[    1.627985] systemd[1]: modprobe@configfs.service: Deactivated
successfully.
[    1.628221] systemd[1]: Finished Load Kernel Module configfs.
[    1.628480] systemd[1]: modprobe@fuse.service: Deactivated successfully.
[    1.628704] systemd[1]: Finished Load Kernel Module fuse.
[    1.629866] EXT4-fs (xvda3): re-mounted. Opts: errors=remount-ro. Quota
mode: none.
[    1.630115] systemd[1]: Mounting FUSE Control File System...
[    1.631378] systemd[1]: Mounting Kernel Configuration File System...
[    1.634418] systemd[1]: modprobe@drm.service: Deactivated successfully.
[    1.634598] systemd[1]: Finished Load Kernel Module drm.
[    1.634842] systemd[1]: Finished Remount Root and Kernel File Systems.
[    1.634938] systemd[1]: Mounted FUSE Control File System.
[    1.634982] systemd[1]: Mounted Kernel Configuration File System.
[    1.635685] systemd[1]: Activating swap /swapfile...
[    1.635752] systemd[1]: Condition check resulted in Platform Persistent
Storage Archival being skipped.
[    1.637031] systemd[1]: Starting Load/Save Random Seed...
[    1.641131] Adding 2097148k swap on /swapfile.  Priority:-2 extents:6
across:2260988k SSFS
[    1.642488] systemd[1]: Starting Create System Users...
[    1.642572] systemd[1]: Activated swap /swapfile.
[    1.642765] systemd[1]: Reached target Swaps.
[    1.643321] lp: driver loaded but no devices found
[    1.651810] systemd[1]: Started Journal Service.
[    1.655589] systemd-journald[259]: Received client request to flush
runtime journal.
[    1.657118] ppdev: user-space parallel port driver
[    1.667097] IPMI message handler: version 39.2
[    1.668319] ipmi device interface
[    1.675912] loop0: detected capacity change from 0 to 8
[    1.678683] loop1: detected capacity change from 0 to 126760
[    1.681650] loop2: detected capacity change from 0 to 318728
[    1.683964] loop3: detected capacity change from 0 to 509456
[    1.686052] loop4: detected capacity change from 0 to 166424
[    1.687119] loop5: detected capacity change from 0 to 93920
[    1.687391] loop6: detected capacity change from 0 to 89352
[    1.692831] loop7: detected capacity change from 0 to 568
[    1.957855] cryptd: max_cpu_qlen set to 1000
[    1.999918] AVX2 version of gcm_enc/dec engaged.
[    2.000019] AES CTR mode by8 optimization enabled
[    2.043047] input: Xen Virtual Keyboard as /devices/virtual/input/input6
[    2.043943] input: Xen Virtual Pointer as /devices/virtual/input/input7
[    2.073671] [drm] pci: virtio-vga detected at 0000:00:03.0
[    2.073675] checking generic (f1000000 130000) vs hw (f1000000 800000)
[    2.073677] fb0: switching to virtio_gpu from VESA VGA
[    2.123276] Console: switching to colour dummy device 80x25
[    2.123582] virtio-pci 0000:00:03.0: vgaarb: deactivate vga console
[    2.125945] [drm] features: +virgl -edid -resource_blob -host_visible
[    2.136638] [drm] number of scanouts: 1
[    2.136692] [drm] number of cap sets: 2
[    2.179337] [drm] cap set 0: id 1, max-version 1, max-size 308
[    2.179388] input: ImExPS/2 Generic Explorer Mouse as
/devices/platform/i8042/serio1/input/input4
[    2.179638] [drm] cap set 1: id 2, max-version 2, max-size 856
[    2.182465] [drm] Initialized virtio_gpu 0.1.0 0 for virtio0 on minor 0
[    2.193057] virtio_gpu virtio0: [drm] drm_plane_enable_fb_damage_clips()
not called
[    2.194721] Console: switching to colour frame buffer device 128x48
[    2.219672] virtio_gpu virtio0: [drm] fb0: virtio_gpudrmfb frame buffer
device
[    2.280885] audit: type=1400 audit(1660644233.244:2): apparmor="STATUS"
operation="profile_load" profile="unconfined" name="nvidia_modprobe"
pid=417 comm="apparmor_parser"
[    2.280898] audit: type=1400 audit(1660644233.244:3): apparmor="STATUS"
operation="profile_load" profile="unconfined" name="nvidia_modprobe//kmod"
pid=417 comm="apparmor_parser"
[    2.283374] audit: type=1400 audit(1660644233.248:4): apparmor="STATUS"
operation="profile_load" profile="unconfined" name="lsb_release" pid=416
comm="apparmor_parser"
[    2.287067] audit: type=1400 audit(1660644233.248:5): apparmor="STATUS"
operation="profile_load" profile="unconfined"
name="/usr/lib/NetworkManager/nm-dhcp-client.action" pid=418
comm="apparmor_parser"
[    2.287073] audit: type=1400 audit(1660644233.248:6): apparmor="STATUS"
operation="profile_load" profile="unconfined"
name="/usr/lib/NetworkManager/nm-dhcp-helper" pid=418 comm="apparmor_parser"
[    2.287075] audit: type=1400 audit(1660644233.248:7): apparmor="STATUS"
operation="profile_load" profile="unconfined"
name="/usr/lib/connman/scripts/dhclient-script" pid=418
comm="apparmor_parser"
[    2.287076] audit: type=1400 audit(1660644233.248:8): apparmor="STATUS"
operation="profile_load" profile="unconfined" name="/{,usr/}sbin/dhclient"
pid=418 comm="apparmor_parser"
[    2.294768] audit: type=1400 audit(1660644233.260:9): apparmor="STATUS"
operation="profile_load" profile="unconfined" name="/usr/bin/man" pid=422
comm="apparmor_parser"
[    2.294783] audit: type=1400 audit(1660644233.260:10): apparmor="STATUS"
operation="profile_load" profile="unconfined" name="man_filter" pid=422
comm="apparmor_parser"
[    2.765051] loop8: detected capacity change from 0 to 8
[    4.617492] rfkill: input handler disabled
[   32.054348] kauditd_printk_skb: 38 callbacks suppressed
[   32.054351] audit: type=1400 audit(1660644263.020:49): apparmor="DENIED"
operation="capable" profile="/usr/sbin/cups-browsed" pid=1390
comm="cups-browsed" capability=23  capname="sys_nice"
[   68.680921] pci 0000:00:04.0: [8086:24cd] type 00 class 0x0c0320
[   68.681909] pci 0000:00:04.0: reg 0x10: [mem 0x00000000-0x00000fff]
[   68.686395] pci 0000:00:04.0: BAR 0: assigned [mem 0xf1800000-0xf1800fff]
[   68.687377] pci 0000:00:04.0: enabling device (0000 -> 0002)
[   68.689224] xen: --> pirq=24 -> irq=35 (gsi=35)
[   68.692834] ehci-pci 0000:00:04.0: EHCI Host Controller
[   68.692850] ehci-pci 0000:00:04.0: new USB bus registered, assigned bus
number 2
[   68.694281] ehci-pci 0000:00:04.0: irq 35, io mem 0xf1800000
[   68.708467] ehci-pci 0000:00:04.0: USB 2.0 started, EHCI 1.00
[   68.708678] usb usb2: New USB device found, idVendor=1d6b,
idProduct=0002, bcdDevice= 5.15
[   68.708684] usb usb2: New USB device strings: Mfr=3, Product=2,
SerialNumber=1
[   68.708687] usb usb2: Product: EHCI Host Controller
[   68.708690] usb usb2: Manufacturer: Linux 5.15.0-25-generic ehci_hcd
[   68.708693] usb usb2: SerialNumber: 0000:00:04.0
[   68.709004] hub 2-0:1.0: USB hub found
[   68.709014] hub 2-0:1.0: 6 ports detected
[  125.693224] usb 2-1: new high-speed USB device number 2 using ehci-pci
[  125.860036] usb 2-1: config 1 interface 0 altsetting 0 bulk endpoint
0x81 has invalid maxpacket 1024
[  125.860046] usb 2-1: config 1 interface 0 altsetting 0 bulk endpoint 0x2
has invalid maxpacket 1024
[  125.868162] usb 2-1: New USB device found, idVendor=0781,
idProduct=55a9, bcdDevice= 1.00
[  125.868169] usb 2-1: New USB device strings: Mfr=1, Product=2,
SerialNumber=3
[  125.868172] usb 2-1: Product:  SanDisk 3.2Gen1
[  125.868175] usb 2-1: Manufacturer:  USB
[  125.868177] usb 2-1: SerialNumber:
0401679941e4bd74075d85f9c579b3ea676bfcb7793d641baffeb9351793d80925ba000000000000000000004c882c7f00906e18a955810790aaa0fa
[  125.886442] usb-storage 2-1:1.0: USB Mass Storage device detected
[  125.886855] scsi host2: usb-storage 2-1:1.0
[  125.887014] usbcore: registered new interface driver usb-storage
[  125.892109] usbcore: registered new interface driver uas
[  126.914284] scsi 2:0:0:0: Direct-Access      USB      SanDisk 3.2Gen1
1.00 PQ: 0 ANSI: 6
[  126.914710] sd 2:0:0:0: Attached scsi generic sg0 type 0













*[  126.926413] sd 2:0:0:0: [sda] 120176640 512-byte logical blocks: (61.5
GB/57.3 GiB)[  126.939662] sd 2:0:0:0: [sda] Write Protect is off[
 126.939670] sd 2:0:0:0: [sda] Mode Sense: 43 00 00 00[  126.952697] sd
2:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn't support
DPO or FUA[  127.045601]  sda: sda1[  127.086759] sd 2:0:0:0: [sda]
Attached SCSI removable disk[  128.333409] usb 2-1: reset high-speed USB
device number 2 using ehci-pci[  128.502872] sd 2:0:0:0: [sda] tag#0 FAILED
Result: hostbyte=DID_ERROR driverbyte=DRIVER_OK cmd_age=0s[  128.502881] sd
2:0:0:0: [sda] tag#0 CDB: Read(10) 28 00 00 00 7a b7 00 00 3f 00[
 128.502883] blk_update_request: I/O error, dev sda, sector 31415 op
0x0:(READ) flags 0x80700 phys_seg 63 prio class 0[  159.238904] usb 2-1:
reset high-speed USB device number 2 using ehci-pci[  363.738313] INFO:
task kworker/u8:1:103 blocked for more than 120 seconds.[  363.738327]
  Not tainted 5.15.0-25-generic #25-Ubuntu*[  363.738331] "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
[  363.738334] task:kworker/u8:1    state:D stack:    0 pid:  103 ppid:
2 flags:0x00004000
[  363.738343] Workqueue: events_freezable_power_ disk_events_workfn
[  363.738357] Call Trace:
[  363.738361]  <TASK>
[  363.738366]  __schedule+0x23d/0x590
[  363.738375]  schedule+0x4e/0xb0
[  363.738380]  io_schedule+0x46/0x70
[  363.738385]  blk_mq_get_tag+0x11b/0x300
[  363.738391]  ? wait_woken+0x70/0x70
[  363.738398]  __blk_mq_alloc_request+0x101/0x180
[  363.738402]  blk_mq_alloc_request+0x7a/0xc0
[  363.738406]  blk_get_request+0x27/0x60
[  363.738412]  __scsi_execute+0x48/0x260
[  363.738417]  scsi_test_unit_ready+0x60/0xe0
[  363.738421]  sd_check_events+0x194/0x230
[  363.738426]  disk_check_events+0x3c/0x110
[  363.738431]  disk_events_workfn+0x19/0x20
[  363.738435]  process_one_work+0x22b/0x3d0
[  363.738442]  worker_thread+0x53/0x410
[  363.738447]  ? process_one_work+0x3d0/0x3d0
[  363.738452]  kthread+0x12a/0x150
[  363.738457]  ? set_kthread_struct+0x50/0x50
[  363.738461]  ret_from_fork+0x22/0x30
[  363.738469]  </TASK>
[  363.738491] INFO: task pool-udisksd:1698 blocked for more than 120
seconds.
[  363.738494]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  363.738497] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  363.738499] task:pool-udisksd    state:D stack:    0 pid: 1698 ppid:
1 flags:0x00004002
[  363.738504] Call Trace:
[  363.738506]  <TASK>
[  363.738507]  __schedule+0x23d/0x590
[  363.738513]  ? bit_wait+0x60/0x60
[  363.738517]  schedule+0x4e/0xb0
[  363.738522]  io_schedule+0x46/0x70
[  363.738527]  bit_wait_io+0x11/0x60
[  363.738532]  __wait_on_bit+0x33/0xa0
[  363.738537]  out_of_line_wait_on_bit+0x8d/0xb0
[  363.738542]  ? var_wake_function+0x30/0x30
[  363.738546]  __bread_gfp+0xf6/0x120
[  363.738553]  fat__get_entry+0x15c/0x240
[  363.738561]  fat_get_short_entry+0x62/0xb0
[  363.738566]  fat_subdirs+0x5c/0x90
[  363.738571]  fat_read_root+0x130/0x170
[  363.738574]  fat_fill_super+0x63c/0x880
[  363.738578]  ? snprintf+0x49/0x60
[  363.738583]  vfat_fill_super+0x1a/0x20
[  363.738586]  mount_bdev+0x196/0x1c0
[  363.738591]  ? vfat_mount+0x20/0x20
[  363.738595]  vfat_mount+0x15/0x20
[  363.738598]  legacy_get_tree+0x2b/0x50
[  363.738602]  vfs_get_tree+0x2a/0xc0
[  363.738606]  do_new_mount+0x16e/0x2d0
[  363.738611]  path_mount+0x1db/0x880
[  363.738614]  ? putname+0x55/0x60
[  363.738619]  __x64_sys_mount+0x108/0x140
[  363.738623]  do_syscall_64+0x5c/0xc0
[  363.738629]  ? do_syscall_64+0x69/0xc0
[  363.738633]  ? exit_to_user_mode_prepare+0x37/0xb0
[  363.738639]  ? syscall_exit_to_user_mode+0x27/0x50
[  363.738643]  ? __do_sys_getuid+0x28/0x30
[  363.738646]  ? do_syscall_64+0x69/0xc0
[  363.738650]  ? syscall_exit_to_user_mode+0x27/0x50
[  363.738654]  ? exit_to_user_mode_prepare+0x37/0xb0
[  363.738657]  ? syscall_exit_to_user_mode+0x27/0x50
[  363.738660]  ? __do_sys_getgid+0x28/0x30
[  363.738663]  ? do_syscall_64+0x69/0xc0
[  363.738667]  ? __x64_sys_readlink+0x1e/0x30
[  363.738671]  ? do_syscall_64+0x69/0xc0
[  363.738675]  ? irqentry_exit+0x19/0x30
[  363.738679]  ? exc_page_fault+0x89/0x160
[  363.738681]  ? asm_exc_page_fault+0x8/0x30
[  363.738686]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  363.738691] RIP: 0033:0x7f511763eeae
[  363.738696] RSP: 002b:00007f51163782e8 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[  363.738701] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f511763eeae
[  363.738703] RDX: 00007f51080188e0 RSI: 00007f5108018960 RDI:
00007f5108018940
[  363.738706] RBP: 00007f5108018b50 R08: 00007f5108018d80 R09:
0000000000000001
[  363.738708] R10: 0000000000000006 R11: 0000000000000246 R12:
0000000000000000
[  363.738710] R13: 00007f51080188e0 R14: 00007f5108018940 R15:
00007f5108018b50
[  363.738715]  </TASK>
[  363.738761] INFO: task scsi_eh_2:1671 blocked for more than 120 seconds.
[  363.738765]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  363.738767] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  363.738769] task:scsi_eh_2       state:D stack:    0 pid: 1671 ppid:
2 flags:0x00004000
[  363.738773] Call Trace:
[  363.738775]  <TASK>
[  363.738777]  __schedule+0x23d/0x590
[  363.738782]  schedule+0x4e/0xb0
[  363.738787]  schedule_preempt_disabled+0xe/0x10
[  363.738792]  __mutex_lock.constprop.0+0x263/0x490
[  363.738796]  ? update_load_avg+0x82/0x620
[  363.738801]  __mutex_lock_slowpath+0x13/0x20
[  363.738804]  mutex_lock+0x34/0x40
[  363.738810]  device_reset+0x22/0x50 [usb_storage]
[  363.738818]  scsi_eh_bus_device_reset+0xee/0x2a0
[  363.738824]  scsi_eh_ready_devs+0x67/0x240
[  363.738829]  ? finish_task_switch.isra.0+0xa6/0x270
[  363.738834]  scsi_unjam_host+0x101/0x1c0
[  363.738839]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[  363.738844]  scsi_error_handler+0x139/0x180
[  363.738849]  ? scsi_unjam_host+0x1c0/0x1c0
[  363.738854]  kthread+0x12a/0x150
[  363.738858]  ? set_kthread_struct+0x50/0x50
[  363.738863]  ret_from_fork+0x22/0x30
[  363.738868]  </TASK>
[  363.738870] INFO: task usb-storage:1674 blocked for more than 120
seconds.
[  363.738873]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  363.738875] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  363.738877] task:usb-storage     state:D stack:    0 pid: 1674 ppid:
2 flags:0x00004000
[  363.738881] Call Trace:
[  363.738883]  <TASK>
[  363.738884]  __schedule+0x23d/0x590
[  363.738889]  schedule+0x4e/0xb0
[  363.738894]  schedule_timeout+0xfb/0x140
[  363.738898]  __wait_for_common+0xae/0x150
[  363.738903]  ? usleep_range_state+0x90/0x90
[  363.738907]  wait_for_completion+0x24/0x30
[  363.738912]  usb_sg_wait+0xee/0x1b0
[  363.738916]  usb_stor_bulk_transfer_sglist+0x8f/0xe0 [usb_storage]
[  363.738924]  usb_stor_Bulk_transport+0x191/0x440 [usb_storage]
[  363.738931]  usb_stor_invoke_transport+0x3e/0x540 [usb_storage]
[  363.738937]  ? try_to_wake_up+0x1fc/0x5a0
[  363.738942]  ? __wait_for_common+0x11d/0x150
[  363.738947]  ? usleep_range_state+0x90/0x90
[  363.738951]  usb_stor_transparent_scsi_command+0xe/0x10 [usb_storage]
[  363.738957]  usb_stor_control_thread+0x198/0x290 [usb_storage]
[  363.738964]  ? storage_probe+0xd0/0xd0 [usb_storage]
[  363.738971]  kthread+0x12a/0x150
[  363.738975]  ? set_kthread_struct+0x50/0x50
[  363.738979]  ret_from_fork+0x22/0x30
[  363.738985]  </TASK>
[  484.572086] INFO: task kworker/u8:1:103 blocked for more than 241
seconds.
[  484.572098]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  484.572102] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  484.572104] task:kworker/u8:1    state:D stack:    0 pid:  103 ppid:
2 flags:0x00004000
[  484.572113] Workqueue: events_freezable_power_ disk_events_workfn
[  484.572124] Call Trace:
[  484.572127]  <TASK>
[  484.572131]  __schedule+0x23d/0x590
[  484.572140]  schedule+0x4e/0xb0
[  484.572145]  io_schedule+0x46/0x70
[  484.572150]  blk_mq_get_tag+0x11b/0x300
[  484.572155]  ? wait_woken+0x70/0x70
[  484.572161]  __blk_mq_alloc_request+0x101/0x180
[  484.572165]  blk_mq_alloc_request+0x7a/0xc0
[  484.572169]  blk_get_request+0x27/0x60
[  484.572175]  __scsi_execute+0x48/0x260
[  484.572179]  scsi_test_unit_ready+0x60/0xe0
[  484.572183]  sd_check_events+0x194/0x230
[  484.572188]  disk_check_events+0x3c/0x110
[  484.572193]  disk_events_workfn+0x19/0x20
[  484.572197]  process_one_work+0x22b/0x3d0
[  484.572203]  worker_thread+0x53/0x410
[  484.572208]  ? process_one_work+0x3d0/0x3d0
[  484.572213]  kthread+0x12a/0x150
[  484.572217]  ? set_kthread_struct+0x50/0x50
[  484.572222]  ret_from_fork+0x22/0x30
[  484.572229]  </TASK>
[  484.572259] INFO: task pool-udisksd:1698 blocked for more than 241
seconds.
[  484.572263]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  484.572265] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  484.572267] task:pool-udisksd    state:D stack:    0 pid: 1698 ppid:
1 flags:0x00004002
[  484.572273] Call Trace:
[  484.572274]  <TASK>
[  484.572276]  __schedule+0x23d/0x590
[  484.572281]  ? bit_wait+0x60/0x60
[  484.572286]  schedule+0x4e/0xb0
[  484.572291]  io_schedule+0x46/0x70
[  484.572295]  bit_wait_io+0x11/0x60
[  484.572300]  __wait_on_bit+0x33/0xa0
[  484.572305]  out_of_line_wait_on_bit+0x8d/0xb0
[  484.572310]  ? var_wake_function+0x30/0x30
[  484.572314]  __bread_gfp+0xf6/0x120
[  484.572322]  fat__get_entry+0x15c/0x240
[  484.572329]  fat_get_short_entry+0x62/0xb0
[  484.572334]  fat_subdirs+0x5c/0x90
[  484.572339]  fat_read_root+0x130/0x170
[  484.572342]  fat_fill_super+0x63c/0x880
[  484.572345]  ? snprintf+0x49/0x60
[  484.572351]  vfat_fill_super+0x1a/0x20
[  484.572354]  mount_bdev+0x196/0x1c0
[  484.572359]  ? vfat_mount+0x20/0x20
[  484.572363]  vfat_mount+0x15/0x20
[  484.572365]  legacy_get_tree+0x2b/0x50
[  484.572369]  vfs_get_tree+0x2a/0xc0
[  484.572373]  do_new_mount+0x16e/0x2d0
[  484.572378]  path_mount+0x1db/0x880
[  484.572381]  ? putname+0x55/0x60
[  484.572385]  __x64_sys_mount+0x108/0x140
[  484.572389]  do_syscall_64+0x5c/0xc0
[  484.572395]  ? do_syscall_64+0x69/0xc0
[  484.572399]  ? exit_to_user_mode_prepare+0x37/0xb0
[  484.572405]  ? syscall_exit_to_user_mode+0x27/0x50
[  484.572409]  ? __do_sys_getuid+0x28/0x30
[  484.572412]  ? do_syscall_64+0x69/0xc0
[  484.572417]  ? syscall_exit_to_user_mode+0x27/0x50
[  484.572420]  ? exit_to_user_mode_prepare+0x37/0xb0
[  484.572423]  ? syscall_exit_to_user_mode+0x27/0x50
[  484.572426]  ? __do_sys_getgid+0x28/0x30
[  484.572429]  ? do_syscall_64+0x69/0xc0
[  484.572433]  ? __x64_sys_readlink+0x1e/0x30
[  484.572438]  ? do_syscall_64+0x69/0xc0
[  484.572442]  ? irqentry_exit+0x19/0x30
[  484.572445]  ? exc_page_fault+0x89/0x160
[  484.572448]  ? asm_exc_page_fault+0x8/0x30
[  484.572452]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[  484.572457] RIP: 0033:0x7f511763eeae
[  484.572462] RSP: 002b:00007f51163782e8 EFLAGS: 00000246 ORIG_RAX:
00000000000000a5
[  484.572466] RAX: ffffffffffffffda RBX: 0000000000000000 RCX:
00007f511763eeae
[  484.572469] RDX: 00007f51080188e0 RSI: 00007f5108018960 RDI:
00007f5108018940
[  484.572472] RBP: 00007f5108018b50 R08: 00007f5108018d80 R09:
0000000000000001
[  484.572474] R10: 0000000000000006 R11: 0000000000000246 R12:
0000000000000000
[  484.572476] R13: 00007f51080188e0 R14: 00007f5108018940 R15:
00007f5108018b50
[  484.572481]  </TASK>
[  484.572526] INFO: task scsi_eh_2:1671 blocked for more than 241 seconds.
[  484.572529]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  484.572531] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  484.572533] task:scsi_eh_2       state:D stack:    0 pid: 1671 ppid:
2 flags:0x00004000
[  484.572538] Call Trace:
[  484.572539]  <TASK>
[  484.572541]  __schedule+0x23d/0x590
[  484.572546]  schedule+0x4e/0xb0
[  484.572551]  schedule_preempt_disabled+0xe/0x10
[  484.572556]  __mutex_lock.constprop.0+0x263/0x490
[  484.572560]  ? update_load_avg+0x82/0x620
[  484.572565]  __mutex_lock_slowpath+0x13/0x20
[  484.572568]  mutex_lock+0x34/0x40
[  484.572574]  device_reset+0x22/0x50 [usb_storage]
[  484.572582]  scsi_eh_bus_device_reset+0xee/0x2a0
[  484.572588]  scsi_eh_ready_devs+0x67/0x240
[  484.572593]  ? finish_task_switch.isra.0+0xa6/0x270
[  484.572598]  scsi_unjam_host+0x101/0x1c0
[  484.572603]  ? _raw_spin_unlock_irqrestore+0xe/0x30
[  484.572608]  scsi_error_handler+0x139/0x180
[  484.572613]  ? scsi_unjam_host+0x1c0/0x1c0
[  484.572618]  kthread+0x12a/0x150
[  484.572622]  ? set_kthread_struct+0x50/0x50
[  484.572626]  ret_from_fork+0x22/0x30
[  484.572632]  </TASK>
[  484.572634] INFO: task usb-storage:1674 blocked for more than 241
seconds.
[  484.572636]       Not tainted 5.15.0-25-generic #25-Ubuntu
[  484.572639] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables
this message.
[  484.572641] task:usb-storage     state:D stack:    0 pid: 1674 ppid:
2 flags:0x00004000
[  484.572644] Call Trace:
[  484.572646]  <TASK>
[  484.572647]  __schedule+0x23d/0x590
[  484.572653]  schedule+0x4e/0xb0
[  484.572657]  schedule_timeout+0xfb/0x140
[  484.572661]  __wait_for_common+0xae/0x150
[  484.572666]  ? usleep_range_state+0x90/0x90
[  484.572670]  wait_for_completion+0x24/0x30
[  484.572675]  usb_sg_wait+0xee/0x1b0
[  484.572680]  usb_stor_bulk_transfer_sglist+0x8f/0xe0 [usb_storage]
[  484.572687]  usb_stor_Bulk_transport+0x191/0x440 [usb_storage]
[  484.572694]  usb_stor_invoke_transport+0x3e/0x540 [usb_storage]
[  484.572701]  ? try_to_wake_up+0x1fc/0x5a0
[  484.572705]  ? __wait_for_common+0x11d/0x150
[  484.572710]  ? usleep_range_state+0x90/0x90
[  484.572714]  usb_stor_transparent_scsi_command+0xe/0x10 [usb_storage]
[  484.572720]  usb_stor_control_thread+0x198/0x290 [usb_storage]
[  484.572728]  ? storage_probe+0xd0/0xd0 [usb_storage]
[  484.572734]  kthread+0x12a/0x150
[  484.572738]  ? set_kthread_struct+0x50/0x50
[  484.572742]  ret_from_fork+0x22/0x30
[  484.572748]  </TASK>

Thanks
Sudheer

--000000000000c5fabd05e67df247
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi All<br><br>On XEN-4.16 with Ubuntu 22.04 Dom0 and HVM-D=
omU, I tried to do a USB mass storage device passthrough to DomU.<br>I foll=
owed the PVUSB method mentioned in <a href=3D"https://wiki.xenproject.org/w=
iki/Xen_USB_Passthrough">https://wiki.xenproject.org/wiki/Xen_USB_Passthrou=
gh</a>. <br><br>With 8GB sandisk pen drive, i am able to do USB passthrough=
 to DomU.<br>But with 64GB sandisk pendrive, though able to mount/umount in=
 Dom0, not able to do passthrough to DomU.<br>I see IO errors in dmesg=C2=
=A0 when tried to access the usb disk folder in DomU.<br>Both 8GB and 64GB =
disks are 3.2Gen1. (Not tried with 16GB &amp; 32GB drives).<br><br>Does any=
one know why 64GB usb disk passthrough fails with the below error ?<br><br>=
Dmesg Error:<br>-----------------<br>[ =C2=A0128.333409] usb 2-1: reset hig=
h-speed USB device number 2 using ehci-pci<br>[ =C2=A0128.502872] sd 2:0:0:=
0: [sda] tag#0 FAILED Result: hostbyte=3DDID_ERROR driverbyte=3DDRIVER_OK c=
md_age=3D0s<br>[ =C2=A0128.502881] sd 2:0:0:0: [sda] tag#0 CDB: Read(10) 28=
 00 00 00 7a b7 00 00 3f 00<br>[ =C2=A0128.502883] blk_update_request: I/O =
error, dev sda, sector 31415 op 0x0:(READ) flags 0x80700 phys_seg 63 prio c=
lass 0<br><br>Complete dmesg log:<br>---------------------------<br>[ =C2=
=A0 =C2=A00.000000] Linux version 5.15.0-25-generic (buildd@ubuntu) (gcc (U=
buntu 11.2.0-19ubuntu1) 11.2.0, GNU ld (GNU Binutils for Ubuntu) 2.38) #25-=
Ubuntu SMP Wed Mar 30 15:54:22 UTC 2022 (Ubuntu 5.15.0-25.25-generic 5.15.3=
0)<br>[ =C2=A0 =C2=A00.000000] Command line: BOOT_IMAGE=3D/boot/vmlinuz-5.1=
5.0-25-generic root=3DUUID=3Da1f59e2d-4208-42bb-90ad-f19c9608db6b ro quiet =
splash vt.handoff=3D7<br>[ =C2=A0 =C2=A00.000000] KERNEL supported cpus:<br=
>[ =C2=A0 =C2=A00.000000] =C2=A0 Intel GenuineIntel<br>[ =C2=A0 =C2=A00.000=
000] =C2=A0 AMD AuthenticAMD<br>[ =C2=A0 =C2=A00.000000] =C2=A0 Hygon Hygon=
Genuine<br>[ =C2=A0 =C2=A00.000000] =C2=A0 Centaur CentaurHauls<br>[ =C2=A0=
 =C2=A00.000000] =C2=A0 zhaoxin =C2=A0 Shanghai =C2=A0<br>[ =C2=A0 =C2=A00.=
000000] x86/fpu: Supporting XSAVE feature 0x001: &#39;x87 floating point re=
gisters&#39;<br>[ =C2=A0 =C2=A00.000000] x86/fpu: Supporting XSAVE feature =
0x002: &#39;SSE registers&#39;<br>[ =C2=A0 =C2=A00.000000] x86/fpu: Support=
ing XSAVE feature 0x004: &#39;AVX registers&#39;<br>[ =C2=A0 =C2=A00.000000=
] x86/fpu: xstate_offset[2]: =C2=A0576, xstate_sizes[2]: =C2=A0256<br>[ =C2=
=A0 =C2=A00.000000] x86/fpu: Enabled xstate features 0x7, context size is 8=
32 bytes, using &#39;compacted&#39; format.<br>[ =C2=A0 =C2=A00.000000] sig=
nal: max sigframe size: 1776<br>[ =C2=A0 =C2=A00.000000] BIOS-provided phys=
ical RAM map:<br>[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x000000000000000=
0-0x000000000009fbff] usable<br>[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x=
000000000009fc00-0x000000000009ffff] reserved<br>[ =C2=A0 =C2=A00.000000] B=
IOS-e820: [mem 0x00000000000f0000-0x00000000000fffff] reserved<br>[ =C2=A0 =
=C2=A00.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000efffefff] usab=
le<br>[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000effff000-0x0000000=
0efffffff] reserved<br>[ =C2=A0 =C2=A00.000000] BIOS-e820: [mem 0x00000000f=
c000000-0x00000000fc00afff] ACPI NVS<br>[ =C2=A0 =C2=A00.000000] BIOS-e820:=
 [mem 0x00000000fc00b000-0x00000000ffffffff] reserved<br>[ =C2=A0 =C2=A00.0=
00000] BIOS-e820: [mem 0x0000000100000000-0x000000010f7fffff] usable<br>[ =
=C2=A0 =C2=A00.000000] NX (Execute Disable) protection: active<br>[ =C2=A0 =
=C2=A00.000000] SMBIOS 2.4 present.<br>[ =C2=A0 =C2=A00.000000] DMI: Xen HV=
M domU, BIOS 4.16.2-pre 07/23/2022<br>[ =C2=A0 =C2=A00.000000] Hypervisor d=
etected: Xen HVM<br>[ =C2=A0 =C2=A00.000000] Xen version 4.16.<br>[ =C2=A0 =
=C2=A00.000000] platform_pci_unplug: Netfront and the Xen platform PCI driv=
er have been compiled for this kernel: unplug emulated NICs.<br>[ =C2=A0 =
=C2=A00.000000] platform_pci_unplug: Blkfront and the Xen platform PCI driv=
er have been compiled for this kernel: unplug emulated disks.<br>=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0You might have to change the r=
oot device<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0from /=
dev/hd[a-d] to /dev/xvd[a-d]<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0in your root=3D kernel command line option<br>[ =C2=A0 =C2=A00=
.000348] HVMOP_pagetable_dying not supported<br>[ =C2=A0 =C2=A00.019897] ts=
c: Fast TSC calibration using PIT<br>[ =C2=A0 =C2=A00.019899] tsc: Detected=
 2096.153 MHz processor<br>[ =C2=A0 =C2=A00.019901] tsc: Detected 2096.060 =
MHz TSC<br>[ =C2=A0 =C2=A00.020426] e820: update [mem 0x00000000-0x00000fff=
] usable =3D=3D&gt; reserved<br>[ =C2=A0 =C2=A00.020429] e820: remove [mem =
0x000a0000-0x000fffff] usable<br>[ =C2=A0 =C2=A00.020434] last_pfn =3D 0x10=
f800 max_arch_pfn =3D 0x400000000<br>[ =C2=A0 =C2=A00.020507] x86/PAT: Conf=
iguration [0-7]: WB =C2=A0WC =C2=A0UC- UC =C2=A0WB =C2=A0WP =C2=A0UC- WT =
=C2=A0<br>[ =C2=A0 =C2=A00.020726] last_pfn =3D 0xeffff max_arch_pfn =3D 0x=
400000000<br>[ =C2=A0 =C2=A00.022710] found SMP MP-table at [mem 0x000f5aa0=
-0x000f5aaf]<br>[ =C2=A0 =C2=A00.022731] Using GB pages for direct mapping<=
br>[ =C2=A0 =C2=A00.022866] RAMDISK: [mem 0x309b9000-0x344d3fff]<br>[ =C2=
=A0 =C2=A00.022871] ACPI: Early table checksum verification disabled<br>[ =
=C2=A0 =C2=A00.022876] ACPI: RSDP 0x00000000000F59F0 000024 (v02 Xen =C2=A0=
 )<br>[ =C2=A0 =C2=A00.022880] ACPI: XSDT 0x00000000FC00A660 000054 (v01 Xe=
n =C2=A0 =C2=A0HVM =C2=A0 =C2=A0 =C2=A000000000 HVML 00000000)<br>[ =C2=A0 =
=C2=A00.022885] ACPI: FACP 0x00000000FC00A370 0000F4 (v04 Xen =C2=A0 =C2=A0=
HVM =C2=A0 =C2=A0 =C2=A000000000 HVML 00000000)<br>[ =C2=A0 =C2=A00.022890]=
 ACPI: DSDT 0x00000000FC001040 0092A3 (v02 Xen =C2=A0 =C2=A0HVM =C2=A0 =C2=
=A0 =C2=A000000000 INTL 20200925)<br>[ =C2=A0 =C2=A00.022893] ACPI: FACS 0x=
00000000FC001000 000040<br>[ =C2=A0 =C2=A00.022895] ACPI: FACS 0x00000000FC=
001000 000040<br>[ =C2=A0 =C2=A00.022897] ACPI: APIC 0x00000000FC00A470 000=
080 (v02 Xen =C2=A0 =C2=A0HVM =C2=A0 =C2=A0 =C2=A000000000 HVML 00000000)<b=
r>[ =C2=A0 =C2=A00.022899] ACPI: HPET 0x00000000FC00A570 000038 (v01 Xen =
=C2=A0 =C2=A0HVM =C2=A0 =C2=A0 =C2=A000000000 HVML 00000000)<br>[ =C2=A0 =
=C2=A00.022901] ACPI: WAET 0x00000000FC00A5B0 000028 (v01 Xen =C2=A0 =C2=A0=
HVM =C2=A0 =C2=A0 =C2=A000000000 HVML 00000000)<br>[ =C2=A0 =C2=A00.022903]=
 ACPI: SSDT 0x00000000FC00A5E0 000031 (v02 Xen =C2=A0 =C2=A0HVM =C2=A0 =C2=
=A0 =C2=A000000000 INTL 20200925)<br>[ =C2=A0 =C2=A00.022905] ACPI: SSDT 0x=
00000000FC00A620 000031 (v02 Xen =C2=A0 =C2=A0HVM =C2=A0 =C2=A0 =C2=A000000=
000 INTL 20200925)<br>[ =C2=A0 =C2=A00.022907] ACPI: Reserving FACP table m=
emory at [mem 0xfc00a370-0xfc00a463]<br>[ =C2=A0 =C2=A00.022908] ACPI: Rese=
rving DSDT table memory at [mem 0xfc001040-0xfc00a2e2]<br>[ =C2=A0 =C2=A00.=
022909] ACPI: Reserving FACS table memory at [mem 0xfc001000-0xfc00103f]<br=
>[ =C2=A0 =C2=A00.022910] ACPI: Reserving FACS table memory at [mem 0xfc001=
000-0xfc00103f]<br>[ =C2=A0 =C2=A00.022910] ACPI: Reserving APIC table memo=
ry at [mem 0xfc00a470-0xfc00a4ef]<br>[ =C2=A0 =C2=A00.022911] ACPI: Reservi=
ng HPET table memory at [mem 0xfc00a570-0xfc00a5a7]<br>[ =C2=A0 =C2=A00.022=
912] ACPI: Reserving WAET table memory at [mem 0xfc00a5b0-0xfc00a5d7]<br>[ =
=C2=A0 =C2=A00.022912] ACPI: Reserving SSDT table memory at [mem 0xfc00a5e0=
-0xfc00a610]<br>[ =C2=A0 =C2=A00.022913] ACPI: Reserving SSDT table memory =
at [mem 0xfc00a620-0xfc00a650]<br>[ =C2=A0 =C2=A00.023846] No NUMA configur=
ation found<br>[ =C2=A0 =C2=A00.023847] Faking a node at [mem 0x00000000000=
00000-0x000000010f7fffff]<br>[ =C2=A0 =C2=A00.023853] NODE_DATA(0) allocate=
d [mem 0x10f7d6000-0x10f7fffff]<br>[ =C2=A0 =C2=A00.024106] Zone ranges:<br=
>[ =C2=A0 =C2=A00.024106] =C2=A0 DMA =C2=A0 =C2=A0 =C2=A0[mem 0x00000000000=
01000-0x0000000000ffffff]<br>[ =C2=A0 =C2=A00.024108] =C2=A0 DMA32 =C2=A0 =
=C2=A0[mem 0x0000000001000000-0x00000000ffffffff]<br>[ =C2=A0 =C2=A00.02410=
9] =C2=A0 Normal =C2=A0 [mem 0x0000000100000000-0x000000010f7fffff]<br>[ =
=C2=A0 =C2=A00.024110] =C2=A0 Device =C2=A0 empty<br>[ =C2=A0 =C2=A00.02411=
1] Movable zone start for each node<br>[ =C2=A0 =C2=A00.024113] Early memor=
y node ranges<br>[ =C2=A0 =C2=A00.024114] =C2=A0 node =C2=A0 0: [mem 0x0000=
000000001000-0x000000000009efff]<br>[ =C2=A0 =C2=A00.024115] =C2=A0 node =
=C2=A0 0: [mem 0x0000000000100000-0x00000000efffefff]<br>[ =C2=A0 =C2=A00.0=
24116] =C2=A0 node =C2=A0 0: [mem 0x0000000100000000-0x000000010f7fffff]<br=
>[ =C2=A0 =C2=A00.024117] Initmem setup node 0 [mem 0x0000000000001000-0x00=
0000010f7fffff]<br>[ =C2=A0 =C2=A00.024121] On node 0, zone DMA: 1 pages in=
 unavailable ranges<br>[ =C2=A0 =C2=A00.024147] On node 0, zone DMA: 97 pag=
es in unavailable ranges<br>[ =C2=A0 =C2=A00.034654] On node 0, zone Normal=
: 1 pages in unavailable ranges<br>[ =C2=A0 =C2=A00.034688] On node 0, zone=
 Normal: 2048 pages in unavailable ranges<br>[ =C2=A0 =C2=A00.036207] ACPI:=
 PM-Timer IO Port: 0xb008<br>[ =C2=A0 =C2=A00.036257] IOAPIC[0]: apic_id 1,=
 version 17, address 0xfec00000, GSI 0-47<br>[ =C2=A0 =C2=A00.036260] ACPI:=
 INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)<br>[ =C2=A0 =C2=A00.036=
262] ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 low level)<br>[ =C2=A0=
 =C2=A00.036263] ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 low leve=
l)<br>[ =C2=A0 =C2=A00.036263] ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_i=
rq 11 low level)<br>[ =C2=A0 =C2=A00.036266] ACPI: Using ACPI (MADT) for SM=
P configuration information<br>[ =C2=A0 =C2=A00.036267] ACPI: HPET id: 0x80=
86a201 base: 0xfed00000<br>[ =C2=A0 =C2=A00.036276] smpboot: Allowing 4 CPU=
s, 0 hotplug CPUs<br>[ =C2=A0 =C2=A00.036286] PM: hibernation: Registered n=
osave memory: [mem 0x00000000-0x00000fff]<br>[ =C2=A0 =C2=A00.036288] PM: h=
ibernation: Registered nosave memory: [mem 0x0009f000-0x0009ffff]<br>[ =C2=
=A0 =C2=A00.036289] PM: hibernation: Registered nosave memory: [mem 0x000a0=
000-0x000effff]<br>[ =C2=A0 =C2=A00.036289] PM: hibernation: Registered nos=
ave memory: [mem 0x000f0000-0x000fffff]<br>[ =C2=A0 =C2=A00.036290] PM: hib=
ernation: Registered nosave memory: [mem 0xeffff000-0xefffffff]<br>[ =C2=A0=
 =C2=A00.036291] PM: hibernation: Registered nosave memory: [mem 0xf0000000=
-0xfbffffff]<br>[ =C2=A0 =C2=A00.036291] PM: hibernation: Registered nosave=
 memory: [mem 0xfc000000-0xfc00afff]<br>[ =C2=A0 =C2=A00.036292] PM: hibern=
ation: Registered nosave memory: [mem 0xfc00b000-0xffffffff]<br>[ =C2=A0 =
=C2=A00.036293] [mem 0xf0000000-0xfbffffff] available for PCI devices<br>[ =
=C2=A0 =C2=A00.036294] Booting paravirtualized kernel on Xen HVM<br>[ =C2=
=A0 =C2=A00.036298] clocksource: refined-jiffies: mask: 0xffffffff max_cycl=
es: 0xffffffff, max_idle_ns: 7645519600211568 ns<br>[ =C2=A0 =C2=A00.036305=
] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 nr_node_ids:1<b=
r>[ =C2=A0 =C2=A00.036720] percpu: Embedded 61 pages/cpu s212992 r8192 d286=
72 u524288<br>[ =C2=A0 =C2=A00.036725] pcpu-alloc: s212992 r8192 d28672 u52=
4288 alloc=3D1*2097152<br>[ =C2=A0 =C2=A00.036727] pcpu-alloc: [0] 0 1 2 3 =
<br>[ =C2=A0 =C2=A00.036749] xen: PV spinlocks enabled<br>[ =C2=A0 =C2=A00.=
036751] PV qspinlock hash table entries: 256 (order: 0, 4096 bytes, linear)=
<br>[ =C2=A0 =C2=A00.036757] Built 1 zonelists, mobility grouping on.=C2=A0=
 Total pages: 1029919<br>[ =C2=A0 =C2=A00.036758] Policy zone: Normal<br>[ =
=C2=A0 =C2=A00.036759] Kernel command line: BOOT_IMAGE=3D/boot/vmlinuz-5.15=
.0-25-generic root=3DUUID=3Da1f59e2d-4208-42bb-90ad-f19c9608db6b ro quiet s=
plash vt.handoff=3D7<br>[ =C2=A0 =C2=A00.036818] Unknown kernel command lin=
e parameters &quot;splash BOOT_IMAGE=3D/boot/vmlinuz-5.15.0-25-generic&quot=
;, will be passed to user space.<br>[ =C2=A0 =C2=A00.037443] Dentry cache h=
ash table entries: 524288 (order: 10, 4194304 bytes, linear)<br>[ =C2=A0 =
=C2=A00.037771] Inode-cache hash table entries: 262144 (order: 9, 2097152 b=
ytes, linear)<br>[ =C2=A0 =C2=A00.037813] mem auto-init: stack:off, heap al=
loc:on, heap free:off<br>[ =C2=A0 =C2=A00.073557] Memory: 3942040K/4185716K=
 available (16393K kernel code, 4385K rwdata, 10784K rodata, 2952K init, 47=
96K bss, 243416K reserved, 0K cma-reserved)<br>[ =C2=A0 =C2=A00.073573] ran=
dom: get_random_u64 called from kmem_cache_open+0x2b/0x320 with crng_init=
=3D0<br>[ =C2=A0 =C2=A00.073845] SLUB: HWalign=3D64, Order=3D0-3, MinObject=
s=3D0, CPUs=3D4, Nodes=3D1<br>[ =C2=A0 =C2=A00.073871] ftrace: allocating 5=
0352 entries in 197 pages<br>[ =C2=A0 =C2=A00.090580] ftrace: allocated 197=
 pages with 4 groups<br>[ =C2=A0 =C2=A00.090692] rcu: Hierarchical RCU impl=
ementation.<br>[ =C2=A0 =C2=A00.090693] rcu: 	RCU restricting CPUs from NR_=
CPUS=3D8192 to nr_cpu_ids=3D4.<br>[ =C2=A0 =C2=A00.090694] 	Rude variant of=
 Tasks RCU enabled.<br>[ =C2=A0 =C2=A00.090695] 	Tracing variant of Tasks R=
CU enabled.<br>[ =C2=A0 =C2=A00.090695] rcu: RCU calculated value of schedu=
ler-enlistment delay is 25 jiffies.<br>[ =C2=A0 =C2=A00.090696] rcu: Adjust=
ing geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=3D4<br>[ =C2=A0 =C2=A00.0=
93376] NR_IRQS: 524544, nr_irqs: 864, preallocated irqs: 16<br>[ =C2=A0 =C2=
=A00.093409] xen:events: Using FIFO-based ABI<br>[ =C2=A0 =C2=A00.093414] x=
en:events: Xen HVM callback vector for event delivery is enabled<br>[ =C2=
=A0 =C2=A00.093618] random: crng done (trusting CPU&#39;s manufacturer)<br>=
[ =C2=A0 =C2=A00.093648] Console: colour dummy device 80x25<br>[ =C2=A0 =C2=
=A00.093656] printk: console [tty0] enabled<br>[ =C2=A0 =C2=A00.093682] ACP=
I: Core revision 20210730<br>[ =C2=A0 =C2=A00.093792] clocksource: hpet: ma=
sk: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 30580167144 ns<br>[ =C2=
=A0 =C2=A00.093843] APIC: Switch to symmetric I/O mode setup<br>[ =C2=A0 =
=C2=A00.094256] x2apic: IRQ remapping doesn&#39;t support X2APIC mode<br>[ =
=C2=A0 =C2=A00.096199] ..TIMER: vector=3D0x30 apic1=3D0 pin1=3D2 apic2=3D0 =
pin2=3D0<br>[ =C2=A0 =C2=A00.117318] tsc: Marking TSC unstable due to TSCs =
unsynchronized<br>[ =C2=A0 =C2=A00.117326] Calibrating delay loop (skipped)=
, value calculated using timer frequency.. 4192.12 BogoMIPS (lpj=3D8384240)=
<br>[ =C2=A0 =C2=A00.117328] pid_max: default: 32768 minimum: 301<br>[ =C2=
=A0 =C2=A00.117354] LSM: Security Framework initializing<br>[ =C2=A0 =C2=A0=
0.117364] landlock: Up and running.<br>[ =C2=A0 =C2=A00.117365] Yama: becom=
ing mindful.<br>[ =C2=A0 =C2=A00.117390] AppArmor: AppArmor initialized<br>=
[ =C2=A0 =C2=A00.117420] Mount-cache hash table entries: 8192 (order: 4, 65=
536 bytes, linear)<br>[ =C2=A0 =C2=A00.117432] Mountpoint-cache hash table =
entries: 8192 (order: 4, 65536 bytes, linear)<br>[ =C2=A0 =C2=A00.117710] x=
86/cpu: User Mode Instruction Prevention (UMIP) activated<br>[ =C2=A0 =C2=
=A00.117751] Last level iTLB entries: 4KB 1024, 2MB 1024, 4MB 512<br>[ =C2=
=A0 =C2=A00.117752] Last level dTLB entries: 4KB 2048, 2MB 2048, 4MB 1024, =
1GB 0<br>[ =C2=A0 =C2=A00.117756] Spectre V1 : Mitigation: usercopy/swapgs =
barriers and __user pointer sanitization<br>[ =C2=A0 =C2=A00.117758] Spectr=
e V2 : Mitigation: Retpolines<br>[ =C2=A0 =C2=A00.117758] Spectre V2 : Spec=
tre v2 / SpectreRSB mitigation: Filling RSB on context switch<br>[ =C2=A0 =
=C2=A00.117759] Spectre V2 : Enabling Restricted Speculation for firmware c=
alls<br>[ =C2=A0 =C2=A00.117760] Spectre V2 : mitigation: Enabling conditio=
nal Indirect Branch Prediction Barrier<br>[ =C2=A0 =C2=A00.117761] Speculat=
ive Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl a=
nd seccomp<br>[ =C2=A0 =C2=A00.121847] Freeing SMP alternatives memory: 40K=
<br>[ =C2=A0 =C2=A00.121917] clocksource: xen: mask: 0xffffffffffffffff max=
_cycles: 0x1cd42e4dffb, max_idle_ns: 881590591483 ns<br>[ =C2=A0 =C2=A00.12=
1921] Xen: using vcpuop timer interface<br>[ =C2=A0 =C2=A00.121927] install=
ing Xen timer for CPU 0<br>[ =C2=A0 =C2=A00.121969] smpboot: CPU0: AMD Ryze=
n Embedded V2516 with Radeon Graphics (family: 0x17, model: 0x60, stepping:=
 0x1)<br>[ =C2=A0 =C2=A00.121990] cpu 0 spinlock event irq 52<br>[ =C2=A0 =
=C2=A00.122104] Performance Events: PMU not available due to virtualization=
, using software events only.<br>[ =C2=A0 =C2=A00.122129] rcu: Hierarchical=
 SRCU implementation.<br>[ =C2=A0 =C2=A00.122481] NMI watchdog: Perf NMI wa=
tchdog permanently disabled<br>[ =C2=A0 =C2=A00.122523] smp: Bringing up se=
condary CPUs ...<br>[ =C2=A0 =C2=A00.122593] installing Xen timer for CPU 1=
<br>[ =C2=A0 =C2=A00.122629] x86: Booting SMP configuration:<br>[ =C2=A0 =
=C2=A00.122629] .... node =C2=A0#0, CPUs: =C2=A0 =C2=A0 =C2=A0#1<br>[ =C2=
=A0 =C2=A00.201732] cpu 1 spinlock event irq 57<br>[ =C2=A0 =C2=A00.201732]=
 installing Xen timer for CPU 2<br>[ =C2=A0 =C2=A00.201732] =C2=A0#2<br>[ =
=C2=A0 =C2=A00.281442] cpu 2 spinlock event irq 62<br>[ =C2=A0 =C2=A00.2814=
42] installing Xen timer for CPU 3<br>[ =C2=A0 =C2=A00.281484] =C2=A0#3<br>=
[ =C2=A0 =C2=A00.361387] cpu 3 spinlock event irq 67<br>[ =C2=A0 =C2=A00.36=
1409] smp: Brought up 1 node, 4 CPUs<br>[ =C2=A0 =C2=A00.361413] smpboot: M=
ax logical packages: 1<br>[ =C2=A0 =C2=A00.361414] smpboot: Total of 4 proc=
essors activated (16782.38 BogoMIPS)<br>[ =C2=A0 =C2=A00.361965] devtmpfs: =
initialized<br>[ =C2=A0 =C2=A00.361965] x86/mm: Memory block size: 128MB<br=
>[ =C2=A0 =C2=A00.361965] ACPI: PM: Registering ACPI NVS region [mem 0xfc00=
0000-0xfc00afff] (45056 bytes)<br>[ =C2=A0 =C2=A00.361965] clocksource: jif=
fies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 764504178510000=
0 ns<br>[ =C2=A0 =C2=A00.361965] futex hash table entries: 1024 (order: 4, =
65536 bytes, linear)<br>[ =C2=A0 =C2=A00.361965] pinctrl core: initialized =
pinctrl subsystem<br>[ =C2=A0 =C2=A00.361965] PM: RTC time: 10:03:51, date:=
 2022-08-16<br>[ =C2=A0 =C2=A00.361965] NET: Registered PF_NETLINK/PF_ROUTE=
 protocol family<br>[ =C2=A0 =C2=A00.361965] DMA: preallocated 512 KiB GFP_=
KERNEL pool for atomic allocations<br>[ =C2=A0 =C2=A00.361965] DMA: preallo=
cated 512 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations<br>[ =C2=A0 =
=C2=A00.361965] DMA: preallocated 512 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations<br>[ =C2=A0 =C2=A00.361965] audit: initializing netlink sub=
sys (disabled)<br>[ =C2=A0 =C2=A00.361971] audit: type=3D2000 audit(1660644=
231.158:1): state=3Dinitialized audit_enabled=3D0 res=3D1<br>[ =C2=A0 =C2=
=A00.361971] thermal_sys: Registered thermal governor &#39;fair_share&#39;<=
br>[ =C2=A0 =C2=A00.361971] thermal_sys: Registered thermal governor &#39;b=
ang_bang&#39;<br>[ =C2=A0 =C2=A00.361971] thermal_sys: Registered thermal g=
overnor &#39;step_wise&#39;<br>[ =C2=A0 =C2=A00.361971] thermal_sys: Regist=
ered thermal governor &#39;user_space&#39;<br>[ =C2=A0 =C2=A00.361971] ther=
mal_sys: Registered thermal governor &#39;power_allocator&#39;<br>[ =C2=A0 =
=C2=A00.361971] EISA bus registered<br>[ =C2=A0 =C2=A00.361971] cpuidle: us=
ing governor ladder<br>[ =C2=A0 =C2=A00.361971] cpuidle: using governor men=
u<br>[ =C2=A0 =C2=A00.365559] ACPI: bus type PCI registered<br>[ =C2=A0 =C2=
=A00.365559] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5<br>[=
 =C2=A0 =C2=A00.365690] PCI: Using configuration type 1 for base access<br>=
[ =C2=A0 =C2=A00.365690] PCI: Using configuration type 1 for extended acces=
s<br>[ =C2=A0 =C2=A00.366624] Kprobes globally optimized<br>[ =C2=A0 =C2=A0=
0.366633] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages<br>[=
 =C2=A0 =C2=A00.366633] HugeTLB registered 2.00 MiB page size, pre-allocate=
d 0 pages<br>[ =C2=A0 =C2=A00.369383] ACPI: Added _OSI(Module Device)<br>[ =
=C2=A0 =C2=A00.369385] ACPI: Added _OSI(Processor Device)<br>[ =C2=A0 =C2=
=A00.369385] ACPI: Added _OSI(3.0 _SCP Extensions)<br>[ =C2=A0 =C2=A00.3693=
86] ACPI: Added _OSI(Processor Aggregator Device)<br>[ =C2=A0 =C2=A00.36938=
7] ACPI: Added _OSI(Linux-Dell-Video)<br>[ =C2=A0 =C2=A00.369388] ACPI: Add=
ed _OSI(Linux-Lenovo-NV-HDMI-Audio)<br>[ =C2=A0 =C2=A00.369388] ACPI: Added=
 _OSI(Linux-HPI-Hybrid-Graphics)<br>[ =C2=A0 =C2=A00.374303] ACPI: 3 ACPI A=
ML tables successfully acquired and loaded<br>[ =C2=A0 =C2=A00.375004] xen:=
 --&gt; pirq=3D16 -&gt; irq=3D9 (gsi=3D9)<br>[ =C2=A0 =C2=A00.382575] ACPI:=
 Interpreter enabled<br>[ =C2=A0 =C2=A00.382587] ACPI: PM: (supports S0 S3 =
S4 S5)<br>[ =C2=A0 =C2=A00.382588] ACPI: Using IOAPIC for interrupt routing=
<br>[ =C2=A0 =C2=A00.382603] PCI: Using host bridge windows from ACPI; if n=
ecessary, use &quot;pci=3Dnocrs&quot; and report a bug<br>[ =C2=A0 =C2=A00.=
382912] ACPI: Enabled 2 GPEs in block 00 to 0F<br>[ =C2=A0 =C2=A00.389818] =
ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])<br>[ =C2=A0 =C2=A00.=
389825] acpi PNP0A03:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Seg=
ments MSI HPX-Type3]<br>[ =C2=A0 =C2=A00.390288] acpiphp: Slot [3] register=
ed<br>[ =C2=A0 =C2=A00.390343] acpiphp: Slot [4] registered<br>[ =C2=A0 =C2=
=A00.390374] acpiphp: Slot [5] registered<br>[ =C2=A0 =C2=A00.390407] acpip=
hp: Slot [6] registered<br>[ =C2=A0 =C2=A00.390437] acpiphp: Slot [7] regis=
tered<br>[ =C2=A0 =C2=A00.390467] acpiphp: Slot [8] registered<br>[ =C2=A0 =
=C2=A00.390497] acpiphp: Slot [9] registered<br>[ =C2=A0 =C2=A00.390529] ac=
piphp: Slot [10] registered<br>[ =C2=A0 =C2=A00.390559] acpiphp: Slot [11] =
registered<br>[ =C2=A0 =C2=A00.390588] acpiphp: Slot [12] registered<br>[ =
=C2=A0 =C2=A00.390619] acpiphp: Slot [13] registered<br>[ =C2=A0 =C2=A00.39=
0649] acpiphp: Slot [14] registered<br>[ =C2=A0 =C2=A00.390679] acpiphp: Sl=
ot [15] registered<br>[ =C2=A0 =C2=A00.390710] acpiphp: Slot [16] registere=
d<br>[ =C2=A0 =C2=A00.390742] acpiphp: Slot [17] registered<br>[ =C2=A0 =C2=
=A00.390771] acpiphp: Slot [18] registered<br>[ =C2=A0 =C2=A00.390801] acpi=
php: Slot [19] registered<br>[ =C2=A0 =C2=A00.390831] acpiphp: Slot [20] re=
gistered<br>[ =C2=A0 =C2=A00.390862] acpiphp: Slot [21] registered<br>[ =C2=
=A0 =C2=A00.390892] acpiphp: Slot [22] registered<br>[ =C2=A0 =C2=A00.39092=
4] acpiphp: Slot [23] registered<br>[ =C2=A0 =C2=A00.390953] acpiphp: Slot =
[24] registered<br>[ =C2=A0 =C2=A00.390983] acpiphp: Slot [25] registered<b=
r>[ =C2=A0 =C2=A00.391014] acpiphp: Slot [26] registered<br>[ =C2=A0 =C2=A0=
0.391044] acpiphp: Slot [27] registered<br>[ =C2=A0 =C2=A00.391074] acpiphp=
: Slot [28] registered<br>[ =C2=A0 =C2=A00.391105] acpiphp: Slot [29] regis=
tered<br>[ =C2=A0 =C2=A00.391136] acpiphp: Slot [30] registered<br>[ =C2=A0=
 =C2=A00.391166] acpiphp: Slot [31] registered<br>[ =C2=A0 =C2=A00.391193] =
PCI host bridge to bus 0000:00<br>[ =C2=A0 =C2=A00.391195] pci_bus 0000:00:=
 root bus resource [bus 00-ff]<br>[ =C2=A0 =C2=A00.391196] pci_bus 0000:00:=
 root bus resource [io =C2=A00x0000-0x0cf7 window]<br>[ =C2=A0 =C2=A00.3911=
97] pci_bus 0000:00: root bus resource [io =C2=A00x0d00-0xffff window]<br>[=
 =C2=A0 =C2=A00.391198] pci_bus 0000:00: root bus resource [mem 0x000a0000-=
0x000bffff window]<br>[ =C2=A0 =C2=A00.391200] pci_bus 0000:00: root bus re=
source [mem 0xf0000000-0xfbffffff window]<br>[ =C2=A0 =C2=A00.392097] pci 0=
000:00:00.0: [8086:1237] type 00 class 0x060000<br>[ =C2=A0 =C2=A00.395106]=
 pci 0000:00:01.0: [8086:7000] type 00 class 0x060100<br>[ =C2=A0 =C2=A00.3=
98764] pci 0000:00:01.1: [8086:7010] type 00 class 0x010180<br>[ =C2=A0 =C2=
=A00.401310] pci 0000:00:01.1: reg 0x20: [io =C2=A00xc200-0xc20f]<br>[ =C2=
=A0 =C2=A00.402042] pci 0000:00:01.1: legacy IDE quirk: reg 0x10: [io =C2=
=A00x01f0-0x01f7]<br>[ =C2=A0 =C2=A00.402046] pci 0000:00:01.1: legacy IDE =
quirk: reg 0x14: [io =C2=A00x03f6]<br>[ =C2=A0 =C2=A00.402048] pci 0000:00:=
01.1: legacy IDE quirk: reg 0x18: [io =C2=A00x0170-0x0177]<br>[ =C2=A0 =C2=
=A00.402050] pci 0000:00:01.1: legacy IDE quirk: reg 0x1c: [io =C2=A00x0376=
]<br>[ =C2=A0 =C2=A00.403095] pci 0000:00:01.2: [8086:7020] type 00 class 0=
x0c0300<br>[ =C2=A0 =C2=A00.408382] pci 0000:00:01.2: reg 0x20: [io =C2=A00=
xc200-0xc21f]<br>[ =C2=A0 =C2=A00.411492] pci 0000:00:01.3: [8086:7113] typ=
e 00 class 0x068000<br>[ =C2=A0 =C2=A00.414058] pci 0000:00:01.3: quirk: [i=
o =C2=A00xb000-0xb03f] claimed by PIIX4 ACPI<br>[ =C2=A0 =C2=A00.414125] pc=
i 0000:00:01.3: quirk: [io =C2=A00xb100-0xb10f] claimed by PIIX4 SMB<br>[ =
=C2=A0 =C2=A00.415904] pci 0000:00:02.0: [5853:0001] type 00 class 0xff8000=
<br>[ =C2=A0 =C2=A00.416975] pci 0000:00:02.0: reg 0x10: [io =C2=A00xc000-0=
xc0ff]<br>[ =C2=A0 =C2=A00.417744] pci 0000:00:02.0: reg 0x14: [mem 0xf0000=
000-0xf0ffffff pref]<br>[ =C2=A0 =C2=A00.423658] pci 0000:00:03.0: [1af4:10=
50] type 00 class 0x030000<br>[ =C2=A0 =C2=A00.424674] pci 0000:00:03.0: re=
g 0x10: [mem 0xf1000000-0xf17fffff pref]<br>[ =C2=A0 =C2=A00.426331] pci 00=
00:00:03.0: reg 0x18: [mem 0xf1850000-0xf1853fff 64bit pref]<br>[ =C2=A0 =
=C2=A00.427343] pci 0000:00:03.0: reg 0x20: [mem 0xf1854000-0xf1854fff]<br>=
[ =C2=A0 =C2=A00.429328] pci 0000:00:03.0: reg 0x30: [mem 0xf1840000-0xf184=
ffff pref]<br>[ =C2=A0 =C2=A00.429561] pci 0000:00:03.0: Video device with =
shadowed ROM at [mem 0x000c0000-0x000dffff]<br>[ =C2=A0 =C2=A00.442223] ACP=
I: PCI: Interrupt link LNKA configured for IRQ 5<br>[ =C2=A0 =C2=A00.445589=
] ACPI: PCI: Interrupt link LNKB configured for IRQ 10<br>[ =C2=A0 =C2=A00.=
446086] ACPI: PCI: Interrupt link LNKC configured for IRQ 11<br>[ =C2=A0 =
=C2=A00.446565] ACPI: PCI: Interrupt link LNKD configured for IRQ 5<br>[ =
=C2=A0 =C2=A00.452471] xen:balloon: Initialising balloon driver<br>[ =C2=A0=
 =C2=A00.452504] iommu: Default domain type: Translated <br>[ =C2=A0 =C2=A0=
0.452504] iommu: DMA domain TLB invalidation policy: lazy mode <br>[ =C2=A0=
 =C2=A00.452504] SCSI subsystem initialized<br>[ =C2=A0 =C2=A00.452504] lib=
ata version 3.00 loaded.<br>[ =C2=A0 =C2=A00.453475] pci 0000:00:03.0: vgaa=
rb: setting as boot VGA device<br>[ =C2=A0 =C2=A00.453478] pci 0000:00:03.0=
: vgaarb: VGA device added: decodes=3Dio+mem,owns=3Dio+mem,locks=3Dnone<br>=
[ =C2=A0 =C2=A00.453482] pci 0000:00:03.0: vgaarb: bridge control possible<=
br>[ =C2=A0 =C2=A00.453484] vgaarb: loaded<br>[ =C2=A0 =C2=A00.453513] ACPI=
: bus type USB registered<br>[ =C2=A0 =C2=A00.453533] usbcore: registered n=
ew interface driver usbfs<br>[ =C2=A0 =C2=A00.453543] usbcore: registered n=
ew interface driver hub<br>[ =C2=A0 =C2=A00.453553] usbcore: registered new=
 device driver usb<br>[ =C2=A0 =C2=A00.453586] pps_core: LinuxPPS API ver. =
1 registered<br>[ =C2=A0 =C2=A00.453588] pps_core: Software ver. 5.3.6 - Co=
pyright 2005-2007 Rodolfo Giometti &lt;<a href=3D"mailto:giometti@linux.it"=
>giometti@linux.it</a>&gt;<br>[ =C2=A0 =C2=A00.453592] PTP clock support re=
gistered<br>[ =C2=A0 =C2=A00.453619] EDAC MC: Ver: 3.0.0<br>[ =C2=A0 =C2=A0=
0.454282] NetLabel: Initializing<br>[ =C2=A0 =C2=A00.454282] NetLabel: =C2=
=A0domain hash size =3D 128<br>[ =C2=A0 =C2=A00.454282] NetLabel: =C2=A0pro=
tocols =3D UNLABELED CIPSOv4 CALIPSO<br>[ =C2=A0 =C2=A00.454282] NetLabel: =
=C2=A0unlabeled traffic allowed by default<br>[ =C2=A0 =C2=A00.454282] PCI:=
 Using ACPI for IRQ routing<br>[ =C2=A0 =C2=A00.454282] PCI: pci_cache_line=
_size set to 64 bytes<br>[ =C2=A0 =C2=A00.454282] pci 0000:00:01.1: can&#39=
;t claim BAR 4 [io =C2=A00xc200-0xc20f]: address conflict with 0000:00:01.2=
 [io =C2=A00xc200-0xc21f]<br>[ =C2=A0 =C2=A00.454282] e820: reserve RAM buf=
fer [mem 0x0009fc00-0x0009ffff]<br>[ =C2=A0 =C2=A00.454282] e820: reserve R=
AM buffer [mem 0xeffff000-0xefffffff]<br>[ =C2=A0 =C2=A00.454282] e820: res=
erve RAM buffer [mem 0x10f800000-0x10fffffff]<br>[ =C2=A0 =C2=A00.454282] h=
pet0: at MMIO 0xfed00000, IRQs 2, 8, 0<br>[ =C2=A0 =C2=A00.454282] hpet0: 3=
 comparators, 64-bit 62.500000 MHz counter<br>[ =C2=A0 =C2=A00.460486] cloc=
ksource: Switched to clocksource xen<br>[ =C2=A0 =C2=A00.472984] VFS: Disk =
quotas dquot_6.6.0<br>[ =C2=A0 =C2=A00.473001] VFS: Dquot-cache hash table =
entries: 512 (order 0, 4096 bytes)<br>[ =C2=A0 =C2=A00.473105] AppArmor: Ap=
pArmor Filesystem Enabled<br>[ =C2=A0 =C2=A00.473124] pnp: PnP ACPI init<br=
>[ =C2=A0 =C2=A00.473202] system 00:00: [mem 0x00000000-0x0009ffff] could n=
ot be reserved<br>[ =C2=A0 =C2=A00.473273] system 00:01: [io =C2=A00x08a0-0=
x08a3] has been reserved<br>[ =C2=A0 =C2=A00.473275] system 00:01: [io =C2=
=A00x0cc0-0x0ccf] has been reserved<br>[ =C2=A0 =C2=A00.473275] system 00:0=
1: [io =C2=A00x04d0-0x04d1] has been reserved<br>[ =C2=A0 =C2=A00.473304] x=
en: --&gt; pirq=3D17 -&gt; irq=3D8 (gsi=3D8)<br>[ =C2=A0 =C2=A00.473363] xe=
n: --&gt; pirq=3D18 -&gt; irq=3D12 (gsi=3D12)<br>[ =C2=A0 =C2=A00.473388] x=
en: --&gt; pirq=3D19 -&gt; irq=3D1 (gsi=3D1)<br>[ =C2=A0 =C2=A00.473414] xe=
n: --&gt; pirq=3D20 -&gt; irq=3D6 (gsi=3D6)<br>[ =C2=A0 =C2=A00.473417] pnp=
 00:05: [dma 2]<br>[ =C2=A0 =C2=A00.473473] system 00:06: [io =C2=A00xae00-=
0xae0f] has been reserved<br>[ =C2=A0 =C2=A00.473475] system 00:06: [io =C2=
=A00xb044-0xb047] has been reserved<br>[ =C2=A0 =C2=A00.475437] pnp: PnP AC=
PI: found 7 devices<br>[ =C2=A0 =C2=A00.482559] clocksource: acpi_pm: mask:=
 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns<br>[ =C2=A0 =C2=
=A00.482606] NET: Registered PF_INET protocol family<br>[ =C2=A0 =C2=A00.48=
2689] IP idents hash table entries: 65536 (order: 7, 524288 bytes, linear)<=
br>[ =C2=A0 =C2=A00.483191] tcp_listen_portaddr_hash hash table entries: 20=
48 (order: 3, 32768 bytes, linear)<br>[ =C2=A0 =C2=A00.483225] TCP establis=
hed hash table entries: 32768 (order: 6, 262144 bytes, linear)<br>[ =C2=A0 =
=C2=A00.483322] TCP bind hash table entries: 32768 (order: 7, 524288 bytes,=
 linear)<br>[ =C2=A0 =C2=A00.483357] TCP: Hash tables configured (establish=
ed 32768 bind 32768)<br>[ =C2=A0 =C2=A00.483430] MPTCP token hash table ent=
ries: 4096 (order: 4, 98304 bytes, linear)<br>[ =C2=A0 =C2=A00.483462] UDP =
hash table entries: 2048 (order: 4, 65536 bytes, linear)<br>[ =C2=A0 =C2=A0=
0.483475] UDP-Lite hash table entries: 2048 (order: 4, 65536 bytes, linear)=
<br>[ =C2=A0 =C2=A00.483502] NET: Registered PF_UNIX/PF_LOCAL protocol fami=
ly<br>[ =C2=A0 =C2=A00.483506] NET: Registered PF_XDP protocol family<br>[ =
=C2=A0 =C2=A00.483517] pci 0000:00:01.1: BAR 4: assigned [io =C2=A00x1000-0=
x100f]<br>[ =C2=A0 =C2=A00.483647] pci_bus 0000:00: resource 4 [io =C2=A00x=
0000-0x0cf7 window]<br>[ =C2=A0 =C2=A00.483648] pci_bus 0000:00: resource 5=
 [io =C2=A00x0d00-0xffff window]<br>[ =C2=A0 =C2=A00.483649] pci_bus 0000:0=
0: resource 6 [mem 0x000a0000-0x000bffff window]<br>[ =C2=A0 =C2=A00.483650=
] pci_bus 0000:00: resource 7 [mem 0xf0000000-0xfbffffff window]<br>[ =C2=
=A0 =C2=A00.483750] pci 0000:00:01.0: PIIX3: Enabling Passive Release<br>[ =
=C2=A0 =C2=A00.483803] pci 0000:00:00.0: Limiting direct PCI/PCI transfers<=
br>[ =C2=A0 =C2=A00.483855] pci 0000:00:01.0: Activating ISA DMA hang worka=
rounds<br>[ =C2=A0 =C2=A00.484244] xen: --&gt; pirq=3D21 -&gt; irq=3D23 (gs=
i=3D23)<br>[ =C2=A0 =C2=A00.485535] PCI: CLS 0 bytes, default 64<br>[ =C2=
=A0 =C2=A00.485545] PCI-DMA: Using software bounce buffering for IO (SWIOTL=
B)<br>[ =C2=A0 =C2=A00.485546] software IO TLB: mapped [mem 0x00000000ebfff=
000-0x00000000effff000] (64MB)<br>[ =C2=A0 =C2=A00.485628] Trying to unpack=
 rootfs image as initramfs...<br>[ =C2=A0 =C2=A00.486028] Initialise system=
 trusted keyrings<br>[ =C2=A0 =C2=A00.486049] Key type blacklist registered=
<br>[ =C2=A0 =C2=A00.486122] workingset: timestamp_bits=3D36 max_order=3D20=
 bucket_order=3D0<br>[ =C2=A0 =C2=A00.486920] zbud: loaded<br>[ =C2=A0 =C2=
=A00.487097] squashfs: version 4.0 (2009/01/31) Phillip Lougher<br>[ =C2=A0=
 =C2=A00.487273] fuse: init (API version 7.34)<br>[ =C2=A0 =C2=A00.487499] =
integrity: Platform Keyring initialized<br>[ =C2=A0 =C2=A00.490112] Key typ=
e asymmetric registered<br>[ =C2=A0 =C2=A00.490112] Asymmetric key parser &=
#39;x509&#39; registered<br>[ =C2=A0 =C2=A00.490129] Block layer SCSI gener=
ic (bsg) driver version 0.4 loaded (major 243)<br>[ =C2=A0 =C2=A00.490202] =
io scheduler mq-deadline registered<br>[ =C2=A0 =C2=A00.490536] shpchp: Sta=
ndard Hot Plug PCI Controller Driver version: 0.4<br>[ =C2=A0 =C2=A00.49064=
2] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input0<br>=
[ =C2=A0 =C2=A00.490669] ACPI: button: Power Button [PWRF]<br>[ =C2=A0 =C2=
=A00.490694] input: Sleep Button as /devices/LNXSYSTM:00/LNXSLPBN:00/input/=
input1<br>[ =C2=A0 =C2=A00.490703] ACPI: button: Sleep Button [SLPF]<br>[ =
=C2=A0 =C2=A00.491294] xen: --&gt; pirq=3D22 -&gt; irq=3D28 (gsi=3D28)<br>[=
 =C2=A0 =C2=A00.502206] xen: --&gt; pirq=3D23 -&gt; irq=3D24 (gsi=3D24)<br>=
[ =C2=A0 =C2=A00.502508] xen:grant_table: Grant tables using version 1 layo=
ut<br>[ =C2=A0 =C2=A00.502550] Grant table initialized<br>[ =C2=A0 =C2=A00.=
503306] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled<br>[ =C2=
=A0 =C2=A00.506090] Linux agpgart interface v0.103<br>[ =C2=A0 =C2=A00.5121=
83] loop: module loaded<br>[ =C2=A0 =C2=A00.513365] ata_piix 0000:00:01.1: =
version 2.13<br>[ =C2=A0 =C2=A00.513594] ata_piix 0000:00:01.1: enabling de=
vice (0000 -&gt; 0001)<br>[ =C2=A0 =C2=A00.518007] blkfront: xvda: flush di=
skcache: enabled; persistent grants: disabled; indirect descriptors: disabl=
ed;<br>[ =C2=A0 =C2=A00.520138] scsi host0: ata_piix<br>[ =C2=A0 =C2=A00.52=
0399] scsi host1: ata_piix<br>[ =C2=A0 =C2=A00.520445] ata1: PATA max MWDMA=
2 cmd 0x1f0 ctl 0x3f6 bmdma 0x1000 irq 14<br>[ =C2=A0 =C2=A00.520449] ata2:=
 PATA max MWDMA2 cmd 0x170 ctl 0x376 bmdma 0x1008 irq 15<br>[ =C2=A0 =C2=A0=
0.520658] tun: Universal TUN/TAP device driver, 1.6<br>[ =C2=A0 =C2=A00.520=
757] PPP generic driver version 2.4.2<br>[ =C2=A0 =C2=A00.520870] xen_netfr=
ont: Initialising Xen virtual ethernet driver<br>[ =C2=A0 =C2=A00.521168] =
=C2=A0xvda: xvda1 xvda2 xvda3<br>[ =C2=A0 =C2=A00.521950] VFIO - User Level=
 meta-driver version: 0.3<br>[ =C2=A0 =C2=A00.522059] ehci_hcd: USB 2.0 &#3=
9;Enhanced&#39; Host Controller (EHCI) Driver<br>[ =C2=A0 =C2=A00.522064] e=
hci-pci: EHCI PCI platform driver<br>[ =C2=A0 =C2=A00.522072] ehci-platform=
: EHCI generic platform driver<br>[ =C2=A0 =C2=A00.522076] ohci_hcd: USB 1.=
1 &#39;Open&#39; Host Controller (OHCI) Driver<br>[ =C2=A0 =C2=A00.522078] =
ohci-pci: OHCI PCI platform driver<br>[ =C2=A0 =C2=A00.522081] ohci-platfor=
m: OHCI generic platform driver<br>[ =C2=A0 =C2=A00.522087] uhci_hcd: USB U=
niversal Host Controller Interface driver<br>[ =C2=A0 =C2=A00.523764] uhci_=
hcd 0000:00:01.2: UHCI Host Controller<br>[ =C2=A0 =C2=A00.523779] uhci_hcd=
 0000:00:01.2: new USB bus registered, assigned bus number 1<br>[ =C2=A0 =
=C2=A00.523910] uhci_hcd 0000:00:01.2: detected 2 ports<br>[ =C2=A0 =C2=A00=
.524363] uhci_hcd 0000:00:01.2: irq 23, io base 0x0000c200<br>[ =C2=A0 =C2=
=A00.524805] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=3D0=
001, bcdDevice=3D 5.15<br>[ =C2=A0 =C2=A00.524812] usb usb1: New USB device=
 strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=A0 =C2=A00.524815=
] usb usb1: Product: UHCI Host Controller<br>[ =C2=A0 =C2=A00.524818] usb u=
sb1: Manufacturer: Linux 5.15.0-25-generic uhci_hcd<br>[ =C2=A0 =C2=A00.524=
820] usb usb1: SerialNumber: 0000:00:01.2<br>[ =C2=A0 =C2=A00.524995] hub 1=
-0:1.0: USB hub found<br>[ =C2=A0 =C2=A00.525002] hub 1-0:1.0: 2 ports dete=
cted<br>[ =C2=A0 =C2=A00.525428] i8042: PNP: PS/2 Controller [PNP0303:PS2K,=
PNP0f13:PS2M] at 0x60,0x64 irq 1,12<br>[ =C2=A0 =C2=A00.527062] xen_netfron=
t: backend supports XDP headroom<br>[ =C2=A0 =C2=A00.529071] serio: i8042 K=
BD port at 0x60,0x64 irq 1<br>[ =C2=A0 =C2=A00.529083] serio: i8042 AUX por=
t at 0x60,0x64 irq 12<br>[ =C2=A0 =C2=A00.529290] mousedev: PS/2 mouse devi=
ce common for all mice<br>[ =C2=A0 =C2=A00.530692] input: AT Translated Set=
 2 keyboard as /devices/platform/i8042/serio0/input/input2<br>[ =C2=A0 =C2=
=A00.531233] rtc_cmos 00:02: registered as rtc0<br>[ =C2=A0 =C2=A00.532070]=
 rtc_cmos 00:02: setting system clock to 2022-08-16T10:03:51 UTC (166064423=
1)<br>[ =C2=A0 =C2=A00.532110] rtc_cmos 00:02: alarms up to one day, 114 by=
tes nvram, hpet irqs<br>[ =C2=A0 =C2=A00.532128] i2c_dev: i2c /dev entries =
driver<br>[ =C2=A0 =C2=A00.532168] device-mapper: core: CONFIG_IMA_DISABLE_=
HTABLE is disabled. Duplicate IMA measurements will not be recorded in the =
IMA log.<br>[ =C2=A0 =C2=A00.532221] device-mapper: uevent: version 1.0.3<b=
r>[ =C2=A0 =C2=A00.532343] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) =
initialised: <a href=3D"mailto:dm-devel@redhat.com">dm-devel@redhat.com</a>=
<br>[ =C2=A0 =C2=A00.532392] platform eisa.0: Probing EISA bus 0<br>[ =C2=
=A0 =C2=A00.532395] platform eisa.0: EISA: Cannot allocate resource for mai=
nboard<br>[ =C2=A0 =C2=A00.532398] platform eisa.0: Cannot allocate resourc=
e for EISA slot 1<br>[ =C2=A0 =C2=A00.532400] platform eisa.0: Cannot alloc=
ate resource for EISA slot 2<br>[ =C2=A0 =C2=A00.532402] platform eisa.0: C=
annot allocate resource for EISA slot 3<br>[ =C2=A0 =C2=A00.532403] platfor=
m eisa.0: Cannot allocate resource for EISA slot 4<br>[ =C2=A0 =C2=A00.5324=
05] platform eisa.0: Cannot allocate resource for EISA slot 5<br>[ =C2=A0 =
=C2=A00.532407] platform eisa.0: Cannot allocate resource for EISA slot 6<b=
r>[ =C2=A0 =C2=A00.532408] platform eisa.0: Cannot allocate resource for EI=
SA slot 7<br>[ =C2=A0 =C2=A00.532410] platform eisa.0: Cannot allocate reso=
urce for EISA slot 8<br>[ =C2=A0 =C2=A00.532412] platform eisa.0: EISA: Det=
ected 0 cards<br>[ =C2=A0 =C2=A00.532528] ledtrig-cpu: registered to indica=
te activity on CPUs<br>[ =C2=A0 =C2=A00.532550] vesafb: mode is 640x480x32,=
 linelength=3D2560, pages=3D0<br>[ =C2=A0 =C2=A00.532552] vesafb: scrolling=
: redraw<br>[ =C2=A0 =C2=A00.532552] vesafb: Truecolor: size=3D8:8:8:8, shi=
ft=3D24:16:8:0<br>[ =C2=A0 =C2=A00.532568] vesafb: framebuffer at 0xf100000=
0, mapped to 0x000000006e7c94d5, using 1216k, total 1216k<br>[ =C2=A0 =C2=
=A00.532629] fbcon: Deferring console take-over<br>[ =C2=A0 =C2=A00.532630]=
 fb0: VESA VGA frame buffer device<br>[ =C2=A0 =C2=A00.532721] drop_monitor=
: Initializing network drop monitor service<br>[ =C2=A0 =C2=A00.532841] NET=
: Registered PF_INET6 protocol family<br>[ =C2=A0 =C2=A00.842492] Freeing i=
nitrd memory: 60524K<br>[ =C2=A0 =C2=A00.850586] Segment Routing with IPv6<=
br>[ =C2=A0 =C2=A00.850608] In-situ OAM (IOAM) with IPv6<br>[ =C2=A0 =C2=A0=
0.850657] NET: Registered PF_PACKET protocol family<br>[ =C2=A0 =C2=A00.850=
754] Key type dns_resolver registered<br>[ =C2=A0 =C2=A00.851230] IPI short=
hand broadcast: enabled<br>[ =C2=A0 =C2=A00.851247] sched_clock: Marking st=
able (851343609, -194696)-&gt;(857336759, -6187846)<br>[ =C2=A0 =C2=A00.851=
532] registered taskstats version 1<br>[ =C2=A0 =C2=A00.851696] Loading com=
piled-in X.509 certificates<br>[ =C2=A0 =C2=A00.852907] Loaded X.509 cert &=
#39;Build time autogenerated kernel key: c887ab1fa6442665629113512b4db089a7=
808038&#39;<br>[ =C2=A0 =C2=A00.853729] Loaded X.509 cert &#39;Canonical Lt=
d. Live Patch Signing: 14df34d1a87cf37625abec039ef2bf521249b969&#39;<br>[ =
=C2=A0 =C2=A00.854530] Loaded X.509 cert &#39;Canonical Ltd. Kernel Module =
Signing: 88f752e560a1e0737e31163a466ad7b70a850c19&#39;<br>[ =C2=A0 =C2=A00.=
854534] blacklist: Loading compiled-in revocation X.509 certificates<br>[ =
=C2=A0 =C2=A00.854568] Loaded X.509 cert &#39;Canonical Ltd. Secure Boot Si=
gning: 61482aa2830d0ab2ad5af10b7250da9033ddcef0&#39;<br>[ =C2=A0 =C2=A00.85=
4781] zswap: loaded using pool lzo/zbud<br>[ =C2=A0 =C2=A00.855324] Key typ=
e ._fscrypt registered<br>[ =C2=A0 =C2=A00.855328] Key type .fscrypt regist=
ered<br>[ =C2=A0 =C2=A00.855330] Key type fscrypt-provisioning registered<b=
r>[ =C2=A0 =C2=A00.857364] usb 1-1: new full-speed USB device number 2 usin=
g uhci_hcd<br>[ =C2=A0 =C2=A00.859895] Key type encrypted registered<br>[ =
=C2=A0 =C2=A00.859902] AppArmor: AppArmor sha1 policy hashing enabled<br>[ =
=C2=A0 =C2=A00.859910] ima: No TPM chip found, activating TPM-bypass!<br>[ =
=C2=A0 =C2=A00.859918] Loading compiled-in module X.509 certificates<br>[ =
=C2=A0 =C2=A00.861118] Loaded X.509 cert &#39;Build time autogenerated kern=
el key: c887ab1fa6442665629113512b4db089a7808038&#39;<br>[ =C2=A0 =C2=A00.8=
61122] ima: Allocated hash algorithm: sha1<br>[ =C2=A0 =C2=A00.861133] ima:=
 No architecture policies found<br>[ =C2=A0 =C2=A00.861149] evm: Initialisi=
ng EVM extended attributes:<br>[ =C2=A0 =C2=A00.861150] evm: security.selin=
ux<br>[ =C2=A0 =C2=A00.861152] evm: security.SMACK64<br>[ =C2=A0 =C2=A00.86=
1153] evm: security.SMACK64EXEC<br>[ =C2=A0 =C2=A00.861154] evm: security.S=
MACK64TRANSMUTE<br>[ =C2=A0 =C2=A00.861155] evm: security.SMACK64MMAP<br>[ =
=C2=A0 =C2=A00.861156] evm: security.apparmor<br>[ =C2=A0 =C2=A00.861157] e=
vm: security.ima<br>[ =C2=A0 =C2=A00.861158] evm: security.capability<br>[ =
=C2=A0 =C2=A00.861160] evm: HMAC attrs: 0x1<br>[ =C2=A0 =C2=A00.861788] xen=
bus_probe_frontend: Device with no driver: device/vkbd/0<br>[ =C2=A0 =C2=A0=
0.861870] PM: =C2=A0 Magic number: 2:786:72<br>[ =C2=A0 =C2=A00.862376] RAS=
: Correctable Errors collector initialized.<br>[ =C2=A0 =C2=A00.865608] Fre=
eing unused decrypted memory: 2036K<br>[ =C2=A0 =C2=A00.866378] Freeing unu=
sed kernel image (initmem) memory: 2952K<br>[ =C2=A0 =C2=A00.889375] Write =
protecting the kernel read-only data: 30720k<br>[ =C2=A0 =C2=A00.890318] Fr=
eeing unused kernel image (text/rodata gap) memory: 2036K<br>[ =C2=A0 =C2=
=A00.890802] Freeing unused kernel image (rodata/data gap) memory: 1504K<br=
>[ =C2=A0 =C2=A00.936352] x86/mm: Checked W+X mappings: passed, no W+X page=
s found.<br>[ =C2=A0 =C2=A00.936636] Run /init as init process<br>[ =C2=A0 =
=C2=A00.936643] =C2=A0 with arguments:<br>[ =C2=A0 =C2=A00.936645] =C2=A0 =
=C2=A0 /init<br>[ =C2=A0 =C2=A00.936646] =C2=A0 =C2=A0 splash<br>[ =C2=A0 =
=C2=A00.936648] =C2=A0 with environment:<br>[ =C2=A0 =C2=A00.936649] =C2=A0=
 =C2=A0 HOME=3D/<br>[ =C2=A0 =C2=A00.936650] =C2=A0 =C2=A0 TERM=3Dlinux<br>=
[ =C2=A0 =C2=A00.936651] =C2=A0 =C2=A0 BOOT_IMAGE=3D/boot/vmlinuz-5.15.0-25=
-generic<br>[ =C2=A0 =C2=A01.036484] piix4_smbus 0000:00:01.3: SMBus Host C=
ontroller not enabled!<br>[ =C2=A0 =C2=A01.036490] fbcon: Taking over conso=
le<br>[ =C2=A0 =C2=A01.039250] Console: switching to colour frame buffer de=
vice 80x30<br>[ =C2=A0 =C2=A01.055941] FDC 0 is a S82078B<br>[ =C2=A0 =C2=
=A01.078207] usb 1-1: New USB device found, idVendor=3D0627, idProduct=3D00=
01, bcdDevice=3D 0.00<br>[ =C2=A0 =C2=A01.078215] usb 1-1: New USB device s=
trings: Mfr=3D1, Product=3D3, SerialNumber=3D10<br>[ =C2=A0 =C2=A01.078218]=
 usb 1-1: Product: QEMU USB Tablet<br>[ =C2=A0 =C2=A01.078220] usb 1-1: Man=
ufacturer: QEMU<br>[ =C2=A0 =C2=A01.078221] usb 1-1: SerialNumber: 42<br>[ =
=C2=A0 =C2=A01.098463] hid: raw HID events driver (C) Jiri Kosina<br>[ =C2=
=A0 =C2=A01.104173] usbcore: registered new interface driver usbhid<br>[ =
=C2=A0 =C2=A01.104177] usbhid: USB HID core driver<br>[ =C2=A0 =C2=A01.1087=
71] input: QEMU QEMU USB Tablet as /devices/pci0000:00/0000:00:01.2/usb1/1-=
1/1-1:1.0/0003:0627:0001.0001/input/input5<br>[ =C2=A0 =C2=A01.109051] hid-=
generic 0003:0627:0001.0001: input,hidraw0: USB HID v0.01 Mouse [QEMU QEMU =
USB Tablet] on usb-0000:00:01.2-1/input0<br>[ =C2=A0 =C2=A01.242332] EXT4-f=
s (xvda3): mounted filesystem with ordered data mode. Opts: (null). Quota m=
ode: none.<br>[ =C2=A0 =C2=A01.353433] systemd[1]: Inserted module &#39;aut=
ofs4&#39;<br>[ =C2=A0 =C2=A01.372606] systemd[1]: systemd 249.11-0ubuntu3 r=
unning in system mode (+PAM +AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP =
+GCRYPT +GNUTLS -OPENSSL +ACL +BLKID +CURL +ELFUTILS -FIDO2 +IDN2 -IDN +IPT=
C +KMOD +LIBCRYPTSETUP -LIBFDISK +PCRE2 -PWQUALITY -P11KIT -QRENCODE +BZIP2=
 +LZ4 +XZ +ZLIB +ZSTD -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunifie=
d)<br>[ =C2=A0 =C2=A01.372690] systemd[1]: Detected virtualization xen.<br>=
[ =C2=A0 =C2=A01.372697] systemd[1]: Detected architecture x86-64.<br>[ =C2=
=A0 =C2=A01.373227] systemd[1]: Hostname set to &lt;HVM-GUEST&gt;.<br>[ =C2=
=A0 =C2=A01.590054] systemd[1]: Queued start job for default target Graphic=
al Interface.<br>[ =C2=A0 =C2=A01.592059] systemd[1]: Created slice Slice /=
system/modprobe.<br>[ =C2=A0 =C2=A01.592607] systemd[1]: Created slice Slic=
e /system/serial-getty.<br>[ =C2=A0 =C2=A01.593111] systemd[1]: Created sli=
ce Slice /system/systemd-fsck.<br>[ =C2=A0 =C2=A01.593423] systemd[1]: Crea=
ted slice User and Session Slice.<br>[ =C2=A0 =C2=A01.593540] systemd[1]: S=
tarted Forward Password Requests to Wall Directory Watch.<br>[ =C2=A0 =C2=
=A01.593816] systemd[1]: Set up automount Arbitrary Executable File Formats=
 File System Automount Point.<br>[ =C2=A0 =C2=A01.593945] systemd[1]: Reach=
ed target User and Group Name Lookups.<br>[ =C2=A0 =C2=A01.593972] systemd[=
1]: Reached target Remote File Systems.<br>[ =C2=A0 =C2=A01.593994] systemd=
[1]: Reached target Slice Units.<br>[ =C2=A0 =C2=A01.594047] systemd[1]: Re=
ached target Local Verity Protected Volumes.<br>[ =C2=A0 =C2=A01.594241] sy=
stemd[1]: Listening on Syslog Socket.<br>[ =C2=A0 =C2=A01.594362] systemd[1=
]: Listening on fsck to fsckd communication Socket.<br>[ =C2=A0 =C2=A01.594=
450] systemd[1]: Listening on initctl Compatibility Named Pipe.<br>[ =C2=A0=
 =C2=A01.594705] systemd[1]: Listening on Journal Audit Socket.<br>[ =C2=A0=
 =C2=A01.594833] systemd[1]: Listening on Journal Socket (/dev/log).<br>[ =
=C2=A0 =C2=A01.594992] systemd[1]: Listening on Journal Socket.<br>[ =C2=A0=
 =C2=A01.595593] systemd[1]: Listening on udev Control Socket.<br>[ =C2=A0 =
=C2=A01.595751] systemd[1]: Listening on udev Kernel Socket.<br>[ =C2=A0 =
=C2=A01.596837] systemd[1]: Mounting Huge Pages File System...<br>[ =C2=A0 =
=C2=A01.598024] systemd[1]: Mounting POSIX Message Queue File System...<br>=
[ =C2=A0 =C2=A01.599213] systemd[1]: Mounting Kernel Debug File System...<b=
r>[ =C2=A0 =C2=A01.600394] systemd[1]: Mounting Kernel Trace File System...=
<br>[ =C2=A0 =C2=A01.603377] systemd[1]: Starting Journal Service...<br>[ =
=C2=A0 =C2=A01.605041] systemd[1]: Starting Set the console keyboard layout=
...<br>[ =C2=A0 =C2=A01.606625] systemd[1]: Starting Create List of Static =
Device Nodes...<br>[ =C2=A0 =C2=A01.608115] systemd[1]: Starting Load Kerne=
l Module configfs...<br>[ =C2=A0 =C2=A01.609446] systemd[1]: Starting Load =
Kernel Module drm...<br>[ =C2=A0 =C2=A01.610757] systemd[1]: Starting Load =
Kernel Module fuse...<br>[ =C2=A0 =C2=A01.611025] systemd[1]: Condition che=
ck resulted in File System Check on Root Device being skipped.<br>[ =C2=A0 =
=C2=A01.614076] systemd[1]: Starting Load Kernel Modules...<br>[ =C2=A0 =C2=
=A01.616455] systemd[1]: Starting Remount Root and Kernel File Systems...<b=
r>[ =C2=A0 =C2=A01.624748] systemd[1]: Starting Coldplug All udev Devices..=
.<br>[ =C2=A0 =C2=A01.627022] systemd[1]: Mounted Huge Pages File System.<b=
r>[ =C2=A0 =C2=A01.627141] systemd[1]: Mounted POSIX Message Queue File Sys=
tem.<br>[ =C2=A0 =C2=A01.627227] systemd[1]: Mounted Kernel Debug File Syst=
em.<br>[ =C2=A0 =C2=A01.627315] systemd[1]: Mounted Kernel Trace File Syste=
m.<br>[ =C2=A0 =C2=A01.627636] systemd[1]: Finished Create List of Static D=
evice Nodes.<br>[ =C2=A0 =C2=A01.627985] systemd[1]: modprobe@configfs.serv=
ice: Deactivated successfully.<br>[ =C2=A0 =C2=A01.628221] systemd[1]: Fini=
shed Load Kernel Module configfs.<br>[ =C2=A0 =C2=A01.628480] systemd[1]: m=
odprobe@fuse.service: Deactivated successfully.<br>[ =C2=A0 =C2=A01.628704]=
 systemd[1]: Finished Load Kernel Module fuse.<br>[ =C2=A0 =C2=A01.629866] =
EXT4-fs (xvda3): re-mounted. Opts: errors=3Dremount-ro. Quota mode: none.<b=
r>[ =C2=A0 =C2=A01.630115] systemd[1]: Mounting FUSE Control File System...=
<br>[ =C2=A0 =C2=A01.631378] systemd[1]: Mounting Kernel Configuration File=
 System...<br>[ =C2=A0 =C2=A01.634418] systemd[1]: modprobe@drm.service: De=
activated successfully.<br>[ =C2=A0 =C2=A01.634598] systemd[1]: Finished Lo=
ad Kernel Module drm.<br>[ =C2=A0 =C2=A01.634842] systemd[1]: Finished Remo=
unt Root and Kernel File Systems.<br>[ =C2=A0 =C2=A01.634938] systemd[1]: M=
ounted FUSE Control File System.<br>[ =C2=A0 =C2=A01.634982] systemd[1]: Mo=
unted Kernel Configuration File System.<br>[ =C2=A0 =C2=A01.635685] systemd=
[1]: Activating swap /swapfile...<br>[ =C2=A0 =C2=A01.635752] systemd[1]: C=
ondition check resulted in Platform Persistent Storage Archival being skipp=
ed.<br>[ =C2=A0 =C2=A01.637031] systemd[1]: Starting Load/Save Random Seed.=
..<br>[ =C2=A0 =C2=A01.641131] Adding 2097148k swap on /swapfile.=C2=A0 Pri=
ority:-2 extents:6 across:2260988k SSFS<br>[ =C2=A0 =C2=A01.642488] systemd=
[1]: Starting Create System Users...<br>[ =C2=A0 =C2=A01.642572] systemd[1]=
: Activated swap /swapfile.<br>[ =C2=A0 =C2=A01.642765] systemd[1]: Reached=
 target Swaps.<br>[ =C2=A0 =C2=A01.643321] lp: driver loaded but no devices=
 found<br>[ =C2=A0 =C2=A01.651810] systemd[1]: Started Journal Service.<br>=
[ =C2=A0 =C2=A01.655589] systemd-journald[259]: Received client request to =
flush runtime journal.<br>[ =C2=A0 =C2=A01.657118] ppdev: user-space parall=
el port driver<br>[ =C2=A0 =C2=A01.667097] IPMI message handler: version 39=
.2<br>[ =C2=A0 =C2=A01.668319] ipmi device interface<br>[ =C2=A0 =C2=A01.67=
5912] loop0: detected capacity change from 0 to 8<br>[ =C2=A0 =C2=A01.67868=
3] loop1: detected capacity change from 0 to 126760<br>[ =C2=A0 =C2=A01.681=
650] loop2: detected capacity change from 0 to 318728<br>[ =C2=A0 =C2=A01.6=
83964] loop3: detected capacity change from 0 to 509456<br>[ =C2=A0 =C2=A01=
.686052] loop4: detected capacity change from 0 to 166424<br>[ =C2=A0 =C2=
=A01.687119] loop5: detected capacity change from 0 to 93920<br>[ =C2=A0 =
=C2=A01.687391] loop6: detected capacity change from 0 to 89352<br>[ =C2=A0=
 =C2=A01.692831] loop7: detected capacity change from 0 to 568<br>[ =C2=A0 =
=C2=A01.957855] cryptd: max_cpu_qlen set to 1000<br>[ =C2=A0 =C2=A01.999918=
] AVX2 version of gcm_enc/dec engaged.<br>[ =C2=A0 =C2=A02.000019] AES CTR =
mode by8 optimization enabled<br>[ =C2=A0 =C2=A02.043047] input: Xen Virtua=
l Keyboard as /devices/virtual/input/input6<br>[ =C2=A0 =C2=A02.043943] inp=
ut: Xen Virtual Pointer as /devices/virtual/input/input7<br>[ =C2=A0 =C2=A0=
2.073671] [drm] pci: virtio-vga detected at 0000:00:03.0<br>[ =C2=A0 =C2=A0=
2.073675] checking generic (f1000000 130000) vs hw (f1000000 800000)<br>[ =
=C2=A0 =C2=A02.073677] fb0: switching to virtio_gpu from VESA VGA<br>[ =C2=
=A0 =C2=A02.123276] Console: switching to colour dummy device 80x25<br>[ =
=C2=A0 =C2=A02.123582] virtio-pci 0000:00:03.0: vgaarb: deactivate vga cons=
ole<br>[ =C2=A0 =C2=A02.125945] [drm] features: +virgl -edid -resource_blob=
 -host_visible<br>[ =C2=A0 =C2=A02.136638] [drm] number of scanouts: 1<br>[=
 =C2=A0 =C2=A02.136692] [drm] number of cap sets: 2<br>[ =C2=A0 =C2=A02.179=
337] [drm] cap set 0: id 1, max-version 1, max-size 308<br>[ =C2=A0 =C2=A02=
.179388] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/=
serio1/input/input4<br>[ =C2=A0 =C2=A02.179638] [drm] cap set 1: id 2, max-=
version 2, max-size 856<br>[ =C2=A0 =C2=A02.182465] [drm] Initialized virti=
o_gpu 0.1.0 0 for virtio0 on minor 0<br>[ =C2=A0 =C2=A02.193057] virtio_gpu=
 virtio0: [drm] drm_plane_enable_fb_damage_clips() not called<br>[ =C2=A0 =
=C2=A02.194721] Console: switching to colour frame buffer device 128x48<br>=
[ =C2=A0 =C2=A02.219672] virtio_gpu virtio0: [drm] fb0: virtio_gpudrmfb fra=
me buffer device<br>[ =C2=A0 =C2=A02.280885] audit: type=3D1400 audit(16606=
44233.244:2): apparmor=3D&quot;STATUS&quot; operation=3D&quot;profile_load&=
quot; profile=3D&quot;unconfined&quot; name=3D&quot;nvidia_modprobe&quot; p=
id=3D417 comm=3D&quot;apparmor_parser&quot;<br>[ =C2=A0 =C2=A02.280898] aud=
it: type=3D1400 audit(1660644233.244:3): apparmor=3D&quot;STATUS&quot; oper=
ation=3D&quot;profile_load&quot; profile=3D&quot;unconfined&quot; name=3D&q=
uot;nvidia_modprobe//kmod&quot; pid=3D417 comm=3D&quot;apparmor_parser&quot=
;<br>[ =C2=A0 =C2=A02.283374] audit: type=3D1400 audit(1660644233.248:4): a=
pparmor=3D&quot;STATUS&quot; operation=3D&quot;profile_load&quot; profile=
=3D&quot;unconfined&quot; name=3D&quot;lsb_release&quot; pid=3D416 comm=3D&=
quot;apparmor_parser&quot;<br>[ =C2=A0 =C2=A02.287067] audit: type=3D1400 a=
udit(1660644233.248:5): apparmor=3D&quot;STATUS&quot; operation=3D&quot;pro=
file_load&quot; profile=3D&quot;unconfined&quot; name=3D&quot;/usr/lib/Netw=
orkManager/nm-dhcp-client.action&quot; pid=3D418 comm=3D&quot;apparmor_pars=
er&quot;<br>[ =C2=A0 =C2=A02.287073] audit: type=3D1400 audit(1660644233.24=
8:6): apparmor=3D&quot;STATUS&quot; operation=3D&quot;profile_load&quot; pr=
ofile=3D&quot;unconfined&quot; name=3D&quot;/usr/lib/NetworkManager/nm-dhcp=
-helper&quot; pid=3D418 comm=3D&quot;apparmor_parser&quot;<br>[ =C2=A0 =C2=
=A02.287075] audit: type=3D1400 audit(1660644233.248:7): apparmor=3D&quot;S=
TATUS&quot; operation=3D&quot;profile_load&quot; profile=3D&quot;unconfined=
&quot; name=3D&quot;/usr/lib/connman/scripts/dhclient-script&quot; pid=3D41=
8 comm=3D&quot;apparmor_parser&quot;<br>[ =C2=A0 =C2=A02.287076] audit: typ=
e=3D1400 audit(1660644233.248:8): apparmor=3D&quot;STATUS&quot; operation=
=3D&quot;profile_load&quot; profile=3D&quot;unconfined&quot; name=3D&quot;/=
{,usr/}sbin/dhclient&quot; pid=3D418 comm=3D&quot;apparmor_parser&quot;<br>=
[ =C2=A0 =C2=A02.294768] audit: type=3D1400 audit(1660644233.260:9): apparm=
or=3D&quot;STATUS&quot; operation=3D&quot;profile_load&quot; profile=3D&quo=
t;unconfined&quot; name=3D&quot;/usr/bin/man&quot; pid=3D422 comm=3D&quot;a=
pparmor_parser&quot;<br>[ =C2=A0 =C2=A02.294783] audit: type=3D1400 audit(1=
660644233.260:10): apparmor=3D&quot;STATUS&quot; operation=3D&quot;profile_=
load&quot; profile=3D&quot;unconfined&quot; name=3D&quot;man_filter&quot; p=
id=3D422 comm=3D&quot;apparmor_parser&quot;<br>[ =C2=A0 =C2=A02.765051] loo=
p8: detected capacity change from 0 to 8<br>[ =C2=A0 =C2=A04.617492] rfkill=
: input handler disabled<br>[ =C2=A0 32.054348] kauditd_printk_skb: 38 call=
backs suppressed<br>[ =C2=A0 32.054351] audit: type=3D1400 audit(1660644263=
.020:49): apparmor=3D&quot;DENIED&quot; operation=3D&quot;capable&quot; pro=
file=3D&quot;/usr/sbin/cups-browsed&quot; pid=3D1390 comm=3D&quot;cups-brow=
sed&quot; capability=3D23 =C2=A0capname=3D&quot;sys_nice&quot;<br>[ =C2=A0 =
68.680921] pci 0000:00:04.0: [8086:24cd] type 00 class 0x0c0320<br>[ =C2=A0=
 68.681909] pci 0000:00:04.0: reg 0x10: [mem 0x00000000-0x00000fff]<br>[ =
=C2=A0 68.686395] pci 0000:00:04.0: BAR 0: assigned [mem 0xf1800000-0xf1800=
fff]<br>[ =C2=A0 68.687377] pci 0000:00:04.0: enabling device (0000 -&gt; 0=
002)<br>[ =C2=A0 68.689224] xen: --&gt; pirq=3D24 -&gt; irq=3D35 (gsi=3D35)=
<br>[ =C2=A0 68.692834] ehci-pci 0000:00:04.0: EHCI Host Controller<br>[ =
=C2=A0 68.692850] ehci-pci 0000:00:04.0: new USB bus registered, assigned b=
us number 2<br>[ =C2=A0 68.694281] ehci-pci 0000:00:04.0: irq 35, io mem 0x=
f1800000<br>[ =C2=A0 68.708467] ehci-pci 0000:00:04.0: USB 2.0 started, EHC=
I 1.00<br>[ =C2=A0 68.708678] usb usb2: New USB device found, idVendor=3D1d=
6b, idProduct=3D0002, bcdDevice=3D 5.15<br>[ =C2=A0 68.708684] usb usb2: Ne=
w USB device strings: Mfr=3D3, Product=3D2, SerialNumber=3D1<br>[ =C2=A0 68=
.708687] usb usb2: Product: EHCI Host Controller<br>[ =C2=A0 68.708690] usb=
 usb2: Manufacturer: Linux 5.15.0-25-generic ehci_hcd<br>[ =C2=A0 68.708693=
] usb usb2: SerialNumber: 0000:00:04.0<br>[ =C2=A0 68.709004] hub 2-0:1.0: =
USB hub found<br>[ =C2=A0 68.709014] hub 2-0:1.0: 6 ports detected<br>[ =C2=
=A0125.693224] usb 2-1: new high-speed USB device number 2 using ehci-pci<b=
r>[ =C2=A0125.860036] usb 2-1: config 1 interface 0 altsetting 0 bulk endpo=
int 0x81 has invalid maxpacket 1024<br>[ =C2=A0125.860046] usb 2-1: config =
1 interface 0 altsetting 0 bulk endpoint 0x2 has invalid maxpacket 1024<br>=
[ =C2=A0125.868162] usb 2-1: New USB device found, idVendor=3D0781, idProdu=
ct=3D55a9, bcdDevice=3D 1.00<br>[ =C2=A0125.868169] usb 2-1: New USB device=
 strings: Mfr=3D1, Product=3D2, SerialNumber=3D3<br>[ =C2=A0125.868172] usb=
 2-1: Product: =C2=A0SanDisk 3.2Gen1<br>[ =C2=A0125.868175] usb 2-1: Manufa=
cturer: =C2=A0USB<br>[ =C2=A0125.868177] usb 2-1: SerialNumber: 0401679941e=
4bd74075d85f9c579b3ea676bfcb7793d641baffeb9351793d80925ba000000000000000000=
004c882c7f00906e18a955810790aaa0fa<br>[ =C2=A0125.886442] usb-storage 2-1:1=
.0: USB Mass Storage device detected<br>[ =C2=A0125.886855] scsi host2: usb=
-storage 2-1:1.0<br>[ =C2=A0125.887014] usbcore: registered new interface d=
river usb-storage<br>[ =C2=A0125.892109] usbcore: registered new interface =
driver uas<br>[ =C2=A0126.914284] scsi 2:0:0:0: Direct-Access =C2=A0 =C2=A0=
 =C2=A0USB =C2=A0 =C2=A0 =C2=A0SanDisk 3.2Gen1 1.00 PQ: 0 ANSI: 6<br>[ =C2=
=A0126.914710] sd 2:0:0:0: Attached scsi generic sg0 type 0<br><b>[ =C2=A01=
26.926413] sd 2:0:0:0: [sda] 120176640 512-byte logical blocks: (61.5 GB/57=
.3 GiB)<br>[ =C2=A0126.939662] sd 2:0:0:0: [sda] Write Protect is off<br>[ =
=C2=A0126.939670] sd 2:0:0:0: [sda] Mode Sense: 43 00 00 00<br>[ =C2=A0126.=
952697] sd 2:0:0:0: [sda] Write cache: disabled, read cache: enabled, doesn=
&#39;t support DPO or FUA<br>[ =C2=A0127.045601] =C2=A0sda: sda1<br>[ =C2=
=A0127.086759] sd 2:0:0:0: [sda] Attached SCSI removable disk<br>[ =C2=A012=
8.333409] usb 2-1: reset high-speed USB device number 2 using ehci-pci<br>[=
 =C2=A0128.502872] sd 2:0:0:0: [sda] tag#0 FAILED Result: hostbyte=3DDID_ER=
ROR driverbyte=3DDRIVER_OK cmd_age=3D0s<br>[ =C2=A0128.502881] sd 2:0:0:0: =
[sda] tag#0 CDB: Read(10) 28 00 00 00 7a b7 00 00 3f 00<br>[ =C2=A0128.5028=
83] blk_update_request: I/O error, dev sda, sector 31415 op 0x0:(READ) flag=
s 0x80700 phys_seg 63 prio class 0<br>[ =C2=A0159.238904] usb 2-1: reset hi=
gh-speed USB device number 2 using ehci-pci<br>[ =C2=A0363.738313] INFO: ta=
sk kworker/u8:1:103 blocked for more than 120 seconds.<br>[ =C2=A0363.73832=
7] =C2=A0 =C2=A0 =C2=A0 Not tainted 5.15.0-25-generic #25-Ubuntu<br></b>[ =
=C2=A0363.738331] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs=
&quot; disables this message.<br>[ =C2=A0363.738334] task:kworker/u8:1 =C2=
=A0 =C2=A0state:D stack: =C2=A0 =C2=A00 pid: =C2=A0103 ppid: =C2=A0 =C2=A0 =
2 flags:0x00004000<br>[ =C2=A0363.738343] Workqueue: events_freezable_power=
_ disk_events_workfn<br>[ =C2=A0363.738357] Call Trace:<br>[ =C2=A0363.7383=
61] =C2=A0&lt;TASK&gt;<br>[ =C2=A0363.738366] =C2=A0__schedule+0x23d/0x590<=
br>[ =C2=A0363.738375] =C2=A0schedule+0x4e/0xb0<br>[ =C2=A0363.738380] =C2=
=A0io_schedule+0x46/0x70<br>[ =C2=A0363.738385] =C2=A0blk_mq_get_tag+0x11b/=
0x300<br>[ =C2=A0363.738391] =C2=A0? wait_woken+0x70/0x70<br>[ =C2=A0363.73=
8398] =C2=A0__blk_mq_alloc_request+0x101/0x180<br>[ =C2=A0363.738402] =C2=
=A0blk_mq_alloc_request+0x7a/0xc0<br>[ =C2=A0363.738406] =C2=A0blk_get_requ=
est+0x27/0x60<br>[ =C2=A0363.738412] =C2=A0__scsi_execute+0x48/0x260<br>[ =
=C2=A0363.738417] =C2=A0scsi_test_unit_ready+0x60/0xe0<br>[ =C2=A0363.73842=
1] =C2=A0sd_check_events+0x194/0x230<br>[ =C2=A0363.738426] =C2=A0disk_chec=
k_events+0x3c/0x110<br>[ =C2=A0363.738431] =C2=A0disk_events_workfn+0x19/0x=
20<br>[ =C2=A0363.738435] =C2=A0process_one_work+0x22b/0x3d0<br>[ =C2=A0363=
.738442] =C2=A0worker_thread+0x53/0x410<br>[ =C2=A0363.738447] =C2=A0? proc=
ess_one_work+0x3d0/0x3d0<br>[ =C2=A0363.738452] =C2=A0kthread+0x12a/0x150<b=
r>[ =C2=A0363.738457] =C2=A0? set_kthread_struct+0x50/0x50<br>[ =C2=A0363.7=
38461] =C2=A0ret_from_fork+0x22/0x30<br>[ =C2=A0363.738469] =C2=A0&lt;/TASK=
&gt;<br>[ =C2=A0363.738491] INFO: task pool-udisksd:1698 blocked for more t=
han 120 seconds.<br>[ =C2=A0363.738494] =C2=A0 =C2=A0 =C2=A0 Not tainted 5.=
15.0-25-generic #25-Ubuntu<br>[ =C2=A0363.738497] &quot;echo 0 &gt; /proc/s=
ys/kernel/hung_task_timeout_secs&quot; disables this message.<br>[ =C2=A036=
3.738499] task:pool-udisksd =C2=A0 =C2=A0state:D stack: =C2=A0 =C2=A00 pid:=
 1698 ppid: =C2=A0 =C2=A0 1 flags:0x00004002<br>[ =C2=A0363.738504] Call Tr=
ace:<br>[ =C2=A0363.738506] =C2=A0&lt;TASK&gt;<br>[ =C2=A0363.738507] =C2=
=A0__schedule+0x23d/0x590<br>[ =C2=A0363.738513] =C2=A0? bit_wait+0x60/0x60=
<br>[ =C2=A0363.738517] =C2=A0schedule+0x4e/0xb0<br>[ =C2=A0363.738522] =C2=
=A0io_schedule+0x46/0x70<br>[ =C2=A0363.738527] =C2=A0bit_wait_io+0x11/0x60=
<br>[ =C2=A0363.738532] =C2=A0__wait_on_bit+0x33/0xa0<br>[ =C2=A0363.738537=
] =C2=A0out_of_line_wait_on_bit+0x8d/0xb0<br>[ =C2=A0363.738542] =C2=A0? va=
r_wake_function+0x30/0x30<br>[ =C2=A0363.738546] =C2=A0__bread_gfp+0xf6/0x1=
20<br>[ =C2=A0363.738553] =C2=A0fat__get_entry+0x15c/0x240<br>[ =C2=A0363.7=
38561] =C2=A0fat_get_short_entry+0x62/0xb0<br>[ =C2=A0363.738566] =C2=A0fat=
_subdirs+0x5c/0x90<br>[ =C2=A0363.738571] =C2=A0fat_read_root+0x130/0x170<b=
r>[ =C2=A0363.738574] =C2=A0fat_fill_super+0x63c/0x880<br>[ =C2=A0363.73857=
8] =C2=A0? snprintf+0x49/0x60<br>[ =C2=A0363.738583] =C2=A0vfat_fill_super+=
0x1a/0x20<br>[ =C2=A0363.738586] =C2=A0mount_bdev+0x196/0x1c0<br>[ =C2=A036=
3.738591] =C2=A0? vfat_mount+0x20/0x20<br>[ =C2=A0363.738595] =C2=A0vfat_mo=
unt+0x15/0x20<br>[ =C2=A0363.738598] =C2=A0legacy_get_tree+0x2b/0x50<br>[ =
=C2=A0363.738602] =C2=A0vfs_get_tree+0x2a/0xc0<br>[ =C2=A0363.738606] =C2=
=A0do_new_mount+0x16e/0x2d0<br>[ =C2=A0363.738611] =C2=A0path_mount+0x1db/0=
x880<br>[ =C2=A0363.738614] =C2=A0? putname+0x55/0x60<br>[ =C2=A0363.738619=
] =C2=A0__x64_sys_mount+0x108/0x140<br>[ =C2=A0363.738623] =C2=A0do_syscall=
_64+0x5c/0xc0<br>[ =C2=A0363.738629] =C2=A0? do_syscall_64+0x69/0xc0<br>[ =
=C2=A0363.738633] =C2=A0? exit_to_user_mode_prepare+0x37/0xb0<br>[ =C2=A036=
3.738639] =C2=A0? syscall_exit_to_user_mode+0x27/0x50<br>[ =C2=A0363.738643=
] =C2=A0? __do_sys_getuid+0x28/0x30<br>[ =C2=A0363.738646] =C2=A0? do_sysca=
ll_64+0x69/0xc0<br>[ =C2=A0363.738650] =C2=A0? syscall_exit_to_user_mode+0x=
27/0x50<br>[ =C2=A0363.738654] =C2=A0? exit_to_user_mode_prepare+0x37/0xb0<=
br>[ =C2=A0363.738657] =C2=A0? syscall_exit_to_user_mode+0x27/0x50<br>[ =C2=
=A0363.738660] =C2=A0? __do_sys_getgid+0x28/0x30<br>[ =C2=A0363.738663] =C2=
=A0? do_syscall_64+0x69/0xc0<br>[ =C2=A0363.738667] =C2=A0? __x64_sys_readl=
ink+0x1e/0x30<br>[ =C2=A0363.738671] =C2=A0? do_syscall_64+0x69/0xc0<br>[ =
=C2=A0363.738675] =C2=A0? irqentry_exit+0x19/0x30<br>[ =C2=A0363.738679] =
=C2=A0? exc_page_fault+0x89/0x160<br>[ =C2=A0363.738681] =C2=A0? asm_exc_pa=
ge_fault+0x8/0x30<br>[ =C2=A0363.738686] =C2=A0entry_SYSCALL_64_after_hwfra=
me+0x44/0xae<br>[ =C2=A0363.738691] RIP: 0033:0x7f511763eeae<br>[ =C2=A0363=
.738696] RSP: 002b:00007f51163782e8 EFLAGS: 00000246 ORIG_RAX: 000000000000=
00a5<br>[ =C2=A0363.738701] RAX: ffffffffffffffda RBX: 0000000000000000 RCX=
: 00007f511763eeae<br>[ =C2=A0363.738703] RDX: 00007f51080188e0 RSI: 00007f=
5108018960 RDI: 00007f5108018940<br>[ =C2=A0363.738706] RBP: 00007f5108018b=
50 R08: 00007f5108018d80 R09: 0000000000000001<br>[ =C2=A0363.738708] R10: =
0000000000000006 R11: 0000000000000246 R12: 0000000000000000<br>[ =C2=A0363=
.738710] R13: 00007f51080188e0 R14: 00007f5108018940 R15: 00007f5108018b50<=
br>[ =C2=A0363.738715] =C2=A0&lt;/TASK&gt;<br>[ =C2=A0363.738761] INFO: tas=
k scsi_eh_2:1671 blocked for more than 120 seconds.<br>[ =C2=A0363.738765] =
=C2=A0 =C2=A0 =C2=A0 Not tainted 5.15.0-25-generic #25-Ubuntu<br>[ =C2=A036=
3.738767] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; d=
isables this message.<br>[ =C2=A0363.738769] task:scsi_eh_2 =C2=A0 =C2=A0 =
=C2=A0 state:D stack: =C2=A0 =C2=A00 pid: 1671 ppid: =C2=A0 =C2=A0 2 flags:=
0x00004000<br>[ =C2=A0363.738773] Call Trace:<br>[ =C2=A0363.738775] =C2=A0=
&lt;TASK&gt;<br>[ =C2=A0363.738777] =C2=A0__schedule+0x23d/0x590<br>[ =C2=
=A0363.738782] =C2=A0schedule+0x4e/0xb0<br>[ =C2=A0363.738787] =C2=A0schedu=
le_preempt_disabled+0xe/0x10<br>[ =C2=A0363.738792] =C2=A0__mutex_lock.cons=
tprop.0+0x263/0x490<br>[ =C2=A0363.738796] =C2=A0? update_load_avg+0x82/0x6=
20<br>[ =C2=A0363.738801] =C2=A0__mutex_lock_slowpath+0x13/0x20<br>[ =C2=A0=
363.738804] =C2=A0mutex_lock+0x34/0x40<br>[ =C2=A0363.738810] =C2=A0device_=
reset+0x22/0x50 [usb_storage]<br>[ =C2=A0363.738818] =C2=A0scsi_eh_bus_devi=
ce_reset+0xee/0x2a0<br>[ =C2=A0363.738824] =C2=A0scsi_eh_ready_devs+0x67/0x=
240<br>[ =C2=A0363.738829] =C2=A0? finish_task_switch.isra.0+0xa6/0x270<br>=
[ =C2=A0363.738834] =C2=A0scsi_unjam_host+0x101/0x1c0<br>[ =C2=A0363.738839=
] =C2=A0? _raw_spin_unlock_irqrestore+0xe/0x30<br>[ =C2=A0363.738844] =C2=
=A0scsi_error_handler+0x139/0x180<br>[ =C2=A0363.738849] =C2=A0? scsi_unjam=
_host+0x1c0/0x1c0<br>[ =C2=A0363.738854] =C2=A0kthread+0x12a/0x150<br>[ =C2=
=A0363.738858] =C2=A0? set_kthread_struct+0x50/0x50<br>[ =C2=A0363.738863] =
=C2=A0ret_from_fork+0x22/0x30<br>[ =C2=A0363.738868] =C2=A0&lt;/TASK&gt;<br=
>[ =C2=A0363.738870] INFO: task usb-storage:1674 blocked for more than 120 =
seconds.<br>[ =C2=A0363.738873] =C2=A0 =C2=A0 =C2=A0 Not tainted 5.15.0-25-=
generic #25-Ubuntu<br>[ =C2=A0363.738875] &quot;echo 0 &gt; /proc/sys/kerne=
l/hung_task_timeout_secs&quot; disables this message.<br>[ =C2=A0363.738877=
] task:usb-storage =C2=A0 =C2=A0 state:D stack: =C2=A0 =C2=A00 pid: 1674 pp=
id: =C2=A0 =C2=A0 2 flags:0x00004000<br>[ =C2=A0363.738881] Call Trace:<br>=
[ =C2=A0363.738883] =C2=A0&lt;TASK&gt;<br>[ =C2=A0363.738884] =C2=A0__sched=
ule+0x23d/0x590<br>[ =C2=A0363.738889] =C2=A0schedule+0x4e/0xb0<br>[ =C2=A0=
363.738894] =C2=A0schedule_timeout+0xfb/0x140<br>[ =C2=A0363.738898] =C2=A0=
__wait_for_common+0xae/0x150<br>[ =C2=A0363.738903] =C2=A0? usleep_range_st=
ate+0x90/0x90<br>[ =C2=A0363.738907] =C2=A0wait_for_completion+0x24/0x30<br=
>[ =C2=A0363.738912] =C2=A0usb_sg_wait+0xee/0x1b0<br>[ =C2=A0363.738916] =
=C2=A0usb_stor_bulk_transfer_sglist+0x8f/0xe0 [usb_storage]<br>[ =C2=A0363.=
738924] =C2=A0usb_stor_Bulk_transport+0x191/0x440 [usb_storage]<br>[ =C2=A0=
363.738931] =C2=A0usb_stor_invoke_transport+0x3e/0x540 [usb_storage]<br>[ =
=C2=A0363.738937] =C2=A0? try_to_wake_up+0x1fc/0x5a0<br>[ =C2=A0363.738942]=
 =C2=A0? __wait_for_common+0x11d/0x150<br>[ =C2=A0363.738947] =C2=A0? uslee=
p_range_state+0x90/0x90<br>[ =C2=A0363.738951] =C2=A0usb_stor_transparent_s=
csi_command+0xe/0x10 [usb_storage]<br>[ =C2=A0363.738957] =C2=A0usb_stor_co=
ntrol_thread+0x198/0x290 [usb_storage]<br>[ =C2=A0363.738964] =C2=A0? stora=
ge_probe+0xd0/0xd0 [usb_storage]<br>[ =C2=A0363.738971] =C2=A0kthread+0x12a=
/0x150<br>[ =C2=A0363.738975] =C2=A0? set_kthread_struct+0x50/0x50<br>[ =C2=
=A0363.738979] =C2=A0ret_from_fork+0x22/0x30<br>[ =C2=A0363.738985] =C2=A0&=
lt;/TASK&gt;<br>[ =C2=A0484.572086] INFO: task kworker/u8:1:103 blocked for=
 more than 241 seconds.<br>[ =C2=A0484.572098] =C2=A0 =C2=A0 =C2=A0 Not tai=
nted 5.15.0-25-generic #25-Ubuntu<br>[ =C2=A0484.572102] &quot;echo 0 &gt; =
/proc/sys/kernel/hung_task_timeout_secs&quot; disables this message.<br>[ =
=C2=A0484.572104] task:kworker/u8:1 =C2=A0 =C2=A0state:D stack: =C2=A0 =C2=
=A00 pid: =C2=A0103 ppid: =C2=A0 =C2=A0 2 flags:0x00004000<br>[ =C2=A0484.5=
72113] Workqueue: events_freezable_power_ disk_events_workfn<br>[ =C2=A0484=
.572124] Call Trace:<br>[ =C2=A0484.572127] =C2=A0&lt;TASK&gt;<br>[ =C2=A04=
84.572131] =C2=A0__schedule+0x23d/0x590<br>[ =C2=A0484.572140] =C2=A0schedu=
le+0x4e/0xb0<br>[ =C2=A0484.572145] =C2=A0io_schedule+0x46/0x70<br>[ =C2=A0=
484.572150] =C2=A0blk_mq_get_tag+0x11b/0x300<br>[ =C2=A0484.572155] =C2=A0?=
 wait_woken+0x70/0x70<br>[ =C2=A0484.572161] =C2=A0__blk_mq_alloc_request+0=
x101/0x180<br>[ =C2=A0484.572165] =C2=A0blk_mq_alloc_request+0x7a/0xc0<br>[=
 =C2=A0484.572169] =C2=A0blk_get_request+0x27/0x60<br>[ =C2=A0484.572175] =
=C2=A0__scsi_execute+0x48/0x260<br>[ =C2=A0484.572179] =C2=A0scsi_test_unit=
_ready+0x60/0xe0<br>[ =C2=A0484.572183] =C2=A0sd_check_events+0x194/0x230<b=
r>[ =C2=A0484.572188] =C2=A0disk_check_events+0x3c/0x110<br>[ =C2=A0484.572=
193] =C2=A0disk_events_workfn+0x19/0x20<br>[ =C2=A0484.572197] =C2=A0proces=
s_one_work+0x22b/0x3d0<br>[ =C2=A0484.572203] =C2=A0worker_thread+0x53/0x41=
0<br>[ =C2=A0484.572208] =C2=A0? process_one_work+0x3d0/0x3d0<br>[ =C2=A048=
4.572213] =C2=A0kthread+0x12a/0x150<br>[ =C2=A0484.572217] =C2=A0? set_kthr=
ead_struct+0x50/0x50<br>[ =C2=A0484.572222] =C2=A0ret_from_fork+0x22/0x30<b=
r>[ =C2=A0484.572229] =C2=A0&lt;/TASK&gt;<br>[ =C2=A0484.572259] INFO: task=
 pool-udisksd:1698 blocked for more than 241 seconds.<br>[ =C2=A0484.572263=
] =C2=A0 =C2=A0 =C2=A0 Not tainted 5.15.0-25-generic #25-Ubuntu<br>[ =C2=A0=
484.572265] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot;=
 disables this message.<br>[ =C2=A0484.572267] task:pool-udisksd =C2=A0 =C2=
=A0state:D stack: =C2=A0 =C2=A00 pid: 1698 ppid: =C2=A0 =C2=A0 1 flags:0x00=
004002<br>[ =C2=A0484.572273] Call Trace:<br>[ =C2=A0484.572274] =C2=A0&lt;=
TASK&gt;<br>[ =C2=A0484.572276] =C2=A0__schedule+0x23d/0x590<br>[ =C2=A0484=
.572281] =C2=A0? bit_wait+0x60/0x60<br>[ =C2=A0484.572286] =C2=A0schedule+0=
x4e/0xb0<br>[ =C2=A0484.572291] =C2=A0io_schedule+0x46/0x70<br>[ =C2=A0484.=
572295] =C2=A0bit_wait_io+0x11/0x60<br>[ =C2=A0484.572300] =C2=A0__wait_on_=
bit+0x33/0xa0<br>[ =C2=A0484.572305] =C2=A0out_of_line_wait_on_bit+0x8d/0xb=
0<br>[ =C2=A0484.572310] =C2=A0? var_wake_function+0x30/0x30<br>[ =C2=A0484=
.572314] =C2=A0__bread_gfp+0xf6/0x120<br>[ =C2=A0484.572322] =C2=A0fat__get=
_entry+0x15c/0x240<br>[ =C2=A0484.572329] =C2=A0fat_get_short_entry+0x62/0x=
b0<br>[ =C2=A0484.572334] =C2=A0fat_subdirs+0x5c/0x90<br>[ =C2=A0484.572339=
] =C2=A0fat_read_root+0x130/0x170<br>[ =C2=A0484.572342] =C2=A0fat_fill_sup=
er+0x63c/0x880<br>[ =C2=A0484.572345] =C2=A0? snprintf+0x49/0x60<br>[ =C2=
=A0484.572351] =C2=A0vfat_fill_super+0x1a/0x20<br>[ =C2=A0484.572354] =C2=
=A0mount_bdev+0x196/0x1c0<br>[ =C2=A0484.572359] =C2=A0? vfat_mount+0x20/0x=
20<br>[ =C2=A0484.572363] =C2=A0vfat_mount+0x15/0x20<br>[ =C2=A0484.572365]=
 =C2=A0legacy_get_tree+0x2b/0x50<br>[ =C2=A0484.572369] =C2=A0vfs_get_tree+=
0x2a/0xc0<br>[ =C2=A0484.572373] =C2=A0do_new_mount+0x16e/0x2d0<br>[ =C2=A0=
484.572378] =C2=A0path_mount+0x1db/0x880<br>[ =C2=A0484.572381] =C2=A0? put=
name+0x55/0x60<br>[ =C2=A0484.572385] =C2=A0__x64_sys_mount+0x108/0x140<br>=
[ =C2=A0484.572389] =C2=A0do_syscall_64+0x5c/0xc0<br>[ =C2=A0484.572395] =
=C2=A0? do_syscall_64+0x69/0xc0<br>[ =C2=A0484.572399] =C2=A0? exit_to_user=
_mode_prepare+0x37/0xb0<br>[ =C2=A0484.572405] =C2=A0? syscall_exit_to_user=
_mode+0x27/0x50<br>[ =C2=A0484.572409] =C2=A0? __do_sys_getuid+0x28/0x30<br=
>[ =C2=A0484.572412] =C2=A0? do_syscall_64+0x69/0xc0<br>[ =C2=A0484.572417]=
 =C2=A0? syscall_exit_to_user_mode+0x27/0x50<br>[ =C2=A0484.572420] =C2=A0?=
 exit_to_user_mode_prepare+0x37/0xb0<br>[ =C2=A0484.572423] =C2=A0? syscall=
_exit_to_user_mode+0x27/0x50<br>[ =C2=A0484.572426] =C2=A0? __do_sys_getgid=
+0x28/0x30<br>[ =C2=A0484.572429] =C2=A0? do_syscall_64+0x69/0xc0<br>[ =C2=
=A0484.572433] =C2=A0? __x64_sys_readlink+0x1e/0x30<br>[ =C2=A0484.572438] =
=C2=A0? do_syscall_64+0x69/0xc0<br>[ =C2=A0484.572442] =C2=A0? irqentry_exi=
t+0x19/0x30<br>[ =C2=A0484.572445] =C2=A0? exc_page_fault+0x89/0x160<br>[ =
=C2=A0484.572448] =C2=A0? asm_exc_page_fault+0x8/0x30<br>[ =C2=A0484.572452=
] =C2=A0entry_SYSCALL_64_after_hwframe+0x44/0xae<br>[ =C2=A0484.572457] RIP=
: 0033:0x7f511763eeae<br>[ =C2=A0484.572462] RSP: 002b:00007f51163782e8 EFL=
AGS: 00000246 ORIG_RAX: 00000000000000a5<br>[ =C2=A0484.572466] RAX: ffffff=
ffffffffda RBX: 0000000000000000 RCX: 00007f511763eeae<br>[ =C2=A0484.57246=
9] RDX: 00007f51080188e0 RSI: 00007f5108018960 RDI: 00007f5108018940<br>[ =
=C2=A0484.572472] RBP: 00007f5108018b50 R08: 00007f5108018d80 R09: 00000000=
00000001<br>[ =C2=A0484.572474] R10: 0000000000000006 R11: 0000000000000246=
 R12: 0000000000000000<br>[ =C2=A0484.572476] R13: 00007f51080188e0 R14: 00=
007f5108018940 R15: 00007f5108018b50<br>[ =C2=A0484.572481] =C2=A0&lt;/TASK=
&gt;<br>[ =C2=A0484.572526] INFO: task scsi_eh_2:1671 blocked for more than=
 241 seconds.<br>[ =C2=A0484.572529] =C2=A0 =C2=A0 =C2=A0 Not tainted 5.15.=
0-25-generic #25-Ubuntu<br>[ =C2=A0484.572531] &quot;echo 0 &gt; /proc/sys/=
kernel/hung_task_timeout_secs&quot; disables this message.<br>[ =C2=A0484.5=
72533] task:scsi_eh_2 =C2=A0 =C2=A0 =C2=A0 state:D stack: =C2=A0 =C2=A00 pi=
d: 1671 ppid: =C2=A0 =C2=A0 2 flags:0x00004000<br>[ =C2=A0484.572538] Call =
Trace:<br>[ =C2=A0484.572539] =C2=A0&lt;TASK&gt;<br>[ =C2=A0484.572541] =C2=
=A0__schedule+0x23d/0x590<br>[ =C2=A0484.572546] =C2=A0schedule+0x4e/0xb0<b=
r>[ =C2=A0484.572551] =C2=A0schedule_preempt_disabled+0xe/0x10<br>[ =C2=A04=
84.572556] =C2=A0__mutex_lock.constprop.0+0x263/0x490<br>[ =C2=A0484.572560=
] =C2=A0? update_load_avg+0x82/0x620<br>[ =C2=A0484.572565] =C2=A0__mutex_l=
ock_slowpath+0x13/0x20<br>[ =C2=A0484.572568] =C2=A0mutex_lock+0x34/0x40<br=
>[ =C2=A0484.572574] =C2=A0device_reset+0x22/0x50 [usb_storage]<br>[ =C2=A0=
484.572582] =C2=A0scsi_eh_bus_device_reset+0xee/0x2a0<br>[ =C2=A0484.572588=
] =C2=A0scsi_eh_ready_devs+0x67/0x240<br>[ =C2=A0484.572593] =C2=A0? finish=
_task_switch.isra.0+0xa6/0x270<br>[ =C2=A0484.572598] =C2=A0scsi_unjam_host=
+0x101/0x1c0<br>[ =C2=A0484.572603] =C2=A0? _raw_spin_unlock_irqrestore+0xe=
/0x30<br>[ =C2=A0484.572608] =C2=A0scsi_error_handler+0x139/0x180<br>[ =C2=
=A0484.572613] =C2=A0? scsi_unjam_host+0x1c0/0x1c0<br>[ =C2=A0484.572618] =
=C2=A0kthread+0x12a/0x150<br>[ =C2=A0484.572622] =C2=A0? set_kthread_struct=
+0x50/0x50<br>[ =C2=A0484.572626] =C2=A0ret_from_fork+0x22/0x30<br>[ =C2=A0=
484.572632] =C2=A0&lt;/TASK&gt;<br>[ =C2=A0484.572634] INFO: task usb-stora=
ge:1674 blocked for more than 241 seconds.<br>[ =C2=A0484.572636] =C2=A0 =
=C2=A0 =C2=A0 Not tainted 5.15.0-25-generic #25-Ubuntu<br>[ =C2=A0484.57263=
9] &quot;echo 0 &gt; /proc/sys/kernel/hung_task_timeout_secs&quot; disables=
 this message.<br>[ =C2=A0484.572641] task:usb-storage =C2=A0 =C2=A0 state:=
D stack: =C2=A0 =C2=A00 pid: 1674 ppid: =C2=A0 =C2=A0 2 flags:0x00004000<br=
>[ =C2=A0484.572644] Call Trace:<br>[ =C2=A0484.572646] =C2=A0&lt;TASK&gt;<=
br>[ =C2=A0484.572647] =C2=A0__schedule+0x23d/0x590<br>[ =C2=A0484.572653] =
=C2=A0schedule+0x4e/0xb0<br>[ =C2=A0484.572657] =C2=A0schedule_timeout+0xfb=
/0x140<br>[ =C2=A0484.572661] =C2=A0__wait_for_common+0xae/0x150<br>[ =C2=
=A0484.572666] =C2=A0? usleep_range_state+0x90/0x90<br>[ =C2=A0484.572670] =
=C2=A0wait_for_completion+0x24/0x30<br>[ =C2=A0484.572675] =C2=A0usb_sg_wai=
t+0xee/0x1b0<br>[ =C2=A0484.572680] =C2=A0usb_stor_bulk_transfer_sglist+0x8=
f/0xe0 [usb_storage]<br>[ =C2=A0484.572687] =C2=A0usb_stor_Bulk_transport+0=
x191/0x440 [usb_storage]<br>[ =C2=A0484.572694] =C2=A0usb_stor_invoke_trans=
port+0x3e/0x540 [usb_storage]<br>[ =C2=A0484.572701] =C2=A0? try_to_wake_up=
+0x1fc/0x5a0<br>[ =C2=A0484.572705] =C2=A0? __wait_for_common+0x11d/0x150<b=
r>[ =C2=A0484.572710] =C2=A0? usleep_range_state+0x90/0x90<br>[ =C2=A0484.5=
72714] =C2=A0usb_stor_transparent_scsi_command+0xe/0x10 [usb_storage]<br>[ =
=C2=A0484.572720] =C2=A0usb_stor_control_thread+0x198/0x290 [usb_storage]<b=
r>[ =C2=A0484.572728] =C2=A0? storage_probe+0xd0/0xd0 [usb_storage]<br>[ =
=C2=A0484.572734] =C2=A0kthread+0x12a/0x150<br>[ =C2=A0484.572738] =C2=A0? =
set_kthread_struct+0x50/0x50<br>[ =C2=A0484.572742] =C2=A0ret_from_fork+0x2=
2/0x30<br>[ =C2=A0484.572748] =C2=A0&lt;/TASK&gt;<br><div><br></div><div>Th=
anks</div><div>Sudheer</div></div>

--000000000000c5fabd05e67df247--

