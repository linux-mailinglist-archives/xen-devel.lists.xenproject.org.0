Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B29C13C853
	for <lists+xen-devel@lfdr.de>; Wed, 15 Jan 2020 16:50:01 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1irksN-0008Kh-8T; Wed, 15 Jan 2020 15:46:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=FWRo=3E=gmail.com=madhuparnabhowmik04@srs-us1.protection.inumbo.net>)
 id 1irksL-0008Kc-U6
 for xen-devel@lists.xenproject.org; Wed, 15 Jan 2020 15:46:33 +0000
X-Inumbo-ID: 34594ae2-37ae-11ea-a985-bc764e2007e4
Received: from mail-oi1-x241.google.com (unknown [2607:f8b0:4864:20::241])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 34594ae2-37ae-11ea-a985-bc764e2007e4;
 Wed, 15 Jan 2020 15:46:33 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id d62so15751923oia.11
 for <xen-devel@lists.xenproject.org>; Wed, 15 Jan 2020 07:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8/BollNXFyqT/cepZYeE+wLWDM3dv1lO6PKhmKCFjP0=;
 b=AjsV29LTZILt+Wi6pF8lx8pQGcAjahEeD+b/nX3OlPUmbm9vpq3DxwuMAEoqab3oYn
 ZH/XJxFWed5LpRdLiMWm1Z7Yy5CdDcuD24HNKvDq9ATEkzDUuhSnLAh/WixOZ63hLss6
 wzmW3OEKsmoaRmkJlodPsG96aokJxmN0G3xs24NlcZXTuTb72iyp4uznqkeIDk2zuxj5
 XNa96XzGdulksUS2EW5wJrp6zqjSE9OuqCU21JFH+YoylZgOA+0XvdWotYm9bOy/Pz/7
 Di410upJv7hYDpEFTwCOInlT4qbDWMCK/zYkV4d0wmEArNyS6SkT2ST0gedArukDAmB+
 OyYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8/BollNXFyqT/cepZYeE+wLWDM3dv1lO6PKhmKCFjP0=;
 b=gomIbzbsVLUbdM1J4x9SUYfiF7R7b22O8cbuUrQpxHdAaH1JN2q1DZPIUL+y5I9Qbb
 /BZ3WGKDR2j4ud+zQ5xkKlwXAHvkxmJaO0EIW5jmq8MrPSnB9mQLyqNuNnGYWPFGeLtJ
 EJSTPuVR6Bdn4N9iZVapPysO+rjo4cou0JDQPAupNGa3pfDwqXtg33jNnE3Wnhtt8Su6
 K8ZgWHKLQsxWy/Ac+qDs7BPQxWR2gZZt3d8tvQWuw0ql5sDMRqJayZCSzeDosSCR6WY1
 fwOPFIMK7H8EtbzoTXsk8kVFAFFuntK94FR3My36Nmn/2kMZq2WxjE6BrQrlwYM3Vz5y
 TCWw==
X-Gm-Message-State: APjAAAW40jtNEhGkhxc+e8joLnGGs0wqXjHU4JQqV0iKRPVCcsJlbell
 anuSg1UG77ox1qUq8+XO54m5sGi7Aq/3hSnAYvU=
X-Google-Smtp-Source: APXvYqwmCRvE84KFxCeMh/0IWweVxJ39fvDwNnbs2brPjIzOv2tB+1J13V3lQAmGQ+5mfIDXLyHm5vV4h7MTg1C1rUA=
X-Received: by 2002:a05:6808:658:: with SMTP id
 z24mr296168oih.91.1579103192495; 
 Wed, 15 Jan 2020 07:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20200115124129.5684-1-madhuparnabhowmik04@gmail.com>
 <20200115135631.edr2nrfkycppxcku@debian>
 <CAF65HP0q_KcrUP_50JxZL1xNc47=detHvdOzjBmuiqUtB3AwfA@mail.gmail.com>
 <20200115150426.svapzpux2tbbgvmn@debian>
