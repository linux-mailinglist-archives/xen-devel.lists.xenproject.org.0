Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6DDDF129
	for <lists+xen-devel@lfdr.de>; Mon, 21 Oct 2019 17:20:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iMZSO-0004Kw-W9; Mon, 21 Oct 2019 15:18:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3IRp=YO=gmail.com=liq3ea@srs-us1.protection.inumbo.net>)
 id 1iMZSN-0004Kq-Hb
 for xen-devel@lists.xenproject.org; Mon, 21 Oct 2019 15:18:51 +0000
X-Inumbo-ID: 11e00dce-f416-11e9-beca-bc764e2007e4
Received: from mail-ot1-x32a.google.com (unknown [2607:f8b0:4864:20::32a])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 11e00dce-f416-11e9-beca-bc764e2007e4;
 Mon, 21 Oct 2019 15:18:43 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id k32so11328806otc.4
 for <xen-devel@lists.xenproject.org>; Mon, 21 Oct 2019 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1x+45LAF6NhcUXFiwpg+YITg80URlofEztTg/h35ZHc=;
 b=lrUyCiY8ecQeKOvK9Z146wY7CcEJ9lSG/SldiZ0WmXluUpt5mDKc6vK0wr5sdkV7yO
 8Si3MHx1EeDrfzz2TzKnimCvYGHyA1Dc1oay18E3klwoAwLUFBft1yti3frdAQIEVc3w
 CAE0L2THJug1ANkVssSsL3XNyTxbwPScDx6vsabHFC6OGuwQZ6ik8jt/VdGQwLFtVXrS
 ZFKZniDk4yZxcMIZIvUU5oqIQCxCWca+tSDjEGpap0PWcknwBRScRAtX9QlvF6fMthc6
 5z0SPl9xfM18lCGZKElPZMyJm/ElAihyal7+83Ht0+HKkOBd/254M/rHSUtAz73XPYFb
 8nLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1x+45LAF6NhcUXFiwpg+YITg80URlofEztTg/h35ZHc=;
 b=oiNrJ8d4mpcSrawmx8m8S36C0kuYWDxJ8B9G9FhS2Mf65FIjDu8JXjXt1kcJjkjkHK
 As8N+o9dsBY7t94fhG6/J6vKX28b3dE9HikiEG8DlZfUDWmn0DsgLfr+bNyZULJ/ZhwY
 MkR24zfLy8cwXyJ0vv8E+cys1nkaON8gb5Vlb8ANXSirOqlGFuKp7bgJ0Hfxx+Q8ck7g
 g3HG+0Pr1J7+FJuGpehNSups/Qls22l7XNAv1dOx8kW0SJL6YYlP9o/itmiqrV/nFMmH
 wC9yOEkrJFBRdGyAGHthoMXTrChbdh0JQ5aZjwJo7SwlM7Jd0ekLvcP76u+BpcBUscJ3
 sebw==
X-Gm-Message-State: APjAAAU5mncvtJpwrtHq1lkSkRsKUR377XOmgmktp4kZsw6jDw5eMik/
 OBep7xBQp9CUKelGzTTINb1sQ3p6PAqnENYCPTg=
X-Google-Smtp-Source: APXvYqwY9QIGPCqd7c3usrHMnLqv7GrRFyhQY/vu5ERB5/kp5RYmHsUFmSkXq55rwt4hX/xJoPrI8QVcLsGWSyYrHEc=
X-Received: by 2002:a9d:6d11:: with SMTP id o17mr18527222otp.333.1571671123476; 
 Mon, 21 Oct 2019 08:18:43 -0700 (PDT)
MIME-Version: 1.0
References: <20191018134754.16362-1-philmd@redhat.com>
 <20191018134754.16362-5-philmd@redhat.com>
In-Reply-To: <20191018134754.16362-5-philmd@redhat.com>
From: Li Qiang <liq3ea@gmail.com>
Date: Mon, 21 Oct 2019 23:18:06 +0800
Message-ID: <CAKXe6S+4eugvZb557znfNxWO1r6QeChQc5QmF55sfTLJ0y8aNA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Subject: Re: [Xen-devel] [PATCH v2 04/20] Revert "irq: introduce
 qemu_irq_proxy()"
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: multipart/mixed; boundary="===============0501220464764316836=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0501220464764316836==
Content-Type: multipart/alternative; boundary="00000000000004c6d305956d3362"

--00000000000004c6d305956d3362
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> =E4=BA=8E2019=E5=B9=B410=E6=
=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:50=E5=86=99=E9=81=
=93=EF=BC=9A

> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> This function isn't used anymore.
>
> This reverts commit 22ec3283efba9ba0792790da786d6776d83f2a92.
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>

Reviewed-by: Li Qiang <liq3ea@gmail.com>


