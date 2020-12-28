Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F54D2E69F2
	for <lists+xen-devel@lfdr.de>; Mon, 28 Dec 2020 19:11:01 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59553.104544 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwyV-0003ad-Hy; Mon, 28 Dec 2020 18:10:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59553.104544; Mon, 28 Dec 2020 18:10:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ktwyV-0003aD-Dy; Mon, 28 Dec 2020 18:10:31 +0000
Received: by outflank-mailman (input) for mailman id 59553;
 Mon, 28 Dec 2020 18:08:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=H/to=GA=gmail.com=obalaz85@srs-us1.protection.inumbo.net>)
 id 1ktwwa-0002qU-Os
 for xen-devel@lists.xenproject.org; Mon, 28 Dec 2020 18:08:32 +0000
Received: from mail-wm1-f53.google.com (unknown [209.85.128.53])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 596fc759-5d05-4068-b714-1378bb6384d6;
 Mon, 28 Dec 2020 18:08:31 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c133so91771wme.4
 for <xen-devel@lists.xenproject.org>; Mon, 28 Dec 2020 10:08:31 -0800 (PST)
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
X-Inumbo-ID: 596fc759-5d05-4068-b714-1378bb6384d6
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=Kta5IartLP/8dxe1dhpSNV4aATyrsPJh2h6ciKZbwi4=;
        b=q+J6TJSKxJ3JVQfvownQnCBJpryK6wuCUjzt+TMyCPlpxNJHUZGCqwGyMNgWYydEOs
         i5S3SFu/u12d57zgrHjp/uiqMQqHe5r/EHmqVcQUscGUf32cbjPvkTCiGzwYxa8h2dkT
         CAPzLXQQxeJSA/+5Gt7BRqlkqod/CIHZXHThVFg8zWPisaQQ0Zih+e/E4BIaXZtfVmcx
         SkFj/lILcbistWCW2Ky/SPdxORau8oI5ledlXbHp8uRE8j8gVyK38X2zanivo/0skmeu
         2FDial8Hu7YP9N3VZojUUi5tEVf1BFd8f/T0dpCfClMPGp3MZf9XzC1EBfaw2vy2lXRq
         ZkCA==
X-Gm-Message-State: AOAM533svKpxCNcVZdlUrOsF7DfCM9tGJt83sEMCXarnoK79gEhGCrF9
	x1aZZXNRsOkwrodWokuRye4IDhnd/f6+ypnGPAcevkV0i9CrDQ==
X-Google-Smtp-Source: ABdhPJxeDdm8S7ubobUlEgfUUeg8dRtjmezYGG9LDKX+DsP7fTijQljfo+HlTrelr9h1ebJ2p2PWgOhKpezEppIz7Gw=
X-Received: by 2002:a1c:5402:: with SMTP id i2mr122421wmb.12.1609178910124;
 Mon, 28 Dec 2020 10:08:30 -0800 (PST)
MIME-Version: 1.0
From: Ondrej Balaz <blami@blami.net>
Date: Tue, 29 Dec 2020 03:08:19 +0900
Message-ID: <CACmg6stNxXu3-SFdK_WtREbL2i7N522-DRRVr1ZXVOTqZ9j02Q@mail.gmail.com>
Subject: [BUG] Unable to boot Xen 4.11 (shipped with Ubuntu) on Intel 10i3 CPU
To: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000516d4a05b78a2920"

--000000000000516d4a05b78a2920
Content-Type: text/plain; charset="UTF-8"

Hi,
I recently updated my home server running Ubuntu 20.04 (Focal) with Xen
hypervisor 4.11 (installed using Ubuntu packages). Before the upgrade all
was running fine and both dom0 and all domUs were booting fine. Upgrade was
literally taking harddrive from 6th gen Intel CPU system to 10th gen Intel
CPU one and redoing EFI entries from Ubuntu live USB.

After doing so standalone Ubuntu (without Xen multiboot) boots just fine
but Ubuntu as dom0 with Xen fails pretty early on with following error
(hand-copied from phone snaps I took with loglvl=all as this is barebone
system without serial port and I don't know how to dump full logs in case
of panic):

