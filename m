Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1409C815CA
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 11:46:21 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1huZXQ-0003G4-Bq; Mon, 05 Aug 2019 09:44:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fHnn=WB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1huZXO-0003Fy-Vl
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 09:44:19 +0000
X-Inumbo-ID: 95436cd0-b765-11e9-ac75-e33001f8b3b0
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 95436cd0-b765-11e9-ac75-e33001f8b3b0;
 Mon, 05 Aug 2019 09:44:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 11AE0AFCC;
 Mon,  5 Aug 2019 09:44:13 +0000 (UTC)
Message-ID: <c8a008e4cca343e8ac9928660057764b01b8ef2f.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Mon, 05 Aug 2019 11:44:11 +0200
In-Reply-To: <ab677cc1-1d65-ff4e-37b8-89e6c600c8fd@citrix.com>
References: <156458463216.7075.10552410480716651842.stgit@Palanthas>
 <ab677cc1-1d65-ff4e-37b8-89e6c600c8fd@citrix.com>
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
Cc: Anthony Perard <anthony.perard@citrix.com>,
 Doug Goldstein <cardoe@cardoe.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============3443049933124393963=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3443049933124393963==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-vtZU8aYnKq5IRJ4J/0dN"


--=-vtZU8aYnKq5IRJ4J/0dN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-08-03 at 17:22 +0100, Andrew Cooper wrote:
> On 31/07/2019 17:58, Dario Faggioli wrote:
> >=20
> > Interestingly, in the past couple of days, a few build issues of
> > Xen,
> > qemu-xen and ipxe (at the commit that we were checking out) with
> > gcc
> > 9.1.1 where discovered and fixed. And --at least as far as the ones
> > I've reported/fixed-- I found about them while building Xen in
> > openSUSE Tumbleweed (while working on this patch series :-D ).
> >=20
> > ---
> > Dario Faggioli (3):
> >       automation: try to keep openSUSE Leap image a little smaller
>=20
> I've pushed patch 1, and refreshed the leap container.
>=20
> I have also pushed a tumbleweed container, but the build is currently
> failing in Qemu.
>=20
> https://gitlab.com/xen-project/people/andyhhp/xen/-/jobs/265301303
>=20
Ah, interesting... I tested locally and wasn't seeing this.

Anyway, it seems that, in addition to the one I mentioned to Anthony a
few days ago, we also miss this from upstream?

commit 2d2023c3b99edb33ad4bb9791f70456ea1a1c049
sockets: avoid string truncation warnings when copying UNIX path

Anthony, do you think it's fine to import that patch? Or should I try
to rebuild and see if run into the issue this time, and if that patch
fixes it?

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-vtZU8aYnKq5IRJ4J/0dN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1H+msACgkQFkJ4iaW4
c+6EnQ/+Is+/EvnE35qkrQAKOseE8atsub2vDyy1HMHJ61w8Y4W9c7dcA54kACD9
uOx52YGChu/7egeypsvFAxP1HPnQzuVdR/BjA4gKb31e+f5GAYeio0kaKNnokpfF
snaTkd32ZfW2YoIbgOI+eQ1ing2A9Cy5aS3v70nXgObxbn/yWN7E/LwmPi17zaQY
4CRHhwyhY1byodNoeoaX847UBcUoML3U71+y8gAC4yW0AfxCKiTpTHZerx5Iks2+
SAZka4jcN4F+5QWbMBk7wZPJ1O6JvaFFpAVM3YxihB8qCAKSFTI+TVe9Y0lBckcJ
hvKHNGU8ClUtj2g2+vDrgiRFGd4EQm/LsBufwT3ZnNWXaWrFo1W4ivV6eyQ7sIAT
FS9v+5zFF73rypWGHFfQ9g9dxG1QTyjl/2ST6VQau00vm3LkBw10Agtte21JAiFC
WTKAFqzXoJJwo0GuH84BYe/8t60lDGFxD8fDfzsS6Fdhv0REz+qT8B/dRfL/q2e0
4NXKsW+AxOEcz2pql0QcUstSe9DVDLG275eNCTn5hYBqLHxy4NaIP6hZ991sJRxO
3vrGqpCIcNKS2kj7+bIMXGfTvJXD1foiYjpIiXjtR5XmUi+dSBnXFYb1URXqtJYR
W2OGnOENzsUiuZuBa7GhCIlmGaNB0+87xSKkTYPBTtNkrBcD8rc=
=QwLV
-----END PGP SIGNATURE-----

--=-vtZU8aYnKq5IRJ4J/0dN--



--===============3443049933124393963==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3443049933124393963==--


