Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F8D7DD917
	for <lists+xen-devel@lfdr.de>; Wed,  1 Nov 2023 00:05:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.626028.975918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxxmi-0001qv-D2; Tue, 31 Oct 2023 23:04:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 626028.975918; Tue, 31 Oct 2023 23:04:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qxxmi-0001ny-A1; Tue, 31 Oct 2023 23:04:32 +0000
Received: by outflank-mailman (input) for mailman id 626028;
 Tue, 31 Oct 2023 23:04:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YC+N=GN=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qxxmg-0001ns-IE
 for xen-devel@lists.xenproject.org; Tue, 31 Oct 2023 23:04:30 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d721f3a9-7841-11ee-98d6-6d05b1d4d9a1;
 Wed, 01 Nov 2023 00:04:29 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0DBCDCE0E6D;
 Tue, 31 Oct 2023 23:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70398C433C7;
 Tue, 31 Oct 2023 23:04:22 +0000 (UTC)
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
X-Inumbo-ID: d721f3a9-7841-11ee-98d6-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698793463;
	bh=OTNFot8+epoCjTdQ1IZQGB7Iad+dHZl9wibk5DnzkR8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=aQ0Lb1sIdkslD4QEdooNu6ozFk+Q6uXrFJxXWKJXD+nmzcOKycNaOff+lt4ZecQKr
	 oTSouNYcLpOU3DTcaKtPvO/k6EOHsDN1FmBu2d2dPtkOkWjscXORJO34TOXF6Mi5p4
	 +PhxQoaWVsLTdFntaBJ+EUTjYVeMUcz9Ajcb4ksssKP5tGs5yAnOHz+6Yq2XSln1ni
	 r1Gre+DBWl/QZDggm3FoHg3KOTPA4a+vpAdYZBTrLe89EaOK7Kt6NQHFDZ3ecD1wqK
	 VX3P7Uq5TQjEgDOBDfVzYj4Qixx1mDHGI5pKCr19B4xTjpfn8lRfled8XWp5KHbsy+
	 a+vXXwB+ScZSQ==
Date: Tue, 31 Oct 2023 16:04:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Mario Marietto <marietto2008@gmail.com>
cc: sstabellini@kernel.org, xen-devel@lists.xenproject.org, 
    Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    brchuckz@netscape.net
Subject: Re: exynos-mixer 14450000.mixer: [drm:exynos_drm_register_dma]
 *ERROR* Device 14450000.mixer lacks support for IOMMU
In-Reply-To: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2310311557520.1795129@ubuntu-linux-20-04-desktop>
References: <CA+1FSiip1U0_EskJNgV3pSZPTCNOiTbpHosRLsy-6t1QQGd8Dw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hi Mario,

I am adding xen-devel and a couple of other Xen maintainers that might
know how to help make progress on this issues.

Replies inline below.


