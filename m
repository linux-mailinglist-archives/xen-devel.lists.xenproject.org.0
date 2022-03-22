Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 456984E3B9E
	for <lists+xen-devel@lfdr.de>; Tue, 22 Mar 2022 10:19:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.293340.498310 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWag0-0003Xy-KA; Tue, 22 Mar 2022 09:19:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 293340.498310; Tue, 22 Mar 2022 09:19:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nWag0-0003VD-GC; Tue, 22 Mar 2022 09:19:40 +0000
Received: by outflank-mailman (input) for mailman id 293340;
 Tue, 22 Mar 2022 09:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=aF7C=UB=gmail.com=lucmiccio@srs-se1.protection.inumbo.net>)
 id 1nWaeQ-0003Sw-Sp
 for xen-devel@lists.xenproject.org; Tue, 22 Mar 2022 09:18:03 +0000
Received: from mail-vk1-xa2b.google.com (mail-vk1-xa2b.google.com
 [2607:f8b0:4864:20::a2b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f7eb7e6a-a9c0-11ec-8fbc-03012f2f19d4;
 Tue, 22 Mar 2022 10:18:00 +0100 (CET)
Received: by mail-vk1-xa2b.google.com with SMTP id m84so9252853vke.1
 for <xen-devel@lists.xenproject.org>; Tue, 22 Mar 2022 02:18:00 -0700 (PDT)
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
X-Inumbo-ID: f7eb7e6a-a9c0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D1u/nul1H1Fae48GSBCFgWoYokj1qnuS0yysjgGZ0dA=;
        b=jYBgPABAUQFKhhqiy/Mn8Haodq3m4NkYUHaLEWitSN+YB3JNwLa3PF50ofCgA6QcfH
         oo75v/yGe4R5MytEpdKH6uoljs1uNhQ3ETrv80k/DHO+/oaCzE5mrJ9peSP0D3nSEYh8
         Ilea7Z7xKpmnBaxM+ADL+Pb9ZxNYQq0F1r+rBvoTQb+V00gbULsDThnAi6CbC8KrD/QD
         ZRRYZ2dnF5+bSCdq/Tl50frkr+UJnOwJ/GQ82tddzlRy1G+H3wdMTWaSUWOVOq3/W4qv
         G7yMO5BKT2HOKS5sfKVz9rLYdPkl1JPPehqLviPV5EZKpigT4ckJ1ynBPQgkeOKoOz+P
         5XMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D1u/nul1H1Fae48GSBCFgWoYokj1qnuS0yysjgGZ0dA=;
        b=NyQ0x4BkhtG1WCC4RN9AoOEO0ONJMLE7++t6BbEFDclFl6SeNgClbkvMfD4v9ZX0JS
         QJwfJR3HbUJ4DLiawCsfBmcZ3hDoOBs+r7tWklIYuc9/8ILgtRUff1JFLFhwg3PQaCg/
         aa8GDNTxCphME6ZcLhyp3Llso2jkbqrS19OHrSHq/S6ked9cdL2b4Pzuot1n7k/H4Qer
         kGiu727PTZTnzjWhaIVPeMjfEQnzx81uerbvEUy8RYgXC+e/axqqE15/f1gCJvV8ZE+J
         14i0EBV91aLXu8NwmsfyIWIQV8T1YY86W96zatgcoFwJZb7pPQvaBX2/razltoqlaMRe
         dkYQ==
X-Gm-Message-State: AOAM533E9d4PQcUIo0nxC1BCb0WR3qlCf5DX+iWeikGhjobs4HGuKpaW
	RT31MYAXKkHrZVYapJ2Axut45NOg1NymQ+olXT8=
X-Google-Smtp-Source: ABdhPJyG7319Pi+ie/uOcD32r85uo3DT51Ev+9cQvP6CZFNEmRnSjRCaTx78LbAwrH8xNu8URtIotHGUUXXPEyWyyYc=
X-Received: by 2002:a1f:3847:0:b0:33f:247e:3ada with SMTP id
 f68-20020a1f3847000000b0033f247e3adamr2761467vka.26.1647940679448; Tue, 22
 Mar 2022 02:17:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220304174701.1453977-1-marco.solieri@minervasys.tech>
 <20220304174701.1453977-5-marco.solieri@minervasys.tech> <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
In-Reply-To: <2f357e1a-df8e-6326-267e-4d12e82e1a5f@xen.org>
From: Luca Miccio <lucmiccio@gmail.com>
Date: Tue, 22 Mar 2022 10:17:43 +0100
Message-ID: <CANdhDbCZrtcju-=1qgAOt1v=dFFDQwZ4eqfQWj41Pvhcofz=FQ@mail.gmail.com>
Subject: Re: [PATCH 04/36] xen/arm: add parsing function for cache coloring configuration
To: Julien Grall <julien@xen.org>
Cc: Marco Solieri <marco.solieri@minervasys.tech>, xen-devel@lists.xenproject.org, 
	Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>, 
	Jan Beulich <jbeulich@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
	Marco Solieri <marco.solieri@unimore.it>, Andrea Bastoni <andrea.bastoni@minervasys.tech>, 
	Stefano Stabellini <stefano.stabellini@xilinx.com>
Content-Type: multipart/alternative; boundary="000000000000cf3ef005dacb16b8"

--000000000000cf3ef005dacb16b8
Content-Type: text/plain; charset="UTF-8"

Hi Julien,


Il giorno mer 9 mar 2022 alle ore 20:09 Julien Grall <julien@xen.org> ha
scritto:

> Hi,
>
> On 04/03/2022 17:46, Marco Solieri wrote:
> > From: Luca Miccio <lucmiccio@gmail.com>
> >
> > Add three new bootargs allowing configuration of cache coloring support
> > for Xen:
>
> I would prefer if documentation of each command line is part of the
> patch introducing them. This would help understanding some of the
> parameters.
>
>
Ok.


> > - way_size: The size of a LLC way in bytes. This value is mainly used
> >    to calculate the maximum available colors on the platform.
>
> We should only add command line option when they are a strong use case.
> In documentation, you wrote that someone may want to overwrite the way
> size for "specific needs".
>
> Can you explain what would be those needs?

> - dom0_colors: The coloring configuration for Dom0, which also acts as
> >    default configuration for any DomU without an explicit configuration.
> > - xen_colors: The coloring configuration for the Xen hypervisor itself.
> >
> > A cache coloring configuration consists of a selection of colors to be
> > assigned to a VM or to the hypervisor. It is represented by a set of
> > ranges. Add a common function that parses a string with a
> > comma-separated set of hyphen-separated ranges like "0-7,15-16" and
> > returns both: the number of chosen colors, and an array containing their
> > ids.
> > Currently we support platforms with up to 128 colors.
>
> Is there any reason this value is hardcoded in Xen rather than part of
> the Kconfig?
>
>
Not really at the time when this patch was created. But as we notify in
patch 32,
there is an assert that fails if we use a certain amount of colors. Maybe
we should
find a better way to store the color information.

Luca.

> >
> > Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> > Signed-off-by: Marco Solieri <marco.solieri@minervasys.tech>
> > Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> > ---
> >   xen/arch/arm/Kconfig                |   5 ++
> >   xen/arch/arm/Makefile               |   2 +-
> >   xen/arch/arm/coloring.c             | 131 ++++++++++++++++++++++++++++
> >   xen/arch/arm/include/asm/coloring.h |  28 ++++++
> >   4 files changed, 165 insertions(+), 1 deletion(-)
> >   create mode 100644 xen/arch/arm/coloring.c
> >   create mode 100644 xen/arch/arm/include/asm/coloring.h
> >
> > diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> > index ecfa6822e4..f0f999d172 100644
> > --- a/xen/arch/arm/Kconfig
> > +++ b/xen/arch/arm/Kconfig
> > @@ -97,6 +97,11 @@ config HARDEN_BRANCH_PREDICTOR
> >
> >         If unsure, say Y.
> >
> > +config COLORING
> > +     bool "L2 cache coloring"
> > +     default n
>
> This wants to be gated with EXPERT for time-being. SUPPORT.MD woudl
> Furthermore, I think this wants to be gated with EXPERT for the time-being.
>
> > +     depends on ARM_64
>
> Why is this limited to arm64?
>
> > +
> >   config TEE
> >       bool "Enable TEE mediators support (UNSUPPORTED)" if UNSUPPORTED
> >       default n
> > diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> > index c993ce72a3..581896a528 100644
> > --- a/xen/arch/arm/Makefile
> > +++ b/xen/arch/arm/Makefile
> > @@ -66,7 +66,7 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
> >   obj-y += vsmc.o
> >   obj-y += vpsci.o
> >   obj-y += vuart.o
> > -
> > +obj-$(CONFIG_COLORING) += coloring.o
>
> Please keep the newline before extra-y. The file are meant to be ordered
> alphabetically. So this should be inserted in the correct position.
>
> >   extra-y += xen.lds
> >
> >   #obj-bin-y += ....o
> > diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c
> > new file mode 100644
> > index 0000000000..8f1cff6efb
> > --- /dev/null
> > +++ b/xen/arch/arm/coloring.c
> > @@ -0,0 +1,131 @@
> > +/*
> > + * xen/arch/arm/coloring.c
> > + *
> > + * Coloring support for ARM
> > + *
> > + * Copyright (C) 2019 Xilinx Inc.
> > + *
> > + * Authors:
> > + *    Luca Miccio <lucmiccio@gmail.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +#include <xen/init.h>
> > +#include <xen/types.h>
> > +#include <xen/lib.h>
> > +#include <xen/errno.h>
> > +#include <xen/param.h>
> > +#include <asm/coloring.h>
>
> The includes should be ordered so <xen/...> are first, then <asm/...>.
> They are also ordered alphabetically within their own category.
>
> > +
> > +/* Number of color(s) assigned to Xen */
> > +static uint32_t xen_col_num;
> > +/* Coloring configuration of Xen as bitmask */
> > +static uint32_t xen_col_mask[MAX_COLORS_CELLS];
> Xen provides helpers to create and use bitmaps (see
> include/xen/bitmap.h). Can you use?
>
> > +
> > +/* Number of color(s) assigned to Dom0 */
> > +static uint32_t dom0_col_num;
> > +/* Coloring configuration of Dom0 as bitmask */
> > +static uint32_t dom0_col_mask[MAX_COLORS_CELLS];
> > +
> > +static uint64_t way_size;
> > +
> > +/*************************
> > + * PARSING COLORING BOOTARGS
> > + */
> > +
> > +/*
> > + * Parse the coloring configuration given in the buf string, following
> the
> > + * syntax below, and store the number of colors and a corresponding
> mask in
> > + * the last two given pointers.
> > + *
> > + * COLOR_CONFIGURATION ::= RANGE,...,RANGE
> > + * RANGE               ::= COLOR-COLOR
> > + *
> > + * Example: "2-6,15-16" represents the set of colors: 2,3,4,5,6,15,16.
> > + */
> > +static int parse_color_config(
> > +    const char *buf, uint32_t *col_mask, uint32_t *col_num)
>
>
> Coding style. We usually declarate paremeters on the same line as the
> function name. If they can't fit on the same line, then we split in two
> with the parameter aligned to the first paremeter.
>
> > +{
> > +    int start, end, i;
>
> AFAICT, none of the 3 variables will store negative values. So can they
> be unsigned?
>
> > +    const char* s = buf;
> > +    unsigned int offset;
> > +
> > +    if ( !col_mask || !col_num )
> > +        return -EINVAL;
> > +
> > +    *col_num = 0;
> > +    for ( i = 0; i < MAX_COLORS_CELLS; i++ )
> > +        col_mask[i] = 0;
> dom0_col_mask and xen_col_mask are already zeroed. I would also expect
> the same for dynamically allocated bitmask. So can this be dropped?
>
> > +
> > +    while ( *s != '\0' )
> > +    {
> > +        if ( *s != ',' )
> > +        {
> > +            start = simple_strtoul(s, &s, 0);
> > +
> > +            /* Ranges are hyphen-separated */
> > +            if ( *s != '-' )
> > +                goto fail;
> > +            s++;
> > +
> > +            end = simple_strtoul(s, &s, 0);
> > +
> > +            for ( i = start; i <= end; i++ )
> > +            {
> > +                offset = i / 32;
> > +                if ( offset > MAX_COLORS_CELLS )
> > +                    goto fail;
> > +
> > +                if ( !(col_mask[offset] & (1 << i % 32)) )
> > +                    *col_num += 1;
> > +                col_mask[offset] |= (1 << i % 32);
> > +            }
> > +        }
> > +        else
> > +            s++;
> > +    }
> > +
> > +    return *s ? -EINVAL : 0;
> > +fail:
> > +    return -EINVAL;
> > +}
> > +
> > +static int __init parse_way_size(const char *s)
> > +{
> > +    way_size = simple_strtoull(s, &s, 0);
> > +
> > +    return *s ? -EINVAL : 0;
> > +}
> > +custom_param("way_size", parse_way_size);
> > +
> > +static int __init parse_dom0_colors(const char *s)
> > +{
> > +    return parse_color_config(s, dom0_col_mask, &dom0_col_num);
> > +}
> > +custom_param("dom0_colors", parse_dom0_colors);
> > +
> > +static int __init parse_xen_colors(const char *s)
> > +{
> > +    return parse_color_config(s, xen_col_mask, &xen_col_num);
> > +}
> > +custom_param("xen_colors", parse_xen_colors);
> > +
> > +/*
> > + * Local variables:
> > + * mode: C
> > + * c-file-style: "BSD"
> > + * c-basic-offset: 4
> > + * tab-width: 4
> > + * indent-tabs-mode: nil
> > + * End:
> > + */
> > diff --git a/xen/arch/arm/include/asm/coloring.h
> b/xen/arch/arm/include/asm/coloring.h
> > new file mode 100644
> > index 0000000000..60958d1244
> > --- /dev/null
> > +++ b/xen/arch/arm/include/asm/coloring.h
> > @@ -0,0 +1,28 @@
> > +/*
> > + * xen/arm/include/asm/coloring.h
> > + *
> > + * Coloring support for ARM
> > + *
> > + * Copyright (C) 2019 Xilinx Inc.
> > + *
> > + * Authors:
> > + *    Luca Miccio <lucmiccio@gmail.com>
> > + *
> > + * This program is free software; you can redistribute it and/or modify
> > + * it under the terms of the GNU General Public License version 2 as
> > + * published by the Free Software Foundation.
> > + *
> > + * This program is distributed in the hope that it will be useful,
> > + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> > + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> > + * GNU General Public License for more details.
> > + *
> > + * You should have received a copy of the GNU General Public License
> > + * along with this program.  If not, see <http://www.gnu.org/licenses/
> >.
> > + */
> > +#ifndef __ASM_ARM_COLORING_H__
> > +#define __ASM_ARM_COLORING_H__
> > +
> > +#define MAX_COLORS_CELLS 4
> > +
> > +#endif /* !__ASM_ARM_COLORING_H__ */
>
> Cheers,
>
> --
> Julien Grall
>

--000000000000cf3ef005dacb16b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi=C2=A0Julien,<div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno m=
er 9 mar 2022 alle ore 20:09 Julien Grall &lt;<a href=3D"mailto:julien@xen.=
org">julien@xen.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">Hi,<br>
<br>
On 04/03/2022 17:46, Marco Solieri wrote:<br>
&gt; From: Luca Miccio &lt;<a href=3D"mailto:lucmiccio@gmail.com" target=3D=
"_blank">lucmiccio@gmail.com</a>&gt;<br>
&gt; <br>
&gt; Add three new bootargs allowing configuration of cache coloring suppor=
t<br>
&gt; for Xen:<br>
<br>
I would prefer if documentation of each command line is part of the <br>
patch introducing them. This would help understanding some of the <br>
parameters.<br>
<br></blockquote><div><br>Ok.</div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
&gt; - way_size: The size of a LLC way in bytes. This value is mainly used<=
br>
&gt;=C2=A0 =C2=A0 to calculate the maximum available colors on the platform=
.<br>
<br>
We should only add command line option when they are a strong use case. <br=
>
In documentation, you wrote that someone may want to overwrite the way <br>
size for &quot;specific needs&quot;.<br>
<br>
Can you explain what would be those needs?</blockquote><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
&gt; - dom0_colors: The coloring configuration for Dom0, which also acts as=
<br>
&gt;=C2=A0 =C2=A0 default configuration for any DomU without an explicit co=
nfiguration.<br>
&gt; - xen_colors: The coloring configuration for the Xen hypervisor itself=
.<br>
&gt; <br>
&gt; A cache coloring configuration consists of a selection of colors to be=
<br>
&gt; assigned to a VM or to the hypervisor. It is represented by a set of<b=
r>
&gt; ranges. Add a common function that parses a string with a<br>
&gt; comma-separated set of hyphen-separated ranges like &quot;0-7,15-16&qu=
ot; and<br>
&gt; returns both: the number of chosen colors, and an array containing the=
ir<br>
&gt; ids.<br>
&gt; Currently we support platforms with up to 128 colors.<br>
<br>
Is there any reason this value is hardcoded in Xen rather than part of <br>
the Kconfig?<br>
<br></blockquote><div><br>Not really at the time when this patch was create=
d. But as we notify in patch 32,</div><div>there is an assert that fails if=
 we use a certain amount of colors. Maybe we should</div><div>find a better=
 way to store the color information.</div><div>=C2=A0<br>Luca.</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
&gt; <br>
&gt; Signed-off-by: Luca Miccio &lt;<a href=3D"mailto:lucmiccio@gmail.com" =
target=3D"_blank">lucmiccio@gmail.com</a>&gt;<br>
&gt; Signed-off-by: Marco Solieri &lt;marco.solieri@minervasys.tech&gt;<br>
&gt; Signed-off-by: Stefano Stabellini &lt;<a href=3D"mailto:stefano.stabel=
lini@xilinx.com" target=3D"_blank">stefano.stabellini@xilinx.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/Kconfig=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A05 ++<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/Makefile=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/coloring.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 131 ++++++++++++++++++++++++++++<br>
&gt;=C2=A0 =C2=A0xen/arch/arm/include/asm/coloring.h |=C2=A0 28 ++++++<br>
&gt;=C2=A0 =C2=A04 files changed, 165 insertions(+), 1 deletion(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 xen/arch/arm/coloring.c<br>
&gt;=C2=A0 =C2=A0create mode 100644 xen/arch/arm/include/asm/coloring.h<br>
&gt; <br>
&gt; diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig<br>
&gt; index ecfa6822e4..f0f999d172 100644<br>
&gt; --- a/xen/arch/arm/Kconfig<br>
&gt; +++ b/xen/arch/arm/Kconfig<br>
&gt; @@ -97,6 +97,11 @@ config HARDEN_BRANCH_PREDICTOR<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If unsure, say Y.<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +config COLORING<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;L2 cache coloring&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default n<br>
<br>
This wants to be gated with EXPERT for time-being. SUPPORT.MD woudl<br>
Furthermore, I think this wants to be gated with EXPERT for the time-being.=
<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on ARM_64<br>
<br>
Why is this limited to arm64?<br>
<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0config TEE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;Enable TEE mediators support (UNS=
UPPORTED)&quot; if UNSUPPORTED<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0default n<br>
&gt; diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile<br>
&gt; index c993ce72a3..581896a528 100644<br>
&gt; --- a/xen/arch/arm/Makefile<br>
&gt; +++ b/xen/arch/arm/Makefile<br>
&gt; @@ -66,7 +66,7 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) +=3D vpl011.o<br>
&gt;=C2=A0 =C2=A0obj-y +=3D vsmc.o<br>
&gt;=C2=A0 =C2=A0obj-y +=3D vpsci.o<br>
&gt;=C2=A0 =C2=A0obj-y +=3D vuart.o<br>
&gt; -<br>
&gt; +obj-$(CONFIG_COLORING) +=3D coloring.o<br>
<br>
Please keep the newline before extra-y. The file are meant to be ordered <b=
r>
alphabetically. So this should be inserted in the correct position.<br>
<br>
&gt;=C2=A0 =C2=A0extra-y +=3D xen.lds<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#obj-bin-y +=3D ....o<br>
&gt; diff --git a/xen/arch/arm/coloring.c b/xen/arch/arm/coloring.c<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..8f1cff6efb<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/arm/coloring.c<br>
&gt; @@ -0,0 +1,131 @@<br>
&gt; +/*<br>
&gt; + * xen/arch/arm/coloring.c<br>
&gt; + *<br>
&gt; + * Coloring support for ARM<br>
&gt; + *<br>
&gt; + * Copyright (C) 2019 Xilinx Inc.<br>
&gt; + *<br>
&gt; + * Authors:<br>
&gt; + *=C2=A0 =C2=A0 Luca Miccio &lt;<a href=3D"mailto:lucmiccio@gmail.com=
" target=3D"_blank">lucmiccio@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +#include &lt;xen/init.h&gt;<br>
&gt; +#include &lt;xen/types.h&gt;<br>
&gt; +#include &lt;xen/lib.h&gt;<br>
&gt; +#include &lt;xen/errno.h&gt;<br>
&gt; +#include &lt;xen/param.h&gt;<br>
&gt; +#include &lt;asm/coloring.h&gt;<br>
<br>
The includes should be ordered so &lt;xen/...&gt; are first, then &lt;asm/.=
..&gt;.<br>
They are also ordered alphabetically within their own category.<br>
<br>
&gt; +<br>
&gt; +/* Number of color(s) assigned to Xen */<br>
&gt; +static uint32_t xen_col_num;<br>
&gt; +/* Coloring configuration of Xen as bitmask */<br>
&gt; +static uint32_t xen_col_mask[MAX_COLORS_CELLS];<br>
Xen provides helpers to create and use bitmaps (see <br>
include/xen/bitmap.h). Can you use?<br>
<br>
&gt; +<br>
&gt; +/* Number of color(s) assigned to Dom0 */<br>
&gt; +static uint32_t dom0_col_num;<br>
&gt; +/* Coloring configuration of Dom0 as bitmask */<br>
&gt; +static uint32_t dom0_col_mask[MAX_COLORS_CELLS];<br>
&gt; +<br>
&gt; +static uint64_t way_size;<br>
&gt; +<br>
&gt; +/*************************<br>
&gt; + * PARSING COLORING BOOTARGS<br>
&gt; + */<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Parse the coloring configuration given in the buf string, followin=
g the<br>
&gt; + * syntax below, and store the number of colors and a corresponding m=
ask in<br>
&gt; + * the last two given pointers.<br>
&gt; + *<br>
&gt; + * COLOR_CONFIGURATION ::=3D RANGE,...,RANGE<br>
&gt; + * RANGE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0::=3D =
COLOR-COLOR<br>
&gt; + *<br>
&gt; + * Example: &quot;2-6,15-16&quot; represents the set of colors: 2,3,4=
,5,6,15,16.<br>
&gt; + */<br>
&gt; +static int parse_color_config(<br>
&gt; +=C2=A0 =C2=A0 const char *buf, uint32_t *col_mask, uint32_t *col_num)=
<br>
<br>
<br>
Coding style. We usually declarate paremeters on the same line as the <br>
function name. If they can&#39;t fit on the same line, then we split in two=
 <br>
with the parameter aligned to the first paremeter.<br>
<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 int start, end, i;<br>
<br>
AFAICT, none of the 3 variables will store negative values. So can they <br=
>
be unsigned?<br>
<br>
&gt; +=C2=A0 =C2=A0 const char* s =3D buf;<br>
&gt; +=C2=A0 =C2=A0 unsigned int offset;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 if ( !col_mask || !col_num )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 *col_num =3D 0;<br>
&gt; +=C2=A0 =C2=A0 for ( i =3D 0; i &lt; MAX_COLORS_CELLS; i++ )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 col_mask[i] =3D 0;<br>
dom0_col_mask and xen_col_mask are already zeroed. I would also expect <br>
the same for dynamically allocated bitmask. So can this be dropped?<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 while ( *s !=3D &#39;\0&#39; )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( *s !=3D &#39;,&#39; )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start =3D simple_strtoul(s,=
 &amp;s, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Ranges are hyphen-separa=
ted */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( *s !=3D &#39;-&#39; )<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s++;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 end =3D simple_strtoul(s, &=
amp;s, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for ( i =3D start; i &lt;=
=3D end; i++ )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D i =
/ 32;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( offset &=
gt; MAX_COLORS_CELLS )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 goto fail;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ( !(col_ma=
sk[offset] &amp; (1 &lt;&lt; i % 32)) )<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 *col_num +=3D 1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 col_mask[offs=
et] |=3D (1 &lt;&lt; i % 32);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 else<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s++;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return *s ? -EINVAL : 0;<br>
&gt; +fail:<br>
&gt; +=C2=A0 =C2=A0 return -EINVAL;<br>
&gt; +}<br>
&gt; +<br>
&gt; +static int __init parse_way_size(const char *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 way_size =3D simple_strtoull(s, &amp;s, 0);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 return *s ? -EINVAL : 0;<br>
&gt; +}<br>
&gt; +custom_param(&quot;way_size&quot;, parse_way_size);<br>
&gt; +<br>
&gt; +static int __init parse_dom0_colors(const char *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return parse_color_config(s, dom0_col_mask, &amp;dom0_c=
ol_num);<br>
&gt; +}<br>
&gt; +custom_param(&quot;dom0_colors&quot;, parse_dom0_colors);<br>
&gt; +<br>
&gt; +static int __init parse_xen_colors(const char *s)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 return parse_color_config(s, xen_col_mask, &amp;xen_col=
_num);<br>
&gt; +}<br>
&gt; +custom_param(&quot;xen_colors&quot;, parse_xen_colors);<br>
&gt; +<br>
&gt; +/*<br>
&gt; + * Local variables:<br>
&gt; + * mode: C<br>
&gt; + * c-file-style: &quot;BSD&quot;<br>
&gt; + * c-basic-offset: 4<br>
&gt; + * tab-width: 4<br>
&gt; + * indent-tabs-mode: nil<br>
&gt; + * End:<br>
&gt; + */<br>
&gt; diff --git a/xen/arch/arm/include/asm/coloring.h b/xen/arch/arm/includ=
e/asm/coloring.h<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..60958d1244<br>
&gt; --- /dev/null<br>
&gt; +++ b/xen/arch/arm/include/asm/coloring.h<br>
&gt; @@ -0,0 +1,28 @@<br>
&gt; +/*<br>
&gt; + * xen/arm/include/asm/coloring.h<br>
&gt; + *<br>
&gt; + * Coloring support for ARM<br>
&gt; + *<br>
&gt; + * Copyright (C) 2019 Xilinx Inc.<br>
&gt; + *<br>
&gt; + * Authors:<br>
&gt; + *=C2=A0 =C2=A0 Luca Miccio &lt;<a href=3D"mailto:lucmiccio@gmail.com=
" target=3D"_blank">lucmiccio@gmail.com</a>&gt;<br>
&gt; + *<br>
&gt; + * This program is free software; you can redistribute it and/or modi=
fy<br>
&gt; + * it under the terms of the GNU General Public License version 2 as<=
br>
&gt; + * published by the Free Software Foundation.<br>
&gt; + *<br>
&gt; + * This program is distributed in the hope that it will be useful,<br=
>
&gt; + * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
&gt; + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the=
<br>
&gt; + * GNU General Public License for more details.<br>
&gt; + *<br>
&gt; + * You should have received a copy of the GNU General Public License<=
br>
&gt; + * along with this program.=C2=A0 If not, see &lt;<a href=3D"http://w=
ww.gnu.org/licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.o=
rg/licenses/</a>&gt;.<br>
&gt; + */<br>
&gt; +#ifndef __ASM_ARM_COLORING_H__<br>
&gt; +#define __ASM_ARM_COLORING_H__<br>
&gt; +<br>
&gt; +#define MAX_COLORS_CELLS 4<br>
&gt; +<br>
&gt; +#endif /* !__ASM_ARM_COLORING_H__ */<br>
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
</blockquote></div></div>

--000000000000cf3ef005dacb16b8--

