Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B071EACC
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 11:17:04 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQpyu-0007Z6-Fz; Wed, 15 May 2019 09:13:48 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YIY1=TP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQpys-0007Z1-0Z
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 09:13:46 +0000
X-Inumbo-ID: bc59dacb-76f1-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bc59dacb-76f1-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 09:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557911622;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=fR2KdtUYox9v+oDzWKJwckNL7vYOOww8PWFDDdwPwWg=;
 b=EhonA9cPiWGlYHs2bouxv29ueFt+jkFtrjkbu9m59VW8Nw5BRWbgYN6J4yOdWCCXW0
 i0jGphc1YoMzjMlqrSxtifrZi2pjrewGctB5PufC4H3XgEp7RaSWW100s8xSZEU5pvWu
 cG6NjJ61bdyaC8fA/sCd+LbepryAqpDWeszGJBGIUQZTizcUNZ3bd7VBniWOfUSsRnTn
 ObWXAuD3Y3MOkc4D7JaqhmTrtFZ07M9VTxvIBkiXpLp72ZlAX4bqYeXX1LZ0gSR20yX/
 jt5CZPlT4Njl9g9LmVYoTxQ2yr08D3Az2QrKWK1NfkOUVuavWXhQZL+ynZMEcLHwxDsE
 YyXg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxvZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4F9Dc9Ja
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 15 May 2019 11:13:38 +0200 (CEST)
Date: Wed, 15 May 2019 11:13:34 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190515111334.3804ebb3.olaf@aepfle.de>
In-Reply-To: <20190514143227.GG2798@zion.uk.xensource.com>
References: <20190514072741.11760-1-olaf@aepfle.de>
 <20190514101856.6otetd56n72t42bm@Air-de-Roger>
 <20190514123118.6c9ecbf7.olaf@aepfle.de>
 <20190514103907.2fc6pf7p64m3c7fh@Air-de-Roger>
 <20190514143227.GG2798@zion.uk.xensource.com>
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
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>,
 Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============3518132398757661120=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============3518132398757661120==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/gSUegA.XTVd5PNyTVvHcEni"; protocol="application/pgp-signature"

--Sig_/gSUegA.XTVd5PNyTVvHcEni
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 14 May 2019 15:32:27 +0100
schrieb Wei Liu <wei.liu2@citrix.com>:

> Olaf, if you can provide me with an updated version of the commit
> message I can fold that in while committing. No need to resend this
> patch.

Maybe just append this paragraph?

The upcoming change needs a full libxl_domain_config, and the existing
libxl__domain_build_info_setdefault has just a libxl_domain_build_info=20
to work with.

Olaf

--Sig_/gSUegA.XTVd5PNyTVvHcEni
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNvYPgAKCRBdQqD6ppg2
fm5yAJ4n0Rfv9KW3rf8FHAlX7K5MhjlE2wCfQv9ny1/AlPW9hHm/8dgGZ6a3ELE=
=9xzr
-----END PGP SIGNATURE-----

--Sig_/gSUegA.XTVd5PNyTVvHcEni--


--===============3518132398757661120==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3518132398757661120==--

