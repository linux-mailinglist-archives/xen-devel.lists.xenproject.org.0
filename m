Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D171C30A073
	for <lists+xen-devel@lfdr.de>; Mon,  1 Feb 2021 04:07:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.79511.144744 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6PYL-0008LD-1X; Mon, 01 Feb 2021 03:07:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 79511.144744; Mon, 01 Feb 2021 03:07:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l6PYK-0008Kq-Ui; Mon, 01 Feb 2021 03:07:00 +0000
Received: by outflank-mailman (input) for mailman id 79511;
 Mon, 01 Feb 2021 03:06:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WfTc=HD=gmail.com=tamas.k.lengyel@srs-us1.protection.inumbo.net>)
 id 1l6PYJ-0008Kl-QR
 for xen-devel@lists.xenproject.org; Mon, 01 Feb 2021 03:06:59 +0000
Received: from mail-wm1-x329.google.com (unknown [2a00:1450:4864:20::329])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 4dff7de0-4625-4442-b5f7-afd7254d7f7c;
 Mon, 01 Feb 2021 03:06:58 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id f16so11326514wmq.5
 for <xen-devel@lists.xenproject.org>; Sun, 31 Jan 2021 19:06:58 -0800 (PST)
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
X-Inumbo-ID: 4dff7de0-4625-4442-b5f7-afd7254d7f7c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OA5wXvIykS3+3x57uU2aiX9oKjvSpEg2ZJ+yujWKtOU=;
        b=VoLFSoN6UWBuTx5naMlWKxN30w2Ygw+SRTg3KtW9tOh0iSCrfbCUvQbSHQ8fBI4dtM
         eonCNmCoo8wq6VfYPYN88ecsPWNqVwWVAn1a2c1aCcIJJjDa22UK3sCgfW78SZg6PykM
         f7KGV7h9iwarzX4CSemTZXOGHhx8CAsffpFpjz/N4ioiez4DYF/xHdFBXbJ/ZRjVh15w
         y3/C5PWkIdMtdG83Ep+IU96B2hVj2dd7MRpzuUVG52vETwPG8NrpHz2mOL8ulWLJPp1V
         77av/jCqVsF4y9LVZu21Y/shkX+gVTacfvR1JGXSDV8TxKTOhQCPYLHluT1gX0D/c8Kg
         yMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OA5wXvIykS3+3x57uU2aiX9oKjvSpEg2ZJ+yujWKtOU=;
        b=Gbw5qvLKtV+nhYUUar+uIw4h0D2nfywbS2O6v14zrlwxn12zugS006IuksMBqg8oBx
         mM6h0mFm5/tkGooi86lZSwqNUQxlgPxCUQ29GB05NdW4GSImJqMsIrNEFB9hajpOPFKC
         0RvWyerWLkJx7TKXmE9TU340LleMTCa/plJyNuj4Il+YdV4VRQYCG3EPq6K87/WEIh39
         fuWLapov4XXjazW8+Kk5wtRhnDZZSfXnc5xQh6DBWZ8tzFuwfE+i18pOUstKoVc6ULlc
         uFs+XntqO0crYim8WDM3ixx9effYdUpEjhEQQmkDPSxzgIhSCjYEEywLNNKLiSU2IQbD
         cYRQ==
X-Gm-Message-State: AOAM5334me0Cz7AVeqDNlq648JBlx/wIqbCnC8BZiFSF0WEnbaYTGwSE
	2QlM4XHLSaJ3wnW6q9G4KanD4S6J26EsKTES5Cc=
X-Google-Smtp-Source: ABdhPJwo2Fxl3W9m0SGAR63okJjnFwDpecgf3n0+6l3t61F2tCKFboGWsgBLgnT1YnW/UwKZZ9k2jfsoM4NKzFH2ObI=
X-Received: by 2002:a1c:4d05:: with SMTP id o5mr3129251wmh.51.1612148817660;
 Sun, 31 Jan 2021 19:06:57 -0800 (PST)
MIME-Version: 1.0
References: <CABfawhnvgFLU=VmaqmKyf8DNeVcXoXTD2=XpiwnL0OikC1_z4w@mail.gmail.com>
 <YBc+Iaf1CCgXO0Aj@mattapan.m5p.com> <CABfawhncPyDKy_G2Lz7MaEb_ZoPadHef7S7KAj-fbCbQq6YNGA@mail.gmail.com>
 <YBdgf4KKcDn0SCOw@mattapan.m5p.com> <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
