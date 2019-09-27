Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D96C0982
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 18:23:15 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsza-0003Je-Vo; Fri, 27 Sep 2019 16:21:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDszZ-0003JX-Eg
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 16:21:13 +0000
X-Inumbo-ID: d250bf40-e142-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id d250bf40-e142-11e9-b588-bc764e2007e4;
 Fri, 27 Sep 2019 16:21:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1491EAF05;
 Fri, 27 Sep 2019 16:21:12 +0000 (UTC)
Message-ID: <c76f3d99ad5d94566436bbc9608d2c4c3dde1e8a.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 18:21:10 +0200
In-Reply-To: <20190927070050.12405-45-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-45-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 44/46] xen/sched: support core scheduling
 for moving cpus to/from cpupools
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
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2539077726142664467=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2539077726142664467==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-pl+IoOzGoN1mtdcY6vaT"


--=-pl+IoOzGoN1mtdcY6vaT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> With core scheduling active it is necessary to move multiple cpus at
> the same time to or from a cpupool in order to avoid split scheduling
> resources in between.
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


--=-pl+IoOzGoN1mtdcY6vaT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2ONvYACgkQFkJ4iaW4
c+5PQw/9FP0IByLfX7YWRCpHDotN86v+jFGbh8kbaaoApfdrWKzHu2GRWzaxHXF3
WBu6KfMqH5bXIvTyEDqh0spMKhulVFn6NzFhI/MaqrLf3izpej6cTk/FZ4WcPoac
nocDoEvcTdzRBxBTZzSPKQ79XDjLoZs5RzwTc9iujV0ej70M0NhI9DVgCp45yzLz
gVRFN571+/bmOt6Rz8kZyNb5BVShbW7gVZHGFH2/RYK1+lltiSG75f7EjRcdeCwg
1PZgbHktQvtEy+SA3TjqNEfllS+3qr9YyVWJnlJ0ugIP+ujILNj0UaHQy5zFkKiN
8xWnx/EN8ORnsBVVnzBotyOT0a0YKhYKlGdk9ZnMrZ45UCk7ZN5NkdczxFoSrcPn
0INVaLVP70y6giCspf0Zflt2uX+QCrbLqgr3qNv4T+Wein+GLSGBfZTp8GAinb30
JzS38YIHaXPblmxWYqWhFbgKS70JFS0endVe+AvQJzBI48ecX+eBS/zcPA+PSRQY
+ovxCfwE57BIJwL8wjBNjNAxCbArnfJAnEa8a2iBYK0PXsye5KFiCP1+8T9dAxfv
AqX2oUgmo5Nwh06QC+7JQrMA1Syu1PM5lyE8IzbCrHY3km4LoaCb1pOza6kKg88n
1kvLxrhNY8zWZIDUqd/JPEN/HTgwOXyB/fqEdGeyWjsPNCOkq2U=
=kq5c
-----END PGP SIGNATURE-----

--=-pl+IoOzGoN1mtdcY6vaT--



--===============2539077726142664467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2539077726142664467==--


