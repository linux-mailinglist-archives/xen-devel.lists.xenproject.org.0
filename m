Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E5BA18BDF
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 16:33:59 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOk3g-0001r8-D2; Thu, 09 May 2019 14:30:04 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOk3e-0001dL-B9
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 14:30:02 +0000
X-Inumbo-ID: ec8241b9-7266-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::10])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ec8241b9-7266-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 14:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557412199;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=tFajtSUYavKU3jw8BvYW6HQB0q8UgcZUYQWKBtyDzuc=;
 b=NHOpPuWboJpAk9FJJrfedIVgG2r/wkXvh3stv1pd0Tz3tHFawchC6FqG/h5Tlmux6b
 AyiIiRsAPcXckVsP153JO8DkGo2a2l2WTo2NIDQV175UDiLXuUK+zRtNTKgxlmAM3lON
 xTB2faQhNMvjJXtGwS2C9+2xZq1j12UoyFP69F4TMAbdBzPuNUy50CeT2fJmi5nQPQ5u
 CUaGMKWgYi1e9fg1p60gMAf4qArvte3CrhNjsnU1ue7DHMHdn2wNqO2Sy65CTICIL0by
 ZJQTJ0kXq7J2Inv+82xG7U1/VqMH+5eqxK6HQvXGTC2hkvYLwx+zA98jySRGPMd5SaBj
 Hc1w==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 AUTH)
 with ESMTPSA id 60a847v49ETvmyg
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 9 May 2019 16:29:57 +0200 (CEST)
Date: Thu, 9 May 2019 16:29:56 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190509162956.23c4d6ab.olaf@aepfle.de>
In-Reply-To: <20190509155621.20698a9f.olaf@aepfle.de>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
 <20190509155621.20698a9f.olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2] libxl: fix migration of PV and PVH domUs
 with and without qemu
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Content-Type: multipart/mixed; boundary="===============9081229260421951478=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============9081229260421951478==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/eH3d=8MvfcrJ3.l1zBLydas"; protocol="application/pgp-signature"

--Sig_/eH3d=8MvfcrJ3.l1zBLydas
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 9 May 2019 15:56:21 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> Am Fri, 3 May 2019 13:04:11 +0200
> schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:
>=20
> > I think the above call is wrong, libxl__need_xenpv_qemu expects to get
> > the domid of the toolstack domain (ie: the domain running this code),
> > not the domain being created. =20
>=20
> So, how do I actually test such setups? It seems a driver domain is
> required. According to xl-disk-configuration(5) I may need to specify
> backend=3D$domU. Is there some guide how to configure such thing?

While my question still stands, I wonder if the statement regarding
libxl__need_xenpv_qemu is correct.

Are you saying the current users of libxl__need_xenpv_qemu (libxl__dm_check=
_start,
spawn_stub_launch_dm and domcreate_launch_dm) do not only run in dom0, but
also somewhere else?


Olaf

--Sig_/eH3d=8MvfcrJ3.l1zBLydas
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNQ5ZAAKCRBdQqD6ppg2
fobuAKDS6XismNKpcNhAJS+n7ito5i9gSQCgntegEkfWn17p82JtOV5n1ohC6v0=
=3WTZ
-----END PGP SIGNATURE-----

--Sig_/eH3d=8MvfcrJ3.l1zBLydas--


--===============9081229260421951478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============9081229260421951478==--

