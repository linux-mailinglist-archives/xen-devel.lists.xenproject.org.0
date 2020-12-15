Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050E02DA6A0
	for <lists+xen-devel@lfdr.de>; Tue, 15 Dec 2020 04:04:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.52848.92235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0cz-0001hd-Py; Tue, 15 Dec 2020 03:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 52848.92235; Tue, 15 Dec 2020 03:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kp0cz-0001hE-Mc; Tue, 15 Dec 2020 03:03:53 +0000
Received: by outflank-mailman (input) for mailman id 52848;
 Tue, 15 Dec 2020 03:03:51 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=1f4I=FT=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1kp0cx-0001h9-O1
 for xen-devel@lists.xenproject.org; Tue, 15 Dec 2020 03:03:51 +0000
Received: from mail-qt1-x82f.google.com (unknown [2607:f8b0:4864:20::82f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e55b74dd-a02b-4dc6-8deb-0b039bfd4178;
 Tue, 15 Dec 2020 03:03:50 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id u21so13560520qtw.11
 for <xen-devel@lists.xenproject.org>; Mon, 14 Dec 2020 19:03:50 -0800 (PST)
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
X-Inumbo-ID: e55b74dd-a02b-4dc6-8deb-0b039bfd4178
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=zededa.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ggYZD+SM3a3cNaKWBnWmpkSzvr816tA57UspaGTVGlY=;
        b=eQkbVRf3FGEyfkNY89DlkWxcAnOdAmU82TXGScLnqc1Nk5kmUB1VI+olhELuYORfJT
         r3z4K0fcvay0YCPjOxqTS1XnWSMwzpruF+hD4v3XU94z/mtRoW5pg4dHZedUiXBbYxtg
         dkHzOtz452+G1xut+MlCrPhEg9P2cpG52kysIXmV8ntQ/Qr5zaY+mKrdBfvbFdDZQIse
         EVD1ZuULicQKwtgTd/LO3zX+TEXaUnQ1pQPvGE02oyBOnNo9f45GI4BWtLYiwohZ0SG5
         krS+NyoIZnbiNwg764dKAkTobZ6YLtUen93eHsn63ODuLaf56zOjH3zWJNWkj3n781o5
         cRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ggYZD+SM3a3cNaKWBnWmpkSzvr816tA57UspaGTVGlY=;
        b=Nrogw82++41V+WAAYWfFNFeoQgGCC9IlS3DyOnX5Uw/TtH2ltFcwf+CBnZZ2H1dLWc
         WKc5aUTvdvN4BRV86EpJWEjwBE+/YzlqCtJOfg9t8jvvc3zkt5JL5AcKDxWXPluUPHsh
         HferTjafj8jNs4u3BSYEh21mc2kCbNk9Ym/A7XoMkD0soW1DSFZxj1Bb3UyPjlDCFprU
         vzOtE/GBa6l2vR5A75Hz+Rk5eTMwsnD+t/qJOpJcC8UFCF75iJVNc/DmtlMquyfzrylT
         E3ByC7BJ2HswhEXY6B5lK+iii0ivreX4pdcWvh5gve4pLTeTNNJZHKqSb4qJFxae+LQ8
         /jSQ==
X-Gm-Message-State: AOAM530M1xWmzBpOUQUQ9crjRQfE6ROIOzxB+bvI5gWfCaj3uFyOzYii
	55fpf1O0JALFejHqT8UBjuzwIdTmZN45CTAx+qHmjRbCUUg=
X-Google-Smtp-Source: ABdhPJwIKdMJMIdCiR6utTsmb8zT6ut1Nlm7Hm/UCaozFHHtczKspI3WBxkqzsLe/W7XzxTZQRQmBPl6gAynKs1xdDk=
X-Received: by 2002:ac8:4e39:: with SMTP id d25mr34409481qtw.266.1608001430531;
 Mon, 14 Dec 2020 19:03:50 -0800 (PST)
MIME-Version: 1.0
References: <X9gcZu5uJpXx8wNn@mattapan.m5p.com> <CAMmSBy_8+PRWiSQxwRN2oB9mLmOnyoCr0mH4L-uUYhm=1GK7Xg@mail.gmail.com>
 <X9gmkGhQQBOmmBe5@mattapan.m5p.com>
In-Reply-To: <X9gmkGhQQBOmmBe5@mattapan.m5p.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 14 Dec 2020 19:03:39 -0800
Message-ID: <CAMmSBy-NbZnfifROX8-BRLCSWt8OYUKHdW9S5ob+k9QJ4w_30g@mail.gmail.com>
Subject: Re: Xen-ARM DomUs
To: Elliott Mitchell <ehem+undef@m5p.com>
Cc: Elliott Mitchell <ehem+xen@m5p.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Julien Grall <julien@xen.org>, Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 14, 2020 at 6:59 PM Elliott Mitchell <ehem+undef@m5p.com> wrote:
>
> On Mon, Dec 14, 2020 at 06:35:14PM -0800, Roman Shaposhnik wrote:
> > On Mon, Dec 14, 2020 at 6:16 PM Elliott Mitchell <ehem+xen@m5p.com> wrote:
> > >
> > > Finally getting to the truly productive stages of my project with Xen on
> > > ARM.
> > >
> > > How many of the OSes which function as x86 DomUs for Xen, function as
> > > ARM DomUs?  Getting Linux operational was straightforward, but what of
> > > others?
> >
> > On EVE we have Windows running as a pretty much a customer-facing demo:
> >     https://wiki.lfedge.org/display/EVE/How+get+Windows+10+running+on+a+Raspberry+Pi
> >
>
> Sorry to spoil the achievement, but Tianocore beat you to having
> Windows on a RP4 by 4 months:
> https://rpi4-uefi.dev/alternate-guide-running-windows-10-on-the-pi-4/

Not to be pedantic, but Stefano and I beat them -- we made it possible
around August ;-)

> > > The available examples seem geared towards Linux DomUs.  I'm looking at a
> > > FreeBSD installation image and it appears to expect an EFI firmware.
> > > Beyond having a bunch of files appearing oriented towards booting on EFI
> > > I can't say much about (booting) FreeBSD/ARM DomUs.
> >
> > Personally I'm about to make Plan9 (well 9front really) run as well ;-)
>
> Some people may like those types of instructions, but I really hate them.
> I like Tianocore's better, since I can do my type of adjustment better.
> (using different amount of storage or other virtual devices)
>
> I've already got FreeBSD installation media, issue is setting up a xl.cfg
> file and/or figuring out which bits I need to extract off their media
> (ah, actual kernel is /boot/kernel/kernel; an ELF file using the
> interpreter /red/herring).

Well, Xen requires some kind of a management solution underneath, so until
Xen/RPi4 support shows up in Raspbian -- the choice is to either stick with
EVE or follow long lists of instructions.

Thanks,
Roman.

