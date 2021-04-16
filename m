Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 034603624CE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 17:59:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111886.213943 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQsX-00085f-KY; Fri, 16 Apr 2021 15:59:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111886.213943; Fri, 16 Apr 2021 15:59:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXQsX-00085F-H7; Fri, 16 Apr 2021 15:59:33 +0000
Received: by outflank-mailman (input) for mailman id 111886;
 Fri, 16 Apr 2021 15:59:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=rlMZ=JN=gmail.com=charles.fg@srs-us1.protection.inumbo.net>)
 id 1lXQsV-00084z-Um
 for xen-devel@lists.xen.org; Fri, 16 Apr 2021 15:59:32 +0000
Received: from mail-wr1-x433.google.com (unknown [2a00:1450:4864:20::433])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ba70f58e-dc26-4a86-b28a-ba60a0ffd6df;
 Fri, 16 Apr 2021 15:59:30 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w4so23449241wrt.5
 for <xen-devel@lists.xen.org>; Fri, 16 Apr 2021 08:59:30 -0700 (PDT)
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
X-Inumbo-ID: ba70f58e-dc26-4a86-b28a-ba60a0ffd6df
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X6jRCBOot1PLmSiX5Dit74TKCb0Ju9W4QZwBXaOBR38=;
        b=D5EOLIAMfeYyN5/XZaetRbiaLdNTEgVxhv/CYT6FNY0n952mwgtNyocaT5mQEFssuo
         xjvfN+4I7tv+txATpNVEVa6Y7ujod5nTsBsmymdJZc6LfBYeMhqFB+KSdE5SB29Ep75I
         MnRoEmyplzrZtmOjIc9lgY5I/WUTHPoGbquluXdzUMN1wHeAe423rciDXGN0HaFgtnoi
         CAIHr86h7t7At2QR67NlVBNdL8iYBIiCzctQWbDP6QObSlo+0eDNnOXJ41FynuP0j4Sm
         EDzOZ0muji8oJKjEmAXlVxzJIWFYQ5If3APjiajPO6iohrDvk6OZt3ydFoG7MLaIYW+q
         Pw/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X6jRCBOot1PLmSiX5Dit74TKCb0Ju9W4QZwBXaOBR38=;
        b=efjVTDhaZpDQHYZ41fbRzV/FiO/WzjSwG6O30qLeet9I1xdiNvW6HPqSMPAVrlFXOh
         VlvgBDv3OeTzDbABIv7HxSftC4CEyKCAkLUBW3BCi4lZKZFgLvaH8MPkMMV2+jsWiM4R
         TLpf7UDk2zcBI4Sb4UfAEgHcETo3ZIMTaelGjVcE7bCXSYkx/gWP70Ji9FHj5uTi+XD4
         wNOXgC7JC892KN1N0tOdQp4WmF9E0JFgRoSQiYooGDb4yvHXuhrG3csFsEO8RBd0j1S9
         iHs211dkZGryeQRjfev2YF34j4DIeXQaJi9ipzrbZ1Y/8eGnvbbH2yFfn+6e89M/MPUo
         p2KA==
X-Gm-Message-State: AOAM531M1fY1RAZq7XZGZgJkKv2sILX0878iD2TrXsvKT6JeOFdvZJ4g
	ojroJ3fgRLDNzm1imNHuRVA9qjMUXO5WZhKEsZ4=
X-Google-Smtp-Source: ABdhPJx+2OM3//7+rHxf/GDMCtxb7iXsH7RPCPsIOhij+ZVTX7Zb2zssirsuumoRBoQXYd/mafgRu4awFDRcJ21y+NI=
X-Received: by 2002:adf:ea09:: with SMTP id q9mr10189144wrm.235.1618588769949;
 Fri, 16 Apr 2021 08:59:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAAQRGoBV4noq8n=k0a-h8T0ZFnKUnAQQr-=VywCaXzbWxPsgZg@mail.gmail.com>
 <472aeb46-ded9-e5d2-edd8-b680d95d47ae@citrix.com>
In-Reply-To: <472aeb46-ded9-e5d2-edd8-b680d95d47ae@citrix.com>
From: =?UTF-8?Q?Charles_Gon=C3=A7alves?= <charles.fg@gmail.com>
Date: Fri, 16 Apr 2021 16:58:53 +0100
Message-ID: <CAAQRGoATOiDCBXSGD7m3y2B2=v7mcN12K6g9A1tQ42+_Vj7=Pg@mail.gmail.com>
Subject: Re: Memory Layout on Dom0 in PV
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: xen-devel@lists.xen.org
Content-Type: multipart/alternative; boundary="000000000000ab997905c0191054"

