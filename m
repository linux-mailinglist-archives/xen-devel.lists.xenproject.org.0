Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC3BA4921BE
	for <lists+xen-devel@lfdr.de>; Tue, 18 Jan 2022 09:58:38 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.258405.444952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kJl-0001XT-8M; Tue, 18 Jan 2022 08:58:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 258405.444952; Tue, 18 Jan 2022 08:58:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9kJl-0001VZ-54; Tue, 18 Jan 2022 08:58:17 +0000
Received: by outflank-mailman (input) for mailman id 258405;
 Tue, 18 Jan 2022 08:58:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9uWz=SC=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n9kJi-0001VT-Vp
 for xen-devel@lists.xenproject.org; Tue, 18 Jan 2022 08:58:15 +0000
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [2a00:1450:4864:20::130])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c4e5e075-783c-11ec-a115-11989b9578b4;
 Tue, 18 Jan 2022 09:58:13 +0100 (CET)
Received: by mail-lf1-x130.google.com with SMTP id x11so42093984lfa.2
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jan 2022 00:58:13 -0800 (PST)
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
X-Inumbo-ID: c4e5e075-783c-11ec-a115-11989b9578b4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=cbbC7njoQiCI+pJ3A+jBYzdVhH+bdsBlJDpCjJipZ1k=;
        b=DL9w/tbX2EpUxLZUWcvEeG+GisPJZHxbXfV4fVea40a2jU1MgQa/Ay/asBpuOkD0/K
         P3rpL/65TSJjZH7I8wzT0ZCtZ73a+Y7fPQeeS6ay7xGy6O+Xxs569oYrJ0ESshUOWdZ6
         dP9JysU/njkBnlLNq8Me6PxrLNEkDp9Ua+nmUP8eU3kfsPMT/DQLbS21eHGab0KMsVpv
         iiG2y/17J+CC5f8GiE9Bv2QG2crpgc9daHCpSVoF/699MvdiIherWn3oWbanH8guFi8L
         NvxLsKi+mkqM/UVbVtlPcwSCuol0iTfSVlH0Sf918r+GjYetplNHEqz8dVJpSUdNaiHE
         fR8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=cbbC7njoQiCI+pJ3A+jBYzdVhH+bdsBlJDpCjJipZ1k=;
        b=bQcG/aRYlOg4GkuFTK1cQOwg6iNC0o7mvGMHlRwoStvFzK+ddXcxWjd5M114rJcGV0
         tXJVPQ/7t2BXjAdwWc5+9UiZhqhrDt7DvITU5G3M0URhECySdKxbl4Z7sWtX4dISA9BB
         W5Rnei92eRcMwzWegy6c574lNrkukKVgidF4X20+Xg3GeFl6NQ2o+Vat4RqXZztaiR9a
         5tCgvpWUkni3HoH3SqQ+QYJAVUNwyyA+hSQIV7JUUmdd/KqWuN2uY2suzzMwTBHb4Kyv
         DpYIAf3/exk7RubNiQVAOLI7IMfmc7Twa24vSW+DjhkJszi6t2j5LpA8SbWP2fO2t7UT
         DL1g==
X-Gm-Message-State: AOAM530xZQRLHPul6p7UZC66DyT3vjr/YoN5uio8A3R82fcC31wWoWuH
	IM08pJlCnv4SYI0g64QXGOJ5cnv8MjQ7vsM0Fas=
X-Google-Smtp-Source: ABdhPJxf7E4NO8+vtFSE+kHcSeuGHH3g4PAROZ0XsvhLUznbXvda0HMZLAfNtDSxoYVJ/t1GkRSUaAM5VGijcqvh+Y0=
X-Received: by 2002:a05:6512:400b:: with SMTP id br11mr18979675lfb.108.1642496293549;
 Tue, 18 Jan 2022 00:58:13 -0800 (PST)
MIME-Version: 1.0
References: <20220117064003.3367188-1-gengdongjiu1@gmail.com>
 <2a1a0dd5-b8a7-8072-2961-b1fbe9ec746a@xen.org> <CABSBigSOjoXABoYoe+SahQyX0P045YjgK3A=7yyxw_aX8nzTqg@mail.gmail.com>
 <9A7FAD16-3D4A-4C22-8288-A4719A993CDD@arm.com>
