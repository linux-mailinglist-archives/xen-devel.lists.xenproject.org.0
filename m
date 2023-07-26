Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D3ED763666
	for <lists+xen-devel@lfdr.de>; Wed, 26 Jul 2023 14:34:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.570438.892201 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOdiH-00069E-6s; Wed, 26 Jul 2023 12:33:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 570438.892201; Wed, 26 Jul 2023 12:33:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qOdiH-000671-45; Wed, 26 Jul 2023 12:33:57 +0000
Received: by outflank-mailman (input) for mailman id 570438;
 Wed, 26 Jul 2023 12:33:55 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0A2=DM=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qOdiF-00066v-38
 for xen-devel@lists.xenproject.org; Wed, 26 Jul 2023 12:33:55 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ae69d944-2bb0-11ee-b242-6b7b168915f2;
 Wed, 26 Jul 2023 14:33:53 +0200 (CEST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by support.bugseng.com (Postfix) with ESMTPSA id 550234EE073A
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 14:33:53 +0200 (CEST)
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-79a2216a22fso1077706241.0
 for <xen-devel@lists.xenproject.org>; Wed, 26 Jul 2023 05:33:53 -0700 (PDT)
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
X-Inumbo-ID: ae69d944-2bb0-11ee-b242-6b7b168915f2
X-Gm-Message-State: ABy/qLZJ1JB6AAMO5nWRlC9N2kDazTCh/6hxQysRsVyck7TnqjRSXIcD
	6ThyuiNqsUW5/TZBy/jh5a4O3nd7BVebGf8rv7I=
X-Google-Smtp-Source: APBJJlGSZWIKhDOn+TsWOWaK9kwYqJ02IbVDNFMfPhMxLre5SFORL/00K+TajtUIwGu9aIE4PLYjvq0PExO34gSPLnA=
X-Received: by 2002:a67:fd45:0:b0:443:92dc:51ce with SMTP id
 g5-20020a67fd45000000b0044392dc51cemr1023509vsr.35.1690374832106; Wed, 26 Jul
 2023 05:33:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1690368810.git.simone.ballarin@bugseng.com> <c07a7651-b45a-a6f9-8dcd-f4237a51d2ca@suse.com>
In-Reply-To: <c07a7651-b45a-a6f9-8dcd-f4237a51d2ca@suse.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Date: Wed, 26 Jul 2023 14:33:40 +0200
X-Gmail-Original-Message-ID: <CAFHJcJu5=Jtyzuz57WW=T7h4cV8Svo-Nv4s7q19iLPAzdsBX5Q@mail.gmail.com>
Message-ID: <CAFHJcJu5=Jtyzuz57WW=T7h4cV8Svo-Nv4s7q19iLPAzdsBX5Q@mail.gmail.com>
Subject: Re: [XEN PATCH 0/4] xen: address violations of MISRA C:2012 Rule 7.2
To: Jan Beulich <jbeulich@suse.com>
Cc: consulting@bugseng.com, Jun Nakajima <jun.nakajima@intel.com>, 
	Kevin Tian <kevin.tian@intel.com>, Andrew Cooper <andrew.cooper3@citrix.com>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, Wei Liu <wl@xen.org>, 
	Paul Durrant <paul@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, xen-devel@lists.xenproject.org
Content-Type: multipart/alternative; boundary="00000000000067bc3e0601630f8c"

--00000000000067bc3e0601630f8c
Content-Type: text/plain; charset="UTF-8"

Il giorno mer 26 lug 2023 alle ore 14:02 Jan Beulich <jbeulich@suse.com> ha
scritto:

> On 26.07.2023 13:03, Simone Ballarin wrote:
> > The xen sources contains violations of MISRA C:2012 Rule 7.2 whose
> headline
> > states:
> > "A 'u' or 'U' suffix shall be applied to all integer constants that are
> > represented in an unsigned type".
> >
> > These violations are caused by the missing "u" or "U" suffix in unsigned
> > integer constants, such as:
> >
> > xen/arch/x86/hvm/hypercall.c:132.17-132.26
> > if ( (eax & 0x80000000) && is_viridian_domain(currd) )
> >
> > If a rule is not met, changes are needed in order to achieve compliance.
> > The patches in this series achieve compliance for MISRA C:2012 Rule 7.2
> by
> > adding the 'U' suffix to integers literals with unsigned type and also
> to other
> > literals used in the same contexts or near violations, when their
> positive
> > nature is immediately clear. The latter changes are done for the sake of
> > uniformity.
> >
> > Gianluca Luparini (4):
> >   x86/vmx: address violations of MISRA C:2012 Rule 7.2
> >   xen/vpci: address violations of MISRA C:2012 Rule 7.2
> >   x86/viridian: address violations of MISRA C:2012 Rule 7.2
> >   xen/x86: address violations of MISRA C:2012 Rule 7.2
>
> Looks like this is v4 of a previously larger series, where fair parts have
> gone in already?
>
> Jan
>

Yes, it is. I accidentally removed the v4 from the object.
In this submission, I've dropped the commits that have
been already merged.

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com
<http://bugseng.com>)

--00000000000067bc3e0601630f8c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Il giorno mer 26 lug 2023 alle ore 14=
:02 Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse.com">jbeulich@suse.com<=
/a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On 26.07.2023 13:03, Simone Ballarin wrote:<br>
&gt; The xen sources contains violations of MISRA C:2012 Rule 7.2 whose hea=
dline<br>
&gt; states:<br>
&gt; &quot;A &#39;u&#39; or &#39;U&#39; suffix shall be applied to all inte=
ger constants that are<br>
&gt; represented in an unsigned type&quot;.<br>
&gt; <br>
&gt; These violations are caused by the missing &quot;u&quot; or &quot;U&qu=
ot; suffix in unsigned<br>
&gt; integer constants, such as:<br>
&gt; <br>
&gt; xen/arch/x86/hvm/hypercall.c:132.17-132.26<br>
&gt; if ( (eax &amp; 0x80000000) &amp;&amp; is_viridian_domain(currd) )<br>
&gt; <br>
&gt; If a rule is not met, changes are needed in order to achieve complianc=
e.<br>
&gt; The patches in this series achieve compliance for MISRA C:2012 Rule 7.=
2 by<br>
&gt; adding the &#39;U&#39; suffix to integers literals with unsigned type =
and also to other<br>
&gt; literals used in the same contexts or near violations, when their posi=
tive<br>
&gt; nature is immediately clear. The latter changes are done for the sake =
of<br>
&gt; uniformity.<br>
&gt; <br>
&gt; Gianluca Luparini (4):<br>
&gt;=C2=A0 =C2=A0x86/vmx: address violations of MISRA C:2012 Rule 7.2<br>
&gt;=C2=A0 =C2=A0xen/vpci: address violations of MISRA C:2012 Rule 7.2<br>
&gt;=C2=A0 =C2=A0x86/viridian: address violations of MISRA C:2012 Rule 7.2<=
br>
&gt;=C2=A0 =C2=A0xen/x86: address violations of MISRA C:2012 Rule 7.2<br>
<br>
Looks like this is v4 of a previously larger series, where fair parts have<=
br>
gone in already?<br>
<br>
Jan<br>
</blockquote></div><br clear=3D"all"><div>Yes, it is. I accidentally remove=
d the v4 from the object.</div><div>In this submission, I&#39;ve dropped th=
e commits that have</div><div>been already merged.</div><br><span class=3D"=
gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signa=
ture"><div dir=3D"ltr">Simone Ballarin, M.Sc.<br><br><div>Field Application=
 Engineer, BUGSENG (<a href=3D"http://bugseng.com" target=3D"_blank">https:=
//bugseng.com</a>)</div></div></div></div>

--00000000000067bc3e0601630f8c--

