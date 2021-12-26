Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B24C047F662
	for <lists+xen-devel@lfdr.de>; Sun, 26 Dec 2021 11:08:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251838.432872 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1QQi-0001lA-D7; Sun, 26 Dec 2021 10:07:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251838.432872; Sun, 26 Dec 2021 10:07:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n1QQi-0001iN-8B; Sun, 26 Dec 2021 10:07:04 +0000
Received: by outflank-mailman (input) for mailman id 251838;
 Sun, 26 Dec 2021 10:07:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=UNhb=RL=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n1QQf-0001iH-Rh
 for xen-devel@lists.xenproject.org; Sun, 26 Dec 2021 10:07:02 +0000
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [2a00:1450:4864:20::141])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8fe1b60f-6633-11ec-9e60-abaf8a552007;
 Sun, 26 Dec 2021 11:07:00 +0100 (CET)
Received: by mail-lf1-x141.google.com with SMTP id bq20so28434944lfb.4
 for <xen-devel@lists.xenproject.org>; Sun, 26 Dec 2021 02:06:58 -0800 (PST)
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
X-Inumbo-ID: 8fe1b60f-6633-11ec-9e60-abaf8a552007
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IbpO5BHDLj63Oyo5xP5NJt5Um1JFeAZFXNeWCYYJRYU=;
        b=Y5mbvQfhUNwv1q64FRNOIExPTXvyK6p2MjrLQ/j4vUcfwojeKsALvIJfi3Oxk9b4TN
         HCuPkWLx+0Z2uUS32DtxrdjM18AL/kMnW0VSQoZMCrKR0iTLG8cThvBhf5fa9rVhS1vP
         cA66ofx9wDLsBKWOE9BU8iH8jSzOgfLYuS074CiNy9CnXya2CTAIyn9knjZbfaV6Dvrx
         yRh3I3wW/2+jG52HOc7lG6rWtJB1NjC83QlsqVWpfIVnbZ6fzxO6hoBKHOCTXyVpy4Pl
         xq7yulz/K5nLTLt8s4kwggzCX/VU5LINRLSD72JBrJ+25YlAJ848Oa1Cl7fR81Sto5Qq
         6fUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IbpO5BHDLj63Oyo5xP5NJt5Um1JFeAZFXNeWCYYJRYU=;
        b=AVDD5xrUaD6FK4eFgiD1D5ib232/Ur/On8+6FS1QI8WCX2zYqYrG1Laa5wD+fuz39F
         HD9si3xSZsQH6lsXZKgaKxY217b03r8YjFChug5oKbL+cCFeXIx/0cXgKnx8WWCfkvxh
         LuAridhCnXm7Msb52a+rhzwDDYgtvwJGaXA7cxc2y9MsNBOO90M12z8I5aeX0e5examg
         yl5l6xPkBWR/x6Om0Qif9QO7+dtTVAHbNgdQcjE96/OiXMfxhl8oHDdi5KMakofB44V3
         22z5kpxMhxNM3YDJa9utxRWAT7vKQ4+Om3NsfuQ4WD2rJcVH32LoFwvuIuP4Bnf/I27w
         NBwg==
X-Gm-Message-State: AOAM531KB/k2Z+BUhCCRvp20jWCxx4pESe/88sSqT9laD5/joNq5Hcpy
	Hmg6HSR863kL/RkvdYjsTLDIC0TQTrIRrq/RAWo=
X-Google-Smtp-Source: ABdhPJwVTUlQodlCjg8Fd0JAMmKjjxwN9OYagkodZlbvv9snlCyXwyvmAnzUEov/fc9n7YwqHz7y5av4aG3P19BtITs=
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr11466084lfq.525.1640513218004;
 Sun, 26 Dec 2021 02:06:58 -0800 (PST)
MIME-Version: 1.0
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org> <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
 <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org>
In-Reply-To: <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Sun, 26 Dec 2021 18:06:46 +0800
Message-ID: <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
To: Julien Grall <julien@xen.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=97=A5=
=E5=91=A8=E4=BA=94 22:21=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> I am not sure why you dropped the others. I have added them back.

sorry, it is my mistake

