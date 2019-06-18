Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5EE54ADD9
	for <lists+xen-devel@lfdr.de>; Wed, 19 Jun 2019 00:25:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hdMTY-0008SB-M3; Tue, 18 Jun 2019 22:21:12 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=dhcS=UR=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1hdMTX-0008S6-78
 for xen-devel@lists.xenproject.org; Tue, 18 Jun 2019 22:21:11 +0000
X-Inumbo-ID: 5f840bea-9217-11e9-8980-bc764e045a96
Received: from mail-ua1-x943.google.com (unknown [2607:f8b0:4864:20::943])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 5f840bea-9217-11e9-8980-bc764e045a96;
 Tue, 18 Jun 2019 22:21:09 +0000 (UTC)
Received: by mail-ua1-x943.google.com with SMTP id f20so7724260ual.0
 for <xen-devel@lists.xenproject.org>; Tue, 18 Jun 2019 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8Y+G/dg/rxNAs3OZvpOBmjhH1X4jyL0Q5yVyoy+9BFo=;
 b=FkffmOtDAKyBZgD3qhj5lh463P1Q1u8vP1FjR/xD4iOb925dSoS8uAiL7nW83zgRNc
 haiS+tq1ud3K/mpdJV0w5mG8EdWD2wybSLQSD4wzmiy4UV/qxL1zqS1PBRygqTJGR3mD
 y8ldOYTAyqGTmpeXd75QQSbBGGpf5DiZU/2Id6O/DjRO1wo31ZDBdz/Uz0BPoUv93YSy
 Em1slB8FDnr4frPWBDBg96MvvhUjcAx4aGCfusSGfDHGSuPSXkTSaER2ilJOOs54XNTI
 kLHnuSCQcw0FuPg6R2+h+58cDppiIK0ygIAI++QOnHwwmv116r78qBrof5d+8oQvTq/s
 3uPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8Y+G/dg/rxNAs3OZvpOBmjhH1X4jyL0Q5yVyoy+9BFo=;
 b=Fpq8PN9fbI05VicDSc7ERI5r6lI08DVJ0jZvCdn/bIcSqLjI7JJ1jqHhes95FJvjRO
 w2/4uZGGADR0RdYdFylpZ7qetkXXOZmJWj8u8h8B0YOUnXCfpJGTPje2UWV0hehjCsD0
 2/eYMvntMGc83kh+57SsLBv4dwTP4FjAhtcdwg9zHlurs+sRTDU1CRWyRMaigmov9yQ1
 ElOK/wjiwRxL2kr/iyF+j32jAUA0zwyghcYJiPq9mRUxFX1ugzg2+zyYFBVSHYjJ0C3w
 S4khXPJKSQ+zgpr0eVrbo+CA/WtNBAtk55nlwBv51mupLJcPFJiQ4+4I8Fum/MZfFuf5
 904w==
X-Gm-Message-State: APjAAAWZnSKDvutk6VdI/tchYN6kO0WWaa+3npr9Epvhg5wOveSowGXa
 Mf3JmDq6XXe6r/7k6Gj6cuZP65ZI9GBL+DzVrXY=
X-Google-Smtp-Source: APXvYqxJg0nr40R9AN8RUqm0wgOr2cVoWdwQytrBAkBaKyscWae7ntzh/riZ+yujl7gxypfcZSS3pOX3/r6buibBLrE=
X-Received: by 2002:a67:1e01:: with SMTP id e1mr55875817vse.13.1560896469112; 
 Tue, 18 Jun 2019 15:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <alpine.DEB.2.10.1904301358560.13269@sstabellini-ThinkPad-X260>
 <1556658172-8824-5-git-send-email-sstabellini@kernel.org>
 <bff15c1a-1eaf-4bde-c5dc-a5ada63b4d9f@arm.com>
 <alpine.DEB.2.21.1906181415510.2072@sstabellini-ThinkPad-T480s>
In-Reply-To: <alpine.DEB.2.21.1906181415510.2072@sstabellini-ThinkPad-T480s>
From: Julien Grall <julien.grall@gmail.com>
Date: Tue, 18 Jun 2019 23:20:56 +0100
Message-ID: <CAF3u54CHbQo82D18LTOdhbLgq4YfHkVin1c4YDkv0QLuqwUL3Q@mail.gmail.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [Xen-devel] [PATCH v2 05/10] libxl/xl: add memory policy option
 to iomem
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Julien Grall <julien.grall@arm.com>, ian.jackson@eu.citrix.com,
 wei.liu2@citrix.com, Stefano Stabellini <stefanos@xilinx.com>
Content-Type: multipart/mixed; boundary="===============1880288912437783584=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1880288912437783584==
Content-Type: multipart/alternative; boundary="000000000000929bc8058ba087cb"

--000000000000929bc8058ba087cb
Content-Type: text/plain; charset="UTF-8"

Sorry for the formatting.

On Tue, 18 Jun 2019, 23:09 Stefano Stabellini, <sstabellini@kernel.org>
wrote:

