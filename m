Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 303AC692C53
	for <lists+xen-devel@lfdr.de>; Sat, 11 Feb 2023 01:56:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.493757.763785 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQeBf-0007ZX-A0; Sat, 11 Feb 2023 00:56:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 493757.763785; Sat, 11 Feb 2023 00:56:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQeBf-0007Ws-6Y; Sat, 11 Feb 2023 00:56:19 +0000
Received: by outflank-mailman (input) for mailman id 493757;
 Sat, 11 Feb 2023 00:56:17 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=0mMB=6H=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pQeBc-0007Wl-PN
 for xen-devel@lists.xenproject.org; Sat, 11 Feb 2023 00:56:17 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id e0674653-a9a6-11ed-93b5-47a8fe42b414;
 Sat, 11 Feb 2023 01:56:12 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BCF8661EF4;
 Sat, 11 Feb 2023 00:56:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93CC7C433EF;
 Sat, 11 Feb 2023 00:56:08 +0000 (UTC)
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
X-Inumbo-ID: e0674653-a9a6-11ed-93b5-47a8fe42b414
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676076970;
	bh=NrBYVm4xp/0D/tT+thD7/E4LRpIFa7BezzoqeXNTaaw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JP0j1/AMtmJzy5K+dY+R08xZ9/GQ6Og9q2eSi1qOW2E9+3Iy5CnjLZbp6P9uKWBhT
	 CNkzckAFxXDADyg3zWam1LgaDOo1DmqKowXSSNxf7kUIxXGS1siqtTvSMFvWCFDGo+
	 lCOo/rodugwqjtLuLUMjJTZcZoOekfi+BrSp2PrCU4Av9+b+U0T0xN2tcEp5iiXu0V
	 /BtGbVCRGzqg/uv1yH8Z4xO8ZYzD35Ns09Qmquj2Qdfposxd1iq/Q1iuuDB7c/T4CJ
	 QuuYEhEgw0srabalCwQWF45pmfoI/qktLE78a97HSFJYHSGkXdyWrCgAkPGHl/PX+Z
	 rfsR4V7SneEew==
Date: Fri, 10 Feb 2023 16:56:07 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>
cc: Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: AW: AW: Xenstore failed to start / Xenalyze on ARM ( NXP S32G3
 with Cortex-A53)
In-Reply-To: <AM5PR0802MB25788E8A571AD920C8CEFF829DDB9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
Message-ID: <alpine.DEB.2.22.394.2302101649390.4661@ubuntu-linux-20-04-desktop>
References: <AM5PR0802MB25781717167B5BFC980BF2A49DFF9@AM5PR0802MB2578.eurprd08.prod.outlook.com> <3e7059c2-0d23-03f2-9a93-f88de09171f4@xen.org> <AM5PR0802MB2578A1389424064D6884588E9DC29@AM5PR0802MB2578.eurprd08.prod.outlook.com> <619a00f0-0f9f-5f5f-13a7-ea86f9c24eec@xen.org>
 <AM5PR0802MB25788E8A571AD920C8CEFF829DDB9@AM5PR0802MB2578.eurprd08.prod.outlook.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2097830747-1676076969=:4661"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2097830747-1676076969=:4661
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 7 Feb 2023, El Mesdadi Youssef ESK UILD7 wrote:
> > hello Julien,
> 
> >first of all thank you so much for the support,  after flashing Xen on the S32G3 I noticed that I cannot create DomUs.
> >when I also give the xl list, it does not even show Dom0 and stays blocked.
> 
> root@s32g399aevb3:~# xl list
> Name                                        ID   Mem VCPUs      State   Time(s)
> 
> root@s32g399aevb3:~# 

This is usually due to the init script (/etc/init.d/xencommons or
systemd scripts) hanging or crashing. As a consequence xenstored doesn't
get launched properly.

 
> >I assume this is because xenstore failed to start, the error is shown in the messages during the boot time.
> 
> [FAILED] Failed to start The Xen xenstore.
> See 'systemctl status xenstored.service' for details.

You need to fix this. A couple of options:

- ignore the systemd scripts, and instead try to execute manually
  bash /etc/init.d/xencommons start
- try to launch xenstored manually with: xenstored &
- have a look at the way Yocto meta-virtualization sets up the systemd
  init scripts as this seems to be a "distro" error
  https://github.com/lgirdk/meta-virtualization/blob/master/recipes-extended/xen/xen-tools.inc
- switch from systemd to SysVinit


