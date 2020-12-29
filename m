Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 551A72E6DD6
	for <lists+xen-devel@lfdr.de>; Tue, 29 Dec 2020 06:02:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.59660.104716 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ku78k-0000QV-0x; Tue, 29 Dec 2020 05:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 59660.104716; Tue, 29 Dec 2020 05:01:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ku78j-0000Q6-Ta; Tue, 29 Dec 2020 05:01:45 +0000
Received: by outflank-mailman (input) for mailman id 59660;
 Tue, 29 Dec 2020 05:01:44 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=py5/=GB=gmail.com=obalaz85@srs-us1.protection.inumbo.net>)
 id 1ku78i-0000Q1-DQ
 for xen-devel@lists.xenproject.org; Tue, 29 Dec 2020 05:01:44 +0000
Received: from mail-pj1-f47.google.com (unknown [209.85.216.47])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id dd259b3e-f815-4ff1-bac8-cb4abfc259a5;
 Tue, 29 Dec 2020 05:01:42 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id m5so908923pjv.5
 for <xen-devel@lists.xenproject.org>; Mon, 28 Dec 2020 21:01:42 -0800 (PST)
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
X-Inumbo-ID: dd259b3e-f815-4ff1-bac8-cb4abfc259a5
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A5ftFIaw22N/OwluJNptEt3v5S8n6hXob6Vg4193/U4=;
        b=mlrT0F8LyTUpvCD3U+UedkmE3Np16pmz0w0tWEH11i6Nh24zENTe6/ZS/FlFemY9P7
         a/scmkhB20FCK0R/c0qmxmo2oZM0lfFYBz6lGDQShv5VSjWqhURIVPO1iuEVh9H7Gd1j
         QXwNBTTXemMl+695p79NtgHYutAGfH064gTtXQ4/YT1DpBCv4rTY0sHgtM/Uy8KYMiV7
         E6tEvZvkXNPfWQ54sRai/kegJ+n1QsjkKLsVUsDWMP9QbvX/oq/JnuNC/jHCM5nUMzhr
         ZXiE14CRKZvIG33TOyUuzgbb7Q2Cn8faIHiig3UC47i8OBzG6zVughMFjB5WjuE6kBLs
         JuIQ==
X-Gm-Message-State: AOAM530lOV3NIWaE6W21EgNch1i3s8LbUqCPg123V8kdKx0kBROsuvuB
	So1n5xkZAKMJzE1TrMCXqc5XhE336E/siXZXgSo=
X-Google-Smtp-Source: ABdhPJyFdD5NLyGV2pbJ38UOrplAnL05jzGOCLzYM+EpXhsZeP3hsg2ngT7Zri46h7/EQSh5lYSQB/Y4MWvrAeS2ii8=
X-Received: by 2002:a17:90a:c20b:: with SMTP id e11mr2313777pjt.43.1609218101768;
 Mon, 28 Dec 2020 21:01:41 -0800 (PST)
MIME-Version: 1.0
References: <CACmg6stNxXu3-SFdK_WtREbL2i7N522-DRRVr1ZXVOTqZ9j02Q@mail.gmail.com>
 <f3346d45-e8d5-5b37-a9df-f410af54469f@citrix.com>
In-Reply-To: <f3346d45-e8d5-5b37-a9df-f410af54469f@citrix.com>
From: Ondrej Balaz <blami@blami.net>
Date: Tue, 29 Dec 2020 14:01:31 +0900
Message-ID: <CACmg6stadwW8ZHm118QtQRKP=kopHULm3QQLsS6-AdVF9wt3RQ@mail.gmail.com>
Subject: Re: [BUG] Unable to boot Xen 4.11 (shipped with Ubuntu) on Intel 10i3 CPU
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="0000000000005276c305b79349fe"

--0000000000005276c305b79349fe
Content-Type: text/plain; charset="UTF-8"

Thanks for explanation! I'll stick with older HW until this is out.

