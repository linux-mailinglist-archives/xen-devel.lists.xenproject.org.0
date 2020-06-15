Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B72501FA46E
	for <lists+xen-devel@lfdr.de>; Tue, 16 Jun 2020 01:37:12 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jkydt-0007pD-Ih; Mon, 15 Jun 2020 23:35:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FEP1=74=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1jkyds-0007p8-3E
 for xen-devel@lists.xenproject.org; Mon, 15 Jun 2020 23:35:52 +0000
X-Inumbo-ID: f287add6-af60-11ea-bb8b-bc764e2007e4
Received: from mail-ot1-x344.google.com (unknown [2607:f8b0:4864:20::344])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f287add6-af60-11ea-bb8b-bc764e2007e4;
 Mon, 15 Jun 2020 23:35:51 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id v13so14536259otp.4
 for <xen-devel@lists.xenproject.org>; Mon, 15 Jun 2020 16:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RskD6C5MxS8bssEQAwzWbTSPS9gY4FRfzYLmdbDz6do=;
 b=S8rwr1CXbMk9HK6xvVWi4QBxbnmefplHN9DcppspInsfa+AuqCXQCTHQEbh1uzoc4N
 bipBYBGBmqSAyhvz9k6B+V0Ciw3+ApDhgs3y0Hn+DlxB6JgRh3qzu3Q4sFFSJJbegLit
 2dj/bX1rVV6kwq5Hrg9SH8RYqF4aJvATNKKkVEzy89U3adGvK8q3yttZP0Dnp0OYl6yQ
 W/kDhfUe1dzBM7ooaTPnQu4uPYZeYAO20U1ykMEVJj51L+QyJrIk7JCFiIH2ZjsNJ0wz
 h6kz2jSwnqFrM5W9OZcUvjti13wk08tNcS0F2btfWfUT7ACxQGsr5AL3NZxln/vlQApT
 l4ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RskD6C5MxS8bssEQAwzWbTSPS9gY4FRfzYLmdbDz6do=;
 b=kXF7HbdhEkAba2xRtuyscZODqD4TXQE4kWwUDwY4vEsB+92dStaDZagF/xeO0qEjpX
 LfmCQyhrCCVyMEWG009m4WhWqNd9SlimST8YFI5n0Um45OB8jgW+dAfTpfFVxDoTkDkK
 jdVGgJXEPIlyMg2E1q9xShLGeL4td1qXgL1hNIldzJE42aKK5RC+wEtHI1VRvgASgYCc
 n76KJJKMkWO3nD9wBjeZXBn89Ij/JEzf2wo2q0qY3GnQ8INUEOYobdolWbqhomGdhP9S
 aD0srhMBScA6CCexjsFS08/CgAUsIAZ0vt726MRIWeSslr7blZbEP04lVmWSs8MJ693d
 GiVw==
X-Gm-Message-State: AOAM530Bbmn4e/yBymZer39wfOWgSOaUaAS/yFnOM2EbrPoVneONshh8
 PNybxLJEnxhQQYfOJSRLXwSIC23QUZJiDVV7nAs=
X-Google-Smtp-Source: ABdhPJzkVAD8lyCh5C8jOBNxwRG5jgpLMo6T6oSwOHxvVKknm0EYmDcsh/bddONVsBaetK3fuqNFn68bBHXyBp1S7Mw=
X-Received: by 2002:a05:6830:1441:: with SMTP id
 w1mr333523otp.372.1592264150542; 
 Mon, 15 Jun 2020 16:35:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200610185415.GG7231@minyard.net>
 <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
In-Reply-To: <CAMmSBy8gGCjJ0yLcC7rxwEtQDfzRVF=sp=seYtBA3FM3vuXgEQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Mon, 15 Jun 2020 16:35:39 -0700
Message-ID: <CACMJ4GaOx7aFJgRno511C7KOWbSu9751HBx4hikByU4J_X3vLg@mail.gmail.com>
Subject: Re: Xen on Pi4: Xen doesn't work with overlays from Raspberry Pi 5.4
 kernel
To: Roman Shaposhnik <roman@zededa.com>
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

On Wed, Jun 10, 2020 at 7:21 PM Roman Shaposhnik <roman@zededa.com> wrote:
>
> On Wed, Jun 10, 2020 at 11:54 AM Corey Minyard <cminyard@mvista.com> wrote:
> >
> > I had been working on Xen on the Pi4 by throwing kernels I compiled onto
> > existing sd cards, and this was working fine.  I finally got to a full
> > yocto build of the system, and it didn't boot.
> >
> > In fact, Xen didn't print anything at all, and nothing happens that
> > might suggest it's booting without any console output.

I've reproduced this. Linux 4.19 from the Raspberry Pi kernel branch
works fine, whereas I see no console output from the kernel once Xen
tries to hand off to dom0 with either a 5.4 or 5.6 kernel.

> > I traced the issue down to the vc4-fkms-v3d dtoverly.  With everything
> > else the same, the 4.19 version of that overlay works, and the 5.4
> > version does not work.  It also didn't work if I completely removed the
> > overlay.  The base device trees are the same between the two kernels.
> >
> > Looking at the overlay changes between the versions and Xen source, I
> > can't trace down anything that would cause an issue.  Has anyone seen
> > this issue of have any ideas?

Seen it: yes, but no progress on resolving it to report at this point.

> FWIW: I ran into very similar issues, ditched 5.4 kernel and moved to 5.6.x:
>     https://github.com/raspberrypi/linux/tree/rpi-5.6.y
>
> The 5.6.14 seems to be working quite nicely with Xen for me (and Stefano).

Hi Roman - is there a specific commit in that rpi-5.6.y branch that
you guys have working ok?
It looks like the bcm2711_defconfig file wasn't included in the kernel
source tree of that branch at the point the kernel version was bumped
up to 5.6.14, so is there somewhere else to look for a matching kernel
config?

Christopher

>
> Thanks,
> Roman.
>

