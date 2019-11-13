Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB7AFA9E0
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2019 06:54:06 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUlZd-0003Rl-Uu; Wed, 13 Nov 2019 05:52:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=u0j9=ZF=gmail.com=julien.grall.oss@srs-us1.protection.inumbo.net>)
 id 1iUlZc-0003Rd-KU
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2019 05:52:12 +0000
X-Inumbo-ID: bc33c674-05d9-11ea-984a-bc764e2007e4
Received: from mail-lf1-x141.google.com (unknown [2a00:1450:4864:20::141])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bc33c674-05d9-11ea-984a-bc764e2007e4;
 Wed, 13 Nov 2019 05:52:11 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id d6so893065lfc.0
 for <xen-devel@lists.xenproject.org>; Tue, 12 Nov 2019 21:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j55pLTmvcRaU8IhNfZ0f3xmd2DyqD+5EXe0AEhi28yo=;
 b=ddzSZmgXy9y87VeVZffBj9M/RgOP7JSsVjLLzQ7KUSup8GGy6O0StI7bIWPcrBeLiI
 V93oC1HYox5s+AQbd9l3LypDfkSX7w2qa9g9qt+IdicP0cnEfD/LLE1accHKOtb35oWm
 CGot9C/BSx3HjQPRc6GS6Q9VWQL1Smin80szakA6eVelQIGj+fy23+ybz5WA72kbdTko
 sBvX0RAQWdTNhdZzHmgWIv8MJoW1ikmTc2J8/sS9Bs6cRHkCmgKWsGC6ZAGDaQI6PoW8
 ZABXjC1iCYKkCW/l3QhittCoqAer9NBbyErOalt13SDBJVyodImM/XKPTdy2xbrsr48D
 8DLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j55pLTmvcRaU8IhNfZ0f3xmd2DyqD+5EXe0AEhi28yo=;
 b=ImYVfLRROeCbmlR5CHwVvnO1bm3urXeFCNs0G+LjI4e9pThKwcy9vklhcnRx3WxR2l
 diFWfZQ+rLlL+G5zFQZ206J76C4G/9qPkTmJqaIPWiKX2Ojktjj9bpIxwffr6Wvu0Fw2
 Q4NqEkhkzWRPXGqW7y26MXC0i8b2izzOMDcAsjHD49dMN2pjE0/yMJsVXjNgNyBmuYWU
 5sKWt20jpBathoS+fQvklB5h35EG5qbFYcnrr44M6N4I+PEOgC43o6GnADvMa4HUiuyr
 m5Ug0syK3vwd6nY1JtfjgatttP9eE3F3qfkyQQOlJFnQ8+ahPTaW4DEjN9jRbk3WxTJf
 K1dA==
X-Gm-Message-State: APjAAAXVRpF58WDMpRaIG02ksppoHefk5kgIQSgcyhTl1++HLQD7eOjb
 Fi8Z+G1CBHdUXTTBfGQ/AUotKRha31BLxo1KtXI=
X-Google-Smtp-Source: APXvYqwU2ikNb58KItpUOF7q+ncGhtoJqFrnteR94Vd8gfO85pN4BEfHTMxqog6V5o1YvhVbLnlVpZUhLvDBZw5Ak8Y=
X-Received: by 2002:ac2:48af:: with SMTP id u15mr1180789lfg.11.1573624330808; 
 Tue, 12 Nov 2019 21:52:10 -0800 (PST)
MIME-Version: 1.0
References: <1573031953-12894-1-git-send-email-andrii.anisov@gmail.com>
 <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
In-Reply-To: <1573031953-12894-7-git-send-email-andrii.anisov@gmail.com>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Wed, 13 Nov 2019 14:51:58 +0900
Message-ID: <CAJ=z9a2BvEbDRevvZHMjP31XqDOMd7MOSYjgVu8wEP369XnrUQ@mail.gmail.com>
To: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [Xen-devel] [RFC 6/7] arm: Introduce dummy empty functions for
 data only C files
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
Cc: xen-devel@lists.xenproject.org, Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Content-Type: multipart/mixed; boundary="===============1861015380144426832=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1861015380144426832==
Content-Type: multipart/alternative; boundary="0000000000003f72ff059733f7d9"

