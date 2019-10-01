Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFB6C43DF
	for <lists+xen-devel@lfdr.de>; Wed,  2 Oct 2019 00:41:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iFQm9-0003K6-R0; Tue, 01 Oct 2019 22:37:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Yyqo=X2=gmail.com=katereenart@srs-us1.protection.inumbo.net>)
 id 1iFQm8-0003K1-3Z
 for xen-devel@lists.xenproject.org; Tue, 01 Oct 2019 22:37:44 +0000
X-Inumbo-ID: 14c1b83c-e49c-11e9-97fb-bc764e2007e4
Received: from mail-lj1-x234.google.com (unknown [2a00:1450:4864:20::234])
 by localhost (Halon) with ESMTPS
 id 14c1b83c-e49c-11e9-97fb-bc764e2007e4;
 Tue, 01 Oct 2019 22:37:43 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id f5so15090636ljg.8
 for <xen-devel@lists.xenproject.org>; Tue, 01 Oct 2019 15:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=OTfHAhTAYDP2xDw9G6HAhEUi+2CP6+9f0kAO4CnGFOg=;
 b=hxaOlRMild58XTVZ3fT91QNjIcv6lP6SKvMZvqqe9eLUhftpYVxrUA09BWFuYtplWN
 wDNXHvm+J+1BwzqlgOjaHquubSgakEUbvFeRrTtxOFaooXtEnYJu4yU416jwL5n9LjxY
 681vt9l+pIM5I2Vy+TMmI4K0WS/CTO9Sza5gFUarymFgS9KD/NG5RgEmIrPEjwezTKA6
 Ze4usv8VlhbrTdG/giFn9R4ahZQseb91btKesAj7RAzjNBdQ4hY2vNfA8tR6u7NQOWK7
 wIZAlJRpFjSvKNUhsrj7pDoEWQ95bM/CGBUoL8sYV+nlOWzh/UZj3BU5M8Lcnfz8Ur7m
 83+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=OTfHAhTAYDP2xDw9G6HAhEUi+2CP6+9f0kAO4CnGFOg=;
 b=BUZhdJB3VsLT9/uVepwb7DDy6vTuM06MRamDWqQZpD/FRFOM0Vz9gv09fKa6GecuZl
 ANLGIZb74iAgwYGPewghRMFAf8hOy5cKjlxL1dHPHmhROlhJNX2A2H4ZY909LWyedofJ
 P5IHMZ9+u4szAczOFzm9BuywnsPxLuPNw2/owi+i9IydpWOuyo9uZAvnaRNBV9AjYsGR
 AK1p3KIl7ie2iKQOVCTsw+Jofc7s7k7GCFCQ0iO8c6y9pD3TwAgrrVfGmx0iazxLWgYX
 GnmXW+19u82XS4IJAMTlPijLAbWtwAiSp2VIJoXU6NIN3MObuK/9+sBDZgiW08Z8GU1d
 5EoA==
X-Gm-Message-State: APjAAAXaZcO9vbIpKdRRFOlovCnay5P5egDCv9IDxatIdDnXWjn6ATiW
 6PhYKRHAxcQ+/LiG3tex/+gIhWbeMEpbiPEFSLSMUFew
X-Google-Smtp-Source: APXvYqwxpvAY1aWy3Y2VWybjQUk/CscM+z/RgH1uAgKWoWUDdLk7y4hVk6OuVD4+/dn9GquG+iBlDWpIlJ97SJxSobc=
X-Received: by 2002:a2e:9094:: with SMTP id l20mr150409ljg.35.1569969462027;
 Tue, 01 Oct 2019 15:37:42 -0700 (PDT)
MIME-Version: 1.0
References: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
In-Reply-To: <CAFjkr2qCb7ZoOAx2A_oFE1znjpia=2Auk+XePybfWbk8jB-9Nw@mail.gmail.com>
From: Kateryna Razumova <katereenart@gmail.com>
Date: Wed, 2 Oct 2019 00:37:30 +0200
Message-ID: <CAFjkr2qskyxgtoZzToNXWAZPnN=5fbEiWpZO3P+Lq=1PiiEZPg@mail.gmail.com>
To: xen-devel@lists.xenproject.org, wl@xen.org
Subject: Re: [Xen-devel] I want to participate in Outreachy with CONFIG_PDX
 related project
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
Content-Type: multipart/mixed; boundary="===============6321520798253173693=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6321520798253173693==
Content-Type: multipart/alternative; boundary="00000000000017a94f0593e10057"

--00000000000017a94f0593e10057
Content-Type: text/plain; charset="UTF-8"

Hello,
I want to make the first contribution for xen. I want to participate with:
Introduce CONFIG_PDX and use it in Xen hypervisor

Where can I start?
I have few years of C programming experience but never had contributed to
open-source projects before.

On Wed, 25 Sep 2019 at 11:27, Kateryna Razumova <katereenart@gmail.com>
wrote:
>
> Hello xen,
> I would like to participate in Outreachy. I was registered on the site
few days ago, filled some quite a big form but still can't see tasks'
descriptions.
> Since, I like C programming I would like to know more about "Introduce
CONFIG_PDX and use it in Xen hypervisor". What hardware do I need? I think
I can find an old laptop with virtualization support. Also, how can I start
contributing?
> I have few years of C programming experience but never had contributed to
open-source projects before.

--00000000000017a94f0593e10057
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br>I want to make the first contribution for xen. I=
 want to participate with:<br><div>Introduce CONFIG_PDX and use it in Xen h=
ypervisor</div><div><br></div>Where can I start? <br>I have few years of C =
programming experience but never had contributed to open-source projects be=
fore.<br><br>On Wed, 25 Sep 2019 at 11:27, Kateryna Razumova &lt;<a href=3D=
"mailto:katereenart@gmail.com">katereenart@gmail.com</a>&gt; wrote:<br>&gt;=
<br>&gt; Hello xen,<br>&gt; I would like to participate in Outreachy. I was=
 registered on the site few days ago, filled some quite a big form but stil=
l can&#39;t see tasks&#39; descriptions.<br>&gt; Since, I like C programmin=
g I would like to know more about &quot;Introduce CONFIG_PDX and use it in =
Xen hypervisor&quot;. What hardware do I need? I think I can find an old la=
ptop with virtualization support. Also, how can I start contributing?<br>&g=
t; I have few years of C programming experience but never had contributed t=
o open-source projects before.</div>

--00000000000017a94f0593e10057--


--===============6321520798253173693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6321520798253173693==--

