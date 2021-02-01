Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C97830AB1F
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 16:24:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79970.145949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b3l-0006aA-IO; Mon, 01 Feb 2021 15:24:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79970.145949; Mon, 01 Feb 2021 15:24:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6b3l-0006Zl-F2; Mon, 01 Feb 2021 15:24:13 +0000
Received: by outflank-mailman (input) for mailman id 79970;
 Mon, 01 Feb 2021 15:24:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6b3k-0006ZW-5f
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 15:24:12 +0000
Received: from mail-wr1-x42c.google.com (unknown [2a00:1450:4864:20::42c])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id df22a960-350d-491c-864a-28077ccffca7;
 Mon, 01 Feb 2021 15:24:11 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id c4so14291951wru.9
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 07:24:11 -0800 (PST)
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
X-Inumbo-ID: df22a960-350d-491c-864a-28077ccffca7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JomcygMoFAs9Y2GP+k0r376V1/eph2W1tdPkMO1ncJw=;
        b=OBpBjLOxdQLBtqhkZHgcVllHh0btVEdpIxHw6bQ81Fo4MnYpsKNuTAxVyj4cDpzqOv
         22CV6rTZLP7Gb5DsJfWcsHOhm++MoS4qecJuWJxkb8ycpg56CTyxKeEkqOlQBWeyfuhR
         K9w9s0BQ5yjrXTvvI9EU8corn0pouoFLV8l765wntdEczupvsZvxtD+YdpBow0ZyK0Le
         uukBfxd+wM6jJpRBuvXcjRTEE1+r4jvRc90vgaAU9Nyes3Y3kv5SLadhYqQJGyNZyu3K
         1D1ukqcmI/276GBUXTbCadRBpI5bBhzK4CEhEwc78mSk0VOR+/Tr4n8idzjSIRg4ewOf
         +aSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JomcygMoFAs9Y2GP+k0r376V1/eph2W1tdPkMO1ncJw=;
        b=fOhxtIu4uvHkMREY28xOV073Jm/h/MiN/ErO6FhH5rwIMdaIy3QbuAE5K5LxK1E58e
         RwvJuHK7bmVnT/JBKk6ylxOF2EmSIGn9zuYfuWcWLHsmARmW1pzffSSurxkbDj32Y4QA
         khAK7N/4cTO2OnHSr79sr8oRHs2FSlbqgBZJP9cvuwOzrBTkXeG8CvTnMc35g92dhttC
         iENyU+zVB94MXciqVOSANUaeziFnWYH465ybKZs8LAOtf0uicGGFNalbZZoDbjUd9bGJ
         IYNcU0M1swVj46tRsIfNugFEhdaOGPExU36raib5zVn2yotTid/h1huWoSnj/TT6p4Ul
         qSYQ==
X-Gm-Message-State: AOAM5328MotRncgje4Y2hyqMPT3nP8+ndRxLlWsjCoyy3Sa4gzpv6gFT
	BV7BbbzFTZb81tQ8L/YdDkRPsyJTy+tmb7ym8DI=
X-Google-Smtp-Source: ABdhPJyTeAodM5OiaoEu+u/eFdsZCWL9qjderSYLEMXGfnhLDaRu1ujwiemKtsV/4CqAzf8Im4wlO/lH56MtY0SbIKU=
X-Received: by 2002:a05:6000:1547:: with SMTP id 7mr18921939wry.301.1612193050345;
 Mon, 01 Feb 2021 07:24:10 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com>
In-Reply-To: <YBeXfWf8lQ2nwMtI@mattapan.m5p.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 1 Feb 2021 10:23:34 -0500
Message-ID: <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
>
> On Sun, Jan 31, 2021 at 10:06:21PM -0500, Tamas K Lengyel wrote:
> > With rpi-4.19.y kernel and dtbs
> > (cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
> > previous error is not present. I get the boot log on the serial with
> > just console=hvc0 from dom0 but the kernel ends up in a panic down the
> > line:
>
> > This seems to have been caused by a monitor being attached to the HDMI
> > port, with HDMI unplugged dom0 boots OK.
>
> The balance of reports seem to suggest 5.10 is the way to go if you want
> graphics on a RP4 with Xen.  Even without Xen 4.19 is looking rickety on
> RP4.
>
>
> On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > >
> > > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > > point to that last being touched last year.  Their tree is at
> > > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > > >
> > > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > > amount of work that went into fixing Xen on RPI4, which got merged
> > > > into 5.9 and I would like to be able to build upstream everything
> > > > without the custom patches coming with the rpixen script repo.
> > >
> > > Please keep track of where your kernel source is checked out at since
> > > there was a desire to figure out what was going on with the device-trees.
> > >
> > >
> > > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > > kernel command-line should ensure you get output from the kernel if it
> > > manages to start (yes, Linux does support having multiple consoles at the
> > > same time).
> >
> > No output from dom0 received even with the added console options
> > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > with 4.19 next.
>
> So, their current HEAD.  This reads like you've got a problematic kernel
> configuration.  What procedure are you following to generate the
> configuration you use?
>
> Using their upstream as a base and then adding the configuration options
> for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> `make menuconfig`, `make zImage`).
>
> Notably the options:
> CONFIG_PARAVIRT
> CONFIG_XEN_DOM0
> CONFIG_XEN
> CONFIG_XEN_BLKDEV_BACKEND
> CONFIG_XEN_NETDEV_BACKEND
> CONFIG_HVC_XEN
> CONFIG_HVC_XEN_FRONTEND
>
> Should be set to "y".

Yes, these configs are all set the same way for all Linux builds by the script:
        make O=.build-arm64 ARCH=arm64
CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config

I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
dom0. So far only 4.19 boots.

Tamas

