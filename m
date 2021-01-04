Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E46D82E9B67
	for <lists+xen-devel@lfdr.de>; Mon,  4 Jan 2021 17:58:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61391.107990 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTBH-0007LX-Cb; Mon, 04 Jan 2021 16:58:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61391.107990; Mon, 04 Jan 2021 16:58:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwTBH-0007L6-93; Mon, 04 Jan 2021 16:58:07 +0000
Received: by outflank-mailman (input) for mailman id 61391;
 Mon, 04 Jan 2021 16:58:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AaoZ=GH=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1kwTBF-0007L1-4d
 for xen-devel@lists.xenproject.org; Mon, 04 Jan 2021 16:58:05 +0000
Received: from mail-wr1-x435.google.com (unknown [2a00:1450:4864:20::435])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 18e455b4-2a34-41a9-ac5e-f31d7c1d3afd;
 Mon, 04 Jan 2021 16:58:03 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id q18so32928163wrn.1
 for <xen-devel@lists.xenproject.org>; Mon, 04 Jan 2021 08:58:03 -0800 (PST)
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
X-Inumbo-ID: 18e455b4-2a34-41a9-ac5e-f31d7c1d3afd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AISa4LI6Am9s0B0I2KO/fhKUg7R+vgA9tphxnedbjEA=;
        b=pt8GkoCxgHoaF2EJrKS0BbN6btxqnvVKwp43ZhtyPdTzGm1Wlg6rMKatTI7lCK7IT/
         3E1ffWjDAN9z2zE4Zuoo0nHmTZmLTfwzemSsMKlqIb0CgDA71MmLmqdjrv/pYvFGkxWx
         IYaNulprWQxqwHZvlR127Ntw+b7Kf902gX8NHAQbWgrzEh8b3hSHPXw6APlK7CBQ+Ubn
         CgbyKnyOHiAuHlo6NNJcP8GWqkt9ZRjCVFoOwG0waF3We+ykSPRqreTBAwnssz9dW2Sy
         GhuWLP7jH+TDhSndc2BnYinFYdpdObb9PtBp9VMmB9RCYQV/cpTZt5isBYX5h6dpTkyu
         vy/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AISa4LI6Am9s0B0I2KO/fhKUg7R+vgA9tphxnedbjEA=;
        b=GuMAio0P8FZn8sk6s2MblWmnti9XJaANSYWA5F0UIHW8BI7Rf5RwtPvOiO3AJm4JS1
         THpauvePUmQj9F7Kx2+tqiDxojsyoW+LIJ33dHaRXgujysa5NlJGd/rlAB4KR2T8VK7K
         X8lzBcs0S3ovb9j7t6hGkojd0BKCQKWgITga1mqoczW9m/Ie2z4QazMqlVwilmfv9YoI
         MSFI2GyG63mvXkcaHxnHSdCqIbztzTBvzL0DE0bNI8OQ3Cp3l2xVHX0A/vfvDqv8o4Zn
         EEOASC0bf+nXi7r3kz/DpvWyfTKTKBnEf7AEtyR+y7IvV9kQ4AsIJjGJg86DT3THKJDi
         qF1g==
X-Gm-Message-State: AOAM533yR0RryYoH7I5vRxZ/SfFHOA5wUAnTuibIu7fj4IPkwTP6Vfiv
	ahz2abwV12nN9cio6Qe5rTkARInC73a7x0AuL6M=
X-Google-Smtp-Source: ABdhPJw3d6ifTiiSTCC3ZanFBDWD0DuxYzWnnnz6hk9u+pwO0Rqtg6XZvU2/TIyv8/4jQYFfN1Ba6AD0sPsBlv4UByo=
X-Received: by 2002:a5d:5147:: with SMTP id u7mr82447818wrt.114.1609779482689;
 Mon, 04 Jan 2021 08:58:02 -0800 (PST)
MIME-Version: 1.0
References: <be9ce75e-9119-2b5a-9e7b-437beb7ee446@suse.com>
 <cf4569c5-a9c5-7b4b-d576-d1521c369418@suse.com> <f736244b-ece7-af35-1517-2e5fdd9705c7@citrix.com>
 <e2ee99fc-e3f8-bdaf-fe4a-d048da34731a@suse.com> <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
