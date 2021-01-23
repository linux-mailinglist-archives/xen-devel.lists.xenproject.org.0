Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E5E3016FA
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 17:48:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73459.132391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3M5G-000587-Rf; Sat, 23 Jan 2021 16:48:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73459.132391; Sat, 23 Jan 2021 16:48:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l3M5G-00057m-Od; Sat, 23 Jan 2021 16:48:22 +0000
Received: by outflank-mailman (input) for mailman id 73459;
 Sat, 23 Jan 2021 16:48:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cw0p=G2=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1l3M5F-00057b-B7
 for xen-devel@lists.xenproject.org; Sat, 23 Jan 2021 16:48:21 +0000
Received: from mail-ej1-x630.google.com (unknown [2a00:1450:4864:20::630])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e991adfb-311b-4b86-aa35-c84e72b37f5c;
 Sat, 23 Jan 2021 16:48:20 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id 6so12085523ejz.5
 for <xen-devel@lists.xenproject.org>; Sat, 23 Jan 2021 08:48:20 -0800 (PST)
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
X-Inumbo-ID: e991adfb-311b-4b86-aa35-c84e72b37f5c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4FA20mUzGxNcyR0WA6zXqMf5LkfXZKqBDnFiBJfsc+4=;
        b=al+UtG6kg77BGtLbgbe9ajRHWkEA4DBJLYe52Lze/lMOTQL5ECDnq5qLtztBNuRe6i
         J6UYiJbW97oSzhs6xJoNCltuHwzE5AjVYveINYLUsV29avxlxtxk57YIV8dkhwLhZtJV
         QZjTpfiM8aCkmY70i/W9Af/sxDLr/Gcv4621VVbqtz7HHhcDpdyvwxRtCSXa+mphREdn
         d88zjKgNOuTC2QtKDlETvms0qKqxDhelPpJKF+jEjbkZhwh8Sjkm+ccejqgb5VWyRgei
         Id9Vlxk/DVNfz5YNyuUJI4w5YIqkJPsmkJJQS3vxTs0gA7GKb/oCoptjROndZGSHs3Qn
         f83A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4FA20mUzGxNcyR0WA6zXqMf5LkfXZKqBDnFiBJfsc+4=;
        b=eH6BVStcgRYBEvGtjQDt73uxiQ6jj4rX8sU+bFI4HGvyyTfo3g1CVrbcbD9pcFZfNM
         LNe9PuSgc6tUZgRkJq763OigjIc5H8GJERf2LuxafMHyVcYi1Y7itIjGkmNfx5c5oybl
         79uJlbJYaonP80U/1rCv+vvdgWSLNyZWq423UG+yl0K7Y0SPtPpuZW0RXpKo/tKlo3TN
         HnBCxKU/kio3dk83QGEceP7e2cl/5D7maxFijPzUe4tOVRBdj/mEZqqDW52dC8VQrI/V
         7/hgIAhoGmsFq/X4lGba/3kdPryrrgcZnPuWNy6ZKJGsz/KbWgGAf4Qdek/SWYoqamcr
         8/uw==
X-Gm-Message-State: AOAM533QemUs3nYl0V3wy/E4vzp+6SZUv/a3d2B22W6rzGjIk1awXuZc
	ld7dsJo7PJBMYgqyblpFhLnyVBmSFTtmjdoAuj8=
X-Google-Smtp-Source: ABdhPJyNrQw4MWyw4gsTXZD9LKFZA4rKUhKkOctsTXCbGm0KlMaqyTdhPXkrPDqjqH672esbP2VaGeJrBy2LmfOAzUA=
X-Received: by 2002:a17:906:46d3:: with SMTP id k19mr2095649ejs.546.1611420499461;
 Sat, 23 Jan 2021 08:48:19 -0800 (PST)
MIME-Version: 1.0
References: <CAFnJQOouOUox_kBB66sfSuriUiUSvmhSjPxucJjgrB9DdLOwkg@mail.gmail.com>
 <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.2101221449480.14612@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Sat, 23 Jan 2021 16:48:08 +0000
Message-ID: <CAJ=z9a1_CbOSB_WcQGsLJ9JmkJ3AcLm2s-AirVJkFoKRxy-5Ug@mail.gmail.com>
Subject: Re: Question about xen and Rasp 4B
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Jukka Kaartinen <jukka.kaartinen@unikie.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	Roman Shaposhnik <roman@zededa.com>, Bertrand Marquis <Bertrand.Marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"

On Sat, 23 Jan 2021 at 00:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
>
> + xen-devel, Roman,
>
>
> On Fri, 22 Jan 2021, Jukka Kaartinen wrote:
> > Hi Stefano,
> > I'm Jukka Kaartinen a SW developer working on enabling hypervisors on mobile platforms. One of our HW that we use on development is
> > Raspberry Pi 4B. I wonder if you could help me a bit :).
> >
> > I'm trying to enable the GPU with Xen + Raspberry Pi for dom0. https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323#p1797605
> >
> > I got so far that GPU drivers are loaded (v3d & vc4) without errors. But now Xen returns error when X is starting:
> > (XEN) traps.c:1986:d0v1 HSR=0x93880045 pc=0x00007f97b14e70 gva=0x7f7f817000 gpa=0x0000401315d000
> >  I tried to debug what causes this and looks like find_mmio_handler cannot find handler.
> > (See more here: https://www.raspberrypi.org/forums/viewtopic.php?f=63&t=232323&start=25#p1801691 )
> >
> > Any ideas why the handler is not found?
>
>
> Hi Jukka,
>
> I am glad to hear that you are interested in Xen on RaspberryPi :-)  I
> haven't tried the GPU yet, I have been using the serial only.
> Roman, did you ever get the GPU working?
>
>
> The error is a data abort error: Linux is trying to access an address
> which is not mapped to dom0. The address seems to be 0x401315d000. It is
> a pretty high address; I looked in device tree but couldn't spot it.
>
> From the HSR (the syndrom register) it looks like it is a translation
> fault at EL1 on stage1.

Hmmm.... We don't trap stage 1 faults to Xen, instead they are
received by the OS directly.

In fact the ESR_El1, indicates that it is a translation fault at level
1 when walking the stage-2 page-table. So it means the guest physical
address is not mapped in the P2M. But...


> As if the Linux address mapping was wrong.

... I think the GPA is bogus. So I agree Linux may have configured the
stage-1 page-tables incorrectly.

>
> Anyone has any ideas how this could happen? Maybe a reserved-memory
> misconfiguration?

It looks like to me both the PC and the GVA points to user memory.
Normally, Xen will inject a data abort into Linux and will usually
dump some information (e.g. the task running).

@Jukka, would it be possible to provide the console out for both Xen and Linux?

Would you also be able to confirm if the same setup is working when
Linux is running directly on the HW? This would give us an idea
whether the issue is specific to Xen.

Cheers,

