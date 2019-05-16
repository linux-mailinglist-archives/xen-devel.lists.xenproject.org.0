Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12B91208BF
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:58:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGql-0001za-Jw; Thu, 16 May 2019 13:55:11 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRGqj-0001zU-K8
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:55:10 +0000
X-Inumbo-ID: 36bff27b-77e2-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::12])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 36bff27b-77e2-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558014907;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=cNt99OcEG135zMUYRkpdc5DJDO958CFQ//3RH23d7JA=;
 b=q9SZ4Hbim7gqcbIIiR44zjkrBvTVQwsuzMjB0MzgCaQzp7vG8g9QEPOk3BZOTAn3gm
 SQHdxOmO8rFDaw/a2dbuPuF7FtBZpWcFagtqL3l/HW1KmtHbQbEJfj3toglltujjsdHs
 4QQJ+A48oCJykscxjEU2cDYKqZn8YFrtsQ/j+nXlOdXCChozcv4aXs/UjEcOBrhZ0MxZ
 +VqLksdu84mGxuw2GIwJqPz7QnZpSaQlBO45RUN4f/Ki/avyZTgAgEzd3uB4HbpW8PtV
 bzh8iZrS7zhpoUblLi0z40kzVFI0e2BroTV475YZUVOgkqO+Cx0yCiCewb82xEO7edNT
 8haw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4GDt3FOY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 15:55:03 +0200 (CEST)
Date: Thu, 16 May 2019 15:54:55 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516155455.3a97d2fb.olaf@aepfle.de>
In-Reply-To: <20190516134653.GI2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
 <20190516153601.45352e5c.olaf@aepfle.de>
 <20190516134653.GI2798@zion.uk.xensource.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] libxl: fix device_model_version related
 assert
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
Content-Type: multipart/mixed; boundary="===============0219521692336972873=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============0219521692336972873==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/8C8J+1NO6Ytas=LcTPFwKSr"; protocol="application/pgp-signature"

--Sig_/8C8J+1NO6Ytas=LcTPFwKSr
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 14:46:53 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Can you clarify?

create_domain has a libxl_domain_config on its stack. This is passed to
freemem, and libxl_domain_need_memory modifies it as needed.
The modification will go through libxl_domain_create_new, do_domain_create,
initiate_domain_create to libxl__domain_set_device_model. This function
will return right away because device_model_version is already set.

Olaf

--Sig_/8C8J+1NO6Ytas=LcTPFwKSr
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1rrwAKCRBdQqD6ppg2
flnKAJ9xLWmgjodnKsd5brrs/MSWWpBh5QCfS2nO2CEK1H5T9M19nczXUAXPI/U=
=j4o/
-----END PGP SIGNATURE-----

--Sig_/8C8J+1NO6Ytas=LcTPFwKSr--


--===============0219521692336972873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0219521692336972873==--

