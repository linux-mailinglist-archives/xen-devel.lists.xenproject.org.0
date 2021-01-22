Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A7B30110E
	for <lists+xen-devel@lfdr.de>; Sat, 23 Jan 2021 00:37:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.73140.131870 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l35yY-00036m-N9; Fri, 22 Jan 2021 23:36:22 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 73140.131870; Fri, 22 Jan 2021 23:36:22 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l35yY-00036N-JD; Fri, 22 Jan 2021 23:36:22 +0000
Received: by outflank-mailman (input) for mailman id 73140;
 Fri, 22 Jan 2021 23:36:21 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=unIu=GZ=todobom.com=claudemir@srs-us1.protection.inumbo.net>)
 id 1l35yW-00036I-VE
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 23:36:21 +0000
Received: from mail-qk1-x72f.google.com (unknown [2607:f8b0:4864:20::72f])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 49fe36e1-c390-4579-82bb-a150d289bc83;
 Fri, 22 Jan 2021 23:36:19 +0000 (UTC)
Received: by mail-qk1-x72f.google.com with SMTP id 22so6916195qkf.9
 for <xen-devel@lists.xenproject.org>; Fri, 22 Jan 2021 15:36:19 -0800 (PST)
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
X-Inumbo-ID: 49fe36e1-c390-4579-82bb-a150d289bc83
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=todobom-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=M+vFQlausoJiFvxvyOgAw2Zd3YK3RXL7dBooZbDdKNQ=;
        b=Qz1+eIwdrekriuMPhcFjWScXtanahcGH0Pj4Zjk/3JqwKNC1iS39v7EzC6ulvu9O5Y
         9lxmRe1QiIOjv6mqPJYL8rkxWrQKJe8+DL5YObUldDrA9hMWo3qesIl5/zsMes8vKdj0
         luwZyqZLe4hAzh9DRxhNsV8DhuyZ3HHkQqNiWNLj3p6c8Posy5tASV4awD7inxQZ0Luj
         bsSSN/GglTE7IoksB2ndH65n+WUrJMP/OY8kQ0Db7iBTAumQOZF18Cl5lEBAOIrr/HHp
         AubKYE2Q3BfCu1IWQEAMPWTaiOo72zCBNElj6bdGCJLnYFfl1FFkha7I/sAILNjIScTj
         xdlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=M+vFQlausoJiFvxvyOgAw2Zd3YK3RXL7dBooZbDdKNQ=;
        b=ojpnsBJ6n+YbD0xroaVVR0eh8Kzq//YBtCyGIA+Bv2BCQb0xRobaddQp81Pb+45yZ/
         qQOkfklzK8AlAvt8kpjYHwZCOXqV+olit3o/hMlfhGHNlsGZArx2esUUBttfRz7GdshC
         sqImjyERyRG5GEoW0vDizXPFb9BCpKcoNJC/zD6HmFUNyZTfToRWSlt2T9yguwav+ves
         UPf6sxpZGxdMbgP9MBvWqSf1uLTSCdKD9k1DKs89TtcvlEzw0svUX2nhS3bawJVm0CjP
         oyRMP4BO0uEOAjmnRonJd8JW/mTJD+JYLacJR37ZC05woraRVU1I2PBy9aDu/MGCxJaL
         pM5A==
X-Gm-Message-State: AOAM531hOW/wvu66qp8IlE95Yux6qnFYaYbWRWDk3M2yoe2onXnzXXlr
	eupHzV1f17h+F1lEd8lidm2b0wXwjEpcf7oB0tiggw==
X-Google-Smtp-Source: ABdhPJx+CvZ0JaOUFLpN4rqegInuLvs75O/0wEphB3+yRwlDwdtERCT8LXwPJuV5AgxML8P/IV6KAR0qn2opgQqowds=
X-Received: by 2002:a37:9101:: with SMTP id t1mr3429223qkd.357.1611358578715;
 Fri, 22 Jan 2021 15:36:18 -0800 (PST)
MIME-Version: 1.0
References: <CANyqHYfNBHnUiBiXHdt+R3mZ72oYQBnQcaWuKw5gY0uDb_ZqKw@mail.gmail.com>
 <e1d69914-c6bc-40b9-a9f4-33be4bd022b6@suse.com> <CANyqHYcifnCgd5C5vbYoi4CTtoMX5+jzGqHfs6JZ+e=d2Y_dmg@mail.gmail.com>
 <ff799cd4-ba42-e120-107c-5011dc803b5a@suse.com> <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
In-Reply-To: <609a82d8-af12-4764-c4e0-f5ee0e11c130@suse.com>
From: Claudemir Todo Bom <claudemir@todobom.com>
Date: Fri, 22 Jan 2021 20:36:06 -0300
Message-ID: <CANyqHYehUWeNfVXqVJX6nrBS_CcKL1DQjyNVa1cUbvbx+zD83w@mail.gmail.com>
Subject: Re: Problems with APIC on versions 4.9 and later (4.8 works)
To: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Cc: Jan Beulich <jbeulich@suse.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Boris Ostrovsky <boris.ostrovsky@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 20 de jan. de 2021 =C3=A0s 12:13, J=C3=BCrgen Gro=C3=9F <jgross@su=
se.com> escreveu:
>
> On 20.01.21 09:50, Jan Beulich wrote:
> > On 19.01.2021 20:36, Claudemir Todo Bom wrote:
> >> I do not have serial output on this setup, so I recorded a video with
> >> boot_delay=3D50 in order to be able to get all the kernel messages:
> >> https://youtu.be/y95h6vqoF7Y
> >
> > This doesn't show any badness afaics.
> >
> >> This is running 4.14 from debian bullseye (testing).
> >>
> >> I'm also attaching the dmesg output when booting xen 4.8 with  the sam=
e
> >> kernel version and same parameters.
> >>
> >> I visually compared all the messages, and the only thing I noticed was=
 that
> >> 4.14 used tsc as clocksource and 4.8 used xen. I tried to boot the ker=
nel
> >> with "clocksource=3Dxen" and the problem is happening with that also.
> >
> > There's some confusion here I suppose: The clock source you talk
> > about is the kernel's, not Xen's. I didn't think this would
> > change for the same kernel version with different Xen underneath,
> > but the Linux maintainers of the Xen code there may know better.
> > Cc-ing them.
>
> This might depend on CPUID bits given to dom0 by Xen, e.g. regarding
> TSC stability.
>

Looks like the CPUID changes I observed and wrote on the other
messages are another
problem I may end up with. I narrowed down the cause of the problem on
booting of dom0 with more than 1 core on the following commit:

https://github.com/xen-project/xen/commit/63e1d01b8fd948b3e0fa3beea494e4076=
68aa43b

Code built from this commit doesn't boot, built from the parent of it, boot=
s.

Now, there is something I can do on the command line to make it boots?
Or its needed to fix on the code?

Best regards,
Claudemir

