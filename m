Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3892D86FC
	for <lists+xen-devel@lfdr.de>; Sat, 12 Dec 2020 14:54:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.51171.90083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko5Kv-0001nU-J5; Sat, 12 Dec 2020 13:53:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 51171.90083; Sat, 12 Dec 2020 13:53:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ko5Kv-0001n5-Fd; Sat, 12 Dec 2020 13:53:25 +0000
Received: by outflank-mailman (input) for mailman id 51171;
 Sat, 12 Dec 2020 13:53:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BfRh=FQ=gmail.com=marcandre.lureau@srs-us1.protection.inumbo.net>)
 id 1ko5Ku-0001n0-Cz
 for xen-devel@lists.xenproject.org; Sat, 12 Dec 2020 13:53:24 +0000
Received: from mail-ed1-x544.google.com (unknown [2a00:1450:4864:20::544])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ab2a89e8-f81f-455e-98ba-0e7b79a8f4c6;
 Sat, 12 Dec 2020 13:53:23 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id v22so12359642edt.9
 for <xen-devel@lists.xenproject.org>; Sat, 12 Dec 2020 05:53:23 -0800 (PST)
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
X-Inumbo-ID: ab2a89e8-f81f-455e-98ba-0e7b79a8f4c6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aqJp4gKfamwnwqe8EMieEJaV+n0fzH9AmnYkNTme3fQ=;
        b=TC+B4GNRTpn/r+SvL+bvNGYRqF3e8Vj1nDNqdPPO4ItwyM9NESVl6FUy+NYJbvv6op
         hOB08xCYyw0iQP0A8lF2jmnF9pqVq+GqWhzpAJoYg9ISZu1z9cxQCw5zD7hSBPmXvfpi
         tEg3reKaZg4RwHzdNRXuZebgzfDbWmpxhQxXqFPRsjd8yi4+drOgBBry/98/eAWGaKJw
         8zmHMVfoiMIEURI/0g8m9ib9djl4YfB93MOBvy2NN9o0d9TWELP0HbyX4GyUhh3vDcDA
         J+Z6Wdh8eynJ5jj4PW8EXBfNdMTqNoD/wg1EpmTfGv5zaEgohAt8iGwbx8oG8sfGZe/6
         WI+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aqJp4gKfamwnwqe8EMieEJaV+n0fzH9AmnYkNTme3fQ=;
        b=G+f6u2FknhmX9T0UZ/bQno7Kq5M8pXvJGYDWaklgf4F8ShVvg+f4zW20F1QBlbV6OU
         5gpADZ7CE0qy1bhq4gVf/57ogslpDOxiAorDXo1+iKklAKnDQO9/GloGW7yzXf5Zuf1n
         yhqXQrcbKSzxIr5nB34HlbOFEI2+n0392B7QicCFlDDjXtRmfpPQdVpQfBTg36X8bGi5
         wc0QfxYw5ti7kwyW+AsfDpaJWF3RanmetXeiHK12JxGkcizsC2lVupmQRJp9xcsXHlJw
         KXiCmMX8DZ9oKszjv5Gu3pEtAY9fYh/mFbSon4wLsAsQV0P3DIB0tAIXFAExAg+yqVuH
         O9pA==
X-Gm-Message-State: AOAM530g+7HArpiOfVjE3GnaYnAbVE0ZWN4Olt+su6Alx2pxafEoYpEo
	z6Sx0+2APygqCoOIv8dEdXM6FTFxIWbxe1nCwPc=
X-Google-Smtp-Source: ABdhPJwRYgIUgihzry5rDxdOpf6xvg2ddglMC+Ji3KvWM3mWc1/FcIcg0uP8pe4SFDAao5orqB2pkFnuroGhvbtV1rg=
X-Received: by 2002:a05:6402:1155:: with SMTP id g21mr17219102edw.53.1607781202707;
 Sat, 12 Dec 2020 05:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20201210134752.780923-1-marcandre.lureau@redhat.com> <20201210134752.780923-12-marcandre.lureau@redhat.com>
In-Reply-To: <20201210134752.780923-12-marcandre.lureau@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Sat, 12 Dec 2020 17:53:10 +0400
Message-ID: <CAJ+F1CL=m4bLdCaKHYuVNTzBdGZnK-_q5pGNoV8N37-H51u+Dw@mail.gmail.com>
Subject: Re: [PATCH v3 11/13] compiler: remove GNUC check
To: QEMU <qemu-devel@nongnu.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>, 
	Paul Durrant <paul@xen.org>, Richard Henderson <richard.henderson@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
	"open list:ARM" <qemu-arm@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000076cb0505b644bb52"

