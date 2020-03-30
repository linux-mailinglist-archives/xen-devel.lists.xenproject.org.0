Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F6F197A0C
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 13:00:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIs6w-00036n-Sq; Mon, 30 Mar 2020 10:57:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3hNz=5P=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIs6v-00036i-KH
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:57:41 +0000
X-Inumbo-ID: 462339ac-7275-11ea-b4f4-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 462339ac-7275-11ea-b4f4-bc764e2007e4;
 Mon, 30 Mar 2020 10:57:40 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id w1so17523176ljh.5
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2020 03:57:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gJt7uxDhIBR4Fuv3felNqSEsjf85quE7hjZtE+RREtE=;
 b=kXeSP0QFPD+r3JmeH0DsdRQHju6AGu+HO9Y3V9jac/Kz3eqBQa8/o27+ETkyXiIArX
 P50D8yiE8rP5ZQ+6QYJ8wA3t1UD+2CWP3BFesLB9KFbZggtw1USy1AfxSOvl0g2Vz/+x
 xwVKnvjNSZ0R+180cSgRZ+w8pnCsc692lV2JYLH4bz3SOYPrMUbZIXO5aQxvf1LmaHBM
 /tkZ5S9NSYbZRld74K0boV9ij12ZXbWYmOPU8U7Q42k9+dhXlDmrAiX7O97IpD0AdFLa
 IDZe2lgwdgp5nbJIGCDWfuRkwxHReOhF8q/DQAvwCyZRuFkJLq6finNN0rxEY4GIpNZr
 vItw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gJt7uxDhIBR4Fuv3felNqSEsjf85quE7hjZtE+RREtE=;
 b=hj56VhjNJeIeHeMv8XZFLMFOnh9POYHViSOuNuEmfal52ShCyv6zUmtWTWYSKt+Ezv
 OYeCT6P6QSD7HXWBwAIxsiDWynbbc8+Sgl526BWqnVWHnDQdHqbbusz0kABilx66S/6a
 yrq3LhqHsobAyou77MidcfonHqhoa3kuFhq8YvtPI6yP8b7DCvby2klOEHChyxR6FGpt
 hqNSTjQH4Ciyhi2mvb1OO5sqcR67ilrBwGSu8KqPw5Wts0ehcumtpN4TTzNwS+Y/vwF3
 DXcTPuYppO+Xr+EvQ+hPTF/bWmqcEin2QulKWq0z9hwY0ApvQvMtDt7tyMXnmBtfz47T
 vdgQ==
X-Gm-Message-State: AGi0Pubw3KyhW8lTg+mSSZpJMTDfDII9wd4OL0EpWYLQT/EWpdss8WW/
 LD8WXwfiFhDmztOFxKyqok59NDAbYIy32ghjWdE=
X-Google-Smtp-Source: APiQypIrhUB/jonl4MXcdmgYDZxrXGkYnw8adx20f1N9xbuYx3J8GJ0o8b94BCcz26xcrMWgswEQ6x7FtbC+uOjwQ2s=
X-Received: by 2002:a2e:8502:: with SMTP id j2mr938569lji.169.1585565859651;
 Mon, 30 Mar 2020 03:57:39 -0700 (PDT)
MIME-Version: 1.0
References: <20200329045512.GA28203@simran-Inspiron-5558>
 <20200330101113.GP28601@Air-de-Roger>
In-Reply-To: <20200330101113.GP28601@Air-de-Roger>
From: Simran Singhal <singhalsimran0@gmail.com>
Date: Mon, 30 Mar 2020 16:27:26 +0530
Message-ID: <CALrZqyMTwz08-_zqW=H1WJbtsba3SRq6WKwCkomyEbD2n8=mfw@mail.gmail.com>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Content-Type: multipart/alternative; boundary="000000000000d5225f05a21051fe"
Subject: Re: [Xen-devel] [PATCH v2] xen/x86: Remove unnecessary cast on void
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
 Jun Nakajima <jun.nakajima@intel.com>, xen-devel@lists.xenproject.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--000000000000d5225f05a21051fe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 30, 2020 at 3:41 PM Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
wrote:

