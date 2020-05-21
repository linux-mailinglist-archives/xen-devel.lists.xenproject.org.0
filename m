Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4171DC7E0
	for <lists+xen-devel@lfdr.de>; Thu, 21 May 2020 09:44:31 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jbfrY-0001yC-3N; Thu, 21 May 2020 07:43:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xZmg=7D=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jbfrW-0001y7-SV
 for xen-devel@lists.xenproject.org; Thu, 21 May 2020 07:43:30 +0000
X-Inumbo-ID: c3578920-9b36-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c3578920-9b36-11ea-ae69-bc764e2007e4;
 Thu, 21 May 2020 07:43:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 9FACEAD80;
 Thu, 21 May 2020 07:43:31 +0000 (UTC)
Message-ID: <86969ba1ea7e270267cfaa3408a89b55c86b3dca.camel@suse.com>
Subject: Re: [PATCH 0/3] Automation: improve openSUSE containers + podman
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org
Date: Thu, 21 May 2020 09:43:27 +0200
In-Reply-To: <158827088416.19371.17008531228521109457.stgit@Palanthas>
References: <158827088416.19371.17008531228521109457.stgit@Palanthas>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-ML6hfz1BfZRjRT0SoTVQ"
User-Agent: Evolution 3.36.2 
MIME-Version: 1.0
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-ML6hfz1BfZRjRT0SoTVQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-04-30 at 20:27 +0200, Dario Faggioli wrote:
> Hello,
>=20
> This short series contains some improvements for building Xen in
> openSUSE containers. In fact, the build dependencies inside the
> Tumbleweed container are updated and more handy helpers are added, in
> containerize, for referring to both Leap and Tumbleweed containers.
>=20
> In addition to that, in patch 3, the containerize script is enhanced
> so
> that it is now possible to use podman, instead of docker. Rootless
> mode
> for podman also works (provided the system is properly configured)
> which,
> IMO, is rather nice.
>=20
> Docker of course continue to work, and is kept as the default.
>=20
Ping?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ML6hfz1BfZRjRT0SoTVQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7GMR8ACgkQFkJ4iaW4
c+7YDQ//RWk+u4pS1RMuM6z8AEtE6hwzo/adAFemzE4DH6k2ul9dY/VNdjtmZ9Xc
nT88fBdcoyd+OQhtOfPmdgmzi0lVatV6jLBwYPD/maViq/rpBj65Cswlro+KhTMH
8snqm3V4VUNVZrsCX3shKjG1KVIq9QparXHv8X4Vo8Wv87gIAQdLfG0LKDckhEFN
ffl8Sk56lczaL70rM6lfwsHDXRDs8m7i4T++Pe/KZa99MI2rwxcdc8adoebtxaWq
cP72CPU9lSyAtd86AfiEDE7dPeTciAU24QDDm0zCYbPz0Wx8bpMcsQYVKsFk2381
911WIniUeKjYpwYpDjrxFrlfbYs0VwPfNMFHK6My/PI0O21WunUvay+AuJMziLPz
dZhGB2x9x2cnoFLC66Tle4J9IcZu8AJCzHRCVwvmnh6txoU9SSoUmma9TSJO81nA
lHr00NQ+0io7uD0KVfCElC81xLm720KM8SfcO+P/FEHSavePDh9TCJHCeoLx2s/N
Zxn4LXsPhUbQL+4iJAzG7Dq7TaGqGFUxmtvO2PmecLWPtxphNSIMZhwTm5eRLVFx
Ob5vj9/AL0i0FmW1lfgDcBqTrvSpiaUeR4nctukJ4oHXs0iNHFTGoSrJTlfre7Ec
uzAFGfhXAMODWoWAyTB1F3VcvcK4xgT78d+acUwUY4VzNLVVIe4=
=MdS1
-----END PGP SIGNATURE-----

--=-ML6hfz1BfZRjRT0SoTVQ--


