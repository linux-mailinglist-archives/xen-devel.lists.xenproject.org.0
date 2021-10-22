Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 44F0C437ECB
	for <lists+xen-devel@lfdr.de>; Fri, 22 Oct 2021 21:41:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.215250.374320 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0Pq-0006qL-0Q; Fri, 22 Oct 2021 19:41:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 215250.374320; Fri, 22 Oct 2021 19:41:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1me0Pp-0006oa-TL; Fri, 22 Oct 2021 19:41:21 +0000
Received: by outflank-mailman (input) for mailman id 215250;
 Fri, 22 Oct 2021 19:41:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TWKL=PK=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1me0Po-0006oT-RL
 for xen-devel@lists.xenproject.org; Fri, 22 Oct 2021 19:41:20 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0604c333-3370-11ec-83d2-12813bfff9fa;
 Fri, 22 Oct 2021 19:41:19 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C66A460F6E;
 Fri, 22 Oct 2021 19:41:17 +0000 (UTC)
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
X-Inumbo-ID: 0604c333-3370-11ec-83d2-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1634931678;
	bh=ibOiUdb0fOLio36KuXa5AA9Ov6RCtUbKkgdgjoKSHhQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YIrdDpMl/Pi5XwGaJ2kaVVBUzcFInD8Kh7nTDEsvFWkBVCLHEE7CuqIt7ZcxNt2yO
	 UIczft32nq5Ks6McojcaHYrrY4+TQaOdEkTWRV3AV/MlxEdzT6uhkgh3BbznCRmlA6
	 Ie9GhZG0XkyB65xia8gkBRG5GVzogZTm3DFAWhyTo2UvyGJLIDe3i/TM0QxBwX6e7T
	 oG9HaiaYJU/w4ekOFy4W+O/dmPVXHKDDEVUvOCZa86SSkpSTsO7RKH4gfUIck04b2f
	 q7nyV6sHG773DRaQCXIrWpOe1f5OwZAcf6PkOkCrCLq4BSE7ivc0INxaqP/snuPud+
	 srLBm1jFq91pQ==
Date: Fri, 22 Oct 2021 12:41:16 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Stefano Stabellini <sstabellini@kernel.org>, 
    xen-devel@lists.xenproject.org, iwj@xenproject.org, cardoe@cardoe.com, 
    wl@xen.org, anthony.perard@citrix.com, 
    Stefano Stabellini <stefano.stabellini@xilinx.com>, jgross@suse.com
Subject: Re: [PATCH 2/3] automation: Linux 5.10.74 test-artifact
In-Reply-To: <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
Message-ID: <alpine.DEB.2.21.2110221219300.2311@sstabellini-ThinkPad-T480s>
References: <alpine.DEB.2.21.2110210831470.2311@sstabellini-ThinkPad-T480s> <20211021230839.10794-2-sstabellini@kernel.org> <19aa9196-eb5f-22a1-206c-c9c87ee79fa9@citrix.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-1865530201-1634930389=:2311"
Content-ID: <alpine.DEB.2.21.2110221237120.2311@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1865530201-1634930389=:2311
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2110221237121.2311@sstabellini-ThinkPad-T480s>

+Juergen

On Fri, 22 Oct 2021, Andrew Cooper wrote:
> On 22/10/2021 00:08, Stefano Stabellini wrote:
> > +# build depends
> > +RUN apt-get update && \
> > +    apt-get --quiet --yes install \
> > +        build-essential \
> > +        libssl-dev \
> > +        bc \
> > +        curl \
> > +        flex \
> > +        bison \
> > +        libelf-dev \
> > +        && \
> > +    \
> > +    # Build the kernel
> > +    curl -fsSLO https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-"$LINUX_VERSION".tar.xz && \
> > +    tar xvJf linux-"$LINUX_VERSION".tar.xz && \
> > +    cd linux-"$LINUX_VERSION" && \
> > +    make defconfig && \
> > +    make xen.config && \
> > +    cp .config .config.orig && \
> > +    cat .config.orig | grep XEN | grep =m |sed 's/=m/=y/g' >> .config && \
> > +    make -j$(nproc) bzImage && \
> 
> defconfig is huuuuge.  Can we use tinyconfig instead?
> 
> Also, you want to turn off CONFIG_MODULES seeing as you only copy
> bzImage to the test.
> 
> This also fixes the fact that `grep XEN` also matches CONFIG_NETXEN_NIC
> which has nothing to do with Xen.