>
> On 24/12/2021 14:36, Dongjiu Geng wrote:
> > Julien Grall <julien@xen.org> =E4=BA=8E2021=E5=B9=B412=E6=9C=8824=E6=97=
=A5=E5=91=A8=E4=BA=94 21:25=E5=86=99=E9=81=93=EF=BC=9A
> >>
> >> Hi,
> >>
> >> On 24/12/2021 13:24, Dongjiu Geng wrote:
> >>> when enable CONFIG_NEW_VGIC in ARM64 QEMU Platform, it will build fai=
led.
> >>> so fix it and make it can select GICV2.
> >>
> >> As I said in v1, last time I checked QEMU was only able to support
> >> virtualization with GICv3. This is why we added a depends on.
> >
> > I enabled CONFIG_NEW_VGIC, then it will use GICv2. In my check, it
> > does not report an error.
> > My QEMU emulator version is 4.0.0.  What is the QEMU version that you u=
sed?
>
> I am using a more recent QEMU. However, I have always only used GICv3
> becuase it was IIRC there first.
>
> >
> >>
> >> If you want to remove it, then I think you ought to explain in the
> >> commit message why this is fine. A pointer to the commit or a QEMU
> >> version used would be useful.
> >
> > OK=EF=BC=8Cthanks. Can you check if QEMU 4.0.0 is workable with GICv2 o=
n your side?
>
> I don't have direct access to my QEMU setup at the moment. However,
> looking at the history.
>
> So I would suggest the following commit message:
>
> "
> xen/arm: Allow QEMU platform to be built with GICv2
>
> Trying to select PLATFORM_QEMU with NEW_VGIC will result to Kconfig
> complain about unmet dependencies:
>
> tools/kconfig/conf  --syncconfig Kconfig
>
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
>    Selected by [y]:
>    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
>
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
>    Selected by [y]:
>    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
>
> WARNING: unmet direct dependencies detected for GICV3
>    Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
>    Selected by [y]:
>    - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
>
>
> It turns out that QEMU has been supporting GICv2 virtualization since
> v3.1.0. So an easy way to solve the issue and allow more custom support
> is to remove the dependencies on GICv3.
> "

Ok, thanks very much for your suggestion.

