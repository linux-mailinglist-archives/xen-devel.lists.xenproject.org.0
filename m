Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D0396C25B0
	for <lists+xen-devel@lfdr.de>; Tue, 21 Mar 2023 00:36:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.512150.791898 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peP1w-0005VO-Fy; Mon, 20 Mar 2023 23:35:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 512150.791898; Mon, 20 Mar 2023 23:35:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1peP1w-0005Sq-DA; Mon, 20 Mar 2023 23:35:08 +0000
Received: by outflank-mailman (input) for mailman id 512150;
 Mon, 20 Mar 2023 23:35:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Z4LM=7M=tklengyel.com=bounce+e181d6.cd840-xen-devel=lists.xenproject.org@srs-se1.protection.inumbo.net>)
 id 1peP1u-0005SU-PD
 for xen-devel@lists.xenproject.org; Mon, 20 Mar 2023 23:35:07 +0000
Received: from rs227.mailgun.us (rs227.mailgun.us [209.61.151.227])
 by se1-gles-sth1.inumbo.com (Halon) with UTF8SMTPS
 id d6926686-c777-11ed-87f5-c1b5be75604c;
 Tue, 21 Mar 2023 00:35:04 +0100 (CET)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com
 [209.85.219.173]) by
 95303ccc4d02 with SMTP id 6418eda54699828fae8ef4b2 (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 20 Mar 2023 23:35:01 GMT
Received: by mail-yb1-f173.google.com with SMTP id z83so15207013ybb.2
 for <xen-devel@lists.xenproject.org>; Mon, 20 Mar 2023 16:35:01 -0700 (PDT)
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
X-Inumbo-ID: d6926686-c777-11ed-87f5-c1b5be75604c
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=tklengyel.com;
 q=dns/txt; s=mailo; t=1679355301; x=1679362501; h=Content-Type: Cc: To: To:
 Subject: Subject: Message-ID: Date: From: From: In-Reply-To: References:
 MIME-Version: Sender: Sender;
 bh=jDFVo1Kvy4xvlr3ArcU6O89+q/naVyly7oLes1oNCj4=;
 b=Sozea4O88uvnW2fNZN/OGtnN1dhmjHm9rxTl61hwT3HA49VjQGLzV/0QBWKeiOnTzdw044Mpczyp9NjmXnfEKwOLLGySIAasxf1r0J2fytmt6Fyvy0A5BQvdhjf14JnuvCibl4t/LX1zGbejaEwkPlVn2QSmOGkoH4k9px219G3+kqFtyfcO+54QRgpYlqpqVfYTz4RFjKBzB30G4jSK4ek3eUX28p621vBV5cMaetcnu2X7+/JQMPGRSaVbIVO1VOaimNJPP8xfe8beC562syzk7GAPUtp/wyKRm8XS8fyuJ0sMHNafDhhrGlGRKRgLbJH7Euw918hLYuPm0LB0GA==
X-Mailgun-Sending-Ip: 209.61.151.227
X-Mailgun-Sid: WyIyYTNmOCIsInhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyIsImNkODQwIl0=
Sender: tamas@tklengyel.com
X-Gm-Message-State: AAQBX9fa1Mu1RmljZ+bC4ITJ8hVfEj+SH/6p+4P8qxItUptgzuYD91PF
	thuJtI5xuBFMTAEDMOJn029qKkc2Kk84L0DzOvw=
X-Google-Smtp-Source: AKy350b9GPRARXyPIivWMZTR+1EUO3Uu+CpqMF6NZ/o7JhPykqzlTyTOVsxI/Anp+KHx6O/XCdBqjI5l7uyWagwsvhA=
X-Received: by 2002:a5b:24e:0:b0:b69:f11b:690f with SMTP id
 g14-20020a5b024e000000b00b69f11b690fmr147340ybp.6.1679355301739; Mon, 20 Mar
 2023 16:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <e047a7a7-2e45-48de-2cb4-69001e95e1a8@list.ru> <CABfawhncTLzRvHYF3SyhdidfobP9PB3YOZ9oTjRREjKs07KtXQ@mail.gmail.com>
 <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru>
In-Reply-To: <c5ea0f53-8cc9-509e-6c82-deea00f1ed74@list.ru>
From: Tamas K Lengyel <tamas@tklengyel.com>
Date: Mon, 20 Mar 2023 19:34:25 -0400
X-Gmail-Original-Message-ID: <CABfawhnRmGwB4VTx2i9Wg2c8dfyKqU5zM6MnWsMHBOfXA43+qA@mail.gmail.com>
Message-ID: <CABfawhnRmGwB4VTx2i9Wg2c8dfyKqU5zM6MnWsMHBOfXA43+qA@mail.gmail.com>
Subject: Re: [XEN PATCH v1 1/1] x86/domctl: add gva_to_gfn command
To: =?UTF-8?B?0JrQvtCy0LDQu9GR0LIg0KHQtdGA0LPQtdC5?= <valor@list.ru>
Cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	Wei Liu <wl@xen.org>, George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
	Stefano Stabellini <sstabellini@kernel.org>, Dmitry Isaykin <isaikin-dmitry@yandex.ru>
Content-Type: multipart/alternative; boundary="00000000000036429d05f75d601d"

--00000000000036429d05f75d601d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 20, 2023 at 3:23=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=
=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru> wrote:
>
>
>
> 21.03.2023 1:51, Tamas K Lengyel wrote:
> >
> >
> > On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=9A=D0=BE=D0=B2=D0=B0=D0=BB=
=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=B9 <valor@list.ru
> > <mailto:valor@list.ru>> wrote:
> >  >
> >  > gva_to_gfn command used for fast address translation in LibVMI
project.
> >  > With such a command it is possible to perform address translation in
> >  > single call instead of series of queries to get every page table.
> >
> > You have a couple assumptions here:
> >   - Xen will always have a direct map of the entire guest memory - ther=
e
> > are already plans to move away from that. Without that this approach
> > won't have any advantage over doing the same mapping by LibVMI
>
> Thanks! I didn't know about the plan. Though I use this patch
> back ported into 4.16.
>
> >   - LibVMI has to map every page for each page table for every lookup -
> > you have to do that only for the first, afterwards the pages on which
> > the pagetable is are kept in a cache and subsequent lookups would be
> > actually faster then having to do this domctl since you can keep being
> > in the same process instead of having to jump to Xen.
>
> Yes. I know about the page cache. But I have faced with several issues
> with cache like this one https://github.com/libvmi/libvmi/pull/1058 .
> So I had to disable the cache.

The issue you linked to is an issue with a stale v2p cache, which is a
virtual TLB. The cache I talked about is the page cache, which is just
maintaining a list of the pages that were accessed by LibVMI for future
accesses. You can have one and not the other (ie. ./configure
--disable-address-cache --enable-page-cache).

Tamas

--00000000000036429d05f75d601d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><br><br>On Mon, Mar 20, 2023 at 3:23=E2=80=AFPM =D0=
=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=
=B9 &lt;<a href=3D"mailto:valor@list.ru">valor@list.ru</a>&gt; wrote:<br>&g=
t;<br>&gt;<br>&gt;<br>&gt; 21.03.2023 1:51, Tamas K Lengyel wrote:<br>&gt; =
&gt;<br>&gt; &gt;<br>&gt; &gt; On Mon, Mar 20, 2023 at 12:32=E2=80=AFPM =D0=
=9A=D0=BE=D0=B2=D0=B0=D0=BB=D1=91=D0=B2 =D0=A1=D0=B5=D1=80=D0=B3=D0=B5=D0=
=B9 &lt;<a href=3D"mailto:valor@list.ru">valor@list.ru</a><br>&gt; &gt; &lt=
;mailto:<a href=3D"mailto:valor@list.ru">valor@list.ru</a>&gt;&gt; wrote:<b=
r>&gt; &gt; =C2=A0&gt;<br>&gt; &gt; =C2=A0&gt; gva_to_gfn command used for =
fast address translation in LibVMI project.<br>&gt; &gt; =C2=A0&gt; With su=
ch a command it is possible to perform address translation in<br>&gt; &gt; =
=C2=A0&gt; single call instead of series of queries to get every page table=
.<br>&gt; &gt;<br>&gt; &gt; You have a couple assumptions here:<br>&gt; &gt=
; =C2=A0 - Xen will always have a direct map of the entire guest memory - t=
here<br>&gt; &gt; are already plans to move away from that. Without that th=
is approach<br>&gt; &gt; won&#39;t have any advantage over doing the same m=
apping by LibVMI<br>&gt;<br>&gt; Thanks! I didn&#39;t know about the plan. =
Though I use this patch<br>&gt; back ported into 4.16.<br>&gt;<br>&gt; &gt;=
 =C2=A0 - LibVMI has to map every page for each page table for every lookup=
 -<br>&gt; &gt; you have to do that only for the first, afterwards the page=
s on which<br>&gt; &gt; the pagetable is are kept in a cache and subsequent=
 lookups would be<br>&gt; &gt; actually faster then having to do this domct=
l since you can keep being<br>&gt; &gt; in the same process instead of havi=
ng to jump to Xen.<br>&gt;<br>&gt; Yes. I know about the page cache. But I =
have faced with several issues<br>&gt; with cache like this one <a href=3D"=
https://github.com/libvmi/libvmi/pull/1058">https://github.com/libvmi/libvm=
i/pull/1058</a> .<br>&gt; So I had to disable the cache.<br><br></div><div>=
The issue you linked to is an issue with a stale v2p cache, which is a virt=
ual TLB. The cache I talked about is the page cache, which is just maintain=
ing a list of the pages that were accessed by LibVMI for future accesses. Y=
ou can have one and not the other (ie. ./configure=C2=A0 --disable-address-=
cache --enable-page-cache). <br></div><div><br></div><div>Tamas<br></div></=
div>

--00000000000036429d05f75d601d--

