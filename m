Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DEE56599A
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jul 2022 17:16:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.360419.589789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Nnr-0002Ui-Mk; Mon, 04 Jul 2022 15:15:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 360419.589789; Mon, 04 Jul 2022 15:15:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o8Nnr-0002SZ-Ic; Mon, 04 Jul 2022 15:15:59 +0000
Received: by outflank-mailman (input) for mailman id 360419;
 Mon, 04 Jul 2022 15:15:57 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sbiE=XJ=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1o8Nnp-0002ST-TE
 for xen-devel@lists.xen.org; Mon, 04 Jul 2022 15:15:57 +0000
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com
 [209.85.208.45]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2aec5cba-fbac-11ec-a8e4-439420d8e422;
 Mon, 04 Jul 2022 17:15:41 +0200 (CEST)
Received: by mail-ed1-f45.google.com with SMTP id x10so4750072edd.13
 for <xen-devel@lists.xen.org>; Mon, 04 Jul 2022 08:15:56 -0700 (PDT)
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
X-Inumbo-ID: 2aec5cba-fbac-11ec-a8e4-439420d8e422
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=U+JMua8CrPRyBa4VG0dbBPRYKopxilI5XUWCwNAeMlU=;
        b=3GNESfX+jM6CeAqkl6NvvDdfP86ZR6Im1Wr0vbogYEo6nhsoaVFoKZa7RBL9FP7i+P
         t12Rw7ebS0oRwf2bxFxFYUBWM3lREljlcHXYdHf6s3BJ4HTo9Sh0acbOQmWfr8+r1pAn
         JMymRUc+/Whk5MpetjZrgEqoZAc4x7dCODhd/jBrc2pinLCkO5zygJza+GhDyJSs4eNv
         zB/SS7a9miC4dc6kSe1Xnxx4WthdMaN5jcNUwd/3MYKxq1vvIjD7LNlRx5XHRMdr4ySH
         ty7qHttbFtKN6LiSrVRrc2GfU88xFwcEmrbp1PXZOWRuo07unt6yreOXWyHs9aaKn+P+
         fJOA==
X-Gm-Message-State: AJIora8AIKeXI4DCWWCpOkLFPO4atmJG2eYsr+wbWQXEeizLwXKT7Xan
	q5PHJlRlONqf87elgDGXlTUBHU8KYeA5KHdQMXUuL9Ed18Y=
X-Google-Smtp-Source: AGRyM1uqrraQ7e1NoXMfW4C0ya3iRHiOxA2A+loSHb2tXVFXc0NJcgs7qNtWsLlDldv2gN3DKR9ZUidsXhqjJuylU2E=
X-Received: by 2002:a05:6402:42cb:b0:43a:5df2:bb5d with SMTP id
 i11-20020a05640242cb00b0043a5df2bb5dmr6717831edc.36.1656947755696; Mon, 04
 Jul 2022 08:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAKhsbWb4FyqWBraid=99mfr=_wbXQHfKq6jBszN9-WmV_OiBYw@mail.gmail.com>
 <YsK3/fDX8c0Tzfv0@MacBook-Air-de-Roger.local> <CAKhsbWakmx6Bw+fJZ49pbcmRx68WWuSCpYzJDg7uiYWuEnu0qg@mail.gmail.com>
 <YsLmlIrCBt/Ldg1G@MacBook-Air-de-Roger.local> <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
