Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C75271454D0
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 14:07:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFgR-0007hO-HU; Wed, 22 Jan 2020 13:04:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iuFgP-0007hE-Mv
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 13:04:33 +0000
X-Inumbo-ID: b6b45a22-3d17-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id b6b45a22-3d17-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 13:04:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 7305CB2EE;
 Wed, 22 Jan 2020 13:04:24 +0000 (UTC)
Message-ID: <c800457a3bf243c944e20f6a60883e94a3ea39f3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 14:04:23 +0100
In-Reply-To: <20200108152328.27194-7-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-7-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 6/9] xen/sched: replace null scheduler
 percpu-variable with pdata hook
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============6240945965432777669=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6240945965432777669==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hr3FJi15dtNRSpDVZeo2"


--=-hr3FJi15dtNRSpDVZeo2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-08 at 16:23 +0100, Juergen Gross wrote:
> Instead of having an own percpu-variable for private data per cpu the
> generic scheduler interface for that purpose should be used.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-hr3FJi15dtNRSpDVZeo2
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4oSFcACgkQFkJ4iaW4
c+5k0g//dywxkZOyO9GY2B/EDmId8QW7cWuclsfQCzDbRTYam/sBaw6ESuM0ZYj2
1e7/RJdsl/OaBcW0z6xt7VvmJDcJK/2vBfW+ORJFux9fLhLnXjdId4MMzUBLoPTo
gDw2KqnSCV4NTO17Ry0BisXC3dmpY7t3iJbiOY5Dim52I+5fvUPBTJ+A3rTxhh9t
KNpKCaa9gbZ2qG1/hWmZmxJh38EjpsSK3odMY653iC+raWpzxEX1HxgxMtql2tkx
mmcxkc/K63g3B0zc8YsYgwUos7GcWyt56h9oVxCHypWb000uQEkSBJEn5OHU4clJ
IK604YYDHrWEphe4IPX8tmygW2nVJajdRX/IfVI24z6H/Q/bLRKi3P9CTcYjKDuf
egWacQUlh8PImeR1Y2gLMfSbsLp+029HOJPx2c9wv4qg2QywkPTdLEGf5p7UWTin
t74Q5TAGbON8Q0X8EW8+1EnYoW16JKW+y3R3DH/Ki1ltm4yhDlrmTMZhm1TUPy8C
W1y/Kgu+/f6M9AdAo8q+rATjT7UGhH1sVadku6sPqQczRnECtN9S81LgSq28k/5E
zZfRBcD9Dci8xh8jLz8lBg9IomsrsKZ3qZgpJgikK0+iP9ZG7NU/9DdTplQHqjUY
kqW6JpxubGuk1kc3WOrkyyKVbuXNL5rlV/Tro/nv8nDLDF2ahB8=
=U/yR
-----END PGP SIGNATURE-----

--=-hr3FJi15dtNRSpDVZeo2--



--===============6240945965432777669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6240945965432777669==--