On Tue, 29 Dec 2020 at 03:49, Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 28/12/2020 18:08, Ondrej Balaz wrote:
> > Hi,
> > I recently updated my home server running Ubuntu 20.04 (Focal) with
> > Xen hypervisor 4.11 (installed using Ubuntu packages). Before the
> > upgrade all was running fine and both dom0 and all domUs were booting
> > fine. Upgrade was literally taking harddrive from 6th gen Intel CPU
> > system to 10th gen Intel CPU one and redoing EFI entries from Ubuntu
> > live USB.
> >
> > After doing so standalone Ubuntu (without Xen multiboot) boots just
> > fine but Ubuntu as dom0 with Xen fails pretty early on with following
> > error (hand-copied from phone snaps I took with loglvl=all as this is
> > barebone system without serial port and I don't know how to dump full
> > logs in case of panic):
> >
> > (XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[01])
> > (XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119
> > (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> > (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> > (XEN) ACPI: IRQ0 used by override.
> > (XEN) ACPI: IRQ2 used by override
> > (XEN) ACPI: IRQ9 used by override
> > (XEN) Enabling APIC mode: Flat.  Using 1 I/O APICs
> > (XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000
> > (XEN) ERST table was not found
> > (XEN) ACPI: BGRT: invalidating v1 image at 0x7d7c1018
> > (XEN) Using ACPI (MADT) for SMP configuration information
> > ...
> > (XEN) Switched to APIC driver x2apic_cluster
> > ...
> > (XEN) Initing memory sharing.
> > (XEN) alt table ffff82d08042b840 -> ffff82d08042d7ce
> > ...
> > (XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.
> > (XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB.
> > (XEN) Intel VT-d Snoop Control not enabled
> > (XEN) Intel VT-d Dom0 DMA Passthrough not enabled
> > (XEN) Intel VT-d Queued Invalidation enabled
> > (XEN) Intel VT-d Interrupt Remapping enabled
> > (XEN) Intel VT-d Posted Interrupt not enabled
> > (XEN) Intel VT-d Shared EPT tables enabled
> > (XEN) I/O virtualisation enabled
> > (XEN)  - Dom0 mode: Relaxed
> > (XEN) Interrupt remapping enabled
> > (XEN) nr_sockets: 1
> > (XEN) Enabled directed EOI with ioapic_ack_old on!
> > (XEN) ENABLING IO-APIC IRQs
> > (XEN)  -> Using old ACK method
> > (XEN) ..TIMER: vector=0xF0 apic1=0 pin1=2 apic2=-1 pin2=-1
> > (XEN) ..MP-BIOS bug: 8254 timer not connected to IO-APIC
> > (XEN) ...trying to set up timer (IRQ0) through the 8259A ... failed.
> > (XEN) ...trying to set up timer as Virtual Wire IRQ... failed.
> > (XEN) ...trying to set up timer as ExtINT IRQ...spurious 8259A
> > interrupt IRQ7.
> > (XEN) CPU0: No irq handler for vector e7 (IRQ -8)
> > (XEN) IRQ7 a=0001[0001,0000] v=60[ffffffff] t=IO-APIC-edge s=00000002
> > (XEN)  failed :(.
> > (XEN)
> > (XEN) *******************************
> > (XEN) Panic on CPU 0:
> > (XEN) IO-APIC + timer doesn't work!  Boot with apic_verbosity=debug
> > and send report.  Then try booting with the `noapic` option
> > (XEN) *******************************
> >
> > I suspected that migration of drive could cause problem so I took an
> > empty SSD and installed fresh Ubuntu and added Xen hypervisor, after
> > reboot I ended up with same panic. I tried booting with noapic (gave
> > general page fault) and iommu=0 (said it needs iommu=required/force).
> > Trying to boot this exact fresh install on older (6th gen) Intel CPU
> > succeeded. I happen to have access to one more system with 10th gen
> > Intel CPUs (Lenovo laptop) and no luck booting Xen there too and same
> > panic in the end.
> >
> > Back to my barebone I tried to match BIOS settings between working and
> > non-working but it didn't help. Virtualization is enabled, both
> > systems are from the same maker (Intel NUC barebones), both systems
> > are EFI enabled/secure boot disabled (the later one doesn't seem to
> > have an option to disable EFI boot and boot using MBR).
> >
> > Is this something known? Are there any boot options that can
> > potentially fix this?
> >
> > Any help (including how to dump full Xen boot logs without serial)
> > appreciated.
>
> Yes we're aware of it.  It is because modern Intel systems no longer
> have a legacy PIT configured by default, and Xen depends on this.  (The
> error message is misleading.  It's not checking for a timer, so much as
> checking that interrupts works, and depends on the legacy PIT "working"
> as the source of interrupts.)
>
> I'm working on a fix.
>
> ~Andrew
>

--0000000000005276c305b79349fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for explanation! I&#39;ll stick with older HW until=
 this is out.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, 29 Dec 2020 at 03:49, Andrew Cooper &lt;<a href=3D"mai=
lto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 28/12/2020 18:08=
, Ondrej Balaz wrote:<br>
&gt; Hi,<br>
&gt; I recently updated my home server running Ubuntu 20.04 (Focal) with<br=
>
&gt; Xen hypervisor 4.11 (installed using Ubuntu packages). Before the<br>
&gt; upgrade all was running fine and both dom0 and all domUs were booting<=
br>
&gt; fine. Upgrade was literally taking harddrive from 6th gen Intel CPU<br=
>
&gt; system to 10th gen Intel CPU one and redoing EFI entries from Ubuntu<b=
r>
&gt; live USB.<br>
&gt;<br>
&gt; After doing so standalone Ubuntu (without Xen multiboot) boots just<br=
>
&gt; fine but Ubuntu as dom0 with Xen fails pretty early on with following<=
br>
&gt; error (hand-copied from phone snaps I took with loglvl=3Dall as this i=
s<br>
&gt; barebone system without serial port and I don&#39;t know how to dump f=
ull<br>
&gt; logs in case of panic):<br>
&gt;<br>
&gt; (XEN) ACPI: IOAPIC (id[0x02] address[0xfec00000] gsi_base[01])<br>
&gt; (XEN) IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-119<=
br>
&gt; (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)<br>
&gt; (XEN) ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)<br>
&gt; (XEN) ACPI: IRQ0 used by override.<br>
&gt; (XEN) ACPI: IRQ2 used by override=C2=A0<br>
&gt; (XEN) ACPI: IRQ9 used by override<br>
&gt; (XEN) Enabling APIC mode: Flat.=C2=A0 Using 1 I/O APICs<br>
&gt; (XEN) ACPI: HPET id: 0x8086a201 base: 0xfed00000<br>
&gt; (XEN) ERST table was not found<br>
&gt; (XEN) ACPI: BGRT: invalidating v1 image at 0x7d7c1018<br>
&gt; (XEN) Using ACPI (MADT) for SMP configuration information<br>
&gt; ...<br>
&gt; (XEN) Switched to APIC driver x2apic_cluster<br>
&gt; ...=C2=A0=C2=A0<br>
&gt; (XEN) Initing memory sharing.<br>
&gt; (XEN) alt table ffff82d08042b840 -&gt; ffff82d08042d7ce<br>
&gt; ...<br>
&gt; (XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB.<br>
&gt; (XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB.<br>
&gt; (XEN) Intel VT-d Snoop Control not enabled=C2=A0<br>
&gt; (XEN) Intel VT-d Dom0 DMA Passthrough not enabled=C2=A0<br>
&gt; (XEN) Intel VT-d Queued Invalidation enabled=C2=A0<br>
&gt; (XEN) Intel VT-d Interrupt Remapping enabled<br>
&gt; (XEN) Intel VT-d Posted Interrupt not enabled=C2=A0=C2=A0<br>
&gt; (XEN) Intel VT-d Shared EPT tables enabled<br>
&gt; (XEN) I/O virtualisation enabled<br>
&gt; (XEN)=C2=A0 - Dom0 mode: Relaxed<br>
&gt; (XEN) Interrupt remapping enabled<br>
&gt; (XEN) nr_sockets: 1<br>
&gt; (XEN) Enabled directed EOI with ioapic_ack_old on!<br>
&gt; (XEN) ENABLING IO-APIC IRQs<br>
&gt; (XEN)=C2=A0 -&gt; Using old ACK method<br>
&gt; (XEN) ..TIMER: vector=3D0xF0 apic1=3D0 pin1=3D2 apic2=3D-1 pin2=3D-1<b=
r>
&gt; (XEN) ..MP-BIOS bug: 8254 timer not connected to IO-APIC<br>
&gt; (XEN) ...trying to set up timer (IRQ0) through the 8259A ... failed.<b=
r>
&gt; (XEN) ...trying to set up timer as Virtual Wire IRQ... failed.<br>
&gt; (XEN) ...trying to set up timer as ExtINT IRQ...spurious 8259A<br>
&gt; interrupt IRQ7.<br>
&gt; (XEN) CPU0: No irq handler for vector e7 (IRQ -8)<br>
&gt; (XEN) IRQ7 a=3D0001[0001,0000] v=3D60[ffffffff] t=3DIO-APIC-edge s=3D0=
0000002<br>
&gt; (XEN)=C2=A0 failed :(.<br>
&gt; (XEN)<br>
&gt; (XEN) *******************************<br>
&gt; (XEN) Panic on CPU 0:<br>
&gt; (XEN) IO-APIC=C2=A0+ timer doesn&#39;t work!=C2=A0 Boot with apic_verb=
osity=3Ddebug<br>
&gt; and send report.=C2=A0 Then try booting with the `noapic` option<br>
&gt; (XEN) *******************************<br>
&gt;<br>
&gt; I suspected that migration of drive could cause problem so I took an<b=
r>
&gt; empty SSD and installed fresh Ubuntu and added Xen hypervisor, after<b=
r>
&gt; reboot I ended up with same panic. I tried booting with noapic (gave<b=
r>
&gt; general page fault) and iommu=3D0 (said it needs iommu=3Drequired/forc=
e).<br>
&gt; Trying to boot this exact fresh install on older (6th gen) Intel CPU<b=
r>
&gt; succeeded. I happen to have access to one more system with 10th gen<br=
>
&gt; Intel CPUs (Lenovo laptop) and no luck booting Xen there too and same<=
br>
&gt; panic in the end.<br>
&gt;<br>
&gt; Back to my barebone I tried to match BIOS settings between working and=
<br>
&gt; non-working but it didn&#39;t help. Virtualization is enabled, both<br=
>
&gt; systems are from the same maker (Intel NUC barebones), both systems<br=
>
&gt; are EFI enabled/secure boot disabled (the later one doesn&#39;t seem t=
o<br>
&gt; have an option to disable EFI boot and boot using MBR).<br>
&gt;<br>
&gt; Is this something known? Are there any boot options that can<br>
&gt; potentially fix this?<br>
&gt;<br>
&gt; Any help (including how to dump full Xen boot logs without serial)<br>
&gt; appreciated.<br>
<br>
Yes we&#39;re aware of it.=C2=A0 It is because modern Intel systems no long=
er<br>
have a legacy PIT configured by default, and Xen depends on this.=C2=A0 (Th=
e<br>
error message is misleading.=C2=A0 It&#39;s not checking for a timer, so mu=
ch as<br>
checking that interrupts works, and depends on the legacy PIT &quot;working=
&quot;<br>
as the source of interrupts.)<br>
<br>
I&#39;m working on a fix.<br>
<br>
~Andrew<br>
</blockquote></div>

--0000000000005276c305b79349fe--