> [FAILED] Failed to mount NFSD configuration filesystem.
> See 'systemctl status proc-fs-nfsd.mount' for details.
> 
> >Here is xl.conf in case you need information about this file:
> 
> root@s32g399aevb3:/etc/xen# cat xl.conf
> ## Global XL config file ##
> 
> # Set domain-id policy. "xen" means that the hypervisor will choose the
> # id of a new domain. "random" means that a random value will be chosen.
> #domid_policy="xen"
> 
> # Control whether dom0 is ballooned down when xen doesn't have enough
> # free memory to create a domain.  "auto" means only balloon if dom0
> # starts with all the host's memory.
> #autoballoon="auto"
> 
> # full path of the lockfile used by xl during domain creation
> #lockfile="/var/lock/xl"
> 
> # default output format used by "xl list -l"
> #output_format="json"
> 
> # first block device to be used for temporary VM disk mounts
> #blkdev_start="xvda"
> 
> # default option to run hotplug scripts from xl
> # if disabled the old behaviour will be used, and hotplug scripts will be
> # launched by udev.
> #run_hotplug_scripts=1
> 
> # default backend domain to connect guest vifs to.  This can be any
> # valid domain identifier.
> #vif.default.backend="0"
> 
> # default gateway device to use with vif-route hotplug script
> #vif.default.gatewaydev="eth0"
> 
> # default vif script to use if none is specified in the guest config
> #vif.default.script="vif-bridge"
> 
> # default bridge device to use with vif-bridge hotplug scripts
> #vif.default.bridge="xenbr0"
> 
> # Reserve a claim of memory when launching a guest. This guarantees immediate
> # feedback whether the guest can be launched due to memory exhaustion
> # (which can take a long time to find out if launching huge guests).
> # see xl.conf(5) for details.
> #claim_mode=1
> 
> # Specify global vcpu hard affinity masks. See xl.conf(5) for details.
> #vm.cpumask="0-7"
> #vm.pv.cpumask="0-3"
> #vm.hvm.cpumask="3-7"
> 
> 
> >next are the messages during the boot time:
> 
> NOTICE:  Reset status: Power-On Reset
> NOTICE:  BL2: v2.5(release):bsp33.0-2.5-dirty
> NOTICE:  BL2: Built : 14:01:09, Jun 15 2022
> NOTICE:  BL2: Booting BL31
> 
> 
> U-Boot 2020.04+g9cdfca686e (Jun 10 2022 - 11:46:41 +0000)
> 
> CPU:   NXP S32G399A rev. 1.0
> Model: NXP S32G3XXX-EVB
> DRAM:  3.5 GiB
> MMC:   FSL_SDHC: 0
> Loading Environment from MMC... OK
> Using internal clock for PCIe0, CRNS
> Configuring PCIe0 as RootComplex(x2)
> Using internal clock for PCIe1, CRNS
> Frequency 100Mhz configured for PCIe1
> Configuring PCIe1 as SGMII [XPCS0 1G, XPCS1 OFF(PCIex1)]
> Setting PCI Device and Vendor IDs to 0x4300:0x1957
> PCIe0: Failed to get link up
> Pcie0: LINK_DBG_1: 0x00000000, LINK_DBG_2: 0x00000800 (expected 0x000000d1)
> DEBUG_R0: 0x00ed4001, DEBUG_R1: 0x08600000
> PCI: Failed autoconfig bar 1c
> PCIe1: Not configuring PCIe, PHY not configured
> In:    serial@401c8000
> Out:   serial@401c8000
> Err:   serial@401c8000
> Loading SJA1105 firmware over SPI 5:0
> No matching device ID found for devid FFFFFFFF, cs 0.
> Error SJA1105 configuration not completed
> Net:   EQOS phy: rgmii @ 4
> 
> Warning: eth_eqos (eth0) using random MAC address - f6:65:86:a2:0e:f8
> eth0: eth_eqos PFE: emac0: sgmii emac1: none emac2: none
> 
> Warning: eth_pfeng using MAC address from ROM
> , eth1: eth_pfeng
> Hit any key to stop autoboot:  0
>  PFE: emac0: sgmii emac1: none emac2: none
>  PFE: emac0: sgmii emac1: none emac2: none
> 1039 bytes read in 9 ms (112.3 KiB/s)
> ## Executing script at 80200000
> 1048688 bytes read in 36 ms (27.8 MiB/s)
> 14034952 bytes read in 201 ms (66.6 MiB/s)
> 38461 bytes read in 9 ms (4.1 MiB/s)
> ## Flattened Device Tree blob at 86600000
>    Booting using the fdt blob at 0x86600000
>    Using Device Tree in place at 0000000086600000, end 000000008660dfff
> DT: Enabling PFE
> DT: Enabling PFE_EMAC_0
> DT: pfe0 set to 00:01:be:be:ef:11
> DT: Disabling PFE_EMAC_1
> DT: Disabling PFE_EMAC_2
> 
> Starting kernel ...
> 
> - UART enabled -
> - Boot CPU booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Zero BSS -
> - Ready -
> (XEN) Checking for initrd in /chosen
> (XEN) RAM: 0000000080000000 - 00000000ffffffff
> (XEN) RAM: 0000000880000000 - 00000008dfffffff
> (XEN)
> (XEN) MODULE[0]: 0000000085600000 - 00000000857430c8 Xen
> (XEN) MODULE[1]: 0000000086600000 - 000000008660a000 Device Tree
> (XEN) MODULE[2]: 0000000085800000 - 0000000086562808 Kernel
> (XEN)  RESVD[0]: 00000000ff800000 - 00000000ff9fffff
> (XEN)  RESVD[1]: 00000000c0000000 - 00000000c03fffff
> (XEN)  RESVD[2]: 00000000c0400000 - 00000000c07fffff
> (XEN)  RESVD[3]: 00000000d0000000 - 00000000d03fffff
> (XEN)  RESVD[4]: 0000000084000000 - 000000008407ffff
> (XEN)  RESVD[5]: 0000000034000000 - 000000003407ffff
> (XEN)  RESVD[6]: 0000000034080000 - 000000003409ffff
> (XEN)  RESVD[7]: 0000000083200000 - 00000000835dffff
> (XEN)  RESVD[8]: 00000000835e0000 - 00000000835fffff
> (XEN)
> (XEN)
> (XEN) Command line: dom0_mem=512M dom0_max_vcpus=1 bootscrub=0
> (XEN) PFN compression on bits 20...22
> (XEN) Domain heap initialised
> (XEN) Booting using Device Tree
> (XEN) Platform: NXP S32-Gen1
> (XEN) No dtuart path configured
> (XEN) Bad console= option 'dtuart'
>  Xen 4.14.0
> (XEN) Xen version 4.14.0 (xen-4.14-r0@fsl-auto) (aarch64-fsl-linux-gcc (GCC) 10.                                                                                                                               2.0) debug=y  2022-05-18
> (XEN) Latest ChangeSet: Wed May 18 15:47:26 2022 +0300 git:becdd18e50-dirty
> (XEN) build-id: c93be820bfe87b5abccd95ea86e98121e1231249
> (XEN) Processor: 410fd034: "ARM Limited", variant: 0x0, part 0xd03, rev 0x4
> (XEN) 64-bit Execution:
> (XEN)   Processor Features: 0000000001002222 0000000000000000
> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> (XEN)     Extensions: FloatingPoint AdvancedSIMD GICv3-SysReg
> (XEN)   Debug Features: 0000000010305106 0000000000000000
> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> (XEN)   Memory Model Features: 0000000000001122 0000000000000000
> (XEN)   ISA Features:  0000000000011120 0000000000000000
> (XEN) 32-bit Execution:
> (XEN)   Processor Features: 00000131:10011011
> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> (XEN)     Extensions: GenericTimer Security
> (XEN)   Debug Features: 03010066
> (XEN)   Auxiliary Features: 00000000
> (XEN)   Memory Model Features: 10201105 40000000 01260000 02102211
> (XEN)  ISA Features: 02101110 13112111 21232042 01112131 00011142 00011121
> (XEN) Using SMC Calling Convention v1.2
> (XEN) Using PSCI v1.1
> (XEN) SMP: Allowing 8 CPUs
> (XEN) enabled workaround for: ARM erratum 1530924
> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 5000 KHz
> (XEN) GICv3 initialization:
> (XEN)       gic_dist_addr=0x00000050800000
> (XEN)       gic_maintenance_irq=25
> (XEN)       gic_rdist_stride=0
> (XEN)       gic_rdist_regions=1
> (XEN)       redistributor regions:
> (XEN)         - region 0: 0x00000050900000 - 0x00000050b00000
> (XEN) GICv3 compatible with GICv2 cbase 0x00000050400000 vbase 0x00000050420000
> (XEN) GICv3: 576 lines, (IID 0001143b).
> (XEN) GICv3: CPU0: Found redistributor in region 0 @000000004001a000
> (XEN) XSM Framework v1.0.0 initialized
> (XEN) Initialising XSM SILO mode
> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Initializing Credit2 scheduler
> (XEN)  load_precision_shift: 18
> (XEN)  load_window_shift: 30
> (XEN)  underload_balance_tolerance: 0
> (XEN)  overload_balance_tolerance: -3
> (XEN)  runqueues arrangement: socket
> (XEN)  cap enforcement granularity: 10ms
> (XEN) load tracking window length 1073741824 ns
> (XEN) Allocated console ring of 64 KiB.
> (XEN) CPU0: Guest atomics will try 13 times before pausing the domain
> (XEN) Bringing up CPU1
> - CPU 00000001 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU1: Found redistributor in region 0 @000000004003a000
> (XEN) CPU1: Guest atomics will try 15 times before pausing the domain
> (XEN) CPU 1 booted.
> (XEN) Bringing up CPU2
> - CPU 00000100 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU2: Found redistributor in region 0 @000000004009a000
> (XEN) CPU2: Guest atomics will try 15 times before pausing the domain
> (XEN) CPU 2 booted.
> (XEN) Bringing up CPU3
> - CPU 00000101 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU3: Found redistributor in region 0 @00000000400ba000
> (XEN) CPU3: Guest atomics will try 15 times before pausing the domain
> (XEN) CPU 3 booted.
> (XEN) Bringing up CPU4
> - CPU 00000002 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU4: Found redistributor in region 0 @000000004005a000
> (XEN) CPU4: Guest atomics will try 14 times before pausing the domain
> (XEN) CPU 4 booted.
> (XEN) Bringing up CPU5
> - CPU 00000003 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU5: Found redistributor in region 0 @000000004007a000
> (XEN) CPU5: Guest atomics will try 15 times before pausing the domain
> (XEN) CPU 5 booted.
> (XEN) Bringing up CPU6
> - CPU 00000102 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU6: Found redistributor in region 0 @00000000400da000
> (XEN) CPU6: Guest atomics will try 16 times before pausing the domain
> (XEN) CPU 6 booted.
> (XEN) Bringing up CPU7
> - CPU 00000103 booting -
> - Current EL 00000008 -
> - Initialize CPU -
> - Turning on paging -
> - Ready -
> (XEN) GICv3: CPU7: Found redistributor in region 0 @00000000400fa000
> (XEN) CPU7: Guest atomics will try 15 times before pausing the domain
> (XEN) CPU 7 booted.
> (XEN) Brought up 8 CPUs
> (XEN) I/O virtualisation disabled
> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> (XEN) P2M: 3 levels with order-1 root, VTCR 0x80023558
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Adding cpu 0 to runqueue 0
> (XEN)  First cpu on runqueue, activating
> (XEN) Adding cpu 1 to runqueue 0
> (XEN) Adding cpu 2 to runqueue 0
> (XEN) Adding cpu 3 to runqueue 0
> (XEN) Adding cpu 4 to runqueue 0
> (XEN) Adding cpu 5 to runqueue 0
> (XEN) Adding cpu 6 to runqueue 0
> (XEN) Adding cpu 7 to runqueue 0
> (XEN) alternatives: Patching with alt table 00000000002d4308 -> 00000000002d4b3c
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000085800000
> (XEN) Allocating 1:1 mappings totalling 512MB for dom0:
> (XEN) BANK[0] 0x000000a0000000-0x000000c0000000 (512MB)
> (XEN) Grant table range: 0x00000085600000-0x00000085640000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Loading zImage from 0000000085800000 to 00000000a0000000-00000000a0d62808
> (XEN) Loading d0 DTB to 0x00000000a8000000-0x00000000a800947a
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) Freed 352kB init memory.
> (XEN) d0v0: vGICD: RAZ on reserved register offset 0x00000c
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER24
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER28
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER32
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER36
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER40
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER44
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER48
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER52
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER56
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER60
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER64
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER68
> (XEN) d0v0: vGICR: SGI: unhandled word write 0x000000ffffffff to ICACTIVER0
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.10.109-rt65+g0bace7fde5f5 (oe-user@oe-host) (aarc                                                                                                                               h64-fsl-linux-gcc (GCC) 10.2.0, GNU ld (GNU Binutils) 2.35.1) #1 SMP PREEMPT Fri                                                                                                                                Jun 24 15:01:08 UTC 2022
> [    0.000000] Machine model: NXP S32G3XXX-EVB3
> [    0.000000] Xen 4.14 support found
> [    0.000000] Reserved memory: created DMA memory pool at 0x0000000083200000, s                                                                                                                               ize 3 MiB
> [    0.000000] OF: reserved mem: initialized node pfebufs@83200000, compatible i                                                                                                                               d shared-dma-pool
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000034000000-0x00000000ff9fffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000034000000-0x000000003409ffff]
> [    0.000000]   node   0: [mem 0x0000000083200000-0x00000000835dffff]
> [    0.000000]   node   0: [mem 0x00000000835e0000-0x00000000835fffff]
> [    0.000000]   node   0: [mem 0x0000000084000000-0x000000008407ffff]
> [    0.000000]   node   0: [mem 0x00000000a0000000-0x00000000bfffffff]
> [    0.000000]   node   0: [mem 0x00000000c0000000-0x00000000c07fffff]
> [    0.000000]   node   0: [mem 0x00000000d0000000-0x00000000d03fffff]
> [    0.000000]   node   0: [mem 0x00000000ff800000-0x00000000ff9fffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000034000000-0x00000000ff9fffff]
> [    0.000000] cma: Reserved 256 MiB at 0x00000000ad000000
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] percpu: Embedded 17 pages/cpu s32024 r8192 d29416 u69632
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: detected: ARM erratum 845719
> [    0.000000] CPU features: detected: GIC system register CPU interface
> [    0.000000] CPU features: detected: ARM errata 1165522, 1319367, 1530923, or                                                                                                                                1530924
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 134109
> [    0.000000] Kernel command line: console=ttyLF0,115200 earlycon=xen earlyprin                                                                                                                               tk=xen root=/dev/mmcblk0p2 rw clk_ignore_unused
> [    0.000000] Dentry cache hash table entries: 131072 (order: 8, 1048576 bytes,                                                                                                                                linear)
> [    0.000000] Inode-cache hash table entries: 65536 (order: 7, 524288 bytes, li                                                                                                                               near)
> [    0.000000] mem auto-init: stack:off, heap alloc:off, heap free:off
> [    0.000000] Memory: 202252K/543872K available (8766K kernel code, 650K rwdata                                                                                                                               , 2880K rodata, 1344K init, 245K bss, 79476K reserved, 262144K cma-reserved)
> [    0.000000] rcu: Preemptible hierarchical RCU implementation.
> [    0.000000] rcu:     RCU event tracing is enabled.
> [    0.000000] rcu:     RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=1.
> [    0.000000]  Trampoline variant of Tasks RCU enabled.
> [    0.000000]  Tracing variant of Tasks RCU enabled.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jif                                                                                                                               fies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=1
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] GICv3: 544 SPIs implemented
> [    0.000000] GICv3: 0 Extended SPIs implemented
> [    0.000000] GICv3: Distributor has no Range Selector support
> [    0.000000] GICv3: 16 PPIs implemented
> [    0.000000] GICv3: CPU0: found redistributor 0 region 0:0x0000000050900000
> [    0.000000] random: get_random_bytes called from start_kernel+0x31c/0x4ec wit                                                                                                                               h crng_init=0
> [    0.000000] arch_timer: cp15 timer(s) running at 5.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles:                                                                                                                                0x127350b88, max_idle_ns: 440795202120 ns
> [    0.000001] sched_clock: 56 bits at 5MHz, resolution 200ns, wraps every 43980                                                                                                                               46511100ns
> [    0.000357] Console: colour dummy device 80x25
> [    0.000385] Calibrating delay loop (skipped), value calculated using timer fr                                                                                                                               equency.. 10.00 BogoMIPS (lpj=20000)
> [    0.000395] pid_max: default: 32768 minimum: 301
> [    0.000489] Mount-cache hash table entries: 2048 (order: 2, 16384 bytes, line                                                                                                                               ar)
> [    0.000500] Mountpoint-cache hash table entries: 2048 (order: 2, 16384 bytes,                                                                                                                                linear)
> [    0.001943] xen:grant_table: Grant tables using version 1 layout
> [    0.001964] Grant table initialized
> [    0.001994] xen:events: Using FIFO-based ABI
> [    0.002023] Xen: initializing cpu0
> [    0.002127] rcu: Hierarchical SRCU implementation.
> [    0.002412] smp: Bringing up secondary CPUs ...
> [    0.002415] smp: Brought up 1 node, 1 CPU
> [    0.002419] SMP: Total of 1 processors activated.
> [    0.002427] CPU features: detected: 32-bit EL0 Support
> [    0.002433] CPU features: detected: CRC32 instructions
> [    0.009718] CPU: All CPU(s) started at EL1
> [    0.009731] alternatives: patching kernel code
> [    0.010183] devtmpfs: initialized
> [    0.014415] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, ma                                                                                                                               x_idle_ns: 7645041785100000 ns
> [    0.014429] futex hash table entries: 256 (order: 2, 16384 bytes, linear)
> [    0.020426] pinctrl core: initialized pinctrl subsystem
> [    0.020983] NET: Registered protocol family 16
> [    0.022141] DMA: preallocated 128 KiB GFP_KERNEL pool for atomic allocations
> [    0.022218] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA pool for atomic allo                                                                                                                               cations
> [    0.022309] DMA: preallocated 128 KiB GFP_KERNEL|GFP_DMA32 pool for atomic al                                                                                                                               locations
> [    0.022851] thermal_sys: Registered thermal governor 'step_wise'
> [    0.023110] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.023153] ASID allocator initialised with 65536 entries
> [    0.023218] xen:swiotlb_xen: Warning: only able to allocate 4 MB for software                                                                                                                                IO TLB
> [    0.023933] software IO TLB: mapped [mem 0x00000000a1800000-0x00000000a1c0000                                                                                                                               0] (4MB)
> [    0.023998] Serial: AMBA PL011 UART driver
> [    0.024571] arm-scmi firmware:scmi: SCMI Notifications - Core Enabled.
> [    0.024649] arm-scmi firmware:scmi: No. of Protocol > MAX_PROTOCOLS_IMP
> [    0.024654] arm-scmi firmware:scmi: SCMI Protocol v2.0 'NXP:S32G399A' Firmwar                                                                                                                               e version 0x0
> [    0.039850] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.039858] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
> [    0.039862] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.039866] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
> [    0.043412] scmi-clocks scmi_dev.1: failed to register clock 87
> [    0.043421] scmi-clocks scmi_dev.1: failed to register clock 88
> [    0.043428] scmi-clocks scmi_dev.1: failed to register clock 89
> [    0.043434] scmi-clocks scmi_dev.1: failed to register clock 90
> [    0.043507] scmi-clocks scmi_dev.1: failed to register clock 95
> [    0.043514] scmi-clocks scmi_dev.1: failed to register clock 96
> [    0.043520] scmi-clocks scmi_dev.1: failed to register clock 97
> [    0.043526] scmi-clocks scmi_dev.1: failed to register clock 98
> [    0.046871] xen:balloon: Initialising balloon driver
> [    0.047230] vgaarb: loaded
> [    0.047367] SCSI subsystem initialized
> [    0.047494] usbcore: registered new interface driver usbfs
> [    0.047521] usbcore: registered new interface driver hub
> [    0.047541] usbcore: registered new device driver usb
> [    0.047818] pps_core: LinuxPPS API ver. 1 registered
> [    0.047821] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giome                                                                                                                               tti <giometti@linux.it>
> [    0.047831] PTP clock support registered
> [    0.048664] clocksource: Switched to clocksource arch_sys_counter
> [    0.053083] NET: Registered protocol family 2
> [    0.053173] IP idents hash table entries: 16384 (order: 5, 131072 bytes, line                                                                                                                               ar)
> [    0.053762] tcp_listen_portaddr_hash hash table entries: 512 (order: 1, 8192                                                                                                                                bytes, linear)
> [    0.053787] TCP established hash table entries: 8192 (order: 4, 65536 bytes,                                                                                                                                linear)
> [    0.053847] TCP bind hash table entries: 8192 (order: 5, 131072 bytes, linear                                                                                                                               )
> [    0.053970] TCP: Hash tables configured (established 8192 bind 8192)
> [    0.054028] UDP hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.054052] UDP-Lite hash table entries: 512 (order: 2, 16384 bytes, linear)
> [    0.054147] NET: Registered protocol family 1
> [    0.054435] RPC: Registered named UNIX socket transport module.
> [    0.054439] RPC: Registered udp transport module.
> [    0.054441] RPC: Registered tcp transport module.
> [    0.054443] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    0.054451] PCI: CLS 0 bytes, default 64
> [    0.055375] workingset: timestamp_bits=62 max_order=17 bucket_order=0
> [    0.055858] fuse: init (API version 7.32)
> [    0.055965] NET: Registered protocol family 38
> [    0.055988] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 2                                                                                                                               48)
> [    0.055993] io scheduler mq-deadline registered
> [    0.055997] io scheduler kyber registered
> [    0.057025] s32g-siul2-pinctrl 4009c240.siul2-pinctrl: initialized s32 pinctr                                                                                                                               l driver
> [    0.057965] gpio-339 (llcecan0-en): hogged as output/high
> [    0.057983] gpio-340 (llcecan0-stby): hogged as output/high
> [    0.057998] gpio-342 (llcecan4-en): hogged as output/high
> [    0.058014] gpio-343 (llcecan4-stby): hogged as output/high
> [    0.058029] gpio-345 (llcecan5-en): hogged as output/high
> [    0.058044] gpio-346 (llcecan5-stby): hogged as output/high
> [    0.058058] gpio-351 (llcecan6-en): hogged as output/high
> [    0.058072] gpio-352 (llcecan6-stby): hogged as output/high
> [    0.058089] gpio-353 (llcecan12-stby): hogged as output/high
> [    0.058103] gpio-358 (llcecan12-en): hogged as output/high
> [    0.058120] gpio-360 (llcecan13-en): hogged as output/high
> [    0.058135] gpio-361 (llcecan13-stby): hogged as output/high
> [    0.058151] gpio-382 (llcecan15-en): hogged as output/high
> [    0.058165] gpio-383 (llcecan15-stby): hogged as output/high
> [    0.059358] xen:xen_evtchn: Event-channel device installed
> [    0.060467] serial: Freescale linflex driver
> [    0.060686] 401c8000.serial: ttyLF0 at MMIO 0x401c8000 (irq = 25, base_baud =                                                                                                                                7812500) is a FSL_LINFLEX
> [    0.060735] printk: console [ttyLF0] enabled
> [    0.061072] 401cc000.serial: ttyLF1 at MMIO 0x401cc000 (irq = 26, base_baud =                                                                                                                                7812500) is a FSL_LINFLEX
> [    0.061385] 402bc000.serial: ttyLF2 at MMIO 0x402bc000 (irq = 44, base_baud =                                                                                                                                7812500) is a FSL_LINFLEX
> [    0.061832] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    0.061846] Invalid max_queues (4), will use default max: 1.
> [    0.062193] fsl_fccu 4030c000.fccu: FCCU status is 0 (normal)
> [    0.063813] spi-nor spi0.0: mt35xu02g (262144 Kbytes)
> [    0.065365] vcan: Virtual CAN interface driver
> [    0.065370] slcan: serial line CAN interface driver
> [    0.065372] slcan: 10 dynamic interface channels.
> [    0.065377] CAN device driver interface
> [    0.065555] e100: Intel(R) PRO/100 Network Driver
> [    0.065558] e100: Copyright(c) 1999-2006 Intel Corporation
> [    0.065585] e1000: Intel(R) PRO/1000 Network Driver
> [    0.065588] e1000: Copyright (c) 1999-2006 Intel Corporation.
> [    0.065615] e1000e: Intel(R) PRO/1000 Network Driver
> [    0.065616] e1000e: Copyright(c) 1999 - 2015 Intel Corporation.
> [    0.065642] igb: Intel(R) Gigabit Ethernet Network Driver
> [    0.065645] igb: Copyright (c) 2007-2014 Intel Corporation.
> [    0.065920] xen_netfront: Initialising Xen virtual ethernet driver
> [    0.066016] hse-uio 40211000.mu1b: firmware not found
> [    0.066208] ehci_hcd: USB 2.0 'Enhanced' Host Controller (EHCI) Driver
> [    0.066213] ehci-pci: EHCI PCI platform driver
> [    0.066318] usbcore: registered new interface driver uas
> [    0.066346] usbcore: registered new interface driver usb-storage
> [    0.067503] s32gen1-rtc 40060000.rtc: registered as rtc0
> [    0.067533] s32gen1-rtc 40060000.rtc: setting system clock to 1970-01-01T00:0                                                                                                                               0:00 UTC (0)
> [    0.067665] i2c /dev entries driver
> [    0.068026] sac58r-wdt 4010c000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.068204] sac58r-wdt 40200000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.068371] sac58r-wdt 40204000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.068538] sac58r-wdt 40208000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.068776] sac58r-wdt 40500000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.068950] sac58r-wdt 40504000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.069112] sac58r-wdt 40508000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.069279] sac58r-wdt 4050c000.swt: SAC58R/S32GEN1 Watchdog Timer Registered                                                                                                                               . timeout=30s (nowayout=0)
> [    0.069492] sdhci: Secure Digital Host Controller Interface driver
> [    0.069495] sdhci: Copyright(c) Pierre Ossman
> [    0.069497] sdhci-pltfm: SDHCI platform and OF driver helper
> [    0.069837] mmc0: CQHCI version 5.10
> [    0.070452] hse 40210000.mu0b: firmware not found
> [    0.070658] usbcore: registered new interface driver usbhid
> [    0.070662] usbhid: USB HID core driver
> [    0.082993] s32-adc 401f8000.adc: Device initialized successfully.
> [    0.094947] s32-adc 402e8000.adc: Device initialized successfully.
> [    0.095109] nxp_s32_ddr_perf 403e0000.ddr-perf: probing device
> [    0.095353] nxp_s32_ddr_perf 403e0000.ddr-perf: device initialized successful                                                                                                                               ly
> [    0.095430] s32-siul2-nvmem 4009c000.nvram: initialize s32 siul2 nvmem driver
> [    0.095550] s32-siul2-nvmem 44010000.nvram: initialize s32 siul2 nvmem driver
> [    0.095949] NET: Registered protocol family 10
> [    0.096436] Segment Routing with IPv6
> [    0.096476] sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
> [    0.096852] NET: Registered protocol family 17
> [    0.096947] can: controller area network core
> [    0.096980] NET: Registered protocol family 29
> [    0.096984] can: raw protocol
> [    0.096989] can: broadcast manager protocol
> [    0.096996] can: netlink gateway - max_hops=1
> [    0.097014] 8021q: 802.1Q VLAN Support v1.8
> [    0.097149] printk: console [ttyLF0]: printing thread started
> [    0.100703] mmc0: SDHCI controller on 402f0000.usdhc [402f0000.usdhc] using A                                                                                                                               DMA
> [    0.108674] phy-s32gen1-serdes 40480000.serdes: Using mode 0 for SerDes subsy                                                                                                                               stem
> [    0.109020] phy-s32gen1-serdes 44180000.serdes: Using mode 3 for SerDes subsy                                                                                                                               stem
> [    0.115131] phy-s32gen1-serdes 44180000.serdes: Unstable RX detected on XPCS1
> [    0.115158] phy-s32gen1-serdes 44180000.serdes: Unstable RX detected on XPCS0
> [    0.115337] s32gen1-pcie 40400000.pcie: Configured as RootComplex
> [    0.115627] s32gen1-pcie 40400000.pcie: Setting PCI Device and Vendor IDs to                                                                                                                                0x4300:0x1957
> [    0.116614] s32gen1-pcie 40400000.pcie: Allocated line 0 for interrupt 52 (ms                                                                                                                               i)
> [    0.383316] mmc0: Command Queue Engine enabled
> [    0.383326] mmc0: new DDR MMC card at address 0001
> [    0.391409] mmcblk0: mmc0:0001 G1M15M 59.3 GiB
> [    0.391539] mmcblk0boot0: mmc0:0001 G1M15M partition 1 31.5 MiB
> [    0.391661] mmcblk0boot1: mmc0:0001 G1M15M partition 2 31.5 MiB
> [    0.391804] mmcblk0rpmb: mmc0:0001 G1M15M partition 3 4.00 MiB, chardev (243:                                                                                                                               0)
> [    0.399208]  mmcblk0: p1 p2 p3
> [    1.136116] s32gen1-pcie 40400000.pcie: Failed to stabilize PHY link
> [    1.136123] s32gen1-pcie 40400000.pcie: Configuring as RootComplex
> [    1.136136] s32gen1-pcie 40400000.pcie: host bridge /soc/pcie@40400000 ranges                                                                                                                               :
> [    1.136177] s32gen1-pcie 40400000.pcie:       IO 0x5ffffe0000..0x5ffffeffff -                                                                                                                               > 0x0000000000
> [    1.136195] s32gen1-pcie 40400000.pcie:      MEM 0x5800000000..0x5ffffdffff -                                                                                                                               > 0x0000000000
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=25: not implemented
> [    2.142041] s32gen1-pcie 40400000.pcie: Phy link never came up
> (XEN) physdev.c:16:d0v0 PHYSDEVOP cmd=15: not implemented
> [    2.142133] s32gen1-pcie 40400000.pcie: PCI host bridge to bus 0000:00
> [    2.142139] pci_bus 0000:00: root bus resource [bus 00-ff]
> [    2.142147] pci_bus 0000:00: root bus resource [io  0x0000-0xffff]
> [    2.142153] pci_bus 0000:00: root bus resource [mem 0x5800000000-0x5ffffdffff                                                                                                                               ] (bus address [0x00000000-0x7fffdffff])
> [    2.142201] pci 0000:00:00.0: [16c3:4300] type 01 class 0x060400
> [    2.142224] pci 0000:00:00.0: reg 0x10: [mem 0x5800000000-0x58000fffff]
> [    2.142242] pci 0000:00:00.0: reg 0x38: [mem 0x5800000000-0x580000ffff pref]
> [    2.142339] pci 0000:00:00.0: supports D1
> [    2.142344] pci 0000:00:00.0: PME# supported from D0 D1 D3hot D3cold
> [    2.165526] pci 0000:00:00.0: Failed to add - passthrough or MSI/MSI-X might                                                                                                                                fail!
> [    2.168521] pci 0000:00:00.0: BAR 0: assigned [mem 0x5800000000-0x58000fffff]
> [    2.168532] pci 0000:00:00.0: BAR 6: assigned [mem 0x5800100000-0x580010ffff                                                                                                                                pref]
> [    2.168541] pci 0000:00:00.0: PCI bridge to [bus 01-ff]
> [    2.168839] pcieport 0000:00:00.0: PME: Signaling with IRQ 67
> [    2.175158] clk: Not disabling unused clocks
> [    2.270457] random: fast init done
> [    2.282422] EXT4-fs (mmcblk0p2): recovery complete
> [    2.283171] EXT4-fs (mmcblk0p2): mounted filesystem with ordered data mode. O                                                                                                                               pts: (null)
> [    2.283229] VFS: Mounted root (ext4 filesystem) on device 179:2.
> [    2.283571] devtmpfs: mounted
> [    2.284179] Freeing unused kernel memory: 1344K
> [    2.284312] Run /sbin/init as init process
> [    2.413488] systemd[1]: System time before build time, advancing clock.
> [    2.441298] systemd[1]: systemd 246 running in system mode. (+PAM -AUDIT -SEL                                                                                                                               INUX +IMA -APPARMOR -SMACK +SYSVINIT +UTMP -LIBCRYPTSETUP -GCRYPT -GNUTLS +ACL +                                                                                                                               XZ -LZ4 -ZSTD -SECCOMP +BLKID -ELFUTILS +KMOD -IDN2 -IDN -PCRE2 default-hierarch                                                                                                                               y=hybrid)
> 
> W[    2.442307] systemd[1]: Detected architecture arm64.
> elcome to Auto Linux BSP 33.0 (gatesgarth)!
> 
> [    2.484975] systemd[1]: Set hostname to <s32g399aevb3>.
> [    2.577683] systemd-sysv-generator[76]: SysV service '/etc/init.d/netperf' la                                                                                                                               cks a native systemd unit file. Automatically generating a unit file for compati                                                                                                                               bility. Please update package to include a native systemd unit file, in order to                                                                                                                                make it more safe and robust.
> [    2.766744] systemd[1]: /lib/systemd/system/xen-qemu-dom0-disk-backend.servic                                                                                                                               e:11: PIDFile= references a path below legacy directory /var/run/, updating /var                                                                                                                               /run/xen/qemu-dom0.pid → /run/xen/qemu-dom0.pid; please update the unit file acc                                                                                                                               ordingly.
> [  OK  [    2.849603] systemd[1]: Queued start job for default target Multi-User                                                                                                                                System.
>  random: systemd: uninitialized urandom read (16 bytes read)
> [[    2.851615] systemd[1]: Created slice system-getty.slice.
> 0m] Created slice system-getty.slice.
> [  OK  ] Created slice sy[    2.884743] random: systemd: uninitialized urandom r                                                                                                                               ead (16 bytes read)
> s[    2.885064] systemd[1]: Created slice system-modprobe.slice.
> tem-modprobe.slice.
> [  OK  ] Created slice sys[    2.912705] random: systemd: uninitialized urandom                                                                                                                                read (16 bytes read)
> t[    2.913002] systemd[1]: Created slice system-serial\x2dgetty.slice.
> em-serial\x2dgetty.slice.
> [  OK  ] Created slice Use[    2.940962] systemd[1]: Created slice User and Sess                                                                                                                               ion Slice.
> r and Session Slice.
> [  OK  ] Started Dispatch P[    2.960876] systemd[1]: Started Dispatch Password                                                                                                                                Requests to Console Directory Watch.
> assword …ts to Console Directory Watch.
> [  OK  ] Started Forward Pas[    2.988824] systemd[1]: Started Forward Password                                                                                                                                Requests to Wall Directory Watch.
> sword R…uests to Wall Directory Watch.
> [  OK  ] Reached target Path[    3.012877] systemd[1]: Reached target Paths.
> s.
> [  OK  ] Reached target Remot[    3.032754] systemd[1]: Reached target Remote Fi                                                                                                                               le Systems.
> e File Systems.
> [  OK  ] Reached target Slice[    3.052744] systemd[1]: Reached target Slices.
> s.
> [  OK  ] Reached target Swap systemd[1]: Reached target Swap.
> [0m.
> [  OK   systemd[1]: Listening on RPCbind Server Activation Socket.
> [0m] Listening on RPCbind Server Activation Socket.
> [  OK  ] Reached target RPC [    3.124844] systemd[1]: Reached target RPC Port M                                                                                                                               apper.
> Port Mapper.
> [  OK  ] Listening on Sy[    3.145153] systemd[1]: Listening on Syslog Socket.
> slog Socket.
> [  OK  ] Listening on initc[    3.164886] systemd[1]: Listening on initctl Compa                                                                                                                               tibility Named Pipe.
> tl Compatibility Named Pipe.
> [  OK      3.191035] systemd[1]: Condition check resulted in Journal Audit Socke                                                                                                                               t being skipped.
> m[    3.191496] systemd[1]: Listening on Journal Socket (/dev/log).
> ] Listening on Journal Socket (/dev/log).
> [  OK  ] Listening on Jou[    3.221106] systemd[1]: Listening on Journal Socket.
> rnal Socket.
> [  OK  ] Listening on Ne[    3.241190] systemd[1]: Listening on Network Service                                                                                                                                Netlink Socket.
> twork Service Netlink Socket.
> [  OK  ] Listening on ude[    3.265051] systemd[1]: Listening on udev Control So                                                                                                                               cket.
> v Control Socket.
> [  OK  ] Listening on udev [    3.284919] systemd[1]: Listening on udev Kernel S                                                                                                                               ocket.
> Kernel Socket.
> [  OK  ] Listening on User [    3.304936] systemd[1]: Listening on User Database                                                                                                                                Manager Socket.
> Database Manager Socket.
>          Mounting H[    3.330591] systemd[1]: Mounting Huge Pages File System...
> uge Pages File System...
>          Mounting     3.353156] systemd[1]: Condition check resulted in POSIX Me                                                                                                                               ssage Queue File System being skipped.
> ;39mMount /proc/xen files...
>       [    3.354954] systemd[1]: Mounting Mount /proc/xen files...
>  [    3.370933] systemd[1]: Mounting Kernel Debug File System...
>   Mounting Kernel Debug File System...
>          Starti[    3.401191] systemd[1]: Condition check resulted in Kernel Tra                                                                                                                               ce File System being skipped.
> ng Load Kernel Module con[    3.401679] systemd[1]: Condition check resulted in                                                                                                                                Create list of static device nodes for the current kernel being skipped.
> fi[    3.403642] systemd[1]: Starting Load Kernel Module configfs...
> gfs...
>          Starting     3.446771] systemd[1]: Starting Load Kernel Module drm...
> 9mLoad Kernel Module drm...
>          Starting     3.470771] systemd[1]: Starting Load Kernel Module fuse...
> 9mLoad Kernel Module fuse...
>          Starting     3.494788] systemd[1]: Starting RPC Bind...
> 9mRPC Bind...
>      [    3.513000] systemd[1]: Condition check resulted in File System Check on                                                                                                                                Root Device being skipped.
>     Starting Jour[    3.516455] systemd[1]: Starting Journal Service...
> nal Service...
>          [    3.548101] systemd[1]: Starting Load Kernel Modules...
> Starting Load Kernel Modules...
>          Starting     3.570819] systemd[1]: Starting Remount Root and Kernel Fil                                                                                                                               e Systems...
> 9mRemount Root and Kernel File Systems...
>      [    3.595018] systemd[1]: Starting Coldplug All udev Devices...
>     Starting Coldplug All udev Devices...
> [    3.632457] llce_core 43ff8000.llce: Successfully loaded LLCE firmware
> [    3.639641] systemd[1]: Started RPC Bind.
> 32m  OK  ] Started RPC Bind.
> [    3.651233] EXT4-fs (mmcblk0p2): re-mounted. Opts: (null)
> [    3.706544] systemd[1]: Mounted Huge Pages File System.
> 32m  OK  ] Mounted Huge Pages File System.
> [    3.729184] systemd[1]: Mounted Mount /proc/xen files.
> 32m  OK  ] Mounted Mount /proc/xen files.
> [  OK  ] Started Journa[    3.749158] systemd[1]: Started Journal Service.
> l Service.
> [  OK  ] Mounted Kernel Debug File System.
> [  OK  ] Finished Load Kernel Module configfs.
> [  OK  ] Finished Load Kernel Module drm.
> [    3.804694] llce_mb 43a00000.llce_mb: LLCE firmware version: GGEE_3A
> [    3.804711] llce_mb 43a00000.llce_mb: LLCE firmware: logging support disabled
> [  OK  ] Finished Load Kernel Module fuse.
> [  OK  ] Finished Remount Root and Kernel File Systems.
>          Mounting FUSE Control File System...
>          Mounting Kernel Configuration File System...
> [    3.916363] llce_can: unknown parameter 'logging' ignored
>          Starting Flush Journal to Persistent Storage...
>          Starting Create Static Device Nodes in /dev...
> [  OK  ] Mounted FUSE Control File System.
> [  OK  ] Finished Load Kernel Modules.
> [  OK  ] Mounted Kernel Configuration File System.
> [  OK  ] Finished Flush Journal to Persistent Storage.
> [  OK  ] Finished Create Static Device Nodes in /dev.
> [  OK  ] Reached target Local File Systems (Pre).
>          Mounting NFSD configuration filesystem...
>          Mounting /tmp...
>          Mounting mount xenstore file system...
>          Mounting /var/volatile...
>          Starting Apply Kernel Variables...
>          Starting Rule-based Manage…for Device Events and Files...
> [  OK  ] Finished Coldplug All udev Devices.
> [FAILED] Failed to mount NFSD configuration filesystem.
> See 'systemctl status proc-fs-nfsd.mount' for details.
> [DEPEND] Dependency failed for NFS server and services.
> [DEPEND] Dependency failed for NFS Mount Daemon.
> [  OK  ] Started Rule-based Manager for Device Events and Files.
> [  OK  ] Mounted /tmp.
> [  OK  ] Mounted mount xenstore file system.
> [  OK  ] Mounted /var/volatile.
> [  OK  ] Finished Apply Kernel Variables.
>          Mounting /var/volatile/tmp...
>          Starting Load/Save Random Seed...
> [  OK  ] Mounted /var/volatile/tmp.
> [  OK  ] Reached target Local File Systems.
>          Starting Create Volatile Files and Directories...
> [  OK  ] Finished Create Volatile Files and Directories.
> [    5.060091] pfeng: loading out-of-tree module taints kernel.
> [    5.087732] pfeng 46000000.pfe: PFEng ethernet driver loading ...
> [    5.087749] pfeng 46000000.pfe: Version: RTM 1.0.0
> [    5.087753] pfeng 46000000.pfe: Multi instance support: disabled (standalone)
> [    5.087756] pfeng 46000000.pfe: Compiled by: 10.2.0
> [    5.087783] pfeng 46000000.pfe: Cbus addr 0x46000000 size 0x1000000
> [    5.087791] pfeng 46000000.pfe: nxp,fw-class-name: s32g_pfe_class.fw
> [    5.087796] pfeng 46000000.pfe: nxp,fw-util-name: s32g_pfe_util.fw
> [    5.087848] pfeng 46000000.pfe: irq 'hif0' : 58
> [    5.087862] pfeng 46000000.pfe: irq 'hif1' : 59
> [    5.087874] pfeng 46000000.pfe: irq 'hif2' : 60
> [    5.087879] pfeng 46000000.pfe: HIF channels mask: 0x0007
> [    5.087890] pfeng 46000000.pfe: netif name: pfe0
> [    5.087896] pfeng 46000000.pfe: DT mac addr: 00:01:be:be:ef:11
> [    5.087903] pfeng 46000000.pfe: netif(pfe0) mode: std
> [    5.087908] pfeng 46000000.pfe: netif(pfe0) EMAC: 0
> [    5.087914] pfeng 46000000.pfe: netif(pfe0) HIFs: count 1 map 01
> [    5.087923] pfeng 46000000.pfe: EMAC0 interface mode: 4
> [    5.088060] pfeng 46000000.pfe: PFE port coherency enabled, mask 0x1e
> [    5.088249] pfeng 46000000.pfe: Clocks: sys=300MHz pe=600MHz
> [    5.088263] pfeng 46000000.pfe: Interface selected: EMAC0: 0x4 EMAC1: 0xfffff                                                                                                                               fff EMAC2: 0xffffffff
> [    5.120057] pfeng 46000000.pfe: PFE controller reset done
> [    5.120169] pfeng 46000000.pfe: TX clock on EMAC0 for interface sgmii install                                                                                                                               ed
> [    5.120219] pfeng 46000000.pfe: RX clock on EMAC0 for interface sgmii install                                                                                                                               ed
> [    5.120556] pfeng 46000000.pfe: assigned reserved memory node pfebufs@3400000                                                                                                                               0
>      [    5.129221] pfeng 46000000.pfe: assigned reserved memory node pfebufs@34                                                                                                                               080000
>     Starting Network Time Synchronization...
> [    5.129320] pfeng 46000000.pfe: assigned reserved memory node pfebufs@8320000                                                                                                                               0
>      [    5.129353] pfeng 46000000.pfe: assigned reserved memory node pfebufs@83                                                                                                                               5e0000
>     Starting Update UTMP about System Boot/Shutdown...
> [    5.137731] pfeng 46000000.pfe: Firmware: CLASS s32g_pfe_class.fw [39860 byte                                                                                                                               s]
> [    5.137746] pfeng 46000000.pfe: Firmware: UTIL s32g_pfe_util.fw [19940 bytes]
> 32m  OK  ] Finished Update UTMP about System Boot/Shutdown.
> [    5.137765] pfeng 46000000.pfe: PFE CBUS p0x46000000 mapped @ v0xffffffc01300                                                                                                                               0000
> [    5.137781] pfeng 46000000.pfe: HW version 0x101
> [    5.137788] pfeng 46000000.pfe: Silicon S32G3
> [    5.137795] pfeng 46000000.pfe: Fail-Stop mode disabled
> [    5.139219] pfeng 46000000.pfe: BMU1 buffer base: p0xc0000000
> [    5.139318] pfeng 46000000.pfe: BMU2 buffer base: p0x34000000 (0x80000 bytes)
> [    5.140631] pfeng 46000000.pfe: register IRQ 62 by name 'PFE BMU IRQ'
> [    5.173797] pfeng 46000000.pfe: BMU_EMPTY_INT (BMU @ p0x(____ptrval____)). Po                                                                                                                               ol ready.
> [    5.173819] pfeng 46000000.pfe: BMU_EMPTY_INT (BMU @ p0x(____ptrval____)). Po                                                                                                                               ol ready.
> [    5.173857] pfeng 46000000.pfe: Firmware .elf detected
> 32m  OK  ] Started Network Time Synchronization    5.173864] pfeng 46000000.pfe:                                                                                                                                Uploading CLASS firmware
> 0m.
> [    5.173871] pfeng 46000000.pfe: Selected FW loading OPs to load 8 PEs in para                                                                                                                               llel
> [    5.341346] pfeng 46000000.pfe: pfe_ct.h file version"e1cb376b67fa4d1de800b13                                                                                                                               2b328b42c"
> [    5.383695] pfeng 46000000.pfe: [FW VERSION] 1.3.0, Build: May 31 2022, 08:22                                                                                                                               :22 (), ID: 0x31454650
> [    5.384015] pfeng 46000000.pfe: SAFETY instance created
> 32m  OK  ] Reached target System Initialization    5.384025] pfeng 46000000.pfe:                                                                                                                                Watchdog instance created
> 0m.
> [    5.384038] pfeng 46000000.pfe: Uploading UTIL firmware
> [    5.384043] pfeng 46000000.pfe: Selected FW loading OPs to load 1 PEs in para                                                                                                                               llel
> 32m  OK  ] Started Daily Cleanup of Temporary Directories.
> [    5.396834] pfeng 46000000.pfe: pfe_ct.h file version"e1cb376b67fa4d1de800b13                                                                                                                               2b328b42c"
> [    5.410446] pfeng 46000000.pfe: VLAN ID incorrect or not set. Using default V                                                                                                                               LAN ID = 0x01.
> 32m  OK  ] Reached target System Time Set.
> [    5.410452] pfeng 46000000.pfe: VLAN stats size incorrect or not set. Using d                                                                                                                               efault VLAN stats size = 20.
> [    5.410544] pfeng 46000000.pfe: Fall-back bridge domain @ 0x20000a34 (class)
> [    5.410551] pfeng 46000000.pfe: Default bridge domain @ 0x20000a2c (class)
> [    5.416680] pfeng 46000000.pfe: Routing table created, Hash Table @ p0x340800                                                                                                                               00, Pool @ p0x34088000 (65536 bytes)
> [    5.416989] pfeng 46000000.pfe: Feature err051211_workaround: DISABLED
> 32m  OK  ] Reached target System Time Synchronized.
> [    5.418364] pfeng 46000000.pfe: MDIO bus 0 disabled: Not found in DT
> [    5.418370] pfeng 46000000.pfe: MDIO bus 1 disabled: No EMAC
> [    5.418374] pfeng 46000000.pfe: MDIO bus 2 disabled: No EMAC
> 32m  OK  ] Started Daily rotation of log files.
> [    5.418705] pfeng 46000000.pfe: HIF0 enabled
> [    5.418967] pfeng 46000000.pfe: HIF1 enabled
> [    5.419229] pfeng 46000000.pfe: HIF2 enabled
> [    5.419235] pfeng 46000000.pfe: HIF3 not configured, skipped
> 32m  OK  ] Reached target Timers.
> [    5.424471] pfeng 46000000.pfe pfe0: registered
> [    5.424496] pfeng 46000000.pfe pfe0: Subscribe to HIF0
> 32m  OK  ] Listening on D-Bus System Message Bus[    5.425044] pfeng 46000000.pf                                                                                                                               e pfe0: Enable HIF0
>  Socket.
> [    5.425207] pfeng 46000000.pfe pfe0: setting MAC addr: 00:01:be:be:ef:11
>      [    5.425234] pfeng 46000000.pfe pfe0: PTP HW addend 0x80000000, max_adj c                                                                                                                               onfigured to 46566128 ppb
>     Starting sshd.socket.
> [    5.425243] pfeng 46000000.pfe: IEEE1588: Input Clock: 200000000Hz, Output: 1                                                                                                                               00000000Hz, Accuracy: 10.0ns
> [    5.431115] pfeng 46000000.pfe pfe0: Registered PTP HW clock successfully on                                                                                                                                EMAC0
> [  OK  ] Listening on sshd.socket.
> [  OK  ] Reached target Sockets.
> [  OK  ] Reached target Basic System.
> [  OK  ] Started Job spooling tools.
> [  OK  ] Started Periodic Command Scheduler.
> [  OK  ] Started D-Bus System Message Bus.
> [  OK  ] Started A minimalistic net…Pv4, rdisc and DHCPv6 support.
>          Starting IPv6 Packet Filtering Framework...
>          Starting IPv4 Packet Filtering Framework...
> [  OK  ] Started irqbalance daemon.
> [  OK  ] Started Hardware RNG Entropy Gatherer Daemon.
> [  OK  ] Started strongSwan IPsec I…IKEv2 daemon using ipsec.conf.
> [    6.625086] random: crng init done
> [    6.625101] random: 7 urandom warning(s) missed due to ratelimiting
> [  OK  ] Started System Logging Service.
>          Starting User Login Management...
>          Starting The Xen xenstore...
>          Starting OpenSSH Key Generation...
> [  OK  ] Finished Load/Save Random Seed.
> [  OK  ] Finished IPv6 Packet Filtering Framework.
> [  OK  ] Finished IPv4 Packet Filtering Framework.
> [  OK  ] Reached target Network (Pre).
>          Starting Network Service...
> [FAILED] Failed to start The Xen xenstore.

