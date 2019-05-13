Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D11F41B90C
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 16:49:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQCCz-0003sC-5p; Mon, 13 May 2019 14:45:41 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=RcTn=TN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQCCx-0003s1-FV
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 14:45:40 +0000
X-Inumbo-ID: c4f380c4-758d-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::3])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id c4f380c4-758d-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557758736;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=Qxlk5rF6UqpXZfsR1OZ5g7te5eP2/+QE7QFjSAHVZqc=;
 b=tmqasFBxEUxts7C3g0MVwuzwXx+WT70y0V8PASnAimgHE/aaR3457aII/ZgM9jImtk
 q5TjdmwsQXBxpakszFdjyDK7USSlkhWoK/LmRd6aLpeUrLG+U6k6Ftp93lFhinwPUljQ
 jrC7uK0dnOpMNi5oiWlOPb8BQfNrqdsYy/f3qo8Xyc6k8328JGOqEqmVYK4a4eEATEeW
 fWSMtxnKw4lkhH91F3utCYkHm4Bqv4am3wr5HXNqJOIS7bsilTgJIr5xyAN9VhCzw9mM
 6N4B9ES0B2SttRyIsMtA8czAzztEWHebTfRcCEkzBmGNZEeqL9Nd28ruAS51PduSxmfD
 jd0A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4DEjW1wz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 13 May 2019 16:45:32 +0200 (CEST)
Date: Mon, 13 May 2019 16:45:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190513164521.19e65e5d.olaf@aepfle.de>
In-Reply-To: <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
References: <20190510152047.17299-1-olaf@aepfle.de>
 <20190513143733.2xodq4nexe7n6er2@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4] libxl: fix migration of PV and PVH domUs
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
Content-Type: multipart/mixed; boundary="===============1000643487623551867=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1000643487623551867==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/hsGsCzkzFuu8CpXta=y_a4m"; protocol="application/pgp-signature"

--Sig_/hsGsCzkzFuu8CpXta=y_a4m
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 16:37:33 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> FTR I would have preferred a pre-patch that did the move of this chunk
> of code into libxl__domain_set_device_model without any functional
> change, and then a second patch that introduces the new functionality.

If that needs to be done, I can do it.


What could be done in addition is to add an assert to
libxl__domain_build_info_setdefault to check if device_model_version
is really set.


Olaf

--Sig_/hsGsCzkzFuu8CpXta=y_a4m
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNmDAQAKCRBdQqD6ppg2
fr7nAJ9TUxhbo4i/+ug/jAdH6YqN4LmiVwCbBZOrzzzrg44aX/VjQU7dg0IjHKI=
=Vmz3
-----END PGP SIGNATURE-----

--Sig_/hsGsCzkzFuu8CpXta=y_a4m--


--===============1000643487623551867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1000643487623551867==--

