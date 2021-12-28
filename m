Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C7B74808DF
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 12:52:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252219.433216 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2B1Q-0008Rp-DI; Tue, 28 Dec 2021 11:52:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252219.433216; Tue, 28 Dec 2021 11:52:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2B1Q-0008Of-AC; Tue, 28 Dec 2021 11:52:04 +0000
Received: by outflank-mailman (input) for mailman id 252219;
 Tue, 28 Dec 2021 11:52:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Zee=RN=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n2B1P-0008OZ-Ah
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 11:52:03 +0000
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com
 [2a00:1450:4864:20::241])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91e98413-67d4-11ec-9e60-abaf8a552007;
 Tue, 28 Dec 2021 12:52:02 +0100 (CET)
Received: by mail-lj1-x241.google.com with SMTP id q8so14606592ljp.9
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 03:52:02 -0800 (PST)
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
X-Inumbo-ID: 91e98413-67d4-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Z6SWZpdODlnO8czlhOLq31vh6FeRlmcNPXpjA4PbQwY=;
        b=oQG6xg0FTkr5RfkZAoN5tq8eIvqXNu0zWTX+RLHxhTfFretludqmIh4dsUregrWua5
         LDmIPPsf9j0fCZ/z6MWd6yDKZd2bkpDKKtS3GYSx2Du8N6i675D0AonSfkmgHaSRSKVU
         PH59kgtWLtP6dm+TEtu7Q83uGvKFjyq/v/qQtMlMBqXWyWeC1j+Br7RWN28Up0m1fAcV
         3erFnyk27aaaw6DDMdmziMI6e38hnb+V3PKkArtKu7uStS8LMsmHPXxIZptvlpA1aKIn
         l3jbmmy9mwKb2Fo6iuOPsgqsXCaVXMO8bIQesipPx5Ozt/YGLUatwMd4Q0UkMLNyAB4W
         iKEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Z6SWZpdODlnO8czlhOLq31vh6FeRlmcNPXpjA4PbQwY=;
        b=DmmfkDCGtokj/WF9UkJU3wZcFPHKWyDCsxZvR/Hom5RzP8xu/kycPxvY8Lx1DBbp2c
         cw/CH8/cwOkPBz4ALi0o6KPGpguZ7r4pMm5rudlXVbBdkqCgPkiMlTXnfA1YNHbFypI6
         1gHNGl5IoWKyGXmhSOARvmUWgPe3HjZrCwCgpfh/6xGSlJSYMpOUdSdxa72EqKjPBhwS
         w+XeADCAeWBzmGGyMobCamhKlOhC8y0MS3nif1/VKwX2w9ay2YdRLyd1F+6zWUKR8PRb
         7ufXKdfemwDSWCFG46E/B4sd0xev8TvSzYbrt8GhNsboPcAf9SCfJLjd3l7UsVAa/oWp
         P+jw==
X-Gm-Message-State: AOAM530jPRohOsBiNssHoBCaxOFJfShEtc9LceGWQyQhr/EnVgWgMq+D
	1GBoPZPQ46P/rwtJcwHqkkZiPlJU/NJspyeL5f4=
X-Google-Smtp-Source: ABdhPJxUp4l2cNM0Mi7dUy3xmDkpNRan6YTxDifpf/+Te4i46JRveRYApd3LEOf54skGqfEQN2m0obNSESXEZr3N07k=
X-Received: by 2002:a2e:b8cd:: with SMTP id s13mr10687452ljp.201.1640692321679;
 Tue, 28 Dec 2021 03:52:01 -0800 (PST)
