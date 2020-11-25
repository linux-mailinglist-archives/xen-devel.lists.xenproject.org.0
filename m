Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 26B192C47FA
	for <lists+xen-devel@lfdr.de>; Wed, 25 Nov 2020 19:58:12 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.38012.70607 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khzyx-0005YX-Dq; Wed, 25 Nov 2020 18:57:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 38012.70607; Wed, 25 Nov 2020 18:57:35 +0000
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
	id 1khzyx-0005Y8-AO; Wed, 25 Nov 2020 18:57:35 +0000
Received: by outflank-mailman (input) for mailman id 38012;
 Wed, 25 Nov 2020 18:57:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1khzyv-0005Y3-Rl
 for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:57:33 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 32a09210-cc62-428d-9597-cab54c39a125;
 Wed, 25 Nov 2020 18:57:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net
 [24.130.65.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E52C9206B7;
 Wed, 25 Nov 2020 18:57:31 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gEFk=E7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
	id 1khzyv-0005Y3-Rl
	for xen-devel@lists.xenproject.org; Wed, 25 Nov 2020 18:57:33 +0000
X-Inumbo-ID: 32a09210-cc62-428d-9597-cab54c39a125
Received: from mail.kernel.org (unknown [198.145.29.99])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 32a09210-cc62-428d-9597-cab54c39a125;
	Wed, 25 Nov 2020 18:57:33 +0000 (UTC)
Received: from sstabellini-ThinkPad-T480s (c-24-130-65-46.hsd1.ca.comcast.net [24.130.65.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id E52C9206B7;
	Wed, 25 Nov 2020 18:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1606330652;
	bh=YO+kG2LVM3sApEzWV/IU7WRu36EtZFAtR4zZS2rn9JI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bm3+oASnnYy2wFcTSIRTtaTIyVLH/5XiWa6hNme9n74djmfmaVl0N5/LeyvKcSygU
	 yneMbxnlOeEgn90pboMzs7CUFagKFm09RZbhbCvfOSkyXBT9OJqW/psR9DM0iLn9X1
	 YqeMDbtTQJQHoVOYzpL1mUjd6WUpqO+HW8oD7ERg=
Date: Wed, 25 Nov 2020 10:57:31 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Elliott Mitchell <ehem+xen@m5p.com>
cc: Roman Shaposhnik <roman@zededa.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Xen on RP4
In-Reply-To: <X73owDP0UXx+lvJd@mattapan.m5p.com>
Message-ID: <alpine.DEB.2.21.2011251051240.7979@sstabellini-ThinkPad-T480s>
References: <X73RfHfRfBRLKkvB@mattapan.m5p.com> <CAMmSBy8dtUQotUeX2MVke7d2nWS0shvKPL_S=4tUeF0UKh4vgA@mail.gmail.com> <X73ghKgQEXLv2z2p@mattapan.m5p.com> <CAMmSBy-Qdpj+6FAk9D15=+87_=68T80Y1NGnvyAB=tOFveifiQ@mail.gmail.com>
 <X73owDP0UXx+lvJd@mattapan.m5p.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 24 Nov 2020, Elliott Mitchell wrote:
> On Tue, Nov 24, 2020 at 08:45:32PM -0800, Roman Shaposhnik wrote:
> > On Tue, Nov 24, 2020 at 8:41 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > >
> > > On Tue, Nov 24, 2020 at 08:01:32PM -0800, Roman Shaposhnik wrote:
> > > > On Tue, Nov 24, 2020 at 7:37 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > > Presently I'm using a 5.8 kernel with your patches and haven't seen
> > > > > graphical output under Xen with either boot stack.  I've confirmed fully
> > > > > operational graphics without Xen on Tianocore, I've confirmed operational
> > > > > virtual terminals with U-Boot and not Xen.
> > > > >
> > > > > I had been planning to wait a bit before moving to 5.9, but if that is
> > > > > the crucial ingredient I'll move early.
> > > >
> > > > We're still using 5.4 -- but it seems that the next LTS 5.10 is also functional.
> > > >
> > > > I can bet $10 whatever it is -- it is DT related ;-)
> > >
> > > Given how many of the pieces I'm assembling are alpha or beta level, I
> > > estimate a 50:50 chance on that.  Good odds it is device-tree, but good
> > > odds I grabbed a bad version of $something.
> > >
> > > I mostly wanted to know whether I was in completely uncharted territory
> > > and needed to wait for others to catch up, versus merely working in a
> > > situation where support is funky and I'm at an unknown location in
> > > charted territory.
> > >
> > > I'll be keeping the Tianocore setup available since Xen on ARM really
> > > /should/ allow ACPI...
> > 
> > I don't think you're in the uncharted -- so perhaps a bit of debugging left.
> > 
> > And, of course, alway feel free to compare what we do -- the image is
> > docker pull away.
> 
> Actually, since device-tree is very much on my list of concerns, what is
> your Xen boot process setup like?
> 
> Presently as previously mentioned I'm trying for
> U-Boot -> GRUB/EFI -> Xen.  According to the information I currently have
> the device-trees are often tied pretty closely to the kernel.  I'm also
> using GRUB 2.04 since that has proper support for loading Xen on ARM.
> 
> The section of grub.cfg for Linux is roughly:
>     linux /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
>     devicetree /boot/dtb-5.8.10-2rp4-6.1.7
>     initrd /boot/initrd.img-5.8.10-2rp4-6.1.7
> 
> My testing section for Xen is:
>     xen_hypervisor /boot/xen-4.14-arm64.efi
>     xen_module /boot/vmlinuz-5.8.10-2rp4-6.1.7 root=UUID=01234567-dead-beef-d13d-456789abcdef ro
>     devicetree /boot/dtb-5.8.10-2rp4-6.1.7
>     xen_module --nounzip /boot/initrd.img-5.8.10-2rp4-6.1.7
> 
> I've frankly got no idea how to ensure the correct device-tree is passed
> to Xen.  Is GRUB's `devicetree` command correct when loading Xen?  Is a
> device-tree matched to the Linux kernel appropriate for Xen?
> 
> (I'm guessing the second is "yes", but the first I don't have a clue)

Yes, devicetree is correct. I have not used the graphical output, so I
cannot help you there but yes the best bet is to use the devicetree that
comes with the kernel.

One thing I noticed is that you are missing some of the command line
arguments for Xen and Linux in your grub config. For instance on the Xen
line you want to have something like:

    dom0_mem=1024M console=dtuart sync_console

And on the Linux line you might want to have:

    console=tty0 console=hvc0

