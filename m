Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF8F83290
	for <lists+xen-devel@lfdr.de>; Tue,  6 Aug 2019 15:19:43 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huzLK-0005Et-Kt; Tue, 06 Aug 2019 13:17:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=kd9E=WC=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1huzLI-0005En-OR
 for xen-devel@lists.xenproject.org; Tue, 06 Aug 2019 13:17:32 +0000
X-Inumbo-ID: 8abd9096-b84c-11e9-8b5f-ef3662c2c377
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 8abd9096-b84c-11e9-8b5f-ef3662c2c377;
 Tue, 06 Aug 2019 13:17:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F3DFBB636;
 Tue,  6 Aug 2019 13:17:28 +0000 (UTC)
Message-ID: <9e4a30d293de17fe1711f1ceccfba3875175c059.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Date: Tue, 06 Aug 2019 15:17:26 +0200
In-Reply-To: <20190806101204.GL1242@perard.uk.xensource.com>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <ab677cc1-1d65-ff4e-37b8-89e6c600c8fd@citrix.com>
 <c8a008e4cca343e8ac9928660057764b01b8ef2f.camel@suse.com>
 <20190806101204.GL1242@perard.uk.xensource.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 0/3] automation: build Xen in openSUSE
 Tumbleweed
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============3081751060893668321=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3081751060893668321==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZsjddkGUJKKzlEkXcqYW"


--=-ZsjddkGUJKKzlEkXcqYW
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-08-06 at 11:12 +0100, Anthony PERARD wrote:
> On Mon, Aug 05, 2019 at 11:44:11AM +0200, Dario Faggioli wrote:
> > Anyway, it seems that, in addition to the one I mentioned to
> > Anthony a
> > few days ago, we also miss this from upstream?
> >=20
> > commit 2d2023c3b99edb33ad4bb9791f70456ea1a1c049
> > sockets: avoid string truncation warnings when copying UNIX path
> >=20
> > Anthony, do you think it's fine to import that patch? Or should I
> > try
> > to rebuild and see if run into the issue this time, and if that
> > patch
> > fixes it?
>=20
> I've pushed that patch and that other one:
>   ccb799313a5926a6aa49018bbc67fe6165fad7f3
>   hw/usb: avoid format truncation warning when formatting port name
>=20
> with those two I could build a qemu in the tumbleweed container, but
> there are maybe other commit missing.
>=20
You mean the build is still failing for you, but not in QEMU?

I've just tried, and the only problem I'm seeing is the
test-cpu-policy.c one that has already been reported, but is believed
to be a gcc problem.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ZsjddkGUJKKzlEkXcqYW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1JfecACgkQFkJ4iaW4
c+7gMw//bYA4dCWPOciNU4HRoMd5cQuWjqvcwf4/vfDb3lJFchMSC1w9yFD+KhI9
rxWrKjiwjRIGGYoM4P9H3KtgNP+ZqBdp5TYiEpMgyUwPcbz6H7PIQ6adkJ2LEj2t
YOn1OTweM9nVJL8288QkKjtX50DWXqxDgs7D646OAFk1EVgd2wWr7P1U5N7osYZb
bTLVkQc8XUNYEOS5NwkWIcsCso+hfvusiOOCWm74rd8KtnIsnIh+zMKl3kZzRjLi
a4QRsRB6EQsRxmtvaVjtn6AeIXANI4Ms9TAYRC2O/vZ00jcoEQJMEYEL25aNPS3w
V8VFXXgYT08GnRh9czxQfUrBzyFZX1XyhKZNVKt+y3fOMdafSiCvVRmKlV8MnWs/
HJ9Mcx8ROm3lrofA1zR4EVeZDHwxzE0EPrg2tC8htLvEOITYpW+1rRquTzxntkbz
vDSnBPiFRoQRY2rWMAfvikr8fMTLlXv8Mgs9rJuq3ojnnDJSn6fRSIUl6Egrh8OW
F5sXj2/GQe/7XIPiv86aZVMYispm45cOVET+R1s5m757Oqad8a8g7M6p8cpGBigC
dW7+31vxBMGn5wvBPvgR/a75uD32DfFwAMdPgEoqSvKkgFXR0LORGU+VJJP9NmIW
8y+GL2tcXUgW2HTIOkgCJveyn0Oqhj1DRGfHfe1dq8Wp9cFk63I=
=ZkF2
-----END PGP SIGNATURE-----

--=-ZsjddkGUJKKzlEkXcqYW--



--===============3081751060893668321==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3081751060893668321==--