Tinyconfig would be a good idea but it crashes on QEMU with the appended
boot log. I did:

# make tinyconfig
# make xen.config
# make bzImage

Of course we could have our own tailored special kernel config for this
kernel but I like the simplicify of "make tinyconfig" or "make
defconfig" followed by "make xen.config".

Unless you know one kconfig option or two that we need to add to
tinyconfig to make it work my preference is to go with defconfig for
now.



(XEN) Xen version 4.16-unstable (sstabellini@) (gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0) debug=y Tue Oct 19 19:29:09 PDT 2021
(XEN) Latest ChangeSet: Tue Oct 19 18:19:21 2021 -0700 git:9d0c6610bf-dirty
(XEN) build-id: 204da5ded1385bd7f645957893dba95d08ffc6e2
(XEN) Bootloader: iPXE 1.20.1+ (g4bd0)
(XEN) Command line: console=com1
(XEN) Xen image load base address: 0
(XEN) Video information:
(XEN)  VGA is text mode 80x25, font 8x16
(XEN)  VBE/DDC methods: V1 V2; EDID transfer time: 1 seconds
(XEN) Disc information:
(XEN)  Found 0 MBR signatures
(XEN)  Found 0 EDD information structures
(XEN) CPU Vendor: AMD, Family 15 (0xf), Model 107 (0x6b), Stepping 1 (raw 00060fb1)
(XEN) Xen-e820 RAM map:
(XEN)  [0000000000000000, 000000000009fbff] (usable)
(XEN)  [000000000009fc00, 000000000009ffff] (reserved)
(XEN)  [00000000000f0000, 00000000000fffff] (reserved)
(XEN)  [0000000000100000, 000000007ffdffff] (usable)
(XEN)  [000000007ffe0000, 000000007fffffff] (reserved)
(XEN)  [00000000fffc0000, 00000000ffffffff] (reserved)
(XEN) New Xen image base address: 0x7f800000
(XEN) System RAM: 2047MB (2096636kB)
(XEN) ACPI: RSDP 000F58D0, 0014 (r0 BOCHS )
(XEN) ACPI: RSDT 7FFE1960, 0034 (r1 BOCHS  BXPC            1 BXPC        1)
(XEN) ACPI: FACP 7FFE180C, 0074 (r1 BOCHS  BXPC            1 BXPC        1)
(XEN) ACPI: DSDT 7FFE0040, 17CC (r1 BOCHS  BXPC            1 BXPC        1)
(XEN) ACPI: FACS 7FFE0000, 0040
(XEN) ACPI: APIC 7FFE1880, 0080 (r1 BOCHS  BXPC            1 BXPC        1)
(XEN) ACPI: HPET 7FFE1900, 0038 (r1 BOCHS  BXPC            1 BXPC        1)
(XEN) ACPI: WAET 7FFE1938, 0028 (r1 BOCHS  BXPC            1 BXPC        1)
(XEN) No NUMA configuration found
(XEN) Faking a node at 0000000000000000-000000007ffe0000
(XEN) Domain heap initialised
(XEN) found SMP MP-table at 000f5ab0
(XEN) DMI 2.8 present.
(XEN) Using APIC driver default
(XEN) ACPI: PM-Timer IO Port: 0x608 (24 bits)
(XEN) ACPI: SLEEP INFO: pm1x_cnt[1:604,1:0], pm1x_evt[1:600,1:0]
(XEN) ACPI:             wakeup_vec[7ffe000c], vec_size[20]
(XEN) ACPI: Local APIC address 0xfee00000
(XEN) ACPI: IOAPIC (id[0x00] address[0xfec00000] gsi_base[0])
(XEN) IOAPIC[0]: apic_id 0, version 32, address 0xfec00000, GSI 0-23
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 5 global_irq 5 high level)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 10 global_irq 10 high level)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 11 global_irq 11 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override.
(XEN) ACPI: IRQ5 used by override.
(XEN) ACPI: IRQ9 used by override.
(XEN) ACPI: IRQ10 used by override.
(XEN) ACPI: IRQ11 used by override.
(XEN) Enabling APIC mode:  Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) Using ACPI (MADT) for SMP configuration information
(XEN) SMP: Allowing 2 CPUs (0 hotplug CPUs)
(XEN) IRQ limits: 24 GSI, 392 MSI/MSI-X
(XEN) Microcode loading not available
(XEN) No SSBD controls available
(XEN) CPU0: AMD K8 machine check reporting enabled
(XEN) Speculative mitigation facilities:
(XEN)   Hardware hints:
(XEN)   Hardware features:
(XEN)   Compiled-in support: INDIRECT_THUNK SHADOW_PAGING
(XEN)   Xen settings: BTI-Thunk LFENCE, SPEC_CTRL: No, Other: BRANCH_HARDEN
(XEN)   Support for HVM VMs: RSB
(XEN)   Support for PV VMs: RSB
(XEN)   XPTI (64-bit PV only): Dom0 disabled, DomU disabled (without PCID)
(XEN)   PV L1TF shadowing: Dom0 disabled, DomU disabled
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
(XEN) Initializing Credit2 scheduler
(XEN)  load_precision_shift: 18
(XEN)  load_window_shift: 30
(XEN)  underload_balance_tolerance: 0
(XEN)  overload_balance_tolerance: -3
(XEN)  runqueues arrangement: socket
(XEN)  cap enforcement granularity: 10ms
(XEN) load tracking window length 1073741824 ns
(XEN) Platform timer is 100.000MHz HPET
(XEN) Detected 1993.167 MHz processor.
(XEN) Freed 1024kB unused BSS memory
(XEN) alt table ffff82d04048f570 -> ffff82d04049cf34
(XEN) I/O virtualisation disabled
(XEN) nr_sockets: 1
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using new ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) TSC only partially writable
(XEN) Allocated console ring of 16 KiB.
(XEN) mwait-idle: does not run on family 15 model 107
(XEN) HVM: ASIDs enabled.
(XEN) SVM: Supported advanced features:
(XEN)  - none
(XEN) HVM: SVM enabled
(XEN) HVM: Hardware Assisted Paging (HAP) not detected
(XEN) alt table ffff82d04048f570 -> ffff82d04049cf34
(XEN) Brought up 2 CPUs
(XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
(XEN) Adding cpu 0 to runqueue 0
(XEN)  First cpu on runqueue, activating
(XEN) Adding cpu 1 to runqueue 0
(XEN) mcheck_poll: Machine check polling timer started.
(XEN) mtrr: your CPUs had inconsistent fixed MTRR settings
(XEN) mtrr: your CPUs had inconsistent variable MTRR settings
(XEN) mtrr: your CPUs had inconsistent MTRRdefType settings
(XEN) mtrr: probably your BIOS does not setup all CPUs.
(XEN) mtrr: corrected configuration.
(XEN) MTRR default type: write-back
(XEN) MTRR fixed ranges enabled:
(XEN)   00000-9ffff write-back
(XEN)   a0000-bffff uncachable
(XEN)   c0000-fffff write-protect
(XEN) MTRR variable ranges enabled:
(XEN)   0 base 0080000000 mask ff80000000 uncachable
(XEN)   1 disabled
(XEN)   2 disabled
(XEN)   3 disabled
(XEN)   4 disabled
(XEN)   5 disabled
(XEN)   6 disabled
(XEN)   7 disabled
(XEN) Running stub recovery selftests...
(XEN) Fixup #UD[0000]: ffff82d07fffe040 [ffff82d07fffe040] -> ffff82d04038e83a
(XEN) Selftest 1 failed: Opc 90 02 00 c3 expected 13[0000], got 14[0001]
(XEN) Selftest 2 failed: Opc 02 04 04 c3 expected 12[0000], got 14[0001]
(XEN) Fixup #BP[0000]: ffff82d07fffe041 [ffff82d07fffe041] -> ffff82d04038e83a
(XEN) NX (Execute Disable) protection active
(XEN) Dom0 has maximum 416 PIRQs
(XEN) *** Building a PV Dom0 ***
(XEN) ELF: phdr: paddr=0x1000000 memsz=0x8532f0
(XEN) ELF: phdr: paddr=0x1a00000 memsz=0x75000
(XEN) ELF: phdr: paddr=0x1a75000 memsz=0x1a1000
(XEN) ELF: memory: 0x1000000 -> 0x1c16000
(XEN) ELF: note: GUEST_OS = "linux"
(XEN) ELF: note: GUEST_VERSION = "2.6"
(XEN) ELF: note: XEN_VERSION = "xen-3.0"
(XEN) ELF: note: VIRT_BASE = 0xffffffff80000000
(XEN) ELF: note: INIT_P2M = 0x8000000000
(XEN) ELF: note: ENTRY = 0xffffffff81a75160
(XEN) ELF: note: HYPERCALL_PAGE = 0xffffffff81001000
(XEN) ELF: note: FEATURES = "!writable_page_tables|pae_pgdir_above_4gb"
(XEN) ELF: note: SUPPORTED_FEATURES = 0x8801
(XEN) ELF: note: PAE_MODE = "yes"
(XEN) ELF: note: LOADER = "generic"
(XEN) ELF: note: unknown (0xd)
(XEN) ELF: note: SUSPEND_CANCEL = 0x1
(XEN) ELF: note: MOD_START_PFN = 0x1
(XEN) ELF: note: HV_START_LOW = 0xffff800000000000
(XEN) ELF: note: PADDR_OFFSET = 0
(XEN) ELF: addresses:
(XEN)     virt_base        = 0xffffffff80000000
(XEN)     elf_paddr_offset = 0x0
(XEN)     virt_offset      = 0xffffffff80000000
(XEN)     virt_kstart      = 0xffffffff81000000
(XEN)     virt_kend        = 0xffffffff81c16000
(XEN)     virt_entry       = 0xffffffff81a75160
(XEN)     p2m_base         = 0x8000000000
(XEN)  Xen  kernel: 64-bit, lsb
(XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x1c16000
(XEN) PHYSICAL MEMORY ARRANGEMENT:
(XEN)  Dom0 alloc.:   000000007a000000->000000007c000000 (476919 pages to be allocated)
(XEN)  Init. ramdisk: 000000007f806000->000000007f9ffe77
(XEN) VIRTUAL MEMORY ARRANGEMENT:
(XEN)  Loaded kernel: ffffffff81000000->ffffffff81c16000
(XEN)  Phys-Mach map: 0000008000000000->00000080003b4788
(XEN)  Start info:    ffffffff81c16000->ffffffff81c164b8
(XEN)  Page tables:   ffffffff81c17000->ffffffff81c2a000
(XEN)  Boot stack:    ffffffff81c2a000->ffffffff81c2b000
(XEN)  TOTAL:         ffffffff80000000->ffffffff82000000
(XEN)  ENTRY ADDRESS: ffffffff81a75160
(XEN) Dom0 has maximum 2 VCPUs
(XEN) ELF: phdr 0 at 0xffffffff81000000 -> 0xffffffff818532f0
(XEN) ELF: phdr 1 at 0xffffffff81a00000 -> 0xffffffff81a75000
(XEN) ELF: phdr 2 at 0xffffffff81a75000 -> 0xffffffff81afcc4d
(XEN) Initial low memory virq threshold set at 0x4000 pages.
(XEN) Scrubbing Free RAM in background
(XEN) Std. Loglevel: All
(XEN) Guest Loglevel: All
(XEN) ***************************************************
(XEN) SELFTEST FAILURE: CORRECT BEHAVIOR CANNOT BE GUARANTEED
(XEN) ***************************************************
(XEN) 3... 2... 1... 
(XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input)
(XEN) Freed 592kB init memory
mapping kernel into physical memory
about to get started...
(XEN) emul-priv-op.c:1018:d0v0 RDMSR 0xc0010055 unimplemented
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.
qemu-system-x86_64: terminating on signal 2
--8323329-1865530201-1634930389=:2311--

