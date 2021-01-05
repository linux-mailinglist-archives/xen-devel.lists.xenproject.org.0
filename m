Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 660E82EA922
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 11:49:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.61795.108864 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjtA-0000hW-0M; Tue, 05 Jan 2021 10:48:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 61795.108864; Tue, 05 Jan 2021 10:48:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwjt9-0000h7-Sz; Tue, 05 Jan 2021 10:48:31 +0000
Received: by outflank-mailman (input) for mailman id 61795;
 Tue, 05 Jan 2021 10:48:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=zF08=GI=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1kwjt8-0000h2-42
 for xen-devel@lists.xen.org; Tue, 05 Jan 2021 10:48:30 +0000
Received: from mail-wr1-x429.google.com (unknown [2a00:1450:4864:20::429])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 35f8978d-86dc-4cff-ad4f-66f740976d2c;
 Tue, 05 Jan 2021 10:48:28 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id w5so35656201wrm.11
 for <xen-devel@lists.xen.org>; Tue, 05 Jan 2021 02:48:28 -0800 (PST)
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
X-Inumbo-ID: 35f8978d-86dc-4cff-ad4f-66f740976d2c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B4s1wqZUNwFqLwZb2O7OPQ2QFx6FMKbC+mk48XPWiZ8=;
        b=Ncy06VpGh/JW6GEn1Hr/nrundZqlVeOedPY9c53dtyWxLiwcHocizp3vfFYf9r5CzP
         GxT6wLq+JGL4MwBmAQZld6c6EN0dHgyLmeeOmcpp0VGCPh7ZugImAMJYTcKVOTTdXwoT
         zwlq5T/SVNvFncv83Gq7dROrvQ9RjjGdIKs0EC8mKVCmcTN7xXSOXtp0wTaRnrAO1iP4
         NbldUKTMQtfrxV+6JTAtn9WHP++FAo36sp/1KFlJ5TlnsuPoFbDUbwKFC+9/mo0GX5IU
         ekWjxTJEj17/zSc9QoEseASyNHftF7YirTd1uiivvvAZMCzRdh2AAMLtkubMbutyhpzi
         67iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B4s1wqZUNwFqLwZb2O7OPQ2QFx6FMKbC+mk48XPWiZ8=;
        b=lvSGKtjFJI4fuUgmfzXvasfjt3rqdHQUei4nvHaHUyoY/2LhQLno822K63+7bf/0H9
         jurLDKMZadPVbk3H8mYukN9z2mNs7xkyijzUpslzZsj22piijdZ+Pjg7D6LuuDkg0Odj
         ZJ6YUlMDoikuH8nGXxM7sYqTOdQuexzUfTMkWs88EaZyYFTE7uMRdKiAQmNp25lvpwRZ
         MOs6K+N+7qhi+O7tJ6GVpa55QxdX6SwaABLyIBKgcCcyLnlDLaULOPhJJZDGkYGFLKiO
         ij51S8FCi6+lKVJKRe5gm9dlfFPKIhpYaTt2KCwuz/eoP0JuY5uhQFVVe/XTYRfDr5px
         ba0Q==
X-Gm-Message-State: AOAM532saaOk/qqaqGif9FIRp2gtIU9Z8qz3wbCCqWD9uVZfghgiqmRE
	xoAVu4/MyTky2byVwmap4GpN0yTAZzzOQwVo0rU=
X-Google-Smtp-Source: ABdhPJyw8+zQTWAbidBwMByylF9CV1UctbPIONG2a/9JPbsQcTo+2TeJ73JTlfEEi5WzPSaHwpKeybvGHh2lh8Wt67E=
X-Received: by 2002:a5d:62c7:: with SMTP id o7mr32001733wrv.257.1609843708067;
 Tue, 05 Jan 2021 02:48:28 -0800 (PST)
MIME-Version: 1.0
References: <CAAQRGoBko2ksX7s_DvbwK5L82-tLz0YXsV0vqfToZHeODJBtbQ@mail.gmail.com>
 <21be2d74-a1d9-176f-70fb-7f86724a965b@citrix.com> <CAAQRGoDcTxDyQh_2gES6L7wEEn8YES0MHp4zS5mLhhjC5j0w5g@mail.gmail.com>
 <a415871e-9f90-6beb-55b0-5cf9c9656dd1@citrix.com>
In-Reply-To: <a415871e-9f90-6beb-55b0-5cf9c9656dd1@citrix.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Tue, 5 Jan 2021 10:47:54 +0000
Message-ID: <CAAQRGoCPdoGf+dQPcTpyLCid24wAJMRxq83YaQ0OY_jW+4GFog@mail.gmail.com>
Subject: Re: Identify an specific DomU inpecting all pages in memory
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="0000000000005d00ec05b824f277"