--0000000000003f72ff059733f7d9
Content-Type: text/plain; charset="UTF-8"

Hi,

On Wed, 6 Nov 2019, 18:20 Andrii Anisov, <andrii.anisov@gmail.com> wrote:

> From: Andrii Anisov <andrii_anisov@epam.com>
>
> ARM Compiler 6 has a proven bug: it compiles data only C files with
> SoftVFP attributes. This leads to a failed linkage afterwards with
> an error:
>

And there are no way to force disabling the softfvp attributes?


> Error: L6242E: Cannot link object built_in.o as its attributes are
> incompatible with the image attributes.
> ... A64 clashes with SoftVFP.
>
> The known workaround is introducing some code into the affected file,
> e.g. an empty (non-static) function is enough.
>

Was this reported to Arm? If so, what was there answer?

Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
> ---
>  xen/arch/arm/platforms/brcm-raspberry-pi.c | 2 ++
>  xen/arch/arm/platforms/thunderx.c          | 2 ++
>  xen/xsm/flask/gen-policy.py                | 4 ++++
>  3 files changed, 8 insertions(+)
>
> diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> index b697fa2..7ab1810 100644
> --- a/xen/arch/arm/platforms/brcm-raspberry-pi.c
> +++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c
> @@ -40,6 +40,8 @@ static const struct dt_device_match rpi4_blacklist_dev[]
> __initconst =
>      { /* sentinel */ },
>  };
>
> +void brcm_raspberry_pi_dummy_func(void) {}
> +
>  PLATFORM_START(rpi4, "Raspberry Pi 4")
>      .compatible     = rpi4_dt_compat,
>      .blacklist_dev  = rpi4_blacklist_dev,
> diff --git a/xen/arch/arm/platforms/thunderx.c
> b/xen/arch/arm/platforms/thunderx.c
> index 9b32a29..8015323 100644
> --- a/xen/arch/arm/platforms/thunderx.c
> +++ b/xen/arch/arm/platforms/thunderx.c
> @@ -33,6 +33,8 @@ static const struct dt_device_match
> thunderx_blacklist_dev[] __initconst =
>      { /* sentinel */ },
>  };
>
> +void thunderx_dummy_func(void) {}
> +
>  PLATFORM_START(thunderx, "THUNDERX")
>      .compatible = thunderx_dt_compat,
>      .blacklist_dev = thunderx_blacklist_dev,
> diff --git a/xen/xsm/flask/gen-policy.py b/xen/xsm/flask/gen-policy.py
> index c7501e4..73bf7d2 100644
> --- a/xen/xsm/flask/gen-policy.py
> +++ b/xen/xsm/flask/gen-policy.py
> @@ -21,3 +21,7 @@ sys.stdout.write("""
>  };
>  const unsigned int __initconst xsm_flask_init_policy_size = %d;
>  """ % policy_size)
> +
> +sys.stdout.write("""
> +void policy_dummy_func(void) {}
> +""")
> --
> 2.7.4
>
>

