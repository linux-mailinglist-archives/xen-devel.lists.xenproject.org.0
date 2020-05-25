Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235D41E07A9
	for <lists+xen-devel@lfdr.de>; Mon, 25 May 2020 09:19:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jd7Ni-0003r9-3L; Mon, 25 May 2020 07:18:42 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XQbn=7H=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jd7Ng-0003r1-GU
 for xen-devel@lists.xenproject.org; Mon, 25 May 2020 07:18:40 +0000
X-Inumbo-ID: f488715c-9e57-11ea-ae69-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f488715c-9e57-11ea-ae69-bc764e2007e4;
 Mon, 25 May 2020 07:18:39 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0C93BAD12;
 Mon, 25 May 2020 07:18:40 +0000 (UTC)
Message-ID: <a3acb930c5656524f6229592be5d542f0cb9da60.camel@suse.com>
Subject: Re: [PATCH v3 2/3] xen/sched: don't call sync_vcpu_execstate() in
 sched_unit_migrate_finish()
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Mon, 25 May 2020 09:18:36 +0200
In-Reply-To: <20200514153614.2240-3-jgross@suse.com>
References: <20200514153614.2240-1-jgross@suse.com>
 <20200514153614.2240-3-jgross@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-oAq6UK647ZbDv2w2R5Uq"
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
Cc: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-oAq6UK647ZbDv2w2R5Uq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-05-14 at 17:36 +0200, Juergen Gross wrote:
> With support of core scheduling sched_unit_migrate_finish() gained a
> call of sync_vcpu_execstate() as it was believed to be called as a
> result of vcpu migration in any case.
>=20
> In case of migrating a vcpu away from a physical cpu for a short
> period
> of time ionly without ever being scheduled on the selected new cpu=20
          ^
with this typo taken care of (I guess, upon commit)...

> this
> might not be true, so drop the call and let the lazy state syncing do
> its job.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jan Beulich <jbeulich@suse.com>
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


--=-oAq6UK647ZbDv2w2R5Uq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7LcUwACgkQFkJ4iaW4
c+6ROQ/+MJGiLNYQIM8h0pflGhWozbng0aZ5OEwdkBg3jrHTbtfD+UjZqJxG+/ck
0UZUi9CzPEW8O2L0ikM6zTPe5Rl6z1isp8G0Airs4ZnLFcN/5zFce6DJRNl2b61E
ubTxnYLKH5dP/DMLGCZmJww/OsK925NI0sWzvtXbFRUbP1zEyvD2Xjf//N/2UCH0
YijZy6qQLSDBX28aao5/1thtVnQoVHfAJKBZ711ojE6X4dmKEb4qGTtDQ8n2mpDg
VdwtT/wp3goraA7hgdpV7GLhAZxj86qhyTac8cqQZIbx5GTzI3d0CbjYyg1D7Vq2
C6+3mX4Cruaj5xxw2q3y0C6rwObWfpooZUkf/ULxALbcaw+Tkvag1m67c5BMMYEZ
ZSi+NGZnP5e2puci3hEHEJukSGuiKfTyuXpqcMq7qdDFTbq8UQEdqL1WltJacueI
i8ISYHzF6RXdRP5tdauk3tozA2VP1sYXlcH8nHRnteGhuNylaFvQYBz1pHYt4ARo
6uzHJD6UnBCJcIBqlWkEamBy6NAYU+wirx+qI4xpfRurczwouosh41Cxs+RJPuTb
oGCQy741iZf1yWQTQEsOPRjUbEd/TwVXXeBZ84eKTbL5jlmoJvs0wvGsXTaGb24w
rCQhmUzha782jjpKoyGhThZDym1PeFWly8MWzrTal8GpOupDweA=
=94pE
-----END PGP SIGNATURE-----

--=-oAq6UK647ZbDv2w2R5Uq--


