Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C8948086B
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 11:28:02 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252170.433165 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n29hE-0005qu-28; Tue, 28 Dec 2021 10:27:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252170.433165; Tue, 28 Dec 2021 10:27:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n29hD-0005nv-UN; Tue, 28 Dec 2021 10:27:07 +0000
Received: by outflank-mailman (input) for mailman id 252170;
 Tue, 28 Dec 2021 10:27:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8vDp=RN=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1n29hD-0005np-2G
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 10:27:07 +0000
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [2a00:1450:4864:20::42e])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3fbb425-67c8-11ec-9e60-abaf8a552007;
 Tue, 28 Dec 2021 11:27:05 +0100 (CET)
Received: by mail-wr1-x42e.google.com with SMTP id d9so37558501wrb.0
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 02:27:05 -0800 (PST)
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
X-Inumbo-ID: b3fbb425-67c8-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=fGJ6UuRYwCy3ENFhCHz+3SA3xRmM3TXbG4gIBgWcIsU=;
        b=TpeU3Sgqrq+iT+SItzLrWe2hdennvopfK+nxQ6eo4wJl521OWot9TW6plKU68b6SzQ
         4mwtSHtVg4zXkVqLbMyV+OJGidkjl48jixigLZTV6qnfYRh7hhXgWX8NUxU6fsTX+k43
         jnE4n3iRHeEUbDSEWRUa073tMIKM3iSeKv6ELKzoXG5ci5myVFLOWulwjwTW+R/TpoI6
         kN0goPuhog+43Oj2Usf4DcDCP9/6FJlZ127bQ3c5carqhfp5zM34G2VyCjkNKjVXao+A
         nxWDZ5XqkSpmxRwfxH/rutNgEf2E4WSQDdWsaivC1ipiUQFhyUNrJdyj7s0m0DoMBzHw
         IhRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=fGJ6UuRYwCy3ENFhCHz+3SA3xRmM3TXbG4gIBgWcIsU=;
        b=sD59fVia9yV2T36dHGonXMMpOx1SN7Yn7uD9Wn4vJCwbXAcphT0Tf3Jc+q9t64mx5/
         oeCrNbGhref/gIq8IonMMRRJZJPZQjvJae2PRdindf2zVifMU81US+IuyIHwxWV+7Fse
         BdUGe4LLR20i3oZxlpBD6fywh5sZ1Qv8oioEGqkuua4LZafKoMuXMkoFzsZTdh8qpFcD
         IEtdNGnKiZJlMEiJHSHpFOCqKZ3Dq5PtysGirwpp6soCd43oP26BoYHDS+SCbbKEJRo6
         mjXX7dTv4dm6uwauxwthSnNXSIF9paauxd08cpFqNqmCrzrmxCC5xJ6xHuRG3PIMgy39
         N5/g==
X-Gm-Message-State: AOAM533whdhSVoiFmzezxCkZd+JSdrtJVO1mF+Z1UaLILMuditzYq22Y
	hpF8tXGyIuOAd95A+GbjnT/5LOIFSyHL53jTbAU=
X-Google-Smtp-Source: ABdhPJwSMLYOIMlPjiCc//kDhSPOVZJ0xy+Zgv+9n7A2uyVWOdBZ8iFDO/fYggQmwW2lsO3/NvE9doNGgm83bw81i04=
X-Received: by 2002:a5d:448f:: with SMTP id j15mr16322419wrq.603.1640687224890;
 Tue, 28 Dec 2021 02:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org> <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
 <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org> <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
In-Reply-To: <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 28 Dec 2021 11:26:53 +0100
Message-ID: <CAJ=z9a1o_-3A3=NKkbBT-s2EGM+WKJPiwxSt3q45PWs_9udcdw@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
To: Dongjiu Geng <gengdongjiu1@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

On Sun, 26 Dec 2021 at 11:07, Dongjiu Geng <gengdongjiu1@gmail.com> wrote:
>
> Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
> >
> > Hi,
> >
> > I am not sure why you dropped the others. I have added them back.
>
> sorry, it is my mistake
>
> >
> > On 24/12/2021 14:36, Dongjiu Geng wrote:
> > > Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=
=97=A5=E5=91=A8=E4=BA=94 21:25=E5=86=99=E9=81=93=EF=BC=9A
> > >>
> > >> Hi,
> > >>
> > >> On 24/12/2021 13:24, Dongjiu Geng wrote:
> > >>> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build f=
ailed.
> > >>> so fix it and make it can select GICV2.
> > >>
> > >> As I said in v1, last time I checked QEMU was only able to support
> > >> virtualization with GICv3. This is why we added a depends on.
> > >
> > > I enabled CONFIG_NEW_VGIC, then it will use GICv2. In my check, it
> > > does not report an error.
> > > My QEMU emulator version is 4.0.0.  What is the QEMU version that you=
 used?
> >
> > I am using a more recent QEMU. However, I have always only used GICv3
> > becuase it was IIRC there first.
> >
> > >
> > >>
> > >> If you want to remove it, then I think you ought to explain in the
> > >> commit message why this is fine. A pointer to the commit or a QEMU
> > >> version used would be useful.
> > >
> > > OK=EF=BC=8Cthanks. Can you check if QEMU 4.0.0 is workable with GICv2=
 on your side?