(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[01])
(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
(XEN) ACPI: IRQ0 used by override.
(XEN) ACPI: IRQ2 used by override
(XEN) ACPI: IRQ9 used by override
(XEN) Enabling APIC mode: Flat.  Using 1 I/O APICs
(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
(XEN) ERST table was not found
(XEN) ACPI: BGRT: invalidating v1 image at 0x7d7c1018
(XEN) Using ACPI (MADT) for SMP configuration information
...
(XEN) Switched to APIC driver x2apic_cluster
...
(XEN) Initing memory sharing.
(XEN) alt table ffff82d08042b840 -> ffff82d08042d7ce
...
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB.
(XEN) Intel VT-d Snoop Control not enabled
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled
(XEN) Intel VT-d Queued Invalidation enabled
(XEN) Intel VT-d Interrupt Remapping enabled
(XEN) Intel VT-d Posted Interrupt not enabled
(XEN) Intel VT-d Shared EPT tables enabled
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled
(XEN) nr_sockets: 1
(XEN) Enabled directed EOI with ioapic_ack_old on!
(XEN) ENABLING IO-APIC IRQs
(XEN)  -> Using old ACK method
(XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
(XEN) ..MP-BIOS bug: 8254 timer not connected to IO-APIC
(XEN) ...trying to set up timer (IRQ0) through the 8259A ... failed.
(XEN) ...trying to set up timer as Virtual Wire IRQ... failed.
(XEN) ...trying to set up timer as ExtINT IRQ...spurious 8259A interrupt
IRQ7.
(XEN) CPU0: No irq handler for vector e7 (IRQ -8)
(XEN) IRQ7 a=0001[0001,0000] v=60[ffffffff] t=IO-APIC-edge s=00000002
(XEN)  failed :(.
(XEN)
(XEN) *******************************
(XEN) Panic on CPU 0:
(XEN) IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug and
send report.  Then try booting with the `noapic` option
(XEN) *******************************

I suspected that migration of drive could cause problem so I took an empty
SSD and installed fresh Ubuntu and added Xen hypervisor, after reboot I
ended up with same panic. I tried booting with noapic (gave general page
fault) and iommu=0 (said it needs iommu=required/force). Trying to boot
this exact fresh install on older (6th gen) Intel CPU succeeded. I happen
to have access to one more system with 10th gen Intel CPUs (Lenovo laptop)
and no luck booting Xen there too and same panic in the end.

Back to my barebone I tried to match BIOS settings between working and
non-working but it didn't help. Virtualization is enabled, both systems are
from the same maker (Intel NUC barebones), both systems are EFI
enabled/secure boot disabled (the later one doesn't seem to have an option
to disable EFI boot and boot using MBR).

Is this something known? Are there any boot options that can potentially
fix this?

Any help (including how to dump full Xen boot logs without serial)
appreciated.

Thanks,
Ondrej

--000000000000516d4a05b78a2920
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br>I recently updated my home server running Ubuntu 20=
.04 (Focal) with Xen hypervisor 4.11 (installed using Ubuntu packages). Bef=
ore the upgrade all was running fine and both dom0 and all domUs were booti=
ng fine. Upgrade was literally taking harddrive from 6th gen Intel CPU syst=
em to 10th gen Intel CPU one and redoing EFI entries from Ubuntu live USB.<=
br><br>After doing so standalone Ubuntu (without Xen multiboot) boots just =
fine but Ubuntu as dom0 with Xen fails pretty early on with following error=
 (hand-copied from phone snaps I took with loglvl=3Dall as this is barebone=
 system without serial port and I don&#39;t know how to dump full logs in c=
ase of panic):<br><br>(XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_=
base[01])<br>(XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GS=
I 0-119<br>(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)<b=
r>(XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)<br>(XEN=
) ACPI: IRQ0 used by override.<br>

(XEN) ACPI: IRQ2 used by override=C2=A0<div>

(XEN) ACPI: IRQ9 used by override<br>(XEN) Enabling APIC mode: Flat.=C2=A0 =
Using 1 I/O APICs<br>(XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000<br>(X=
EN) ERST table was not found<br>(XEN) ACPI: BGRT: invalidating v1 image at =
0x7d7c1018<br>(XEN) Using ACPI (MADT) for SMP configuration information<br>=
...<br>(XEN) Switched to APIC driver x2apic_cluster<br>...=C2=A0=C2=A0<br>(=
XEN) Initing memory sharing.</div><div>(XEN) alt table ffff82d08042b840 -&g=
t; ffff82d08042d7ce<br>...<br>(XEN) Intel VT-d iommu 0 supported page sizes=
: 4kB, 2MB, 1GB.</div><div>(XEN) Intel VT-d iommu 1 supported page sizes: 4=
kB, 2MB, 1GB.<br>(XEN) Intel VT-d Snoop Control not enabled=C2=A0<br>(XEN) =
Intel VT-d Dom0 DMA Passthrough not enabled=C2=A0<br>(XEN) Intel VT-d Queue=
d Invalidation enabled=C2=A0<br>

(XEN) Intel VT-d Interrupt Remapping enabled<br>

(XEN) Intel VT-d Posted Interrupt not enabled=C2=A0=C2=A0<br>

(XEN) Intel VT-d Shared EPT tables enabled<br>(XEN) I/O virtualisation enab=
led<br>

(XEN)=C2=A0 - Dom0 mode: Relaxed<br>(XEN) Interrupt remapping enabled<br>(X=
EN) nr_sockets: 1<br>(XEN) Enabled directed EOI with ioapic_ack_old on!<br>=
(XEN) ENABLING IO-APIC IRQs<br>(XEN)=C2=A0 -&gt; Using old ACK method<br>(X=
EN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1<br>(XEN)=
 ..MP-BIOS bug: 8254 timer not connected to IO-APIC<br>(XEN) ...trying to s=
et up timer (IRQ0) through the 8259A ... failed.<br>(XEN) ...trying to set =
up timer as Virtual Wire IRQ... failed.<br>(XEN) ...trying to set up timer =
as ExtINT IRQ...spurious 8259A interrupt IRQ7.<br>(XEN) CPU0: No irq handle=
r for vector e7 (IRQ -8)<br>(XEN) IRQ7 a=3D0001[0001,0000] v=3D60[ffffffff]=
 t=3DIO-APIC-edge s=3D00000002<br>(XEN)=C2=A0 failed :(.<br>(XEN)<br>(XEN) =
*******************************<br>(XEN) Panic on CPU 0:<br>(XEN) IO-APIC=
=C2=A0+ timer doesn&#39;t work!=C2=A0 Boot with apic_verbosity=3Ddebug and =
send report.=C2=A0 Then try booting with the `noapic` option<br>(XEN) *****=
**************************<br><br>I suspected that migration of drive could=
 cause problem so I took an empty SSD and installed fresh Ubuntu and added =
Xen hypervisor, after reboot I ended up with same panic. I tried booting wi=
th noapic (gave general page fault) and iommu=3D0 (said it needs iommu=3Dre=
quired/force). Trying to boot this exact fresh install on older (6th gen) I=
ntel CPU succeeded. I happen to have access to one more system with 10th ge=
n Intel CPUs (Lenovo laptop) and no luck booting Xen there too and same pan=
ic in the end.<br><br>Back to my barebone I tried to match BIOS settings be=
tween working and non-working but it didn&#39;t help. Virtualization is ena=
bled, both systems are from the same maker (Intel NUC barebones), both syst=
ems are EFI enabled/secure boot disabled (the later one doesn&#39;t seem to=
 have an option to disable EFI boot and boot using MBR).<br><br>Is this som=
ething known? Are there any boot options that can potentially fix this?<br>=
<br>Any help (including how to dump full Xen boot logs without serial) appr=
eciated.<br><br>Thanks,<br>Ondrej=C2=A0</div></div>

--000000000000516d4a05b78a2920--

