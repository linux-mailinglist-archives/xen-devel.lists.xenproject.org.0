Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F80507224
	for <lists+xen-devel@lfdr.de>; Tue, 19 Apr 2022 17:50:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.308328.524027 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq7r-00089L-Qw; Tue, 19 Apr 2022 15:50:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 308328.524027; Tue, 19 Apr 2022 15:50:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ngq7r-00087G-Nw; Tue, 19 Apr 2022 15:50:47 +0000
Received: by outflank-mailman (input) for mailman id 308328;
 Tue, 19 Apr 2022 15:50:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=WtTZ=U5=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1ngq7p-0006bg-G1
 for xen-devel@lists.xenproject.org; Tue, 19 Apr 2022 15:50:45 +0000
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [2a00:1450:4864:20::42b])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 78f2b3ce-bff8-11ec-a405-831a346695d4;
 Tue, 19 Apr 2022 17:50:44 +0200 (CEST)
Received: by mail-wr1-x42b.google.com with SMTP id u3so23053642wrg.3
 for <xen-devel@lists.xenproject.org>; Tue, 19 Apr 2022 08:50:44 -0700 (PDT)
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
X-Inumbo-ID: 78f2b3ce-bff8-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nitqz4REuWupqJr2pZw4T+8sSCanTDQzjYvK7AeSxbI=;
        b=RrG7UP+t2MzMwnlZEg82c3r/2eIcp+rqamjCouRN3WC4sfCHC9q+WVv/N+cZvqY2WV
         xLQynxFeKOfJTJfdeJ4dj2fmUDMklPFOxhwS91WoxBz8yJLAruNDxACQIhcjNDztkIeY
         PpJTFQ3Z2rDL4+0mq+ZlegShL2drrn6L3GWhxgkmUrQRCjC5tWekjOwxnAKTcASR2qf2
         b0qjzpJ6D+KBdpDmcPUjPGWAobpVpV11nqFjXsXBOaC8PyxLv6ak6ks8WyHnQd1HXqVq
         MOvAS0pT8yd1njiVYxOTOV9yf0xHEzyJi8+TLR12FcD5hvlSKceU8AzXV5IwfnXoZsHo
         mdZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nitqz4REuWupqJr2pZw4T+8sSCanTDQzjYvK7AeSxbI=;
        b=i+2pHygj1QvMB+k8mdrMxte+sXcysJpN6pb5jYu7vgxNtN0zQsJ4Z1FqPg7RCHp5gj
         btbo0vXCKKysjXkioOvSYmfnyiU3s/4QVcLCqWTCREuub1+o9pazx5BLB6jJs2kOP8Zg
         jt3EFegB2dr49AjoOInQWdqAAZrAkBsxXscUhF9bB2Nb6hJ/3+8bTTLvubQuRcq0NHo8
         8trD3gh85Wi/ntg8xpNOrA304c9qb+k+Jy8iKcdMWNDBDV62apubCrc6J/BmwDUKDnO2
         7NgB26MF2RSNOSykyMeg/dTWQJk8iYGR5Iql6aI2ab6muY8d328SubYb1VRTOGc9jS5m
         nY+g==
X-Gm-Message-State: AOAM531vubJct7h36CunaF6wU7ETZV5tvo7A7CvyKLtyAITupKMKpvFu
	Go9R7Q9wvILTxPNVXjY81lHCS6BfZNXFiSZBmFQ=
X-Google-Smtp-Source: ABdhPJyKsF+nYPH0EnYSYzIln5QpflczoO9pyqS3MhtPDb8IRwiQczq5jTc6h9o7bphEzGJEPNIGEfbZ3ZChfCtHOzA=
X-Received: by 2002:adf:fb52:0:b0:206:1477:ba27 with SMTP id
 c18-20020adffb52000000b002061477ba27mr12322075wrs.230.1650383443925; Tue, 19
 Apr 2022 08:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
In-Reply-To: <20220419154126.GA1518@DESKTOP-NK4TH6S.localdomain>
From: Julien Grall <julien.grall.oss@gmail.com>
Date: Tue, 19 Apr 2022 15:50:31 +0000
Message-ID: <CAJ=z9a37_y3B4aAfiK5C-bHJYyWqCo0+g+jB6cdDCmOzLuXLJw@mail.gmail.com>
Subject: Re: [PATCH] xen/arm: silence ambiguous integer casting warning error
To: Paran Lee <p4ranlee@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
	Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Austin Kim <austindh.kim@gmail.com>, 
	xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/alternative; boundary="000000000000eb1f4f05dd03d6f3"

--000000000000eb1f4f05dd03d6f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, 19 Apr 2022, 15:41 Paran Lee, <p4ranlee@gmail.com> wrote:

> GCC with "-g -Wall -Wextra" option throws warning message as below:


Which version of the compiler? Also you specify the exact cflags, did you
tweak Xen?


> error: comparison of integer expressions of different signedness:
>  =E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=99 [-Werror=3Dsign=
-compare]
>

GCC should give you a line/file. Can you provide it?

Cheers,