> On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:
> > diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c
> > index f049920196..2edb103205 100644
> > --- a/xen/arch/x86/hvm/vmx/vvmx.c
> > +++ b/xen/arch/x86/hvm/vmx/vvmx.c
> > @@ -253,12 +253,12 @@ static int vvmcs_offset(u32 width, u32 type, u32
> index)
> >      return offset;
> >  }
> >
> > -u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)
> > +uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)
> >  {
> >      union vmcs_encoding enc;
> > -    u64 *content =3D (u64 *) vvmcs;
> > +    uint64_t *content =3D vvmcs;
> >      int offset;
> > -    u64 res;
> > +    uint64_t res;
> >
> >      enc.word =3D vmcs_encoding;
> >      offset =3D vvmcs_offset(enc.width, enc.type, enc.index);
> > @@ -307,12 +307,12 @@ enum vmx_insn_errno get_vvmcs_real_safe(const
> struct vcpu *v, u32 encoding,
> >      return virtual_vmcs_vmread_safe(v, encoding, val);
> >  }
> >
> > -void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)
> > +void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t
> val)
> >  {
> >      union vmcs_encoding enc;
> > -    u64 *content =3D (u64 *) vvmcs;
> > +    uint64_t *content =3D vvmcs;
> >      int offset;
> > -    u64 res;
> > +    uint64_t res;
>
> Thanks for doing the switch of content to type uint64_t. You should
> however not change the type of res to uint64_t also IMO, as you are
> not touching that line anyway.
>

Thanks for your feedback Roger and Wei.
My bad, I thought I need to change all the unintX to uintX_t in the functio=
n
set_vvmcs_virtual().

Sorry for the inconvenience.


>
> With that fixed:
>
> Reviewed-by: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
>
> Thanks!
>

--000000000000d5225f05a21051fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 30, 2020 at 3:41 PM Roger=
 Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.com">roger.pau@citri=
x.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">On Sun, Mar 29, 2020 at 10:25:12AM +0530, Simran Singhal wrote:<br>
&gt; diff --git a/xen/arch/x86/hvm/vmx/vvmx.c b/xen/arch/x86/hvm/vmx/vvmx.c=
<br>
&gt; index f049920196..2edb103205 100644<br>
&gt; --- a/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; +++ b/xen/arch/x86/hvm/vmx/vvmx.c<br>
&gt; @@ -253,12 +253,12 @@ static int vvmcs_offset(u32 width, u32 type, u32=
 index)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return offset;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -u64 get_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding)<br>
&gt; +uint64_t get_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union vmcs_encoding enc;<br>
&gt; -=C2=A0 =C2=A0 u64 *content =3D (u64 *) vvmcs;<br>
&gt; +=C2=A0 =C2=A0 uint64_t *content =3D vvmcs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int offset;<br>
&gt; -=C2=A0 =C2=A0 u64 res;<br>
&gt; +=C2=A0 =C2=A0 uint64_t res;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 enc.word =3D vmcs_encoding;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 offset =3D vvmcs_offset(enc.width, enc.type, enc.i=
ndex);<br>
&gt; @@ -307,12 +307,12 @@ enum vmx_insn_errno get_vvmcs_real_safe(const st=
ruct vcpu *v, u32 encoding,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 return virtual_vmcs_vmread_safe(v, encoding, val);=
<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; -void set_vvmcs_virtual(void *vvmcs, u32 vmcs_encoding, u64 val)<br>
&gt; +void set_vvmcs_virtual(void *vvmcs, uint32_t vmcs_encoding, uint64_t =
val)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 union vmcs_encoding enc;<br>
&gt; -=C2=A0 =C2=A0 u64 *content =3D (u64 *) vvmcs;<br>
&gt; +=C2=A0 =C2=A0 uint64_t *content =3D vvmcs;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int offset;<br>
&gt; -=C2=A0 =C2=A0 u64 res;<br>
&gt; +=C2=A0 =C2=A0 uint64_t res;<br>
<br>
Thanks for doing the switch of content to type uint64_t. You should<br>
however not change the type of res to uint64_t also IMO, as you are<br>
not touching that line anyway.<br></blockquote><div><br></div><div>Thanks f=
or your feedback Roger and Wei.</div><div>My bad, I thought I need to chang=
e all the unintX to uintX_t in the function</div><div>set_vvmcs_virtual().<=
/div><div><br></div><div>Sorry for the inconvenience.<br></div><div>=C2=A0<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
With that fixed:<br>
<br>
Reviewed-by: Roger Pau Monn=C3=A9 &lt;<a href=3D"mailto:roger.pau@citrix.co=
m" target=3D"_blank">roger.pau@citrix.com</a>&gt;<br>
<br>
Thanks!<br>
</blockquote></div></div>

--000000000000d5225f05a21051fe--

