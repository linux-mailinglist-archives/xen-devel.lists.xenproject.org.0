Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BE9DD3D2DDD
	for <lists+xen-devel@lfdr.de>; Thu, 22 Jul 2021 22:42:16 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.159852.293959 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6fVq-0002uD-3Q; Thu, 22 Jul 2021 20:41:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 159852.293959; Thu, 22 Jul 2021 20:41:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1m6fVp-0002rS-WD; Thu, 22 Jul 2021 20:41:46 +0000
Received: by outflank-mailman (input) for mailman id 159852;
 Thu, 22 Jul 2021 20:41:44 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g1y4=MO=gmail.com=olekstysh@srs-us1.protection.inumbo.net>)
 id 1m6fVo-0002rM-D3
 for xen-devel@lists.xenproject.org; Thu, 22 Jul 2021 20:41:44 +0000
Received: from mail-wr1-x430.google.com (unknown [2a00:1450:4864:20::430])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5e1e93fe-7ecc-4349-a4d9-09621703a430;
 Thu, 22 Jul 2021 20:41:43 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id b7so56590wri.8
 for <xen-devel@lists.xenproject.org>; Thu, 22 Jul 2021 13:41:43 -0700 (PDT)
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
X-Inumbo-ID: 5e1e93fe-7ecc-4349-a4d9-09621703a430
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qzeWYgK/bTug4MWFhTuraMf59NL9niT6kHUl2vAAQII=;
        b=SjcYr7LXPYJ4bT5t37XFmETds+YoEmq97wyeHa2aknfBr2/lOgnncRXiJYw5NQ05D3
         1P0YSC4HRevEilfPKXxccApUW57jaad6xDDR+tZTgFmZzFTNhXXfZhpMOZ/JIJp05031
         R+5+pKbgCkNY4XwHwR+s11ayX4yqmSetkOWYda51unu/Qt7y2J6zURkdbT4YhBshjI+0
         dXUQzvLS52E8P2kZbOptqoZ0Blzz5Cb5sTElD+07xcjVynzLb6sRWjmGtnDfr/cR5N4e
         /w9ThLP8RYMDa4LDa1pKCeI5rY5W/WMpfo/psNKnv07w8XdBWlPB+jfCE7F2MN2gYOt8
         yIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qzeWYgK/bTug4MWFhTuraMf59NL9niT6kHUl2vAAQII=;
        b=bQ9g27Z0EeK8bzOPt33NNHod/LMGftxzVb0wk8EtGGe8SVbRw5SpbExroGBDePQjdR
         AEDvBE/YM/h36fm9k5VLL/06sAOHy9Qip0wRejKWg8S64gfqdZdwf6xjbpdwjpv7uoHW
         Kj83ID5EQUUaSvhA76xKvSjzZBfg0Pu50fGmsduRQy0b/Yvpn06uO1FaELFrGX85ZvnL
         R72dO5gp949F5zWl8og2wxfxsoZe7FeZ8UggG3CC/ccbO8Y1f9qiTpO4TjbEcKupUduV
         fTVyWeeRSrwQURwgOLue5Ttuq7j1DPGaun4P7XNWZ8Fl++RiUiJrMQOe86xTd3ruwFO6
         4+2g==
X-Gm-Message-State: AOAM532L3rBZpJf8H32ceFqA5OpOg/kcSh2P4gPDuzvTSm6aQHHr9fdE
	XZS9bcJSo1gapBkChma4nFoaRgQdBLCPp8QdsDo=
X-Google-Smtp-Source: ABdhPJz6Ph/+Nk9VCtxsOLPkFpcc/4CQXYaoMmP4bp6XN6jk/Yh3pyLO+NAGRhoHuEcbMT0fnOL/FnrbTOEcWuDhbQc=
X-Received: by 2002:adf:a1c4:: with SMTP id v4mr1727797wrv.217.1626986502671;
 Thu, 22 Jul 2021 13:41:42 -0700 (PDT)
MIME-Version: 1.0
References: <YIptpndhk6MOJFod@Air-de-Roger> <YItwHirnih6iUtRS@mattapan.m5p.com>
 <YIu80FNQHKS3+jVN@Air-de-Roger> <YJDcDjjgCsQUdsZ7@mattapan.m5p.com>
 <YJURGaqAVBSYnMRf@Air-de-Roger> <YJYem5CW/97k/e5A@mattapan.m5p.com>
 <YJs/YAgB8molh7e5@mattapan.m5p.com> <54427968-9b13-36e6-0001-27fb49f85635@xen.org>
 <YJ3jlGSxs60Io+dp@mattapan.m5p.com> <93936406-574f-7fd0-53bf-3bafaa4b1947@xen.org>
 <YJ8hTE/JbJygtVAL@mattapan.m5p.com> <f7360dac-5d83-733b-7ec5-c73d4dc0350d@xen.org>
 <alpine.DEB.2.21.2105191611540.14426@sstabellini-ThinkPad-T480s>
 <b6fe6e06-517c-ee4c-5b71-a1bee4d4df13@xen.org> <alpine.DEB.2.21.2105200919100.14426@sstabellini-ThinkPad-T480s>
 <2d18f588-5e76-e3da-e7df-5c754516f8d6@gmail.com> <b9247885-8fc0-3a74-8f86-740997b4453e@xen.org>
