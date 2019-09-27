Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B2F7C091D
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 18:04:28 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDsgm-0000xd-SW; Fri, 27 Sep 2019 16:01:48 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDsgl-0000xY-8N
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 16:01:47 +0000
X-Inumbo-ID: 1a8b6c90-e140-11e9-bf31-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 1a8b6c90-e140-11e9-bf31-bc764e2007e4;
 Fri, 27 Sep 2019 16:01:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 4E51FABCB;
 Fri, 27 Sep 2019 16:01:44 +0000 (UTC)
Message-ID: <e7ae82ebabc873aa5fd45d29151bd723aec3ec42.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 18:01:42 +0200
In-Reply-To: <20190927070050.12405-43-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-43-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 42/46] xen/sched: support multiple cpus
 per scheduling resource
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
Content-Type: multipart/mixed; boundary="===============8082371717033243973=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8082371717033243973==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-EmirAaPF1lNtwIpIra6y"


--=-EmirAaPF1lNtwIpIra6y
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> Prepare supporting multiple cpus per scheduling resource by
> allocating
> the cpumask per resource dynamically.
>=20
> Modify sched_res_mask to have only one bit per scheduling resource
> set.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-EmirAaPF1lNtwIpIra6y
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2OMmcACgkQFkJ4iaW4
c+62RhAA3dz75HRMEcrwUTXIqoxgoyx0JqS7fKcV+Uc3W5oclLu+bC49NKSv/DsI
zMBgjDNuvDDBhjiQr+bAazJvH6bZ3bhpU/H+JbXxLIKBMOUWagBH+LPuKv8K5wmN
tSvdgcwnNA2TyJ8cDfUFS8TLvgRC2C2ZVdBcHhBpjyb0p7ad7NeRYk3Bp/RpnsJt
SP6k9Mo1gUQvQvhI8TUuyKBlqrV8/K2dxcRJs5OVnOKxQXssXqMKkEOOlZruSoqz
NLSK4gr1cAUqHhfq6gjXWk4h2EFN69x/bL8UVR1XJtxDr7li9kEbn4F2NsTNmyjy
0f9Ekceoor/DyT4l3FlxUHKlJ0a4x4DlOdFUBPAuD01bDPzcsC/2b8K4qSOPBeCh
uUzL29OLO0VGeuMDx4nHRl0SKb6oa5Bf4gk7Rnf9WV9B0oZUj39XVlle2vI/TPf7
5VRwU8mpTUd3LwZVC38Z2FIjA5BnxcUA9QUEut0+9ljpNHH/k/8YZcZJ1IyGkFqH
rzU9om/rZmBKI0HUcOvqqh+OnN4qA+F37z1/WgjwzoaVDESnKH7yvIWk8r4+UAuz
AayFXdOZIGpCDEGsTDJ+8+0DwGbAcWiVGNIhtCIOl0IoD/FWSiYP0AYnRyPztRyr
mcOyc+IPy17clB+9AcYGQ3NnzIqcgeQPx4D07fRwzJ6Yqk4i9x0=
=tTWh
-----END PGP SIGNATURE-----

--=-EmirAaPF1lNtwIpIra6y--



--===============8082371717033243973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8082371717033243973==--


