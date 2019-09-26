Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E59BEE1D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:11:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPlz-0007wt-Nu; Thu, 26 Sep 2019 09:09:15 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDPlx-0007wm-WB
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:09:14 +0000
X-Inumbo-ID: 4e80a384-e03d-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 4e80a384-e03d-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:09:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4B5BCAB7D;
 Thu, 26 Sep 2019 09:09:12 +0000 (UTC)
Message-ID: <205dfbdaa7a300683f7deb8ce320665dd679c0a3.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 11:09:10 +0200
In-Reply-To: <20190914085251.18816-39-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-39-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 38/47] xen/sched: move per-cpu variable
 cpupool to struct sched_resource
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
 Julien Grall <julien.grall@arm.com>, Meng Xu <mengxu@cis.upenn.edu>,
 Jan Beulich <jbeulich@suse.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============5533608566761355330=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5533608566761355330==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-mmNgV+kmdX75XJT3UVqc"


--=-mmNgV+kmdX75XJT3UVqc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Having a pointer to struct cpupool in struct sched_resource instead
> of per cpu is enough.
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


--=-mmNgV+kmdX75XJT3UVqc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2MgDcACgkQFkJ4iaW4
c+6ZoQ/+J9DuynQLbq3fUVxtecwBedjv12A36/PJZs8n1Y1D5aZXRa499OI78v0E
tnQyw9/QFYJ8T/MVZvHPCuX81dSk2uhMpl+5lJsLfzFKrWCm+c9i5odZogtRVYJG
gqrNcYFK0h/Gkcp0o5FyrPvGhIqizNHtw3ZoDYDCci8uOO8IXkWLIWtTt8JoIzVh
4YNKxbd7VZ2laNdFtvPRQYR94wWi0SRSJYmxusfXzl0JjeMaQHBmGm8o1VIfrAb4
rJ1+pRQkpAGG7hAz06dv9b4BS+qr9lBNNm3gpYoR1NrYp7BJMUmqSySVMIfXBXjt
lQg6fo0yMH9LhrhYGA8jq6wsRt/a5hrRBk8bkOpWdDVIiaNB/4t0DHnycwpoCX+W
HpWTOUaTlysd6KdPp4IzUTWzKtVB/3u/sOh6Gmyi7pstgtN5iTo0O9V5CjSi1yCM
mTYVHKi7m//41gjV1Lg7z2yfEc5YtAabj8Z1LC1g4g60+R+hNzSKoEkDjpGGuHdi
+0wFEYxlKr4k3KKwNW6XMqFTY1mJ+BIO5SEzq8qa21X20cNcXgE0B9myqSRTD4YM
D0lPvv2m925Ff6bXpD1+5074rvdWxk56eEsAnKGw/nVfcBtSXCVH11aIH0Co4V3I
BtO7Ge3TOsXwjRuc4yIKOzmmMCZIED47SLGBX6sCC51e+AsAGZs=
=SSh3
-----END PGP SIGNATURE-----

--=-mmNgV+kmdX75XJT3UVqc--



--===============5533608566761355330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5533608566761355330==--


