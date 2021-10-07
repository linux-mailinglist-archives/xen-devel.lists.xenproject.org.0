Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D59BC4251AB
	for <lists+xen-devel@lfdr.de>; Thu,  7 Oct 2021 13:04:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.203485.358620 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYRCQ-0003UD-9T; Thu, 07 Oct 2021 11:04:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 203485.358620; Thu, 07 Oct 2021 11:04:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mYRCQ-0003RQ-5z; Thu, 07 Oct 2021 11:04:30 +0000
Received: by outflank-mailman (input) for mailman id 203485;
 Thu, 07 Oct 2021 11:04:28 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=A0uJ=O3=gmail.com=rm.skakun@srs-us1.protection.inumbo.net>)
 id 1mYRCO-0003RK-I1
 for xen-devel@lists.xenproject.org; Thu, 07 Oct 2021 11:04:28 +0000
Received: from mail-lf1-x12a.google.com (unknown [2a00:1450:4864:20::12a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 53926e5f-8c01-459d-988a-ba31acdcb2e6;
 Thu, 07 Oct 2021 11:04:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id i24so22423242lfj.13
 for <xen-devel@lists.xenproject.org>; Thu, 07 Oct 2021 04:04:27 -0700 (PDT)
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
X-Inumbo-ID: 53926e5f-8c01-459d-988a-ba31acdcb2e6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=9jP2d89X+kWjeTBhkUbJIM4PPIeDYyNUgkGwBJAUDM8=;
        b=IPie/laU4y6ly7aAN2xdcZRMcRQy7jw0K67z+wy7r0y2akbO16ZD2sOtSDsLXgfZHZ
         M5t81p5NpuvQILVoz0ElykirfeOvGHN6gsq/a8noRYpifGukcwAzO/AO5bVvgtxARpLZ
         jGeG3X6hTiDj4pTs9CqN1LBHp8jOlGpR9YeJ2Gec4pEPL0n0TQxgcXmVOAHVAf0ePE/J
         ecCFhewknjcYPV7ZlB1Yx+J4qdsbpUovjysE5piTcuNZcHGBNcEHFC0hh4OqNYb4t/Ra
         50M10S8CSNK7nWYqGKYFF8tJrBOd6twN89+H7XODkbi6wGRuLZday1CTe4OmzsoYHY89
         5/ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=9jP2d89X+kWjeTBhkUbJIM4PPIeDYyNUgkGwBJAUDM8=;
        b=UQwR97SD9G4rZ0W6FIHaWb3rSqi3cEZNgedijC09IuVwavHWP6sbRYpWUsy4+qMXip
         uJio201qywbBwXgx56V1vSP5Mvu5Ee/PDWl8uDV9cS21/Hp+TWk+5COUnaqtlYCqfOXs
         Tt8vA4rRopq44GSfKISQO0B0tE8rm+Nc91tb7ai7RT1oOR+o1ElUmPtMp5eGqN/8FMok
         J0ozUj+XXEKroudShqgdzHcDxd60gHw8GHXthJxyPz3N4XmMdIB1c/cIp4BPM01EiGZy
         mAm4PGTFq0DTNfkFu419E1Dx0gvhDwkvsFWh7nWF3ulnWGEE0MD+ieYpTl0fwuCrn+Ab
         eJXw==
X-Gm-Message-State: AOAM531cO8FqSDm0xWnKCMnJBKUTgl5d/HPhyU+g6MrhR373ETzG+GM1
	TNyA42rbFFPa0IjgjCIUuOk4DIdMEXgiGgQAlOw=
X-Google-Smtp-Source: ABdhPJyfdKE4PxIK04VLfT21c921fcozx1jw8d2B/K6W4nuoXnEehHYqlXC5AuB02Hy4pmMQtLKXvY3+TRtLdgw+cU4=
X-Received: by 2002:a2e:5c7:: with SMTP id 190mr3861902ljf.277.1633604664637;
 Thu, 07 Oct 2021 04:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1633106362.git.roman_skakun@epam.com> <5b101e4e85668bbb18da83044520b0350344f408.1633106362.git.roman_skakun@epam.com>
 <292787a5-503f-72a5-3255-e583a1d014cb@gmail.com>
In-Reply-To: <292787a5-503f-72a5-3255-e583a1d014cb@gmail.com>
From: Roman Skakun <rm.skakun@gmail.com>
Date: Thu, 7 Oct 2021 14:04:13 +0300
Message-ID: <CADu_u-Pn6_+1_YFJCJpZff2LvJJz1ntn0vZ1JOuvSU0Yg=2VYw@mail.gmail.com>
Subject: Re: [RFC 1/1] xen/arm: set iommu property for IOMMU-protected devices
To: Oleksandr <olekstysh@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
	xen-devel@lists.xenproject.org, Roman Skakun <roman_skakun@epam.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Andrii Anisov <andrii_anisov@epam.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Oleksandr,

>> From: Roman Skakun <roman_skakun@epam.com>
>>
>> Xen is not exposing any IOMMU properties to Dom0.
>> So Dom0 assumes that all it's devices are not protected by IOMMU.
>>
>> To make Dom0 aware of IOMMU-protected devices, we need to mark
>> them somehow. With this approach Dom0 Linux kernel will be able
>> to selectively disable swiotlb-xen fops for them which will remove
>> unnecessary buffer bounces.
>>
>> This patch adds mechanism to describe IOMMU-protected devices by
>> adding `xen,behind-iommu` property to relevant device nodes in
>> Dom0 device tree.
>
> I think that new property should be documented probably at
>
> docs/misc/arm/device-tree/...

Yes, make sense.
I will add a description for a new property in the next patch series.
Thanks!

Cheers,
Roman

=D1=81=D1=80, 6 =D0=BE=D0=BA=D1=82. 2021 =D0=B3. =D0=B2 15:45, Oleksandr <o=
lekstysh@gmail.com>:
>
>
> On 04.10.21 12:54, Roman Skakun wrote:
>
> Hi Roman
>
> > From: Roman Skakun <roman_skakun@epam.com>
> >
> > Xen is not exposing any IOMMU properties to Dom0.
> > So Dom0 assumes that all it's devices are not protected by IOMMU.
> >
> > To make Dom0 aware of IOMMU-protected devices, we need to mark
> > them somehow. With this approach Dom0 Linux kernel will be able
> > to selectively disable swiotlb-xen fops for them which will remove
> > unnecessary buffer bounces.
> >
> > This patch adds mechanism to describe IOMMU-protected devices by
> > adding `xen,behind-iommu` property to relevant device nodes in
> > Dom0 device tree.
>
> I think that new property should be documented probably at
>
> docs/misc/arm/device-tree/...
>
> >
> > Signed-off-by: Roman Skakun <roman_skakun@epam.com>
> > ---
> >   xen/arch/arm/domain_build.c | 7 +++++++
> >   1 file changed, 7 insertions(+)
> >
> > diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> > index 69fff7fc29..99e2c42b6c 100644
> > --- a/xen/arch/arm/domain_build.c
> > +++ b/xen/arch/arm/domain_build.c
> > @@ -580,6 +580,13 @@ static int __init write_properties(struct domain *=
d, struct kernel_info *kinfo,
> >               return res;
> >       }
> >
> > +    if ( iommu_node && is_iommu_enabled(d) && dt_device_is_protected(n=
ode) )
> > +    {
> > +        res =3D fdt_property(kinfo->fdt, "xen,behind-iommu", NULL, 0);
> > +        if ( res )
> > +            return res;
> > +    }
> > +
> >       /*
> >        * Override the property "status" to disable the device when it's
> >        * marked for passthrough.
>
> --
> Regards,
>
> Oleksandr Tyshchenko
>


--=20
Best Regards, Roman.

