Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 642852533F
	for <lists+xen-devel@lfdr.de>; Tue, 21 May 2019 17:01:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hT6Dk-0002uC-OZ; Tue, 21 May 2019 14:58:28 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dk3M=TV=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hT6Di-0002u7-VQ
 for xen-devel@lists.xenproject.org; Tue, 21 May 2019 14:58:27 +0000
X-Inumbo-ID: e1f362fb-7bd8-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id e1f362fb-7bd8-11e9-8980-bc764e045a96;
 Tue, 21 May 2019 14:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558450704;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=wS40M6qK9t9RBRFJvNyxY4ovijCipD3af3QImQclmm8=;
 b=X2+295IgzUANN9WvDNQYdpmYDtLqlk2lA8wMpVRqkxKcqHH0LIIRL4/TEhH+4856NE
 TIdFbK6eOc5NpdgR2xyV8cwvpcI9mdzeKAvNWCRdDQTNhU88cEGOuByT9FasKaH8L4ZJ
 gjYuC9v/N4NmSfwwgdMBnBfeDIwTavdM+MLNfEWr4l2Fjdcge5/BV1pyNL31x+dz3fcg
 RhGIiWTc+qPxR618Ewqk5kL3kJEyQJCHXjpIAP0mngeX99tYf4huXIztKZ3yjLZNG+98
 QJVwuCw5d94auHgonu6dEJqIzcYf2DFKI0WwaEfkoC4vJ186zhqJY+BsZRrmi/hApi3D
 B0ZA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4oc0Nr2ihluivcDRdyQYd1tcFv0/JdfdtvRXB+qTKkPmBD1yBGL"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.21 AUTH)
 with ESMTPSA id N09966v4LEwN7Yw
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 21 May 2019 16:58:23 +0200 (CEST)
Date: Tue, 21 May 2019 16:58:18 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190521165818.6f13af3f.olaf@aepfle.de>
In-Reply-To: <20190521144315.GI1846@zion.uk.xensource.com>
References: <20190521143702.GH1846@zion.uk.xensource.com>
 <20190521164122.187e51f6.olaf@aepfle.de>
 <20190521144315.GI1846@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.14 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Unhandle NONE type device model broke QDISK backend
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5454517079275220026=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5454517079275220026==
Content-Type: multipart/signed; boundary="Sig_/CPnhn1GjgabzNBpxRxjcS2B";
 protocol="application/pgp-signature"; micalg=pgp-sha1

--Sig_/CPnhn1GjgabzNBpxRxjcS2B
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 21 May 2019 15:43:15 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Yeah, that's indeed strange. Thanks for having a look.

Is the used domU.cfg available? I think In my testing disk=3D[] had backend=
=3Dqdisk.

Olaf

--Sig_/CPnhn1GjgabzNBpxRxjcS2B
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXOQSCgAKCRBdQqD6ppg2
ftLvAJoDnJ8SxqE8P/xOY7+yeNkz75QXnACgtNS1mvXmKlTaFamMdGsiBfonDWg=
=L24J
-----END PGP SIGNATURE-----

--Sig_/CPnhn1GjgabzNBpxRxjcS2B--


--===============5454517079275220026==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5454517079275220026==--