> On Tue, 18 Jun 2019, Julien Grall wrote:
> > On 30/04/2019 22:02, Stefano Stabellini wrote:
> > > diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_create.c
> > > index 89fe80f..a6c5e30 100644
> > > --- a/tools/libxl/libxl_create.c
> > > +++ b/tools/libxl/libxl_create.c
> > > @@ -415,6 +415,21 @@ static void init_console_info(libxl__gc *gc,
> > >          Only 'channels' when mapped to consoles have a string name. */
> > >   }
> > >   +static uint32_t libxl__memory_policy_to_xc(libxl_memory_policy c)
> > > +{
> > > +    switch (c) {
> > > +    case LIBXL_MEMORY_POLICY_ARM_MEM_WB:
> > > +        return MEMORY_POLICY_ARM_MEM_WB;
> > > +    case LIBXL_MEMORY_POLICY_ARM_DEV_NGRE:
> > > +        return MEMORY_POLICY_ARM_DEV_nGRE;
> > > +    case LIBXL_MEMORY_POLICY_X86_UC:
> > > +        return MEMORY_POLICY_X86_UC;
> > > +    case LIBXL_MEMORY_POLICY_DEFAULT:
> > > +    default:
> >
> > Looking at this again, don't we want to bail out if the policy is
> unknown? My
> > concern here is the user may configure with something it didn't expect.
> The
> > risk is the problem will be hard to debug.
> >
> > I also believe this could be part of libxl_{arm,x86}.c allowing us to
> filter
> > misuse early.
>
> This sounds like a good idea, I can do that. Then, I can also #ifdef the
> hypercalls defines, although for some reason today libxl doesn't have
> CONFIG_X86 or CONFIG_ARM set so I would also have to do the following in
> the libxl Makefile:
>
> ifeq ($(CONFIG_X86),y)
> CFLAGS_LIBXL += -DCONFIG_X86
> else
> CFLAGS_LIBXL += -DCONFIG_ARM
> endif
>

Or just follow what we do today in other public headers:

#if defined(__arm__) || defined(__aarch64__)

You need to double check the exact syntax as I wrote it by memory.

Cheers,


>
> > Ian, Wei, any opinion?
>
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--000000000000929bc8058ba087cb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Sorry for the formatting.<br><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 18 Jun 2019, 23:09 St=
efano Stabellini, &lt;<a href=3D"mailto:sstabellini@kernel.org">sstabellini=
@kernel.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Tue, =
18 Jun 2019, Julien Grall wrote:<br>
&gt; On 30/04/2019 22:02, Stefano Stabellini wrote:<br>
&gt; &gt; diff --git a/tools/libxl/libxl_create.c b/tools/libxl/libxl_creat=
e.c<br>
&gt; &gt; index 89fe80f..a6c5e30 100644<br>
&gt; &gt; --- a/tools/libxl/libxl_create.c<br>
&gt; &gt; +++ b/tools/libxl/libxl_create.c<br>
&gt; &gt; @@ -415,6 +415,21 @@ static void init_console_info(libxl__gc *gc,=
<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Only &#39;channels&#39; when ma=
pped to consoles have a string name. */<br>
&gt; &gt;=C2=A0 =C2=A0}<br>
&gt; &gt;=C2=A0 =C2=A0+static uint32_t libxl__memory_policy_to_xc(libxl_mem=
ory_policy c)<br>
&gt; &gt; +{<br>
&gt; &gt; +=C2=A0 =C2=A0 switch (c) {<br>
&gt; &gt; +=C2=A0 =C2=A0 case LIBXL_MEMORY_POLICY_ARM_MEM_WB:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMORY_POLICY_ARM_MEM_WB;<br>
&gt; &gt; +=C2=A0 =C2=A0 case LIBXL_MEMORY_POLICY_ARM_DEV_NGRE:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMORY_POLICY_ARM_DEV_nGRE;<b=
r>
&gt; &gt; +=C2=A0 =C2=A0 case LIBXL_MEMORY_POLICY_X86_UC:<br>
&gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return MEMORY_POLICY_X86_UC;<br>
&gt; &gt; +=C2=A0 =C2=A0 case LIBXL_MEMORY_POLICY_DEFAULT:<br>
&gt; &gt; +=C2=A0 =C2=A0 default:<br>
&gt; <br>
&gt; Looking at this again, don&#39;t we want to bail out if the policy is =
unknown? My<br>
&gt; concern here is the user may configure with something it didn&#39;t ex=
pect. The<br>
&gt; risk is the problem will be hard to debug.<br>
&gt; <br>
&gt; I also believe this could be part of libxl_{arm,x86}.c allowing us to =
filter<br>
&gt; misuse early.<br>
<br>
This sounds like a good idea, I can do that. Then, I can also #ifdef the<br=
>
hypercalls defines, although for some reason today libxl doesn&#39;t have<b=
r>
CONFIG_X86 or CONFIG_ARM set so I would also have to do the following in<br=
>
the libxl Makefile:<br>
<br>
ifeq ($(CONFIG_X86),y)<br>
CFLAGS_LIBXL +=3D -DCONFIG_X86<br>
else<br>
CFLAGS_LIBXL +=3D -DCONFIG_ARM<br>
endif<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Or just follow what we do today in other public headers:</div><div dir=
=3D"auto"><br></div><div dir=3D"auto">#if defined(__arm__) || defined(__aar=
ch64__)</div><div dir=3D"auto"><br></div><div dir=3D"auto">You need to doub=
le check the exact syntax as I wrote it by memory.</div><div dir=3D"auto"><=
br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br></div><div di=
r=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
&gt; Ian, Wei, any opinion?<br>
<br>
_______________________________________________<br>
Xen-devel mailing list<br>
<a href=3D"mailto:Xen-devel@lists.xenproject.org" target=3D"_blank" rel=3D"=
noreferrer">Xen-devel@lists.xenproject.org</a><br>
<a href=3D"https://lists.xenproject.org/mailman/listinfo/xen-devel" rel=3D"=
noreferrer noreferrer" target=3D"_blank">https://lists.xenproject.org/mailm=
an/listinfo/xen-devel</a></blockquote></div></div></div>

--000000000000929bc8058ba087cb--


--===============1880288912437783584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1880288912437783584==--

