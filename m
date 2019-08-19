Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AB5F91E87
	for <lists+xen-devel@lfdr.de>; Mon, 19 Aug 2019 10:02:03 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hzcXt-0007vi-Mo; Mon, 19 Aug 2019 07:57:41 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=sdNb=WP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hzcXr-0007vd-NK
 for xen-devel@lists.xenproject.org; Mon, 19 Aug 2019 07:57:40 +0000
X-Inumbo-ID: 02b413e0-c257-11e9-b90c-bc764e2007e4
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::4])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 02b413e0-c257-11e9-b90c-bc764e2007e4;
 Mon, 19 Aug 2019 07:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1566201457;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ayRJ3dMcRY6UpNfMSczSBge3zKazQKLmW0iQgMnYeA8=;
 b=DOx243QMBAkBTnpaqxd6TnWw3fc1oF/J7O9kAw/80k1p5RuQu5HpUilIZg7B6MJeFg
 FxIeqOHHCzBP1TtrEyN7RUIvmDXnuM6e8xxE7K8Rf5T+z3t7nnocRtxMBbChoIvCUnnF
 o9O620MG/8IHgmsUy8YYg7H112OD9kim0NTgaIN196UM6c4Jcbu0h2H3J/06dvcp7h/Z
 x9SRhviABBXJ2rRhfsEzoF0F/iPpbeQim3S0KcVQlyoaPp7sbXs9ohUYZvLm1U13ByDn
 EOscZ6qbcLckBszdkj8erO+ThWFZpexZ722bipbl7gFvutF6l3pOMiHU5QsPCLPqWrEf
 nwIA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.26.1 AUTH)
 with ESMTPSA id q09c76v7J7vXGqD
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Mon, 19 Aug 2019 09:57:33 +0200 (CEST)
Date: Mon, 19 Aug 2019 09:57:17 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wl@xen.org>
Message-ID: <20190819095717.707845d0.olaf@aepfle.de>
In-Reply-To: <20190818172026.25jeivjl7gpydynh@debian>
References: <20190621093005.29329-1-olaf@aepfle.de>
 <20190818172026.25jeivjl7gpydynh@debian>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] docs: substitute XEN_CONFIG_DIR in
 xl.conf.5
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============7911364625120482470=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============7911364625120482470==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/NUQNI/zICiMMNYwmptE=YO4"; protocol="application/pgp-signature"

--Sig_/NUQNI/zICiMMNYwmptE=YO4
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Sun, 18 Aug 2019 18:20:26 +0100
schrieb Wei Liu <wl@xen.org>:

> This doesn't apply. There is no such file.

My changes need to be applied in this order, some of them may apply in any =
order:

20190619120633.27466-1-olaf@aepfle.de
20190619121715.28532-1-olaf@aepfle.de
20190619123818.30747-1-olaf@aepfle.de
20190619130335.3458-1-olaf@aepfle.de
20190621092944.29241-1-olaf@aepfle.de
20190621093005.29329-1-olaf@aepfle.de


Olaf

--Sig_/NUQNI/zICiMMNYwmptE=YO4
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl1aVl0ACgkQ86SN7mm1
DoDJjBAAgGNOacxHcn/zLEx3QZK1d2J7O0pwiT4/VMfz40FLb+R6tfuUyMemmjkD
RIhVIyCAcbIfkiM8rNpmCQCLWE5KD6O1Vgx/92lGQegahvT7YgaMJzrglDcw5o6v
u9GSvuJiFSaOxinxEGw1dMwILEypTTiL+z7BmS7LSo6k/wVVzJWIHvpDRaMmGD92
6mgrZUUvAhfiLsfPg7ijP9GOpnPfjbkE+O5knQE0zcgtEcMiwePS78F4CgW20pbW
6AsxSa+aibLZaa49OX8doAR1C/4ASYPh35gZKuSoHu3N4bmoW/CEiJ2lxNnoKToj
GY/2ajOTuxmDRpEvTEqW5tVswZfv6S/uSaei6fexterKYL9ORjyWPkqcStUKSgum
c7dzdCSJ0MTa1elxoQ9XzHNR3IPX+m19NSZfFIoq1NWcJyyKLWXlRqDlsyYnOyKm
i0QXefczMaqhUOA3iG30Zn5s4ZoTgXUnA6XPnyvTCZDTo3QG/fbdxAalxuMw8d88
PkjFsydD0PJE1K548K3xhcZscPMzwtuTMwn9mfOXVoPc8sOhGVv8wa1hmjqY1dqi
s9K4OLzJuX+NT9cwFib2QPjpS4slics2GlAJ+TVJJ+wjYr2ygJtK9kD34lZBNQIe
LbXMbhxPLYOjbwvfjVsCo3x92XN3KCn/o7pC4o68bepLo/NnnpI=
=92Eu
-----END PGP SIGNATURE-----

--Sig_/NUQNI/zICiMMNYwmptE=YO4--


--===============7911364625120482470==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7911364625120482470==--