In-Reply-To: <b9247885-8fc0-3a74-8f86-740997b4453e@xen.org>
From: Oleksandr Tyshchenko <olekstysh@gmail.com>
Date: Thu, 22 Jul 2021 23:41:31 +0300
Message-ID: <CAPD2p-=KdztPCa1z=7oLFYxDroWvkVqo3XsV2f4dA0kO4SuwTA@mail.gmail.com>
Subject: Re: Uses of /hypervisor memory range (was: FreeBSD/Xen/ARM issues)
To: Julien Grall <julien@xen.org>
Cc: Oleksandr Andrushchenko <andr2000@gmail.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Elliott Mitchell <ehem+xen@m5p.com>, xen-devel <xen-devel@lists.xenproject.org>, 
	"Roger Pau Monn??" <royger@freebsd.org>, Mitchell Horne <mhorne@freebsd.org>, 
	Andrew Cooper <andrew.cooper3@citrix.com>, Artem Mygaiev <Artem_Mygaiev@epam.com>, 
	Anastasiia Lukianenko <Anastasiia_Lukianenko@epam.com>
Content-Type: multipart/alternative; boundary="0000000000008bd23e05c7bc50e0"

--0000000000008bd23e05c7bc50e0
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 3, 2021 at 8:18 PM Julien Grall <julien@xen.org> wrote:

>
>
> On 18/06/2021 13:19, Oleksandr Andrushchenko wrote:
> > Hi, all!
>
> Hi,
>

Hello Julien, all.
[sorry for the possible format issues]

I am sorry to jump into the conversation too late.



>
> Sorry for the late reply.
>
> > What do we need in order to move on on this?
>
> The next steps would be
>   1) Write a PoC to confirm the approach is feasible
>   2) Write a design document
>
> Unfortunately, I will not have time to work on it any time soon. Is it
> something you plan to work on?
>

I am working on this PoC on Xen on Arm right now taking into the account
the details that we initially discussed on the IRC, unfortunately, I had to
postpone this activity several times due to the limited bandwidth,
but this time, I hope, I will be able to finish this PoC without
interruption) I will try to share Xen+Linux changes in a week, so we will
able to discuss them.


>
> Cheers,
>
> --
> Julien Grall
>
>

-- 
Regards,

Oleksandr Tyshchenko

--0000000000008bd23e05c7bc50e0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jul 3, 2021 at 8:18 PM Julien=
 Grall &lt;<a href=3D"mailto:julien@xen.org">julien@xen.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 18/06/2021 13:19, Oleksandr Andrushchenko wrote:<br>
&gt; Hi, all!<br>
<br>
Hi,<br></blockquote><div><br></div><div>Hello Julien, all.</div><div>[sorry=
 for the possible format issues]</div><div><br></div><div>I am sorry to jum=
p into the conversation too late.</div><div><br></div><div>=C2=A0</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Sorry for the late reply.<br>
<br>
&gt; What do we need in order to move on on this?<br>
<br>
The next steps would be<br>
=C2=A0 1) Write a PoC to confirm the approach is feasible<br>
=C2=A0 2) Write a design document<br>
<br>
Unfortunately, I will not have time to work on it any time soon. Is it <br>
something you plan to work on?<br></blockquote><div><br></div><div>I am wor=
king on this PoC on Xen on Arm right now taking into the account the detail=
s that we initially discussed on the IRC, unfortunately,=C2=A0I had to post=
pone this activity several times due to the limited bandwidth,</div><div>bu=
t this time, I hope, I will be able to finish this PoC without interruption=
) I will try to share Xen+Linux changes in a week, so we will able to discu=
ss them.=C2=A0=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Cheers,<br>
<br>
-- <br>
Julien Grall<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div=
 dir=3D"ltr"><span style=3D"background-color:rgb(255,255,255)"><font size=
=3D"2"><span style=3D"color:rgb(51,51,51);font-family:Arial,sans-serif">Reg=
ards,</span></font></span></div><div dir=3D"ltr"><br></div><div dir=3D"ltr"=
><div><span style=3D"background-color:rgb(255,255,255)"><font size=3D"2">Ol=
eksandr Tyshchenko</font></span></div></div></div></div></div></div></div><=
/div>

--0000000000008bd23e05c7bc50e0--

