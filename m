Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B94B87FB1AF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 06:59:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642670.1002391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7r7Z-0005ng-2C; Tue, 28 Nov 2023 05:58:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642670.1002391; Tue, 28 Nov 2023 05:58:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7r7Y-0005lN-VU; Tue, 28 Nov 2023 05:58:56 +0000
Received: by outflank-mailman (input) for mailman id 642670;
 Mon, 27 Nov 2023 23:05:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=A91w=HI=m5p.com=ehem@srs-se1.protection.inumbo.net>)
 id 1r7kf4-00033H-Ss
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 23:05:06 +0000
Received: from mailhost.m5p.com (mailhost.m5p.com [74.104.188.4])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 655827c5-8d79-11ee-98e2-6d05b1d4d9a1;
 Tue, 28 Nov 2023 00:05:04 +0100 (CET)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.17.1/8.15.2) with ESMTPS id 3ARN4UpH061379
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 27 Nov 2023 18:04:36 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.17.1/8.15.2/Submit) id 3ARN4UhW061378;
 Mon, 27 Nov 2023 15:04:30 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 655827c5-8d79-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 15:04:30 -0800
From: Elliott Mitchell <ehem+freebsd@m5p.com>
To: Chuck Zmudzinski <brchuckz@netscape.net>
Cc: Mario Marietto <marietto2008@gmail.com>,
        Roger Pau =?iso-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>,
        Demi Marie Obenour <demi@invisiblethingslab.com>,
        Anthony PERARD <anthony.perard@citrix.com>,
        Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Bertrand Marquis <Bertrand.Marquis@arm.com>,
        Michal Orzel <michal.orzel@amd.com>
Subject: Re: We are not able to virtualize FreeBSD using xen 4.17 on Arm 32
 bit
Message-ID: <ZWUgfkP4U5kOmQNj@mattapan.m5p.com>
References: <CA+1FSiggg=XZmif6c3pY0+jz7i9caU-OTwFy80gwO7MVpXiwcA@mail.gmail.com>
 <CA+1FSigM1PZc4WfZNUJSMsZbNPPTyThRJ7MMQwQ9TWn6VnSUTg@mail.gmail.com>
 <C0A0E9FA-5AAB-4324-BBBD-D07412CD7F32@arm.com>
 <ZWR1v5Y3EpRK817B@macbook>
 <CA+1FSij2Q9f9Vj0A06HUYeUxTddrEyF=Q8X5fbs96CRr83_BPg@mail.gmail.com>
 <4fc95518-7e46-4f82-b540-afdbc941508a@netscape.net>
 <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f606be07-c4ff-43c6-acf9-42065a84b594@netscape.net>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-14) on mattapan.m5p.com

