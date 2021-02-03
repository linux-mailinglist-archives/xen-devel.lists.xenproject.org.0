Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 989AC30D126
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 02:59:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80773.147959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l77RX-00021E-9G; Wed, 03 Feb 2021 01:58:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80773.147959; Wed, 03 Feb 2021 01:58:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l77RX-00020z-5n; Wed, 03 Feb 2021 01:58:55 +0000
Received: by outflank-mailman (input) for mailman id 80773;
 Wed, 03 Feb 2021 01:58:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vpkB=HF=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l77RW-00020u-2u
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 01:58:54 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6775a40d-27da-40b2-b786-1cbc93b04f3b;
 Wed, 03 Feb 2021 01:58:49 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 1131wUR6024610
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Tue, 2 Feb 2021 20:58:36 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 1131wTmg024609;
 Tue, 2 Feb 2021 17:58:29 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 6775a40d-27da-40b2-b786-1cbc93b04f3b
Date: Tue, 2 Feb 2021 17:58:29 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>,
        Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
Message-ID: <YBoDRSQMCAk/qbAf@mattapan.m5p.com>
References: <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com>
 <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
 <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
 <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
 <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Tue, Feb 02, 2021 at 04:18:44PM -0800, Stefano Stabellini wrote:
> How are you configuring and installing the kernel?
> 
> make bcm2711_defconfig
> make Image.gz
> make modules_install
> 
> ?
> 
> The device tree is the one from the rpi-5.9.y build? How are you loading
> the kernel and device tree with uboot? Do you have any interesting
> changes to config.txt?
> 
> I am asking because I cannot get to the point of reproducing what you
> are seeing: I can boot my rpi-5.9.y kernel on recent Xen but I cannot
> get any graphics output on my screen. (The serial works.) I am using the
> default Ubuntu Desktop rpi-install target as rootfs and uboot master.

I've been trying with various pieces from various sources trying to get
things to work.  Since my goal has been a Debian-variant I use
Debian-packaged versions of things if at all possible.  Sticking to
packaged versions is more maintainable over the longer run.

My starting point was SuSE Raspberry PI 4B installation medium.  I'm
still using pieces from SuSE's installation.  Notably SuSE's overlays
have worked rather better than RPF or kernel versions of device-tree
overlays.

Debian's u-boot-rpi:arm64 package is functional.  As such that provides
u-boot.bin which is loaded via config.txt as the kernel.

Debian's grub-efi-arm64 package is also functional.  Installing that is
a bit funky as U-Boot's EFI environment is incomplete.  Nonetheless it
is simply an issue of having that installed in EFI/BOOT as the primary
boot entry, rather than EFI/Debian where it would normally install.

The base device-tree files from the RPF kernel function reasonably
well (unlike the overlays).  I'm actually doing
`make O=<build-dir> bcm2711_defconfig menuconfig bindeb-pkg` and then
installing the resultant package.  This places bcm2711-rpi-4-b.dtb in
/usr/lib/linux-image-<rev>/broadcom/bcm2711-rpi-4-b.dtb, I'm presently
copying that into the Raspberry PI boot area.

If you're unable to get graphics output, note the instruction that HDMI
MUST be plugged in *during* *boot*.  Broadcom's chips have the graphics
core is control of rather more than one might expect (Qualcomm follows
this pattern by wanting their modems in control).  In fact I've observed
I need my monitor displaying the input from the RP4 in order for it to
complete the handshake and have the RP4 do graphics.


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