--000000000000ab997905c0191054
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks @Andrew,

A LKM to dump the arch->p2m_vaddr solved the issue and answered my
questions!

Atenciosamente,
*Charles Ferreira Gon=C3=A7alves *




On Fri, Apr 16, 2021 at 4:12 PM Andrew Cooper <andrew.cooper3@citrix.com>
wrote:

> On 16/04/2021 15:58, Charles Gon=C3=A7alves wrote:
>
> Hello Guys,
>
> Does memory on Dom0 also mapped to gpfn or it is mapped directly to mfn?
>
>  If mapped to gpfn, how can I access its p2m mapping?
>
> I'm trying to use the xen-mfndump but it is not working with dom0
>
> ./xen-mfndump dump-p2m 0
> xc: error: Could not map the shared info frame (MFN 0xddfe9) (3 =3D No su=
ch process): Internal error
> xc: error: Could not map domain 0 memory information: Internal error
>
> The problem that I'm wanting to solve is:
>
> Given a va in a process on dom0, I can get its physical representation
> (mfn or gpfn depending on how this works on PV) using /proc/pid/pagemap
> and with this I can access its real mfn.
>
> This works perfectly with domU but not with dom0, why?
>
>
> There are a lot of operations you're not permitted to perform on yourself=
,
> to prevent problems.
>
> I think in this case, Xen is rejecting dom0's attempt to foreign map
> itself (although -EINVAL would be better than -ESRCH to fail with, IMO),
> because otherwise we get into reference counting issues IIRC.
>
> You'll probably have an easier time asking the dom0 kernel to dump the
> p2m.  After all, its a kernel-owned datastructure, not a Xen-owned
> structure.
>
> ~Andrew
>

--000000000000ab997905c0191054
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks @Andrew,=C2=A0<div><br></div><div>A LKM to dump the=
 arch-&gt;p2m_vaddr solved the issue and answered my questions!=C2=A0<br cl=
ear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr"><div><br></div><div>Atenciosamente,</=
div><b>Charles Ferreira Gon=C3=A7alves </b><br><font color=3D"#666666"><br>=
</font><font color=3D"#666666" size=3D"1"><br></font></div></div></div><br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Fri, Apr 16, 2021 at 4:12 PM Andrew Cooper &lt;<a href=3D"mailto:a=
ndrew.cooper3@citrix.com">andrew.cooper3@citrix.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">

 =20
  <div>
    <div>On 16/04/2021 15:58, Charles Gon=C3=A7alves
      wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <p>Hello Guys,</p>
        <p>Does memory on Dom0 also mapped to gpfn or it is mapped
          directly to mfn?=C2=A0</p>
        <p>=C2=A0If mapped to gpfn, how can I access its=C2=A0p2m mapping?<=
/p>
        <p>I&#39;m trying to use the xen-mfndump but it is not working with
          dom0</p>
        <pre><code>./xen-mfndump dump-p2m 0                                =
                                         =20
xc: error: Could not map the shared info frame (MFN 0xddfe9) (3 =3D No such=
 process): Internal error
xc: error: Could not map domain 0 memory information: Internal error
</code></pre>
        <p>The problem that I&#39;m wanting to solve is:</p>
        <p>Given a va in a process on dom0, I can get its physical
          representation (mfn or gpfn depending on how this works on PV)
          using <code>/proc/pid/pagemap</code> and with this I can
          access its real mfn.</p>
        <p>This works perfectly with domU but not with dom0, why?</p>
      </div>
    </blockquote>
    <br>
    There are a lot of operations you&#39;re not permitted to perform on
    yourself, to prevent problems.<br>
    <br>
    I think in this case, Xen is rejecting dom0&#39;s attempt to foreign ma=
p
    itself (although -EINVAL would be better than -ESRCH to fail with,
    IMO), because otherwise we get into reference counting issues IIRC.<br>
    <br>
    You&#39;ll probably have an easier time asking the dom0 kernel to dump
    the p2m.=C2=A0 After all, its a kernel-owned datastructure, not a
    Xen-owned structure.<br>
    <br>
    ~Andrew<br>
  </div>

</blockquote></div>

--000000000000ab997905c0191054--

