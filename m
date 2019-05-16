Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30120462
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2019 13:17:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hREKV-0000BP-7f; Thu, 16 May 2019 11:13:43 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZPM6=TQ=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hREKT-0000BK-8z
 for xen-devel@lists.xenproject.org; Thu, 16 May 2019 11:13:41 +0000
X-Inumbo-ID: a73b429d-77cb-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::12])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id a73b429d-77cb-11e9-8980-bc764e045a96;
 Thu, 16 May 2019 11:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1558005217;
 s=strato-dkim-0002; d=aepfle.de;
 h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=vHXCXf9Z+t8urAUEuDZLj+RghpNQocqjQiWiU06DzgM=;
 b=prQFgf3FDfpWpwkErNcXTZGysVUeNY+kA/Q6zhfpTt3dCbN+eXXeKJjYzT/kC9iZHU
 PL1fVrO/QR7N8DwJyco78BB/JwEH3vn7I6f0id8MB1Vyys+HjjnG8RNQm50YOqVVPqLE
 CYcDdt12HZGIWkfiTFnA1Syy9IMXpOwcnO0cRZ+l1wn1Z0kLI5EKPsYEKymbJbs3DQp0
 ZrfdV56crT+VGq3S5NvgbO/8YF5tYU4/cOEs+Y5s7JmzFHMbLJmtxwNXqXkwGjCWnPXt
 1YpdWSf1REA1Lp1AE8nxq/43A7EeTJDCFx2T46ZnzJ3y82jBlJZkpehR7JtUmEDBJ5Z4
 iS6g==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuznLRsvz6zGrN/JP2665"
X-RZG-CLASS-ID: mo00
Received: from aepfle.de by smtp.strato.de (RZmta 44.20 AUTH)
 with ESMTPSA id U080cav4GBDYEYs
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Thu, 16 May 2019 13:13:34 +0200 (CEST)
Date: Thu, 16 May 2019 13:13:30 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <Ian.Jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190516111330.GA32248@aepfle.de>
References: <20190516000212.13468-1-alistair.francis@wdc.com>
 <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
MIME-Version: 1.0
In-Reply-To: <5CDD3BF2020000780022F8AD@prv1-mh.provo.novell.com>
User-Agent: Mutt/1.11.4 (20190510T140348.ce6e1db0)
Subject: Re: [Xen-devel] [PATCH 1/3] config.sub: Update config.sub to latest
 version
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
Cc: xen-devel <xen-devel@lists.xenproject.org>,
 Alistair Francis <alistair.francis@wdc.com>, Jan Beulich <JBeulich@suse.com>,
 alistair23@gmail.com
Content-Type: multipart/mixed; boundary="===============3677398814879198286=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3677398814879198286==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Thu, May 16, Jan Beulich wrote:

> At least to me it is far from obvious why we would want/need to
> do this update, or where the canonical "latest version" lives and

It is not yet Friday. But I do blame GNU anyway for missing the obvious
missing part in their 'configure;make;make install' paradigm:
'./autogen.sh' is what MUST be done before that. autotools are not
runtime dependencies, they can be freely upgraded at any time.

It is 2019. Every variant of autotools out there works reasonable well.
So please remove the configure crap from the repo, and leave just
autogen.sh, m4/ and configure.ac in the SCM.

Thanks.


Olaf

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQSkRyP6Rn//f03pRUBdQqD6ppg2fgUCXN1F2AAKCRBdQqD6ppg2
fqC/AKCwBOwtkQZNZUyTFGdvD2M0uwAPlQCg4jhFzp9B0KzL9aLfIHbYmYt2zyE=
=cVgd
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--


--===============3677398814879198286==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3677398814879198286==--

