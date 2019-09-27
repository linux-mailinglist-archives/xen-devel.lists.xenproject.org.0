Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884CC0275
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:38:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmfM-0001XR-Ve; Fri, 27 Sep 2019 09:35:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDmfL-0001XM-DH
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:35:55 +0000
X-Inumbo-ID: 32f842fc-e10a-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 32f842fc-e10a-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 09:35:53 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id F0DCEB17E;
 Fri, 27 Sep 2019 09:35:52 +0000 (UTC)
Message-ID: <714e8ea72e293eeabca6b7f210b2bf384aea379b.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:35:52 +0200
In-Reply-To: <20190927070050.12405-27-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-27-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 26/46] xen/sched: Change vcpu_migrate_*()
 to operate on schedule unit
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
Content-Type: multipart/mixed; boundary="===============8917621508706905518=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8917621508706905518==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-kddpAoKiKQ0D1ANMdvsR"


--=-kddpAoKiKQ0D1ANMdvsR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> vcpu_migrate_start() and vcpu_migrate_finish() are used only to
> ensure
> a vcpu is running on a suitable processor, so they can be switched to
> operate on schedule units instead of vcpus.
>=20
> While doing that rename them accordingly.
>=20
> Call vcpu_sync_execstate() for each vcpu of the unit when changing
> processors in order to make that an explicit action (otherwise this
> would happen later when either the vcpu is scheduled on the new
> processor or another non-idle vcpu is scheduled on the old
> processor).
>=20
> vcpu_move_locked() is switched to schedule unit, too.
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


--=-kddpAoKiKQ0D1ANMdvsR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2N1/gACgkQFkJ4iaW4
c+5eUxAAq7dcNVUcVg9r92N16BFQUC05xA3cwT6IjdSvtXAPA8cSyJn69QpX7Vnd
96NW2vUzMov4k+jMbdQEpcLWqKkNGutR1DutnpDKsVxW2Q/5OTTM1pslRa4r8bp/
kQ8RV8J/Dv5QF8wVuK5rB1hSO8CvkL042Q+QYMlwl8AXYxDOColPLBSFHe/NUAg5
UtUABqjBHuuxCJ+v0C2y1wkZ6xqg3kgg6D9xkq47+U/f3IiKEV4Sq+J+Ns38RuFL
uKMocd4x/8MuxeB+mBnJ1IWzXQxdNeDE96nUU6hElWHUBpJ7Xcm7kybz8U0vt7ve
TFggMDicNNp/h5KUpx4QEoMIOHQJzDhUHvZWP3IAQKOgyxfb7hOXMlVMIeNplePm
GtYmstN4gVfFRstj6tW+MacrrbOwNX3oBGw3ws1TYSmY4WeHaJygSrJaVa37b+a0
ueOIH/h9l3qFqKIA1Ec4PFq/CmUXlwVyPgXlLnsUsDaVTcR9GH60jY7gYq9+nvUQ
Bl9C2nhYRkRZXPzZUdXDVLBAMscb01Wc3blLGzy2Kmh8ZeoaGw8wCbZjOHqeHtbW
HoDFoxzoO0EsjpjJrY+Lc4BiybzCWcQQ3asbxycStdvTJqkq1j4seqYiu6VYf79o
TmTZEelxmCCMLCt3pf0BtgHOGZdfsGr++k/KdV9Ko1g9tvCZnx4=
=F42T
-----END PGP SIGNATURE-----

--=-kddpAoKiKQ0D1ANMdvsR--



--===============8917621508706905518==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8917621508706905518==--


