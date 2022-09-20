Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 742505BDE99
	for <lists+xen-devel@lfdr.de>; Tue, 20 Sep 2022 09:43:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.409178.652119 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaXtP-00069b-74; Tue, 20 Sep 2022 07:42:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 409178.652119; Tue, 20 Sep 2022 07:42:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oaXtP-00066s-3z; Tue, 20 Sep 2022 07:42:07 +0000
Received: by outflank-mailman (input) for mailman id 409178;
 Tue, 20 Sep 2022 07:42:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eLv4=ZX=gmail.com=szewcson@srs-se1.protection.inumbo.net>)
 id 1oaXtN-00066m-Ui
 for xen-devel@lists.xen.org; Tue, 20 Sep 2022 07:42:06 +0000
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b72c1856-38b7-11ed-9647-05401a9f4f97;
 Tue, 20 Sep 2022 09:42:03 +0200 (CEST)
Received: by mail-pj1-x1036.google.com with SMTP id fs14so2126022pjb.5
 for <xen-devel@lists.xen.org>; Tue, 20 Sep 2022 00:42:03 -0700 (PDT)
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
X-Inumbo-ID: b72c1856-38b7-11ed-9647-05401a9f4f97
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=1sMWQkaPjZ6B1lFWgJf0Wo39KVCMF8HW83cCGlHJITs=;
        b=iOSEA+FcmEuj70qoUmH37gsciTlfgIG2owBRfPA89MZiVCUnLISrqk9+i+0Ofbl4oi
         RGn7yc7R633T95VKdqhX1Z3wgHMuI4iMprK8zPKQzHlTrqkwhdlDcMITV0iwn/XhsNPb
         miTTKPfjX3hclDjyTl2vwhnLjeAGYNATARP3myenEVUwHykyoqIF51Cy6/legUm+XI1F
         c6MokWRtBFIs3ogipUHsjJZp6Ks/HSSNq0z7BVnDSeh/thftijGFAVhZMMGXiWHw1iK3
         LQmI1vPv91l16NF9gdaYUlozdds5fE7QaF0AFdBp9oHVYf6kFzzmlF6rKg8eLS+dAcMF
         iiyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=1sMWQkaPjZ6B1lFWgJf0Wo39KVCMF8HW83cCGlHJITs=;
        b=6lQB4OeRxmnl4csgoUHnngVhhLcD03lWkH4tyPrDBhyazHF/yhQSRI+aInxUewwR1y
         jolE+J2IXG7PswfYlkjAYGO05NesRZEKWmRdJJ+hO4L8LQiMPiN0GZyPC0a/CNEkErRr
         5yUXpE29ri+Sh85WZG31H7D2ALMK9bvMwtqIJOQ9wIiA9Rl0/WsDRnayKSSRy3fZJ9JR
         VVZOJYgz7qiYvkG+qSss50NKxcJ9zGdSVrGCMoVRN56Zq846rRma7MqzAPPCfnrpFiJ5
         c6u8DiJvHiSAaar+jHfXXf7siJTonn64Hzfw7fzbZ2SA/DeT1oNiHoSU29KKMD5/GyNx
         xZMg==
X-Gm-Message-State: ACrzQf2R7fPEOPEUznzGxOg3zD95+uCajPySzR6XANT5bWgLeTEz33Ux
	zqGWA/H56ywfSsUh5sD37RlC9Du26dHu9x2n19VuUYukoQY=
X-Google-Smtp-Source: AMsMyM5utsWax+lFkefOqTvdPK9jjvYiAvbciJKxRJzGiL3NwS6C3UL6Y9x5o7EwvRn76qTubsWHNae6NfK4zFIFqF4=
X-Received: by 2002:a17:90a:f291:b0:200:acc9:422d with SMTP id
 fs17-20020a17090af29100b00200acc9422dmr2396820pjb.21.1663659721434; Tue, 20
 Sep 2022 00:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <YyR1eUfbq9aVSVXV@Air-de-Roger> <YyR7mIMh2htWkR7o@Air-de-Roger>
 <CAHsotTi=vf=6DVb0FPk5i8ncdKdEOvwYnirn+TLE-tN63_W-GA@mail.gmail.com> <Yyg0jeXc+4boQk/k@MacBook-Air-de-Roger.local>
In-Reply-To: <Yyg0jeXc+4boQk/k@MacBook-Air-de-Roger.local>
From: Adam Szewczyk <szewcson@gmail.com>
Date: Tue, 20 Sep 2022 09:41:48 +0200
Message-ID: <CAHsotTj=AEO6wECMcFcFL6oLNtnuJ4-n5+DCOsPdCGkrVHLTqA@mail.gmail.com>
Subject: Re: [BUG] problems with NICs pass through to OpenBSD guest
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000b9296e05e916f69a"

