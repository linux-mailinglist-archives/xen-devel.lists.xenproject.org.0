Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DBD18B15
	for <lists+xen-devel@lfdr.de>; Thu,  9 May 2019 15:59:51 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOjXK-0007IJ-PO; Thu, 09 May 2019 13:56:38 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=vYVB=TJ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hOjXJ-0007IE-CX
 for xen-devel@lists.xenproject.org; Thu, 09 May 2019 13:56:38 +0000
X-Inumbo-ID: 41770222-7262-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 41770222-7262-11e9-8980-bc764e045a96;
 Thu, 09 May 2019 13:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557410194;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=7VWTLER/kYZk20k3ZuOcy3sEylpJJrM9F52U9w5jtHw=;
 b=an0g72npNQ8m/B2OCCtvyn3jjHM8g9YFsSj4zW4/8UOww9tGeJecl+ZqDHls/PP5bZ
 8lmLlgD1CEpYZfuFhRaHHidqTykw7rv990OgcAFWwO7BSJaOjAdbuo0NJHXmT/n5uzDe
 6GjdnvdeyU/mnZ9uQrU8yoSJwDnuNKo14V/8r2GMY32c7zsA2sK+aRJPAN/5yT4SGtsU
 nCfK2w1zbOO34EWIZUE7jW4sCsFsyleCVo7QIKkHMg2O/vJykHchAZLSPgmXe2XlKrLa
 BxrPwi4nhOBKia9LF1p8h8wOEl842HD/1FWjODfvnpPWfJjAl6u105/BtaiuZrpIvWaT
 tjZg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 AUTH)
 with ESMTPSA id 60a847v49DuQmhz
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 9 May 2019 15:56:26 +0200 (CEST)
Date: Thu, 9 May 2019 15:56:21 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190509155621.20698a9f.olaf@aepfle.de>
In-Reply-To: <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
References: <20190503094251.16148-1-olaf@aepfle.de>
 <20190503110411.so4kiwmji4en3ugc@Air-de-Roger>
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
Content-Type: multipart/mixed; boundary="===============8959549798593108345=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============8959549798593108345==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/=4JdR3O0_C/35XrYDUnIa4_"; protocol="application/pgp-signature"

--Sig_/=4JdR3O0_C/35XrYDUnIa4_
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Fri, 3 May 2019 13:04:11 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> I think the above call is wrong, libxl__need_xenpv_qemu expects to get
> the domid of the toolstack domain (ie: the domain running this code),
> not the domain being created.

So, how do I actually test such setups? It seems a driver domain is
required. According to xl-disk-configuration(5) I may need to specify
backend=3D$domU. Is there some guide how to configure such thing?


Olaf

--Sig_/=4JdR3O0_C/35XrYDUnIa4_
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNQxhQAKCRBdQqD6ppg2
fm3zAJ9cn1CdIBGySLyTsUW2sQPnBDHnEACeMEcBXSCM4eE8CUxNpaef6K8T6Gg=
=59AV
-----END PGP SIGNATURE-----

--Sig_/=4JdR3O0_C/35XrYDUnIa4_--


--===============8959549798593108345==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8959549798593108345==--

