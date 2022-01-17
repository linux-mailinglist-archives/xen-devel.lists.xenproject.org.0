Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 576844906F3
	for <lists+xen-devel@lfdr.de>; Mon, 17 Jan 2022 12:12:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258112.444132 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Pw0-0006ax-Uu; Mon, 17 Jan 2022 11:12:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258112.444132; Mon, 17 Jan 2022 11:12:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9Pw0-0006Yu-RK; Mon, 17 Jan 2022 11:12:24 +0000
Received: by outflank-mailman (input) for mailman id 258112;
 Mon, 17 Jan 2022 11:12:23 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=d+jO=SB=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n9Pvz-0006Yo-9I
 for xen-devel@lists.xenproject.org; Mon, 17 Jan 2022 11:12:23 +0000
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [2a00:1450:4864:20::144])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 57947c91-7786-11ec-9bbc-9dff3e4ee8c5;
 Mon, 17 Jan 2022 12:12:22 +0100 (CET)
Received: by mail-lf1-x144.google.com with SMTP id x22so56113687lfd.10
 for <xen-devel@lists.xenproject.org>; Mon, 17 Jan 2022 03:12:22 -0800 (PST)
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
X-Inumbo-ID: 57947c91-7786-11ec-9bbc-9dff3e4ee8c5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=E40JIKKcYDnRr291NMTuMudq+LmbDH8XKKLPSlP8GII=;
        b=cBQ9wfXDvwiSSaKbzhZbOXN5RkHeSqcFAWSbQ/0GbmHiOPHtFrQN+935y7yjGpHzxe
         3lMv9631G6usi9FipdeiymOgym9l0mwkSmEPrPEJIpgrmp00mOhIxpO6wdf6z45Q/IrA
         j1zU5Bq8yz/vdZCAS/nLzcc816pSuwetUaFnpSe1HOSMJlTGNxcZaWcvWJAP5aMwVkCt
         xwwpUWvzxk1+goqko12x6lfNd6UHxZGl8H0Mz3IcVsXhxxEg6ntZ2kSOO6EON643XTQS
         6DShYqbfmizwJqIgBZIG9lQC45+p/h89LXSF7uUvh4HjBrRw2TT693OVbyBOwVPzBh+m
         HeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=E40JIKKcYDnRr291NMTuMudq+LmbDH8XKKLPSlP8GII=;
        b=pH2Zo2qvycJa018OhJtwYaGxis0d/1jnSrsUYZtR1XLnLwwbWeHjPg42NOCmHiN23G
         ONn6+WPlFQKdfFAcmtcurRtybN6eVfE1uKO2V9rJLaJt3iufWKjClw3VlIQRSwQUhu8g
         w92386bDjZ2/rQkHbvYdQtJlfSrlVHBEOib0GM2Ygp9hRchgs0kUqIoF3shFLUcut9Ul
         GqmWNdHuXpGK1ZSx2ojVymdvqlg1DjMZklaz8qskbiMCDfht0Lm0nDkCFGlyf8cFYv7J
         yJu6YTBbyT1phCuPYnBiSE4JOGWyRAyCj2SXlKrJn2LmGyOJAHwTemYuBPjAmErb3h55
         1O1Q==
X-Gm-Message-State: AOAM533nqa2Kctq6nAbnHuxVSbOrBpqkCdGyCc7w2xbz10PuH/NYaOAq
	NO12z83lL42/hjvq2+Y8yVqdoI/Y/azKJhshdVg=
X-Google-Smtp-Source: ABdhPJz2gJXXNBJnVXy4VbWypioAYZg+GwRwEXk/grNPFn9CDO/55m4LRaJzNdZsKCK0iJ1vJiHBuMYh3f3M4c7KOFg=
X-Received: by 2002:a19:5e16:: with SMTP id s22mr15690205lfb.209.1642417941612;
 Mon, 17 Jan 2022 03:12:21 -0800 (PST)
MIME-Version: 1.0
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com> <94945C70-A608-47E9-890E-8CA6882D7379@arm.com>
In-Reply-To: <94945C70-A608-47E9-890E-8CA6882D7379@arm.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Mon, 17 Jan 2022 19:12:11 +0800
Message-ID: <CABSBigTdLbV4b8uB-MyoBuU2uFe2xc8ML4WizsHD80A3nygtCg@mail.gmail.com>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: "sstabellini@kernel.org" <sstabellini@kernel.org>, "julien@xen.org" <julien@xen.org>, 
	"Volodymyr_Babchuk@epam.com" <Volodymyr_Babchuk@epam.com>, 
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bertrand Marquis <Bertrand.Marquis@arm.com> =E4=BA=8E2022=E5=B9=B41=E6=9C=
=8817=E6=97=A5=E5=91=A8=E4=B8=80 17:00=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> > On 17 Jan 2022, at 06:40, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
> >
> > It turns out that QEMU has been supporting GICv2 virtualization since
> > v3.1.0. So remove the dependencies on GICv3. If we want to use GICv3,
> > we can select the QEMU_LEGACY configuration.
>
> I am bit puzzled by this change introducing a legacy option actually sele=
cting the newest GIC interface.
>
> Can=E2=80=99t we do the opposite and introduce a QEMU_GICV2 instead ?
>
> Also why do we need to remove gic-v3 support ? The code should actually s=
elect which gic to use depending on the device tree.

QEMU platfrom only select GICv3,  so I remove this limitation,  let
user or developer selects gic version is better.

>
> Regards
> Bertrand
>
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> > xen/arch/arm/platforms/Kconfig | 10 +++++++++-
> > 1 file changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kc=
onfig
> > index c93a6b2756..41e82a42ee 100644
> > --- a/xen/arch/arm/platforms/Kconfig
> > +++ b/xen/arch/arm/platforms/Kconfig
> > @@ -13,7 +13,15 @@ config ALL_PLAT
> >       automatically select any of the related drivers.
> >
> > config QEMU
> > -     bool "QEMU aarch virt machine support"
> > +     bool "QEMU aarch virt machine support >=3D v3.1.0"
> > +     depends on ARM_64
> > +     select HAS_PL011
> > +     ---help---
> > +     Enable all the required drivers for QEMU aarch64 virt emulated
> > +     machine.
> > +
> > +config QEMU_LEGACY
> > +     bool "QEMU aarch virt machine support < v3.1.0"
> >       depends on ARM_64
> >       select GICV3
> >       select HAS_PL011
> > --
> > 2.25.1
> >
>

