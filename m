Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7DD2C3867
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 06:17:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.37256.69521 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khnAt-0007Cr-48; Wed, 25 Nov 2020 05:17:03 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 37256.69521; Wed, 25 Nov 2020 05:17:03 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khnAs-0007CR-Vi; Wed, 25 Nov 2020 05:17:02 +0000
Received: by outflank-mailman (input) for mailman id 37256;
 Wed, 25 Nov 2020 05:17:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=TOsx=E7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
 id 1khnAr-0007CM-Fk
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 05:17:01 +0000
Received: from mailhost.m5p.com (unknown [74.104.188.4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e314a483-4a80-4544-a210-3a56f38fb724;
 Wed, 25 Nov 2020 05:17:00 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
 by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AP5GnNx028151
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
 Wed, 25 Nov 2020 00:16:55 -0500 (EST) (envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
 by m5p.com (8.15.2/8.15.2/Submit) id 0AP5Gmo6028150;
 Tue, 24 Nov 2020 21:16:48 -0800 (PST) (envelope-from ehem)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=TOsx=E7=m5p.com=ehem@srs-us1.protection.inumbo.net>)
	id 1khnAr-0007CM-Fk
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 05:17:01 +0000
X-Inumbo-ID: e314a483-4a80-4544-a210-3a56f38fb724
Received: from mailhost.m5p.com (unknown [74.104.188.4])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id e314a483-4a80-4544-a210-3a56f38fb724;
	Wed, 25 Nov 2020 05:17:00 +0000 (UTC)
Received: from m5p.com (mailhost.m5p.com [IPv6:2001:470:1f07:15ff:0:0:0:f7])
	by mailhost.m5p.com (8.15.2/8.15.2) with ESMTPS id 0AP5GnNx028151
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NO);
	Wed, 25 Nov 2020 00:16:55 -0500 (EST)
	(envelope-from ehem@m5p.com)
Received: (from ehem@localhost)
	by m5p.com (8.15.2/8.15.2/Submit) id 0AP5Gmo6028150;
	Tue, 24 Nov 2020 21:16:48 -0800 (PST)
	(envelope-from ehem)
Date: Tue, 24 Nov 2020 21:16:48 -0800
From: Elliott Mitchell <ehem+xen@m5p.com>
To: Roman Shaposhnik <roman@zededa.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
        Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen on RP4
Message-ID: <X73owDP0UXx+lvJd@mattapan.m5p.com>
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com>
 <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com>
 <X73ghKgQEXLv2z2p@mattapan.m5p.com>
 <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
X-Spam-Status: No, score=0.0 required=10.0 tests=KHOP_HELO_FCRDNS
	autolearn=unavailable autolearn_force=no version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mattapan.m5p.com

On Tue, Nov 24, 2020 at 08:45:32PM -0800, Roman Shaposhnik wrote:
> On Tue, Nov 24, 2020 at 8:41 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >
> > On Tue, Nov 24, 2020 at 08:01:32PM -0800, Roman Shaposhnik wrote:
> > > On Tue, Nov 24, 2020 at 7:37 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > Presently I'm using a 5.8 kernel with your patches and haven't seen
> > > > graphical output under Xen with either boot stack.  I've confirmed fully
> > > > operational graphics without Xen on Tianocore, I've confirmed operational
> > > > virtual terminals with U-Boot and not Xen.
> > > >
> > > > I had been planning to wait a bit before moving to 5.9, but if that is
> > > > the crucial ingredient I'll move early.
> > >
> > > We're still using 5.4 -- but it seems that the next LTS 5.10 is also functional.
> > >
> > > I can bet $10 whatever it is -- it is DT related ;-)
> >
> > Given how many of the pieces I'm assembling are alpha or beta level, I
> > estimate a 50:50 chance on that.  Good odds it is device-tree, but good
> > odds I grabbed a bad version of $something.
> >
> > I mostly wanted to know whether I was in completely uncharted territory
> > and needed to wait for others to catch up, versus merely working in a
> > situation where support is funky and I'm at an unknown location in
> > charted territory.
> >
> > I'll be keeping the Tianocore setup available since Xen on ARM really
> > /should/ allow ACPI...
> 
> I don't think you're in the uncharted -- so perhaps a bit of debugging left.
> 
> And, of course, alway feel free to compare what we do -- the image is
> docker pull away.

Actually, since device-tree is very much on my list of concerns, what is
your Xen boot process setup like?

Presently as previously mentioned I'm trying for
U-Boot -> GRUB/EFI -> Xen.  According to the information I currently have
the device-trees are often tied pretty closely to the kernel.  I'm also
using GRUB 2.04 since that has proper support for loading Xen on ARM.

The section of grub.cfg for Linux is roughly:
    linux /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
    devicetree /boot/dtb-5.8.10-2rp4-6.1.7
    initrd /boot/initrd.img-5.8.10-2rp4-6.1.7

My testing section for Xen is:
    xen_hypervisor /boot/xen-4.14-arm64.efi
    xen_module /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
    devicetree /boot/dtb-5.8.10-2rp4-6.1.7
    xen_module --nounzip /boot/initrd.img-5.8.10-2rp4-6.1.7

I've frankly got no idea how to ensure the correct device-tree is passed
to Xen.  Is GRUB's `devicetree` command correct when loading Xen?  Is a
device-tree matched to the Linux kernel appropriate for Xen?

(I'm guessing the second is "yes", but the first I don't have a clue)


-- 
(\___(\___(\______          --=> 8-) EHM <=--          ______/)___/)___/)
 \BS (    |         ehem+sigmsg@m5p.com  PGP 87145445         |    )   /
  \_CS\   |  _____  -O #include <stddisclaimer.h> O-   _____  |   /  _/
8A19\___\_|_/58D2 7E3D DDF4 7BA6 <-PGP-> 41D1 B375 37D0 8714\_|_/___/5445



