Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D195A1EBFE
	for <lists+xen-devel@lfdr.de>; Wed, 15 May 2019 12:21:38 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQqzI-0005D5-4j; Wed, 15 May 2019 10:18:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=YIY1=TP=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hQqzF-0005Cp-SY
 for xen-devel@lists.xenproject.org; Wed, 15 May 2019 10:18:14 +0000
X-Inumbo-ID: bda040c6-76fa-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::4])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id bda040c6-76fa-11e9-8980-bc764e045a96;
 Wed, 15 May 2019 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1557915490;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=ZMQQ1FiJNAjSXUwPZwGa5yDXCL1bTgYLhp1FIdfvEXw=;
 b=FOI5SYxlbSAZDeUdcfTo3xfyKRcR9xojJ9OvPApj6u4WzHlhbBw/Mk6c3/Eohh7+Fw
 S3Kj7cdP2ioLMrx4KDOVDqoC38ob9uecPVsZGbMGmRK5kS+8liNVJ8OQ4aT+KheEzxXu
 jcpTC9yQv/qzh7+GwxtRBNs1LF9ZlTOdAksFzWdnqUWkepT9FjUYjDtD7q+LAyjcgNXL
 n5lb5TUmG1aOWIMIZdZnDtVXFdUh4Wzsxs2t0CVQRDndg8ES+hnmYsBJ7BjBYbcbCyd8
 HSX53Us+tmAPLEfNE9aALycSlTFzgUEtaaVkmjUv0v30SMDiszcEXgxb8jD9LsqlAfq6
 pN+g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYMxvZg=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.20 DYNA|AUTH)
 with ESMTPSA id U080cav4FAI89hQ
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 15 May 2019 12:18:08 +0200 (CEST)
Date: Wed, 15 May 2019 12:18:04 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190515121804.4e4a2c85.olaf@aepfle.de>
In-Reply-To: <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
References: <20190513165321.464fdeaf.olaf@aepfle.de>
 <20190513152005.jojtolhh5wdguvg6@Air-de-Roger>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
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
Content-Type: multipart/mixed; boundary="===============5319669497820579235=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============5319669497820579235==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/qChXM7uoRAWJeND.16UXxMO"; protocol="application/pgp-signature"

--Sig_/qChXM7uoRAWJeND.16UXxMO
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Mon, 13 May 2019 17:20:05 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Let me know if that works for you and I will submit it formally.

Yes, it works for me. Thanks.

Olaf

--Sig_/qChXM7uoRAWJeND.16UXxMO
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXNvnXAAKCRBdQqD6ppg2
fmbwAKDtqyeZSlbQeneUZl8dHUY6BzCSKwCgqZTjaGDLeoeClXC2zt9A7L2pACY=
=DUjZ
-----END PGP SIGNATURE-----

--Sig_/qChXM7uoRAWJeND.16UXxMO--


--===============5319669497820579235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5319669497820579235==--