In-Reply-To: <b4abbe2f-5e3d-5f43-80b8-cfa3fd97061e@citrix.com>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Mon, 4 Jan 2021 18:57:51 +0200
Message-ID: <CAPD2p-nZyf_i_bGh5sSs2fC4S7nxB1Mk_zbSKtqF=zvBOp3X+Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] x86/mm: p2m_add_foreign() is HVM-only
To: Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Wei Liu <wl@xen.org>, 
	=?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
	George Dunlap <george.dunlap@citrix.com>
Content-Type: multipart/alternative; boundary="0000000000003b82df05b815fea0"

--0000000000003b82df05b815fea0
Content-Type: text/plain; charset="UTF-8"

Hello all.

[Sorry for the possible format issues]

On Tue, Dec 22, 2020 at 12:41 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 21/12/2020 08:10, Jan Beulich wrote:
> > On 17.12.2020 20:18, Andrew Cooper wrote:
> >> On 15/12/2020 16:26, Jan Beulich wrote:
> >>> This is together with its only caller, xenmem_add_to_physmap_one().
> >> I can't parse this sentence.  Perhaps "... as is it's only caller," as a
> >> follow-on from the subject sentence.
> >>
> >>>  Move
> >>> the latter next to p2m_add_foreign(), allowing this one to become
> static
> >>> at the same time.
> >>>
> >>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> >> Acked-by: Andrew Cooper <andrew.cooper3@citrix.com>
> > So I had to ask Andrew to revert this (I was already at home when
> > noticing the breakage), as it turned out to break the shim build.
> > The problem is that xenmem_add_to_physmap() is non-static and
> > hence can't be eliminated altogether by the compiler when !HVM.
> > We could make the function conditionally static
> > "#if !defined(CONFIG_X86) && !defined(CONFIG_HVM)", but this
> > looks uglier to me than this extra hunk:
> >
> > --- unstable.orig/xen/common/memory.c
> > +++ unstable/xen/common/memory.c
> > @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain
> >      union add_to_physmap_extra extra = {};
> >      struct page_info *pages[16];
> >
> > -    ASSERT(paging_mode_translate(d));
> > +    if ( !paging_mode_translate(d) )
> > +    {
> > +        ASSERT_UNREACHABLE();
> > +        return -EACCES;
> > +    }
> >
> >      if ( xatp->space == XENMAPSPACE_gmfn_foreign )
> >          extra.foreign_domid = DOMID_INVALID;
> >
> > Andrew, please let me know whether your ack stands with this (or
> > said alternative) added, or whether you'd prefer me to re-post.
>
> Yeah, this is probably neater than the ifdefary.  My ack stands.
>
> ~Andrew
>

I might miss something or did incorrect tests, but ...
... trying to build current staging
(7ba2ab495be54f608cb47440e1497b2795bd301a) for x86 (with # CONFIG_HVM is
not set) I got the following:

