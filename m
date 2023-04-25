Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 868116EE77F
	for <lists+xen-devel@lfdr.de>; Tue, 25 Apr 2023 20:21:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.526296.817968 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prNHo-0002VG-Cz; Tue, 25 Apr 2023 18:21:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 526296.817968; Tue, 25 Apr 2023 18:21:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1prNHo-0002Rt-98; Tue, 25 Apr 2023 18:21:08 +0000
Received: by outflank-mailman (input) for mailman id 526296;
 Tue, 25 Apr 2023 18:21:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rxgq=AQ=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1prNHm-0002Rn-FU
 for xen-devel@lists.xenproject.org; Tue, 25 Apr 2023 18:21:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ef8fd3a4-e395-11ed-b223-6b7b168915f2;
 Tue, 25 Apr 2023 20:21:03 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E37BF616EA;
 Tue, 25 Apr 2023 18:21:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16EFBC433EF;
 Tue, 25 Apr 2023 18:20:59 +0000 (UTC)
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
X-Inumbo-ID: ef8fd3a4-e395-11ed-b223-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682446861;
	bh=57/xIHfHp3L5NdxLzTUsuOkNWdo28qc8vE0kOkFyov0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=RZUFbjMeBarEXvKy5N9wjRAlLoMHiqZMesPIasy51qZdkw/ZjLcy9V1JLE139RJQE
	 MS0jysHNDs3V/yugCtbLEOi89mcls8hb+cQ4ArTK7Kko5qLmh8xLTdX55SihjOWf20
	 MvlY1D2o2kX9DMmWLO4TzI7M18DtiJZZoOKyrfGvTWxStSYd40I54rJgA4mXV33tA3
	 4L4l+8YHAnFSLVKjXoxLYXuj+X0xL6bOMpY4fEgpP8tF9Ohn8vOd//qYxC0dUwzadw
	 PaFuM25k7eirHBDxY2TayyI/rUCpgOJ/8Jm2nXQSqFl9KOJI1h7WWDXjDzo7HGmBIy
	 CsjDagwGgHZvg==
Date: Tue, 25 Apr 2023 11:20:58 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Oleg Nikitenko <oleshiiwood@gmail.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    Michal Orzel <michal.orzel@amd.com>, Julien Grall <julien@xen.org>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Carlo Nonato <carlo.nonato@minervasys.tech>, Stewart.Hildebrand@amd.com
Subject: Re: xen cache colors in ARM
In-Reply-To: <CA+SAi2tPrvUYhkF2cmch5zowRqmpvJ6Cq0scxGHEaczhiDaJnw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2304251120530.3419@ubuntu-linux-20-04-desktop>
References: <CA+SAi2uwrKFYN1tkYJ1_LVC-f+b-xb46RWTUv6wDOUO41yx8zg@mail.gmail.com> <CA+SAi2srSq5Vwq8KL4TGc-GC3OjsFf=d-yKLVPw=C0KfBW67eA@mail.gmail.com> <58cae772-dd3b-31f4-9849-9c2597f6eae6@amd.com> <CA+SAi2vU0i9trrdgCusB0WYJmYLqjXRk9qSGALjMbKYvmPGcvw@mail.gmail.com>
 <CA+SAi2tc_3r3SAXVOmdbDJXvppaXkSdMH0iv-fG1zUwG3Ub_hQ@mail.gmail.com> <alpine.DEB.2.22.394.2304191304570.15580@ubuntu-linux-20-04-desktop> <CA+SAi2tEbV0Y=p=NhT_8H1SeBzqXxUTS5R9pZu3_UYn5zU952A@mail.gmail.com> <CA+SAi2s7jUf4ZB6WCDqEbG5jV1A5XV=bJDiGOseQBBG+Xt9_vQ@mail.gmail.com>
 <CA+SAi2uPnpwNowMWPdcbSkF=iNe9Xr5LQMtmtF-G7dKNswog_g@mail.gmail.com> <cc6380b9-b452-6492-75ab-fc0825b223d3@amd.com> <CA+SAi2upd1P=KzbQS2BpD5zr3+OA=mrq7JiC7Zou9XSEJ_OYhA@mail.gmail.com> <43f5fdaa-47c7-6ec9-c477-dac62a5bceae@amd.com>
 <CA+SAi2uBmnUA0Z=+Ji_jaoOGjS8H8ea1_aRuRm=_B89oidxHCA@mail.gmail.com> <alpine.DEB.2.22.394.2304241337280.3419@ubuntu-linux-20-04-desktop> <CA+SAi2tPrvUYhkF2cmch5zowRqmpvJ6Cq0scxGHEaczhiDaJnw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1645323024-1682446524=:3419"
Content-ID: <alpine.DEB.2.22.394.2304251115260.3419@ubuntu-linux-20-04-desktop>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1645323024-1682446524=:3419
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.22.394.2304251115261.3419@ubuntu-linux-20-04-desktop>

This is interesting. Are you using Xilinx hardware by any chance? If so,
which board?

Are you using ImageBuilder to generate your boot.scr boot script? If so,
could you please post your ImageBuilder config file? If not, can you
post the source of your uboot boot script?

SErrors are supposed to be related to a hardware failure of some kind.
You are not supposed to be able to trigger an SError easily by
"mistake". I have not seen SErrors due to wrong cache coloring
configurations on any Xilinx board before.

The differences between Xen with and without cache coloring from a
hardware perspective are:

- With cache coloring, the SMMU is enabled and does address translations
  even for dom0. Without cache coloring the SMMU could be disabled, and
  if enabled, the SMMU doesn't do any address translations for Dom0. If
  there is a hardware failure related to SMMU address translation it
  could only trigger with cache coloring. This would be my normal
  suggestion for you to explore, but the failure happens too early
  before any DMA-capable device is programmed. So I don't think this can
  be the issue.

- With cache coloring, the memory allocation is very different so you'll
  end up using different DDR regions for Dom0. So if your DDR is
  defective, you might only see a failure with cache coloring enabled
  because you end up using different regions.


