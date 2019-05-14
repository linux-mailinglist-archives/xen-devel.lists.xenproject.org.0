Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 332BC1C711
	for <lists+xen-devel@lfdr.de>; Tue, 14 May 2019 12:34:27 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQUib-0004lB-2U; Tue, 14 May 2019 10:31:33 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZE1V=TO=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQUiY-0004ks-No
 for xen-devel@lists.xenproject.org; Tue, 14 May 2019 10:31:31 +0000
X-Inumbo-ID: 6e7255b9-7633-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 6e7255b9-7633-11e9-8980-bc764e045a96;
 Tue, 14 May 2019 10:31:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557829887;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=/thTXi7E1r4LdOg5N9Pkgb4doN4axX38cDnLkTHO9v4=;
 b=HgbpBL9jjy13geXtVRvRGbmpNltBwqFA4cVHVbdSwGm4hBP4p0HzYGXn1PhJyldrdA
 LAnb9Bu1aU6qUH8xNitXGv7jaUDPuMp3ziaERCSEoLyAwgI0G2J9/RyVK3MXOgBFcFjw
 R++prdSbJmqlejir99JyLZWXJ/osV7YQGaO4Y1FjT3rubOx8+PU/WNep6uDK09xDNAN2
 LjIkhvj4J9XF513pigbMaTvDzIe3jM4sToIrB7y45phlJ2KhYPAl9aZQaDmxT/BWcw2t
 Ft/xaHjD2cxlmqmFjGo6C0Wnd05S2u6NhdkWiMCzdhwNw6hRFaWYXuNInB0i6tsSxIFX
 Pkqw==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxvZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4EAVN5B9
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Tue, 14 May 2019 12:31:23 +0200 (CEST)
Date: Tue, 14 May 2019 12:31:18 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190514123118.6c9ecbf7.olaf@aepfle.de>
In-Reply-To: <20190514101856.6otetd56n72t42bm@Air-de-Roger>
References: <20190514072741.11760-1-olaf@aepfle.de>
 <20190514101856.6otetd56n72t42bm@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] libxl: add helper function to set
 device_model_version
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
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============3647530762898866885=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3647530762898866885==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/CJmrXv7LYMugA+s0DROyq7G"; protocol="application/pgp-signature"

--Sig_/CJmrXv7LYMugA+s0DROyq7G
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 12:18:56 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Why is it not fine to set the device model version in
> libxl__domain_build_info_setdefault?

Because it receives just build_info, which lacks all the data to decide
if a device type needs a device model or not.

Olaf

--Sig_/CJmrXv7LYMugA+s0DROyq7G
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNqY9gAKCRBdQqD6ppg2
fqR0AKCbbizkNR4zccoPk1lP1731CFURIQCglusL9jSXRRSZNu/XWA1+3HZjJHA=
=vAPc
-----END PGP SIGNATURE-----

--Sig_/CJmrXv7LYMugA+s0DROyq7G--


--===============3647530762898866885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3647530762898866885==--