--0000000000003f72ff059733f7d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, 6 Nov 2019, 18:20 Andrii Anisov, &lt;<a hre=
f=3D"mailto:andrii.anisov@gmail.com">andrii.anisov@gmail.com</a>&gt; wrote:=
<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex">From: Andrii Anisov &lt;<a href=3D=
"mailto:andrii_anisov@epam.com" target=3D"_blank" rel=3D"noreferrer">andrii=
_anisov@epam.com</a>&gt;<br>
<br>
ARM Compiler 6 has a proven bug: it compiles data only C files with<br>
SoftVFP attributes. This leads to a failed linkage afterwards with<br>
an error:<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">And there are no way to force disabling the softfvp attributes?</=
div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote=
"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">
<br>
Error: L6242E: Cannot link object built_in.o as its attributes are incompat=
ible with the image attributes.<br>
... A64 clashes with SoftVFP.<br>
<br>
The known workaround is introducing some code into the affected file,<br>
e.g. an empty (non-static) function is enough.<br></blockquote></div></div>=
<div dir=3D"auto"><br></div><div dir=3D"auto">Was this reported to Arm? If =
so, what was there answer?</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Andrii Anisov &lt;<a href=3D"mailto:andrii_anisov@epam.com" =
target=3D"_blank" rel=3D"noreferrer">andrii_anisov@epam.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/arm/platforms/brcm-raspberry-pi.c | 2 ++<br>
=C2=A0xen/arch/arm/platforms/thunderx.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 2 ++<br>
=C2=A0xen/xsm/flask/gen-policy.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 4 ++++<br>
=C2=A03 files changed, 8 insertions(+)<br>
<br>
diff --git a/xen/arch/arm/platforms/brcm-raspberry-pi.c b/xen/arch/arm/plat=
forms/brcm-raspberry-pi.c<br>
index b697fa2..7ab1810 100644<br>
--- a/xen/arch/arm/platforms/brcm-raspberry-pi.c<br>
+++ b/xen/arch/arm/platforms/brcm-raspberry-pi.c<br>
@@ -40,6 +40,8 @@ static const struct dt_device_match rpi4_blacklist_dev[] =
__initconst =3D<br>
=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
=C2=A0};<br>
<br>
+void brcm_raspberry_pi_dummy_func(void) {}<br>
+<br>
=C2=A0PLATFORM_START(rpi4, &quot;Raspberry Pi 4&quot;)<br>
=C2=A0 =C2=A0 =C2=A0.compatible=C2=A0 =C2=A0 =C2=A0=3D rpi4_dt_compat,<br>
=C2=A0 =C2=A0 =C2=A0.blacklist_dev=C2=A0 =3D rpi4_blacklist_dev,<br>
diff --git a/xen/arch/arm/platforms/thunderx.c b/xen/arch/arm/platforms/thu=
nderx.c<br>
index 9b32a29..8015323 100644<br>
--- a/xen/arch/arm/platforms/thunderx.c<br>
+++ b/xen/arch/arm/platforms/thunderx.c<br>
@@ -33,6 +33,8 @@ static const struct dt_device_match thunderx_blacklist_de=
v[] __initconst =3D<br>
=C2=A0 =C2=A0 =C2=A0{ /* sentinel */ },<br>
=C2=A0};<br>
<br>
+void thunderx_dummy_func(void) {}<br>
+<br>
=C2=A0PLATFORM_START(thunderx, &quot;THUNDERX&quot;)<br>
=C2=A0 =C2=A0 =C2=A0.compatible =3D thunderx_dt_compat,<br>
=C2=A0 =C2=A0 =C2=A0.blacklist_dev =3D thunderx_blacklist_dev,<br>
diff --git a/xen/xsm/flask/gen-policy.py b/xen/xsm/flask/gen-policy.py<br>
index c7501e4..73bf7d2 100644<br>
--- a/xen/xsm/flask/gen-policy.py<br>
+++ b/xen/xsm/flask/gen-policy.py<br>
@@ -21,3 +21,7 @@ sys.stdout.write(&quot;&quot;&quot;<br>
=C2=A0};<br>
=C2=A0const unsigned int __initconst xsm_flask_init_policy_size =3D %d;<br>
=C2=A0&quot;&quot;&quot; % policy_size)<br>
+<br>
+sys.stdout.write(&quot;&quot;&quot;<br>
+void policy_dummy_func(void) {}<br>
+&quot;&quot;&quot;)<br>
-- <br>
2.7.4<br>
<br>
</blockquote></div></div></div>

--0000000000003f72ff059733f7d9--


--===============1861015380144426832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1861015380144426832==--

