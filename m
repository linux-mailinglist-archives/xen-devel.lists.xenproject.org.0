Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C0C8CD45
	for <lists+xen-devel@lfdr.de>; Wed, 14 Aug 2019 09:55:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hxo4Y-00012v-6b; Wed, 14 Aug 2019 07:51:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=P7VX=WK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hxo4V-00012q-Vs
 for xen-devel@lists.xenproject.org; Wed, 14 Aug 2019 07:51:52 +0000
X-Inumbo-ID: 5f6b602c-be68-11e9-84e2-e36f510a3411
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::5])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5f6b602c-be68-11e9-84e2-e36f510a3411;
 Wed, 14 Aug 2019 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1565769109;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=tVHsbdhUkugKJT8rabv6PPnUWESUI8ey26ukDYLjIZc=;
 b=lBLbaCYASk8+3A5oCNSWOZdtJMz0xzCxG8v3a1BG7qpTw9Xbmfd8gO8qGxA1uGTK6t
 WqpGX8SaXinkE8Sg/SA5sB0pDOd2yGIQ0STbWn6XII+4izANbP+MTEyYYsz2i3khXvgJ
 gSO+rqrvD3XM9zZxH2TxxbJLn1zE+0HVhrhSITQzsHT3fDRQU1CvBYTK/eYb7IdINQPS
 BpOK2nfp3ORU7F+gDWWzv/BEqSonVjZuSVt1dmMBTYBwuBli/VIat9b/dxKc/CsMZ/lo
 3tgoTFzmNqpUqwYij2wce2Ojkh73MDz0Ut2kKBcLMaGIutJ+JJ/2Ujr1zBOTTnBCOiXt
 T6rA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 44.26.1 AUTH)
 with ESMTPSA id q09c76v7E7pn2NS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 14 Aug 2019 09:51:49 +0200 (CEST)
Date: Wed, 14 Aug 2019 09:51:45 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190814075145.GA10492@aepfle.de>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
 <20190515121804.4e4a2c85.olaf@aepfle.de>
MIME-Version: 1.0
In-Reply-To: <20190515121804.4e4a2c85.olaf@aepfle.de>
User-Agent: Mutt/1.12.1 (20190626T160221.793e0fc2)
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
Content-Type: multipart/mixed; boundary="===============0794284705510070043=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0794284705510070043==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 15, Olaf Hering wrote:

> Am Mon, 13 May 2019 17:20:05 +0200
> schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:
>=20
> > Let me know if that works for you and I will submit it formally.
> Yes, it works for me. Thanks.

Did you have a chance to submit a fix to support '--disable-pv-shim'?


Olaf

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl1TvYwACgkQ86SN7mm1
DoAClA//dtc3VJRc/kunN4ubO2ZZ+ddLwE59b9TihJdJsL6/a2mKRU6w+wXbzX1K
99f/bNQkBdFuZ3bk9JuuQ8ufmK6DzaRehUr0jk9az3OYDBHrbim1WJgxoC06/AtH
0GTKDGdbE/Xuk9NLdM0kagkAz0o0RsQSwiPlPO8mRp8Pe5sKwKYO9Uvq9gyOtRee
bbmne50KHlbeZ8dw7q8e+VdphyXQo262QMSe24fZUAftv3g0h8/O/o6rGsBzIQWu
Ux9+PWtL2oJIG3zMofTuem8T3b8bvgKkpiZw+QFr+qbhcNsJW0Bmbb1jCEgw4sxv
Inj4WH6+7vQuNo9tFYDE3DcaoCzxyv1qjIdv1RDzJrZhpucnYnAmUPl7k6blHstv
B2YIGC+V7oTDYUz7M2LTMD2P7sk9rGKmaOztvTWaV58lim3Ac+JsiPIysdgRVs1A
0JYvbrYUH9DlSNK1H+2BocHixQJItee0/b3JFYxS3IAoCUHbvz8ILZl02vsxGK3l
e4hga2bdCwTUuolqetutV6T/sHHqisPm+SsYloBk3/Yx2eOrjmfoKywvHWajO39A
SPOhWnQXoM+R/JUiF4QmjACyf57R4TpwB8lgElkZGx1pVrKuYGu8oCwP7XE1AR+M
sXxJ5A3JlF26OnamRotdCgcYAbi831AGPBP6AEG5WcD01ciUANM=
=ffmP
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--


--===============0794284705510070043==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0794284705510070043==--

