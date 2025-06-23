Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E70AE3DB1
	for <lists+xen-devel@lfdr.de>; Mon, 23 Jun 2025 13:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1022264.1398047 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTf4K-0005re-MN; Mon, 23 Jun 2025 11:10:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1022264.1398047; Mon, 23 Jun 2025 11:10:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uTf4K-0005pZ-JJ; Mon, 23 Jun 2025 11:10:32 +0000
Received: by outflank-mailman (input) for mailman id 1022264;
 Mon, 23 Jun 2025 11:10:30 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mqBe=ZG=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1uTf4H-0005pT-Ae
 for xen-devel@lists.xenproject.org; Mon, 23 Jun 2025 11:10:30 +0000
Received: from gw4.antarean.org (gw4.antarean.org [136.144.238.64])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTP
 id aa737a05-5022-11f0-b894-0df219b8e170;
 Mon, 23 Jun 2025 13:10:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gw4.antarean.org (Postfix) with ESMTP id 4bQljt4BXWzNn9l;
 Mon, 23 Jun 2025 13:10:26 +0200 (CEST)
Received: from gw4.antarean.org ([127.0.0.1])
 by localhost (gw4.antarean.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzGkHA0Hwnur; Mon, 23 Jun 2025 13:10:26 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw4.antarean.org (Postfix) with ESMTP id 4bQljt1FHdzNkdZ;
 Mon, 23 Jun 2025 13:10:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4bQljt0DFQz1G;
 Mon, 23 Jun 2025 11:10:26 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavis, port 10024)
 with ESMTP id oWbBwcdQgtxp; Mon, 23 Jun 2025 11:10:25 +0000 (UTC)
Received: from persephone.localnet (persephone.adm.antarean.org [10.55.16.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPS id 4bQljs2HxNz17;
 Mon, 23 Jun 2025 11:10:25 +0000 (UTC)
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
X-Inumbo-ID: aa737a05-5022-11f0-b894-0df219b8e170
X-Virus-Scanned: amavis at antarean.org
X-Virus-Scanned: amavis at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1750677025;
	bh=Vkzz8YAkBcCkAawxdb2sUw9O6vSH29rA/svc/XGMyh0=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Gc57AdjIvF7XF+vXKE3PvzN6/LD7XuxmpLhJPpkgX7tyV6Zasr86Ow+Mqn4H6gMNZ
	 PYSHsNDy16e6VoaO33ho82YHY9DnwBICGzx8J/ZHhTQ3RHPx18gcChlqDK0Se80pMh
	 Pq2aWS12oEoiZqqR4UEb5sFuDyKbmBdGGBEOZTyA=
From: "J. Roeleveld" <joost@antarean.org>
To: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>
Subject:
 Re: xen_pciback: error enabling MSI-X / MSI for guest -- WAS: Re: Kernel
 panic when passing through 2 identical PCI devices
Date: Mon, 23 Jun 2025 13:10:25 +0200
Message-ID: <13792333.uLZWGnKmhe@persephone>
In-Reply-To: <0d1cdd47-8fc2-4aa4-8c78-32f2ef2cc524@suse.com>
References:
 <2226691.irdbgypaU6@persephone> <4683544.LvFx2qVVIh@persephone>
 <0d1cdd47-8fc2-4aa4-8c78-32f2ef2cc524@suse.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

On Monday, 23 June 2025 09:55:46 CEST Jan Beulich wrote:
> On 21.06.2025 16:39, J. Roeleveld wrote:
> > I managed to get past the kernel panic (sort of) by doing the following:
> > 
> > 1) Ensure system is fully OFF before booting. A reset/reboot will cause
> > these errors.
> > 
> > 2) Fix the BIOS config to ensure the PCI-ports are split correctly. If
> > anyone has a Supermicro board and gets errors about PCI-slots not getting
> > full speed let me know.
> > 
> > Not entirely convinced the 2nd was part of the cause, but that's ok.
> > 
> > I now, however, get a new error message in the Domain0 dmesg:
> > pciback <pci-address>: xen_map irq failed -28 for <domid> domain
> > pciback <pci-address>: error enabling MSI-X for guest <domid>: err -28!
> > 
> > For the NVMe devices, I get these twice, with the 2nd time complaining
> > about MSI (without the -X)
> > 
> > I feel there is something missing in my kernel-config and/or domain
> > config.
> > If anyone can point me at what needs to be enabled/disabled or suggestions
> > on what I can try?
> 
> The default number of extra IRQs the guest may (have) set up may be too
> small. You may need to make use of Xen's extra_guest_irqs= command line
> option.

