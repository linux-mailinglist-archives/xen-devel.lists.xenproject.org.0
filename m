Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2E4DC450
	for <lists+xen-devel@lfdr.de>; Fri, 18 Oct 2019 14:04:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iLQuZ-0003i1-I4; Fri, 18 Oct 2019 11:59:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=JOGf=YL=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1iLQuX-0003hw-EG
 for xen-devel@lists.xenproject.org; Fri, 18 Oct 2019 11:59:14 +0000
X-Inumbo-ID: b2a64c98-f19e-11e9-8aca-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::10])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b2a64c98-f19e-11e9-8aca-bc764e2007e4;
 Fri, 18 Oct 2019 11:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1571399951;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=3eXiHW2Imx71HJJsQGqj0nGTexLuX9XbxnI+nIe6qLI=;
 b=SGV4YAfOtZ6CEXJ7G8+1FoPflziKFKUdxJq+0VU/VVJbh5KohCSxZOsUvvQK+33one
 4UeFCw2c3HCaGpi9X3w0DdqYE7ySrKhxQnLEHPG/d+cLN5t3RxgUYD9uVqbPHiAMejSE
 7gRFPLvu4DzGgzxQf3Eq59OqGEc5v4csuyijbNZXMnvpZ8Grvq69OsWAT47Diixboloo
 BmZERkeAiNQklTv0zbztl7+cT1xBWffzA/YR0tTMp4rJpYbiBNPdJDjm//YyPJ2eD3LC
 H6PFUa7nglnmvPXiH5Qmer4ZZNCcbg2QU5Ys7R3T04YxlmTkygUH9bRnTsoyGPxg4B7w
 g35A==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.28.1 AUTH)
 with ESMTPSA id e01a77v9IBx4BL8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 18 Oct 2019 13:59:04 +0200 (CEST)
Date: Fri, 18 Oct 2019 13:58:55 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20191018135855.1e6544f4.olaf@aepfle.de>
In-Reply-To: <20191002170543.26571-3-olaf@aepfle.de>
References: <20191002170543.26571-1-olaf@aepfle.de>
 <20191002170543.26571-3-olaf@aepfle.de>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 2/8] tools: add with-xen-scriptdir
 configure option
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
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============8709834928652602534=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8709834928652602534==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/ANdUQ9i/9Nz1=kggwSavaN6"; protocol="application/pgp-signature"

--Sig_/ANdUQ9i/9Nz1=kggwSavaN6
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed,  2 Oct 2019 19:05:37 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> add a knob to configure

Was this ever considered for merging, or are we done with this series?

Olaf

--Sig_/ANdUQ9i/9Nz1=kggwSavaN6
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl2pqQAACgkQ86SN7mm1
DoDa3A/8C8YxezF2aKC6L89tgiHgf/7ZvBK04++DL5TiYG7d0wjabl9fcGs0CFpT
GA0NDgOXFabzNlYGiZtxTxKHe7FnXhSjOiBFnHpPS0CP1NJmLIaNv+wulaHTWjg6
D5yY1lq0LaoPNI0+sYGkR94K7AAhhyqtYgfjYveganSvLODb9hQR6ogCNJxpMaye
6bI2bcrcYyHXRS0hC9jYOoM7MjCd87mIrFb9ZteeqEZfZ2B9g2V5aZCQgFxvy5g8
DM/FOgH99Km7HGRrsrvsVONqURUqGfBIdYB//yssmtFg6gxTpUCmTOnBan9Ha+vS
7E3b8aa/wf/a0Pf26KDtpFfVXICtGCxzfIjfNl7dT7YLomJZsZ0Ypi/B2stICGuS
IV3NAXMpn/2VMZywaBfK6p9P8/Okg2RJVme1Vg9xWDA6ZZtPHWlMgOufAMNzZbop
GN83Qr3FJazYDfERb8nvkBjrXy9LxwMYGcSUZjq67JHEPJwKkYXPmsUiQIvfKsQB
AcuR3eXYeVqLCRaDB3cZiS/pgmEa9eofZHZGTdoBHY4Rw32RsvG/mGfyNzQRigIO
VOikWZprTsY7QnVAf1I+KaxUwoSwdtngN68zrJOqKYTyQtcvKpnIzWpaO9p8GFa5
G6u7aDmQNUjOqPCLTWaMZ60hUA/4F6Qg/vh/I/Rt0GESbNQyY44=
=H8UY
-----END PGP SIGNATURE-----

--Sig_/ANdUQ9i/9Nz1=kggwSavaN6--


--===============8709834928652602534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8709834928652602534==--

