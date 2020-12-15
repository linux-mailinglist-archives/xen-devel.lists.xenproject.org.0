Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1B82DA687
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 03:59:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52841.92220 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0Yv-0000ox-4Y; Tue, 15 Dec 2020 02:59:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52841.92220; Tue, 15 Dec 2020 02:59:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0Yv-0000oY-1F; Tue, 15 Dec 2020 02:59:41 +0000
Received: by outflank-mailman (input) for mailman id 52841;
 Tue, 15 Dec 2020 02:59:40 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=9m1Y=FT=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1kp0Yt-0000oT-Uy
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 02:59:39 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 068110e1-8c94-4a12-8cd0-15602c1c0cca;
 Tue, 15 Dec 2020 02:59:39 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0BF2xTKv027184
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Mon, 14 Dec 2020 21:59:34 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0BF2xSaA027183;
 Mon, 14 Dec 2020 18:59:28 -0800 (PST) (envelope-from ehem)
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
X-Inumbo-ID: 068110e1-8c94-4a12-8cd0-15602c1c0cca
Date: Mon, 14 Dec 2020 18:59:28 -0800
From: Elliott Mitchell <ehem+undef@m5p.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen-ARM DomUs
Message-ID: <X9gmkGhQQBOmmBe5@mattapan.m5p.com>
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com>
 <CAMmSBy_8+PRWiSQxwRN2oB9mLmOnyoCr0mH4L-uUYhm=1GK7Xg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy_8+PRWiSQxwRN2oB9mLmOnyoCr0mH4L-uUYhm=1GK7Xg@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Mon, Dec 14, 2020 at 06:35:14PM -0800, Roman Shaposhnik wrote:
> On Mon, Dec 14, 2020 at 6:16 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >
> > Finally getting to the truly productive stages of my project with Xen on
> > ARM.
> >
> > How many of the OSes which function as x86 DomUs for Xen, function as
> > ARM DomUs?  Getting Linux operational was straightforward, but what of
> > others?
> 
> On EVE we have Windows running as a pretty much a customer-facing demo:
>     https://wiki.lfedge.org/display/EVE/How+get+Windows+10+running+on+a+Raspberry+Pi
> 

Sorry to spoil the achievement, but Tianocore beat you to having
Windows on a RP4 by 4 months:
https://rpi4-uefi.dev/alternate-guide-running-windows-10-on-the-pi-4/

> > The available examples seem geared towards Linux DomUs.  I'm looking at a
> > FreeBSD installation image and it appears to expect an EFI firmware.
> > Beyond having a bunch of files appearing oriented towards booting on EFI
> > I can't say much about (booting) FreeBSD/ARM DomUs.
> 
> Personally I'm about to make Plan9 (well 9front really) run as well ;-)

Some people may like those types of instructions, but I really hate them.
I like Tianocore's better, since I can do my type of adjustment better.
(using different amount of storage or other virtual devices)

I've already got FreeBSD installation media, issue is setting up a xl.cfg
file and/or figuring out which bits I need to extract off their media
(ah, actual kernel is /boot/kernel/kernel; an ELF file using the
interpreter /red/herring).


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