>
> > It is workable on my side.
> >
> >
> >>
> >>>
> >>> Signed-off-by: Dongjiu Geng <gengdongjiu1@gmail.com>
> >>> ---
> >>> $ make dist-xen XEN_TARGET_ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux=
-gnu- -j10
> >>> make -C xen install
> >>> make[1]: Entering directory '/home/workspace/gengdongjiu/old_machine/=
XEN/xen/xen'
> >>> make -f /home/workspace/gengdongjiu/old_machine/XEN/xen/xen/tools/kco=
nfig/Makefile.kconfig ARCH=3Darm64 SRCARCH=3Darm HOSTCC=3D"gcc" HOSTCXX=3D"=
g++" syncconfig
> >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/=
XEN/xen/xen'
> >>> gcc -Wp,-MD,tools/kconfig/.conf.o.d      -c -o tools/kconfig/conf.o t=
ools/kconfig/conf.c
> >>> gcc -Wp,-MD,tools/kconfig/.confdata.o.d      -c -o tools/kconfig/conf=
data.o tools/kconfig/confdata.c
> >>> gcc -Wp,-MD,tools/kconfig/.expr.o.d      -c -o tools/kconfig/expr.o t=
ools/kconfig/expr.c
> >>> flex -otools/kconfig/lexer.lex.c -L tools/kconfig/lexer.l
> >>> bison -o tools/kconfig/parser.tab.c --defines=3Dtools/kconfig/parser.=
tab.h -t -l tools/kconfig/parser.y
> >>> gcc -Wp,-MD,tools/kconfig/.preprocess.o.d      -c -o tools/kconfig/pr=
eprocess.o tools/kconfig/preprocess.c
> >>> gcc -Wp,-MD,tools/kconfig/.symbol.o.d      -c -o tools/kconfig/symbol=
.o tools/kconfig/symbol.c
> >>> gcc -Wp,-MD,tools/kconfig/.lexer.lex.o.d     -I /home/workspace/gengd=
ongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/lexer.lex.=
o tools/kconfig/lexer.lex.c
> >>> gcc -Wp,-MD,tools/kconfig/.parser.tab.o.d     -I /home/workspace/geng=
dongjiu/old_machine/XEN/xen/xen/tools/kconfig -c -o tools/kconfig/parser.ta=
b.o tools/kconfig/parser.tab.c
> >>> gcc  -o tools/kconfig/conf tools/kconfig/conf.o tools/kconfig/confdat=
a.o tools/kconfig/expr.o tools/kconfig/lexer.lex.o tools/kconfig/parser.tab=
.o tools/kconfig/preprocess.o tools/kconfig/symbol.o
> >>> tools/kconfig/conf  --syncconfig Kconfig
> >>>
> >>> WARNING: unmet direct dependencies detected for GICV3
> >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >>>     Selected by [y]:
> >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >>>
> >>> WARNING: unmet direct dependencies detected for GICV3
> >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >>>     Selected by [y]:
> >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >>>
> >>> WARNING: unmet direct dependencies detected for GICV3
> >>>     Depends on [n]: ARM_64 [=3Dy] && !NEW_VGIC [=3Dy]
> >>>     Selected by [y]:
> >>>     - QEMU [=3Dy] && <choice> && ARM_64 [=3Dy]
> >>> make[2]: Leaving directory '/home/workspace/gengdongjiu/old_machine/X=
EN/xen/xen'
> >>> make -f Rules.mk _install
> >>> make[2]: Entering directory '/home/workspace/gengdongjiu/old_machine/=
XEN/xen/xen'
> >>> ---
> >>>    xen/arch/arm/Kconfig           | 5 +++--
> >>>    xen/arch/arm/platforms/Kconfig | 1 -
> >>>    2 files changed, 3 insertions(+), 3 deletions(-)
> >>>
> >>> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> >>> index ecfa6822e4..373c698018 100644
> >>> --- a/xen/arch/arm/Kconfig
> >>> +++ b/xen/arch/arm/Kconfig
> >>
> >> The change in arch/arm/Kconfig is not really related to this patch.
> >> Technically the part in platforms/Kconfig is sufficient. I still think
> >> the change is good to have but it should be in a separate patch.
> >
> > sure
> >
> >>
> >>> @@ -35,7 +35,7 @@ config ACPI
> >>>
> >>>    config GICV3
> >>>        bool "GICv3 driver"
> >>> -     depends on ARM_64 && !NEW_VGIC
> >>> +     depends on ARM_64
> >>>        default y
> >>>        ---help---
> >>>
> >>> @@ -44,13 +44,14 @@ config GICV3
> >>>
> >>>    config HAS_ITS
> >>>            bool "GICv3 ITS MSI controller support (UNSUPPORTED)" if U=
NSUPPORTED
> >>> -        depends on GICV3 && !NEW_VGIC
> >>> +        depends on GICV3
> >>>
> >>>    config HVM
> >>>            def_bool y
> >>>
> >>>    config NEW_VGIC
> >>>        bool "Use new VGIC implementation"
> >>> +     depends on !GICV3
> >>>        ---help---
> >>>
> >>>        This is an alternative implementation of the ARM GIC interrupt
> >>> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/=
Kconfig
> >>> index c93a6b2756..6d3ee99456 100644
> >>> --- a/xen/arch/arm/platforms/Kconfig
> >>> +++ b/xen/arch/arm/platforms/Kconfig
> >>> @@ -15,7 +15,6 @@ config ALL_PLAT
> >>>    config QEMU
> >>>        bool "QEMU aarch virt machine support"
> >>>        depends on ARM_64
> >>> -     select GICV3
> >>>        select HAS_PL011
> >>>        ---help---
> >>>        Enable all the required drivers for QEMU aarch64 virt emulated
>
> While writing a proposal for the commit message, I remembered that the
> goal of CONFIG_QEMU was to select all the required drivers to be able to
> boot Xen on QEMU.
>
> AFAICT, if you start from tiny64_defconfig, you would not have GICv3
> selected. So we would technically break users of QEMU with GICv3.

I think I can add CONFIG_GICV3=3Dy in arch/arm/configs/tiny64_defconfig
to this patch, if it must to use GICV3.

>
> I am not entirely sure how to approach it. I can think of 2 options:
>
>   1) Use 'select GICv3 if !NEW_VGIC'
>   2) Add a specific platform for QEMU new vGIC
>
> I have the feeling that 1) will result to same unmet dependency issue.
> Stefano any opinions?

Stefano?

>
> Cheers,
>
> --
> Julien Grall

