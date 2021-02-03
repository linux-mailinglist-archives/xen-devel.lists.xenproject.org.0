Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F3530E5D9
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 23:13:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81076.149142 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7QOH-0005eX-Dw; Wed, 03 Feb 2021 22:12:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81076.149142; Wed, 03 Feb 2021 22:12:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7QOH-0005e8-Ar; Wed, 03 Feb 2021 22:12:49 +0000
Received: by outflank-mailman (input) for mailman id 81076;
 Wed, 03 Feb 2021 22:12:47 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=vpkB=HF=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1l7QOF-0005e2-88
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 22:12:47 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a677cac6-3a78-45b8-b6e9-97e4b4bffafe;
 Wed, 03 Feb 2021 22:12:43 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 113MCTuu030536
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 3 Feb 2021 17:12:35 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 113MCThF030535;
 Wed, 3 Feb 2021 14:12:29 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: a677cac6-3a78-45b8-b6e9-97e4b4bffafe
Date: Wed, 3 Feb 2021 14:12:29 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>,
        Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
Message-ID: <YBsfzZ6fI40bXo7/@mattapan.m5p.com>
References: <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com>
 <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s>
 <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com>
 <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com>
 <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com>
 <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
 <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
 <3c98d8d0-ca4e-b177-1e2b-5f3eb454722d@unikie.com>
 <alpine.DEB.2.21.2102031249090.29047@sstabellini-ThinkPad-T480s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2102031249090.29047@sstabellini-ThinkPad-T480s>
X-Spam-Status: No, score=0.4 required=10.0 tests=KHOP_HELO_FCRDNS autolearn=no
	autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Wed, Feb 03, 2021 at 12:55:40PM -0800, Stefano Stabellini wrote:
> On Wed, 3 Feb 2021, Jukka Kaartinen wrote:
> > On 3.2.2021 2.18, Stefano Stabellini wrote:
> > > How are you configuring and installing the kernel?
> > > 
> > > make bcm2711_defconfig
> > > make Image.gz
> > > make modules_install
> > > 
> > > ?
> > > 
> > > The device tree is the one from the rpi-5.9.y build? How are you loading
> > > the kernel and device tree with uboot? Do you have any interesting
> > > changes to config.txt?
> > > 
> > > I am asking because I cannot get to the point of reproducing what you
> > > are seeing: I can boot my rpi-5.9.y kernel on recent Xen but I cannot
> > > get any graphics output on my screen. (The serial works.) I am using the
> > > default Ubuntu Desktop rpi-install target as rootfs and uboot master.
> > > 
> > 
> > This is what I do:
> > 
> > make bcm2711_defconfig
> > cat "xen_additions" >> .config
> > make Image  modules dtbs
> > 
> > make INSTALL_MOD_PATH=rootfs modules_install
> > depmod -a
> > 
> > cp arch/arm64/boot/dts/broadcom/bcm2711-rpi-4-b.dtb boot/
> > cp arch/arm64/boot/dts/overlays/*.dtbo boot/overlays/
> 
> Thanks for the detailed instructions. This helps a lot. I saw below in
> boot2.source that you are using ${fdt_addr} as DTB source (instead of
> loading one), which means you are using the DTB as provided by U-Boot at
> runtime, instead of loading your own file.
> 
> With these two copies, I take you meant to update the first partition on
> the SD card, the one where config.txt lives, right? So that Xen is
> getting the DTB and overlays from the rpi-5.9.y kernel tree but passed
> down by the RPi loader and U-Boot?
> 
> I think the DTB must be the issue as I wasn't applying any overlays
> before. I ran a test to use the DTB and overlay from U-Boot but maybe I
> haven't updated them properly because I still don't see any output.

Seeing no graphics output from U-Boot is okay.  If the device-tree files
get sufficiently updated you can end up with no output from U-Boot, but
will get output once the Linux kernel's driver is operational (I've seen
this occur).

The most important part is having a HDMI display plugged in during the
early boot stages.  Unless the bootloader sees the display the output
won't get initialized and the Linux driver doesn't handle that.


> > dtoverlay=vc4-fkms-v3d,cma-64

This is odd.  My understanding is this is appropriate for RP3, but not
RP4.  For RP4 you can have "dtoverlay=disable-vc4" and still get graphics
output (hmm, I'm starting to think I need to double-check this...).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



