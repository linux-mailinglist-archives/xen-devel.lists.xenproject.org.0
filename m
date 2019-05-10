Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FCE19E7D
	for <lists+xen-devel@lfdr.de>; Fri, 10 May 2019 15:51:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hP5uC-0006ag-H2; Fri, 10 May 2019 13:49:44 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=dG64=TK=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hP5uA-0006aU-Bg
 for xen-devel@lists.xenproject.org; Fri, 10 May 2019 13:49:43 +0000
X-Inumbo-ID: 74eaf533-732a-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::3])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 74eaf533-732a-11e9-8980-bc764e045a96;
 Fri, 10 May 2019 13:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557496179;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=W55g0vCz+CWRQkA9t84333f0BBapjjkQe8uCcbCikTk=;
 b=aicrvyzS9IZdNRzjhyHGPGQZYVLN6DgsnEJiqNFqJkvtfHD8kymRR/ftKCHZ0DCAUR
 qPYwK1ddpnhd0Wfwp8YyQ79PpTXkmpZ51JGXcdWF2953syvWBt6jhfp7tBJo6TwsTFhr
 HzjDFdQNCg54LY0WP0OgVA9dOQVGyMPHzTqBC/+rnbeM7ZrTNGt7GBszlUgGAS18hKWS
 /ZZWV2ble054Qw+iQni2QQk0iLNJ7+BlFtJPK7H6jaS8q6HuTr7fntOHxdHsKohB/R2s
 WPHpbWFfyMdnpmfdI4ooxpMFtWninQPQMlKSwM0cGdwvWwG+cHokmQzXAt8ZhqzVwvuR
 LErA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuY8ljZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.18 SBL|AUTH)
 with ESMTPSA id 60a847v4ADnS2P8
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Fri, 10 May 2019 15:49:28 +0200 (CEST)
Date: Fri, 10 May 2019 15:49:20 +0200
From: Olaf Hering <olaf@aepfle.de>
To: xen-devel@lists.xenproject.org
Message-ID: <20190510154920.150b4b37.olaf@aepfle.de>
In-Reply-To: <20190510100416.16658-1-olaf@aepfle.de>
References: <20190510100416.16658-1-olaf@aepfle.de>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3] libxl: fix migration of PV and PVH domUs
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============1343591919137417501=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1343591919137417501==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/B.QbEvAiuWVLK420qJdX20R"; protocol="application/pgp-signature"

--Sig_/B.QbEvAiuWVLK420qJdX20R
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Fri, 10 May 2019 12:04:16 +0200
schrieb Olaf Hering <olaf@aepfle.de>:

> v3 not runtime tested

The initialization for device_model_stubdomain must be moved to the new fun=
ction.


Olaf

--Sig_/B.QbEvAiuWVLK420qJdX20R
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNWBYAAKCRBdQqD6ppg2
fk3jAJ9/I+WB4Sj0wWBYieHl+vr33yb+YwCfTr76qioC1THXdaiwrJIDMg/YQAI=
=ZGtk
-----END PGP SIGNATURE-----

--Sig_/B.QbEvAiuWVLK420qJdX20R--


--===============1343591919137417501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1343591919137417501==--

