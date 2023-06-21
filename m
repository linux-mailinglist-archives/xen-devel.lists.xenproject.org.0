Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BF5737ED1
	for <lists+xen-devel@lfdr.de>; Wed, 21 Jun 2023 11:19:45 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.552572.862720 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtyw-000835-Et; Wed, 21 Jun 2023 09:18:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 552572.862720; Wed, 21 Jun 2023 09:18:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBtyw-00080t-CA; Wed, 21 Jun 2023 09:18:30 +0000
Received: by outflank-mailman (input) for mailman id 552572;
 Wed, 21 Jun 2023 09:18:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ii2n=CJ=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qBtyu-00080n-TS
 for xen-devel@lists.xenproject.org; Wed, 21 Jun 2023 09:18:28 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 935933ec-1014-11ee-8611-37d641c3527e;
 Wed, 21 Jun 2023 11:18:25 +0200 (CEST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com
 [209.85.217.48])
 by support.bugseng.com (Postfix) with ESMTPSA id 2AE984EE073D
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 11:18:25 +0200 (CEST)
Received: by mail-vs1-f48.google.com with SMTP id
 ada2fe7eead31-440afc96271so1275261137.3
 for <xen-devel@lists.xenproject.org>; Wed, 21 Jun 2023 02:18:25 -0700 (PDT)
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
X-Inumbo-ID: 935933ec-1014-11ee-8611-37d641c3527e
X-Gm-Message-State: AC+VfDxIgCfSbkVwI7Y7A1h3vvq3e2h2WPLr8duL0bYr7ac2n+3Zy3LK
	lRPyyGVEMoyBXjtleis0U9K3MLQrvFXG/JA5BPM=
X-Google-Smtp-Source: ACHHUZ46eYBl4TMMf6pnGAEqJs5h1qN7IWV0yIXvAwrd1utSh/5XkKxc3o1U0yuEMTtWMourHfOHJv576tXGglwEjWI=
X-Received: by 2002:a67:f348:0:b0:440:b0ed:649 with SMTP id
 p8-20020a67f348000000b00440b0ed0649mr4671703vsm.24.1687339103999; Wed, 21 Jun
 2023 02:18:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1687250177.git.gianluca.luparini@bugseng.com>
 <2214598125081ccfb324555288bee0340f8b1024.1687250177.git.gianluca.luparini@bugseng.com>
 <97d41c7e-94d1-928c-6619-adc25ffba106@suse.com>
In-Reply-To: <97d41c7e-94d1-928c-6619-adc25ffba106@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 21 Jun 2023 11:18:13 +0200
X-Gmail-Original-Message-ID: <CAFHJcJumncuyj2Xs=dS5NqwNgL2_FAKRowNxFO32QjCGrUR5=g@mail.gmail.com>
Message-ID: <CAFHJcJumncuyj2Xs=dS5NqwNgL2_FAKRowNxFO32QjCGrUR5=g@mail.gmail.com>
Subject: Re: [XEN PATCH 09/13] xen/public: fixed violations of MISRA C:2012
 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Gianluca Luparini <gianluca.luparini@bugseng.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Michal Orzel <michal.orzel@amd.com>, Xenia Ragiadakou <Xenia.Ragiadakou@amd.com>, 
	Ayan Kumar <ayan.kumar.halder@amd.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="000000000000e8ddc805fea03f8a"

--000000000000e8ddc805fea03f8a
Content-Type: text/plain; charset="UTF-8"

Hi,

