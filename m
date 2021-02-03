Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5B930D037
	for <lists+xen-devel@lfdr.de>; Wed,  3 Feb 2021 01:19:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80756.147901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l75se-0006Q8-TX; Wed, 03 Feb 2021 00:18:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80756.147901; Wed, 03 Feb 2021 00:18:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l75se-0006Pj-QT; Wed, 03 Feb 2021 00:18:48 +0000
Received: by outflank-mailman (input) for mailman id 80756;
 Wed, 03 Feb 2021 00:18:47 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1qtc=HF=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1l75sd-0006Pe-Kw
 for xen-devel@lists.xenproject.org; Wed, 03 Feb 2021 00:18:47 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id b2c44d46-5c53-4c44-90f6-a0b483c01606;
 Wed, 03 Feb 2021 00:18:46 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 63B2264DF2;
 Wed,  3 Feb 2021 00:18:45 +0000 (UTC)
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
X-Inumbo-ID: b2c44d46-5c53-4c44-90f6-a0b483c01606
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1612311525;
	bh=BBeVyJ1xqUGjOrP+LecHUrqgLayyqMyZ4uABjyP3H00=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=VyIuS40MkOZPMbKXA9jT1IhMaMM2Ffxd0B2wPI8/S1T+m04NSo9J/JMhOs4DXfEDX
	 dBz98tYUA92nC+z9CfYSbUroVFZ9MXTElzP5tKOjwNh82KBJLrmbkt4T90TNHOiRz3
	 Cn7J36mzBKwkwWUQA07LVrSOIM0qLRbfuv6EbKgQWx/gEjZysv7uur2vyk5IO1W66n
	 l1thgpYZq9Nleib2BGntiGLpljFVLkjERjmUls33uOFsL0vg1o/WOD1JU7PgXZPnL8
	 wA5SZ6m5QfL1Ky+kBt/NmFFL5RDAz+zRz82qVvZSuxjhHIQbvhhcpAAoVLhDmmVb+T
	 WT59fsv7ARDtQ==
Date: Tue, 2 Feb 2021 16:18:44 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Jukka Kaartinen <jukka.kaartinen@unikie.com>
cc: Roman Shaposhnik <roman@zededa.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Xen-devel <xen-devel@lists.xenproject.org>, 
    Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Question about xen and Rasp 4B
In-Reply-To: <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
Message-ID: <alpine.DEB.2.21.2102021552380.29047@sstabellini-ThinkPad-T480s>
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com> <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s> <CAFnJQOqoqj6mWwR61ZsZj1JxRrdisFtH_87YXCeW619GM+L21Q@mail.gmail.com> <alpine.DEB.2.21.2101251646470.20638@sstabellini-ThinkPad-T480s>
 <CAFnJQOpuehAWde5Ta4ud9CGufwZ-K+=60epzSdKc_DnS75O2iA@mail.gmail.com> <alpine.DEB.2.21.2101261149210.2568@sstabellini-ThinkPad-T480s> <CAFnJQOpgRM-3_aZsnv36w+aQV=gMcBA18ZEw_-man7zmYb4O4Q@mail.gmail.com> <5a33e663-4a6d-6247-769a-8f14db4810f2@xen.org>
 <b9247831-335a-f791-1664-abed6b400a42@unikie.com> <CAMmSBy-54qtu_oVVT=KB8GeKP0SW0uK+4wQ_LooHE0y_MZKJQg@mail.gmail.com> <3ec2b0cb-3685-384e-94df-28eaf8b57c42@unikie.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 2 Feb 2021, Jukka Kaartinen wrote:
> Hi Roman,
> 
> > > > 
> > > Good catch.
> > > GPU works now and I can start X! Thanks! I was also able to create domU
> > > that runs Raspian OS.
> > 
> > This is very interesting that you were able to achieve that - congrats!
> > 
> > Now, sorry to be a bit dense -- but since this thread went into all
> > sorts of interesting
> > directions all at once -- I just have a very particular question: what is
> > exact
> > combination of versions of Xen, Linux kernel and a set of patches that went
> > on top that allowed you to do that? I'd love to obviously see it
> > productized in Xen
> > upstream, but for now -- I'd love to make available to Project EVE/Xen
> > community
> > since there seems to be a few folks interested in EVE/Xen combo being able
> > to
> > do that.
> 
> I have tried Xen Release 4.14.0, 4.14.1 and master (from week 4, 2021).
> 
> Kernel rpi-5.9.y and rpi-5.10.y branches from
> https://github.com/raspberrypi/linux
> 
> and
> 
> U-boot (master).
> 
> For the GPU to work it was enough to disable swiotlb from the kernel(s) as
> suggested in this thread.

How are you configuring and installing the kernel?

make bcm2711_defconfig
make Image.gz
make modules_install

?

The device tree is the one from the rpi-5.9.y build? How are you loading
the kernel and device tree with uboot? Do you have any interesting
changes to config.txt?

I am asking because I cannot get to the point of reproducing what you
are seeing: I can boot my rpi-5.9.y kernel on recent Xen but I cannot
get any graphics output on my screen. (The serial works.) I am using the
default Ubuntu Desktop rpi-install target as rootfs and uboot master.

