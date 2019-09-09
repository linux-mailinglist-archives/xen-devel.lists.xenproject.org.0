Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C564EAD4A2
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2019 10:17:35 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i7Epi-0001uC-FE; Mon, 09 Sep 2019 08:15:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=46rG=XE=gmail.com=dhananjayingroup@srs-us1.protection.inumbo.net>)
 id 1i7ETN-00077t-Em
 for xen-devel@lists.xen.org; Mon, 09 Sep 2019 07:52:29 +0000
X-Inumbo-ID: c50d55b6-d2d6-11e9-978d-bc764e2007e4
Received: from mail-qk1-x732.google.com (unknown [2607:f8b0:4864:20::732])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c50d55b6-d2d6-11e9-978d-bc764e2007e4;
 Mon, 09 Sep 2019 07:52:28 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id q203so12200907qke.1
 for <xen-devel@lists.xen.org>; Mon, 09 Sep 2019 00:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=rga3HUhQTbKfMBGJS9CjgfCeBD+9qkJHroE+XczUsic=;
 b=ncAqOBxP6Ehw4a0MZa7XXKud/Pl9XnFKEw+m3wUnQJG8cmvoSs1E4zEf9urL0vjhq9
 roGf+FJCYzeV3+p6w51SUeovHjiptErxuW7Zz1bJSiqTSnuJm+U0XJoCP5vOoi44901T
 L6BKrxQ3LR3bH7DVWVAHCl34GLHL5uR2M/sAvh3zS8TCtK9pXTuD9DqCX8Q1AeFa2NBm
 uzMaWvTyMzeLQwfbYWWtcfC+FQ+RrM2YEtZAjFkzOciSn5Tqv/pn85N+A3mlDWvleYUS
 MnLXKszqzmo3lWFOmsrDjZaTlvSE5bJVF7B7o7b4LxpJAJrULp/v0Pc0RgdSnvuR6U3w
 UzEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=rga3HUhQTbKfMBGJS9CjgfCeBD+9qkJHroE+XczUsic=;
 b=gXJeBbuXt/cpCXmEfuQkwXtogDGAKxi08lzSaxO/1urFfgG1HCOxFDjehJqwJzLjBl
 YeejzehRxgLdaWEohsjibo8H9pGWEB+/IhDp1x+2INbCBIiKtLodxwVg6pnuUm/bn96s
 fwIzHf+Pm5hxQ+m99cBaNlRhMrLIbFfmlxDw/lDVBV7QUoVBq1O1o7NOqWU7K9l7Kiy1
 bNiiWhWzrfCIMHHamaNGn6LBW9RAbecr2S47pwUaFVPD72NCdA4A8irw4eMZ3ZD86iz0
 29zZ6S2PJrOSj5MRGMeBG6HXFyPi7sK6YMDTL0KtMtMeU3o9mRf/vjKFXrhO3UmxYD3x
 k3aA==
X-Gm-Message-State: APjAAAVQi+0LRnQXfr51ttNZsAE/SzeiIEmd0W/3tZC2QsrOjvKSivub
 c4QByfGBcf10POgmTl5y3rF/tUanZPLdXRgLg4lkZA==
X-Google-Smtp-Source: APXvYqxa5G30jhpXzYe1V5abx1Yn34cU9KWIFvXrjeNAko5+EoIZh6NVJY1+g68mNaAGnzIVAjNNAa4MgUcsNfoy0lE=
X-Received: by 2002:a37:9601:: with SMTP id y1mr19694967qkd.283.1568015547768; 
 Mon, 09 Sep 2019 00:52:27 -0700 (PDT)
MIME-Version: 1.0
From: Dhananjay Joshi <dhananjayingroup@gmail.com>
Date: Mon, 9 Sep 2019 13:22:14 +0530
Message-ID: <CAM202GFP9YViudRCs2TjBtPcyEV6uWY-XqCcbXT0i2hqwQkkag@mail.gmail.com>
To: xen-devel@lists.xen.org
X-Mailman-Approved-At: Mon, 09 Sep 2019 08:15:33 +0000
Subject: [Xen-devel] Xen on RPI3
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
Content-Type: multipart/mixed; boundary="===============7590185767670468093=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7590185767670468093==
Content-Type: multipart/alternative; boundary="000000000000ba256505921a11b2"

--000000000000ba256505921a11b2
Content-Type: text/plain; charset="UTF-8"

I have tried booting xen on rpi3 using ubuntu 18.04 as dom0 , I have
successfully installed xen hypervisor packages as well as tools using
apt-get .
finally grub setting is done to add xen option in one of the grub menu ,
When I try to boot rpi3 with xen enabled ubuntu I get the following error

"synchonous abort: Handler ESR ...
Reposting it here from personal mail id

--000000000000ba256505921a11b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div style=3D"font-family:calibri,arial,helvetica,sans-se=
rif;font-size:12pt" dir=3D"auto">I have tried booting xen on rpi3 using ubu=
ntu 18.04 as dom0 , I have successfully installed xen hypervisor packages a=
s well as tools using apt-get .=C2=A0<br></div><div style=3D"font-family:ca=
libri,arial,helvetica,sans-serif;font-size:12pt" dir=3D"auto"><div>finally =
grub setting is done to add xen option in one of the grub menu , When I try=
 to boot rpi3 with xen enabled ubuntu I get the following error<br></div><d=
iv><br></div><div>&quot;synchonous abort: Handler ESR ...<br></div><div dir=
=3D"auto">Reposting it here from personal mail id</div><br></div></div>

--000000000000ba256505921a11b2--


--===============7590185767670468093==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7590185767670468093==--

