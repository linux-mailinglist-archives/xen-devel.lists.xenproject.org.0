Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D2D30B067
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 20:34:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.80112.146288 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6exi-0000xL-0W; Mon, 01 Feb 2021 19:34:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 80112.146288; Mon, 01 Feb 2021 19:34:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6exh-0000ww-TQ; Mon, 01 Feb 2021 19:34:13 +0000
Received: by outflank-mailman (input) for mailman id 80112;
 Mon, 01 Feb 2021 19:34:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6exg-0000wp-Bj
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 19:34:12 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1067ac81-1368-46cf-90a6-f513217c2e6e;
 Mon, 01 Feb 2021 19:34:11 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id c127so281991wmf.5
 for <xen-devel@lists.xenproject.org>; Mon, 01 Feb 2021 11:34:11 -0800 (PST)
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
X-Inumbo-ID: 1067ac81-1368-46cf-90a6-f513217c2e6e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CNxUoNjWhiavfXkFSSymJaiViS6oRJzcYybxl80N3nk=;
        b=gwUcxavhokGLM2SU/lpegkHm8EneQkP5BKQZGl4uVaZbE1vENt0EYE5cJ2URZMxvGX
         ml4fE3+ftlIieWrG27CSgpqs5vVVIMfbnOQ3cZkEpi5tH82OQHdttQzkBsfFEskaicsA
         sf0vd/r57UXostTCp7VV5Q8hsgMsjIdyINOd5F7lXU/pfv0zupDjiy4zM72ynQYQHLns
         p57PmARnizYS4yryl4HnP3zw+d/0RAh7F5jQhvl4kju1NndwTAeQpUuSs5p3WznuS0VH
         WSEyJ/CtBqMsgkzFbV2hqPVXtfOSyec0AkJO/5MLtN3uQP2yW2wr3WA+NPWc3L4YHszj
         okSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CNxUoNjWhiavfXkFSSymJaiViS6oRJzcYybxl80N3nk=;
        b=DO6cHDsZdD6SLOmM7eKhc9HZsNLTljlV+RARNt2o9BZPvzSRQ/QFU0t2ufXSCKvdte
         INFbR2LzaDy6V088K1yk/nxMe/Q7TxyNTOusOxG+Wrrs++aBXggVm/M8eiHyt84LmnZL
         gGtg5fn0la4xnBhrmWL9g56LYffLg3Gue5yx6kWESeqNTcYVQCa8MpuUZdfPc4mkHO5y
         Tf3c9Fav9Rd43Cl7IPqrNqgeIVBjgUy3ZCcVGkruJy1Gc2tLtRSAEFUmifGCbPij7HGg
         LPyvm4Nr7NMf/KEC4W2BMbKx2UfsGyczT1pll9k12E8ulEcJz3Dp2n9d+wVWhwO4CoE+
         pWVA==
X-Gm-Message-State: AOAM5315a6X2ft7EkKFrrPGaiAItf9Qi1SkLT4EBm86honE7C7J+XcTR
	PL1kXtSkQ4zsGUd51NLkbtuf2YHfqSOSMCFVMHU=
X-Google-Smtp-Source: ABdhPJxRfb0jeyKEB//h8w/pR+hDhLRxkFNu4AjS8FKgWMJJACFEk4FibLlCf6Aa+/NE6qq5gCTaofj+6NKbPk1eGT0=
X-Received: by 2002:a1c:f70c:: with SMTP id v12mr359301wmh.77.1612208050103;
 Mon, 01 Feb 2021 11:34:10 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
 <YBeXfWf8lQ2nwMtI@mattapan.m5p.com> <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