--00000000000076cb0505b644bb52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 10, 2020 at 6:14 PM <marcandre.lureau@redhat.com> wrote:

> From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> QEMU requires Clang or GCC, that define and support __GNUC__ extensions.
>
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> ---
>  include/qemu/compiler.h | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
> index 6212295e52..5e6cf2c8e8 100644
> --- a/include/qemu/compiler.h
> +++ b/include/qemu/compiler.h
> @@ -64,14 +64,10 @@
>      (offsetof(container, field) + sizeof_field(container, field))
>
>  /* Convert from a base type to a parent type, with compile time
> checking.  */
> -#ifdef __GNUC__
>  #define DO_UPCAST(type, field, dev) ( __extension__ ( { \
>      char __attribute__((unused)) offset_must_be_zero[ \
>          -offsetof(type, field)]; \
>      container_of(dev, type, field);}))
> -#else
> -#define DO_UPCAST(type, field, dev) container_of(dev, type, field)
> -#endif
>
>  #define typeof_field(type, field) typeof(((type *)0)->field)
>  #define type_check(t1,t2) ((t1*)0 - (t2*)0)
> @@ -102,7 +98,7 @@
>  #if defined(__clang__)
>  /* clang doesn't support gnu_printf, so use printf. */
>  # define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))
> -#elif defined(__GNUC__)
> +#else
>  /* Use gnu_printf (qemu uses standard format strings). */
>  # define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))
>  # if defined(_WIN32)
> @@ -112,8 +108,6 @@
>   */
>  #  define __printf__ __gnu_printf__
>  # endif
> -#else
> -#define GCC_FMT_ATTR(n, m)
>  #endif
>
>  #ifndef __has_warning
> --
> 2.29.0
>
>
>
Peter, Paolo, anyone to give a review?
thanks


--=20
Marc-Andr=C3=A9 Lureau

--00000000000076cb0505b644bb52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Dec 10, 2020 at 6:14 PM &lt;<=
a href=3D"mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fr=
om: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.co=
m" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
QEMU requires Clang or GCC, that define and support __GNUC__ extensions.<br=
>
<br>
Signed-off-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lurea=
u@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/qemu/compiler.h | 8 +-------<br>
=C2=A01 file changed, 1 insertion(+), 7 deletions(-)<br>
<br>
diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h<br>
index 6212295e52..5e6cf2c8e8 100644<br>
--- a/include/qemu/compiler.h<br>
+++ b/include/qemu/compiler.h<br>
@@ -64,14 +64,10 @@<br>
=C2=A0 =C2=A0 =C2=A0(offsetof(container, field) + sizeof_field(container, f=
ield))<br>
<br>
=C2=A0/* Convert from a base type to a parent type, with compile time check=
ing.=C2=A0 */<br>
-#ifdef __GNUC__<br>
=C2=A0#define DO_UPCAST(type, field, dev) ( __extension__ ( { \<br>
=C2=A0 =C2=A0 =C2=A0char __attribute__((unused)) offset_must_be_zero[ \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-offsetof(type, field)]; \<br>
=C2=A0 =C2=A0 =C2=A0container_of(dev, type, field);}))<br>
-#else<br>
-#define DO_UPCAST(type, field, dev) container_of(dev, type, field)<br>
-#endif<br>
<br>
=C2=A0#define typeof_field(type, field) typeof(((type *)0)-&gt;field)<br>
=C2=A0#define type_check(t1,t2) ((t1*)0 - (t2*)0)<br>
@@ -102,7 +98,7 @@<br>
=C2=A0#if defined(__clang__)<br>
=C2=A0/* clang doesn&#39;t support gnu_printf, so use printf. */<br>
=C2=A0# define GCC_FMT_ATTR(n, m) __attribute__((format(printf, n, m)))<br>
-#elif defined(__GNUC__)<br>
+#else<br>
=C2=A0/* Use gnu_printf (qemu uses standard format strings). */<br>
=C2=A0# define GCC_FMT_ATTR(n, m) __attribute__((format(gnu_printf, n, m)))=
<br>
=C2=A0# if defined(_WIN32)<br>
@@ -112,8 +108,6 @@<br>
=C2=A0 */<br>
=C2=A0#=C2=A0 define __printf__ __gnu_printf__<br>
=C2=A0# endif<br>
-#else<br>
-#define GCC_FMT_ATTR(n, m)<br>
=C2=A0#endif<br>
<br>
=C2=A0#ifndef __has_warning<br>
-- <br>
2.29.0<br>
<br>
<br></blockquote><div><br></div><div>Peter, Paolo, anyone to give a review?=
</div><div>thanks<br></div></div><br clear=3D"all"><br>-- <br><div dir=3D"l=
tr" class=3D"gmail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000076cb0505b644bb52--

