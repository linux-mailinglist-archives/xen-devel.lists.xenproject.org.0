Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D2FC2565
	for <lists+xen-devel@lfdr.de>; Mon, 30 Sep 2019 18:46:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iEylh-0007pJ-7U; Mon, 30 Sep 2019 16:43:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=1CjY=XZ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iEylf-0007pD-4L
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2019 16:43:23 +0000
X-Inumbo-ID: 698c059e-e3a1-11e9-b588-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::4])
 by localhost (Halon) with ESMTPS
 id 698c059e-e3a1-11e9-b588-bc764e2007e4;
 Mon, 30 Sep 2019 16:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1569861801;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=tL0+p+LfsMa6ev7IcyUp7uuuSVNq2mF5bkz6m+m9ltk=;
 b=M6Vn0lddNaRZPLBcu8Zow9VkDlsGSlCqSU/5EV+mmAsvwiNMPu76ws90Oa+sRyjemP
 Y7yJhqyMsgLNSgcLOQolTO4+j5bOoYC49/KZtyKSKVzlnP+TeJcefe4L9ICtY3LlHFf8
 0temSFD5VjQdQRKAMs9imyQ5ktFA3Lm5kjNq9DHI6BuswCNmGA3pDgzSguVX0HVNTEcQ
 kr6ELOHu19bkLWzfzkIjjXp1A47p1mT7AHPP6ykJditqK1ypVbEzmfsyx29LxsRvszlR
 DAYhdYlbUAM3fQFIMyrxEFBCwBNjBNM9REyzgXOoRManqeFrJJDRKZ5SHBLeMWvSkrIE
 fDTw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 AUTH)
 with ESMTPSA id j06a90v8UGhHLpx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 30 Sep 2019 18:43:17 +0200 (CEST)
Date: Mon, 30 Sep 2019 18:43:08 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190930184308.71361d1c.olaf@aepfle.de>
In-Reply-To: <23946.9607.887344.235099@mariner.uk.xensource.com>
References: <20190924140319.11303-1-olaf@aepfle.de>
 <20190924140319.11303-3-olaf@aepfle.de>
 <23946.9142.652599.628334@mariner.uk.xensource.com>
 <23946.9607.887344.235099@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH RESEND v1 2/8] tools: move scripts from etc
 to libexec
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============1339068646518513892=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1339068646518513892==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/Umvw/80uqbi6A/KHhORqr7="; protocol="application/pgp-signature"

--Sig_/Umvw/80uqbi6A/KHhORqr7=
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 24 Sep 2019 15:17:43 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

> I might be open to argument on that for specific target operating systems=
 if the appropriate distro maintainers were to make a case.

I provided reasons why the current default is not appropriate, and the chan=
ge should be applied.

Did you come up with a reason why the provided reasons are incorrect?


Olaf

--Sig_/Umvw/80uqbi6A/KHhORqr7=
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl2SMJwACgkQ86SN7mm1
DoADow/8DnOV881Q2b+i4YYY7V7d/xo4p/BOErC/bJuuERrnG98HUrbsF9Nfupax
zxKiirgmyeZ/KsaYxB3D7jzw0JrxPg4irfB6qEoi/KgIfD2LX62+inkbrFYn3vP4
1pgH86m3gATGHAzqJqmwooGsQeAaLwRa/8cEy3Sli6JD3pe5B/23HsZp3uWx/ddO
V1Xoy/2wchM8CpaN6rCR6WoY/p/2wkkCYxiuUWHLTqDvRPmp8KvJ8ST7EJNPp3HH
7e+1/4yytdYyslrgY6h3Gw6frbGDJrix5fbiMCWqq/J2i0WQz8NqSPvWLX+QfrQk
hL0qqLSj14tmnTQNGmizNZbPFDuzoMbTNZXBdl9v1e90rQqEcYWXOII5Psbotqp2
sO+S2Bb8vcTf8jFK4f8oI2K8+muq1bbCK4Wvo7VjDjUN1DXf76h8hTQIywGgJWTO
rw/QQcrLVMAYbmTKOjVqH7gguAwFLNd4DLCwXv9V01Tcbs1f+lI+ZHYwjXTs+8HS
9fry/2yZ7A+OiyLxjrISAlQEaOpnYnjcPQiOmQJ2Wnpzooo1SIaKuYZYBU/uxFo1
kiCX+/Ir0Bx+PfjghGDXUdapuPkdRmY/oVDXZejH/Yt+vEbWWiAQtVjrCfRxORrP
sOr+d1804f2ewEw/AKyUshGBwT6FDDOclMABogm59oXRcSbmykA=
=/1Pn
-----END PGP SIGNATURE-----

--Sig_/Umvw/80uqbi6A/KHhORqr7=--


--===============1339068646518513892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1339068646518513892==--