In-Reply-To: <CABfawhn74W88nJz5bCvA=VMxX_QqKv1ZaDQxOEtNZu5Pr8mFag@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Mon, 1 Feb 2021 14:33:34 -0500
Message-ID: <CABfawhktGwwXNdMrm4uShKSs5MvaUz2hG63wzcDA97z9pGL=Ug@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Feb 1, 2021 at 10:23 AM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Mon, Feb 1, 2021 at 12:54 AM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 10:06:21PM -0500, Tamas K Lengyel wrote:
> > > With rpi-4.19.y kernel and dtbs
> > > (cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
> > > previous error is not present. I get the boot log on the serial with
> > > just console=hvc0 from dom0 but the kernel ends up in a panic down the
> > > line:
> >
> > > This seems to have been caused by a monitor being attached to the HDMI
> > > port, with HDMI unplugged dom0 boots OK.
> >
> > The balance of reports seem to suggest 5.10 is the way to go if you want
> > graphics on a RP4 with Xen.  Even without Xen 4.19 is looking rickety on
> > RP4.
> >
> >
> > On Sun, Jan 31, 2021 at 09:43:13PM -0500, Tamas K Lengyel wrote:
> > > On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > > >
> > > > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > > > point to that last being touched last year.  Their tree is at
> > > > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > > > >
> > > > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > > > amount of work that went into fixing Xen on RPI4, which got merged
> > > > > into 5.9 and I would like to be able to build upstream everything
> > > > > without the custom patches coming with the rpixen script repo.
> > > >
> > > > Please keep track of where your kernel source is checked out at since
> > > > there was a desire to figure out what was going on with the device-trees.
> > > >
> > > >
> > > > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > > > kernel command-line should ensure you get output from the kernel if it
> > > > manages to start (yes, Linux does support having multiple consoles at the
> > > > same time).
> > >
> > > No output from dom0 received even with the added console options
> > > (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> > > c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> > > with 4.19 next.
> >
> > So, their current HEAD.  This reads like you've got a problematic kernel
> > configuration.  What procedure are you following to generate the
> > configuration you use?
> >
> > Using their upstream as a base and then adding the configuration options
> > for Xen has worked fairly well for me (`make bcm2711_defconfig`,
> > `make menuconfig`, `make zImage`).
> >
> > Notably the options:
> > CONFIG_PARAVIRT
> > CONFIG_XEN_DOM0
> > CONFIG_XEN
> > CONFIG_XEN_BLKDEV_BACKEND
> > CONFIG_XEN_NETDEV_BACKEND
> > CONFIG_HVC_XEN
> > CONFIG_HVC_XEN_FRONTEND
> >
> > Should be set to "y".
>
> Yes, these configs are all set the same way for all Linux builds by the script:
>         make O=.build-arm64 ARCH=arm64
> CROSS_COMPILE=aarch64-none-linux-gnu- bcm2711_defconfig xen.config
>
> I tried with both the rpi-5.10.y and rpi-5.9.y, neither boot up as
> dom0. So far only 4.19 boots.

rpi-5.4.y boots but ends up in yet another different kernel panic:

(XEN) d0v1: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v2: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
(XEN) d0v3: vGICD: unhandled word write 0x000000ffffffff to ICACTIVER0
[    0.354800] Detected PIPT I-cache on CPU1
[    0.360473] Xen: initializing cpu1
[    0.360508] CPU1: Booted secondary processor 0x0000000001 [0x410fd083]
[    0.361674] Detected PIPT I-cache on CPU2
[    0.367323] Xen: initializing cpu2
[    0.367357] CPU2: Booted secondary processor 0x0000000002 [0x410fd083]
[    0.368460] Detected PIPT I-cache on CPU3
[    0.374110] Xen: initializing cpu3
[    0.374144] CPU3: Booted secondary processor 0x0000000003 [0x410fd083]
[    0.374357] smp: Brought up 1 node, 4 CPUs
[    0.421250] SMP: Total of 4 processors activated.
[    0.426051] CPU features: detected: 32-bit EL0 Support
[    0.431344] CPU features: detected: CRC32 instructions
[    0.459837] ------------[ cut here ]------------
[    0.463848] CPU: CPUs started in inconsistent modes
[    0.463925] Internal error: aarch64 BRK: f2000800 [#1] PREEMPT SMP
[    0.475143] Modules linked in:
[    0.478308] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.4.83-v8+ #1
[    0.484712] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
[    0.490686] pstate: 60000005 (nZCv daif -PAN -UAO)
[    0.495615] pc : smp_cpus_done+0x74/0x98
[    0.499642] lr : smp_cpus_done+0x74/0x98
[    0.503687] sp : ffffffc01002bdf0
[    0.507102] x29: ffffffc01002bdf0 x28: 0000000000000000
[    0.512545] x27: 0000000000000000 x26: ffffffc010f08958
[    0.517989] x25: ffffffc010f286c8 x24: 0000000000000040
[    0.523442] x23: ffffffc010f08000 x22: ffffffc010f28000
[    0.528876] x21: ffffffc010f08918 x20: ffffffc010f08aa0
[    0.534331] x19: 0000000000000100 x18: 0000000000000000
[    0.539764] x17: 000000004d4bcabc x16: 00000000deadbeef
[    0.545209] x15: 0000000000000030 x14: ffffffffffffffff
[    0.550652] x13: ffffffc09002ba87 x12: ffffffc01002ba8f
[    0.556096] x11: ffffffc01002bdf0 x10: ffffffc01002bdf0
[    0.561540] x9 : 00000000ffffffc8 x8 : 636e69206e692064
[    0.566984] x7 : 6574726174732073 x6 : ffffffc010f09000
[    0.572427] x5 : ffffffc010f09098 x4 : ffffffc01002c000
[    0.577871] x3 : 0000000000000000 x2 : 0000000000000000
[    0.583315] x1 : 0000000000000000 x0 : ffffff8036948000
[    0.588759] Call trace:
[    0.591310]  smp_cpus_done+0x74/0x98
[    0.594999]  smp_init+0xe4/0xfc
[    0.598245]  kernel_init_freeable+0x134/0x27c
[    0.602726]  kernel_init+0x1c/0x118
[    0.606326]  ret_from_fork+0x10/0x18
[    0.610016] Code: 540000c0 90fff480 9125a000 97cb8545 (d4210000)
[    0.616251] ---[ end trace 828ddf3cc765197a ]---
[    0.620987] note: swapper/0[1] exited with preempt_count 1
[    0.626610] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    0.634425] SMP: stopping secondary CPUs
[    0.638511] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b ]---

Tamas