--0000000000005d00ec05b824f277
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks Andrew,

I'll certainly follow your suggestion of getting used to coding into Xen
context.
I've just got started programming into Xen, and this will be crucial to my
goal.

Right now, my approach to detect a dom0 memory page is to walk across all
pages in memory and identify one that holds an unspecific start_info
struct, and then check the SIF_INITDOMAIN.
If I had a way to identify which domU this unspecific page referee to from
this data structure, it will ease the work.



Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *




On Mon, Jan 4, 2021 at 6:18 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 02/01/2021 19:20, Charles Gon=C3=A7alves wrote:
> > Sure.
> >
> > The goal is to emulate a scenario where a compromised guest attacks
> > another
> > tenant in the same physical host reading/changing the memory content.
> > E.g., extract the RSA key.
> >
> > I'll be in the domU kernel space. I'm assuming that the guest is able
> > to exploit
> > any vulnerability possible.
> > Effectively I'll be changing Xen's code (at least possible) to
> > *emulate* a vulnerability
> > (e.g., undo a patch).
>
> Ok, so in this scenario, you've successfully exploited a privilege
> escalation vulnerability in Xen and obtained code execution in
> hypervisor context.  There are some security fixes to choose to revert
> for this purpose, but none I'm aware of which will make the attack
> payload trivial to pull off.
>
> However, I'd suggest that you first try writing a new hypercall to do
> what you want, so you can get used to coding in Xen context, before
> adding the complexity of trying to retrofit it into an attack payload.
>
> If you've already got code with works for dom0, I presume you're keying
> off the hardware_domain pointer?  Either way, you can look at the
> for_each_domain() construct for how to walk the domain list, or
> get_domain_by_id() for how to use the hashtable to look up a domain by
> its domid.
>
> ~Andrew
>

--0000000000005d00ec05b824f277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks Andrew,=C2=A0<div><br></div><div>I&#39;ll certainly=
 follow your suggestion of getting used to coding into Xen context.</div><d=
iv>I&#39;ve just got started programming into Xen, and this will be crucial=
 to my goal.</div><div><br></div><div>Right now, my approach to detect a do=
m0 memory page is to walk across all pages in memory and identify one that =
holds an unspecific start_info struct, and then check the SIF_INITDOMAIN.</=
div><div>If I had a way to identify which domU this unspecific page referee=
=C2=A0to from this data structure, it will ease the work.</div><div><br></d=
iv><div><br></div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>Atencio=
samente,=C2=A0</div><b>Charles Ferreira Gon=C3=A7alves </b><br><font color=
=3D"#666666"><br></font><font color=3D"#666666" size=3D"1"><br></font></div=
></div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Mon, Jan 4, 2021 at 6:18 PM Andrew Cooper &lt;<a =
href=3D"mailto:andrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 02/01=
/2021 19:20, Charles Gon=C3=A7alves wrote:<br>
&gt; Sure.=C2=A0<br>
&gt;<br>
&gt; The goal is to emulate a scenario where a compromised guest attacks<br=
>
&gt; another=C2=A0<br>
&gt; tenant in the same physical host reading/changing the memory content.=
=C2=A0=C2=A0<br>
&gt; E.g., extract the RSA key.<br>
&gt;<br>
&gt; I&#39;ll be in the domU kernel space. I&#39;m assuming that the guest =
is able<br>
&gt; to exploit=C2=A0<br>
&gt; any vulnerability possible.=C2=A0<br>
&gt; Effectively I&#39;ll be changing Xen&#39;s code (at least possible) to=
<br>
&gt; *emulate* a vulnerability=C2=A0<br>
&gt; (e.g., undo a patch).<br>
<br>
Ok, so in this scenario, you&#39;ve successfully exploited a privilege<br>
escalation vulnerability in Xen and obtained code execution in<br>
hypervisor context.=C2=A0 There are some security fixes to choose to revert=
<br>
for this purpose, but none I&#39;m aware of which will make the attack<br>
payload trivial to pull off.<br>
<br>
However, I&#39;d suggest that you first try writing a new hypercall to do<b=
r>
what you want, so you can get used to coding in Xen context, before<br>
adding the complexity of trying to retrofit it into an attack payload.<br>
<br>
If you&#39;ve already got code with works for dom0, I presume you&#39;re ke=
ying<br>
off the hardware_domain pointer?=C2=A0 Either way, you can look at the<br>
for_each_domain() construct for how to walk the domain list, or<br>
get_domain_by_id() for how to use the hashtable to look up a domain by<br>
its domid.<br>
<br>
~Andrew<br>
</blockquote></div>

--0000000000005d00ec05b824f277--

