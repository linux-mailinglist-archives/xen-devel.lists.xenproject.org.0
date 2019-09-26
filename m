Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 316F1BEE1A
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:10:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPjt-0007hs-7I; Thu, 26 Sep 2019 09:07:05 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDPjr-0007hG-FN
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:07:03 +0000
X-Inumbo-ID: 002f0d38-e03d-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 002f0d38-e03d-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 09:07:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CCDDCAC68;
 Thu, 26 Sep 2019 09:07:00 +0000 (UTC)
Message-ID: <916cb263e5853281e66fd4540323c88b536c7d2c.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>
Date: Thu, 26 Sep 2019 11:06:59 +0200
In-Reply-To: <09dcab9b-7482-8636-204e-dedb477baef2@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-38-jgross@suse.com>
 <1184754b-fbc3-dfb6-6476-e9305e8e1421@suse.com>
 <09dcab9b-7482-8636-204e-dedb477baef2@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 37/47] xen/sched: move per-cpu variable
 scheduler to struct sched_resource
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
 George Dunlap <george.dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5200282469980379178=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5200282469980379178==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-SZ93gDCpTXxyEJ5xxu4c"


--=-SZ93gDCpTXxyEJ5xxu4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-09-25 at 15:13 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 24.09.19 14:16, Jan Beulich wrote:
> >=20
> > While at the first glance "sd" is used twice here, this 2nd use is
> > actually unnecessary - "cpu" hasn't changed from the beginning of
> > the function afaics, and hence "ops" could be used here.
>=20
> "sd" is now "sr" everywhere.
>=20
> And yes, using ops here seems okay.
>=20
> > Preferably with the suggested adjustments (but final judgement is
> > with the scheduler maintainers anyway)
> > Reviewed-by: Jan Beulich <jbeulich@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

(With sd->sr and with using ops.)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-SZ93gDCpTXxyEJ5xxu4c
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Mf7MACgkQFkJ4iaW4
c+79exAAiaBwhzSXAwXZWUQpBNuhxQAvlhizhbyPow4hX7vgzu7C2ijOfNOTMrXE
zDidNviUXXhR7qS/3vt2THGIFOwzxQeRIqgjJhhqgps/5koYfB1WQsELFK5RzYG6
YA0re46yDSKi7Wve7VFin057rj+CyqbTZiqUWZwOYWWUiJ+5RjsTMZPdUeMVaDJ3
CfnZii+UcUblagsg+CJANNmMMMseR/ieMHhA/rT03fGYQ9463V3WRH3dSRohrfhT
eETmlZi7/ZBDYRE3StfRvZJjjkYeKOBCO1qzPlTgm765xqkWmV6J5+wpyGxzxRYL
TGpmigsyGufIZeBQc9GdbKoGJzO4tzheJin6TAoDEQA9B9FdCe8JqYwjOZfMHkVw
2sefAEr//uv8SUFExzUPMKUsVNFLX+8lrBXn1RCD9dPBDivgm9NObybZ7Mahz1+W
qPV9YNuokvROMiHn9W83erTy1KcbJ83FsOIYUZbnmSKAMIWr5fR43PG3F1QjJxqw
G0xmNEVPgYNpbQh1ztbeV6iW82mXqd3pWOjl94t4bH6D+45hq4dYxCh5cuPDccOF
u5JMCLkYxJ2rdwSsDk5Qm+NJmAFBYqxgZ6IY83VcXUA6tAvU2SnlYuLNiFWfHm22
/E1WaApCZGFaayCWXukJ3i1yAbT4+BPiTlKdS1vfgJ/NAIGgTQQ=
=hQwG
-----END PGP SIGNATURE-----

--=-SZ93gDCpTXxyEJ5xxu4c--



--===============5200282469980379178==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5200282469980379178==--