On Tue, 25 Apr 2023, Oleg Nikitenko wrote:
> Hi Stefano,
> 
> Thank you.
> If I build xen without colors support there is not this error.
> All the domains are booted well.
> Hense it can not be a hardware issue.
> This panic arrived during unpacking the rootfs.
> Here I attached the boot log xen/Dom0 without color.
> A highlighted strings printed exactly after the place where 1-st time panic arrived.
> 
>  Xen 4.16.1-pre
> (XEN) Xen version 4.16.1-pre (nole2390@(none)) (aarch64-portable-linux-gcc (GCC) 11.3.0) debug=y 2023-04-21
> (XEN) Latest ChangeSet: Wed Apr 19 12:56:14 2023 +0300 git:321687b231-dirty
> (XEN) build-id: c1847258fdb1b79562fc710dda40008f96c0fde5
> (XEN) Processor: 00000000410fd034: "ARM Limited", variant: 0x0, part 0xd03,rev 0x4
> (XEN) 64-bit Execution:
> (XEN)   Processor Features: 0000000000002222 0000000000000000
> (XEN)     Exception Levels: EL3:64+32 EL2:64+32 EL1:64+32 EL0:64+32
> (XEN)     Extensions: FloatingPoint AdvancedSIMD
> (XEN)   Debug Features: 0000000010305106 0000000000000000
> (XEN)   Auxiliary Features: 0000000000000000 0000000000000000
> (XEN)   Memory Model Features: 0000000000001122 0000000000000000
> (XEN)   ISA Features:  0000000000011120 0000000000000000
> (XEN) 32-bit Execution:
> (XEN)   Processor Features: 0000000000000131:0000000000011011
> (XEN)     Instruction Sets: AArch32 A32 Thumb Thumb-2 Jazelle
> (XEN)     Extensions: GenericTimer Security
> (XEN)   Debug Features: 0000000003010066
> (XEN)   Auxiliary Features: 0000000000000000
> (XEN)   Memory Model Features: 0000000010201105 0000000040000000
> (XEN)                          0000000001260000 0000000002102211
> (XEN)   ISA Features: 0000000002101110 0000000013112111 0000000021232042
> (XEN)                 0000000001112131 0000000000011142 0000000000011121
> (XEN) Using SMC Calling Convention v1.2
> (XEN) Using PSCI v1.1
> (XEN) SMP: Allowing 4 CPUs
> (XEN) Generic Timer IRQ: phys=30 hyp=26 virt=27 Freq: 100000 KHz
> (XEN) GICv2 initialization:
> (XEN)         gic_dist_addr=00000000f9010000
> (XEN)         gic_cpu_addr=00000000f9020000
> (XEN)         gic_hyp_addr=00000000f9040000
> (XEN)         gic_vcpu_addr=00000000f9060000
> (XEN)         gic_maintenance_irq=25
> (XEN) GICv2: Adjusting CPU interface base to 0xf902f000
> (XEN) GICv2: 192 lines, 4 cpus, secure (IID 0200143b).
> (XEN) Using scheduler: null Scheduler (null)
> (XEN) Initializing null scheduler
> (XEN) WARNING: This is experimental software in development.
> (XEN) Use at your own risk.
> (XEN) Allocated console ring of 32 KiB.
> (XEN) CPU0: Guest atomics will try 12 times before pausing the domain
> (XEN) Bringing up CPU1
> (XEN) CPU1: Guest atomics will try 13 times before pausing the domain
> (XEN) CPU 1 booted.
> (XEN) Bringing up CPU2
> (XEN) CPU2: Guest atomics will try 13 times before pausing the domain
> (XEN) CPU 2 booted.
> (XEN) Bringing up CPU3
> (XEN) CPU3: Guest atomics will try 13 times before pausing the domain
> (XEN) Brought up 4 CPUs
> (XEN) CPU 3 booted.
> (XEN) smmu: /axi/smmu@fd800000: probing hardware configuration...
> (XEN) smmu: /axi/smmu@fd800000: SMMUv2 with:
> (XEN) smmu: /axi/smmu@fd800000: stage 2 translation
> (XEN) smmu: /axi/smmu@fd800000: stream matching with 48 register groups, mask 0x7fff<2>smmu: /axi/smmu@fd800000: 16 context banks (0
> stage-2 only)
> (XEN) smmu: /axi/smmu@fd800000: Stage-2: 48-bit IPA -> 48-bit PA
> (XEN) smmu: /axi/smmu@fd800000: registered 29 master devices
> (XEN) I/O virtualisation enabled
> (XEN)  - Dom0 mode: Relaxed
> (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
> (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) alternatives: Patching with alt table 00000000002cc5c8 -> 00000000002ccb2c
> (XEN) *** LOADING DOMAIN 0 ***
> (XEN) Loading d0 kernel from boot module @ 0000000001000000
> (XEN) Loading ramdisk from boot module @ 0000000002000000
> (XEN) Allocating 1:1 mappings totalling 1600MB for dom0:
> (XEN) BANK[0] 0x00000010000000-0x00000020000000 (256MB)
> (XEN) BANK[1] 0x00000024000000-0x00000028000000 (64MB)
> (XEN) BANK[2] 0x00000030000000-0x00000080000000 (1280MB)
> (XEN) Grant table range: 0x00000000e00000-0x00000000e40000
> (XEN) smmu: /axi/smmu@fd800000: d0: p2maddr 0x000000087bf94000
> (XEN) Allocating PPI 16 for event channel interrupt
> (XEN) Extended region 0: 0x81200000->0xa0000000
> (XEN) Extended region 1: 0xb1200000->0xc0000000
> (XEN) Extended region 2: 0xc8000000->0xe0000000
> (XEN) Extended region 3: 0xf0000000->0xf9000000
> (XEN) Extended region 4: 0x100000000->0x600000000
> (XEN) Extended region 5: 0x880000000->0x8000000000
> (XEN) Extended region 6: 0x8001000000->0x10000000000
> (XEN) Loading zImage from 0000000001000000 to 0000000010000000-0000000010e41008
> (XEN) Loading d0 initrd from 0000000002000000 to 0x0000000013600000-0x000000001ff3a617
> (XEN) Loading d0 DTB to 0x0000000013400000-0x000000001340cbdc
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Std. Loglevel: All
> (XEN) Guest Loglevel: All
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
> (XEN) null.c:353: 0 <-- d0v0
> (XEN) Freed 356kB init memory.
> (XEN) d0v0 Unhandled SMC/HVC: 0x84000050
> (XEN) d0v0 Unhandled SMC/HVC: 0x8600ff01
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER4
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER8
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER12
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER16
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER20
> (XEN) d0v0: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 5.15.72-xilinx-v2022.1 (oe-user@oe-host) (aarch64-portable-linux-gcc (GCC) 11.3.0, GNU ld (GNU Binutils)
> 2.38.20220708) #1 SMP Tue Feb 21 05:47:54 UTC 2023
> [    0.000000] Machine model: D14 Viper Board - White Unit
> [    0.000000] Xen 4.16 support found
> [    0.000000] Zone ranges:
> [    0.000000]   DMA      [mem 0x0000000010000000-0x000000007fffffff]
> [    0.000000]   DMA32    empty
> [    0.000000]   Normal   empty
> [    0.000000] Movable zone start for each node
> [    0.000000] Early memory node ranges
> [    0.000000]   node   0: [mem 0x0000000010000000-0x000000001fffffff]
> [    0.000000]   node   0: [mem 0x0000000022000000-0x0000000022147fff]
> [    0.000000]   node   0: [mem 0x0000000022200000-0x0000000022347fff]
> [    0.000000]   node   0: [mem 0x0000000024000000-0x0000000027ffffff]
> [    0.000000]   node   0: [mem 0x0000000030000000-0x000000007fffffff]
> [    0.000000] Initmem setup node 0 [mem 0x0000000010000000-0x000000007fffffff]
> [    0.000000] On node 0, zone DMA: 8192 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA: 184 pages in unavailable ranges
> [    0.000000] On node 0, zone DMA: 7352 pages in unavailable ranges
> [    0.000000] cma: Reserved 256 MiB at 0x000000006e000000
> [    0.000000] psci: probing for conduit method from DT.
> [    0.000000] psci: PSCIv1.1 detected in firmware.
> [    0.000000] psci: Using standard PSCI v0.2 function IDs
> [    0.000000] psci: Trusted OS migration not required
> [    0.000000] psci: SMC Calling Convention v1.1
> [    0.000000] percpu: Embedded 16 pages/cpu s32792 r0 d32744 u65536
> [    0.000000] Detected VIPT I-cache on CPU0
> [    0.000000] CPU features: kernel page table isolation forced ON by KASLR
> [    0.000000] CPU features: detected: Kernel page table isolation (KPTI)
> [    0.000000] Built 1 zonelists, mobility grouping on.  Total pages: 403845
> [    0.000000] Kernel command line: console=hvc0 earlycon=xen earlyprintk=xen clk_ignore_unused fips=1 root=/dev/ram0 maxcpus=2
> [    0.000000] Unknown kernel command line parameters "earlyprintk=xen fips=1", will be passed to user space.
> [    0.000000] Dentry cache hash table entries: 262144 (order: 9, 2097152 bytes, linear)
> [    0.000000] Inode-cache hash table entries: 131072 (order: 8, 1048576 bytes, linear)
> [    0.000000] mem auto-init: stack:off, heap alloc:on, heap free:on
> [    0.000000] mem auto-init: clearing system memory may take some time...
> [    0.000000] Memory: 1121936K/1641024K available (9728K kernel code, 836K rwdata, 2396K rodata, 1536K init, 262K bss, 256944K reserved,
> 262144K cma-reserved)
> [    0.000000] SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=2, Nodes=1
> [    0.000000] rcu: Hierarchical RCU implementation.
> [    0.000000] rcu: RCU event tracing is enabled.
> [    0.000000] rcu: RCU restricting CPUs from NR_CPUS=8 to nr_cpu_ids=2.
> [    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
> [    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=2
> [    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
> [    0.000000] Root IRQ handler: gic_handle_irq
> [    0.000000] arch_timer: cp15 timer(s) running at 100.00MHz (virt).
> [    0.000000] clocksource: arch_sys_counter: mask: 0xffffffffffffff max_cycles: 0x171024e7e0, max_idle_ns: 440795205315 ns
> [    0.000000] sched_clock: 56 bits at 100MHz, resolution 10ns, wraps every 4398046511100ns
> [    0.000258] Console: colour dummy device 80x25
> [    0.310231] printk: console [hvc0] enabled
> [    0.314403] Calibrating delay loop (skipped), value calculated using timer frequency.. 200.00 BogoMIPS (lpj=400000)
> [    0.324851] pid_max: default: 32768 minimum: 301
> [    0.329706] LSM: Security Framework initializing
> [    0.334204] Yama: becoming mindful.
> [    0.337865] Mount-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.345180] Mountpoint-cache hash table entries: 4096 (order: 3, 32768 bytes, linear)
> [    0.354743] xen:grant_table: Grant tables using version 1 layout
> [    0.359132] Grant table initialized
> [    0.362664] xen:events: Using FIFO-based ABI
> [    0.366993] Xen: initializing cpu0
> [    0.370515] rcu: Hierarchical SRCU implementation.
> [    0.375930] smp: Bringing up secondary CPUs ...
> (XEN) null.c:353: 1 <-- d0v1
> (XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
> [    0.382549] Detected VIPT I-cache on CPU1
> [    0.388712] Xen: initializing cpu1
> [    0.388743] CPU1: Booted secondary processor 0x0000000001 [0x410fd034]
> [    0.388829] smp: Brought up 1 node, 2 CPUs
> [    0.406941] SMP: Total of 2 processors activated.
> [    0.411698] CPU features: detected: 32-bit EL0 Support
> [    0.416888] CPU features: detected: CRC32 instructions
> [    0.422121] CPU: All CPU(s) started at EL1
> [    0.426248] alternatives: patching kernel code
> [    0.431424] devtmpfs: initialized
> [    0.441454] KASLR enabled
> [    0.441602] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
> [    0.448321] futex hash table entries: 512 (order: 3, 32768 bytes, linear)
> [    0.496183] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.498277] DMA: preallocated 256 KiB GFP_KERNEL pool for atomic allocations
> [    0.503772] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
> [    0.511610] DMA: preallocated 256 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
> [    0.519478] audit: initializing netlink subsys (disabled)
> [    0.524985] audit: type=2000 audit(0.336:1): state=initialized audit_enabled=0 res=1
> [    0.529169] thermal_sys: Registered thermal governor 'step_wise'
> [    0.533023] hw-breakpoint: found 6 breakpoint and 4 watchpoint registers.
> [    0.545608] ASID allocator initialised with 32768 entries
> [    0.551030] xen:swiotlb_xen: Warning: only able to allocate 4 MB for software IO TLB
> [    0.559332] software IO TLB: mapped [mem 0x0000000011800000-0x0000000011c00000] (4MB)
> [    0.583565] HugeTLB registered 1.00 GiB page size, pre-allocated 0 pages
> [    0.584721] HugeTLB registered 32.0 MiB page size, pre-allocated 0 pages
> [    0.591478] HugeTLB registered 2.00 MiB page size, pre-allocated 0 pages
> [    0.598225] HugeTLB registered 64.0 KiB page size, pre-allocated 0 pages
> [    0.636520] DRBG: Continuing without Jitter RNG
> [    0.737187] raid6: neonx8   gen()  2143 MB/s
> [    0.805294] raid6: neonx8   xor()  1589 MB/s
> [    0.873406] raid6: neonx4   gen()  2177 MB/s
> [    0.941499] raid6: neonx4   xor()  1556 MB/s
> [    1.009612] raid6: neonx2   gen()  2072 MB/s
> [    1.077715] raid6: neonx2   xor()  1430 MB/s
> [    1.145834] raid6: neonx1   gen()  1769 MB/s
> [    1.213935] raid6: neonx1   xor()  1214 MB/s
> [    1.282046] raid6: int64x8  gen()  1366 MB/s
> [    1.350132] raid6: int64x8  xor()   773 MB/s
> [    1.418259] raid6: int64x4  gen()  1602 MB/s
> [    1.486349] raid6: int64x4  xor()   851 MB/s
> [    1.554464] raid6: int64x2  gen()  1396 MB/s
> [    1.622561] raid6: int64x2  xor()   744 MB/s
> [    1.690687] raid6: int64x1  gen()  1033 MB/s
> [    1.758770] raid6: int64x1  xor()   517 MB/s
> [    1.758809] raid6: using algorithm neonx4 gen() 2177 MB/s
> [    1.762941] raid6: .... xor() 1556 MB/s, rmw enabled
> [    1.767957] raid6: using neon recovery algorithm
> [    1.772824] xen:balloon: Initialising balloon driver
> [    1.778021] iommu: Default domain type: Translated
> [    1.782584] iommu: DMA domain TLB invalidation policy: strict mode
> [    1.789149] SCSI subsystem initialized
> [    1.792820] usbcore: registered new interface driver usbfs
> [    1.798254] usbcore: registered new interface driver hub
> [    1.803626] usbcore: registered new device driver usb
> [    1.808761] pps_core: LinuxPPS API ver. 1 registered
> [    1.813716] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
> [    1.822903] PTP clock support registered
> [    1.826893] EDAC MC: Ver: 3.0.0
> [    1.830375] zynqmp-ipi-mbox mailbox@ff990400: Registered ZynqMP IPI mbox with TX/RX channels.
> [    1.838863] zynqmp-ipi-mbox mailbox@ff990600: Registered ZynqMP IPI mbox with TX/RX channels.
> [    1.847356] zynqmp-ipi-mbox mailbox@ff990800: Registered ZynqMP IPI mbox with TX/RX channels.
> [    1.855907] FPGA manager framework
> [    1.859952] clocksource: Switched to clocksource arch_sys_counter
> [    1.871712] NET: Registered PF_INET protocol family
> [    1.871838] IP idents hash table entries: 32768 (order: 6, 262144 bytes, linear)
> [    1.879392] tcp_listen_portaddr_hash hash table entries: 1024 (order: 2, 16384 bytes, linear)
> [    1.887078] Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
> [    1.894846] TCP established hash table entries: 16384 (order: 5, 131072 bytes, linear)
> [    1.902900] TCP bind hash table entries: 16384 (order: 6, 262144 bytes, linear)
> [    1.910350] TCP: Hash tables configured (established 16384 bind 16384)
> [    1.916778] UDP hash table entries: 1024 (order: 3, 32768 bytes, linear)
> [    1.923509] UDP-Lite hash table entries: 1024 (order: 3, 32768 bytes, linear)
> [    1.930759] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    1.936834] RPC: Registered named UNIX socket transport module.
> [    1.942342] RPC: Registered udp transport module.
> [    1.947088] RPC: Registered tcp transport module.
> [    1.951843] RPC: Registered tcp NFSv4.1 backchannel transport module.
> [    1.958334] PCI: CLS 0 bytes, default 64
> [    1.962709] Trying to unpack rootfs image as initramfs...
> [    1.977090] workingset: timestamp_bits=62 max_order=19 bucket_order=0
> [    1.982863] Installing knfsd (copyright (C) 1996 okir@monad.swb.de).
> [    2.021045] NET: Registered PF_ALG protocol family
> [    2.021122] xor: measuring software checksum speed
> [    2.029347]    8regs           :  2366 MB/sec
> [    2.033081]    32regs          :  2802 MB/sec
> [    2.038223]    arm64_neon      :  2320 MB/sec
> [    2.038385] xor: using function: 32regs (2802 MB/sec)
> [    2.043614] Block layer SCSI generic (bsg) driver version 0.4 loaded (major 247)
> [    2.050959] io scheduler mq-deadline registered
> [    2.055521] io scheduler kyber registered
> [    2.068227] xen:xen_evtchn: Event-channel device installed
> [    2.069281] Serial: 8250/16550 driver, 4 ports, IRQ sharing disabled
> [    2.076190] cacheinfo: Unable to detect cache hierarchy for CPU 0
> [    2.085548] brd: module loaded
> [    2.089290] loop: module loaded
> [    2.089341] Invalid max_queues (4), will use default max: 2.
> [    2.094565] tun: Universal TUN/TAP device driver, 1.6
> [    2.098655] xen_netfront: Initialising Xen virtual ethernet driver
> [    2.104156] usbcore: registered new interface driver rtl8150
> [    2.109813] usbcore: registered new interface driver r8152
> [    2.115367] usbcore: registered new interface driver asix
> [    2.120794] usbcore: registered new interface driver ax88179_178a
> [    2.126934] usbcore: registered new interface driver cdc_ether
> [    2.132816] usbcore: registered new interface driver cdc_eem
> [    2.138527] usbcore: registered new interface driver net1080
> [    2.144256] usbcore: registered new interface driver cdc_subset
> [    2.150205] usbcore: registered new interface driver zaurus
> [    2.155837] usbcore: registered new interface driver cdc_ncm
> [    2.161550] usbcore: registered new interface driver r8153_ecm
> [    2.168240] usbcore: registered new interface driver cdc_acm
> [    2.173109] cdc_acm: USB Abstract Control Model driver for USB modems and ISDN adapters
> [    2.181358] usbcore: registered new interface driver uas
> [    2.186547] usbcore: registered new interface driver usb-storage
> [    2.192643] usbcore: registered new interface driver ftdi_sio
> [    2.198384] usbserial: USB Serial support registered for FTDI USB Serial Device
> [    2.206118] udc-core: couldn't find an available UDC - added [g_mass_storage] to list of pending drivers
> [    2.215332] i2c_dev: i2c /dev entries driver
> [    2.220467] xen_wdt xen_wdt: initialized (timeout=60s, nowayout=0)
> [    2.225923] device-mapper: uevent: version 1.0.3
> [    2.230668] device-mapper: ioctl: 4.45.0-ioctl (2021-03-22) initialised: dm-devel@redhat.com
> [    2.239315] EDAC MC0: Giving out device to module 1 controller synps_ddr_controller: DEV synps_edac (INTERRUPT)
> [    2.249405] EDAC DEVICE0: Giving out device to module zynqmp-ocm-edac controller zynqmp_ocm: DEV ff960000.memory-controller (INTERRUPT)
> [    2.261719] sdhci: Secure Digital Host Controller Interface driver
> [    2.267487] sdhci: Copyright(c) Pierre Ossman
> [    2.271890] sdhci-pltfm: SDHCI platform and OF driver helper
> [    2.278157] ledtrig-cpu: registered to indicate activity on CPUs
> [    2.283816] zynqmp_firmware_probe Platform Management API v1.1
> [    2.289554] zynqmp_firmware_probe Trustzone version v1.0
> [    2.327875] securefw securefw: securefw probed
> [    2.328324] alg: No test for xilinx-zynqmp-aes (zynqmp-aes)
> [    2.332563] zynqmp_aes firmware:zynqmp-firmware:zynqmp-aes: AES Successfully Registered
> [    2.341183] alg: No test for xilinx-zynqmp-rsa (zynqmp-rsa)
> [    2.347667] remoteproc remoteproc0: ff9a0000.rf5ss:r5f_0 is available
> [    2.353003] remoteproc remoteproc1: ff9a0000.rf5ss:r5f_1 is available
> [    2.362605] fpga_manager fpga0: Xilinx ZynqMP FPGA Manager registered
> [    2.366540] viper-xen-proxy viper-xen-proxy: Viper Xen Proxy registered
> [    2.372525] viper-vdpp a4000000.vdpp: Device Tree Probing
> [    2.377778] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info: 1.512.15.0 KeyLen: 32
> [    2.386432] viper-vdpp a4000000.vdpp: Unable to register tamper handler. Retrying...
> [    2.394094] viper-vdpp-net a5000000.vdpp_net: Device Tree Probing
> [    2.399854] viper-vdpp-net a5000000.vdpp_net: Device registered
> [    2.405931] viper-vdpp-stat a8000000.vdpp_stat: Device Tree Probing
> [    2.412037] viper-vdpp-stat a8000000.vdpp_stat: Build parameters: VTI Count: 512 Event Count: 32
> [    2.420856] default preset
> [    2.423797] viper-vdpp-stat a8000000.vdpp_stat: Device registered
> [    2.430054] viper-vdpp-rng ac000000.vdpp_rng: Device Tree Probing
> [    2.435948] viper-vdpp-rng ac000000.vdpp_rng: Device registered
> [    2.441976] vmcu driver init
> [    2.444922] VMCU: : (240:0) registered
> [    2.444956] In K81 Updater init
> [    2.449003] pktgen: Packet Generator for packet performance testing. Version: 2.75
> [    2.468833] Initializing XFRM netlink socket
> [    2.468902] NET: Registered PF_PACKET protocol family
> [    2.472729] Bridge firewalling registered
> [    2.476785] 8021q: 802.1Q VLAN Support v1.8
> [    2.481341] registered taskstats version 1
> [    2.486394] Btrfs loaded, crc32c=crc32c-generic, zoned=no, fsverity=no
> [    2.503145] ff010000.serial: ttyPS1 at MMIO 0xff010000 (irq = 36, base_baud = 6250000) is a xuartps
> [    2.507103] of-fpga-region fpga-full: FPGA Region probed
> [    2.512986] xilinx-zynqmp-dma fd500000.dma-controller: ZynqMP DMA driver Probe success
> [    2.520267] xilinx-zynqmp-dma fd510000.dma-controller: ZynqMP DMA driver Probe success
> [    2.528239] xilinx-zynqmp-dma fd520000.dma-controller: ZynqMP DMA driver Probe success
> [    2.536152] xilinx-zynqmp-dma fd530000.dma-controller: ZynqMP DMA driver Probe success
> [    2.544153] xilinx-zynqmp-dma fd540000.dma-controller: ZynqMP DMA driver Probe success
> [    2.552127] xilinx-zynqmp-dma fd550000.dma-controller: ZynqMP DMA driver Probe success
> [    2.560178] xilinx-zynqmp-dma ffa80000.dma-controller: ZynqMP DMA driver Probe success
> [    2.567987] xilinx-zynqmp-dma ffa90000.dma-controller: ZynqMP DMA driver Probe success
> [    2.576018] xilinx-zynqmp-dma ffaa0000.dma-controller: ZynqMP DMA driver Probe success
> [    2.583889] xilinx-zynqmp-dma ffab0000.dma-controller: ZynqMP DMA driver Probe success
> [    2.946379] spi-nor spi0.0: mt25qu512a (131072 Kbytes)
> [    2.946467] 2 fixed-partitions partitions found on MTD device spi0.0
> [    2.952393] Creating 2 MTD partitions on "spi0.0":
> [    2.957231] 0x000004000000-0x000008000000 : "bank A"
> [    2.963332] 0x000000000000-0x000004000000 : "bank B"
> [    2.968694] macb ff0b0000.ethernet: Not enabling partial store and forward
> [    2.975333] macb ff0b0000.ethernet eth0: Cadence GEM rev 0x50070106 at 0xff0b0000 irq 25 (18:41:fe:0f:ff:02)
> [    2.984472] macb ff0c0000.ethernet: Not enabling partial store and forward
> [    2.992144] macb ff0c0000.ethernet eth1: Cadence GEM rev 0x50070106 at 0xff0c0000 irq 26 (18:41:fe:0f:ff:03)
> [    3.001043] viper_enet viper_enet: Viper power GPIOs initialised
> [    3.007313] viper_enet viper_enet vnet0 (uninitialized): Validate interface QSGMII
> [    3.014914] viper_enet viper_enet vnet1 (uninitialized): Validate interface QSGMII
> [    3.022138] viper_enet viper_enet vnet1 (uninitialized): Validate interface type 18
> [    3.030274] viper_enet viper_enet vnet2 (uninitialized): Validate interface QSGMII
> [    3.037785] viper_enet viper_enet vnet3 (uninitialized): Validate interface QSGMII
> [    3.045301] viper_enet viper_enet: Viper enet registered
> [    3.050958] xilinx-axipmon ffa00000.perf-monitor: Probed Xilinx APM
> [    3.057135] xilinx-axipmon fd0b0000.perf-monitor: Probed Xilinx APM
> [    3.063538] xilinx-axipmon fd490000.perf-monitor: Probed Xilinx APM
> [    3.069920] xilinx-axipmon ffa10000.perf-monitor: Probed Xilinx APM
> [    3.097729] si70xx: probe of 2-0040 failed with error -5
> [    3.098042] cdns-wdt fd4d0000.watchdog: Xilinx Watchdog Timer with timeout 60s
> [    3.105111] cdns-wdt ff150000.watchdog: Xilinx Watchdog Timer with timeout 10s
> [    3.112457] viper-tamper viper-tamper: Device registered
> [    3.117593] active_bank active_bank: boot bank: 1
> [    3.122184] active_bank active_bank: boot mode: (0x02) qspi32
> [    3.128247] viper-vdpp a4000000.vdpp: Device Tree Probing
> [    3.133439] viper-vdpp a4000000.vdpp: VDPP Version: 1.3.9.0 Info: 1.512.15.0 KeyLen: 32
> [    3.142151] viper-vdpp a4000000.vdpp: Tamper handler registered
> [    3.147438] viper-vdpp a4000000.vdpp: Device registered
> [    3.153007] lpc55_l2 spi1.0: registered handler for protocol 0
> [    3.158582] lpc55_user lpc55_user: The major number for your device is 236
> [    3.165976] lpc55_l2 spi1.0: registered handler for protocol 1
> [    3.181999] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> [    3.182856] rtc-lpc55 rtc_lpc55: registered as rtc0
> [    3.188656] lpc55_l2 spi1.0: (2) mcu still not ready?
> [    3.193744] lpc55_l2 spi1.0: (3) mcu still not ready?
> [    3.198848] lpc55_l2 spi1.0: (4) mcu still not ready?
> [    3.202932] mmc0: SDHCI controller on ff160000.mmc [ff160000.mmc] using ADMA 64-bit
> [    3.210689] lpc55_l2 spi1.0: (5) mcu still not ready?
> [    3.215694] lpc55_l2 spi1.0: rx error: -110
> [    3.284438] mmc0: new HS200 MMC card at address 0001
> [    3.285179] mmcblk0: mmc0:0001 SEM16G 14.6 GiB
> [    3.291784]  mmcblk0: p1 p2 p3 p4 p5 p6 p7 p8
> [    3.293915] mmcblk0boot0: mmc0:0001 SEM16G 4.00 MiB
> [    3.299054] mmcblk0boot1: mmc0:0001 SEM16G 4.00 MiB
> [    3.303905] mmcblk0rpmb: mmc0:0001 SEM16G 4.00 MiB, chardev (244:0)
> [    3.582676] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> [    3.583332] rtc-lpc55 rtc_lpc55: hctosys: unable to read the hardware clock
> [    3.591252] cdns-i2c ff020000.i2c: recovery information complete
> [    3.597085] at24 0-0050: supply vcc not found, using dummy regulator
> [    3.603011] lpc55_l2 spi1.0: (2) mcu still not ready?
> [    3.608093] at24 0-0050: 256 byte spd EEPROM, read-only
> [    3.613620] lpc55_l2 spi1.0: (3) mcu still not ready?
> [    3.619362] lpc55_l2 spi1.0: (4) mcu still not ready?
> [    3.624224] rtc-rv3028 0-0052: registered as rtc1
> [    3.628343] lpc55_l2 spi1.0: (5) mcu still not ready?
> [    3.633253] lpc55_l2 spi1.0: rx error: -110
> [    3.639104] k81_bootloader 0-0010: probe
> [    3.641628] VMCU: : (235:0) registered
> [    3.641635] k81_bootloader 0-0010: probe completed
> [    3.668346] cdns-i2c ff020000.i2c: 400 kHz mmio ff020000 irq 28
> [    3.669154] cdns-i2c ff030000.i2c: recovery information complete
> [    3.675412] lm75 1-0048: supply vs not found, using dummy regulator
> [    3.682920] lm75 1-0048: hwmon1: sensor 'tmp112'
> [    3.686548] i2c i2c-1: Added multiplexed i2c bus 3
> [    3.690795] i2c i2c-1: Added multiplexed i2c bus 4
> [    3.695629] i2c i2c-1: Added multiplexed i2c bus 5
> [    3.700492] i2c i2c-1: Added multiplexed i2c bus 6
> [    3.705157] pca954x 1-0070: registered 4 multiplexed busses for I2C switch pca9546
> [    3.713049] at24 1-0054: supply vcc not found, using dummy regulator
> [    3.720067] at24 1-0054: 1024 byte 24c08 EEPROM, read-only
> [    3.724761] cdns-i2c ff030000.i2c: 100 kHz mmio ff030000 irq 29
> [    3.731272] sfp viper_enet:sfp-eth1: Host maximum power 2.0W
> [    3.737549] sfp_register_socket: got sfp_bus
> [    3.740709] sfp_register_socket: register sfp_bus
> [    3.745459] sfp_register_bus: ops ok!
> [    3.749179] sfp_register_bus: Try to attach
> [    3.753419] sfp_register_bus: Attach succeeded
> [    3.757914] sfp_register_bus: upstream ops attach
> [    3.762677] sfp_register_bus: Bus registered
> [    3.766999] sfp_register_socket: register sfp_bus succeeded
> [    3.775870] of_cfs_init
> [    3.776000] of_cfs_init: OK
> [    3.778211] clk: Not disabling unused clocks
> [   11.278477] Freeing initrd memory: 206056K
> [   11.279406] Freeing unused kernel memory: 1536K
> [   11.314006] Checked W+X mappings: passed, no W+X pages found
> [   11.314142] Run /init as init process
> INIT: version 3.01 booting
> fsck (busybox 1.35.0)
> /dev/mmcblk0p1: clean, 12/102400 files, 238162/409600 blocks
> /dev/mmcblk0p2: clean, 12/102400 files, 171972/409600 blocks
> /dev/mmcblk0p3 was not cleanly unmounted, check forced.
> /dev/mmcblk0p3: 20/4096 files (0.0% non-contiguous), 663/16384 blocks
> [   11.553073] EXT4-fs (mmcblk0p3): mounted filesystem without journal. Opts: (null). Quota mode: disabled.
> Starting random number generator daemon.
> [   11.580662] random: crng init done
> Starting udev
> [   11.613159] udevd[142]: starting version 3.2.10
> [   11.620385] udevd[143]: starting eudev-3.2.10
> [   11.704481] macb ff0b0000.ethernet control_red: renamed from eth0
> [   11.720264] macb ff0c0000.ethernet control_black: renamed from eth1
> [   12.063396] ip_local_port_range: prefer different parity for start/end values.
> [   12.084801] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> hwclock: RTC_RD_TIME: Invalid exchange
> Mon Feb 27 08:40:53 UTC 2023
> [   12.115309] rtc-lpc55 rtc_lpc55: lpc55_rtc_set_time: bad result
> hwclock: RTC_SET_TIME: Invalid exchange
> [   12.131027] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> Starting mcud
> INIT: Entering runlevel: 5
> Configuring network interfaces... done.
> resetting network interface
> [   12.718295] macb ff0b0000.ethernet control_red: PHY [ff0b0000.ethernet-ffffffff:02] driver [Xilinx PCS/PMA PHY] (irq=POLL)
> [   12.723919] macb ff0b0000.ethernet control_red: configuring for phy/gmii link mode
> [   12.732151] pps pps0: new PPS source ptp0
> [   12.735563] macb ff0b0000.ethernet: gem-ptp-timer ptp clock registered.
> [   12.745724] macb ff0c0000.ethernet control_black: PHY [ff0c0000.ethernet-ffffffff:01] driver [Xilinx PCS/PMA PHY] (irq=POLL)
> [   12.753469] macb ff0c0000.ethernet control_black: configuring for phy/gmii link mode
> [   12.761804] pps pps1: new PPS source ptp1
> [   12.765398] macb ff0c0000.ethernet: gem-ptp-timer ptp clock registered.
> Auto-negotiation: off
> Auto-negotiation: off
> [   16.828151] macb ff0b0000.ethernet control_red: unable to generate target frequency: 125000000 Hz
> [   16.834553] macb ff0b0000.ethernet control_red: Link is Up - 1Gbps/Full - flow control off
> [   16.860552] macb ff0c0000.ethernet control_black: unable to generate target frequency: 125000000 Hz
> [   16.867052] macb ff0c0000.ethernet control_black: Link is Up - 1Gbps/Full - flow control off
> Starting Failsafe Secure Shell server in port 2222: sshd
> done.
> Starting rpcbind daemon...done.
> 
> [   17.093019] rtc-lpc55 rtc_lpc55: lpc55_rtc_get_time: bad result: 1
> hwclock: RTC_RD_TIME: Invalid exchange
> Starting State Manager Service
> Start state-manager restarter...
> (XEN) d0v1 Forwarding AES operation: 3254779951
> Starting /usr/sbin/xenstored....[   17.265256] BTRFS: device fsid 80efc224-c202-4f8e-a949-4dae7f04a0aa devid 1 transid 744 /dev/dm-0
> scanned by udevd (385)
> [   17.349933] BTRFS info (device dm-0): disk space caching is enabled
> [   17.350670] BTRFS info (device dm-0): has skinny extents
> [   17.364384] BTRFS info (device dm-0): enabling ssd optimizations
> [   17.830462] BTRFS: device fsid 27ff666b-f4e5-4f90-9054-c210db5b2e2e devid 1 transid 6 /dev/mapper/client_prov scanned by mkfs.btrfs
> (526)
> [   17.872699] BTRFS info (device dm-1): using free space tree
> [   17.872771] BTRFS info (device dm-1): has skinny extents
> [   17.878114] BTRFS info (device dm-1): flagging fs with big metadata feature
> [   17.894289] BTRFS info (device dm-1): enabling ssd optimizations
> [   17.895695] BTRFS info (device dm-1): checking UUID tree
> 
> Setting domain 0 name, domid and JSON config...
> Done setting up Dom0
> Starting xenconsoled...
> Starting QEMU as disk backend for dom0
> Starting domain watchdog daemon: xenwatchdogd startup
> 
> [   18.408647] BTRFS: device fsid 5e08d5e9-bc2a-46b9-af6a-44c7087b8921 devid 1 transid 6 /dev/mapper/client_config scanned by mkfs.btrfs
> (574)
> [done]
> [   18.465552] BTRFS info (device dm-2): using free space tree
> [   18.465629] BTRFS info (device dm-2): has skinny extents
> [   18.471002] BTRFS info (device dm-2): flagging fs with big metadata feature
> Starting crond: [   18.482371] BTRFS info (device dm-2): enabling ssd optimizations
> [   18.486659] BTRFS info (device dm-2): checking UUID tree
> OK
> starting rsyslogd ... Log partition ready after 0 poll loops
> done
> rsyslogd: cannot connect to 172.18.0.1:514: Network is unreachable [v8.2208.0 try https://www.rsyslog.com/e/2027 ]
> [   18.670637] BTRFS: device fsid 39d7d9e1-967d-478e-94ae-690deb722095 devid 1 transid 608 /dev/dm-3 scanned by udevd (518)
> 
> Please insert USB token and enter your role in login prompt.
> 
> login:
> 
> Regards,
> O.
> 
> 
> пн, 24 апр. 2023 г. в 23:39, Stefano Stabellini <sstabellini@kernel.org>:
>       Hi Oleg,
> 
>       Here is the issue from your logs:
> 
>       SError Interrupt on CPU0, code 0xbe000000 -- SError
> 
>       SErrors are special signals to notify software of serious hardware
>       errors.  Something is going very wrong. Defective hardware is a
>       possibility.  Another possibility if software accessing address ranges
>       that it is not supposed to, sometimes it causes SErrors.
> 
>       Cheers,
> 
>       Stefano
> 
> 
> 
>       On Mon, 24 Apr 2023, Oleg Nikitenko wrote:
> 
>       > Hello,
>       >
>       > Thanks guys.
>       > I found out where the problem was.
>       > Now dom0 booted more. But I have a new one.
>       > This is a kernel panic during Dom0 loading.
>       > Maybe someone is able to suggest something ?
>       >
>       > Regards,
>       > O.
>       >
>       > [    3.771362] sfp_register_bus: upstream ops attach
>       > [    3.776119] sfp_register_bus: Bus registered
>       > [    3.780459] sfp_register_socket: register sfp_bus succeeded
>       > [    3.789399] of_cfs_init
>       > [    3.789499] of_cfs_init: OK
>       > [    3.791685] clk: Not disabling unused clocks
>       > [   11.010355] SError Interrupt on CPU0, code 0xbe000000 -- SError
>       > [   11.010380] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1
>       > [   11.010393] Workqueue: events_unbound async_run_entry_fn
>       > [   11.010414] pstate: 60000005 (nZCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>       > [   11.010422] pc : simple_write_end+0xd0/0x130
>       > [   11.010431] lr : generic_perform_write+0x118/0x1e0
>       > [   11.010438] sp : ffffffc00809b910
>       > [   11.010441] x29: ffffffc00809b910 x28: 0000000000000000 x27: ffffffef69ba88c0
>       > [   11.010451] x26: 0000000000003eec x25: ffffff807515db00 x24: 0000000000000000
>       > [   11.010459] x23: ffffffc00809ba90 x22: 0000000002aac000 x21: ffffff807315a260
>       > [   11.010472] x20: 0000000000001000 x19: fffffffe02000000 x18: 0000000000000000
>       > [   11.010481] x17: 00000000ffffffff x16: 0000000000008000 x15: 0000000000000000
>       > [   11.010490] x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>       > [   11.010498] x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
>       > [   11.010507] x8 : 0000000000000000 x7 : ffffffef693ba680 x6 : 000000002d89b700
>       > [   11.010515] x5 : fffffffe02000000 x4 : ffffff807315a3c8 x3 : 0000000000001000
>       > [   11.010524] x2 : 0000000002aab000 x1 : 0000000000000001 x0 : 0000000000000005
>       > [   11.010534] Kernel panic - not syncing: Asynchronous SError Interrupt
>       > [   11.010539] CPU: 0 PID: 9 Comm: kworker/u4:0 Not tainted 5.15.72-xilinx-v2022.1 #1
>       > [   11.010545] Hardware name: D14 Viper Board - White Unit (DT)
>       > [   11.010548] Workqueue: events_unbound async_run_entry_fn
>       > [   11.010556] Call trace:
>       > [   11.010558]  dump_backtrace+0x0/0x1c4
>       > [   11.010567]  show_stack+0x18/0x2c
>       > [   11.010574]  dump_stack_lvl+0x7c/0xa0
>       > [   11.010583]  dump_stack+0x18/0x34
>       > [   11.010588]  panic+0x14c/0x2f8
>       > [   11.010597]  print_tainted+0x0/0xb0
>       > [   11.010606]  arm64_serror_panic+0x6c/0x7c
>       > [   11.010614]  do_serror+0x28/0x60
>       > [   11.010621]  el1h_64_error_handler+0x30/0x50
>       > [   11.010628]  el1h_64_error+0x78/0x7c
>       > [   11.010633]  simple_write_end+0xd0/0x130
>       > [   11.010639]  generic_perform_write+0x118/0x1e0
>       > [   11.010644]  __generic_file_write_iter+0x138/0x1c4
>       > [   11.010650]  generic_file_write_iter+0x78/0xd0
>       > [   11.010656]  __kernel_write+0xfc/0x2ac
>       > [   11.010665]  kernel_write+0x88/0x160
>       > [   11.010673]  xwrite+0x44/0x94
>       > [   11.010680]  do_copy+0xa8/0x104
>       > [   11.010686]  write_buffer+0x38/0x58
>       > [   11.010692]  flush_buffer+0x4c/0xbc
>       > [   11.010698]  __gunzip+0x280/0x310
>       > [   11.010704]  gunzip+0x1c/0x28
>       > [   11.010709]  unpack_to_rootfs+0x170/0x2b0
>       > [   11.010715]  do_populate_rootfs+0x80/0x164
>       > [   11.010722]  async_run_entry_fn+0x48/0x164
>       > [   11.010728]  process_one_work+0x1e4/0x3a0
>       > [   11.010736]  worker_thread+0x7c/0x4c0
>       > [   11.010743]  kthread+0x120/0x130
>       > [   11.010750]  ret_from_fork+0x10/0x20
>       > [   11.010757] SMP: stopping secondary CPUs
>       > [   11.010784] Kernel Offset: 0x2f61200000 from 0xffffffc008000000
>       > [   11.010788] PHYS_OFFSET: 0x0
>       > [   11.010790] CPU features: 0x00000401,00000842
>       > [   11.010795] Memory Limit: none
>       > [   11.277509] ---[ end Kernel panic - not syncing: Asynchronous SError Interrupt ]---
>       >
>       > пт, 21 апр. 2023 г. в 15:52, Michal Orzel <michal.orzel@amd.com>:
>       >       Hi Oleg,
>       >
>       >       On 21/04/2023 14:49, Oleg Nikitenko wrote:
>       >       >       
>       >       >
>       >       >
>       >       > Hello Michal,
>       >       >
>       >       > I was not able to enable earlyprintk in the xen for now.
>       >       > I decided to choose another way.
>       >       > This is a xen's command line that I found out completely.
>       >       >
>       >       > (XEN) $$$$ console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin bootscrub=0 vwfi=native
>       sched=null
>       >       timer_slop=0
>       >       Yes, adding a printk() in Xen was also a good idea.
>       >
>       >       >
>       >       > So you are absolutely right about a command line.
>       >       > Now I am going to find out why xen did not have the correct parameters from the device tree.
>       >       Maybe you will find this document helpful:
>       >       https://github.com/Xilinx/xen/blob/xlnx_rebase_4.16/docs/misc/arm/device-tree/booting.txt
>       >
>       >       ~Michal
>       >
>       >       >
>       >       > Regards,
>       >       > Oleg
>       >       >
>       >       > пт, 21 апр. 2023 г. в 11:16, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>>:
>       >       >
>       >       >
>       >       >     On 21/04/2023 10:04, Oleg Nikitenko wrote:
>       >       >     >       
>       >       >     >
>       >       >     >
>       >       >     > Hello Michal,
>       >       >     >
>       >       >     > Yes, I use yocto.
>       >       >     >
>       >       >     > Yesterday all day long I tried to follow your suggestions.
>       >       >     > I faced a problem.
>       >       >     > Manually in the xen config build file I pasted the strings:
>       >       >     In the .config file or in some Yocto file (listing additional Kconfig options) added to SRC_URI?
>       >       >     You shouldn't really modify .config file but if you do, you should execute "make olddefconfig" afterwards.
>       >       >
>       >       >     >
>       >       >     > CONFIG_EARLY_PRINTK
>       >       >     > CONFIG_EARLY_PRINTK_ZYNQMP
>       >       >     > CONFIG_EARLY_UART_CHOICE_CADENCE
>       >       >     I hope you added =y to them.
>       >       >
>       >       >     Anyway, you have at least the following solutions:
>       >       >     1) Run bitbake xen -c menuconfig to properly set early printk
>       >       >     2) Find out how you enable other Kconfig options in your project (e.g. CONFIG_COLORING=y that is not enabled by
>       default)
>       >       >     3) Append the following to "xen/arch/arm/configs/arm64_defconfig":
>       >       >     CONFIG_EARLY_PRINTK_ZYNQMP=y
>       >       >
>       >       >     ~Michal
>       >       >
>       >       >     >
>       >       >     > Host hangs in build time. 
>       >       >     > Maybe I did not set something in the config build file ?
>       >       >     >
>       >       >     > Regards,
>       >       >     > Oleg
>       >       >     >
>       >       >     > чт, 20 апр. 2023 г. в 11:57, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
>       >       <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
>       >       >     >
>       >       >     >     Thanks Michal,
>       >       >     >
>       >       >     >     You gave me an idea.
>       >       >     >     I am going to try it today.
>       >       >     >
>       >       >     >     Regards,
>       >       >     >     O.
>       >       >     >
>       >       >     >     чт, 20 апр. 2023 г. в 11:56, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
>       >       <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
>       >       >     >
>       >       >     >         Thanks Stefano.
>       >       >     >
>       >       >     >         I am going to do it today.
>       >       >     >
>       >       >     >         Regards,
>       >       >     >         O.
>       >       >     >
>       >       >     >         ср, 19 апр. 2023 г. в 23:05, Stefano Stabellini <sstabellini@kernel.org <mailto:sstabellini@kernel.org>
>       >       <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>:
>       >       >     >
>       >       >     >             On Wed, 19 Apr 2023, Oleg Nikitenko wrote:
>       >       >     >             > Hi Michal,
>       >       >     >             >
>       >       >     >             > I corrected xen's command line.
>       >       >     >             > Now it is
>       >       >     >             > xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2 dom0_vcpus_pin
>       >       bootscrub=0 vwfi=native sched=null
>       >       >     >             > timer_slop=0 way_size=65536 xen_colors=0-3 dom0_colors=4-7";
>       >       >     >
>       >       >     >             4 colors is way too many for xen, just do xen_colors=0-0. There is no
>       >       >     >             advantage in using more than 1 color for Xen.
>       >       >     >
>       >       >     >             4 colors is too few for dom0, if you are giving 1600M of memory to Dom0.
>       >       >     >             Each color is 256M. For 1600M you should give at least 7 colors. Try:
>       >       >     >
>       >       >     >             xen_colors=0-0 dom0_colors=1-8
>       >       >     >
>       >       >     >
>       >       >     >
>       >       >     >             > Unfortunately the result was the same.
>       >       >     >             >
>       >       >     >             > (XEN)  - Dom0 mode: Relaxed
>       >       >     >             > (XEN) P2M: 40-bit IPA with 40-bit PA and 8-bit VMID
>       >       >     >             > (XEN) P2M: 3 levels with order-1 root, VTCR 0x0000000080023558
>       >       >     >             > (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
>       >       >     >             > (XEN) Coloring general information
>       >       >     >             > (XEN) Way size: 64kB
>       >       >     >             > (XEN) Max. number of colors available: 16
>       >       >     >             > (XEN) Xen color(s): [ 0 ]
>       >       >     >             > (XEN) alternatives: Patching with alt table 00000000002cc690 -> 00000000002ccc0c
>       >       >     >             > (XEN) Color array allocation failed for dom0
>       >       >     >             > (XEN)
>       >       >     >             > (XEN) ****************************************
>       >       >     >             > (XEN) Panic on CPU 0:
>       >       >     >             > (XEN) Error creating domain 0
>       >       >     >             > (XEN) ****************************************
>       >       >     >             > (XEN)
>       >       >     >             > (XEN) Reboot in five seconds...
>       >       >     >             >
>       >       >     >             > I am going to find out how command line arguments passed and parsed.
>       >       >     >             >
>       >       >     >             > Regards,
>       >       >     >             > Oleg
>       >       >     >             >
>       >       >     >             > ср, 19 апр. 2023 г. в 11:25, Oleg Nikitenko <oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>
>       >       <mailto:oleshiiwood@gmail.com <mailto:oleshiiwood@gmail.com>>>:
>       >       >     >             >       Hi Michal,
>       >       >     >             >
>       >       >     >             > You put my nose into the problem. Thank you.
>       >       >     >             > I am going to use your point.
>       >       >     >             > Let's see what happens.
>       >       >     >             >
>       >       >     >             > Regards,
>       >       >     >             > Oleg
>       >       >     >             >
>       >       >     >             >
>       >       >     >             > ср, 19 апр. 2023 г. в 10:37, Michal Orzel <michal.orzel@amd.com <mailto:michal.orzel@amd.com>
>       >       <mailto:michal.orzel@amd.com <mailto:michal.orzel@amd.com>>>:
>       >       >     >             >       Hi Oleg,
>       >       >     >             >
>       >       >     >             >       On 19/04/2023 09:03, Oleg Nikitenko wrote:
>       >       >     >             >       >       
>       >       >     >             >       >
>       >       >     >             >       >
>       >       >     >             >       > Hello Stefano,
>       >       >     >             >       >
>       >       >     >             >       > Thanks for the clarification.
>       >       >     >             >       > My company uses yocto for image generation.
>       >       >     >             >       > What kind of information do you need to consult me in this case ?
>       >       >     >             >       >
>       >       >     >             >       > Maybe modules sizes/addresses which were mentioned by @Julien Grall
>       <mailto:julien@xen.org
>       >       <mailto:julien@xen.org> <mailto:julien@xen.org <mailto:julien@xen.org>>> ?
>       >       >     >             >
>       >       >     >             >       Sorry for jumping into discussion, but FWICS the Xen command line you provided seems to be
>       not the
>       >       one
>       >       >     >             >       Xen booted with. The error you are observing most likely is due to dom0 colors
>       configuration not
>       >       being
>       >       >     >             >       specified (i.e. lack of dom0_colors=<> parameter). Although in the command line you
>       provided, this
>       >       parameter
>       >       >     >             >       is set, I strongly doubt that this is the actual command line in use.
>       >       >     >             >
>       >       >     >             >       You wrote:
>       >       >     >             >       xen,xen-bootargs = "console=dtuart dtuart=serial0 dom0_mem=1600M dom0_max_vcpus=2
>       dom0_vcpus_pin
>       >       bootscrub=0 vwfi=native
>       >       >     >             >       sched=null timer_slop=0 way_szize=65536 xen_colors=0-3 dom0_colors=4-7";
>       >       >     >             >
>       >       >     >             >       but:
>       >       >     >             >       1) way_szize has a typo
>       >       >     >             >       2) you specified 4 colors (0-3) for Xen, but the boot log says that Xen has only one:
>       >       >     >             >       (XEN) Xen color(s): [ 0 ]
>       >       >     >             >
>       >       >     >             >       This makes me believe that no colors configuration actually end up in command line that Xen
>       booted
>       >       with.
>       >       >     >             >       Single color for Xen is a "default if not specified" and way size was probably calculated
>       by asking
>       >       HW.
>       >       >     >             >
>       >       >     >             >       So I would suggest to first cross-check the command line in use.
>       >       >     >             >
>       >       >     >             >       ~Michal
>       >       >     >             >
>       >       >     >             >
>       >       >     >             >       >
>       >       >     >             >       > Regards,
>       >       >     >             >       > Oleg
>       >       >     >             >       >
>       >       >     >             >       > вт, 18 апр. 2023 г. в 20:44, Stefano Stabellini <sstabellini@kernel.org
>       >       <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>
>       <mailto:sstabellini@kernel.org
>       >       <mailto:sstabellini@kernel.org> <mailto:sstabellini@kernel.org <mailto:sstabellini@kernel.org>>>>:
>       >       >     >             >       >
>       >       >     >             >       >     On Tue, 18 Apr 2023, Oleg Nikitenko wrote:
>       >       >     >             >       >     > Hi Julien,
>       >       >     >             >       >     >
>       >       >     >             >       >     > >> This feature has not been merged in Xen upstream yet
>       >       >     >             >       >     >
>       >       >     >             >       >     > > would assume that upstream + the series on the ML [1] work
>       >       >     >             >       >     >
>       >       >     >             >       >     > Please clarify this point.
>       >       >     >             >       >     > Because the two thoughts are controversial.
>       >       >     >             >       >
>       >       >     >             >       >     Hi Oleg,
>       >       >     >             >       >
>       >       >     >             >       >     As Julien wrote, there is nothing controversial. As you are aware,
>       >       >     >             >       >     Xilinx maintains a separate Xen tree specific for Xilinx here:
>       >       >     >             >       >     https://github.com/xilinx/xen <https://github.com/xilinx/xen>
>       <https://github.com/xilinx/xen
>       >       <https://github.com/xilinx/xen>> <https://github.com/xilinx/xen <https://github.com/xilinx/xen>
>       <https://github.com/xilinx/xen
>       >       <https://github.com/xilinx/xen>>>
>       >       >     >             >       >
>       >       >     >             >       >     and the branch you are using (xlnx_rebase_4.16) comes from there.
>       >       >     >             >       >
>       >       >     >             >       >
>       >       >     >             >       >     Instead, the upstream Xen tree lives here:
>       >       >     >             >       >     https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       >       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       >       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       >       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary> <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary
>       >       <https://xenbits.xen.org/gitweb/?p=xen.git;a=summary>>>
>       >       >     >             >       >
>       >       >     >             >       >
>       >       >     >             >       >     The Cache Coloring feature that you are trying to configure is present
>       >       >     >             >       >     in xlnx_rebase_4.16, but not yet present upstream (there is an
>       >       >     >             >       >     outstanding patch series to add cache coloring to Xen upstream but it
>       >       >     >             >       >     hasn't been merged yet.)
>       >       >     >             >       >
>       >       >     >             >       >
>       >       >     >             >       >     Anyway, if you are using xlnx_rebase_4.16 it doesn't matter too much for
>       >       >     >             >       >     you as you already have Cache Coloring as a feature there.
>       >       >     >             >       >
>       >       >     >             >       >
>       >       >     >             >       >     I take you are using ImageBuilder to generate the boot configuration? If
>       >       >     >             >       >     so, please post the ImageBuilder config file that you are using.
>       >       >     >             >       >
>       >       >     >             >       >     But from the boot message, it looks like the colors configuration for
>       >       >     >             >       >     Dom0 is incorrect.
>       >       >     >             >       >
>       >       >     >             >
>       >       >     >             >
>       >       >     >             >
>       >       >     >
>       >       >
>       >
>       >
>       >
> 
> 
> 
--8323329-1645323024-1682446524=:3419--