> >
> > I don't have direct access to my QEMU setup at the moment. However,
> > looking at the history.
> >
> > So I would suggest the following commit message:
> >
> > "
> > xen/arm: Allow QEMU platform to be built with GICv2
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
> >
> > It turns out that QEMU has been supporting GICv2 virtualization since
> > v3.1.0. So an easy way to solve the issue and allow more custom support
> > is to remove the dependencies on GICv3.
> > "
>
> Ok, thanks very much for your suggestion.
>
> >
> > > It is workable on my side.
> > >
> > >
> > >>
> > >>>
> > >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> > >>> ---
> > >>> $ make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-lin=
ux-gnu- -j10
> > >>> make -C xen install
> > >>> make[1]: Entering directory '/home/workspace/gengdongjiu/old_machin=
e/XEN/xen/xen'
> > >>> make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/k=
config/Makefile.kconfig ARCH=3Darm64 SRCARCH=3Darm HOSTCC=3D"gcc" HOSTCXX=
=3D"g++" syncconfig
> > >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machin=
e/XEN/xen/xen'
> > >>> gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o=
 tools/kconfig/conf.c
> > >>> gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/co=
nfdata.o tools/kconfig/confdata.c
> > >>> gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o=
 tools/kconfig/expr.c
> > >>> flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> > >>> bison -o tools/kconfig/parser.tab.c --defines=3Dtools/kconfig/parse=
r.tab.h -t -l tools/kconfig/parser.y
> > >>> gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfig/=
preprocess.o tools/kconfig/preprocess.c
> > >>> gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symb=
ol.o tools/kconfig/symbol.c
> > >>> gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/gen=
gdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.le=
x.o tools/kconfig/lexer.lex.c
> > >>> gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/ge=
ngdongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parser.=
tab.o tools/kconfig/parser.tab.c
> > >>> gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confd=
ata.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.t=
ab.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
> > >>> tools/kconfig/conf  --syncconfig Kconfig
> > >>>
> > >>> WARNING: unmet direct dependencies detected for GICV3
> > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >>>     Selected by [y]:
> > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >>>
> > >>> WARNING: unmet direct dependencies detected for GICV3
> > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >>>     Selected by [y]:
> > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >>>
> > >>> WARNING: unmet direct dependencies detected for GICV3
> > >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> > >>>     Selected by [y]:
> > >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> > >>> make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machine=
/XEN/xen/xen'
> > >>> make -f Rules.mk _install
> > >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machin=
e/XEN/xen/xen'
> > >>> ---
> > >>>    xen/arch/arm/Kconfig           | 5 +++--
> > >>>    xen/arch/arm/platforms/Kconfig | 1 -
> > >>>    2 files changed, 3 insertions(+), 3 deletions(-)
> > >>>
> > >>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > >>> index ecfa6822e4..373c698018 100644
> > >>> --- a/xen/arch/arm/Kconfig
> > >>> +++ b/xen/arch/arm/Kconfig
> > >>
> > >> The change in arch/arm/Kconfig is not really related to this patch.
> > >> Technically the part in platforms/Kconfig is sufficient. I still thi=
nk
> > >> the change is good to have but it should be in a separate patch.
> > >
> > > sure
> > >
> > >>
> > >>> @@ -35,7 +35,7 @@ config ACPI
> > >>>
> > >>>    config GICV3
> > >>>        bool "GICv3 driver"
> > >>> -     depends on ARM_64 && !NEW_VGIC
> > >>> +     depends on ARM_64
> > >>>        default y
> > >>>        ---help---
> > >>>
> > >>> @@ -44,13 +44,14 @@ config GICV3
> > >>>
> > >>>    config HAS_ITS
> > >>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if=
 UNSUPPORTED
> > >>> -        depends on GICV3 && !NEW_VGIC
> > >>> +        depends on GICV3
> > >>>
> > >>>    config HVM
> > >>>            def_bool y
> > >>>
> > >>>    config NEW_VGIC
> > >>>        bool "Use new VGIC implementation"
> > >>> +     depends on !GICV3
> > >>>        ---help---
> > >>>
> > >>>        This is an alternative implementation of the ARM GIC interru=
pt
> > >>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platform=
s/Kconfig
> > >>> index c93a6b2756..6d3ee99456 100644
> > >>> --- a/xen/arch/arm/platforms/Kconfig
> > >>> +++ b/xen/arch/arm/platforms/Kconfig
> > >>> @@ -15,7 +15,6 @@ config ALL_PLAT
> > >>>    config QEMU
> > >>>        bool "QEMU aarch virt machine support"
> > >>>        depends on ARM_64
> > >>> -     select GICV3
> > >>>        select HAS_PL011
> > >>>        ---help---
> > >>>        Enable all the required drivers for QEMU aarch64 virt emulat=
ed
> >
> > While writing a proposal for the commit message, I remembered that the
> > goal of CONFIG_QEMU was to select all the required drivers to be able t=
o
> > boot Xen on QEMU.
> >
> > AFAICT, if you start from tiny64_defconfig, you would not have GICv3
> > selected. So we would technically break users of QEMU with GICv3.
>
> I think I can add CONFIG_GICV3=3Dy in arch/arm/configs/tiny64_defconfig
> to this patch, if it must to use GICV3.

Please don't update tiny64_defconfig. The goal of tiny64_defconfig is to
have a config with only the bare-minimum. If add CONFIG_GICV3=3Dy, then it =
will
be enabled when it is not necessary.

Cheers,

