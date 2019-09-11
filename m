Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B9FB0353
	for <lists+xen-devel@lfdr.de>; Wed, 11 Sep 2019 20:02:56 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i86t4-0000Bm-9y; Wed, 11 Sep 2019 17:58:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=4ErL=XG=gmail.com=julien.grall@srs-us1.protection.inumbo.net>)
 id 1i86t2-0000Bh-87
 for xen-devel@lists.xenproject.org; Wed, 11 Sep 2019 17:58:36 +0000
X-Inumbo-ID: c66311ba-d4bd-11e9-b76c-bc764e2007e4
Received: from mail-vs1-xe42.google.com (unknown [2607:f8b0:4864:20::e42])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c66311ba-d4bd-11e9-b76c-bc764e2007e4;
 Wed, 11 Sep 2019 17:58:35 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id s18so14383377vsa.0
 for <xen-devel@lists.xenproject.org>; Wed, 11 Sep 2019 10:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iqjZhuB3T+EtEOnlTMDDdAqUk4LWKKt/4SOCDobtOVY=;
 b=N9W6ls7QeMZ0SaE+rSRPTIaOjGrcE0Cq42TarnXTvGnIWKvo/HfDNdcwiXViQQY8XN
 cynx+GDIfJkEARHAXuW9UmcfuzRATTqiZ2mhV9+kw9egHC6CCI9FUKuBdfHJjZmKSVlI
 awZ57FIc0SiQIDew/Q0kEEGu+6JW5d+a9iG4YtI46k7eEeFa4E4j7Za/2zXExGwIipdU
 NEkfkeccz6tsutPs8ot6tn+IKKt4KdL53+E+LIucBEUQyN1lMB7W9CINpwg8Xc95RreE
 YdfNEAGr0xpLg+J7GpNou7CEVmvo5fPVlXsArYHbH+SPYVn+5tNZcKtTy/0StQ87In04
 kxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iqjZhuB3T+EtEOnlTMDDdAqUk4LWKKt/4SOCDobtOVY=;
 b=OUhRrQ2MsHp6iHCzpA09gRdmp7kmYRP6eaf70lhjfN8RNnz0DBwfJXY+cpQFykzw1W
 Y+VjKNQEhr0v4pbgJuEhPLg/Avde3He9O6Y/PMEDd0DUEbgzXzITg27/KWw39rxxI/bz
 mfuEcl8RRKegQFaQzd2OWTgJNxlLeVYhoPzdGt+ok36Pre8WOLakwyI8E3QOMb53H3Zi
 HV+KF5znY4DHRCr7zOwdGM7vGGHHhL065MZJMQcCpFK7w5ru9/SwZjlFOSzdFOvQEhlm
 eu2YDbLDJdSU+atVfRPXJcX3kFSDTPyyiTb2/Vcpte17Cb0lcrpoNp5cSZUxj+TNqUi7
 TYbw==
X-Gm-Message-State: APjAAAXfXxxezogjbEGbcSwnMNhYmhJN+6CV1g7wk1ujAIqXrs7nwK49
 oTlaau4x+pw9Cs6knxJ4TA9RPNN/QfINVenKwPQ=
X-Google-Smtp-Source: APXvYqx+WOom7T17MFVBk4St7f25JA5YFvP8lHrwZy455IwxGNerL0aMa46up6dnu1RdWlbed2PBvzb9nmShpRFe9lA=
X-Received: by 2002:a67:f619:: with SMTP id k25mr2869288vso.160.1568224715023; 
 Wed, 11 Sep 2019 10:58:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190911151942.28459-1-julien.grall@arm.com>
 <87r24mg2kr.fsf@epam.com>
In-Reply-To: <87r24mg2kr.fsf@epam.com>
From: Julien Grall <julien.grall@gmail.com>
Date: Wed, 11 Sep 2019 18:58:21 +0100
Message-ID: <CAF3u54Cp4fuKt6EpS=cARPgtKcVQwAKa8_5uxDfSJhtYCBr-KQ@mail.gmail.com>
To: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [Xen-devel] [PATCH] xen/arm: bootfd: Fix indentation in
 process_multiboot_node()
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
 Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Content-Type: multipart/mixed; boundary="===============2118908665745635055=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============2118908665745635055==
Content-Type: multipart/alternative; boundary="000000000000112bec05924ac57c"

--000000000000112bec05924ac57c
Content-Type: text/plain; charset="UTF-8"

On Wed, 11 Sep 2019, 18:36 Volodymyr Babchuk, <Volodymyr_Babchuk@epam.com>
wrote:

>
> Julien Grall writes:
>
> > One line in process_multiboot_node() is using hard tab rather than soft
> > tab. So fix it!
> >
> > Signed-off-by: Julien Grall <julien.grall@arm.com>
> Reviewed-by: Volodymyr Babchuk <volodymyr_babchuk@epam.com>
>
> So, hunting them one-by-one is the preferred way?


I usually do it while I touch code around. I found this one when debugging
a boot regression today. You are welcome to fix the rest although...

I'm asking this
> because there are more of them:
>
> % find xen/arch/arm -type f -name "*.[ch]" -exec grep -lP "\t" {} \;
> xen/arch/arm/traps.c
> xen/arch/arm/acpi/boot.c
> xen/arch/arm/arm32/lib/assembler.h
> xen/arch/arm/arm64/livepatch.c
> xen/arch/arm/arm64/lib/find_next_bit.c
> xen/arch/arm/arm64/insn.c
>

The 4 above are a copy from Linux and therefore hard tab should stay.

Cheers,


>

--000000000000112bec05924ac57c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, 11 Sep 2019, 18:36 Volodymyr Babchuk, &lt;<a h=
ref=3D"mailto:Volodymyr_Babchuk@epam.com">Volodymyr_Babchuk@epam.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex"><br>
Julien Grall writes:<br>
<br>
&gt; One line in process_multiboot_node() is using hard tab rather than sof=
t<br>
&gt; tab. So fix it!<br>
&gt;<br>
&gt; Signed-off-by: Julien Grall &lt;<a href=3D"mailto:julien.grall@arm.com=
" target=3D"_blank" rel=3D"noreferrer">julien.grall@arm.com</a>&gt;<br>
Reviewed-by: Volodymyr Babchuk &lt;<a href=3D"mailto:volodymyr_babchuk@epam=
.com" target=3D"_blank" rel=3D"noreferrer">volodymyr_babchuk@epam.com</a>&g=
t;<br>
<br>
So, hunting them one-by-one is the preferred way?</blockquote></div></div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I usually do it while I touch =
code around. I found this one when debugging a boot regression today. You a=
re welcome to fix the rest although...</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> I=
&#39;m asking this<br>
because there are more of them:<br>
<br>
% find xen/arch/arm -type f -name &quot;*.[ch]&quot; -exec grep -lP &quot;\=
t&quot; {} \;<br>
xen/arch/arm/traps.c<br>
xen/arch/arm/acpi/boot.c<br>
xen/arch/arm/arm32/lib/assembler.h<br>
xen/arch/arm/arm64/livepatch.c<br>
xen/arch/arm/arm64/lib/find_next_bit.c<br>
xen/arch/arm/arm64/insn.c<br></blockquote></div></div><div dir=3D"auto"><br=
></div><div dir=3D"auto">The 4 above are a copy from Linux and therefore ha=
rd tab should stay.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Chee=
rs,</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><br></blockquote></div></div></div>

--000000000000112bec05924ac57c--


--===============2118908665745635055==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2118908665745635055==--

