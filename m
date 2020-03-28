Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EC7319660C
	for <lists+xen-devel@lfdr.de>; Sat, 28 Mar 2020 13:20:47 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIAP8-0003o9-Oq; Sat, 28 Mar 2020 12:17:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FJGS=5N=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIAP7-0003o3-15
 for xen-devel@lists.xenproject.org; Sat, 28 Mar 2020 12:17:33 +0000
X-Inumbo-ID: 1918dda0-70ee-11ea-b34e-bc764e2007e4
Received: from mail-lj1-x241.google.com (unknown [2a00:1450:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1918dda0-70ee-11ea-b34e-bc764e2007e4;
 Sat, 28 Mar 2020 12:17:32 +0000 (UTC)
Received: by mail-lj1-x241.google.com with SMTP id p14so12910538lji.11
 for <xen-devel@lists.xenproject.org>; Sat, 28 Mar 2020 05:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Ua4N6nYAWBUSwhAkTnEAsDxlfcnEELumaNt4zgosCc=;
 b=OyU1HNb923S+erwHOdLyeZHU800tqAjtdM5rVaTgC2TuaGUMSW9SJxegY7auALA71N
 qdlT8igZtMBz6N+xgBxz43syYvUXtucmuHBjbtBcrs+v46O82oGpTeZ8KIje4ajFCyhj
 hrhENIVbpSi0A2YqimctvC73wy5bNw0XyLR6E6hpm3NI1WHttkRNFQsAna3A3sJ78UWu
 NpESPFoyraHESXhwvJNDEMWe/zDjJ7AsZ3W3K7FAGdHxTj+4mwls6u1m4j0FVn/8/riF
 XpLv150dueDPa9ULgHvYxhavN18263t9HI4adpLXZqM+lor/a+xAeeX9wquf59bAe/nT
 ETaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Ua4N6nYAWBUSwhAkTnEAsDxlfcnEELumaNt4zgosCc=;
 b=IfkRUfYM4OefeWWVWpzUFbqJrUXrMRQ0I/l965QTF4aGguX6Q/Qj4Wu3pv3xmqgCjC
 7F5Ru09NpDbL+kgh3GM6itOwZ65yUpoeTJQuWRRu9bxZrCsGqlJHAH7DsRPIa1uAJUuc
 jXclqfx+CreA/TyiWChDh0khyD5cvOIEQBf4sGVnQSyvZ5p8fUPj92PldPx13IN1jHuB
 /ssRwUXM2010Sv51AZ04ePtOfomcpu2PeRwEqjin8/xss0bWZGKzUVg3QksYO/YZYzNW
 VrK/qLH6RpoFubmxHtSe6JxCt4hqnFWxNpB+OxL1Mn6/lSF3N2qbqyDBrDX1eOz/N8UT
 DNgg==
X-Gm-Message-State: AGi0PuZy0YW8esIDxiSNbg8fkMRb/Ca8z7anWRm7ek5+z3bsa+p+nbT+
 i8SVTXx6txtkHoF0CrdhAqNK1qK6vXPZV2vbV/w=
X-Google-Smtp-Source: APiQypJDEijmAsF5nUsRL4wEhMB98iD3JTPvlzFeAc1alWyraXflucREzlhg/7NKQjUlSOfIuxpi1cj50wkJf05eEsE=
X-Received: by 2002:a2e:8954:: with SMTP id b20mr2028153ljk.176.1585397850783; 
 Sat, 28 Mar 2020 05:17:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200328053834.GA12753@simran-Inspiron-5558>
 <20200328101840.GN28601@Air-de-Roger>
In-Reply-To: <20200328101840.GN28601@Air-de-Roger>
From: Simran Singhal <singhalsimran0@gmail.com>
Date: Sat, 28 Mar 2020 17:47:18 +0530
Message-ID: <CALrZqyNs1No4OQAZvUJbPY5OTiHeq=hKeF10uWDubO=0kXsvzQ@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000b9424905a1e9332a"
Subject: Re: [Xen-devel] [PATCH] xen/x86: Remove unnecessary cast on void
 pointer
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
Cc: Kevin Tian <kevin.tian@intel.com>, Jan Beulich <jbeulich@suse.com>,
 Wei Liu <wl@xen.org>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000b9424905a1e9332a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Roger,

Thanks for your suggestions!

On Sat, Mar 28, 2020 at 3:48 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
wrote:

> Thanks!
>
> On Sat, Mar 28, 2020 at 11:08:35AM +0530, Simran Singhal wrote:
> > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> > index f049920196..a53d3ca2a4 100644
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, u32
> index)
> >  u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
> >  {
> >      union vmcs_encoding enc;
> > -    u64 *content =3D (u64 *) vvmcs;
> > +    u64 *content =3D vvmcs;
> >      int offset;
> >      u64 res;
> >
> > @@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const struc=
t
> vcpu *v, u32 encoding,
> >  void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
> >  {
> >      union vmcs_encoding enc;
> > -    u64 *content =3D (u64 *) vvmcs;
> > +    u64 *content =3D vvmcs;
>
> While there, would you mind changing u64 to uint64_t? (here and
> above)
>

I'll do that in the next version.


>
> >      int offset;
> >      u64 res;
> >
> > diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c
> > index eb66077496..058b9b8adf 100644
> > --- a/xen/arch/x86/mm/p2m-pt.c
> > +++ b/xen/arch/x86/mm/p2m-pt.c
> > @@ -127,7 +127,7 @@ p2m_find_entry(void *table, unsigned long
> *gfn_remainder,
> >          return NULL;
> >      }
> >      *gfn_remainder &=3D (1 << shift) - 1;
> > -    return (l1_pgentry_t *)table + index;
> > +    return table + index;
>
> I don't think removing this cast is correct, as you would be doing a
> plain addition to a pointer instead of fetching the next entry in the
> array of l1_pgentry_t entries.
>
> If you want to get rid of the cast here you need to change the type of
> the table parameter to l1_pgentry_t * instead of void *.
>

Yes, you are correct. Since void* is a pointer to an unknown type we can't
do pointer arithmetic on it, as the compiler wouldn't know how big the
thing pointed to is. Thus, it is necessary to keep the cast on the "table".

Ah! I am sorry for this mistake. But, I am afraid why I didn't get warning
during compilation.
I'll remove these changes in the next version.

Thanks
Simran


>
> Thanks, Roger.
>

--000000000000b9424905a1e9332a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Hi Roger,</div><div><br></div><div>T=
hanks for your suggestions!<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 28, 2020 at 3:48 PM Roger =
Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com" target=3D"_blank=
">roger.pau@citrix.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">Thanks!<br>
<br>
On Sat, Mar 28, 2020 at 11:08:35AM +0530, Simran Singhal wrote:<br>
&gt; diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c=
<br>
&gt; index f049920196..a53d3ca2a4 100644<br>
&gt; --- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; +++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; @@ -256,7 +256,7 @@ static int vvmcs_offset(u32 width, u32 type, u32 i=
ndex)<br>
&gt;=C2=A0 u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union vmcs_encoding enc;<br>
&gt; -=C2=A0 =C2=A0 u64 *content =3D (u64 *) vvmcs;<br>
&gt; +=C2=A0 =C2=A0 u64 *content =3D vvmcs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 u64 res;<br>
&gt;=C2=A0 <br>
&gt; @@ -310,7 +310,7 @@ enum vmx_insn_errno get_vvmcs_real_safe(const stru=
ct vcpu *v, u32 encoding,<br>
&gt;=C2=A0 void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)<=
br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union vmcs_encoding enc;<br>
&gt; -=C2=A0 =C2=A0 u64 *content =3D (u64 *) vvmcs;<br>
&gt; +=C2=A0 =C2=A0 u64 *content =3D vvmcs;<br>
<br>
While there, would you mind changing u64 to uint64_t? (here and<br>
above)<br></blockquote><div><br></div><div>I&#39;ll do that in the next ver=
sion.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int offset;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 u64 res;<br>
&gt;=C2=A0 <br>
&gt; diff --git a/xen/arch/x86/mm/p2m-pt.c b/xen/arch/x86/mm/p2m-pt.c<br>
&gt; index eb66077496..058b9b8adf 100644<br>
&gt; --- a/xen/arch/x86/mm/p2m-pt.c<br>
&gt; +++ b/xen/arch/x86/mm/p2m-pt.c<br>
&gt; @@ -127,7 +127,7 @@ p2m_find_entry(void *table, unsigned long *gfn_rem=
ainder,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return NULL;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 *gfn_remainder &amp;=3D (1 &lt;&lt; shift) - 1;<br=
>
&gt; -=C2=A0 =C2=A0 return (l1_pgentry_t *)table + index;<br>
&gt; +=C2=A0 =C2=A0 return table + index;<br>
<br>
I don&#39;t think removing this cast is correct, as you would be doing a<br=
>
plain addition to a pointer instead of fetching the next entry in the<br>
array of l1_pgentry_t entries.<br>
<br>
If you want to get rid of the cast here you need to change the type of<br>
the table parameter to l1_pgentry_t * instead of void *.<br></blockquote><d=
iv><br></div><div>Yes, you are correct. Since <code>void*</code> is a point=
er to an unknown type we can&#39;t do pointer arithmetic on it, as the comp=
iler wouldn&#39;t know how big the thing pointed to is. Thus, it is necessa=
ry to keep the cast on the &quot;table&quot;.</div><div><br></div><div>Ah! =
I am sorry for this mistake. But, I am afraid why I didn&#39;t get warning =
during compilation.</div><div>I&#39;ll remove these changes in the next ver=
sion.</div><div><br></div><div>Thanks</div><div>Simran<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks, Roger.<br>
</blockquote></div></div>

--000000000000b9424905a1e9332a--

