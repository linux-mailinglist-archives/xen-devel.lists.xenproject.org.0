Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AD747F3E0
	for <lists+xen-devel@lfdr.de>; Sat, 25 Dec 2021 17:41:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251764.432839 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1A5E-00075H-Kb; Sat, 25 Dec 2021 16:39:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251764.432839; Sat, 25 Dec 2021 16:39:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1A5E-00072z-Gw; Sat, 25 Dec 2021 16:39:48 +0000
Received: by outflank-mailman (input) for mailman id 251764;
 Sat, 25 Dec 2021 16:39:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=EicR=RK=gmail.com=firemeteor.guo@srs-se1.protection.inumbo.net>)
 id 1n1A5C-00072t-L4
 for xen-devel@lists.xen.org; Sat, 25 Dec 2021 16:39:46 +0000
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
 [209.85.166.43]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 42d40213-65a1-11ec-bb0b-79c175774b5d;
 Sat, 25 Dec 2021 17:39:43 +0100 (CET)
Received: by mail-io1-f43.google.com with SMTP id 19so13574276ioz.4
 for <xen-devel@lists.xen.org>; Sat, 25 Dec 2021 08:39:43 -0800 (PST)
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
X-Inumbo-ID: 42d40213-65a1-11ec-bb0b-79c175774b5d
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oUytEaQuJaVQbgd5+8HlyCLmjtGwQoVrbd2CYdEAWiE=;
        b=Q19Fb1y257F1/m+4swOx+xZYC1R2NZgSYTRGnj5ePGfc30hr7v6s+75/egUdoQqhmV
         LP314C89xM1NNKcxjbEj3pdSdOKu6GGjZnFxOjbPAx7daujwYHSKkBPSbJa2xTJA2IpF
         6vYqzPXNI5+PKTOBOIFlk8Cgo7mjoWVS5P6RR/601kj/A8t02K+hRlvo3sMzl/tI0k4c
         oIwspAts1LBhkH0v4h4CwLNSy+m1z/pQdSEvP3yvFrMt/1LYlJdDw3qJG1OwTYChBSU6
         mbG2XNHLWEZHw26pGRbNZj3kYiY44+1QyvaHWyT821uBkH3bXTbZzzPHpyulDEnuWCUX
         CdWQ==
X-Gm-Message-State: AOAM533fuetruVkGs/iuAjcDGeQARt1KansLRISQNCNaXGDmg0MwgL5e
	bOZSNEq/83zlkFwxT0z87qj8l5luZ3fhM0yku90=
X-Google-Smtp-Source: ABdhPJxz1O6Obs4pkBg9mKiI4ufOTS+asP3CQGL6pbsBsjboxf6ripXUJhh9l0FVm28rsSkRXe49Jo/dNbR74Y8nOyM=
X-Received: by 2002:a5d:9f44:: with SMTP id u4mr4588239iot.163.1640450382233;
 Sat, 25 Dec 2021 08:39:42 -0800 (PST)
MIME-Version: 1.0
References: <CAKhsbWZ5KCrwJqbchx31LWfaJeS=khP9sgoo4y8ZZqOexsUUdA@mail.gmail.com>
 <CAKhsbWYLC+cEuaJefi4Zy1ZcZaOtM6_2WV+9uq8=pTdi5NYLJA@mail.gmail.com>
 <CAKhsbWbv-Poscajj=Hwe3g6WO9b8VaZm39ygFnsbEfHTpRzrfA@mail.gmail.com>
 <YcHbuug9AECvKXm9@Air-de-Roger> <CAKhsbWZkSoM-N=HXfb_OeSGLqYMdtcxRph+=_vqp6tjHgikYVQ@mail.gmail.com>
 <YcInKtCNgA9v0k+c@Air-de-Roger> <CAKhsbWZMRMfrsWDcZLSS7q4ciR0UbyGE2sO-tN1dr+9juuEfsQ@mail.gmail.com>
 <YcWuCgYWestnlDSH@Air-de-Roger>
In-Reply-To: <YcWuCgYWestnlDSH@Air-de-Roger>
From: "G.R." <firemeteor@users.sourceforge.net>
Date: Sun, 26 Dec 2021 00:39:30 +0800
Message-ID: <CAKhsbWZ4Xyy_7Xp4F3YWNsrBXdh4AkiQx4__7qUTd4AJiu-6bg@mail.gmail.com>
Subject: Re: Possible bug? DOM-U network stopped working after fatal error
 reported in DOM0
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: xen-devel <xen-devel@lists.xen.org>
Content-Type: text/plain; charset="UTF-8"

> > Please find the trace and the kernel CL below.
> > Note, the domU get stuck into a bootloop with this assertion as the
> > situation will come back after domU restart and only dom0 reboot can
> > get the situation back to normal.
> > The trace I captured below is within the boot loop. I suspect the
> > initial trigger may look different. Will give it another try soon.
> >
I think I figured out the cause of the boot loop.
It was not due to some mystery offender packet from the FreeBSD domU
surviving across reboot,
but because the windows iSCSI initiator keeps retrying :-).

That said, I did pay some prices figuring this out.
The boot-loop seems to have brought my box into a weird state that those disks
behind the controller keep detaching soon after NAS domU reboot.
Rebooting the physical host does not help this time.
I was almost desperate but thankfully running the NAS on the physical
host directly still works.
And switching it back to domU together with config reloading fixed
this problem :-)
Not sure if it was the domU config being corrupted or something left
sticky in the PCI pass-through?

> Thanks. I've raised this on freensd-net for advice [0]. IMO netfront
> shouldn't receive an mbuf that crosses a page boundary, but if that's
> indeed a legit mbuf I will figure out the best way to handle it.
>
> I have a clumsy patch (below) that might solve this, if you want to
> give it a try.

Applied the patch and it worked like a charm!
Thank you so much for your quick help!
Wish you a wonderful holiday!

Thanks,
G.R.