On Mon, Nov 27, 2023 at 10:57:42AM -0500, Chuck Zmudzinski wrote:
> On 11/27/2023 10:22 AM, Chuck Zmudzinski wrote:
> > 
> > I have been collaborating with Mario, and I can explain what we have done so far :
> > 
> > We are using Julien's patch set against an old development version of FreeBSD 11
> > from 2014-12-03 :
> > 
> > https://xenbits.xen.org/gitweb/?p=people/julieng/freebsd.git;a=shortlog;h=refs/heads/xen-arm-v2.2
> > 
> > We successfully built the XENVIRT kernel and FreeBSD world, and created the
> > FreeBSD rootfs according to Julien's instructions here :
> > 
> > https://lists.freebsd.org/pipermail/freebsd-xen/2014-November/002202.html
> > 
> > There were some adjustments to the instructions :
> > 
> > To build the kernel, we used :
> > 
> > $ sudo make TARGET_ARCH=armv6 KERNCONF=XENVIRT buildkernel
> > 
> > instead of
> > 
> > $ sudo make TARGET_ARCH=armv6 KERNCONF=XENHVM buildkernel
> > 
> > The FreeBSD 'kernel' file is in ELF format and did not work, and we spent
> > some time trying to convert it to the zImage format without realizing the
> > build of the FreeBSD kernel creates the 'kernel.bin' file in the zImage format.
> > So when booting with the 'kernel.bin' file instead, it actually boots :
> > 
> > user@devuan-bunsen ~ % sudo xl create freebsd.cfg
> > Parsing config from freebsd.cfg
> > user@devuan-bunsen ~ % sudo xl li
> > Name                                        ID   Mem VCPUs	State	Time(s)
> > Domain-0                                     0   768     2     r-----    1439.4
> > freebsd                                      1  1152     1     r-----       3.0
> > user@devuan-bunsen ~ %
> > 
> > However, the guest is still not working correctly :
> > 
> > 1. Attaching the console with the -c option at creation or with
> >    'xl console freebsd' results in no output to the console.
> > 
> > 2. The timestamp on the virtual disk image file shows that the filesystem
> >    was at best mounted read-only, if it was mounted at all by the guest
> >    FreeBSD kernel.
> > 
> > 3. The 'xl shutdown freebsd' command does not work, it just hangs. To stop
> >    the guest, you need to do 'xl destroy freebsd'.
> > 
> > However, I think we can get the console to work and the rootfs to mount because I
> > just realized I forgot to do the steps from Julien's instructions of editing the
> > /etc/fstab and /etc/ttys files in the FreeBSD rootfs :
> > 
> > $ echo "/dev/xbd0       /       ufs     rw      1       1" > /mnt/etc/fstab
> > $ vi /mnt/etc/ttys (add the line 'xc0 "/usr/libexec/getty Pc" xterm on secure")
> > 
> > I will add those and see if the console and disk are working.
> 
> Unfortunately, adding xc0 to /etc/ttys and /dev/xbd0 as the root device in
> /etc/fstab did not make the console or disk work. Still no output on the
> xen console from the guest kernel, and the timestamp on the rootfs image
> file did not change so it did not mount read-write.
> 
> We could use some advice for troubleshooting this. Now, we are blind because
> we are not getting any xen console output But I am pleased we were able to
> demonstrate that Julien's old patch set for FreeBSD 11 allows us to boot
> FreeBSD 11 on a modern version of Xen on arm - we are using the Debian
> stable Xen 4.17 packages.

The only method for booting I ever tried was Tianocore/EDK2.  As brought
up previously, that needs an update for Xen 4.17 though:
https://lists.xenproject.org/archives/html/xen-devel/2023-10/msg00278.html
Essentially they had two uses of the shared info page, one was unmapped
and the other never got unmapped.  That is good enough for FreeBSD's
bootloader to function.

FreeBSD's handling of patches is unfortunately very friendly to people
who have permission to commit, or know someone responsible for a
particular area.  If you're trying to get patches for something which
has shared responsibility and you're unfunded you're SoL.  As such my
work has basically stalled.  Everything works, but without anyone with
an interest it is simply sitting here mouldering.  Combined with the
annoyance curse it is simply sitting.

Julien Grall's patches are very much PoC.  As such I've done a lot of
updating.  Take a look at branch "submit":
https://gitlab.com/ehem/freebsd-src.git

Problem is FreeBSD's interrupt situation is troublesome.  Rather than 1
interrupt framework, there are 4.  Each has different built-in
assumptions.  "INTRNG" was designed for ARM and deliberately threw away
the x86 assumptions, but then added other assumptions.

The tip of the "submit" branch has a mix of different potential
approaches to working with "INTRNG".  Several of these might be rejected,
but hopefully one might be accepted.  Really I need someone in the
FreeBSD organization with the authority to override Michal Meloun's
proselytizing about INTRNG being perfect.

The other problem is no one in the FreeBSD organization wants to deal
with it's interrupt disaster.  By the time anyone is allowed to commit,
they've been thoroughly burned by the situation and are unwilling to
touch the interrupt system.  Thus leading to the antipattern of it being
just barely maintained.

I've got it working, just I'm stuck.


BTW Roger Pau Monné, now that Xen 4.18 is out, take a look at the
"royger" branch?


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