In-Reply-To: <CAKhsbWZkbx8WrmuhAO3P_UxFihx_4UZHnUjrKZaFV1uwF6ifEg@mail.gmail.com>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Mon, 4 Jul 2022 23:15:44 +0800
Message-ID: <CAKhsbWbs_QZ-DN6duUKXGBsNfq0awXFbVJkdZ9SoNxa8ySkRoQ@mail.gmail.com>
Subject: Re: PCI pass-through problem for SN570 NVME SSD
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 4, 2022 at 10:51 PM G.R. <firemeteor@users.sourceforge.net> wro=
te:
>
> On Mon, Jul 4, 2022 at 9:09 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com=
> wrote:
> > >
> > > 05:00.0 Non-Volatile memory controller: Sandisk Corp Device 501a (pro=
g-if 02 [NVM Express])
> > >       Subsystem: Sandisk Corp Device 501a
> > >       Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- Par=
Err- Stepping- SERR- FastB2B- DisINTx+
> > >       Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort=
- <TAbort- <MAbort- >SERR- <PERR- INTx-
> > >       Latency: 0, Cache Line Size: 64 bytes
> > >       Interrupt: pin A routed to IRQ 16
> > >       NUMA node: 0
> > >       IOMMU group: 13
> > >       Region 0: Memory at a2600000 (64-bit, non-prefetchable) [size=
=3D16K]
> > >       Region 4: Memory at a2604000 (64-bit, non-prefetchable) [size=
=3D256]
> >
> > I think I'm slightly confused, the overlapping happens at:
> >
> > (XEN) d1: GFN 0xf3078 (0xa2616,0,5,7) -> (0xa2504,0,5,7) not permitted
> >
> > So it's MFNs 0xa2616 and 0xa2504, yet none of those are in the BAR
> > ranges of this device.
> >
> > Can you paste the lspci -vvv output for any other device you are also
> > passing through to this guest?
> >

As reminded by this request, I tried to assign this nvme device to
another FreeBSD12 domU.
This time it does not fail at the VM setup stage, but the device is
still not usable at the domU.
The nvmecontrol command is not able to talk to the device at all:
nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0
nvme0: IDENTIFY (06) sqid:0 cid:0 nsid:0 cdw10:00000001 cdw11:00000000
nvme0: ABORTED - BY REQUEST (00/07) sqid:0 cid:0 cdw0:0

The QEMU log says the following:
00:05.0] Write-back to unknown field 0x09 (partially) inhibited (0x00)
[00:05.0] If the device doesn't work, try enabling permissive mode
[00:05.0] (unsafe) and if it helps report the problem to xen-devel
[00:05.0] msi_msix_setup: Error: Mapping of MSI-X (err: 61, vec: 0x30, entr=
y 0)

