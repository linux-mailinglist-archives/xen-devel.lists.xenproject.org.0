Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C65D5201C5
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 10:54:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRC6N-0004SK-6P; Thu, 16 May 2019 08:50:59 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRC6L-0004S8-FN
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 08:50:57 +0000
X-Inumbo-ID: b7ac3f54-77b7-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b7ac3f54-77b7-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 08:50:56 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 10ECEAEE6
 for <xen-devel@lists.xenproject.org>; Thu, 16 May 2019 08:50:55 +0000 (UTC)
Date: Thu, 16 May 2019 10:50:51 +0200
From: Olaf Hering <ohering@suse.com>
To: Juergen Gross <jgross@suse.com>
Message-ID: <20190516105051.0249d370.ohering@suse.com>
In-Reply-To: <20190516104046.0f0be4d7.ohering@suse.com>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516104046.0f0be4d7.ohering@suse.com>
X-Mailer: Claws Mail 2019.04.26 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Regression in xen-unstable due to commit
 3802ecbaa9eb36
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
Cc: xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============4494955338561473006=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4494955338561473006==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/0bjM.nIzm9x=JCg_D2GuRYh"; protocol="application/pgp-signature"

--Sig_/0bjM.nIzm9x=JCg_D2GuRYh
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 10:40:46 +0200
schrieb Olaf Hering <ohering@suse.com>:

> Am Thu, 16 May 2019 10:09:38 +0200
> schrieb Juergen Gross <jgross@suse.com>:
> > assert(b_info->device_model_version); =20
> Is the codepath perhaps coming from libxl_domain_need_memory?

If I read create_domain() correctly, freemem will be called with an
incomplete b_info. A workaround is to set device_model_version=3D.
Not sure why it works for me, I will see what I find.

Olaf

--Sig_/0bjM.nIzm9x=JCg_D2GuRYh
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN0kawAKCRBdQqD6ppg2
fsuxAJ4hRLmJ5Z8g+Wz/xW1wkVaYTvfV1wCeOhNURrT5fc1psX1GE9mV/yMTTgU=
=ji4H
-----END PGP SIGNATURE-----

--Sig_/0bjM.nIzm9x=JCg_D2GuRYh--


--===============4494955338561473006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4494955338561473006==--