> ---
>  hw/core/irq.c    | 14 --------------
>  include/hw/irq.h |  5 -----
>  2 files changed, 19 deletions(-)
>
> diff --git a/hw/core/irq.c b/hw/core/irq.c
> index 7cc0295d0e..fb3045b912 100644
> --- a/hw/core/irq.c
> +++ b/hw/core/irq.c
> @@ -120,20 +120,6 @@ qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2=
)
>      return qemu_allocate_irq(qemu_splitirq, s, 0);
>  }
>
> -static void proxy_irq_handler(void *opaque, int n, int level)
> -{
> -    qemu_irq **target =3D opaque;
> -
> -    if (*target) {
> -        qemu_set_irq((*target)[n], level);
> -    }
> -}
> -
> -qemu_irq *qemu_irq_proxy(qemu_irq **target, int n)
> -{
> -    return qemu_allocate_irqs(proxy_irq_handler, target, n);
> -}
> -
>  void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler,
> int n)
>  {
>      int i;
> diff --git a/include/hw/irq.h b/include/hw/irq.h
> index fe527f6f51..24ba0ece11 100644
> --- a/include/hw/irq.h
> +++ b/include/hw/irq.h
> @@ -51,11 +51,6 @@ qemu_irq qemu_irq_invert(qemu_irq irq);
>   */
>  qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);
>
> -/* Returns a new IRQ set which connects 1:1 to another IRQ set, which
> - * may be set later.
> - */
> -qemu_irq *qemu_irq_proxy(qemu_irq **target, int n);
> -
>  /* For internal use in qtest.  Similar to qemu_irq_split, but operating
>     on an existing vector of qemu_irq.  */
>  void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handler,
> int n);
> --
> 2.21.0
>
>
>

--00000000000004c6d305956d3362
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Philippe Mathieu-Daud=C3=A9 &lt;<a hr=
ef=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =E4=BA=8E2019=E5=
=B9=B410=E6=9C=8818=E6=97=A5=E5=91=A8=E4=BA=94 =E4=B8=8B=E5=8D=889:50=E5=86=
=99=E9=81=93=EF=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">From: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.o=
rg" target=3D"_blank">f4bug@amsat.org</a>&gt;<br>
<br>
This function isn&#39;t used anymore.<br>
<br>
This reverts commit 22ec3283efba9ba0792790da786d6776d83f2a92.<br>
<br>
Reviewed-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=3D"=
_blank">thuth@redhat.com</a>&gt;<br>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsa=
t.org" target=3D"_blank">f4bug@amsat.org</a>&gt;<br></blockquote><div><br><=
/div><div>Reviewed-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com">liq=
3ea@gmail.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
---<br>
=C2=A0hw/core/irq.c=C2=A0 =C2=A0 | 14 --------------<br>
=C2=A0include/hw/irq.h |=C2=A0 5 -----<br>
=C2=A02 files changed, 19 deletions(-)<br>
<br>
diff --git a/hw/core/irq.c b/hw/core/irq.c<br>
index 7cc0295d0e..fb3045b912 100644<br>
--- a/hw/core/irq.c<br>
+++ b/hw/core/irq.c<br>
@@ -120,20 +120,6 @@ qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2)<=
br>
=C2=A0 =C2=A0 =C2=A0return qemu_allocate_irq(qemu_splitirq, s, 0);<br>
=C2=A0}<br>
<br>
-static void proxy_irq_handler(void *opaque, int n, int level)<br>
-{<br>
-=C2=A0 =C2=A0 qemu_irq **target =3D opaque;<br>
-<br>
-=C2=A0 =C2=A0 if (*target) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_set_irq((*target)[n], level);<br>
-=C2=A0 =C2=A0 }<br>
-}<br>
-<br>
-qemu_irq *qemu_irq_proxy(qemu_irq **target, int n)<br>
-{<br>
-=C2=A0 =C2=A0 return qemu_allocate_irqs(proxy_irq_handler, target, n);<br>
-}<br>
-<br>
=C2=A0void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handle=
r, int n)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int i;<br>
diff --git a/include/hw/irq.h b/include/hw/irq.h<br>
index fe527f6f51..24ba0ece11 100644<br>
--- a/include/hw/irq.h<br>
+++ b/include/hw/irq.h<br>
@@ -51,11 +51,6 @@ qemu_irq qemu_irq_invert(qemu_irq irq);<br>
=C2=A0 */<br>
=C2=A0qemu_irq qemu_irq_split(qemu_irq irq1, qemu_irq irq2);<br>
<br>
-/* Returns a new IRQ set which connects 1:1 to another IRQ set, which<br>
- * may be set later.<br>
- */<br>
-qemu_irq *qemu_irq_proxy(qemu_irq **target, int n);<br>
-<br>
=C2=A0/* For internal use in qtest.=C2=A0 Similar to qemu_irq_split, but op=
erating<br>
=C2=A0 =C2=A0 on an existing vector of qemu_irq.=C2=A0 */<br>
=C2=A0void qemu_irq_intercept_in(qemu_irq *gpio_in, qemu_irq_handler handle=
r, int n);<br>
-- <br>
2.21.0<br>
<br>
<br>
</blockquote></div></div>

--00000000000004c6d305956d3362--


--===============0501220464764316836==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0501220464764316836==--

