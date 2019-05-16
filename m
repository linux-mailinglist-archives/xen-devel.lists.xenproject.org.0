Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C979E203F9
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:00:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hRE53-00072W-FK; Thu, 16 May 2019 10:57:45 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ADxN=TQ=suse.com=ohering@srs-us1.protection.inumbo.net>)
 id 1hRE51-00071m-Nk
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 10:57:43 +0000
X-Inumbo-ID: 6bffc3fe-77c9-11e9-a165-c37ec909e434
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 6bffc3fe-77c9-11e9-a165-c37ec909e434;
 Thu, 16 May 2019 10:57:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E1682AFD6;
 Thu, 16 May 2019 10:57:38 +0000 (UTC)
Date: Thu, 16 May 2019 12:57:35 +0200
From: Olaf Hering <ohering@suse.com>
To: Roger Pau =?UTF-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Message-ID: <20190516125735.6c1bf1ca.ohering@suse.com>
In-Reply-To: <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
References: <1ae5e201-04d0-2f78-878f-2e3a3e213b62@suse.com>
 <20190516110735.67e19d15.ohering@suse.com>
 <20190516104540.7hiqsn6qjeaam2c6@Air-de-Roger>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============1850854028604749198=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============1850854028604749198==
Content-Type: multipart/signed; micalg=pgp-sha1;
 boundary="Sig_/WIdtaROZ2VCemD2o8GefReS"; protocol="application/pgp-signature"

--Sig_/WIdtaROZ2VCemD2o8GefReS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Am Thu, 16 May 2019 12:45:40 +0200
schrieb Roger Pau Monn=C3=A9 <roger.pau@citrix.com>:

> Having a field in build_info with a default value that depends on
> fields outside of build_info is problematic, since not all callers of
> libxl__domain_build_info_setdefault have access to libxl_domain_config.

One option would be a new API that gets a libxl_domain_config and which
calls libxl__domain_set_device_model, libxl__domain_create_info_setdefault
and libxl__domain_build_info_setdefault. To me it looks like create_domain
can not build a proper d_config all on its own, it just has not enough info.

Olaf

--Sig_/WIdtaROZ2VCemD2o8GefReS
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1CHwAKCRBdQqD6ppg2
fsN0AKDQBG4D/Nyh+IFwIgmk7Yyv3nEGyQCgzCnUzbJ/xeKtLCyVOFDrEE4OZew=
=nju0
-----END PGP SIGNATURE-----

--Sig_/WIdtaROZ2VCemD2o8GefReS--


--===============1850854028604749198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1850854028604749198==--