Il giorno mar 20 giu 2023 alle ore 15:00 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 20.06.2023 12:35, Simone Ballarin wrote:
> > --- a/xen/include/public/io/ring.h
> > +++ b/xen/include/public/io/ring.h
> > @@ -36,11 +36,11 @@
> >  typedef unsigned int RING_IDX;
> >
> >  /* Round a 32-bit unsigned constant down to the nearest power of two. */
> > -#define __RD2(_x)  (((_x) & 0x00000002) ? 0x2                  : ((_x)
> & 0x1))
> > -#define __RD4(_x)  (((_x) & 0x0000000c) ? __RD2((_x)>>2)<<2    :
> __RD2(_x))
> > -#define __RD8(_x)  (((_x) & 0x000000f0) ? __RD4((_x)>>4)<<4    :
> __RD4(_x))
> > -#define __RD16(_x) (((_x) & 0x0000ff00) ? __RD8((_x)>>8)<<8    :
> __RD8(_x))
> > -#define __RD32(_x) (((_x) & 0xffff0000) ? __RD16((_x)>>16)<<16 :
> __RD16(_x))
> > +#define __RD2(_x)  (((_x) & 0x00000002U) ? 0x2                  : ((_x)
> & 0x1))
> > +#define __RD4(_x)  (((_x) & 0x0000000cU) ? __RD2((_x)>>2)<<2    :
> __RD2(_x))
> > +#define __RD8(_x)  (((_x) & 0x000000f0U) ? __RD4((_x)>>4)<<4    :
> __RD4(_x))
> > +#define __RD16(_x) (((_x) & 0x0000ff00U) ? __RD8((_x)>>8)<<8    :
> __RD8(_x))
> > +#define __RD32(_x) (((_x) & 0xffff0000U) ? __RD16((_x)>>16)<<16 :
> __RD16(_x))
>
> While I don't mind the suffixes being added, I'm wondering how
> the tool would have spotted the single violation here. Iirc we
> don't use this header anywhere in the hypervisor.
>

In the analyzed build it is used:
aarch64-linux-gnu-gcc-12 -MMD -MP -MF common/.vm_event.o.d -DBUILD_ID
-fno-strict-aliasing -std=gnu99 -Wall -Wstrict-prototypes
-Wdeclaration-after-statement -Wno-unused-but-set-variable
-Wno-unused-local-typedefs -O1 -fno-omit-frame-pointer -nostdinc
-fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith -Wvla
-pipe -D__XEN__ -include ./include/xen/config.h
"-Wa,--strip-local-absolute" -g -mcpu=generic -mgeneral-regs-only
-mno-outline-atomics -I./include -I./arch/arm/include -fno-pie
-fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables
-Wnested-externs -fprofile-arcs -ftest-coverage -c common/vm_event.c -o
common/vm_event.o


xen/common/vm_event.c:
85 FRONT_RING_INIT(&ved->front_ring,
86 (vm_event_sring_t *)ved->ring_page,
87 PAGE_SIZE);

The expansions that lead to __RD32 are:
FRONT_RING_INIT -> FRONT_RING_ATTACH -> __RING_SIZE -> __RD32

>
> Furthermore, if I recall correctly Misra also mandates single
> evaluation of macro arguments. While I don't immediately see how
> to address that without resorting to compiler extensions, I don't
> think it makes sense to address one violation here but not he
> other (the more when the code in question doesn't affect the
> hypervisor build).
>

If not clearly connected I suggest discussing one rule at a time.

>
> Jan
>


-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--000000000000e8ddc805fea03f8a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">Il giorno mar 20 giu 2023 alle ore 15:00 Jan Beulich &lt;=
<a href=3D"mailto:jbeulich@suse.com" target=3D"_blank">jbeulich@suse.com</a=
>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On 20.06.2023 12:35, Simone Ballarin wrote:<br>
&gt; --- a/xen/include/public/io/ring.h<br>
&gt; +++ b/xen/include/public/io/ring.h<br>
&gt; @@ -36,11 +36,11 @@<br>
&gt;=C2=A0 typedef unsigned int RING_IDX;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /* Round a 32-bit unsigned constant down to the nearest power of=
 two. */<br>
