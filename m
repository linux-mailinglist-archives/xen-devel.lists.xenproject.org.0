Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB7B13A26AF
	for <lists+xen-devel@lfdr.de>; Thu, 10 Jun 2021 10:22:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.139661.258251 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrFwi-0006U2-QZ; Thu, 10 Jun 2021 08:21:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 139661.258251; Thu, 10 Jun 2021 08:21:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrFwi-0006Rv-NB; Thu, 10 Jun 2021 08:21:48 +0000
Received: by outflank-mailman (input) for mailman id 139661;
 Thu, 10 Jun 2021 08:04:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g+bs=LE=mittwald.de=s.kieske@srs-us1.protection.inumbo.net>)
 id 1lrFgG-0004mx-1p
 for xen-devel@lists.xen.org; Thu, 10 Jun 2021 08:04:48 +0000
Received: from mailbulkout04.agenturserver.de (unknown [153.92.196.163])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id abbf89da-0741-433d-8658-2910531f69ab;
 Thu, 10 Jun 2021 08:04:39 +0000 (UTC)
Received: from mail03.agenturserver.de (mail03.internal [192.168.51.40])
 by mailbulkout04.agenturserver.de (Postfix) with ESMTP id 4D47C42405;
 Thu, 10 Jun 2021 10:04:38 +0200 (CEST)
Received: from XXX.XXX.XXX.XXX (XXXXX.XX [XXX.XXX.XXX.XXX])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: p1000p113)
 by mail.agenturserver.de (Postfix) with ESMTPSA id B3DE4413A5;
 Thu, 10 Jun 2021 10:04:37 +0200 (CEST)
Received: from XXX.XXX.XXX.XXX (XXXXX.XX [XXX.XXX.XXX.XXX])
 ex2.mw-ks.local (2a03:2a00:0:3:edc0:71ef:fb82:674a) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 10 Jun 2021 10:04:37 +0200
Received: from XXX.XXX.XXX.XXX (XXXXX.XX [XXX.XXX.XXX.XXX])
 ex1.mw-ks.local ([fe80::e187:7dcb:b1d9:d875%2]) with mapi id 15.01.2176.014;
 Thu, 10 Jun 2021 10:04:37 +0200
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: abbf89da-0741-433d-8658-2910531f69ab
From: Sven Kieske <S.Kieske@mittwald.de>
To: "xen-announce@lists.xen.org" <xen-announce@lists.xen.org>,
	"oss-security@lists.openwall.com" <oss-security@lists.openwall.com>,
	"xen-users@lists.xen.org" <xen-users@lists.xen.org>,
	"xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
CC: "security-team-members@xen.org" <security-team-members@xen.org>
Subject: Re: [oss-security] Xen Security Advisory 375 v3
 (CVE-2021-0089,CVE-2021-26313) - Speculative Code Store Bypass
Thread-Topic: [oss-security] Xen Security Advisory 375 v3
 (CVE-2021-0089,CVE-2021-26313) - Speculative Code Store Bypass
Thread-Index: AQHXXTa+QYm8IqItZ0WWKzH19j3F/KsMwoyA
Date: Thu, 10 Jun 2021 08:04:37 +0000
Message-ID: <90160ae63614ca1098c87f5c60002b9a35e922ef.camel@mittwald.de>
References: <E1lqybO-0000fZ-5i@xenbits.xenproject.org>
In-Reply-To: <E1lqybO-0000fZ-5i@xenbits.xenproject.org>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
x-originating-ip: [2a03:2a00:2:1::48]
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-0l3DJMvbZ87xKiFC2jeo"
MIME-Version: 1.0

--=-0l3DJMvbZ87xKiFC2jeo
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mi, 2021-06-09 at 13:50 +0000, Xen.org security team wrote:
> For more details, see:
[..]
>   https://www.amd.com/en/corporate-product-security-bulletin-amd-sb-1003

The above link turns into a "Page not found", at least for me, I believe th=
e correct link is:

https://www.amd.com/en/corporate/product-security/bulletin/amd-sb-1003

HTH

Mit freundlichen Gr=C3=BC=C3=9Fen / Regards

Sven Kieske
Systementwickler
=20
=20
Mittwald CM Service GmbH & Co. KG
K=C3=B6nigsberger Stra=C3=9Fe 4-6
32339 Espelkamp
=20
Tel.: 05772 / 293-900
Fax: 05772 / 293-333
=20
https://www.mittwald.de
=20
Gesch=C3=A4ftsf=C3=BChrer: Robert Meyer, Florian J=C3=BCrgens
=20
St.Nr.: 331/5721/1033, USt-IdNr.: DE814773217, HRA 6640, AG Bad Oeynhausen
Komplement=C3=A4rin: Robert Meyer Verwaltungs GmbH, HRB 13260, AG Bad Oeynh=
ausen

Informationen zur Datenverarbeitung im Rahmen unserer Gesch=C3=A4ftst=C3=A4=
tigkeit=20
gem=C3=A4=C3=9F Art. 13-14 DSGVO sind unter www.mittwald.de/ds abrufbar.


--=-0l3DJMvbZ87xKiFC2jeo
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEdKGxKl7rK5iwbpcWxvL1MwMBtBEFAmDBx5MACgkQxvL1MwMB
tBESWRAA1dpFqCNLMZBg07fdyqYg4VJ2uM+jRKRrPFBLev0QNYF/VRjs7vtO/R/4
/gHlFoOX4uxaMO0GFlPgQ8bZ6qKmNTQ4CDIsLgWvIPf4Ldy0p3Qs92AQxyEGLHpL
IFc1qNdn07koYU+KxfPKNMFH1TZAqrU+hGZec68LtyhVBSpYKby/co2iZ6bH/88l
6Houy2etNAKkztiEUEEKBPPXTFG8v3AqEXq/mwfOUYU9IfuRPcaxcyvTmKdpwLun
24kU2fbifpwV7YDP1J/Q97p4YwD6Y2TSPDlxEu0eOlWCLQTs1dHx2UPBCZf85CjK
ZgHewt7oFcnwdWmtLtm3Q8/ALWZJdoERDUTOXds8pjjt84Pn9iiHdhNJE7LE0hnR
XFUha/OjQw9NxIer+K4YPo5bbG9wAY0lkFYPYZ05D3Ebnncmk58VXJUkWo+4E3zW
LL0AO2DdcP4UOZef7zwhtDD6BNlBxJSz+YvGtNn1KoS7JkdPFsD61x+MBWZXeqY1
ke8Pdq8BnZPCq/6ked5iJtxOpwkjQWz9Owvr1lKRQOfyw4G5G7hr7eB/6/eXyTRw
Yj29vqAI0F/FtqqaSahtXYlvneLePX5vgajH/C3sdVLkVQvQBVlwF4eqCQRmkmCo
iG658IfWJvD6DsYTGM50PjXunfaSsWKz8j7QDRr6RaHEu3O7Tdk=
=o3nj
-----END PGP SIGNATURE-----

--=-0l3DJMvbZ87xKiFC2jeo--