In-Reply-To: <9A7FAD16-3D4A-4C22-8288-A4719A993CDD@arm.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 18 Jan 2022 16:58:03 +0800
Message-ID: <CABSBigSba0ENZ-AvDN7bPGNqS5zQKceL901BxhjR8pkRntgnrw@mail.gmail.com>
Subject: Re: [PATCH v4] xen/arm: Allow QEMU platform to be built with GICv2
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Cc: Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bertrand Marquis <Bertrand.Marquis@arm.com> =E4=BA=8E2022=E5=B9=B41=E6=9C=
=8818=E6=97=A5=E5=91=A8=E4=BA=8C 16:48=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi Dongju,
>
> > On 18 Jan 2022, at 08:45, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
> >
> > Julien Grall <julien@xen.org> =E4=BA=8E2022=E5=B9=B41=E6=9C=8817=E6=97=
=A5=E5=91=A8=E4=B8=80 22:16=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi,
> >>
> >> On 17/01/2022 10:40, Dongjiu Geng wrote:
> >>> It turns out that QEMU has been supporting GICv2 virtualization since
> >>> v3.1.0. So remove the dependencies on GICv3.
> >>
> >>
> >> Technically, the current form of CONFIG_QEMU allows the same binary to
> >> boot on QEMU with GICv2 or GICv3.
> >>
> >>> If we want to use GICv3,
> >>> we can select the QEMU_LEGACY configuration.
> >>
> >> AFAIK, GICv3 is not a legacy feature... So it feels a bit odd to name =
it
> >> like that (see more below).
> >
> > Legacy means QEMU platform only supports GICV3, now it can support
> > both GICv2 and GICv3. The scope of support has been expanded
> > Not mean GICv3 is a legacy feature.
>
> You might be misleading a bit here.
> In the current configuration, Xen support GICv2, GICv3 and vgic.
> The only thing not supported is actually the new VGIC but this is an unsu=
pported feature not fully functional which shall be used with caution.
>
> What issue exactly do you have in Qemu configured for gicv2 when you use =
the default configuration ?

I want to use NEW_VGIC with GICv2, but QEMU only select GICV3,  when
GICv3 is select, the NEW_VGIC can not be used.   I try the NEW_VGIC
with GICv2, not found issue. so I want to remove this limitation.
If  you think we should not support NEW_VGIC feature,  we can ignore
this patch.  thanks!

>
> Cheers
> Bertrand
>
> >
> >>
> >>>
> >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> >>> ---
> >>>  xen/arch/arm/platforms/Kconfig | 10 +++++++++-
> >>>  1 file changed, 9 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/=
Kconfig
> >>> index c93a6b2756..41e82a42ee 100644
> >>> --- a/xen/arch/arm/platforms/Kconfig
> >>> +++ b/xen/arch/arm/platforms/Kconfig
> >>> @@ -13,7 +13,15 @@ config ALL_PLAT
> >>>      automatically select any of the related drivers.
> >>>
> >>>  config QEMU
> >>> -     bool "QEMU aarch virt machine support"
> >>> +     bool "QEMU aarch virt machine support >=3D v3.1.0"
> >>
> >> This is a bit misleading. A user may select this thinking that this wi=
ll
> >> select GICv3. However, this will not.
> >>
> >> This also raises the question of what is the default GIC version in QE=
MU
> >> (i.e. if you don't pass anything on the command line)? If this is GICv=
3,
> >> then I am afraid that this patch would be a no-go for me.
> >>
> >> Looking at overall discussion, you seem to push the patch only to allo=
w
> >> building a tiny Xen for QEMU and the new vGIC.
> >>
> >> The default Xen (i.e. make defconfig) will also work on QEMU. Given th=
at
> >> the new vGIC is a still in development, I am seriously considering to
> >> say that if you want to try it then you have to use the default
> >> configuration.
> >>
> >> @Dongjiu, is there any reason why you want to use the tiny QEMU config
> >> rather than the default configuration?
> >
> > Hi Julien, thanks for the reply, I do not use the tiny QEMU config. I
> > used the default configuration and selected the platform as QEMU.
> > But QEMU platform only slects GICV3, so I submit this patch to remove
> > the limitation because I want to use VGIC. VGIC can already support
> > GICv2 now.
> >
> >>
> >> @Bertrand, @Stefano, what do you think?
> >>
> >> Cheers,
> >>
> >> --
> >> Julien Grall
>

