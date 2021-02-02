Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC04030B588
	for <lists+xen-devel@lfdr.de>; Tue,  2 Feb 2021 04:00:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80310.146841 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6lvj-0007J1-8o; Tue, 02 Feb 2021 03:00:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80310.146841; Tue, 02 Feb 2021 03:00:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6lvj-0007Ic-56; Tue, 02 Feb 2021 03:00:39 +0000
Received: by outflank-mailman (input) for mailman id 80310;
 Tue, 02 Feb 2021 03:00:37 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=wa+X=HE=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1l6lvh-0007IW-Fd
 for xen-devel@lists.xenproject.org; Tue, 02 Feb 2021 03:00:37 +0000
Received: from mail-qt1-x835.google.com (unknown [2607:f8b0:4864:20::835])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ffc1f792-79da-4844-b328-714c441af365;
 Tue, 02 Feb 2021 03:00:36 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id o18so13989368qtp.10
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 19:00:36 -0800 (PST)
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
X-Inumbo-ID: ffc1f792-79da-4844-b328-714c441af365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FpyXLBtamoyeVhEeer0d08+iA40GBj5AQwepqD5vymY=;
        b=DNcqeiKeAEqfTEab4FdDwjxCC6kqIseL0vvMy0ChKBciVsQtSCjvlcR+7fmob5qugm
         uvIvArslRRcbql417lHTQcciEBvGOgY+Cf1pZZvpmKala/e+gILOu9fBb4cGLFhfMGYg
         4/M4hcXM/aiadvU4FGkrIOStfwiCg/xcoaAXDX7mkw16s6q+af5HlQ+6rxRHGxBLzcS5
         BbQEYwyEpWO/3WHB/7sq/vGTa0L8hZePHJktpUjryrV/mtNT3i6UV0o6nyurjDMdAU7z
         BmgWhNWlNcyuguDC0wrWPAq9yB7rZHyaXlJ1KFlc90APGLiO0FMUEqZCy4G+9R1+FsmJ
         ZM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FpyXLBtamoyeVhEeer0d08+iA40GBj5AQwepqD5vymY=;
        b=k5xXIR5ZyQ+1I1CfjQt8VNSU82zahTp2nFRF6GCf5VrucMAU8boxv8M/gJAophvtZK
         lczuKhzSZ0MCckylF4fl7zQnPT8ZdRUuAxctb9XdXkOH6Cdkl9rv8YI11cTNwWpjOOCz
         y9z1i6ycg41gMrsSH9Cgm/VMhwpovCJohkU101yvBjpoGnPIK/o535AQ5ft2SkuSXvII
         OmVzCJLLDDdqZdtNjWsjoPzjUOgFrQT9QDHfGNsSC0nu9FFLJ3yP7YMbsqK+IxGyMx6v
         6E/0j9qAK1+FCitj8eM7Q7W+HMn588sFiNrC7Kj6cw6ajb7AfM3FZJ0ykzFaGNZxUSDn
         ehKQ==
X-Gm-Message-State: AOAM531cFp79ekQvZaRXdw97Jo4o4+6ex18YaL+PIiI991oR4sbi4TcP
	LaDoLcyjl1x3iFL0hry4j2ZUMMG5x473OY7ddFONGA==
X-Google-Smtp-Source: ABdhPJzeqSXzaFj2nnVZLoidEbN1pxnCAP8GlgW3BcL/BlxRxy99sW1qBkxzXV0ZAnq486jGLju7aZDM4Wp0plzH0V0=
X-Received: by 2002:ac8:524f:: with SMTP id y15mr18578044qtn.266.1612234836038;
 Mon, 01 Feb 2021 19:00:36 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com> <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
 <CABfawhktGwwXNdMrm4uShKSs5MvaUz2hG63wzcDA97z9pGL=Ug@mail.gmail.com>
 <alpine.DEB.2.21.2102011737010.29047@sstabellini-ThinkPad-T480s>
 <CAMmSBy--93yDWZcfhkDHHPxmydvJ4tyymwTzHCC4apObD4983Q@mail.gmail.com> <CABfawhkYmFB9Xc+zmvzA6ispiryfX1EgMWzYTSvHxD9Gmu=TUg@mail.gmail.com>
In-Reply-To: <CABfawhkYmFB9Xc+zmvzA6ispiryfX1EgMWzYTSvHxD9Gmu=TUg@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 1 Feb 2021 19:00:24 -0800
Message-ID: <CAMmSBy8343hi0PBRwtkCqpCsf2QOEcRzVOSo42Efn8oCaCYm+A@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Elliott Mitchell <ehem+xen@m5p.com>, 
	Xen-devel <xen-devel@lists.xenproject.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 6:53 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Mon, Feb 1, 2021 at 9:10 PM Roman Shaposhnik <roman@zededa.com> wrote:
