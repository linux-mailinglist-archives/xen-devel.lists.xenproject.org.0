Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B2AACB292
	for <lists+xen-devel@lfdr.de>; Mon,  2 Jun 2025 16:33:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1003542.1383117 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6Du-0007VC-R7; Mon, 02 Jun 2025 14:33:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1003542.1383117; Mon, 02 Jun 2025 14:33:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uM6Du-0007TF-Nx; Mon, 02 Jun 2025 14:33:10 +0000
Received: by outflank-mailman (input) for mailman id 1003542;
 Mon, 02 Jun 2025 14:33:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=pxQh=YR=antarean.org=joost@srs-se1.protection.inumbo.net>)
 id 1uM6Ds-0007T9-VU
 for xen-devel@lists.xenproject.org; Mon, 02 Jun 2025 14:33:08 +0000
Received: from gw3.antarean.org (gw3.antarean.org [84.247.13.64])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTP
 id 8061a084-3fbe-11f0-a300-13f23c93f187;
 Mon, 02 Jun 2025 16:33:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by gw3.antarean.org (Postfix) with ESMTP id 4b9xCy2njzzNsTk
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 16:33:34 +0200 (CEST)
Received: from gw3.antarean.org ([127.0.0.1])
 by localhost (gw3.antarean.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a7JFk9kzoPnz for <xen-devel@lists.xenproject.org>;
 Mon,  2 Jun 2025 16:33:34 +0200 (CEST)
Received: from mailstore1.adm.antarean.org (localhost [127.0.0.1])
 by gw3.antarean.org (Postfix) with ESMTP id 4b9xCy2CpTzNl38
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 16:33:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mailstore1.adm.antarean.org (Postfix) with ESMTP id 4b9xCR2nXTz1G
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 14:33:07 +0000 (UTC)
Received: from mailstore1.adm.antarean.org ([127.0.0.1])
 by localhost (mailstore1.adm.antarean.org [127.0.0.1]) (amavis, port 10024)
 with ESMTP id I9kZDh_9fklY for <xen-devel@lists.xenproject.org>;
 Mon,  2 Jun 2025 14:33:06 +0000 (UTC)
Received: from f2b978515ea2 (web2.adm.antarean.org [10.55.16.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailstore1.adm.antarean.org (Postfix) with ESMTPSA id 4b9xCQ66ttz17
 for <xen-devel@lists.xenproject.org>; Mon, 02 Jun 2025 14:33:06 +0000 (UTC)
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
X-Inumbo-ID: 8061a084-3fbe-11f0-a300-13f23c93f187
X-Virus-Scanned: amavis at antarean.org
X-Virus-Scanned: amavis at antarean.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=antarean.org;
	s=default; t=1748874786;
	bh=z4ZlMf+Lv5xV4mIU7iCEzl70cQ7/c13EtEcrPm5jX9Q=;
	h=From:In-Reply-To:References:To:Subject:Date;
	b=IY/kW/xrcRvFGwjReT8yxPy67Qm3qnmBJewN3kBu8oAGbEJ4yli5vdIIoIWuDzUw8
	 mEXaQo47eDyuG4JapIyqwKIKX0jnkNHhxeO5yOonLpw805XpwAEgnlFMPfEghC5Jct
	 rTA9u73s4zlAmbed/5owaRauiDQpZcSn6TmtPVJY=
User-Agent: EGroupware API 23.1.011
From: Joost Roeleveld <joost@antarean.org>
X-Priority: 3
X-Mailer: EGroupware-Mail
In-Reply-To: <2226691.irdbgypaU6@persephone>
References: <2226691.irdbgypaU6@persephone>
To: xen-devel@lists.xenproject.org
Subject: Re: Kernel panic when passing through 2 identical PCI devices
Message-ID: <20250602143306.EGroupware.1G0k_iePuNZvNjMVaaT1dBR@egw.antarean.nl>
Date: Mon, 02 Jun 2025 14:33:06 +0000
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0

On Monday, 2 June 2025 15:43:37 CEST you wrote:
> On 02.06.2025 14:28, J. Roeleveld wrote:
> > I have a domain to which I pass through 4 PCI devices:
> >2 NVMe drives
> >83:00.0   Samsung 980 NVMe
> >84:00.0   Samsung 980 NVMe
> >
> >2 HBA Controllers
> >86:00.0   LSI SAS3008
> >87:00.0   LSI SAS3008
> >
> > This works fine with Xen version 4.18.4_pre1.
> > However, when trying to update to 4.19, this fails.
>
> To make it explicit: The domain in question is a PV one.

Yes. I tried to convert it to PVH in the past, but PCI-passthrough wasn't
working at all. And nothing I found since shows that it should be working now.

> > Checking the output during boot, I think I found something. But my
> > knowledge is insufficient to figure out what is causing what I am seeing
> > and how to fix this.
> >
> > From the below (where I only focus on the 2 NVMe drives), it is similar to
> > the succesfull boot up until it tries to "claiming resource
> >0000:84:00.0/0". At which point sysfs fails because the entry for "84" is
> > already present.
> What would be interesting is to know why / how this 2nd registration
> happens.

Only guess I can make: They are both the same brand/model/size. Only serial
number differs

> It's the same (guest) kernel version afaics, so something must
> behave differently on the host. Are you sure the sole (host side)
> difference is the hypervisor version? I.e. the Dom0 kernel version is the
> same in the failing and successful cases? I ask because there's very little
> Xen itself does that would play into pass-through device discovery /
> resource setup by a (PV) guest (which doesn't mean Xen can't screw things
> up). The more relevant component is the xen-pciback driver in Dom0.

I can confirm it's dependent on the Xen version.
Kernel version  = 6.12.21
I get a succesful boot with Xen version 4.18.4_pre1.
When I use Xen version 4.19.1, the boot fails due to this issue.

The kernel and initramfs does not differ between the boot.

> Sadly the log provided does, to me at least, not have enough data to draw
> conclusions. Some instrumenting of the guest kernel may be necessary ...

The host boots using UEFI:

=== (xen.cfg in the EFI partition) ===
[global]
default=xen

[xen]
options=dom0_mem=24576M,max:24576M dom0_max_vcpus=4 dom0_vcpus_pin
gnttab_max_frames=512 sched=credit console=vga extra_guest_irqs=768,1024

kernel=gentoo-6.12.21.efi dozfs root=ZFS=zhost/host/root by=id elevator=noop
logo.nologo triggers=zfs quiet refresh softlevel=prexen nomodeset
nfs.callback_tcpport=32764 lockd.nlm_udpport=32768 lockd.nlm_tcpport=32768
xen-pciback.hide=(83:00.0)(84:00.0)(86:00.0)(87:00.0) xen-
pciback.passthrough=1

ramdisk=initramfs-6.12.21-gentoo-host.img
===

Please let me know what other information you need and if there is anything I
can try/test to get more information.
Does the mailing list allow gzipped text files as attachment? Or how would you
prefer the kernel-config of the host and guest?

If there are tests to do, please give me several to try as I need to schedule
downtime for reboots.

Many thanks in advance,

Joost