I spent the entire weekend searching for possible causes/hints/things to try.
That setting was one I had found some time ago (I think for MSI/MSI-X issues) 
and it's currently set to:
extra_guest_irqs=768,1024

Not sure if it makes sense to increase this further?

# For completeness, the Xen commandline is:
dom0_mem=24576M,max:24576M dom0_max_vcpus=4 dom0_vcpus_pin 
gnttab_max_frames=512 sched=credit console=vga extra_guest_irqs=768,1024 
iommu=verbose

# The kernel commandline is:
kernel=gentoo-6.12.21.efi dozfs root=ZFS=zhost/host/root by=id elevator=noop 
logo.nologo triggers=zfs quiet refresh softlevel=prexen nomodeset 
nfs.callback_tcpport=32764 lockd.nlm_udpport=32768 lockd.nlm_tcpport=32768 
xen-pciback.hide=(83:00.0)(84:00.0)(85:00.0)(86:00.0) xen-
pciback.passthrough=1

If there is anything I am missing or should be doing differently, please let me 
know.

As said, I spent the entire weekend search with google and duckduckgo (ddg 
seems to return more relevant results, but also has few results with similar 
error message that are more recent then 6+ years). Here are what I found out 
so far:

== 1) NVMe errors in dmesg:

I noticed that, even when working, the NVMe drivers show issues with "MSI-X" )
(only showing 1 of the 2, the other has the same messages):
[    7.742006] nvme nvme0: pci function 0000:84:00.0
[    7.742158] nvme 0000:84:00.0: Xen PCI mapped GSI56 to IRQ59
[    7.752907] nvme nvme0: D3 entry latency set to 8 seconds
[    8.003806] nvme nvme0: allocated 64 MiB host memory buffer.
[    8.038746] nvme 0000:84:00.0: enable msix get err ffffff8e
[    8.038756] nvme 0000:84:00.0: Xen PCI frontend error: -114!
[    8.048849] nvme nvme0: 1/0/0 default/read/poll queues
[    8.106017]  nvme0n1: p1 p2 p3 p4

I have been unable to find what " enable msix get err ffffff8e " and " Xen PCI 
frontend error: -114! " actually mean.

These messages show up on a "working" environment. This is with kernel 6.12.21 
and Xen 4.18.4_pre1

== 2) A BIOS setting where default differs from general recommendation by 
Supermicro:
- Setting " MMIO High Size " is set to 256GB. Recommendation I see is to set 
this to 1024GB.
Note: The server has 368 GB ram, so does make sense. I will be changing this 
setting during my next chance to do further testing.

== 3) IOMMU seems enabled, apart from 2 items:
(XEN) Intel VT-d iommu 0 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d iommu 1 supported page sizes: 4kB, 2MB, 1GB
(XEN) Intel VT-d Snoop Control enabled.
(XEN) Intel VT-d Dom0 DMA Passthrough not enabled. <---
(XEN) Intel VT-d Queued Invalidation enabled.
(XEN) Intel VT-d Interrupt Remapping enabled.
(XEN) Intel VT-d Posted Interrupt not enabled.  <---
(XEN) Intel VT-d Shared EPT tables enabled.
(XEN) I/O virtualisation enabled
(XEN)  - Dom0 mode: Relaxed
(XEN) Interrupt remapping enabled

The 2 marked lines say "not enabled", if I understand all the different 
documentation correctly, this is not an issue. Please let me know if I am 
mistaken.

== 4) "nr_irqs" (and this is making me wonder if the "extra_guest_irqs" is 
actually used

In the Dmesg on the host I see:
[    2.328651] NR_IRQS: 8448, nr_irqs: 1024, preallocated irqs: 16

On the VM/Domain I see:
[    3.673555] NR_IRQS: 4352, nr_irqs: 80, preallocated irqs: 0

The number on the host matches.
The number in the Domain does not.

The specific domain is always the 2nd that is started.