> >
> > On Mon, Feb 1, 2021 at 5:40 PM Stefano Stabellini
> > <sstabellini@kernel.org> wrote:
> > >
> > > On Mon, 1 Feb 2021, Tamas K Lengyel wrote:
> > > > On Mon, Feb 1, 2021 at 10:23 AM Tamas K Lengyel
> > > > <tamas.k.lengyel@gmail.com> wrote:
> > > > >
> > > > > On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > > >
> > > > > > On Sun, Jan 31, 2021 at 10:06:21PM -0500, Tamas K Lengyel wrote:
> > > > > > > With rpi-4.19.y kernel and dtbs
> > > > > > > (cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
> > > > > > > previous error is not present. I get the boot log on the serial with
> > > > > > > just console=hvc0 from dom0 but the kernel ends up in a panic down the
> > > > > > > line:
> > > > > >
> > > > > > > This seems to have been caused by a monitor being attached to the HDMI
> > > > > > > port, with HDMI unplugged dom0 boots OK.
> > > > > >
> > > > > > The balance of reports seem to suggest 5.10 is the way to go if you want
> > > > > > graphics on a RP4 with Xen.  Even without Xen 4.19 is looking rickety on
> > > > > > RP4.
> > > > > >
> > > > > >
> > > > > > On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > > > > > > On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > > > > > >
> > > > > > > > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > > > > > > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > > > > > > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > > > > > > > point to that last being touched last year.  Their tree is at
> > > > > > > > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > > > > > > > >
> > > > > > > > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > > > > > > > amount of work that went into fixing Xen on RPI4, which got merged
> > > > > > > > > into 5.9 and I would like to be able to build upstream everything
> > > > > > > > > without the custom patches coming with the rpixen script repo.
> > > > > > > >
> > > > > > > > Please keep track of where your kernel source is checked out at since
> > > > > > > > there was a desire to figure out what was going on with the device-trees.
> > > > > > > >
> > > > > > > >
> > > > > > > > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > > > > > > > kernel command-line should ensure you get output from the kernel if it
> > > > > > > > manages to start (yes, Linux does support having multiple consoles at the
> > > > > > > > same time).
> > > > > > >
> > > > > > > No output from dom0 received even with the added console options
> > > > > > > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > > > > > > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > > > > > > with 4.19 next.
> > > > > >
> > > > > > So, their current HEAD.  This reads like you've got a problematic kernel
> > > > > > configuration.  What procedure are you following to generate the
> > > > > > configuration you use?
> > > > > >
> > > > > > Using their upstream as a base and then adding the configuration options
> > > > > > for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> > > > > > `make menuconfig`, `make zImage`).
> > > > > >
> > > > > > Notably the options:
> > > > > > CONFIG_PARAVIRT
> > > > > > CONFIG_XEN_DOM0
> > > > > > CONFIG_XEN
> > > > > > CONFIG_XEN_BLKDEV_BACKEND
> > > > > > CONFIG_XEN_NETDEV_BACKEND
> > > > > > CONFIG_HVC_XEN
> > > > > > CONFIG_HVC_XEN_FRONTEND
> > > > > >
> > > > > > Should be set to "y".
> > > > >
> > > > > Yes, these configs are all set the same way for all Linux builds by the script:
> > > > >         make O=.build-arm64 ARCH=arm64
> > > > > CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config
> > > > >
> > > > > I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
> > > > > dom0. So far only 4.19 boots.
> > > >
> > > > rpi-5.4.y boots but ends up in yet another different kernel panic:
> > >
> > > That's an interesting error. However, I can tell you that I can boot
> > > rpi-5.9.y just fine (without a monitor attached) with:
> > >
> > > cd linux
> > > KERNEL=kernel7l
> > > make bcm2711_defconfig
> > >
> > > As mentioned here:
> > >
> > > https://www.raspberrypi.org/documentation/linux/kernel/building.md
> > >
> > > and also taking the device tree from arch/arm64/boot/dts/broadcom/.
> >
> > FWIW: I see the same results with stock upstream 5.10.7 effectively
> > following the steps you're doing.
> >
> > However, as I keep saying -- the combination of firmware and u-boot
> > (in my case) is a very sensitive combination -- hence we're relying
> > on a very particular set of bits for there in EVE and will refuse to work
> > with anything else.
> >
> > It may be helpful to take that combination outside of EVE's context and
> > try it out in your experiments Tamas.
>
> Well, I'm giving up on this for now. I ran out of ideas to try and I
> don't see any useful suggestions on how to debug this further. Looks
> like it's super fragile and works only under specific conditions
> that's not well documented - if documented at all.

That's fair -- at the same time I honestly don't see how any other approach
but documenting that a BOM of versions is known to work together can be
really practical.

I mean -- at the end of the day that's why no user (well no sane user ;-)) takes
kernel from kernel.org directly -- most of them come through Linux distro BOM.

Thanks,
Roman.

