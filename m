Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A07FD2D59B
	for <lists+xen-devel@lfdr.de>; Wed, 29 May 2019 08:40:40 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hVsCL-0001AT-A8; Wed, 29 May 2019 06:36:29 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=ZkDk=T5=aepfle.de=olaf@srs-us1.protection.inumbo.net>)
 id 1hVsCI-0001AO-VV
 for xen-devel@lists.xenproject.org; Wed, 29 May 2019 06:36:27 +0000
X-Inumbo-ID: 13c95e45-81dc-11e9-8980-bc764e045a96
Received: from mo6-p00-ob.smtp.rzone.de (unknown [2a01:238:20a:202:5300::1])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id 13c95e45-81dc-11e9-8980-bc764e045a96;
 Wed, 29 May 2019 06:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1559111783;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=KGTOnHYjYHMImRelwFoPzT5SrTPuoYqEmb67xQjM9Ls=;
 b=U2RyiVjTTgYMnXvuD86nVhkk6IRgOzZKiJA+Pg6uuTmeTrcWhyk0PLXu4pBjM+iJsz
 kPnU7v2tTMjbUEjrMjuiDs1MQstjwPEiSHozq8oVgWMxK/YNVqNf9+mCLTfyIRljlHvK
 BEsa/v9YxFqxuHYL+5WzevDHjcVhBPKCQI6Olk5v+6/Ij2icmPgVtCwFHbveeM1RFS8s
 r+YEph8D2NaAntGrkQTa3fU53S5Plhpd3Y/RnpLMWaI2yjFnGscxAu3EG217qgGdwWF9
 xiJR3RK+Arwx8mX7zpPxOkqgK65h3lpfNdFqQhxZ75EhXjw8dItTyuBfL+hmtGZGM940
 pbXA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QED/SSGq+wjGiUC4AUztn93FPS2dyuY8gK"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 44.21 DYNA|AUTH)
 with ESMTPSA id N09966v4T6aLbjY
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (curve secp521r1 with
 521 ECDH bits, eq. 15360 bits RSA))
 (Client did not present a certificate);
 Wed, 29 May 2019 08:36:21 +0200 (CEST)
Date: Wed, 29 May 2019 08:36:06 +0200
From: Olaf Hering <olaf@aepfle.de>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20190529083606.4ff7953f.olaf@aepfle.de>
In-Reply-To: <23789.37660.726217.578999@mariner.uk.xensource.com>
References: <23751.6062.590245.436664@mariner.uk.xensource.com>
 <23751.6297.231034.162861@mariner.uk.xensource.com>
 <23789.37660.726217.578999@mariner.uk.xensource.com>
X-Mailer: Claws Mail 2019.05.18 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Xen-devel] Stable trees (4.6 and 4.7), building on stretch,
 osstest, redux
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
Cc: Anthony PERARD <anthony.perard@citrix.com>, Juergen Gross <jgross@suse.com>,
 Wei Liu <wl@xen.org>, Jan Beulich <JBeulich@suse.com>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============4807149838592892314=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

--===============4807149838592892314==
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/uD7sOUS6HV3RnzlWy9h04kP"; protocol="application/pgp-signature"

--Sig_/uD7sOUS6HV3RnzlWy9h04kP
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Am Tue, 28 May 2019 20:59:24 +0100
schrieb Ian Jackson <ian.jackson@citrix.com>:

> I am still struggling with this.  4.7 and 4.6 still do not build.

I maintain the various staging-X.Y branches for various releases,
just for my own entertainment. The remaining build error in SLE_15
(and Tumbleweed) is some asm error in ipxe. It was silently fixed
by rearranging the code, so there was no single commit to cherry-pick.
At some point I lost interest and did not finish the work to make it
build again.


https://build.opensuse.org/package/show/home:olh:xen-4.7/xen

The individual changes:

https://github.com/olafhering/xen/compare/olh-base-staging-4.7...olh-fixes-=
staging-4.7
https://github.com/olafhering/qemu-xen/compare/olh-base-xen-staging-4.7...o=
lh-fixes-xen-staging-4.7
https://github.com/olafhering/seabios/compare/olh-base-xen-staging-4.7...ol=
h-fixes-xen-staging-4.7
https://github.com/olafhering/edk2/compare/olh-base-xen-staging-4.7...olh-f=
ixes-xen-staging-4.7
https://github.com/olafhering/ipxe/compare/olh-base-xen-staging-4.7...olh-f=
ixes-xen-staging-4.7

Since I last touched it a few months ago, Tumbleweed moved on and will
require additional changes for gcc9. Not sure how stale Stretch is.

To see changes for other staging-X.Y branches, replace '4.7' as needed.

Olaf

--Sig_/uD7sOUS6HV3RnzlWy9h04kP
Content-Type: application/pgp-signature
Content-Description: Digitale Signatur von OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE97o7Um30LT3B+5b/86SN7mm1DoAFAlzuKFYACgkQ86SN7mm1
DoBEAQ/8CMlr6F+uigQ2iDIsUZZQAbqYfPoCkOqPuqXE05+Sq9ojbzyNs4oWG86h
MQ8wnhzrXuKMeyLELt2Q6RCZm7Mgh00RR9s4jqIC+Kf31Tf3d8rdB8d1HIMcmOwG
efAi311zLH9GbkZZw3lc4kijCv88WRhNIxOkAirD9BfHQEXXt11NnCtbFfqro2u7
vxqM7RyP8c0Zt4AWWutpT+qth2T5Et+TZTIC6LWbLZoCCTa85Qj1mNkhCzNPCFFN
jzFluxEFPV7yVKNFqayjEVh4YA5JTnbS/cXHw9Zei5s96oRicM/qBcecG4naUWXN
xc3lKhF/oKb3Z3FmuxusrVsMm5kuI0vKVEZDKA6AwVVLhNLNyEH3w0PVlScbUb/C
A14m52EykbA/h42t5XgwhQRZqA5SN40TFH9ghhYbEFuWYeJM3p5E917AtYm06lTc
EhAFPtyA9khpZEqwGRDz83vNHFYC112VVffElGJCCp3riNe56e+2qQX2t2k5EjGN
T58el8gP16mEZWvp78VUdc1NCVhYGkinqRhDDDaZ/hysAZ3sE3pFOA3GaR2EnDh7
Ez6QyESHe9aWoXzO6fAGWdWGDvM8N4SxjYVFV5Lqnkg1noGbGGx73dPGDCrQ8kCO
IvB1UeSOdiXfQt2rF7exvQN9lXhOUkRUevEb7DBDe1gOnT2km+g=
=cpDQ
-----END PGP SIGNATURE-----

--Sig_/uD7sOUS6HV3RnzlWy9h04kP--


--===============4807149838592892314==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4807149838592892314==--

