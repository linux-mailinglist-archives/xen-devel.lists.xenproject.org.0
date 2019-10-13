Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D395ED56E2
	for <lists+xen-devel@lfdr.de>; Sun, 13 Oct 2019 18:55:48 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iJh65-0002yz-1S; Sun, 13 Oct 2019 16:51:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=Bt2D=YG=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iJh63-0002ys-8N
 for xen-devel@lists.xenproject.org; Sun, 13 Oct 2019 16:51:55 +0000
X-Inumbo-ID: c1711942-edd9-11e9-a531-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::8])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c1711942-edd9-11e9-a531-bc764e2007e4;
 Sun, 13 Oct 2019 16:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1570985511;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=V9Hi1z9mT3cDFEH1tr0E5ldn3Zv0oDomxsXiU6UoWV4=;
 b=qFZXnrLLbTb3WdtZQxvxh/l1gbGi7f4sl+E0+RdR+m9emwB0qpaiMvl9CDyvVesdOW
 KZ17QNqHxF+GL58Qj+sIzMDUchy/CIE4skBaTDCopusdQv1FvEhTxIUIpBsQ7EhDm+Df
 0vUqhxzR0OSm+15OLk5xV7aIotBllC9n2sF1Ur1EvmlSEI/v6AqTEKFks7fsi6b79VZO
 VpdAZ2uC7b9zHkUp+cT4uHCCudOCexVTEq4cNjLLYRlbLd71HFjPv+B1zFIvHO8UGVbn
 IM9fBXmCL/Gkkb4qLCUVYhQFtkHL7p8LDmqP4RUhgibJTgX+BJ90jND7KZkXdBYpEmyt
 d5Og==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC44eztn93Z9OGdNZlwEI8w=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.0 DYNA|AUTH)
 with ESMTPSA id j06a90v9DGoeAvT
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Sun, 13 Oct 2019 18:50:40 +0200 (CEST)
Date: Sun, 13 Oct 2019 18:50:32 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20191013185032.49807077.olaf@aepfle.de>
In-Reply-To: <20191013162127.2pdc6ho4oer5pnpr@function>
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-2-olaf@aepfle.de>
 <20191013162039.hsylxvashc4rbo67@function>
 <20191013162127.2pdc6ho4oer5pnpr@function>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/8] stubdom/vtpm: include stdio.h for
 declaration of printf
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
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>, Quan Xu <quan.xu0@gmail.com>
Content-Type: multipart/mixed; boundary="===============3175645874424477605=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3175645874424477605==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/mD30ZTQyfFnbJv=xI_1/l1h"; protocol="application/pgp-signature"

--Sig_/mD30ZTQyfFnbJv=xI_1/l1h
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Sun, 13 Oct 2019 18:21:27 +0200
schrieb Samuel Thibault <samuel.thibault@ens-lyon.org>:

> > > cked-by: Daniel De Graaf <dgdegra@tycho.nsa.gov> =20
>=20
> Note that you miss an 'A' at the beginning of the line there.

Thanks for spotting.

Should I resend this patch?

Olaf

--Sig_/mD30ZTQyfFnbJv=xI_1/l1h
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl2jVdgACgkQ86SN7mm1
DoCMbA/+ONBO7onIaTW6A+FchV+Xgnfz9pF2Ynj6Qd/HsJ9BRomlKKlM3Zg3GYV/
Y5e2fCJmW5Y/PA7Smvqq1yjf+Vw3IMNHQC6B9zURo542XwSXxhWGq0fxKNPknHaz
W0S59Dsgzx9X8wVsnQG0kdBIwBkvFr7i/O84HASDKJ3R3LC8oX/1L+Rs4T21Obnh
KCd7lfnLeAFD+9ZUNuVLnY5m0xKOAbtUS7b3TTEVrBz5/u+wUEkD0qvm5cQg98lK
R3D6Uw0hXN9ceDbe+jcHZv82+mHaKMMqh8boWQ/vE1PGeFFgH7+hQtHS26D0rS9T
n/jqlsns9TW/jhrkxbmvROgWDEp1MFcJKA112BkuEFP9+FLlvVvV9731i50fLPPV
fpCXxRNGiuLzh02F74d7DMKPDPyVyMRlWshKVxk13bS6OXTxEEUuqMm4Nh9Jz9Mj
si+WXPFZ87cwX4ublXAP1O2gwmrz0APaNk4CSOK97KQqbsDivqAma+TBalIP7Cfl
VkLJsYuq8hYPfdl4maybH8AjqYoC3BsChWCIB6ORCJGsAT4JiZStqkKeNViJkXQX
U1NZZzsNTOxFgfAB3J3BiuNYkXlEjVITtOikENOMpjT504yRFiPrrfM9O2QDuesE
zL6ypI/AQ8GibzOURHQrxhyu8fUNnhxeZKQnFwyX4sqSXjhZ2qE=
=tQTi
-----END PGP SIGNATURE-----

--Sig_/mD30ZTQyfFnbJv=xI_1/l1h--


--===============3175645874424477605==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3175645874424477605==--

