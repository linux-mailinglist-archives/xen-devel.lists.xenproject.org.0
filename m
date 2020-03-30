Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA97D197ABA
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 13:31:44 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIsas-0005xL-8P; Mon, 30 Mar 2020 11:28:38 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=3hNz=5P=gmail.com=singhalsimran0@srs-us1.protection.inumbo.net>)
 id 1jIsaq-0005xG-CQ
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 11:28:36 +0000
X-Inumbo-ID: 9796437a-7279-11ea-9e09-bc764e2007e4
Received: from mail-lj1-x244.google.com (unknown [2a00:1450:4864:20::244])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9796437a-7279-11ea-9e09-bc764e2007e4;
 Mon, 30 Mar 2020 11:28:35 +0000 (UTC)
Received: by mail-lj1-x244.google.com with SMTP id r7so9968635ljg.13
 for <xen-devel@lists.xenproject.org>; Mon, 30 Mar 2020 04:28:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1ZwBKSU1juBKx4YPmtcbdFn7oKsd3ZEl3Xygh8+GRbE=;
 b=QLd8DcTCFCdwpedyXHlabUmuzDpuCMNwHSlP/+f8F7gZ0qXufcfViQfOOZKPGzMe5U
 WRfd9LUYB9MnwQfzJc5SMhXtDCNjX2npiz0iFBrWMKEI7pJ9eQxkpgiyUPMsJOAnGD8i
 jzN+/jvxlaiiC413LZk+u01KldBAnCKIJ6NoVYnj1S15dNGJNpzx9yY5+ygb6qZM2FkR
 7Azi2h/IFDIo9FzXMk1ClNKkRBZJU3+DN9w1e4hL5GNkymrnLAXky6cJP5+ul0uR/3HR
 B7Q4XpD3WIPkis35G/AEC7YIjB9s167F2medov2NJW+13cbdrcsHNJl8vDGsSyndUL0k
 bVxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1ZwBKSU1juBKx4YPmtcbdFn7oKsd3ZEl3Xygh8+GRbE=;
 b=oxk2jolpECmx8GuH9YO6Xm4nxFwSNLEAm1CrDTU5qc0M5fr3AoiMX+F/VKHkHUlf65
 7AU2Ml+HUYHnx+C8JAMmTyEv6Pr9mrrVoEg230wTcO08CdcnvHG7qsvh0VhcVVq23R2Z
 dWi2VQ2bDZ64zHCcJ1NtN0OL7LUW/UHtgbxAuhUNX5sbEsQfUKji5okhF3GWASx0arid
 uN2chiJ0a4M7wfLC4L5UvojyprZG5Q2AQ7GVRnsjXiCA74SX/+zVY75VABy7t6AnN9EI
 YctuUA0EXrFkxE7V328Q/bkxQnyviW3rAk5+MOT0JnFzo0Hb/0rxu2r7lhXuXhKEykoY
 zU4w==
X-Gm-Message-State: AGi0PuaeXzdWbLqtM4yR3OfneNiGrdvflz4xRs+Fpmbdy1fYS2Oisg+W
 ZXmezaAzzDQLpyeVf0+deXKt4r+GaHmpGKJGTyppEUE8
X-Google-Smtp-Source: APiQypLoCVaAW4DjsQF2BwOiXi0yBdS/masadYjE8xDvJq6ajd8u2nihe7v0lWD8n7LV+NZhfSOnVRs1BAiyP2vyMHo=
X-Received: by 2002:a2e:b52f:: with SMTP id z15mr6854989ljm.38.1585567714255; 
 Mon, 30 Mar 2020 04:28:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200329061608.GA29651@simran-Inspiron-5558>
 <20200329134657.zdbanqkhzmtmurue@debian>
