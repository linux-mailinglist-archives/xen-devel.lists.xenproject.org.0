Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 583391C715
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:36:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUlB-000538-NI; Tue, 14 May 2019 10:34:13 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQUl9-00051G-3F
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:34:11 +0000
X-Inumbo-ID: ce74d080-7633-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id ce74d080-7633-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 10:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557830048;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=h3lHglN4UdpjBodiT9LKkh97b3b7JJj8hxcKwmkktyU=;
 b=MKwVbZ4rB6JwJIBoWcTLY1VrzePI/7Drg9VzJFqt0qOluXKtRl0TQuc9C14hKJ/bzk
 GRjjXj5BGs6H9/jJ9k0NYzy1MwdeLPFOneC4TZQ1JOGsTwNky5FJhbNOGnxvgAi9hQWh
 lMPLnaeDvMnjcF6lIcBA3aKQN4N83NunRadrHrt04gDe+b2menvcSU5y24w0ow7dVJbl
 irMqrsZ5UWzVkZRVkz+GS+fz2N5awaBq25jt6Nn5BIB5RDcEh6GCEI77B5TALVdi/Cl2
 kQMnwESW8o8yIrXfVv0kueyJ2NPjPcmaLwzWLdz1PaY7XoKjXMHRuNdaTDbvSUfFXjPR
 9MlQ==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxvZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4EAY75Bn
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 14 May 2019 12:34:07 +0200 (CEST)
Date: Tue, 14 May 2019 12:34:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190514123406.72eda0f8.olaf@aepfle.de>
In-Reply-To: <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] how to disable build of pv-shim?
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============3810808372010780047=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3810808372010780047==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/VgQdPSsHvT/CSX09GDcuXnx"; protocol="application/pgp-signature"

--Sig_/VgQdPSsHvT/CSX09GDcuXnx
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 17:20:05 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> enabled by default

Does anyone actually require it at all?
Those who do pass --enable-pvshim to configure. No need for (incorrect) hos=
t_cpu checks.

Olaf

--Sig_/VgQdPSsHvT/CSX09GDcuXnx
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNqZngAKCRBdQqD6ppg2
frAuAKDER/KWzipowZFkGOOwEs8yMvXRVACgqYVw+qcD7iab3D/ppuC+5vTPKhQ=
=HBOr
-----END PGP SIGNATURE-----

--Sig_/VgQdPSsHvT/CSX09GDcuXnx--


--===============3810808372010780047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3810808372010780047==--

