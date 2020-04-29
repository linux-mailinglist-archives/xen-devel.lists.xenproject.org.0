Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 508A01BE539
	for <lists+xen-devel@lfdr.de>; Wed, 29 Apr 2020 19:29:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jTqVz-0001Ak-AN; Wed, 29 Apr 2020 17:28:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PJZR=6N=gmail.com=ayushdosaj2313@srs-us1.protection.inumbo.net>)
 id 1jTqVx-0001Af-Qj
 for xen-devel@lists.xen.org; Wed, 29 Apr 2020 17:28:53 +0000
X-Inumbo-ID: e5662e94-8a3e-11ea-ae69-bc764e2007e4
Received: from mail-oi1-x22b.google.com (unknown [2607:f8b0:4864:20::22b])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id e5662e94-8a3e-11ea-ae69-bc764e2007e4;
 Wed, 29 Apr 2020 17:28:53 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id q204so2500861oia.13
 for <xen-devel@lists.xen.org>; Wed, 29 Apr 2020 10:28:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4U+CbPsYJzZOuV7fYM3/9Vnh9J75q+MjwFmxdff0SVU=;
 b=Apt0ngunMXGwlSy6/ECTZZ7YElz/d2VZxWkKVarABAmzeibDDAFAu6/b26NUGygYDG
 hsWOfbjv8m6w8TN9L+27KbU7JsgTSg6Um0ytXqJMjwciwhzonlfQu/3tP9XecTDLenX4
 enedlEtI60vLbXF1Q0qjNnx5EmuBjS6yRWdZC+t5lSmw7pI6DgESJ+BrVha7I70ZpgPE
 8lQIEkcQSwBJYLmniYTYRfq+FOqTO5vpg/unlW9N0XhIESMg6p90a+1ZnL030tB73qYf
 /TpPpz8YzidLVy9yvyx1o5sNEj3YhxcQQanH1vMRcCCkasoKb6n1Uh93OMcb6F+6eBe3
 clGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4U+CbPsYJzZOuV7fYM3/9Vnh9J75q+MjwFmxdff0SVU=;
 b=etTcP3yaFt3szIsUgRJkwC5N4qWgeoztGfXR8c81vH58s1JIbilhHVqgoATnLVPec4
 4HsmSZSLhRRXwjfP5Qmuvkezg7CV0Vqv29VOhPUNpihkEo/QrdF6MNZoO9VJ+7YoSqlw
 vUAVfPQIAnIVWU/i1dXt/acu3FGnT4Pcpmc768noj+sUFrd/6FTNpfAOVPwtTAWlG8ui
 vUmbSS1c1Ux2XReabXx0wM4Oqrc0PwTO3j2DoP0XjBOrv+JlsOUUi+9YagR5Nn82lrSr
 mVCv7NcI5lWWPHyzzUZeaa1c5Jx5nxkL174KDHhwbNvZxPRTNHl0v57kD7V8tx6wyvjS
 /7iw==
X-Gm-Message-State: AGi0PubVDepQhN1t497EXq7TlDOI04gl7mheP8jQIlb01TuI1jMnXQz2
 gSUHc4AffCbA17cn2VVWgb9wiTxAMUyxRvm5saE=
X-Google-Smtp-Source: APiQypI/wTBxHfkvThL9OCVtbTfg8EslNNNt0NdZAFXDdjTIgwP5R45MglsVHbC2c3242PZmPgi2VW23EEog59Tjj80=
X-Received: by 2002:aca:4bc2:: with SMTP id y185mr2380206oia.164.1588181332450; 
 Wed, 29 Apr 2020 10:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAOCxVi0s5X+=Hug2_M-AyXvYpiwqfkf7G2Y66kp44MQ-xgO+KA@mail.gmail.com>
 <e92bb8ab-3dd2-bb19-d524-d78279f9508a@citrix.com>
