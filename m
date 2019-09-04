Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 97116A7F96
	for <lists+xen-devel@lfdr.de>; Wed,  4 Sep 2019 11:41:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1i5Rjy-0004Ob-GQ; Wed, 04 Sep 2019 09:38:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=+qwq=W7=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1i5Rjw-0004OV-Kf
 for xen-devel@lists.xenproject.org; Wed, 04 Sep 2019 09:38:13 +0000
X-Inumbo-ID: b5727614-cef7-11e9-b299-bc764e2007e4
Received: from mo6-p01-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5301::11])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b5727614-cef7-11e9-b299-bc764e2007e4;
 Wed, 04 Sep 2019 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1567589890;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=cTLZ5EjF+vypirzlXcJD3HrUYBLHKo0KXl2Era1ZW2E=;
 b=Zga+TuUzDtxjkRSkX1ZZo2Cr3darE/dsVKjZD0F8V4igN8n1SMglTY+oXyrC9tHHEd
 +CIBxbkVmOtt8xOAZWvZelNcSpCfHM15+bAz0zzgMDdFLujf1Vw0k/IsEeqYyoZT+Yh9
 yZrZZDr+D0mOHSSzjSx2YR0nX+24JNFPqfgz721//NM+s1U91AgPIn7IpPF4o4UsxeqI
 Q5ZCR9eY8n/d3RQ1IsKOvuGmPiMl7ddSFaCsNVREqW3gRiqIGDdNlovOpohUm06JZXvW
 Njn54TMRqBrzPdIhMEicHq3IhO+N+Qhzz322Cdus4uS3SpVKCta//AlRvkIveRbaJyt+
 Jymg==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuYM5kyQ=="
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.27.0 SBL|AUTH)
 with ESMTPSA id x0a054v849bpT4f
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 4 Sep 2019 11:37:51 +0200 (CEST)
Date: Wed, 4 Sep 2019 11:37:35 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <20190904113735.349609b4.olaf@aepfle.de>
In-Reply-To: <75fe87c1-2f21-b1c1-6589-36807e0b4aaa@citrix.com>
References: <20190904091423.23963-1-olaf@aepfle.de>
 <75fe87c1-2f21-b1c1-6589-36807e0b4aaa@citrix.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v1] Remove stale crashkernel= example from
 documentation
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>,
 Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============6761875474507113901=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============6761875474507113901==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/i7EjzznHE/NkHB5OzoURnta"; protocol="application/pgp-signature"

--Sig_/i7EjzznHE/NkHB5OzoURnta
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Wed, 4 Sep 2019 10:18:41 +0100
schrieb Andrew Cooper <andrew.cooper3@citrix.com>:

> That sounds like an accidental regression in parsing of crashkernel=3D,
> rather than a deliberate action.

Maybe just the lack of b49225dc9df336405292dc08862b4c7c9d887bd6 in vendor b=
inaries...
It is likely broken since 4.10. I have not tried staging.

Olaf

--Sig_/i7EjzznHE/NkHB5OzoURnta
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAl1vhd8ACgkQ86SN7mm1
DoBStA//aUJEtlY3oZlXX1OHBlXJPlHDjFtlWK/jW4lBUTdGwI8mTdTI8GOuVZzw
lxoEct/tzWox5BK+SGjdjgFbsneN7dFA7ra05236BL01AVky0iOs3oBcgMnpg2Bx
ZNWK6YXsbSRAMZnR0cO+wpuse4RFNp+G6bayCfiE4PX3ueWYNefHIO/1PG8LbdY6
C90sSu/BpgGdiYm+i3e6AQwQbC91ZCAO18tBpXbCkUP5KVgS7RnIfjAt/22aXBhC
fK7lKCcJBFQfmJbU3JsrA9FeZTZ0idp0uUx6SBIWWw1/LTV5U5rhVt/vlpt+FrjN
sbYXZnW8R/o4dphU78TZrq12rSB9WMuRGffOLFlYcTVCbijIrutSqfKb9v9VYhjK
wRWwfxT5f9Tj73Ws1JWF3+B7L2xgYRW9Ed9zuD2cSPfXnSWhT8p5eTVsx+eYVMlE
pTsWsHK2aMchFBH9zZipa7doWpa8mIHo2LvSc9PZily5/o20132LS7caxqcg1jZu
MSGd124519bC+0ErKKI/OneWE9j1zOkwsfhheTHRBJ3c+9Wjm/nreSNp3IsymJ79
W7AeHbdcVZpWBuLKqXQ94H615qKdaD6vpB8C2Ic8/k4+NKuLLdj05wk5ic5bEwSm
iL27z5BNSfoLR1YZNLYhVoMFn0mNrTNFQolkxC5JMC5SzLQQPSk=
=7XpD
-----END PGP SIGNATURE-----

--Sig_/i7EjzznHE/NkHB5OzoURnta--


--===============6761875474507113901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6761875474507113901==--