Yep, this is the problem



> See 'systemctl status xenstored.service' for details.
> [DEPEND] Dependency failed for xen-…des, JSON configuration stub).
> [DEPEND] Dependency failed for Xenc…guest consoles and hypervisor.
> [DEPEND] Dependency failed for Xend…p guests on boot and shutdown.
> [DEPEND] Dependency failed for qemu for xen dom0 disk backend.
> [  OK  ] Started Network Service.
> [  OK  ] Finished OpenSSH Key Generation.
> [  OK  ] Started User Login Management.
>          Starting Network Name Resolution...
>          Starting Xen-watchdog - run xen watchdog daemon...
> [  OK  ] Started Xen-watchdog - run xen watchdog daemon.
> [  OK  ] Started Network Name Resolution.
> [  OK  ] Reached target Network.
> [  OK  ] Reached target Host and Network Name Lookups.
> [  OK  ] Started NFS status monitor for NFSv2/3 locking..
> [  OK  ] Started Respond to IPv6 Node Information Queries.
> [  OK  ] Started Network Router Discovery Daemon.
>          Starting Permit User Sessions...
> [  OK  ] Started Xinetd A Powerful Replacement For Inetd.
> [  OK  ] Finished Permit User Sessions.
> [  OK  ] Started Getty on tty1.
> [  OK  ] Started Serial Getty on hvc0.
> [  OK  ] Started Serial Getty on ttyLF0.
> [  OK  ] Reached target Login Prompts.
> [  OK  ] Reached target Multi-User System.
>          Starting Update UTMP about System Runlevel Changes...
> [  OK  ] Finished Update UTMP about System Runlevel Changes.
> 
> 33.Auto Linux vb3 3t.LFs32g399aevb3 hvc0
> 
> 
> >Some extra information about xenstore:
> 
> root@s32g399aevb3:~# systemctl status xenstored.service
> * xenstored.service - The Xen xenstore
>      Loaded: loaded (/lib/systemd/system/xenstored.service; enabled; vendor pre>
>      Active: failed (Result: protocol) since Wed 2020-12-16 17:25:20 UTC; 6min >
>     Process: 182 ExecStartPre=/bin/grep -q control_d /proc/xen/capabilities (co>
>     Process: 186 ExecStart=/etc/xen/scripts/launch-xenstore (code=exited, statu>
>    Main PID: 186 (code=exited, status=0/SUCCESS)
> 
> Dec 16 17:25:20 s32g399aevb3 systemd[1]: Starting The Xen xenstore...
> Dec 16 17:25:20 s32g399aevb3 launch-xenstore[186]: Starting /usr/sbin/xenstored>
> Dec 16 17:25:20 s32g399aevb3 launch-xenstore[193]: FATAL: Failed to open connec>

This has been truncated, but I bet there is a missing module in your
Linux kernel build. Make sure you have all the following:

CONFIG_XEN_BALLOON=y
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=y
CONFIG_XEN_SCRUB_PAGES_DEFAULT=y
CONFIG_XEN_DEV_EVTCHN=y
CONFIG_XEN_BACKEND=y
CONFIG_XENFS=y
CONFIG_XEN_COMPAT_XENFS=y
CONFIG_XEN_SYS_HYPERVISOR=y
CONFIG_XEN_XENBUS_FRONTEND=y
CONFIG_XEN_GNTDEV=y
CONFIG_XEN_GRANT_DEV_ALLOC=y
CONFIG_XEN_GRANT_DMA_ALLOC=y
CONFIG_SWIOTLB_XEN=y
CONFIG_XEN_PRIVCMD=y


> Dec 16 17:25:20 s32g399aevb3 systemd[1]: xenstored.service: Failed with result >
> Dec 16 17:25:20 s32g399aevb3 systemd[1]: Failed to start The Xen xenstore.
> 
> 
> >Any idea of how can I fix that? Thank you so much for the support
> 
> Best regards
> Youssef El Mesdadi
> 
> 
> 
> -----Ursprüngliche Nachricht-----
> Von: Julien Grall <julien@xen.org> 
> Gesendet: Dienstag, 17. Januar 2023 15:38
> An: El Mesdadi Youssef ESK UILD7 <youssef.elmesdadi@zf.com>; xen-devel@lists.xenproject.org
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Betreff: Re: AW: Xenalyze on ARM ( NXP S32G3 with Cortex-A53)
> 
> 
> 
> On 13/01/2023 12:56, El Mesdadi Youssef ESK UILD7 wrote:
> > Hello Julien,
> 
> Hi,
> 
> >>>> xentrace should work on upstream Xen. What did you version did you try?
> > 
> > While building my image using the BSP-linux of NXP, the version that was downloaded is Xen 4.14.
> 
> Do you know where the source are downloaded from?
> 
> > 
> > 
> >>>> Can you also clarify the error you are seen?
> > 
> > The error I receive while tipping xentrace is: Command not found.
> 
> 
> "Command not found" means the program hasn't been installed.
> 
> > I assume in this Xen version, Xentrace is not compatible with ARM 
> > architecture
> The support for xentrace on Arm has been added around Xen 4.12. So it should work for Xen 4.14 (even though I don't recommend using older release).
> 
> I would suggest to check how you are building the tools and which package will be installed.
> 
> > 
> > My question is, is there any new version of Xen that supports Xentrace on ARM? If yes how could I install it? Because Xen.4.14 was installed automatically by typing this ( DISTRO_FEATURES_append += "xen") in the local.conf file while creating my image.
> 
> I am not familiar with the BSP-linux of NXP as this is not a project maintained by Xen Project.
> 
> If you need support for it, then I would suggest to discuss with NXP directly.
> 
> > 
> > Or is there any source on Xentrace that is compatible with ARM on GitHub, that I could download and compile myself?
> Even if the hypervisor is Xen, you seem to use code provided by an external entity. I can't advise on the next steps without knowing the modification that NXP made in the hypervisor.
> 
> > 
> >>>> Yes if you assign (or provide para-virtualized driver) the GPIO/LED/Can-Interface to the guest.
> > 
> > Is there any tutorial that could help me create those drivers? And how complicated is that, to create them?
> 
> I am not aware of any tutorial. Regarding the complexity, it all depends on what exactly you want to do.
> 
> > Or can they be assigned just with PCI-Passthrough?
> 
> PCI passthrough is not yet supported on Arm. That said, I was not expecting the GPIO/LED/Can-interface to be PCI devices.
> 
> If they are platform devices (i.e non-PCI devices), then you could potentially directly assign them to *one* guest (this would not work if you need to share them).
> 
> I wrote potentially because if the device is DMA-capabable, then the device must be behind an IOMMU.
> 
> Cheers,
> 
> --
> Julien Grall
> 
> 
--8323329-2097830747-1676076969=:4661--