In-Reply-To: <20200115150426.svapzpux2tbbgvmn@debian>
From: Madhuparna Bhowmik <madhuparnabhowmik04@gmail.com>
Date: Wed, 15 Jan 2020 21:16:21 +0530
Message-ID: <CAF65HP2gnDYud99DY51JMXGKaNUC5JNZgPWB8bgno+gjoVffvA@mail.gmail.com>
To: Wei Liu <wei.liu@kernel.org>
Subject: Re: [Xen-devel] [PATCH] net: xen-netbank: hash.c: Use built-in RCU
 list checking
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>, paul@xen.org,
 netdev@vger.kernel.org, Amol Grover <frextrite@gmail.com>,
 linux-kernel@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 xen-devel@lists.xenproject.org, linux-kernel-mentees@lists.linuxfoundation.org,
 davem@davemloft.net
Content-Type: multipart/mixed; boundary="===============7302355986954229554=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7302355986954229554==
Content-Type: multipart/alternative; boundary="000000000000da3b89059c2f9cc3"

--000000000000da3b89059c2f9cc3
Content-Type: text/plain; charset="UTF-8"

On Wed, Jan 15, 2020 at 8:34 PM Wei Liu <wei.liu@kernel.org> wrote:

> On Wed, Jan 15, 2020 at 07:36:38PM +0530, Madhuparna Bhowmik wrote:
> [...]
> >
> > > The surrounding code makes it pretty clear that the lock is already
> held
> > > by the time list_for_each_entry_rcu is called, yet the checking
> involved
> > > in lockdep_is_held is not trivial, so I'm afraid I don't consider this
> a
> > > strict improvement over the existing code.
> > >
> > > Actually,  we want to make CONFIG_PROVE_LIST_RCU enabled by default.
>
> I think you meant CONFIG_PROVE_RCU_LIST.
>
> I am sorry about this. Yes, I meant  CONFIG_PROVE_RCU_LIST.

> And if the cond argument is not passed when the usage of
> > list_for_each_entry_rcu()
> > is outside of rcu_read_lock(), it will lead to a false positive.
> > Therefore, I think this patch is required.
>
> Fair enough.
>
> Thank you,
Madhuparna


> Wei.
>

--000000000000da3b89059c2f9cc3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan 15, 2020 at 8:34 PM Wei L=
iu &lt;<a href=3D"mailto:wei.liu@kernel.org">wei.liu@kernel.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Jan =
15, 2020 at 07:36:38PM +0530, Madhuparna Bhowmik wrote:<br>
[...]<br>
&gt; <br>
&gt; &gt; The surrounding code makes it pretty clear that the lock is alrea=
dy held<br>
&gt; &gt; by the time list_for_each_entry_rcu is called, yet the checking i=
nvolved<br>
&gt; &gt; in lockdep_is_held is not trivial, so I&#39;m afraid I don&#39;t =
consider this a<br>
&gt; &gt; strict improvement over the existing code.<br>
&gt; &gt;<br>
&gt; &gt; Actually,=C2=A0 we want to make CONFIG_PROVE_LIST_RCU enabled by =
default.<br>
<br>
I think you meant CONFIG_PROVE_RCU_LIST.<br>
<br></blockquote><div>I am sorry about this. Yes, I meant=C2=A0=C2=A0CONFIG=
_PROVE_RCU_LIST.</div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
&gt; And if the cond argument is not passed when the usage of<br>
&gt; list_for_each_entry_rcu()<br>
&gt; is outside of rcu_read_lock(), it will lead to a false positive.<br>
&gt; Therefore, I think this patch is required.<br>
<br>
Fair enough.<br>
<br></blockquote><div>Thank you,</div><div>Madhuparna</div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
Wei.<br>
</blockquote></div></div>

--000000000000da3b89059c2f9cc3--


--===============7302355986954229554==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7302355986954229554==--

