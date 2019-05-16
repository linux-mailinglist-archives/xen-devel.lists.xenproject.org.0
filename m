Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A26F20858
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 15:38:23 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRGYR-0007ly-1t; Thu, 16 May 2019 13:36:15 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hRGYP-0007lt-9W
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 13:36:13 +0000
X-Inumbo-ID: 90a6df47-77df-11e9-8980-bc764e045a96
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 90a6df47-77df-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 13:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558013769;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=o6mmpiC0Y6uifsGLhGGDFU+Fz8DLclbJb+YrlbvWABs=;
 b=GDhdcghzKis7y13s9KQqQ1ZOszSmF8ekouyfP/NDyJ904AnceYuwy7JJDNH0hnImZ8
 0Ph0GNx5OdRqcXei5kA84sSeGKMlc9HoNxxug344D0DwpbTPSoHXu0zZiMzlm5MLXgrB
 KmSauepZ7+VHHt1BJIi4vrQ4iGmzwvpq/TZU8/Ht86ZmWZ1T0PeH6nIJF3v6KAr9ES9C
 jTv3h8WCDFJHxedn8UwQyug6e4V0lX9cRtzQYlKgrjJLPhv9uw+qpZCmUrAijHX7MjHE
 pbWvcKCWPm3CnbaBR/aktgvoqOO+qzDJXHHAwQph2pxokybPPS3j8vuE5mwmN6FfOrZT
 bSHg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4kV1cX92EW4mFvNjTRB"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4GDa5FHn
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 15:36:05 +0200 (CEST)
Date: Thu, 16 May 2019 15:36:01 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516153601.45352e5c.olaf@aepfle.de>
In-Reply-To: <20190516133013.GG2798@zion.uk.xensource.com>
References: <20190516125000.23559-1-olaf@aepfle.de>
 <20190516133013.GG2798@zion.uk.xensource.com>
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
Content-Type: multipart/mixed; boundary="===============6729522767722773005=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6729522767722773005==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/4Wo2taGBqnIPTkUB5pKT7oq"; protocol="application/pgp-signature"

--Sig_/4Wo2taGBqnIPTkUB5pKT7oq
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 14:30:13 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Would the following work?

This is not exactly the same because that copy will end up in
libxl__domain_set_device_model, and we are back to square #1.

Olaf

--Sig_/4Wo2taGBqnIPTkUB5pKT7oq
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1nQQAKCRBdQqD6ppg2
foUFAJwPOvRUkL7ps28S0X4A364IkuQC2ACfQKFG91IN4yLY1kyq/RBVl7y/gFg=
=YcFb
-----END PGP SIGNATURE-----

--Sig_/4Wo2taGBqnIPTkUB5pKT7oq--


--===============6729522767722773005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6729522767722773005==--

