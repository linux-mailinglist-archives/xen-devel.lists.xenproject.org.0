Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4EF207E0
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:20:34 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGHG-0005KU-Kw; Thu, 16 May 2019 13:18:30 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRGHE-0005KN-DO
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:18:29 +0000
X-Inumbo-ID: 16d074a9-77dd-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 16d074a9-77dd-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558012706;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ASxtDnK0T7WdzX7KTZFj8vEcNRTRkjwsZRT/ShtmylM=;
 b=qiplFiBZIKtJPDRzD/7hIipTPAN1Xn3i7E2tc3mlHv/k9kdfVu9FSKOxv49rllzrOj
 MvLN+BuB7Bh6qb1Hu9/mC8ge5H9p8JB3VebTHIick5jkyjF5ymCr9iEkL+uVFg0/iKgJ
 lUy3UmZOUrAZqF+Lu0R41HabXWfmsVnZFO713i1bpRF2h3YfAw2/90W+Du6BUdb4XJ2w
 NWEQMbUjNFCBIuvYvmAsJYSifFMTQFWeYitH5HEzjsp8qBJoD6ocF3QlyUXUl9uCfOO0
 gEdmXIj4khsRgxgE9Um9WLZpe5Kcu6sWb35vWWTMpqmic+tyWAvAPvSE7M68hJ9Vc6LR
 HhLg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4GDINFCW
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 15:18:23 +0200 (CEST)
Date: Thu, 16 May 2019 15:18:19 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516151819.168c6b36.olaf@aepfle.de>
In-Reply-To: <20190516113902.GZ2798@zion.uk.xensource.com>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
 <20190516111330.GA32248@aepfle.de>
 <20190516113902.GZ2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: alistair23@gmail.com, Alistair Francis <alistair.francis@wdc.com>,
 Ian Jackson <Ian.Jackson@eu.citrix.com>, Jan Beulich <JBeulich@suse.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5834601083299149723=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5834601083299149723==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/2XJAvCeX1h5QXBA=J4ahXuy"; protocol="application/pgp-signature"

--Sig_/2XJAvCeX1h5QXBA=J4ahXuy
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 12:39:02 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> autotools shipped in all the distros we care about=20

I see autoconf 2.69 is available practically everywhere, starting
with openSUSE 12.2, which was released in Q3 2012. SLE11, which
can not be properly supported anymore, had autoconf 2.63.

Olaf

--Sig_/2XJAvCeX1h5QXBA=J4ahXuy
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1jGwAKCRBdQqD6ppg2
fubKAKChsq3XlnmsP9HvITvOqSj+ue8GDwCg2khsEr/Tlq7KqrYzXj3uOI3EfEE=
=AupZ
-----END PGP SIGNATURE-----

--Sig_/2XJAvCeX1h5QXBA=J4ahXuy--


--===============5834601083299149723==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5834601083299149723==--