MIME-Version: 1.0
References: <20211228041423.2231598-1-gengdongjiu1@gmail.com> <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com>
In-Reply-To: <CAJ=z9a2ww3OptqQn+KDdOMrRB_sSAicnVFQJ2UAySq5xZZjhTQ@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 28 Dec 2021 19:51:51 +0800
Message-ID: <CABSBigR6BWbVHd-AVMjv=wzTPKX_305m792pDjQ_dEK2CTwnHA@mail.gmail.com>
Subject: Re: [PATCH v3] xen/arm: Allow QEMU platform to be built with GICv2
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien.grall.oss@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=88=
28=E6=97=A5=E5=91=A8=E4=BA=8C 18:39=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, 28 Dec 2021 at 05:14, Dongjiu Geng <gengdongjiu1@gmail.com> wrote=
:
> >
> > Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
> > complain about unmet dependencies:
> >
> > tools/kconfig/conf  --syncconfig Kconfig
> >
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >    Selected by [y]:
> >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >    Selected by [y]:
> >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >
> > WARNING: unmet direct dependencies detected for GICV3
> >    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >    Selected by [y]:
> >    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >
> > It turns out that QEMU has been supporting GICv2 virtualization since
> > v3.1.0. So an easy way to solve the issue and allow more custom support
> > is to remove the dependencies on GICv3.
>
> You took my proposed commit message but the diff in
> this version doesn't match it.

Thanks for the point out, I will update it.

>
> >
> > Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > ---
> > change since v1:
> > 1. Address Stefano's comments to add dependency
> >
> > change since v2:
> > 1. Address Julien's comments to update the commit messages.
> > 2. enable GICV3 in arch/arm/configs/tiny64_defconfig
> > ---
> >  xen/arch/arm/Kconfig                  | 5 +++--
> >  xen/arch/arm/configs/tiny64_defconfig | 2 +-
> >  xen/arch/arm/platforms/Kconfig        | 2 +-
> >  3 files changed, 5 insertions(+), 4 deletions(-)
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index ecfa6822e4..373c698018 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
>
> Are the changes necessary in arch/arm/Kconfig to solve the issue on QEMU?
> If not, then they should be in a separate patch.
I will submit it in a separate patch.

> If yes, then they ought to be explained in the commit message.
>
> > @@ -35,7 +35,7 @@ config ACPI
> >
> >  config GICV3
> >         bool "GICv3 driver"
> > -       depends on ARM_64 && !NEW_VGIC
> > +       depends on ARM_64
> >         default y
> >         ---help---
> >
> > @@ -44,13 +44,14 @@ config GICV3
> >
> >  config HAS_ITS
> >          bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if UNSUP=
PORTED
> > -        depends on GICV3 && !NEW_VGIC
> > +        depends on GICV3
> >
> >  config HVM
> >          def_bool y
> >
> >  config NEW_VGIC
> >         bool "Use new VGIC implementation"
> > +       depends on !GICV3
> >         ---help---
> >
> >         This is an alternative implementation of the ARM GIC interrupt
> > diff --git a/xen/arch/arm/configs/tiny64_defconfig b/xen/arch/arm/confi=
gs/tiny64_defconfig
> > index cc6d93f2f8..165603f7e0 100644
> > --- a/xen/arch/arm/configs/tiny64_defconfig
> > +++ b/xen/arch/arm/configs/tiny64_defconfig
> > @@ -4,7 +4,7 @@ CONFIG_ARM=3Dy
> >  #
> >  # Architecture Features
> >  #
> > -# CONFIG_GICV3 is not set
> > +CONFIG_GICV3=3Dy
>
> The goal of tiny64_defconfig is to have nothing enabled by default.
> So we should not enable GICV3 here.
>
> >  # CONFIG_MEM_ACCESS is not set
> >  # CONFIG_SBSA_VUART_CONSOLE is not set
> >
> > diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kc=
onfig
> > index c93a6b2756..925f6ef8da 100644
> > --- a/xen/arch/arm/platforms/Kconfig
> > +++ b/xen/arch/arm/platforms/Kconfig
> > @@ -15,7 +15,7 @@ config ALL_PLAT
> >  config QEMU
> >         bool "QEMU aarch virt machine support"
> >         depends on ARM_64
> > -       select GICV3
> > +       select GICv3 if !NEW_VGIC
>
> There was an open question in v2. In general, it is better to wait
> until the discussion is closed or you mention it after ---. This
> avoids being lost.

Ok,  but I think my modification does not affect to tiny64_defconfig.

>
> Cheers,
>
> --
> Julien Grall