In-Reply-To: <e92bb8ab-3dd2-bb19-d524-d78279f9508a@citrix.com>
From: Ayush Dosaj <ayushdosaj2313@gmail.com>
Date: Wed, 29 Apr 2020 22:58:40 +0530
Message-ID: <CAOCxVi1PWM_9t03f=_qn0PXkKB1gN4504h+ijMpwqGU9VpR48g@mail.gmail.com>
Subject: Re: Xen Compilation Error on Ubuntu 20.04
To: Andrew Cooper <andrew.cooper3@citrix.com>
Content-Type: multipart/alternative; boundary="00000000000028e2e905a47148af"
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xen.org
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--00000000000028e2e905a47148af
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Awesome, thanks!

On Wed, Apr 29, 2020 at 10:55 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 29/04/2020 18:17, Ayush Dosaj wrote:
> > Hi Xen development team,
> >
> > I am Ayush. I compiled Xen Hypervisor from source on Ubuntu 20.04
> > machine running on an intel-i9 CPU.
> > I am getting compilation error due to the following two flags.
> > Error: error: =E2=80=98-mindirect-branch=E2=80=99 and =E2=80=98-fcf-pro=
tection=E2=80=99 are not
> compatible.
> >
> > Complete Error logs can be found at
> https://paste.ubuntu.com/p/xvvyPnhW5c/
> >
> > And when I compiled Xen commenting the two flags in Rules.mk file, it
> > compiles and installs properly but on boot-up i see a blank black scree=
n
> > and i am stuck there.
>
> That is a GCC bug (these options are actually fine in combination).  It
> got fixed earlier today in master, and backported for GCC 9.4
>
> You can work around it by appending -fcf-protection=3Dnone to CFLAGS
>
> I wouldn't try editing the logic around -mindirect-branch, as that is
> related to retpoline safety for Spectre v2, and probably relies on the
> build matching the code.
>
> ~Andrew
>


--=20
Ayush Dosaj
VIT Vellore

--00000000000028e2e905a47148af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif;font-size:small">Awesome, thanks! <br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr =
29, 2020 at 10:55 PM Andrew Cooper &lt;<a href=3D"mailto:andrew.cooper3@cit=
rix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On 29/04/2020 18:17, Ayush Dosaj wrote:<b=
r>
&gt; Hi Xen development team,<br>
&gt; <br>
&gt; I am Ayush. I compiled Xen Hypervisor from source on Ubuntu 20.04<br>
&gt; machine running on an intel-i9 CPU.<br>
&gt; I am getting compilation error due to the following two flags.<br>
&gt; Error: error: =E2=80=98-mindirect-branch=E2=80=99 and =E2=80=98-fcf-pr=
otection=E2=80=99 are not compatible.<br>
&gt; <br>
&gt; Complete Error logs can be found at <a href=3D"https://paste.ubuntu.co=
m/p/xvvyPnhW5c/" rel=3D"noreferrer" target=3D"_blank">https://paste.ubuntu.=
com/p/xvvyPnhW5c/</a><br>
&gt; <br>
&gt; And when I compiled Xen commenting the two flags in Rules.mk file, it<=
br>
&gt; compiles and installs properly but on boot-up i see a blank black scre=
en<br>
&gt; and i am stuck there.<br>
<br>
That is a GCC bug (these options are actually fine in combination).=C2=A0 I=
t<br>
got fixed earlier today in master, and backported for GCC 9.4<br>
<br>
You can work around it by appending -fcf-protection=3Dnone to CFLAGS<br>
<br>
I wouldn&#39;t try editing the logic around -mindirect-branch, as that is<b=
r>
related to retpoline safety for Spectre v2, and probably relies on the<br>
build matching the code.<br>
<br>
~Andrew<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div style=3D"text-a=
lign:left"><div style=3D"font-family:arial,helvetica,sans-serif">Ayush Dosa=
j</div><div style=3D"font-family:arial,helvetica,sans-serif">VIT Vellore</d=
iv><div><br></div></div></div></div></div></div>

--00000000000028e2e905a47148af--