--000000000000b9296e05e916f69a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> (XEN) Built-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio
> (XEN) parameter "no-real-mode" unknown!
>  Xen 4.14.5
> (XEN) Xen version 4.14.5 (mockbuild@[unknown]) (gcc (GCC) 10.3.1 20210422
> (Red Hat 10.3.1-1)) debug=3Dn  Wed Aug 24 00:00:00 UTC 2022
> (XEN) Latest ChangeSet:
> (XEN) Bootloader: GRUB 2.04
> (XEN) Command line: placeholder console=3Dnone dom0_mem=3Dmin:1024M
> dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gnttab_max_frames=3D2048
> gnttab_max_maptrack_frames=3D4096 no-real-mode edd=3Doff
> (XEN) Xen image load base address: 0x9c200000
> (XEN) Video information:
> (XEN)  VGA is graphics mode 1920x1080, 32 bpp
> (XEN) Disc information:
> (XEN)  Found 0 MBR signatures
> (XEN)  Found 2 EDD information structures
> (XEN) EFI RAM map:
> (XEN)  [0000000000000000, 000000000009efff] (usable)
> (XEN)  [000000000009f000, 00000000000fffff] (reserved)
> (XEN)  [0000000000100000, 0000000086466fff] (usable)
> (XEN)  [0000000086467000, 0000000086d66fff] (reserved)
> (XEN)  [0000000086d67000, 000000009cf7dfff] (usable)
> (XEN)  [000000009cf7e000, 000000009e49dfff] (reserved)
> (XEN)  [000000009e49e000, 000000009eb8dfff] (ACPI NVS)
> (XEN)  [000000009eb8e000, 000000009ec0dfff] (ACPI data)
> (XEN)  [000000009ec0e000, 000000009ec0efff] (usable)
> (XEN)  [000000009ec0f000, 000000009fffffff] (reserved)
> (XEN)  [00000000e0000000, 00000000efffffff] (reserved)
> (XEN)  [00000000fe000000, 00000000fe010fff] (reserved)
> (XEN)  [00000000fed10000, 00000000fed19fff] (reserved)
> (XEN)  [00000000fed84000, 00000000fed84fff] (reserved)
> (XEN)  [00000000fee00000, 00000000fee00fff] (reserved)
> (XEN)  [00000000ff600000, 00000000ffffffff] (reserved)
> (XEN)  [0000000100000000, 000000085dffffff] (usable)
> (XEN) ACPI: RSDP 9EC0D014, 0024 (r2 LENOVO)
> (XEN) ACPI: XSDT 9EBEE188, 00FC (r1 LENOVO CB-01           1       100001=
3)
> (XEN) ACPI: FACP 9EBF1000, 010C (r5 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: DSDT 9EBBD000, 2FF34 (r2 LENOVO CB-01           1 ACPI
>  40000)
> (XEN) ACPI: FACS 9EB0D000, 0040
> (XEN) ACPI: UEFI 9EC0C000, 0236 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EC0A000, 1B1C (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EC06000, 31D0 (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: UEFI 9EC05000, 0042 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EC04000, 045A (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EC03000, 0046 (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: TPM2 9EC02000, 0034 (r3 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: POAT 9EC01000, 0055 (r3 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBFC000, 44B6 (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: LPIT 9EBFB000, 0094 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: WSMT 9EBFA000, 0028 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBF9000, 0C2F (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: DBGP 9EBF8000, 0034 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: DBG2 9EBF7000, 0061 (r0 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBF6000, 0896 (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBF3000, 2F89 (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: ASF! 9EBF2000, 00A5 (r32 LENOVO CB-01           1 ACPI
>  40000)
> (XEN) ACPI: HPET 9EBF0000, 0038 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: APIC 9EBEF000, 012C (r3 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: MCFG 9EBED000, 003C (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBBA000, 2BBF (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: DMAR 9EBB9000, 0070 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBB6000, 2B68 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: SSDT 9EBB5000, 004C (r2 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: FPDT 9EBB4000, 0044 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) ACPI: BGRT 9EBB3000, 0038 (r1 LENOVO CB-01           1 ACPI    4000=
0)
> (XEN) System RAM: 32678MB (33462392kB)
> (XEN) Domain heap initialised
> (XEN) ACPI: 32/64X FACS address mismatch in FADT -
> 9eb0d000/0000000000000000, using 32
> (XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
> (XEN) Enabling APIC mode:  Phys.  Using 1 I/O APICs
> (XEN) Switched to APIC driver x2apic_cluster
> (XEN) CPU0: TSC: ratio: 216 / 2
> (XEN) CPU0: bus: 100 MHz base: 2600 MHz max: 4500 MHz
> (XEN) CPU0: 800 ... 2600 MHz
> (XEN) xstate: size: 0x440 and states: 0x1f
> (XEN) Speculative mitigation facilities:
> (XEN)   Hardware hints: RSBA
> (XEN)   Hardware features: IBPB IBRS STIBP SSBD L1D_FLUSH MD_CLEAR
> SRBDS_CTRL
> (XEN)   Compiled-in support: INDIRECT_THUNK
> (XEN)   Xen settings: BTI-Thunk JMP, SPEC_CTRL: IBRS+ STIBP+ SSBD-, Other=
:
> SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN
> (XEN)   L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe
> address 8000000000
> (XEN)   Support for HVM VMs: MSR_SPEC_CTRL RSB EAGER_FPU MD_CLEAR
> (XEN)   Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU MD_CLEAR
> (XEN)   XPTI (64-bit PV only): Dom0 enabled, DomU enabled (with PCID)
> (XEN)   PV L1TF shadowing: Dom0 disabled, DomU enabled
> (XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)
> (XEN) Initializing Credit2 scheduler
> (XEN) Disabling HPET for being unreliable
> (XEN) Platform timer is 3.580MHz ACPI PM Timer
> (XEN) Detected 2591.999 MHz processor.
> (XEN) Unknown cachability for MFNs 0xa0-0xff
> (XEN) Unknown cachability for MFNs 0x9f000-0x9ffff
> (XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
> (XEN) Intel VT-d Snoop Control enabled.
> (XEN) Intel VT-d Dom0 DMA Passthrough not enabled.
> (XEN) Intel VT-d Queued Invalidation enabled.
> (XEN) Intel VT-d Interrupt Remapping enabled.
> (XEN) Intel VT-d Posted Interrupt not enabled.
> (XEN) Intel VT-d Shared EPT tables enabled.
> (XEN) I/O virtualisation enabled
> (XEN)  - Dom0 mode: Relaxed
> (XEN) Interrupt remapping enabled
> (XEN) Enabled directed EOI with ioapic_ack_old on!
> (XEN) ENABLING IO-APIC IRQs
> (XEN)  -> Using old ACK method
> (XEN) Allocated console ring of 32 KiB.
> (XEN) VMX: Supported advanced features:
> (XEN)  - APIC MMIO access virtualisation
> (XEN)  - APIC TPR shadow
> (XEN)  - Extended Page Tables (EPT)
> (XEN)  - Virtual-Processor Identifiers (VPID)
> (XEN)  - Virtual NMI
> (XEN)  - MSR direct-access bitmap
> (XEN)  - Unrestricted Guest
> (XEN)  - VM Functions
> (XEN)  - Virtualisation Exceptions
> (XEN)  - Page Modification Logging
> (XEN) HVM: ASIDs enabled.
> (XEN) HVM: VMX enabled
> (XEN) HVM: Hardware Assisted Paging (HAP) detected
> (XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB
> (XEN) Brought up 6 CPUs
> (XEN) Scheduling granularity: cpu, 1 CPU per sched-resource
> (XEN) Dom0 has maximum 952 PIRQs
> (XEN)  Xen  kernel: 64-bit, lsb, compat32
> (XEN)  Dom0 kernel: 64-bit, PAE, lsb, paddr 0x1000000 -> 0x4000000
> (XEN) PHYSICAL MEMORY ARRANGEMENT:
> (XEN)  Dom0 alloc.:   0000000838000000->0000000840000000 (1007932 pages t=
o
> be allocated)
> (XEN)  Init. ramdisk: 000000085c13c000->000000085dffff1d
> (XEN) VIRTUAL MEMORY ARRANGEMENT:
> (XEN)  Loaded kernel: ffffffff81000000->ffffffff84000000
> (XEN)  Init. ramdisk: 0000000000000000->0000000000000000
> (XEN)  Phys-Mach map: 0000008000000000->0000008000800000
> (XEN)  Start info:    ffffffff84000000->ffffffff840004b8
> (XEN)  Xenstore ring: 0000000000000000->0000000000000000
> (XEN)  Console ring:  0000000000000000->0000000000000000
> (XEN)  Page tables:   ffffffff84001000->ffffffff84026000
> (XEN)  Boot stack:    ffffffff84026000->ffffffff84027000
> (XEN)  TOTAL:         ffffffff80000000->ffffffff84400000
> (XEN)  ENTRY ADDRESS: ffffffff830fb1c0
> (XEN) Dom0 has maximum 6 VCPUs
> (XEN) Initial low memory virq threshold set at 0x4000 pages.
> (XEN) Scrubbing Free RAM in background
> (XEN) Std. Loglevel: Errors and warnings
> (XEN) Guest Loglevel: Nothing (Rate-limited: Errors and warnings)
> (XEN) *** Serial input to DOM0 (type 'CTRL-a' three times to switch input=
)
> (XEN) Freed 580kB init memory
> (XEN) MSI information:
> (XEN)  IOMMU  120 vec=3D30 lowest  edge   assert  log lowest dest=3D00000=
001
> mask=3D1/  /?
> (XEN)  MSI    121 vec=3Dc8 lowest  edge   assert  log lowest dest=3D00000=
001
> mask=3D0/  /?
> (XEN)  MSI    122 vec=3Dd0 lowest  edge   assert  log lowest dest=3D00000=
001
> mask=3D0/  /?
> (XEN)  MSI    123 vec=3De0 lowest  edge   assert  log lowest dest=3D00000=
001
> mask=3D0/  /?
> (XEN)  MSI    124 vec=3D31 lowest  edge   assert  log lowest dest=3D00000=
040
> mask=3D0/  /?
> (XEN)  MSI-X  125 vec=3D51 lowest  edge   assert  log lowest dest=3D00000=
040
> mask=3D1/  /0
> (XEN)  MSI-X  126 vec=3D59 lowest  edge   assert  log lowest dest=3D00000=
004
> mask=3D1/  /0
> (XEN)  MSI-X  127 vec=3D61 lowest  edge   assert  log lowest dest=3D00000=
040
> mask=3D1/  /0
> (XEN)  MSI-X  128 vec=3D69 lowest  edge   assert  log lowest dest=3D00000=
001
> mask=3D1/  /0
> (XEN)  MSI-X  129 vec=3D71 lowest  edge   assert  log lowest dest=3D00000=
010
> mask=3D1/  /0
> (XEN)  MSI-X  130 vec=3D79 lowest  edge   assert  log lowest dest=3D00000=
040
> mask=3D1/  /0
> (XEN)  MSI-X  131 vec=3D81 lowest  edge   assert  log lowest dest=3D00000=
001
> mask=3D1/  /0
> (XEN)  MSI    132 vec=3Dd9 lowest  edge   assert  log lowest dest=3D00000=
100
> mask=3D0/  /?
> (XEN)  MSI    133 vec=3Dc9 lowest  edge   assert  log lowest dest=3D00000=
004
> mask=3D0/  /?
> (XEN)  MSI    134 vec=3D99 lowest  edge   assert  log lowest dest=3D00000=
100
> mask=3D0/  /?
> (XEN)  MSI    135 vec=3Da9 lowest  edge   assert  log lowest dest=3D00000=
555
> mask=3D0/  /?
> (XEN)  MSI    136 vec=3Db1 lowest  edge   assert  log lowest dest=3D00000=
010
> mask=3D0/  /?
> (XEN)  MSI    137 vec=3Db9 lowest  edge   assert  log lowest dest=3D00000=
010
> mask=3D0/  /?
> (XEN)  MSI    138 vec=3Dd1 lowest  edge   assert  log lowest dest=3D00000=
100
> mask=3D0/  /?
> (XEN) IRQ information:
> (XEN)    IRQ:   0 vec:f0 IO-APIC-edge    status=3D000 aff:{0}/{0}
> time.c#timer_interrupt()
> (XEN)    IRQ:   1 vec:39 IO-APIC-edge    status=3D034 aff:{8}/{0-11}
> in-flight=3D0 d0:  1(---)
> (XEN)    IRQ:   3 vec:40 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:   4 vec:48 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:   5 vec:50 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:   6 vec:58 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:   7 vec:60 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:   8 vec:68 IO-APIC-edge    status=3D030 aff:{0}/{0}
> in-flight=3D0 d0:  8(---)
> (XEN)    IRQ:   9 vec:b0 IO-APIC-level   status=3D030 aff:{8}/{0-11}
> in-flight=3D0 d0:  9(---)
> (XEN)    IRQ:  10 vec:78 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:  11 vec:88 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:  12 vec:90 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:  13 vec:98 IO-APIC-edge    status=3D002 aff:{0-15}/{0} mapp=
ed,
> unbound
> (XEN)    IRQ:  14 vec:a0 IO-APIC-level   status=3D030 aff:{0}/{0}
> in-flight=3D0 d0: 14(---)
> (XEN)    IRQ:  15 vec:a8 IO-APIC-edge    status=3D002 aff:{0}/{0} mapped,
> unbound
> (XEN)    IRQ:  16 vec:b8 IO-APIC-level   status=3D030 aff:{2}/{0-11}
> in-flight=3D0 d0: 16(---),d3: 16(-M-)
> (XEN)    IRQ:  17 vec:d8 IO-APIC-level   status=3D010 aff:{10}/{0-11}
> in-flight=3D2 d0: 17(P-M),d7: 17(-MM)
> (XEN)    IRQ:  18 vec:c0 IO-APIC-level   status=3D030 aff:{8}/{0-11}
> in-flight=3D0 d0: 18(---),d3: 18(-M-)
> (XEN)    IRQ:  19 vec:a1 IO-APIC-level   status=3D002 aff:{0-15}/{0-11}
> mapped, unbound
> (XEN)    IRQ:  20 vec:e8 IO-APIC-level   status=3D030 aff:{0}/{0-11}
> in-flight=3D0 d0: 20(---)
> (XEN)    IRQ:  83 vec:41 IO-APIC-level   status=3D030 aff:{4}/{0-11}
> in-flight=3D0 d0: 83(---)
> (XEN)    IRQ: 120 vec:30 DMA_MSI         status=3D000 aff:{0-15}/{0}
> iommu.c#iommu_page_fault()
> (XEN)    IRQ: 121 vec:c8 PCI-MSI         status=3D030 aff:{0}/{0-11}
> in-flight=3D0 d0:951(---)
> (XEN)    IRQ: 122 vec:d0 PCI-MSI         status=3D030 aff:{0}/{0-11}
> in-flight=3D0 d0:950(---)
> (XEN)    IRQ: 123 vec:e0 PCI-MSI         status=3D030 aff:{0}/{0-11}
> in-flight=3D0 d0:949(---)
> (XEN)    IRQ: 124 vec:31 PCI-MSI         status=3D030 aff:{6}/{0-11}
> in-flight=3D0 d0:948(---)
> (XEN)    IRQ: 125 vec:51 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
> in-flight=3D0 d0:947(---)
> (XEN)    IRQ: 126 vec:59 PCI-MSI/-X      status=3D010 aff:{2}/{0-11}
> in-flight=3D0 d0:946(---)
> (XEN)    IRQ: 127 vec:61 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
> in-flight=3D0 d0:945(---)
> (XEN)    IRQ: 128 vec:69 PCI-MSI/-X      status=3D030 aff:{0}/{0-11}
> in-flight=3D0 d0:944(---)
> (XEN)    IRQ: 129 vec:71 PCI-MSI/-X      status=3D030 aff:{4}/{0-11}
> in-flight=3D0 d0:943(---)
> (XEN)    IRQ: 130 vec:79 PCI-MSI/-X      status=3D030 aff:{6}/{0-11}
> in-flight=3D0 d0:942(---)
> (XEN)    IRQ: 131 vec:81 PCI-MSI/-X      status=3D030 aff:{0}/{0-11}
> in-flight=3D0 d0:941(---)
> (XEN)    IRQ: 132 vec:d9 PCI-MSI         status=3D030 aff:{8}/{0-11}
> in-flight=3D0 d7:151(-M-)
> (XEN)    IRQ: 133 vec:c9 PCI-MSI         status=3D030 aff:{2}/{0-11}
> in-flight=3D0 d3:151(---)
> (XEN)    IRQ: 134 vec:99 PCI-MSI         status=3D030 aff:{8}/{0-11}
> in-flight=3D0 d0:938(---)
> (XEN)    IRQ: 135 vec:a9 PCI-MSI         status=3D002 aff:{0-15}/{0-11}
> mapped, unbound
> (XEN)    IRQ: 136 vec:b1 PCI-MSI         status=3D030 aff:{4}/{0-11}
> in-flight=3D0 d0:936(---)
> (XEN)    IRQ: 137 vec:b9 PCI-MSI         status=3D030 aff:{4}/{0-11}
> in-flight=3D0 d0:935(---)
> (XEN)    IRQ: 138 vec:d1 PCI-MSI         status=3D010 aff:{8}/{0-11}
> in-flight=3D0 d3:150(---)
> (XEN) Direct vector information:
> (XEN)    0x22 -> irq_move_cleanup_interrupt()
> (XEN)    0xf1 -> mce_intel.c#cmci_interrupt()
> (XEN)    0xf2 -> mce_intel.c#intel_thermal_interrupt()
> (XEN)    0xf9 -> pmu_apic_interrupt()
> (XEN)    0xfa -> apic_timer_interrupt()
> (XEN)    0xfb -> call_function_interrupt()
> (XEN)    0xfc -> event_check_interrupt()
> (XEN)    0xfd -> invalidate_interrupt()
> (XEN)    0xfe -> error_interrupt()
> (XEN)    0xff -> spurious_interrupt()
> (XEN) IO-APIC interrupt information:
> (XEN)     IRQ  0 Vec240:
> (XEN)       Apic 0x00, Pin  2: vec=3Df0 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  1 Vec 57:
> (XEN)       Apic 0x00, Pin  1: vec=3D39 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000100
> (XEN)     IRQ  3 Vec 64:
> (XEN)       Apic 0x00, Pin  3: vec=3D40 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  4 Vec 72:
> (XEN)       Apic 0x00, Pin  4: vec=3D48 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  5 Vec 80:
> (XEN)       Apic 0x00, Pin  5: vec=3D50 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  6 Vec 88:
> (XEN)       Apic 0x00, Pin  6: vec=3D58 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  7 Vec 96:
> (XEN)       Apic 0x00, Pin  7: vec=3D60 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  8 Vec104:
> (XEN)       Apic 0x00, Pin  8: vec=3D68 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ  9 Vec176:
> (XEN)       Apic 0x00, Pin  9: vec=3Db0 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000100
> (XEN)     IRQ 10 Vec120:
> (XEN)       Apic 0x00, Pin 10: vec=3D78 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ 11 Vec136:
> (XEN)       Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ 12 Vec144:
> (XEN)       Apic 0x00, Pin 12: vec=3D90 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ 13 Vec152:
> (XEN)       Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001
> (XEN)     IRQ 14 Vec160:
> (XEN)       Apic 0x00, Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
> (XEN)     IRQ 15 Vec168:
> (XEN)       Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001
> (XEN)     IRQ 16 Vec184:
> (XEN)       Apic 0x00, Pin 16: vec=3Db8 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000004
> (XEN)     IRQ 17 Vec216:
> (XEN)       Apic 0x00, Pin 17: vec=3Dd8 delivery=3DLoPri dest=3DL status=
=3D1
> polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000400
> (XEN)     IRQ 18 Vec192:
> (XEN)       Apic 0x00, Pin 18: vec=3Dc0 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000100
> (XEN)     IRQ 19 Vec161:
> (XEN)       Apic 0x00, Pin 19: vec=3Da1 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00000555
> (XEN)     IRQ 20 Vec232:
> (XEN)       Apic 0x00, Pin 20: vec=3De8 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001
> (XEN)     IRQ 83 Vec 65:
> (XEN)       Apic 0x00, Pin 83: vec=3D41 delivery=3DLoPri dest=3DL status=
=3D0
> polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000010


 Name                                        ID   Mem VCPUs State Time(s)
> Domain-0                                     0  4080     6     r-----
> 288.6
> sys-usb                                      3   284     2     -b----
>  20.5
> sys-usb-dm                                   4   144     1     -b----
>   3.5
> openbsd-71                                   7   511     2     -b----
>  63.0
> openbsd-71-dm                                8   144     1     -b----
>  14.0
>

How I can enable install this debug hypervisor? I have problems finding
anything about it.

I don't have logs with qemu in the name, instead I have gmp-proxy logs. But
their all looks empty.

BR Adam

pon., 19 wrz 2022 o 11:21 Roger Pau Monn=C3=A9 <roger.pau@citrix.com> napis=
a=C5=82(a):

> On Fri, Sep 16, 2022 at 05:08:59PM +0200, Adam Szewczyk wrote:
> > Sorry, I always forgot that default answer is "answer" to not "answer t=
o
> > all".
> >
> > My xl dmesg after calling those debug-keys is:
>
> Trimming the trace:
>
> > (XEN) MSI information:
>
> > (XEN)  MSI    125 vec=3D72 lowest  edge   assert  log lowest dest=3D000=
00100
> > mask=3D0/  /?
>
> > (XEN)  MSI    138 vec=3D62 lowest  edge   assert  log lowest dest=3D000=
00001
> > mask=3D0/  /?
> > (XEN)  MSI    139 vec=3D6a lowest  edge   assert  log lowest dest=3D000=
00010
> > mask=3D0/  /?
>
> > (XEN) IRQ information:
>
> > (XEN)    IRQ: 125 vec:72 PCI-MSI         status=3D030 aff:{8}/{0-11}
> > in-flight=3D0 d94:151(-M-)
>
> > (XEN)    IRQ: 138 vec:62 PCI-MSI         status=3D030 aff:{0}/{0-11}
> > in-flight=3D0 d92:151(---)
> > (XEN)    IRQ: 139 vec:6a PCI-MSI         status=3D010 aff:{4}/{0-11}
> > in-flight=3D0 d92:150(---)
>
> Was domain with ID 94 your OpenBSD box? There's another domain with
> passthrough devices (ID 92).
>
> If your OpenBSD domain is the one with ID 94 it seems like the
> interrupt source is masked, so no interrupts will be injected to the
> guest.  That however might be just the response from the guest after
> seeing that the interrupt source is not behaving correctly.
>
> Are yuo using a debug hypervisor? If not it would be helpful to do so,
> in order to maybe get more information on `xl dmesg`.
>
> Can you also paste the QEMU log for the OpeNSD domain?  Those logs are
> in /var/log/xen/qemu-dm-<domain name>.log, on most distros, not sure
> if QubesOS puts them at the same place.
>
> Regards, Roger.
>

--000000000000b9296e05e916f69a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">(XEN) Bu=
ilt-in command line: ept=3Dexec-sp spec-ctrl=3Dunpriv-mmio<br>(XEN) paramet=
er &quot;no-real-mode&quot; unknown!<br>=C2=A0Xen 4.14.5<br>(XEN) Xen versi=
on 4.14.5 (mockbuild@[unknown]) (gcc (GCC) 10.3.1 20210422 (Red Hat 10.3.1-=
1)) debug=3Dn =C2=A0Wed Aug 24 00:00:00 UTC 2022<br>(XEN) Latest ChangeSet:=
 <br>(XEN) Bootloader: GRUB 2.04<br>(XEN) Command line: placeholder console=
=3Dnone dom0_mem=3Dmin:1024M dom0_mem=3Dmax:4096M ucode=3Dscan smt=3Doff gn=
ttab_max_frames=3D2048 gnttab_max_maptrack_frames=3D4096 no-real-mode edd=
=3Doff<br>(XEN) Xen image load base address: 0x9c200000<br>(XEN) Video info=
rmation:<br>(XEN) =C2=A0VGA is graphics mode 1920x1080, 32 bpp<br>(XEN) Dis=
c information:<br>(XEN) =C2=A0Found 0 MBR signatures<br>(XEN) =C2=A0Found 2=
 EDD information structures<br>(XEN) EFI RAM map:<br>(XEN) =C2=A0[000000000=
0000000, 000000000009efff] (usable)<br>(XEN) =C2=A0[000000000009f000, 00000=
000000fffff] (reserved)<br>(XEN) =C2=A0[0000000000100000, 0000000086466fff]=
 (usable)<br>(XEN) =C2=A0[0000000086467000, 0000000086d66fff] (reserved)<br=
>(XEN) =C2=A0[0000000086d67000, 000000009cf7dfff] (usable)<br>(XEN) =C2=A0[=
000000009cf7e000, 000000009e49dfff] (reserved)<br>(XEN) =C2=A0[000000009e49=
e000, 000000009eb8dfff] (ACPI NVS)<br>(XEN) =C2=A0[000000009eb8e000, 000000=
009ec0dfff] (ACPI data)<br>(XEN) =C2=A0[000000009ec0e000, 000000009ec0efff]=
 (usable)<br>(XEN) =C2=A0[000000009ec0f000, 000000009fffffff] (reserved)<br=
>(XEN) =C2=A0[00000000e0000000, 00000000efffffff] (reserved)<br>(XEN) =C2=
=A0[00000000fe000000, 00000000fe010fff] (reserved)<br>(XEN) =C2=A0[00000000=
fed10000, 00000000fed19fff] (reserved)<br>(XEN) =C2=A0[00000000fed84000, 00=
000000fed84fff] (reserved)<br>(XEN) =C2=A0[00000000fee00000, 00000000fee00f=
ff] (reserved)<br>(XEN) =C2=A0[00000000ff600000, 00000000ffffffff] (reserve=
d)<br>(XEN) =C2=A0[0000000100000000, 000000085dffffff] (usable)<br>(XEN) AC=
PI: RSDP 9EC0D014, 0024 (r2 LENOVO)<br>(XEN) ACPI: XSDT 9EBEE188, 00FC (r1 =
LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =C2=A0 =C2=A0 =C2=A0 1000=
013)<br>(XEN) ACPI: FACP 9EBF1000, 010C (r5 LENOVO CB-01 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: DSDT 9EBBD000, =
2FF34 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=
=A040000)<br>(XEN) ACPI: FACS 9EB0D000, 0040<br>(XEN) ACPI: UEFI 9EC0C000, =
0236 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=
=A040000)<br>(XEN) ACPI: SSDT 9EC0A000, 1B1C (r2 LENOVO CB-01 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EC060=
00, 31D0 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =
=C2=A040000)<br>(XEN) ACPI: UEFI 9EC05000, 0042 (r1 LENOVO CB-01 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EC=
04000, 045A (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=
=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EC03000, 0046 (r2 LENOVO CB-01 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: TPM2=
 9EC02000, 0034 (r3 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =
=C2=A0 =C2=A040000)<br>(XEN) ACPI: POAT 9EC01000, 0055 (r3 LENOVO CB-01 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: S=
SDT 9EBFC000, 44B6 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 AC=
PI =C2=A0 =C2=A040000)<br>(XEN) ACPI: LPIT 9EBFB000, 0094 (r1 LENOVO CB-01 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI=
: WSMT 9EBFA000, 0028 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EBF9000, 0C2F (r2 LENOVO CB-=
01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) A=
CPI: DBGP 9EBF8000, 0034 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: DBG2 9EBF7000, 0061 (r0 LENOV=
O CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(X=
EN) ACPI: SSDT 9EBF6000, 0896 (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EBF3000, 2F89 (r2 LE=
NOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br=
>(XEN) ACPI: ASF! 9EBF2000, 00A5 (r32 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: HPET 9EBF0000, 0038 (r=
1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000=
)<br>(XEN) ACPI: APIC 9EBEF000, 012C (r3 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: MCFG 9EBED000, 003C=
 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040=
000)<br>(XEN) ACPI: SSDT 9EBBA000, 2BBF (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: DMAR 9EBB9000, =
0070 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=
=A040000)<br>(XEN) ACPI: SSDT 9EBB6000, 2B68 (r1 LENOVO CB-01 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: SSDT 9EBB50=
00, 004C (r2 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =
=C2=A040000)<br>(XEN) ACPI: FPDT 9EBB4000, 0044 (r1 LENOVO CB-01 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=A0 =C2=A040000)<br>(XEN) ACPI: BGRT 9EB=
B3000, 0038 (r1 LENOVO CB-01 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 ACPI =C2=
=A0 =C2=A040000)<br>(XEN) System RAM: 32678MB (33462392kB)<br>(XEN) Domain =
heap initialised<br>(XEN) ACPI: 32/64X FACS address mismatch in FADT - 9eb0=
d000/0000000000000000, using 32<br>(XEN) IOAPIC[0]: apic_id 2, version 32, =
address 0xfec00000, GSI 0-119<br>(XEN) Enabling APIC mode: =C2=A0Phys.=C2=
=A0 Using 1 I/O APICs<br>(XEN) Switched to APIC driver x2apic_cluster<br>(X=
EN) CPU0: TSC: ratio: 216 / 2<br>(XEN) CPU0: bus: 100 MHz base: 2600 MHz ma=
x: 4500 MHz<br>(XEN) CPU0: 800 ... 2600 MHz<br>(XEN) xstate: size: 0x440 an=
d states: 0x1f<br>(XEN) Speculative mitigation facilities:<br>(XEN) =C2=A0 =
Hardware hints: RSBA<br>(XEN) =C2=A0 Hardware features: IBPB IBRS STIBP SSB=
D L1D_FLUSH MD_CLEAR SRBDS_CTRL<br>(XEN) =C2=A0 Compiled-in support: INDIRE=
CT_THUNK<br>(XEN) =C2=A0 Xen settings: BTI-Thunk JMP, SPEC_CTRL: IBRS+ STIB=
P+ SSBD-, Other: SRB_LOCK+ IBPB-ctxt L1D_FLUSH VERW BRANCH_HARDEN<br>(XEN) =
=C2=A0 L1TF: believed vulnerable, maxphysaddr L1D 46, CPUID 39, Safe addres=
s 8000000000<br>(XEN) =C2=A0 Support for HVM VMs: MSR_SPEC_CTRL RSB EAGER_F=
PU MD_CLEAR<br>(XEN) =C2=A0 Support for PV VMs: MSR_SPEC_CTRL EAGER_FPU MD_=
CLEAR<br>(XEN) =C2=A0 XPTI (64-bit PV only): Dom0 enabled, DomU enabled (wi=
th PCID)<br>(XEN) =C2=A0 PV L1TF shadowing: Dom0 disabled, DomU enabled<br>=
(XEN) Using scheduler: SMP Credit Scheduler rev2 (credit2)<br>(XEN) Initial=
izing Credit2 scheduler<br>(XEN) Disabling HPET for being unreliable<br>(XE=
N) Platform timer is 3.580MHz ACPI PM Timer<br>(XEN) Detected 2591.999 MHz =
processor.<br>(XEN) Unknown cachability for MFNs 0xa0-0xff<br>(XEN) Unknown=
 cachability for MFNs 0x9f000-0x9ffff<br>(XEN) Intel VT-d iommu 0 supported=
 page sizes: 4kB, 2MB, 1GB<br>(XEN) Intel VT-d Snoop Control enabled.<br>(X=
EN) Intel VT-d Dom0 DMA Passthrough not enabled.<br>(XEN) Intel VT-d Queued=
 Invalidation enabled.<br>(XEN) Intel VT-d Interrupt Remapping enabled.<br>=
(XEN) Intel VT-d Posted Interrupt not enabled.<br>(XEN) Intel VT-d Shared E=
PT tables enabled.<br>(XEN) I/O virtualisation enabled<br>(XEN) =C2=A0- Dom=
0 mode: Relaxed<br>(XEN) Interrupt remapping enabled<br>(XEN) Enabled direc=
ted EOI with ioapic_ack_old on!<br>(XEN) ENABLING IO-APIC IRQs<br>(XEN) =C2=
=A0-&gt; Using old ACK method<br>(XEN) Allocated console ring of 32 KiB.<br=
>(XEN) VMX: Supported advanced features:<br>(XEN) =C2=A0- APIC MMIO access =
virtualisation<br>(XEN) =C2=A0- APIC TPR shadow<br>(XEN) =C2=A0- Extended P=
age Tables (EPT)<br>(XEN) =C2=A0- Virtual-Processor Identifiers (VPID)<br>(=
XEN) =C2=A0- Virtual NMI<br>(XEN) =C2=A0- MSR direct-access bitmap<br>(XEN)=
 =C2=A0- Unrestricted Guest<br>(XEN) =C2=A0- VM Functions<br>(XEN) =C2=A0- =
Virtualisation Exceptions<br>(XEN) =C2=A0- Page Modification Logging<br>(XE=
N) HVM: ASIDs enabled.<br>(XEN) HVM: VMX enabled<br>(XEN) HVM: Hardware Ass=
isted Paging (HAP) detected<br>(XEN) HVM: HAP page sizes: 4kB, 2MB, 1GB<br>=
(XEN) Brought up 6 CPUs<br>(XEN) Scheduling granularity: cpu, 1 CPU per sch=
ed-resource<br>(XEN) Dom0 has maximum 952 PIRQs<br>(XEN) =C2=A0Xen =C2=A0ke=
rnel: 64-bit, lsb, compat32<br>(XEN) =C2=A0Dom0 kernel: 64-bit, PAE, lsb, p=
addr 0x1000000 -&gt; 0x4000000<br>(XEN) PHYSICAL MEMORY ARRANGEMENT:<br>(XE=
N) =C2=A0Dom0 alloc.: =C2=A0 0000000838000000-&gt;0000000840000000 (1007932=
 pages to be allocated)<br>(XEN) =C2=A0Init. ramdisk: 000000085c13c000-&gt;=
000000085dffff1d<br>(XEN) VIRTUAL MEMORY ARRANGEMENT:<br>(XEN) =C2=A0Loaded=
 kernel: ffffffff81000000-&gt;ffffffff84000000<br>(XEN) =C2=A0Init. ramdisk=
: 0000000000000000-&gt;0000000000000000<br>(XEN) =C2=A0Phys-Mach map: 00000=
08000000000-&gt;0000008000800000<br>(XEN) =C2=A0Start info: =C2=A0 =C2=A0ff=
ffffff84000000-&gt;ffffffff840004b8<br>(XEN) =C2=A0Xenstore ring: 000000000=
0000000-&gt;0000000000000000<br>(XEN) =C2=A0Console ring: =C2=A000000000000=
00000-&gt;0000000000000000<br>(XEN) =C2=A0Page tables: =C2=A0 ffffffff84001=
000-&gt;ffffffff84026000<br>(XEN) =C2=A0Boot stack: =C2=A0 =C2=A0ffffffff84=
026000-&gt;ffffffff84027000<br>(XEN) =C2=A0TOTAL: =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 ffffffff80000000-&gt;ffffffff84400000<br>(XEN) =C2=A0ENTRY ADDRESS: fff=
fffff830fb1c0<br>(XEN) Dom0 has maximum 6 VCPUs<br>(XEN) Initial low memory=
 virq threshold set at 0x4000 pages.<br>(XEN) Scrubbing Free RAM in backgro=
und<br>(XEN) Std. Loglevel: Errors and warnings<br>(XEN) Guest Loglevel: No=
thing (Rate-limited: Errors and warnings)<br>(XEN) *** Serial input to DOM0=
 (type &#39;CTRL-a&#39; three times to switch input)<br>(XEN) Freed 580kB i=
nit memory<br>(XEN) MSI information:<br>(XEN) =C2=A0IOMMU =C2=A0120 vec=3D3=
0 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D1=
/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0121 vec=3Dc8 lowest =C2=A0edge =
=C2=A0 assert =C2=A0log lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =
=C2=A0MSI =C2=A0 =C2=A0122 vec=3Dd0 lowest =C2=A0edge =C2=A0 assert =C2=A0l=
og lowest dest=3D00000001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=
=A0123 vec=3De0 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D000=
00001 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0124 vec=3D31 lowes=
t =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000040 mask=3D0/ =C2=
=A0/?<br>(XEN) =C2=A0MSI-X =C2=A0125 vec=3D51 lowest =C2=A0edge =C2=A0 asse=
rt =C2=A0log lowest dest=3D00000040 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X=
 =C2=A0126 vec=3D59 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=
=3D00000004 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0127 vec=3D61 lowe=
st =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000040 mask=3D1/ =C2=
=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0128 vec=3D69 lowest =C2=A0edge =C2=A0 asse=
rt =C2=A0log lowest dest=3D00000001 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X=
 =C2=A0129 vec=3D71 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=
=3D00000010 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0130 vec=3D79 lowe=
st =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000040 mask=3D1/ =C2=
=A0/0<br>(XEN) =C2=A0MSI-X =C2=A0131 vec=3D81 lowest =C2=A0edge =C2=A0 asse=
rt =C2=A0log lowest dest=3D00000001 mask=3D1/ =C2=A0/0<br>(XEN) =C2=A0MSI =
=C2=A0 =C2=A0132 vec=3Dd9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest =
dest=3D00000100 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0133 vec=
=3Dc9 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000004 mask=
=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0134 vec=3D99 lowest =C2=A0ed=
ge =C2=A0 assert =C2=A0log lowest dest=3D00000100 mask=3D0/ =C2=A0/?<br>(XE=
N) =C2=A0MSI =C2=A0 =C2=A0135 vec=3Da9 lowest =C2=A0edge =C2=A0 assert =C2=
=A0log lowest dest=3D00000555 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =
=C2=A0136 vec=3Db1 lowest =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D=
00000010 mask=3D0/ =C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0137 vec=3Db9 lo=
west =C2=A0edge =C2=A0 assert =C2=A0log lowest dest=3D00000010 mask=3D0/ =
=C2=A0/?<br>(XEN) =C2=A0MSI =C2=A0 =C2=A0138 vec=3Dd1 lowest =C2=A0edge =C2=
=A0 assert =C2=A0log lowest dest=3D00000100 mask=3D0/ =C2=A0/?<br>(XEN) IRQ=
 information:<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 0 vec:f0 IO-APIC-edge =C2=
=A0 =C2=A0status=3D000 aff:{0}/{0} time.c#timer_interrupt()<br>(XEN) =C2=A0=
 =C2=A0IRQ: =C2=A0 1 vec:39 IO-APIC-edge =C2=A0 =C2=A0status=3D034 aff:{8}/=
{0-11} in-flight=3D0 d0: =C2=A01(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 3 v=
ec:40 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br=
>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 4 vec:48 IO-APIC-edge =C2=A0 =C2=A0status=
=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 5 vec:=
50 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(X=
EN) =C2=A0 =C2=A0IRQ: =C2=A0 6 vec:58 IO-APIC-edge =C2=A0 =C2=A0status=3D00=
2 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 7 vec:60 IO=
-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A0 8 vec:68 IO-APIC-edge =C2=A0 =C2=A0status=3D030 af=
f:{0}/{0} in-flight=3D0 d0: =C2=A08(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A0 =
9 vec:b0 IO-APIC-level =C2=A0 status=3D030 aff:{8}/{0-11} in-flight=3D0 d0:=
 =C2=A09(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A010 vec:78 IO-APIC-edge =C2=
=A0 =C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A011 vec:88 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A012 vec:90 IO-APIC-edge =C2=A0 =
=C2=A0status=3D002 aff:{0}/{0} mapped, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A013 vec:98 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0-15}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A014 vec:a0 IO-APIC-level =C2=A0 =
status=3D030 aff:{0}/{0} in-flight=3D0 d0: 14(---)<br>(XEN) =C2=A0 =C2=A0IR=
Q: =C2=A015 vec:a8 IO-APIC-edge =C2=A0 =C2=A0status=3D002 aff:{0}/{0} mappe=
d, unbound<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A016 vec:b8 IO-APIC-level =C2=A0 =
status=3D030 aff:{2}/{0-11} in-flight=3D0 d0: 16(---),d3: 16(-M-)<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A017 vec:d8 IO-APIC-level =C2=A0 status=3D010 aff:{10=
}/{0-11} in-flight=3D2 d0: 17(P-M),d7: 17(-MM)<br>(XEN) =C2=A0 =C2=A0IRQ: =
=C2=A018 vec:c0 IO-APIC-level =C2=A0 status=3D030 aff:{8}/{0-11} in-flight=
=3D0 d0: 18(---),d3: 18(-M-)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A019 vec:a1 IO-=
APIC-level =C2=A0 status=3D002 aff:{0-15}/{0-11} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: =C2=A020 vec:e8 IO-APIC-level =C2=A0 status=3D030 aff:{0}=
/{0-11} in-flight=3D0 d0: 20(---)<br>(XEN) =C2=A0 =C2=A0IRQ: =C2=A083 vec:4=
1 IO-APIC-level =C2=A0 status=3D030 aff:{4}/{0-11} in-flight=3D0 d0: 83(---=
)<br>(XEN) =C2=A0 =C2=A0IRQ: 120 vec:30 DMA_MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 status=3D000 aff:{0-15}/{0} iommu.c#iommu_page_fault()<br>(XEN) =C2=A0 =C2=
=A0IRQ: 121 vec:c8 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}=
/{0-11} in-flight=3D0 d0:951(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 122 vec:d0 PCI=
-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 =
d0:950(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 123 vec:e0 PCI-MSI =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:949(---)<br>(XEN) =
=C2=A0 =C2=A0IRQ: 124 vec:31 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D0=
30 aff:{6}/{0-11} in-flight=3D0 d0:948(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 125 =
vec:51 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{6}/{0-11} in-flight=
=3D0 d0:947(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 126 vec:59 PCI-MSI/-X =C2=A0 =
=C2=A0 =C2=A0status=3D010 aff:{2}/{0-11} in-flight=3D0 d0:946(---)<br>(XEN)=
 =C2=A0 =C2=A0IRQ: 127 vec:61 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 a=
ff:{6}/{0-11} in-flight=3D0 d0:945(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 128 vec:=
69 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{0}/{0-11} in-flight=3D0=
 d0:944(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 129 vec:71 PCI-MSI/-X =C2=A0 =C2=A0=
 =C2=A0status=3D030 aff:{4}/{0-11} in-flight=3D0 d0:943(---)<br>(XEN) =C2=
=A0 =C2=A0IRQ: 130 vec:79 PCI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{=
6}/{0-11} in-flight=3D0 d0:942(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 131 vec:81 P=
CI-MSI/-X =C2=A0 =C2=A0 =C2=A0status=3D030 aff:{0}/{0-11} in-flight=3D0 d0:=
941(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 132 vec:d9 PCI-MSI =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 status=3D030 aff:{8}/{0-11} in-flight=3D0 d7:151(-M-)<br>(XEN) =C2=
=A0 =C2=A0IRQ: 133 vec:c9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 =
aff:{2}/{0-11} in-flight=3D0 d3:151(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 134 vec=
:99 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{8}/{0-11} in-flig=
ht=3D0 d0:938(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 135 vec:a9 PCI-MSI =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 status=3D002 aff:{0-15}/{0-11} mapped, unbound<br>(XEN) =
=C2=A0 =C2=A0IRQ: 136 vec:b1 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D0=
30 aff:{4}/{0-11} in-flight=3D0 d0:936(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 137 =
vec:b9 PCI-MSI =C2=A0 =C2=A0 =C2=A0 =C2=A0 status=3D030 aff:{4}/{0-11} in-f=
light=3D0 d0:935(---)<br>(XEN) =C2=A0 =C2=A0IRQ: 138 vec:d1 PCI-MSI =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 status=3D010 aff:{8}/{0-11} in-flight=3D0 d3:150(---)<=
br>(XEN) Direct vector information:<br>(XEN) =C2=A0 =C2=A00x22 -&gt; irq_mo=
ve_cleanup_interrupt()<br>(XEN) =C2=A0 =C2=A00xf1 -&gt; mce_intel.c#cmci_in=
terrupt()<br>(XEN) =C2=A0 =C2=A00xf2 -&gt; mce_intel.c#intel_thermal_interr=
upt()<br>(XEN) =C2=A0 =C2=A00xf9 -&gt; pmu_apic_interrupt()<br>(XEN) =C2=A0=
 =C2=A00xfa -&gt; apic_timer_interrupt()<br>(XEN) =C2=A0 =C2=A00xfb -&gt; c=
all_function_interrupt()<br>(XEN) =C2=A0 =C2=A00xfc -&gt; event_check_inter=
rupt()<br>(XEN) =C2=A0 =C2=A00xfd -&gt; invalidate_interrupt()<br>(XEN) =C2=
=A0 =C2=A00xfe -&gt; error_interrupt()<br>(XEN) =C2=A0 =C2=A00xff -&gt; spu=
rious_interrupt()<br>(XEN) IO-APIC interrupt information:<br>(XEN) =C2=A0 =
=C2=A0 IRQ =C2=A00 Vec240:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=
=A02: vec=3Df0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 tr=
ig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A01 Vec 57:=
<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A01: vec=3D39 delivery=3D=
LoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00=
000100<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A03 Vec 64:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin =C2=A03: vec=3D40 delivery=3DLoPri dest=3DL status=3D=
0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =
=C2=A0 IRQ =C2=A04 Vec 72:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=
=A04: vec=3D48 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 tr=
ig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A05 Vec 80:=
<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A05: vec=3D50 delivery=3D=
LoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00=
000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A06 Vec 88:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin =C2=A06: vec=3D58 delivery=3DLoPri dest=3DL status=3D=
0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =
=C2=A0 IRQ =C2=A07 Vec 96:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=
=A07: vec=3D60 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 tr=
ig=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A08 Vec104:=
<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin =C2=A08: vec=3D68 delivery=3D=
LoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00=
000001<br>(XEN) =C2=A0 =C2=A0 IRQ =C2=A09 Vec176:<br>(XEN) =C2=A0 =C2=A0 =
=C2=A0 Apic 0x00, Pin =C2=A09: vec=3Db0 delivery=3DLoPri dest=3DL status=3D=
0 polarity=3D0 irr=3D0 trig=3DL mask=3D0 dest_id:00000100<br>(XEN) =C2=A0 =
=C2=A0 IRQ 10 Vec120:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 10: vec=
=3D78 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE ma=
sk=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 11 Vec136:<br>(XEN) =C2=
=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 11: vec=3D88 delivery=3DLoPri dest=3DL sta=
tus=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<br>(XEN) =
=C2=A0 =C2=A0 IRQ 12 Vec144:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 1=
2: vec=3D90 delivery=3DLoPri dest=3DL status=3D0 polarity=3D0 irr=3D0 trig=
=3DE mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 13 Vec152:<br>(XE=
N) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 13: vec=3D98 delivery=3DLoPri dest=
=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D1 dest_id:00000001<br>=
(XEN) =C2=A0 =C2=A0 IRQ 14 Vec160:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00,=
 Pin 14: vec=3Da0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0=
 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ 15 Vec168:<b=
r>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 15: vec=3Da8 delivery=3DLoPri d=
est=3DL status=3D0 polarity=3D0 irr=3D0 trig=3DE mask=3D0 dest_id:00000001<=
br>(XEN) =C2=A0 =C2=A0 IRQ 16 Vec184:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x=
00, Pin 16: vec=3Db8 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=
=3D0 trig=3DL mask=3D0 dest_id:00000004<br>(XEN) =C2=A0 =C2=A0 IRQ 17 Vec21=
6:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 17: vec=3Dd8 delivery=3DLoP=
ri dest=3DL status=3D1 polarity=3D1 irr=3D1 trig=3DL mask=3D0 dest_id:00000=
400<br>(XEN) =C2=A0 =C2=A0 IRQ 18 Vec192:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Api=
c 0x00, Pin 18: vec=3Dc0 delivery=3DLoPri dest=3DL status=3D0 polarity=3D1 =
irr=3D0 trig=3DL mask=3D0 dest_id:00000100<br>(XEN) =C2=A0 =C2=A0 IRQ 19 Ve=
c161:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 19: vec=3Da1 delivery=3D=
LoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D1 dest_id:00=
000555<br>(XEN) =C2=A0 =C2=A0 IRQ 20 Vec232:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 =
Apic 0x00, Pin 20: vec=3De8 delivery=3DLoPri dest=3DL status=3D0 polarity=
=3D1 irr=3D0 trig=3DL mask=3D0 dest_id:00000001<br>(XEN) =C2=A0 =C2=A0 IRQ =
83 Vec 65:<br>(XEN) =C2=A0 =C2=A0 =C2=A0 Apic 0x00, Pin 83: vec=3D41 delive=
ry=3DLoPri dest=3DL status=3D0 polarity=3D1 irr=3D0 trig=3DL mask=3D0 dest_=
id:00000010</blockquote><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div>=C2=A0Name =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ID =C2=A0 Mem VCPUs	State	Time(s)<br>Domain-0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0 =C2=A04080 =C2=A0 =C2=A0 6 =
=C2=A0 =C2=A0 r----- =C2=A0 =C2=A0 288.6<br>sys-usb =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03 =C2=A0 284 =C2=A0 =C2=A0 2 =C2=A0 =
=C2=A0 -b---- =C2=A0 =C2=A0 =C2=A020.5<br>sys-usb-dm =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 4 =C2=A0 144 =C2=A0 =C2=A0 1 =C2=A0 =C2=A0 -b---- =
=C2=A0 =C2=A0 =C2=A0 3.5<br>openbsd-71 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 7 =C2=A0 511 =C2=A0 =C2=A0 2 =C2=A0 =C2=A0 -b---- =C2=A0 =C2=A0 =
=C2=A063.0<br>openbsd-71-dm =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A08 =C2=A0 =
144 =C2=A0 =C2=A0 1 =C2=A0 =C2=A0 -b---- =C2=A0 =C2=A0 =C2=A014.0</div></bl=
ockquote><div><br></div><div>How I can enable install this debug hypervisor=
? I have problems finding anything about it.</div><div><br></div><div>I don=
&#39;t have logs with qemu in the name, instead I have gmp-proxy logs. But =
their all looks empty.</div><div><br></div><div>BR Adam<br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">pon., 19 w=
rz 2022 o 11:21=C2=A0Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@c=
itrix.com">roger.pau@citrix.com</a>&gt; napisa=C5=82(a):<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">On Fri, Sep 16, 2022 at 05:08:59PM=
 +0200, Adam Szewczyk wrote:<br>
&gt; Sorry, I always forgot that default answer is &quot;answer&quot; to no=
t &quot;answer to<br>
&gt; all&quot;.<br>
&gt; <br>
&gt; My xl dmesg after calling those debug-keys is:<br>
<br>
Trimming the trace:<br>
<br>
&gt; (XEN) MSI information:<br>
<br>
&gt; (XEN)=C2=A0 MSI=C2=A0 =C2=A0 125 vec=3D72 lowest=C2=A0 edge=C2=A0 =C2=
=A0assert=C2=A0 log lowest dest=3D00000100<br>
&gt; mask=3D0/=C2=A0 /?<br>
<br>
&gt; (XEN)=C2=A0 MSI=C2=A0 =C2=A0 138 vec=3D62 lowest=C2=A0 edge=C2=A0 =C2=
=A0assert=C2=A0 log lowest dest=3D00000001<br>
&gt; mask=3D0/=C2=A0 /?<br>
&gt; (XEN)=C2=A0 MSI=C2=A0 =C2=A0 139 vec=3D6a lowest=C2=A0 edge=C2=A0 =C2=
=A0assert=C2=A0 log lowest dest=3D00000010<br>
&gt; mask=3D0/=C2=A0 /?<br>
<br>
&gt; (XEN) IRQ information:<br>
<br>
&gt; (XEN)=C2=A0 =C2=A0 IRQ: 125 vec:72 PCI-MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0status=3D030 aff:{8}/{0-11}<br>
&gt; in-flight=3D0 d94:151(-M-)<br>
<br>
&gt; (XEN)=C2=A0 =C2=A0 IRQ: 138 vec:62 PCI-MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0status=3D030 aff:{0}/{0-11}<br>
&gt; in-flight=3D0 d92:151(---)<br>
&gt; (XEN)=C2=A0 =C2=A0 IRQ: 139 vec:6a PCI-MSI=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0status=3D010 aff:{4}/{0-11}<br>
&gt; in-flight=3D0 d92:150(---)<br>
<br>
Was domain with ID 94 your OpenBSD box? There&#39;s another domain with<br>
passthrough devices (ID 92).<br>
<br>
If your OpenBSD domain is the one with ID 94 it seems like the<br>
interrupt source is masked, so no interrupts will be injected to the<br>
guest.=C2=A0 That however might be just the response from the guest after<b=
r>
seeing that the interrupt source is not behaving correctly.<br>
<br>
Are yuo using a debug hypervisor? If not it would be helpful to do so,<br>
in order to maybe get more information on `xl dmesg`.<br>
<br>
Can you also paste the QEMU log for the OpeNSD domain?=C2=A0 Those logs are=
<br>
in /var/log/xen/qemu-dm-&lt;domain name&gt;.log, on most distros, not sure<=
br>
if QubesOS puts them at the same place.<br>
<br>
Regards, Roger.<br>
</blockquote></div>

--000000000000b9296e05e916f69a--