In-Reply-To: <20200329134657.zdbanqkhzmtmurue@debian>
From: Simran Singhal <singhalsimran0@gmail.com>
Date: Mon, 30 Mar 2020 16:58:19 +0530
Message-ID: <CALrZqyPD_MZu0N9XmCfhpmmH9gckJwAxK_6Bux2moMuDeidLeg@mail.gmail.com>
To: Wei Liu <wl@xen.org>
Content-Type: multipart/alternative; boundary="00000000000060298405a210c07a"
Subject: Re: [Xen-devel] [PATCH] xen/x86: Compress lines for immediate return
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
Cc: xen-devel@lists.xenproject.org,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000060298405a210c07a
Content-Type: text/plain; charset="UTF-8"

On Sun, Mar 29, 2020 at 7:17 PM Wei Liu <wl@xen.org> wrote:

> On Sun, Mar 29, 2020 at 11:46:08AM +0530, Simran Singhal wrote:
> > diff --git a/xen/arch/x86/oprofile/op_model_athlon.c
> b/xen/arch/x86/oprofile/op_model_athlon.c
> > index 5c48f868ae..2bc0d04a1f 100644
> > --- a/xen/arch/x86/oprofile/op_model_athlon.c
> > +++ b/xen/arch/x86/oprofile/op_model_athlon.c
> > @@ -343,9 +343,8 @@ static int athlon_check_ctrs(unsigned int const cpu,
> >               }
> >       }
> >
> > -     ovf = handle_ibs(mode, regs);
> >       /* See op_model_ppro.c */
> > -     return ovf;
> > +     return handle_ibs(mode, regs);
>
> Hmm... ovf can potentially be set in the for loop before this hunk, but
> then immediately get overwritten by the function call. I bet the ovf = 1
> line is the reason why you didn't remove ovf out right.
>
> I think you can perhaps just remove ovf here. It would make any
> difference logically.
>
> Other changes look correct to me.
>

Thanks for your feedback.
Ah! I agree on "ovf = 1" is the reason I decided to leave ovf as it is.
I'll remove ovf now and send the new version of this patch.

Thanks
Simran


>
> Wei.
>

--00000000000060298405a210c07a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Mar 29, 2020 at 7:17 PM Wei L=
iu &lt;<a href=3D"mailto:wl@xen.org">wl@xen.org</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Sun, Mar 29, 2020 at 11:4=
6:08AM +0530, Simran Singhal wrote:<br>
&gt; diff --git a/xen/arch/x86/oprofile/op_model_athlon.c b/xen/arch/x86/op=
rofile/op_model_athlon.c<br>
&gt; index 5c48f868ae..2bc0d04a1f 100644<br>
&gt; --- a/xen/arch/x86/oprofile/op_model_athlon.c<br>
&gt; +++ b/xen/arch/x86/oprofile/op_model_athlon.c<br>
&gt; @@ -343,9 +343,8 @@ static int athlon_check_ctrs(unsigned int const cp=
u,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
&gt;=C2=A0 <br>
&gt; -=C2=A0 =C2=A0 =C2=A0ovf =3D handle_ibs(mode, regs);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0/* See op_model_ppro.c */<br>
&gt; -=C2=A0 =C2=A0 =C2=A0return ovf;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return handle_ibs(mode, regs);<br>
<br>
Hmm... ovf can potentially be set in the for loop before this hunk, but<br>
then immediately get overwritten by the function call. I bet the ovf =3D 1<=
br>
line is the reason why you didn&#39;t remove ovf out right.<br>
<br>
I think you can perhaps just remove ovf here. It would make any<br>
difference logically.<br>
<br>
Other changes look correct to me.<br></blockquote><div><br></div><div>Thank=
s for your feedback.<br></div><div>Ah! I agree on &quot;ovf =3D 1&quot; is =
the reason I decided to leave ovf as it is.</div><div>I&#39;ll remove ovf n=
ow and send the new version of this patch.</div><div><br></div><div>Thanks<=
/div><div>Simran<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Wei.<br>
</blockquote></div></div>

--00000000000060298405a210c07a--