xl dmesg says the following:
(XEN) d[IO]: assign (0000:05:00.0) failed (-16)
(XEN) HVM d5v0 save: CPU
(XEN) HVM d5v1 save: CPU
(XEN) HVM d5v2 save: CPU
(XEN) HVM d5v3 save: CPU
(XEN) HVM d5 save: PIC
(XEN) HVM d5 save: IOAPIC
(XEN) HVM d5v0 save: LAPIC
(XEN) HVM d5v1 save: LAPIC
(XEN) HVM d5v2 save: LAPIC
(XEN) HVM d5v3 save: LAPIC
(XEN) HVM d5v0 save: LAPIC_REGS
(XEN) HVM d5v1 save: LAPIC_REGS
(XEN) HVM d5v2 save: LAPIC_REGS
(XEN) HVM d5v3 save: LAPIC_REGS
(XEN) HVM d5 save: PCI_IRQ
(XEN) HVM d5 save: ISA_IRQ
(XEN) HVM d5 save: PCI_LINK
(XEN) HVM d5 save: PIT
(XEN) HVM d5 save: RTC
(XEN) HVM d5 save: HPET
(XEN) HVM d5 save: PMTIMER
(XEN) HVM d5v0 save: MTRR
(XEN) HVM d5v1 save: MTRR
(XEN) HVM d5v2 save: MTRR
(XEN) HVM d5v3 save: MTRR
(XEN) HVM d5 save: VIRIDIAN_DOMAIN
(XEN) HVM d5v0 save: CPU_XSAVE
(XEN) HVM d5v1 save: CPU_XSAVE
(XEN) HVM d5v2 save: CPU_XSAVE
(XEN) HVM d5v3 save: CPU_XSAVE
(XEN) HVM d5v0 save: VIRIDIAN_VCPU
(XEN) HVM d5v1 save: VIRIDIAN_VCPU
(XEN) HVM d5v2 save: VIRIDIAN_VCPU
(XEN) HVM d5v3 save: VIRIDIAN_VCPU
(XEN) HVM d5v0 save: VMCE_VCPU
(XEN) HVM d5v1 save: VMCE_VCPU
(XEN) HVM d5v2 save: VMCE_VCPU
(XEN) HVM d5v3 save: VMCE_VCPU
(XEN) HVM d5v0 save: TSC_ADJUST
(XEN) HVM d5v1 save: TSC_ADJUST
(XEN) HVM d5v2 save: TSC_ADJUST
(XEN) HVM d5v3 save: TSC_ADJUST
(XEN) HVM d5v0 save: CPU_MSR
(XEN) HVM d5v1 save: CPU_MSR
(XEN) HVM d5v2 save: CPU_MSR
(XEN) HVM d5v3 save: CPU_MSR
(XEN) HVM5 restore: CPU 0
(XEN) d5: bind: m_gsi=3D16 g_gsi=3D36 dev=3D00.00.5 intx=3D0
(d5) HVM Loader
(d5) Detected Xen v4.14.3
(d5) Xenbus rings @0xfeffc000, event channel 1
(d5) System requested SeaBIOS
(d5) CPU speed is 3505 MHz
(d5) Relocating guest memory for lowmem MMIO space disabled
(d5) PCI-ISA link 0 routed to IRQ5
(d5) PCI-ISA link 1 routed to IRQ10
(d5) PCI-ISA link 2 routed to IRQ11
(d5) PCI-ISA link 3 routed to IRQ5
(d5) pci dev 01:3 INTA->IRQ10
(d5) pci dev 02:0 INTA->IRQ11
(d5) pci dev 04:0 INTA->IRQ5
(d5) pci dev 05:0 INTA->IRQ10
(d5) No RAM in high memory; setting high_mem resource base to 100000000
(d5) pci dev 03:0 bar 10 size 002000000: 0f0000008
(d5) pci dev 02:0 bar 14 size 001000000: 0f2000008
(d5) pci dev 04:0 bar 30 size 000040000: 0f3000000
(d5) pci dev 04:0 bar 10 size 000020000: 0f3040000
(d5) pci dev 03:0 bar 30 size 000010000: 0f3060000
(d5) pci dev 05:0 bar 10 size 000004000: 0f3070004
(d5) pci dev 03:0 bar 14 size 000001000: 0f3074000
(d5) pci dev 02:0 bar 10 size 000000100: 00000c001
(d5) pci dev 05:0 bar 20 size 000000100: 0f3075004
(d5) pci dev 04:0 bar 14 size 000000040: 00000c101
(d5) pci dev 01:1 bar 20 size 000000010: 00000c141
(XEN) memory_map:add: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:add: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(d5) Multiprocessor initialisation:
(d5)  - CPU0 ... 39-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d5)  - CPU1 ... 39-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d5)  - CPU2 ... 39-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d5)  - CPU3 ... 39-bit phys ... fixed MTRRs ... var MTRRs [1/8] ... done.
(d5) Writing SMBIOS tables ...
(d5) Loading SeaBIOS ...
(d5) Creating MP tables ...
(d5) Loading ACPI ...
(d5) vm86 TSS at fc100300
(d5) BIOS map:
(d5)  10000-100e3: Scratch space
(d5)  c0000-fffff: Main BIOS
(d5) E820 table:
(d5)  [00]: 00000000:00000000 - 00000000:000a0000: RAM
(d5)  HOLE: 00000000:000a0000 - 00000000:000c0000
(d5)  [01]: 00000000:000c0000 - 00000000:00100000: RESERVED
(d5)  [02]: 00000000:00100000 - 00000000:7f800000: RAM
(d5)  HOLE: 00000000:7f800000 - 00000000:fc000000
(d5)  [03]: 00000000:fc000000 - 00000000:fc00b000: NVS
(d5)  [04]: 00000000:fc00b000 - 00000001:00000000: RESERVED
(d5) Invoking SeaBIOS ...
(d5) SeaBIOS (version rel-1.13.0-1-gd542924-Xen)
(d5) BUILD: gcc: (Debian 11.2.0-13) 11.2.0 binutils: (GNU Binutils for
Debian) 2.37
(d5)
(d5) Found Xen hypervisor signature at 40000000
(XEN) memory_map:remove: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:remove: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:add: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:remove: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:add: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:remove: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:add: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:remove: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:remove: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3070 mfn=3Da2500 nr=3D2
(XEN) memory_map:add: dom5 gfn=3Df3073 mfn=3Da2503 nr=3D1
(XEN) memory_map:add: dom5 gfn=3Df3075 mfn=3Da2504 nr=3D1