On Tue, 31 Oct 2023, Mario Marietto wrote:
> Hello,
> 
> We are a team of linux enthusiasts who are trying to boot Xen on a
> Samsung XE303C12 Chromebook aka "snow"
> following the suggestions in the slide show presentation here:
> 
> https://www.slideshare.net/xen_com_mgr/xpds16-porting-xen-on-arm-to-a-new-soc-julien-grall-arm
> 
> This device uses an exynos5250 SOC dual core 1.7 GHz with 2 MB RAM, it is
> a Samsung armv7 chip with virtualization extensions.
> 
> In particular, we have it working fairly well both on the bare metal with
> a recent 6.1.59 Linux LTS kernel and also with a recent 5.4.257 LTS
> kernel with KVM, the older LTS kernel version is used to test KVM because
> support for KVM on arm v7 was removed from Linux around kernel version
> 5.7. So we know we have the hypervisor mode enabled because we were able
> to use it with KVM.
> 
> For Xen, we are using the latest Debian build of Xen 4.17 for the Debian
> armhf architecture:
> 
> (XEN) Xen version 4.17.2-pre (Debian 4.17.1+2-gb773c48e36-1)
> (pkg-xen-devel@xxxxxxxxxxxxxxx
> xxxxxxxx) (arm-linux-gnueabihf-gcc (Debian
> 12.2.0-14) 12.2.0) debug=n Thu May 18 19:26:30 UTC 2023
> 
> The Linux kernel is a custom build that adds the Xen config kernel
> options (CONFIG_XEN_DOM0, etc) on top of a kernel that works well on the
> same Chromebook model on the bare metal. I can provide the config options
> of the kernel that was used if that is helpful.
> 
> Our method of booting is to have u-boot boot the Xen hypervisor and load
> the device tree after adding the dom0 to the otherwise unaltered device
> tree from the Linux kernel using u-boot fdt commands to add a /chosen
> node, as described on the Xen wiki and in the pages linked from there. We
> have also tried adding and loading an initrd.img using the device tree
> /chosen node but that made no difference in our tests.
> 
> We actually have the Linux LTS kernel version 6.1.59 working as dom0 with
> Xen using the same version of u-boot that we used for KVM, but with a big
> problem.
> 
> The problem we see is that when booting the 6.1.59 kernel version as dom0
> with Xen, the screen is totally dark and the only way to access the
> system is remotely through ssh. Logs indicate most everything else is
> working, such as the wifi card so we can access it remotely via ssh and a
> USB optical mouse lights up when connected so USB is also working.
> Obviously, the disk is also working. The Chromebook is configured to boot
> from the device's SD card slot by turning on Chrome OS developer mode
> options to enable booting from the SD card slot.
> 
> The mystery is that when booting the exact same 6.1.59 kernel on the bare
> metal instead of booting it as dom0 on Xen, it boots up with full access
> to the screen and we can interact with the system using the X.org windows
> system. But booting as dom0 with Xen, the screen is totally dark and the
> only access we have to the system is through the network via ssh. Also,
> when booting the 5.4.257 kernel with KVM in hypervisor mode, the screen
> works and we can interact with the system through the X.org windows
> system.
> 
> Exploring the log file,we have seen the errors below :
> 
> 
> With Xen (or in bare metal):
> 
> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> DMA mapping operations
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> 0xc0d96354)
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14450000.mixer (ops
> 0xc0d97554)
> devuan-bunsen kernel: exynos-drm exynos-drm: bound
> 145b0000.dp-controller (ops 0xc0d97278)
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14530000.hdmi (ops
> 0xc0d97bd0)
> ...
> devuan-bunsen kernel: Console: switching to colour frame buffer device 170x48
> devuan-bunsen kernel: exynos-drm exynos-drm: [drm] fb0: exynosdrmfb
> frame buffer device
> devuan-bunsen kernel: [drm] Initialized exynos 1.1.0 20180330 for
> exynos-drm on minor 0
> 
> In this case,the kernel is able to use the exynos-drm kernel to start
> the fb0 device. But with Xen we get this error with exynos-drm:
> 
> devuan-bunsen kernel: [drm] Exynos DRM: using 14400000.fimd device for
> DMA mapping operations
> devuan-bunsen kernel: exynos-drm exynos-drm: bound 14400000.fimd (ops
> 0xc0d96354)
> devuan-bunsen kernel: exynos-mixer 14450000.mixer:
> [drm:exynos_drm_register_dma] *ERROR* Device 14450000.mixer lacks
> support for IOMMU
> devuan-bunsen kernel: exynos-drm exynos-drm: failed to bind
> 14450000.mixer (ops 0xc0d97554): -22
> devuan-bunsen kernel: exynos-drm exynos-drm: adev bind failed: -22
> devuan-bunsen kernel: exynos-dp: probe of 145b0000.dp-controller
> failed with error -22
> 
> 
> Any ideas why booting the same Linux kernel that results in a working
> X.org display on the bare metal instead as dom0 on Xen would cause the
> display to remain dark, but most other basic functions would work, such
> as network, disk, and USB ? thanks.

I think the issue is that Linux 6.1.59 is using the IOMMU to get the GPU
to work. When running on top of Xen, the IOMMU is not available to
Linux. That's because the IOMMU is used by Xen to enforce protection
between VMs.

It might help to rebuild Linux without IOMMU support (remove the driver
from the kconfig) so that Linux cannot attempt to use the IOMMU.

Also see
https://marc.info/?l=xen-users&m=169844593525492