In-Reply-To: <CABfawhmrWX6tO-bESuF5oGec5cLbkHdyjdCGsfwX5AVrwQBsKA@mail.gmail.com>
From: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Date: Sun, 31 Jan 2021 22:06:21 -0500
Message-ID: <CABfawhmE20u8PpKK6N2SNwOSjeOyfhqa8U48jykswbw9Yhnpvg@mail.gmail.com>
Subject: Re: Xen 4.14.1 on RPI4: device tree generation failed
To: Elliott Mitchell <ehem+xen@m5p.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: text/plain; charset="UTF-8"

On Sun, Jan 31, 2021 at 9:43 PM Tamas K Lengyel
<tamas.k.lengyel@gmail.com> wrote:
>
> On Sun, Jan 31, 2021 at 8:59 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> >
> > On Sun, Jan 31, 2021 at 06:50:36PM -0500, Tamas K Lengyel wrote:
> > > On Sun, Jan 31, 2021 at 6:33 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
> > > >
> > > > On Sun, Jan 31, 2021 at 02:06:17PM -0500, Tamas K Lengyel wrote:
> > > > > (XEN) Unable to retrieve address 0 for /scb/pcie@7d500000/pci@1,0/usb@1,0
> > > > > (XEN) Device tree generation failed (-22).
> > > >
> > > > > Does anyone have an idea what might be going wrong here? I tried
> > > > > building the dtb without using the dtb overlay but it didn't seem to
> > > > > do anything.
> > > >
> > > > If you go to line 1412 of the file xen/arch/arm/domain_build.c and
> > > > replace the "return res;" with "continue;" that will bypass the issue.
> > > > The 3 people I'm copying on this message though may wish to ask questions
> > > > about the state of your build tree.
> > >
> > > I'll try that but it's a pretty hacky work-around ;)
> >
> > Actually no, it simply causes Xen to ignore these entries.  The patch
> > I've got ready to submit to this list also adjusts the error message to
> > avoid misinterpretation, but does pretty well exactly this.
> >
> > My only concern is whether it should ignore the entries only for Domain 0
> > or should always ignore them.
> >
> >
> > > > Presently the rpixen script is grabbing the RPF's 4.19 branch, dates
> > > > point to that last being touched last year.  Their tree is at
> > > > cc39f1c9f82f6fe5a437836811d906c709e0661c.
> > >
> > > I've moved the Linux branch up to 5.10 because there had been a fair
> > > amount of work that went into fixing Xen on RPI4, which got merged
> > > into 5.9 and I would like to be able to build upstream everything
> > > without the custom patches coming with the rpixen script repo.
> >
> > Please keep track of where your kernel source is checked out at since
> > there was a desire to figure out what was going on with the device-trees.
> >
> >
> > Including "console=hvc0 console=AMA0 console=ttyS0 console=tty0" in the
> > kernel command-line should ensure you get output from the kernel if it
> > manages to start (yes, Linux does support having multiple consoles at the
> > same time).
>
> No output from dom0 received even with the added console options
> (+earlyprintk=xen). The kernel build was from rpi-5.10.y
> c9226080e513181ffb3909a905e9c23b8a6e8f62. I'll check if it still boots
> with 4.19 next.

With rpi-4.19.y kernel and dtbs
(cc39f1c9f82f6fe5a437836811d906c709e0661c) Xen boots fine and the
previous error is not present. I get the boot log on the serial with
just console=hvc0 from dom0 but the kernel ends up in a panic down the
line:

