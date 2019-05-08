Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EBF7176D0
	for <lists+xen-devel@lfdr.de>; Wed,  8 May 2019 13:28:26 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hOKhR-0005Rh-OG; Wed, 08 May 2019 11:25:25 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=UoQP=TI=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hOKhQ-0005Rc-Qz
 for xen-devel@lists.xen.org; Wed, 08 May 2019 11:25:24 +0000
X-Inumbo-ID: f75b95f0-7183-11e9-843c-bc764e045a96
Received: from smtp.nue.novell.com (unknown [195.135.221.5])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id f75b95f0-7183-11e9-843c-bc764e045a96;
 Wed, 08 May 2019 11:25:22 +0000 (UTC)
Received: from emea4-mta.ukb.novell.com ([10.120.13.87])
 by smtp.nue.novell.com with ESMTP (TLS encrypted);
 Wed, 08 May 2019 13:25:21 +0200
Received: from [192.168.0.30] (nwb-a10-snat.microfocus.com [10.120.13.202])
 by emea4-mta.ukb.novell.com with ESMTP (TLS encrypted);
 Wed, 08 May 2019 12:25:01 +0100
Message-ID: <d4876c22d85f1af7bac22213942c611b1043acf4.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrii Anisov <andrii.anisov@gmail.com>, xen-devel@lists.xen.org
Date: Wed, 08 May 2019 13:25:00 +0200
In-Reply-To: <1557309578-6436-1-git-send-email-andrii.anisov@gmail.com>
References: <1557309578-6436-1-git-send-email-andrii.anisov@gmail.com>
Organization: SUSE
User-Agent: Evolution 3.32.1 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] xen:arm: we never get into schedule_tail()
 with prev==current
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
Cc: xen-devel@lists.xenproject.org, Julien Grall <julien.grall@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Andrii Anisov <andrii_anisov@epam.com>
Content-Type: multipart/mixed; boundary="===============3476941454164942204=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3476941454164942204==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-B3cGo6CJPcM9jtUiJUBr"


--=-B3cGo6CJPcM9jtUiJUBr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-05-08 at 12:59 +0300, Andrii Anisov wrote:
> From: Andrii Anisov <andrii_anisov@epam.com>
>=20
> ARM's schedule_tail() is called from two places: context_switch() and
> continue_new_vcpu(). Both functions are always called with
> prev!=3Dcurrent. So replace the correspondent check in schedule_tail()
> with ASSERT() which is the development (debug) build guard.
>=20
> Signed-off-by: Andrii Anisov <andrii_anisov@epam.com>
>
FWIW,

Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-B3cGo6CJPcM9jtUiJUBr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAlzSvIwACgkQFkJ4iaW4
c+6HyQ//WNWoTt6x4vxoZEtTcUMW65jdg8QVAVveLdchZwqrzaq0UBrAVGi0m4xY
0yk9g6pn09xSgYPUGQEFt+xjwcdeH3xa6GFieOofACSFThMeUjZtTM8qT/NoAOV6
+dzntraH8f2iiQe+oi+7f517i9E2wx16iNWs10C2DefXE/xOqlT4YeDDHVyCBj+/
QhwTS5ivXsHjQCjFtDCqPlcebPbinuq+Weob7fazeeFnMK6kY8loTXAo2LfB/gxB
RuPqnD5HEKAIpkh+nWn1Uffgq/Cf4kvrr7OWpQd09qM9lxKCqWR2xLfP3abadc+O
d3cQ99z02KEekhy2EaUXCEFARYmaNwT5TXzxcKuZM2188oUD93bueKwIpNbUpM92
ImX+bb84+s3w9dP5KRx5MO39gMoDo/yFH5PCzMFYTWtuDnJx8i2K5XakklcmxBHO
89Ku4L9ScWKfTOjfl1opHZInRzvM/8UtClb0yubC8wQOrBCV8EK1m2g93PvzwfY6
r63yV3KbdVhFW3O8wh7deJYo9yX2HkiU8Ug0XbZuvm1YuxT8wAZxoBWfGbBCA7Kb
DUrHC8N68kavASrC944ZiKDptRDilrB7pPAo0JGluuY1YWOZFOUbF1Xd1cyi5uX5
sCxESb4c/Rc1101dK9zpjmG5J4ukhUvu0isB7sT6PIj6hjCYLNU=
=lyN0
-----END PGP SIGNATURE-----

--=-B3cGo6CJPcM9jtUiJUBr--



--===============3476941454164942204==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3476941454164942204==--


