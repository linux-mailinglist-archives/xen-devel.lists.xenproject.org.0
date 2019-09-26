Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FA6BF6E3
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 18:44:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDWpo-0000JZ-Dz; Thu, 26 Sep 2019 16:41:40 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDWpn-0000JS-Rl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 16:41:39 +0000
X-Inumbo-ID: 826c58f2-e07c-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 826c58f2-e07c-11e9-bf31-bc764e2007e4;
 Thu, 26 Sep 2019 16:41:38 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 48126B129;
 Thu, 26 Sep 2019 16:41:37 +0000 (UTC)
Message-ID: <1cbd0a22472c04eccf4b4b4116423d81464f73be.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Jan Beulich
 <jbeulich@suse.com>, George Dunlap <George.Dunlap@eu.citrix.com>
Date: Thu, 26 Sep 2019 18:41:33 +0200
In-Reply-To: <e3c71652-7726-f699-4625-7a069cdc9d4b@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-31-jgross@suse.com>
 <2ad8a8ce-4530-93c7-0161-9b806a38b05d@suse.com>
 <0e4a75eb-61cc-2c9c-0d8a-f854163acd57@suse.com>
 <6288a88b-a5d8-dbd6-15c7-45ed19324510@suse.com>
 <29772d95-7528-2902-890a-1a11235f5b2e@suse.com>
 <e00a1ec0-63ba-d2b6-9bb8-7695cd8bd7fd@suse.com>
 <aecf79bf-029d-6033-aa27-5eb4ef9af650@suse.com>
 <7962de1d-8ad5-13ef-3377-3b16c07b9afd@suse.com>
 <15e6d49da77d4cb1a8bd4b1b1adca5939bd3cf4b.camel@suse.com>
 <e3c71652-7726-f699-4625-7a069cdc9d4b@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 30/47] xen/sched: add support for
 multiple vcpus per sched unit where missing
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
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============7587887895550239565=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7587887895550239565==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tDPhMdfx0x4e7y6fgGzB"


--=-tDPhMdfx0x4e7y6fgGzB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-09-26 at 16:40 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 26.09.19 15:53, Dario Faggioli wrote:
> > However, I'm not sure I understand what it is the issue that Jan
> > thinks
> > that has, and in what sense the code/behavior is regarded as
> > "unexpected".
> >=20
> > Can you help me see the problem? Maybe, if I realize it, I'd change
> > my
> > preference...
>=20
> I have changed it meanwhile and I think the new solution removes a
> latent problem.=20
>
Ok, I'll comment directly on the new shape of it then, I guess.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-tDPhMdfx0x4e7y6fgGzB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2M6j8ACgkQFkJ4iaW4
c+4yARAAwCcZwGmAzkjJZG9fFixGl9J+CGrdxI5EuxJhzbccq2Mwpp/0ncdldsnJ
5u4PeQsjWRwMG5Yiw7TYu5V/psNfNccoRM7+oD4V1emhm9AQWfz1AU3GFVO7sOPf
8eKp/TBAAmur4nMRoIVTmbFY17CW6AMnjL/I0a4BxaFGgTLyKpHyNpWsts5rnAfV
HFZ9zg5itKVdl4BmVItrhg6cDTJNS2S8v/hO93Qm0CEMd8lPcH86rQ6Cm/uXC/Y/
ZpNMyXziZGUKi2UoKjZUOdcMWu8GbJ1ITg9H7WaFBBNMsq4skNoWuMtKAggDG7IG
jVviVTMs/HB28cfCtamdcfd3ZWi1iSSulkzRvnwaHi2wExVpDpsrfxs3mvu4ZkPX
lQDO1Q2q/re7XReI0CbdyU6pyo9ZZlv1rBIu2gce8MqomFeT7iR/vd2fZzvgyBfh
eQ9RMVVdjQhEJIkprQOn16mLO6PiM0ZrHqf1SoF9M7iPiUgily/6SfSaXyXp2Lv1
htmLpln0eh351p+BB1o/gDvm3oqjsI2lVIGiiS3bxlZgBUWEwdhPKUgI6NxaA/nZ
vD41aDbPozuH3dGVSDw3V/FRXV9PR1j4Yb2n1HoYMPZ1J2wD8UDoOlmPKnGb+trh
5UwJOBhVwJabn3om++v3fFXFuJe6XFlYhdgSi1Ins/wKp3/NRTc=
=nthY
-----END PGP SIGNATURE-----

--=-tDPhMdfx0x4e7y6fgGzB--



--===============7587887895550239565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7587887895550239565==--