&gt; -#define __RD2(_x)=C2=A0 (((_x) &amp; 0x00000002) ? 0x2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : ((_x) &amp; 0x1))<br>
&gt; -#define __RD4(_x)=C2=A0 (((_x) &amp; 0x0000000c) ? __RD2((_x)&gt;&gt;=
2)&lt;&lt;2=C2=A0 =C2=A0 : __RD2(_x))<br>
&gt; -#define __RD8(_x)=C2=A0 (((_x) &amp; 0x000000f0) ? __RD4((_x)&gt;&gt;=
4)&lt;&lt;4=C2=A0 =C2=A0 : __RD4(_x))<br>
&gt; -#define __RD16(_x) (((_x) &amp; 0x0000ff00) ? __RD8((_x)&gt;&gt;8)&lt=
;&lt;8=C2=A0 =C2=A0 : __RD8(_x))<br>
&gt; -#define __RD32(_x) (((_x) &amp; 0xffff0000) ? __RD16((_x)&gt;&gt;16)&=
lt;&lt;16 : __RD16(_x))<br>
&gt; +#define __RD2(_x)=C2=A0 (((_x) &amp; 0x00000002U) ? 0x2=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 : ((_x) &amp; 0x1))<br>
&gt; +#define __RD4(_x)=C2=A0 (((_x) &amp; 0x0000000cU) ? __RD2((_x)&gt;&gt=
;2)&lt;&lt;2=C2=A0 =C2=A0 : __RD2(_x))<br>
&gt; +#define __RD8(_x)=C2=A0 (((_x) &amp; 0x000000f0U) ? __RD4((_x)&gt;&gt=
;4)&lt;&lt;4=C2=A0 =C2=A0 : __RD4(_x))<br>
&gt; +#define __RD16(_x) (((_x) &amp; 0x0000ff00U) ? __RD8((_x)&gt;&gt;8)&l=
t;&lt;8=C2=A0 =C2=A0 : __RD8(_x))<br>
&gt; +#define __RD32(_x) (((_x) &amp; 0xffff0000U) ? __RD16((_x)&gt;&gt;16)=
&lt;&lt;16 : __RD16(_x))<br>
<br>
While I don&#39;t mind the suffixes being added, I&#39;m wondering how<br>
the tool would have spotted the single violation here. Iirc we<br>
don&#39;t use this header anywhere in the hypervisor.<br></blockquote><div>=
<br></div><div>In the analyzed build it is used:<br></div><div>aarch64-linu=
x-gnu-gcc-12 -MMD -MP -MF common/.vm_event.o.d -DBUILD_ID=20
-fno-strict-aliasing -std=3Dgnu99 -Wall -Wstrict-prototypes=20
-Wdeclaration-after-statement -Wno-unused-but-set-variable=20
-Wno-unused-local-typedefs -O1 -fno-omit-frame-pointer -nostdinc=20
-fno-builtin -fno-common -Werror -Wredundant-decls -Wno-pointer-arith=20
-Wvla -pipe -D__XEN__ -include ./include/xen/config.h=20
&quot;-Wa,--strip-local-absolute&quot; -g -mcpu=3Dgeneric -mgeneral-regs-on=
ly=20
-mno-outline-atomics -I./include -I./arch/arm/include -fno-pie=20
-fno-stack-protector -fno-exceptions -fno-asynchronous-unwind-tables=20
-Wnested-externs -fprofile-arcs -ftest-coverage -c common/vm_event.c -o=20
common/vm_event.o <br></div><div><br></div><div><br></div><div>xen/common/v=
m_event.c:<br></div><div><div><div id=3D"m_-5497963734588461410gmail-L85"><=
div role=3D"button"><span>    85 </span><span>    FRONT_RING_INIT(&amp;ved-=
&gt;front_ring,</span></div></div></div><div><div id=3D"m_-5497963734588461=
410gmail-L86"><div role=3D"button"><span></span><span>    86 </span><span> =
                   (vm_event_sring_t *)ved-&gt;ring_page,</span></div></div=
></div><span></span><span>    87 </span><span>                    PAGE_SIZE=
);</span></div><div><span><br></span></div><div><span>The expansions that l=
ead to __RD32 are:</span></div>FRONT_RING_INIT -&gt; FRONT_RING_ATTACH -&gt=
; __RING_SIZE -&gt; __RD32<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">
<br>
Furthermore, if I recall correctly Misra also mandates single<br>
evaluation of macro arguments. While I don&#39;t immediately see how<br>
to address that without resorting to compiler extensions, I don&#39;t<br>
think it makes sense to address one violation here but not he<br>
other (the more when the code in question doesn&#39;t affect the<br>
hypervisor build).<br></blockquote><div><br></div><div>If not clearly conne=
cted I suggest discussing one rule at a time.</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Simone Ballarin, M.Sc.<br><br><div>Field Application Engineer, BUGSENG =
(<a href=3D"http://bugseng.com" target=3D"_blank">https://bugseng.com</a>)<=
/div></div></div></div>

--000000000000e8ddc805fea03f8a--