(XEN) traps.c:1983:d0v0 HSR=0x93860046 pc=0xffffff80085ac97c
gva=0xffffff800b096000 gpa=0x0000003e330000
[    1.242863] Unhandled fault at 0xffffff800b096000
[    1.242871] Mem abort info:
[    1.242879]   ESR = 0x96000000
[    1.242893]   Exception class = DABT (current EL), IL = 32 bits
[    1.242922]   SET = 0, FnV = 0
[    1.242928]   EA = 0, S1PTW = 0
[    1.242934] Data abort info:
[    1.242941]   ISV = 0, ISS = 0x00000000
[    1.242948]   CM = 0, WnR = 0
[    1.242958] swapper pgtable: 4k pages, 39-bit VAs, pgdp = (____ptrval____)
[    1.242965] [ffffff800b096000] pgd=0000000033ffe003,
pud=0000000033ffe003, pmd=000000003230a003, pte=006800003e33070f
[    1.242989] Internal error: ttbr address size fault: 96000000 [#1]
PREEMPT SMP
[    1.242995] Modules linked in:
[    1.243005] Process swapper/0 (pid: 1, stack limit = 0x(____ptrval____))
[    1.243014] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.19.127-v8+ #1
[    1.243019] Hardware name: Raspberry Pi 4 Model B Rev 1.1 (DT)
[    1.243026] pstate: 20000005 (nzCv daif -PAN -UAO)
[    1.243044] pc : cfb_imageblit+0x58c/0x820
[    1.243054] lr : bcm2708_fb_imageblit+0x2c/0x40
[    1.243059] sp : ffffff800802b4e0
[    1.243063] x29: ffffff800802b4e0 x28: 00000000ffffffff
[    1.243073] x27: 0000000000000010 x26: ffffffc03212c000
[    1.243081] x25: 0000000000000020 x24: ffffffc0322c7d80
[    1.243088] x23: 0000000000000008 x22: ffffffc03212a118
[    1.243095] x21: 0000000000000000 x20: ffffff800b096000
[    1.243102] x19: 0000000000000000 x18: 00000000fffffffc
[    1.243109] x17: 0000000000000000 x16: ffffff800b096000
[    1.243116] x15: 0000000000000001 x14: 0000000000001e00
[    1.243124] x13: 0000000000000010 x12: 0000000000000000
[    1.243131] x11: 0000000000000020 x10: 0000000000000001
[    1.243138] x9 : 0000000000000008 x8 : ffffff800b096020
[    1.243145] x7 : ffffffc03212c001 x6 : 0000000000000000
[    1.243152] x5 : ffffff80089e2f78 x4 : 0000000000000000
[    1.243159] x3 : ffffff800b096000 x2 : ffffffc03212c000
[    1.243166] x1 : 0000000000000000 x0 : 0000000000000000
[    1.243173] Call trace:
[    1.243182]  cfb_imageblit+0x58c/0x820
[    1.243190]  bcm2708_fb_imageblit+0x2c/0x40
[    1.243197]  soft_cursor+0x16c/0x200
[    1.243204]  bit_cursor+0x30c/0x53c
[    1.243211]  fbcon_cursor+0x13c/0x1a0
[    1.243220]  hide_cursor+0x44/0xb0
[    1.243228]  redraw_screen+0x218/0x28c
[    1.243234]  fbcon_prepare_logo+0x380/0x3ec
[    1.243241]  fbcon_init+0x364/0x550
[    1.243248]  visual_init+0xbc/0x110
[    1.243256]  do_bind_con_driver.isra.0+0x1c4/0x3a0
[    1.243264]  do_take_over_console+0x148/0x204
[    1.243270]  do_fbcon_takeover+0x7c/0xe4
[    1.243277]  fbcon_event_notify+0x6d4/0x850
[    1.243288]  blocking_notifier_call_chain+0x90/0xc0
[    1.243297]  fb_notifier_call_chain+0x34/0x40
[    1.243303]  register_framebuffer+0x21c/0x300
[    1.243311]  bcm2708_fb_probe+0x340/0x770
[    1.243319]  platform_drv_probe+0x5c/0xb0
[    1.243325]  really_probe+0x290/0x3a4
[    1.243331]  driver_probe_device+0x60/0xf4
[    1.243337]  __driver_attach+0x118/0x13c
[    1.243347]  bus_for_each_dev+0x84/0xe0
[    1.243352]  driver_attach+0x34/0x40
[    1.243358]  bus_add_driver+0x1a8/0x21c
[    1.243364]  driver_register+0x7c/0x124
[    1.243371]  __platform_driver_register+0x58/0x64
[    1.243382]  bcm2708_fb_init+0x24/0x2c
[    1.243390]  do_one_initcall+0x54/0x248
[    1.243399]  kernel_init_freeable+0x2e4/0x384
[    1.243408]  kernel_init+0x1c/0x118
[    1.243415]  ret_from_fork+0x10/0x18
[    1.243425] Code: 8b0608a6 b94050c6 0a060026 4a0400c6 (b9000066)
[    1.243437] ---[ end trace b74230fc2252e944 ]---
[    1.243452] Kernel panic - not syncing: Attempted to kill init!
exitcode=0x0000000b
[    1.243452]
[    1.243464] SMP: stopping secondary CPUs
[    1.243512] Kernel Offset: disabled
[    1.243519] CPU features: 0x0,61006000
[    1.243523] Memory Limit: none
[    1.590409] ---[ end Kernel panic - not syncing: Attempted to kill
init! exitcode=0x0000000b
[    1.590409]  ]---

This seems to have been caused by a monitor being attached to the HDMI
port, with HDMI unplugged dom0 boots OK.

Tamas

