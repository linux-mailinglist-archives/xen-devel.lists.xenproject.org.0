Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4453B1FA58F
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 03:19:47 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jl0Ft-0001Hl-1P; Tue, 16 Jun 2020 01:19:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=FxI/=75=zededa.com=roman@srs-us1.protection.inumbo.net>)
 id 1jl0Fr-0001Hg-At
 for xen-devel@lists.xenproject.org; Tue, 16 Jun 2020 01:19:11 +0000
X-Inumbo-ID: 61b049da-af6f-11ea-bb8b-bc764e2007e4
Received: from mail-qt1-x844.google.com (unknown [2607:f8b0:4864:20::844])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 61b049da-af6f-11ea-bb8b-bc764e2007e4;
 Tue, 16 Jun 2020 01:19:10 +0000 (UTC)
Received: by mail-qt1-x844.google.com with SMTP id q14so14264606qtr.9
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 18:19:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zededa.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iXsXRL7cKOK7W4zCPeLJpCiQpirlDE+jAyotbH2/Zco=;
 b=CL9QlwbWNe01cLygqxg1X2QsAvMCPdeBiKVdRI1gtvbHhntk46OmJ9FpaAYBgSVAJr
 7lcvv8RGbd2lluLu7sFfeBIp4O9QvdasQNJrGoPJ5f2KYY6OtuCoolQiyEeuNUri9wno
 9PUt7FlxpcS8hDqSzhm/a+KwASGnODAED8ToCWeMSBCGXQVksuTKiPFiesIu5FzVbwP9
 VdK9qxeSFf0yC6dBOjPoXXbLOZvq8eEWV1vpN3n0t1PuObSoKtgThO1I9a08iCbs+67H
 9kWK9swoxz6R7/vau+NbNjAxLvxmEIh7G9sw13xAqXY/TuDWvvH6Ymy0zQwCErEedH3B
 /8jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iXsXRL7cKOK7W4zCPeLJpCiQpirlDE+jAyotbH2/Zco=;
 b=ssuwpgA35BP7V3O2jkrzJva6jKHu1s4UQrwttZ84cw2EGJ1rNNnQ1ZWEYClNniBnsz
 IIpLExVsASyq/NbH3IGI33Y2WjXl8egur2cJ8ml27syoRoOCM60h3nCvUMGdXOrS0/TC
 o8vBoCPMr6J9J2IHuWZgNLXHmenjzeFevmEYAMczjidaSGZPaz/tuldd7hMWzEMcI8/k
 0xQInU84YMYlkgHSXfD13xZuVnqjlR4Upe/tQr7E7DhQkcW/pLV1dLEA0eBA8D49K99m
 LblwyLUI3sNWc0qDv0oMtEQwOFAsZlZQ85b6suDkLnljeEJ8Nf2C+Ad+Ywysjt+bygzU
 z69Q==
X-Gm-Message-State: AOAM532WGJRr8oCRz3MccYz6k1GwqrCrzyR8+21L1mheto8rQdvEnDNr
 OFrMLheEWrjKIX9X9fDvMzz1DCBNhM7+Ia6RyQ53UQ==
X-Google-Smtp-Source: ABdhPJyNBl0oZoIp9VOvR37OdLYhvrCjw3kjpvFC5ePC4zZHOnAzJDQdBWTlJkxnAiDKfPMiEwmctkWTrZ7W9AGDQUo=
X-Received: by 2002:ac8:7c8e:: with SMTP id y14mr19416964qtv.365.1592270350026; 
 Mon, 15 Jun 2020 18:19:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
 <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
In-Reply-To: <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
From: Roman Shaposhnik <roman@zededa.com>
Date: Mon, 15 Jun 2020 18:18:58 -0700
Message-ID: <CAMmSBy_AJBnLGsHo_4HWR1TxXZ3O+caUWBs1Q02-k8s1CT72UQ@mail.gmail.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
To: Christopher Clark <christopher.w.clark@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Corey Minyard <cminyard@mvista.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 tamas@tklengyel.com, Xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On Mon, Jun 15, 2020 at 4:35 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
> >
> > On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> > >
> > > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > > existing sd cards, and this was working fine.  I finally got to a full
> > > yocto build of the system, and it didn't boot.
> > >
> > > In fact, Xen didn't print anything at all, and nothing happens that
> > > might suggest it's booting without any console output.
>
> I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
> works fine, whereas I see no console output from the kernel once Xen
> tries to hand off to dom0 with either a 5.4 or 5.6 kernel.
>
> > > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > > else the same, the 4.19 version of that overlay works, and the 5.4
> > > version does not work.  It also didn't work if I completely removed the
> > > overlay.  The base device trees are the same between the two kernels.
> > >
> > > Looking at the overlay changes between the versions and Xen source, I
> > > can't trace down anything that would cause an issue.  Has anyone seen
> > > this issue of have any ideas?
>
> Seen it: yes, but no progress on resolving it to report at this point.
>
> > FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
> >     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
> >
> > The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).
>
> Hi Roman - is there a specific commit in that rpi-5.6.y branch that
> you guys have working ok?

Pretty much the latest really. The problem is that it seems RPi ppl.
keep forcepushing to that branch. Hence what we had to do on
the EVE side is to basically "snapshot" it with this gigantic patch:
     https://github.com/lf-edge/eve/blob/master/pkg/new-kernel/patches-5.6.x/0000-rpi-kernel-changes.patch

This needs to be applied on top of straight up upstream 5.6.14 (since
that's what the closest common ancestor was on that branch at the time)

In fact, the entire build process is captured here (if you're curious):
      https://github.com/lf-edge/eve/blob/master/pkg/new-kernel/Dockerfile
(you can literally just docker build . build the whole thing)

> It looks like the bcm2711_defconfig file wasn't included in the kernel
> source tree of that branch at the point the kernel version was bumped
> up to 5.6.14, so is there somewhere else to look for a matching kernel
> config?

Yes ;-) I can share the kind of config that has been pretty extensively
tested by us here at Project EVE:
     https://github.com/lf-edge/eve/blob/master/pkg/new-kernel/kernel_config-5.6.x-aarch64

None of it is terribly EVE specific -- so you should have a reasonable
base-line.

Thanks,
Roman.