/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:
undefined reference to `xenmem_add_to_physmap_one'
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/common/memory.c:941:(.text+0x1e391):
relocation truncated to fit: R_X86_64_PC32 against undefined symbol
`xenmem_add_to_physmap_one'
ld:
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/xen/.xen-syms.0:
hidden symbol `xenmem_add_to_physmap_one' isn't defined
ld: final link failed: Bad value

It is worth mentioning that I do not use pvshim_defconfig (I disable HVM
support via menuconfig manually before building).

-- 
Regards,

Oleksandr Tyshchenko

--0000000000003b82df05b815fea0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div>Hello all.</div><div><br><=
/div><div>[Sorry for the possible format issues]</div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Dec 22, 2020 at 12:=
41 PM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citrix.com" target=
=3D"_blank">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex">On 21/12/2020 08:10, Jan Beulich wrote=
:<br>
&gt; On 17.12.2020 20:18, Andrew Cooper wrote:<br>
&gt;&gt; On 15/12/2020 16:26, Jan Beulich wrote:<br>
&gt;&gt;&gt; This is together with its only caller, xenmem_add_to_physmap_o=
ne().<br>
&gt;&gt; I can&#39;t parse this sentence.=C2=A0 Perhaps &quot;... as is it&=
#39;s only caller,&quot; as a<br>
&gt;&gt; follow-on from the subject sentence.<br>
&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 Move<br>
&gt;&gt;&gt; the latter next to p2m_add_foreign(), allowing this one to bec=
ome static<br>
&gt;&gt;&gt; at the same time.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Jan Beulich &lt;<a href=3D"mailto:jbeulich@suse=
.com" target=3D"_blank">jbeulich@suse.com</a>&gt;<br>
&gt;&gt; Acked-by: Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@citri=
x.com" target=3D"_blank">andrew.cooper3@citrix.com</a>&gt;<br>
&gt; So I had to ask Andrew to revert this (I was already at home when<br>
&gt; noticing the breakage), as it turned out to break the shim build.<br>
&gt; The problem is that xenmem_add_to_physmap() is non-static and<br>
&gt; hence can&#39;t be eliminated altogether by the compiler when !HVM.<br=
>
&gt; We could make the function conditionally static<br>
&gt; &quot;#if !defined(CONFIG_X86) &amp;&amp; !defined(CONFIG_HVM)&quot;, =
but this<br>
&gt; looks uglier to me than this extra hunk:<br>
&gt;<br>
&gt; --- unstable.orig/xen/common/memory.c<br>
&gt; +++ unstable/xen/common/memory.c<br>
&gt; @@ -788,7 +788,11 @@ int xenmem_add_to_physmap(struct domain<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union add_to_physmap_extra extra =3D {};<br>
&gt;=C2=A0 =C2=A0 =C2=A0 struct page_info *pages[16];<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 ASSERT(paging_mode_translate(d));<br>
&gt; +=C2=A0 =C2=A0 if ( !paging_mode_translate(d) )<br>
&gt; +=C2=A0 =C2=A0 {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 ASSERT_UNREACHABLE();<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EACCES;<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if ( xatp-&gt;space =3D=3D XENMAPSPACE_gmfn_foreig=
n )<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 extra.foreign_domid =3D DOMID_INVALI=
D;<br>
&gt;<br>
&gt; Andrew, please let me know whether your ack stands with this (or<br>
&gt; said alternative) added, or whether you&#39;d prefer me to re-post.<br=
>
<br>
Yeah, this is probably neater than the ifdefary.=C2=A0 My ack stands.<br>
<br>
~Andrew<br></blockquote><div><br></div><div>I might miss something or did i=
ncorrect=C2=A0tests, but ...=C2=A0</div><div>... trying to build current st=
aging (7ba2ab495be54f608cb47440e1497b2795bd301a) for x86 (with # CONFIG_HVM=
 is not set) I got the following:=C2=A0<br></div></div><div><br></div><div>=
/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r0/repo=
/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r0/git/=
xen/common/memory.c:941: undefined reference to `xenmem_add_to_physmap_one&=
#39;<br>/media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0=
-r0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb=
-r0/git/xen/common/memory.c:941:(.text+0x1e391): relocation truncated to fi=
t: R_X86_64_PC32 against undefined symbol `xenmem_add_to_physmap_one&#39;<b=
r>ld: /media/b/build/build/tmp/work/x86_64-xt-linux/domd-image-weston/1.0-r=
0/repo/build/tmp/work/aarch64-poky-linux/xen/4.14.0+gitAUTOINC+2c6e5a8ceb-r=
0/git/xen/.xen-syms.0: hidden symbol `xenmem_add_to_physmap_one&#39; isn&#3=
9;t defined<br>ld: final link failed: Bad value<br></div><div><br></div><di=
v>It is worth mentioning that I do not use=C2=A0pvshim_defconfig (I disable=
 HVM support via menuconfig manually before building).<br></div><div><br></=
div>-- <br><div dir=3D"ltr"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><di=
v dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000003b82df05b815fea0--