> Silence the warning by correcting the integer type.
>
> Signed-off-by: Paran Lee <p4ranlee@gmail.com>
> ---
>  xen/arch/arm/gic-v3.c | 5 +++--
>  xen/arch/arm/setup.c  | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c
> index 3c472ed768..81ac25f528 100644
> --- a/xen/arch/arm/gic-v3.c
> +++ b/xen/arch/arm/gic-v3.c
> @@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)
>      isb();
>  }
>
> -static u16 gicv3_compute_target_list(int *base_cpu, const struct cpumask
> *mask,
> +static u16 gicv3_compute_target_list(unsigned int *base_cpu,
> +                                     const struct cpumask *mask,
>                                       uint64_t cluster_id)
>  {
>      int cpu =3D *base_cpu;
> @@ -953,7 +954,7 @@ out:
>
>  static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t
> *cpumask)
>  {
> -    int cpu =3D 0;
> +    unsigned int cpu =3D 0;
>      uint64_t val;
>
>      for_each_cpu(cpu, cpumask)
> diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
> index d5d0792ed4..5ab2aaecaf 100644
> --- a/xen/arch/arm/setup.c
> +++ b/xen/arch/arm/setup.c
> @@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_phys_offset,
>                        unsigned long fdt_paddr)
>  {
>      size_t fdt_size;
> -    int cpus, i;
> +    unsigned int cpus, i;
>      const char *cmdline;
>      struct bootmodule *xen_bootmodule;
>      struct domain *d;
> --
> 2.25.1
>
>

--000000000000eb1f4f05dd03d6f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, 19 Apr 2022, 15:41 Paran Lee, &lt;<a href=
=3D"mailto:p4ranlee@gmail.com">p4ranlee@gmail.com</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px=
 #ccc solid;padding-left:1ex">GCC with &quot;-g -Wall -Wextra&quot; option =
throws warning message as below:</blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">Which version of the compiler? Also you specify=
 the exact cflags, did you tweak Xen?</div><div dir=3D"auto"><br></div><div=
 dir=3D"auto"></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquot=
e class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc sol=
id;padding-left:1ex">
<br>
error: comparison of integer expressions of different signedness:<br>
=C2=A0=E2=80=98int=E2=80=99 and =E2=80=98unsigned int=E2=80=99 [-Werror=3Ds=
ign-compare]<br></blockquote></div></div><div dir=3D"auto"><br></div><div d=
ir=3D"auto">GCC should give you a line/file. Can you provide it?</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Cheers,</div><div dir=3D"auto"><br=
></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">
<br>
Silence the warning by correcting the integer type.<br>
<br>
Signed-off-by: Paran Lee &lt;<a href=3D"mailto:p4ranlee@gmail.com" target=
=3D"_blank" rel=3D"noreferrer">p4ranlee@gmail.com</a>&gt;<br>
---<br>
=C2=A0xen/arch/arm/gic-v3.c | 5 +++--<br>
=C2=A0xen/arch/arm/setup.c=C2=A0 | 2 +-<br>
=C2=A02 files changed, 4 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/xen/arch/arm/gic-v3.c b/xen/arch/arm/gic-v3.c<br>
index 3c472ed768..81ac25f528 100644<br>
--- a/xen/arch/arm/gic-v3.c<br>
+++ b/xen/arch/arm/gic-v3.c<br>
@@ -916,7 +916,8 @@ static void gicv3_hyp_disable(void)<br>
=C2=A0 =C2=A0 =C2=A0isb();<br>
=C2=A0}<br>
<br>
-static u16 gicv3_compute_target_list(int *base_cpu, const struct cpumask *=
mask,<br>
+static u16 gicv3_compute_target_list(unsigned int *base_cpu,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct cpu=
mask *mask,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint64_t cluste=
r_id)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0int cpu =3D *base_cpu;<br>
@@ -953,7 +954,7 @@ out:<br>
<br>
=C2=A0static void gicv3_send_sgi_list(enum gic_sgi sgi, const cpumask_t *cp=
umask)<br>
=C2=A0{<br>
-=C2=A0 =C2=A0 int cpu =3D 0;<br>
+=C2=A0 =C2=A0 unsigned int cpu =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0uint64_t val;<br>
<br>
=C2=A0 =C2=A0 =C2=A0for_each_cpu(cpu, cpumask)<br>
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c<br>
index d5d0792ed4..5ab2aaecaf 100644<br>
--- a/xen/arch/arm/setup.c<br>
+++ b/xen/arch/arm/setup.c<br>
@@ -862,7 +862,7 @@ void __init start_xen(unsigned long boot_phys_offset,<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0unsigned long fdt_paddr)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0size_t fdt_size;<br>
-=C2=A0 =C2=A0 int cpus, i;<br>
+=C2=A0 =C2=A0 unsigned int cpus, i;<br>
=C2=A0 =C2=A0 =C2=A0const char *cmdline;<br>
=C2=A0 =C2=A0 =C2=A0struct bootmodule *xen_bootmodule;<br>
=C2=A0 =C2=A0 =C2=A0struct domain *d;<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div></div>

--000000000000eb1f4f05dd03d6f3--

