Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D3014495F
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 02:38:09 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iu4ui-0003IA-7G; Wed, 22 Jan 2020 01:34:36 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iu4ug-0003I5-Vy
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 01:34:35 +0000
X-Inumbo-ID: 5311ca3c-3cb7-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5311ca3c-3cb7-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 01:34:26 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 4BF53ACC6;
 Wed, 22 Jan 2020 01:34:24 +0000 (UTC)
Message-ID: <3cb9dcd6098435d10966ba93b727a8e2c7e16208.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 02:34:22 +0100
In-Reply-To: <20200121084330.18309-3-jgross@suse.com>
References: <20200121084330.18309-1-jgross@suse.com>
 <20200121084330.18309-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 2/9] xen: split parameter related
 definitions in own header file
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
Cc: Kevin Tian <kevin.tian@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Jun Nakajima <jun.nakajima@intel.com>, Wei Liu <wl@xen.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <pdurrant@amazon.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Christopher Clark <christopher.w.clark@gmail.com>,
 Lukasz Hawrylko <lukasz.hawrylko@linux.intel.com>,
 Daniel De Graaf <dgdegra@tycho.nsa.gov>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============0935107004822925995=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0935107004822925995==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-UqKS0rwyyeTSnyC/r3VV"


--=-UqKS0rwyyeTSnyC/r3VV
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2020-01-21 at 09:43 +0100, Juergen Gross wrote:
> Move the parameter related definitions from init.h into a new header
> file param.h. This will avoid include hell when new dependencies are
> added to parameter definitions.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
sched-stuff:

Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-UqKS0rwyyeTSnyC/r3VV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4npp4ACgkQFkJ4iaW4
c+5zexAA6VYRRDMh58bAHA4rdDeAFjteIU80ylpmjRxknSmpzYcp/QtlGXvlIIJw
qjgnb9+q8Nvg2YliWzgeNNlQaB76BliUz5BeX2r4yFqcjvDKFgXhbUmUa/81wvWe
eQ7uCa6prA5vdlfWfFkT1xZtgkq+Gu8jPvb5efa5dKwMs6cN9eKJ6P72mPt/Z6Da
czbe6PbyKBlXO9ycNawNCsZz7+/H/A8UshRWrqv5kSw/B4egdnOoKYKg9LnUH036
sbmdSPgetKf5Dy/YBVOEyQfsMOQa+WiS2z7SIXb+DTo40uuwJVnjehwQI87LdiP/
ZEoKe4ciGmBipqxedGa5T0cdNYojnFXdv3WDS57oqFH+RCS1ToFlHEMgLCxFEUQS
HtvKy3+Y27n5isxFaDKDcR8t/zBLix4xblVJb9iPUhIBLRZlYFLLzK9ceyFshYs1
055mNXp7d46RazVBAHpTZZqjfk6Rmm5S7ah5Z2Rx+HdFwDKz+yDjY8FckjhxghsU
Js0WnByPmAx5AfLu1v2gCLasRd4B5A5R3ft/MhMEO42zffBQrUgDRdCVOIFl9MjJ
goCsqrKqbaD2BOWFH6Qf/CKQEWwomhORfutxCwtGg9Dj5u0W5CKS1LoqYtDD9dwH
VL25n43a2xF45usk1uaFvS8ChWSM59H3cFWNdc61tf5KGKlruFg=
=Qjg9
-----END PGP SIGNATURE-----

--=-UqKS0rwyyeTSnyC/r3VV--



--===============0935107004822925995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0935107004822925995==--


