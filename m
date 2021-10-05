Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1A94227F2
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 15:33:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202266.356977 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXkZX-0002Ov-4A; Tue, 05 Oct 2021 13:33:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202266.356977; Tue, 05 Oct 2021 13:33:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXkZX-0002Mg-0B; Tue, 05 Oct 2021 13:33:31 +0000
Received: by outflank-mailman (input) for mailman id 202266;
 Tue, 05 Oct 2021 13:33:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TbO2=OZ=gmail.com=jandryuk@srs-us1.protection.inumbo.net>)
 id 1mXkZU-0002Ma-P9
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 13:33:28 +0000
Received: from mail-lf1-x130.google.com (unknown [2a00:1450:4864:20::130])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 25695209-8304-4eda-96e6-5ebfba86cdd0;
 Tue, 05 Oct 2021 13:33:27 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id y26so86832756lfa.11
 for <xen-devel@lists.xenproject.org>; Tue, 05 Oct 2021 06:33:27 -0700 (PDT)
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
X-Inumbo-ID: 25695209-8304-4eda-96e6-5ebfba86cdd0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kbkSIdI1lyS2W09DNPfwYlXTbieduSGKbyFZ93KqqAs=;
        b=pDoJSSg5iakHHKAAAfAYAauByvpCLMHi5WE0ed2GuuK1e83hL+zne9yWU9yABINO34
         1BvFGV21d0zS8s9HPBNsjZ8XTE5I1scTB/f6/FtoRlgu3czT/3ny+wiAY7GEVvzorTGj
         dq7GkJBGVBECH201hvsKs78KySNKtLZR+XTqGuW15Ev4Ang64Q7IQop4/7MXojk8KndC
         iAB96yxEfPRXoHZg8h3a/ytObmMl8IhK369u56GzzxI4r67KxJ9EprgWZ3FcfForxE1l
         6Exf8P49x39hB88v8OQH4kIk9c0Z5KqCGtwrcpqn1wlglY0qA/VLQYGh8dMk59/IC2Jv
         /x5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kbkSIdI1lyS2W09DNPfwYlXTbieduSGKbyFZ93KqqAs=;
        b=ezBbHa49p5tW8YkWHY6HfzCWSoUJ2netBleCog+MPcishMtY6M2/R8DoqUn2CHvaPN
         945lj4GoBWcbsKlZRuU1y0AvCemRcqzRoSZgO6G4mz+2gHnB/j8kA7h1XJqIjVrCq3mq
         fXiqKoAQg3LjAWHfuAfx0h2hDFYnrpUCGGpBjyoLu2zmhhR8MxKaodsNSdTnijoTtXgZ
         tHtukACGIrZ1Uey2hyXrT/RKq41vTNlOKmtgimP5dMY4tDLV5L8DPGoPhq4jS7KJ8qnP
         ACa74sbj4msryJWxo2lbBP/jmjMoedSRi3F38zccF4Kn7jUe4L5/EdaJGpknlekuW5Si
         IowA==
X-Gm-Message-State: AOAM5302Z20ZXRqIL6ZB8yIi98jzLUiM0nVQQYwy6/r7fzYCdGFDDC54
	7Si1aEWT8Oeu9PeFfaEQbkhW7OISsoNIDlsshhs=
X-Google-Smtp-Source: ABdhPJyo/6SU5wHwI/RDnvtlZJRGLqPhsFcVH4Pb+jrzEbBDFrxYp4EMFF/7hET/brDEEP0F4/XW5SL01mm122nZDUE=
X-Received: by 2002:a05:6512:2287:: with SMTP id f7mr3595653lfu.250.1633440806864;
 Tue, 05 Oct 2021 06:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <YVk11h2l/u4GJNv0@mail-itl> <37c22c61-80be-fc48-18e6-2b1ee22cc765@suse.com>
 <YVrF65BAVsXTgRsd@mail-itl> <f707c956-6cdc-9b32-5f22-227e0f5a9f10@suse.com>
In-Reply-To: <f707c956-6cdc-9b32-5f22-227e0f5a9f10@suse.com>
From: Jason Andryuk <jandryuk@gmail.com>
Date: Tue, 5 Oct 2021 09:33:15 -0400
Message-ID: <CAKf6xpsJT7-6A4CjE6_mvpuNJUhPKY4fBkU4zS9xYry47dWAKw@mail.gmail.com>
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150
To: Juergen Gross <jgross@suse.com>
Cc: =?UTF-8?Q?Marek_Marczykowski=2DG=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
	xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <jbeulich@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 5, 2021 at 4:05 AM Juergen Gross <jgross@suse.com> wrote:
>
> On 04.10.21 11:14, Marek Marczykowski-G=C3=B3recki wrote:
> > On Mon, Oct 04, 2021 at 07:31:40AM +0200, Juergen Gross wrote:
> >> On 03.10.21 06:47, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Hi,
> >>>
> >>> After updating a PVH domU to 5.4.150, I see xen-balloon thread using
> >>> 100% CPU (one thread).
> >>> This is a domain started with memory=3Dmaxmem=3D716800KiB (via libvir=
t). Then,
> >>> inside, I see:
> >>>
> >>> # cat /sys/devices/system/xen_memory/xen_memory0/target_kb
> >>> 716924
> >>> # cat /sys/devices/system/xen_memory/xen_memory0/info/current_kb
> >>> 716400
> >>>
> >>> Doing `cat info/current_kb > target_kb` "fixes" the issue. But still,
> >>> something is wrong - on earlier kernel (5.4.143 to be precise), it
> >>> wasn't spinning, with exactly the same values reported in sysfs. It
> >>> shouldn't run in circles if it can't get that much memory it wants. I
> >>> strongly suspect "xen/balloon: use a kernel thread instead a workqueu=
e"
> >>> or related commit being responsible, but I haven't verified it.
> >>
> >> I think you are right. I need to handle the BP_ECANCELED case similar =
to
> >> BP_EAGAIN in the kernel thread (wait until target size changes again).
> >>
> >> One further question: do you see any kernel message in the guest relat=
ed
> >> to the looping balloon thread?
> >
> > Nothing, only the usual "xen:balloon: Initialising balloon driver", and
> > nothing related to balloon after that.
>
> Could you try the attached patch, please? I've tested it briefly with
> PV and PVH guests.

I was seeing the CPU spinning in dom0 with xen command line:
dom0_mem=3Dmin:420M,max:420M,420M

Your patch eliminated the CPU spinning.

Tested-by: Jason Andryuk <jandryuk@gmail.com>

Thanks, Juergen

-Jason

