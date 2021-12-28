Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D07480986
	for <lists+xen-devel@lfdr.de>; Tue, 28 Dec 2021 14:22:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252248.433248 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2CR1-0001dm-Sh; Tue, 28 Dec 2021 13:22:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252248.433248; Tue, 28 Dec 2021 13:22:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n2CR1-0001bO-PK; Tue, 28 Dec 2021 13:22:35 +0000
Received: by outflank-mailman (input) for mailman id 252248;
 Tue, 28 Dec 2021 13:22:34 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=8Zee=RN=gmail.com=gengdongjiu1@srs-se1.protection.inumbo.net>)
 id 1n2CR0-0001bI-44
 for xen-devel@lists.xenproject.org; Tue, 28 Dec 2021 13:22:34 +0000
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37169a7a-67e1-11ec-bb0b-79c175774b5d;
 Tue, 28 Dec 2021 14:22:33 +0100 (CET)
Received: by mail-lj1-x233.google.com with SMTP id h21so18743831ljh.3
 for <xen-devel@lists.xenproject.org>; Tue, 28 Dec 2021 05:22:33 -0800 (PST)
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
X-Inumbo-ID: 37169a7a-67e1-11ec-bb0b-79c175774b5d
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Di9+eaGKU3zSk5aHK3Kr70qIdnImPAYERypyyGpIcmI=;
        b=RKNQtaPFTWQK0a8sy+17EdRNtdVWIyVkVTIGIMBJIVR1eOL7XPAkzv+pUcaHVcvq2X
         LnNphQbSdAa6FLnxugud4SOzKkwKIk2YCZ8BTPuBzSLxm3xFFjIuS85Hd2WIDugouMP8
         uKblXKGSR5TPE9skHo6WHCSW8qa0pOlu2o/JTYqMiuf25J9t4hYz9FkDR5e7Uqfl0iGo
         yvSvkx9ECk6FNe00OQMdgfN+iScC7hzOeet+k4K0wcjWUwRxUQdc4ZDfp/V6ar6HUVPc
         MwDrwgX67AajYhIg+YmxjpxcK0xkBrUA9rzfO8AZHMOyypX5WsnSPZzwQsQVWzxV8Jmp
         4upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Di9+eaGKU3zSk5aHK3Kr70qIdnImPAYERypyyGpIcmI=;
        b=4sYA7z/JT3rnxHP0nhIYLj+baef4pjkiZ+igo7cSs1qcB0Swfgym8mzl38hf6EeT9m
         kLuNC0m6st/8b5EHoR8UxUICxprfqVwdSpAumXkQuTM/BEx/JUUBU9d4GHQAWmrq0fcD
         2mZ4K4lZkABahClGr8wY/kmrAyDq682H+/jzVPmfrIgqBy60ruByxrgAKZbaRFgm1+8X
         7GJ2aMWWBRloMiRfL6yKUzXgS7HcYMOgaiEa1lgmszUcD6UxpdRAi4+OLOaRqtbE7nof
         3gnxXCgxCVKd5Ff19272E8nGLHDPDzEldJpzGw+kqN3H0GpHlWLLP0Qey8sUztZirqwH
         Kn9g==
X-Gm-Message-State: AOAM530KLi+lO1t06gCxm43cds6+TXt/iMX6z4FePJRQLp7+7aVx968a
	Y4ziD84nL5br5fJfqYtfRyH2OEMVX3vrtU5pDJI=
X-Google-Smtp-Source: ABdhPJzz1YOx8wA3UmEW07hcR4smpHX4dVGvNf/MplcdYaX4yEGxljBKbmZ/sGCQnA1y/ilQW64qzYTZIVJcb2NtcUg=
X-Received: by 2002:a05:651c:b27:: with SMTP id b39mr13031347ljr.26.1640697752832;
 Tue, 28 Dec 2021 05:22:32 -0800 (PST)
MIME-Version: 1.0
References: <20211224122451.1210382-1-gengdongjiu1@gmail.com>
 <22172c85-b024-a28a-e351-82038cf0efa1@xen.org> <CABSBigQjy2jvW6czAXHMvVc9DmHRED5HWz-5At6FN9gPLnzsng@mail.gmail.com>
 <9a1edb02-ad32-4229-6baf-dbe69d7e718b@xen.org> <CABSBigTZ--z_ZCGd6-VQEvfyu+166WA2C_Ns7qFiWPay9A=hUA@mail.gmail.com>
 <CAJ=z9a1o_-3A3=NKkbBT-s2EGM+WKJPiwxSt3q45PWs_9udcdw@mail.gmail.com>
 <CABSBigTyZ46OjvANi23e3sgL8+AKk73=3AOQnfvwhWcXhM-pgQ@mail.gmail.com> <CAJ=z9a0dNOBHh3Gw5Q+JeHMRYqRqTrtDzk4p2MWDq2CaTFW4Dw@mail.gmail.com>
In-Reply-To: <CAJ=z9a0dNOBHh3Gw5Q+JeHMRYqRqTrtDzk4p2MWDq2CaTFW4Dw@mail.gmail.com>
From: Dongjiu Geng <gengdongjiu1@gmail.com>
Date: Tue, 28 Dec 2021 21:22:22 +0800
Message-ID: <CABSBigQK+jAJOBvXH4FSLz=WNS+8m_BS_xHOsxOQBZ7NXn-62w@mail.gmail.com>
Subject: Re: [PATCH v2] xen/arm: fix the build error for GIC on ARM64 QEMU Platform
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
	Bertrand Marquis <bertrand.marquis@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Julien Grall <julien.grall.oss@gmail.com> =E4=BA=8E2021=E5=B9=B412=E6=9C=88=
28=E6=97=A5=E5=91=A8=E4=BA=8C 20:30=E5=86=99=E9=81=93=EF=BC=9A
>
> Hi,
>
> On Tue, 28 Dec 2021 at 12:37, Dongjiu Geng <gengdongjiu1@gmail.com> wrote=
:
> > > Please don't update tiny64_defconfig. The goal of tiny64_defconfig is=
 to
> > > have a config with only the bare-minimum. If add CONFIG_GICV3=3Dy, th=
en it will
> > > be enabled when it is not necessary.
> >
> > Ok=EF=BC=8Cwe can let the user configure the CONFIG_GICV3 in tiny64_def=
config
> > according his neccesary.
> > So I think my modification does not affect the tiny64_defconfig.
>
> But you modified tiny64_defconfig. Anything you add in it means it is
> going to be enabled by default.
>
> > what
> > is your concern about it?
>
> As I wrote before, the goal of tiny64_defconfig is to enable the strict
> minimum. I don't consider GICv3 to be part of this.
>
> Instead, we should let each user decide whether they want to include it
> depending on the platform they are targeting.

Ok, thanks. I think we should not consider tiny64_defconfig,  because
the user can decide whether to use GICV3 or NEW_GIC.

>
> Cheers,

