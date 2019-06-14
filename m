Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B10045E1D
	for <lists+xen-devel@lfdr.de>; Fri, 14 Jun 2019 15:27:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hbmAn-00025m-D7; Fri, 14 Jun 2019 13:23:17 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dWsK=UN=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hbmAk-00025h-SE
 for xen-devel@lists.xenproject.org; Fri, 14 Jun 2019 13:23:15 +0000
X-Inumbo-ID: 8f11d0ed-8ea7-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::8])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 8f11d0ed-8ea7-11e9-8980-bc764e045a96;
 Fri, 14 Jun 2019 13:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1560518592;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=nC4TdOhsL9tjotp3arttOrLfCs0VY+A6A2c2ZjPTa5o=;
 b=WfA98TReqc5Pg6xph3Y8LxZ6HR99bwKc7/wXtlOh0S946rjIBkQiqIdbEKxR7zusuN
 gZwJHXCEClj0X8kOWbzUneziZz+GrrHS0Byta5gJMIdLKrOj2FPDrgy0eoM7tGYvNw/1
 9rnqoIZtvwHmj1UAlOmhatl8GRSq6h1eWfI6kwF70zGB03rPEdA4q+WUPnc+lkW+6+1+
 7xnhZMWpbVL0O3tXPNAHSXigE3pEFL78MRJgtVUULAuexd/KkbdHYQ+bMGrQGS9lf8ve
 OpQce2hamwgRSa4aCajjWAlmYR3ebWRl/Vg1GMNwEfAQmTBs6UjlJCIY02qstOC6f4u2
 N1dw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMljcg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.23 SBL|AUTH)
 with ESMTPSA id g0b44av5EDNB5gx
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 14 Jun 2019 15:23:11 +0200 (CEST)
Date: Fri, 14 Jun 2019 15:23:03 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20190614152303.12d95e85.olaf@aepfle.de>
In-Reply-To: <20190605105338.GH2126@perard.uk.xensource.com>
References: <20190522145140.12943-1-anthony.perard@citrix.com>
 <20190522195442.5bf116ff.olaf@aepfle.de>
 <20190523094148.GB2126@perard.uk.xensource.com>
 <20190605105338.GH2126@perard.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH qemu-xen 4.10 & 4.11] xen_disk: Disable file
 locking for the PV disk backend
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
Cc: xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============8298081632735485446=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8298081632735485446==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/tk2F3YqQApaWXs/lmwDSoto"; protocol="application/pgp-signature"

--Sig_/tk2F3YqQApaWXs/lmwDSoto
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 5 Jun 2019 11:53:38 +0100
schrieb Anthony PERARD <anthony.perard@citrix.com>:

> Olaf, did you apply this patch and run some guest? Do they still boot?
> It doesn't matter if you can't trigger the race with or without this
> patch, I just want to know if there are any regression.
> So, may have I your "Tested-by" ? And I will try to apply it to our
> qemu-xen branches.

I can not reproduce it myself on the systems I have available.
It seems that patch went already into qemu-xen.git.


Olaf

--Sig_/tk2F3YqQApaWXs/lmwDSoto
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl0Dn7cACgkQ86SN7mm1
DoA/fBAAoj37z1Gn/XMq+QCWAI3jwXgo0rdh9/zmWPwB22rKMSllgN5vbKuUIDNA
qrTSOlN19T1WwXVeodIJpUPHw2D3ix76WoBp2AO6vt+w4rw7S1YQIdXv2NSlCH4B
MJOLxAuSMDIyteUKxPp8dJOCJVd4b1aXC6yQYuBjiElbPYt3aa93jyeT68qc9ruw
5QT8DxkM1fJLpi7HXPu9TzMess2fN86r5IZG0cbEeUeVaM+bv5qSjYzI3hQTQrat
gkrPij17Vv4hzYHmhMqsm6+klNnjKKa7RttbJB0PLRk+kJAJutfDk6RKIGS6b08j
B4B6pIlUuY2+CHU8vaQ/Y/KWZsIOngykXmtj8DoyYtgBKFBkfTlzk8niXqBQauX+
qbnQaAh27tkwOW0j+ab2v8o77XWoc01O4zVkBQm3kNQWn3dzWozCo/SY95iqWbr4
2GI8p0U5RwFM5TlIDCW5HZHLdpkQEY1V7Dv4beWl1mpGddyFnA12zFNm6ZSnc8iZ
Wv4B8izARghWpyPabBDZQrPHBc+CO/XNiqcIDOozXlFdypZVO3AstYZu/+83Rltv
rQzzqFujROmM/Y9aD0lcubgCZ8AIBSEA9vYu0jUR/6CFarBQhVP+xKjiPH4Hp2fx
UmHoyITPwcQJjee3GeM9sPoKlZV2KZoHJJA1CtYZaVW4jTqL73k=
=jXHl
-----END PGP SIGNATURE-----

--Sig_/tk2F3YqQApaWXs/lmwDSoto--


--===============8298081632735485446==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8298081632735485446==--

