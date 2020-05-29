Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 111ED1E8107
	for <lists+xen-devel@lfdr.de>; Fri, 29 May 2020 16:56:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jegQy-0002a7-5S; Fri, 29 May 2020 14:56:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=BsAk=7L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jegQw-0002a2-LB
 for xen-devel@lists.xenproject.org; Fri, 29 May 2020 14:56:30 +0000
X-Inumbo-ID: 93ec1868-a1bc-11ea-8993-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 93ec1868-a1bc-11ea-8993-bc764e2007e4;
 Fri, 29 May 2020 14:56:30 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1B0A2B066;
 Fri, 29 May 2020 14:56:29 +0000 (UTC)
Message-ID: <2357c1d259ab09715ef747ff7e19c0a3a99bb1d0.camel@suse.com>
Subject: Re: [PATCH v2 3/7] xen: cpupool: add a back-pointer from a
 scheduler to its pool
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Fri, 29 May 2020 16:56:27 +0200
In-Reply-To: <01541fda-c7dc-1eac-7184-970244eaf505@suse.com>
References: <159070133878.12060.13318432301910522647.stgit@Palanthas>
 <159070137738.12060.10928971799525755388.stgit@Palanthas>
 <01541fda-c7dc-1eac-7184-970244eaf505@suse.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-/rqpfXBmpkig0s0hs6mi"
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
Cc: George Dunlap <george.dunlap@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-/rqpfXBmpkig0s0hs6mi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-05-29 at 16:54 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 28.05.20 23:29, Dario Faggioli wrote:
> > If we need to know within which pool a particular scheduler
> > is working, we can do that by querying the cpupool pointer
> > of any of the sched_resource-s (i.e., ~ any of the CPUs)
> > assigned to the scheduler itself.
> >=20
> > Basically, we pick any sched_resource that we know uses that
> > scheduler, and we check its *cpupool pointer. If we really
> > know that the resource uses the scheduler, this is fine, as
> > it also means the resource is inside the pool we are
> > looking for.
> >=20
> > But, of course, we can do that for a pool/scheduler that has
>=20
> s/can/can't/ ?
>=20
And I even wrote "of course"... :-/

Yes, _of_course_, I meant can't. :-)

> Reviewed-by: Juergen Gross <jgross@suse.com>
>=20
Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-/rqpfXBmpkig0s0hs6mi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl7RIpsACgkQFkJ4iaW4
c+746BAA09a/GMnZjoDq+IgIMq9SGtf8GV0nwXAHyjoWsyDih2qWtYKt0zskwirp
DO5PwXLoYhy9GMbS/n1kPpcTTLyPx7a9wNfQ6hAo40SMLhrMF59+HIgU+pq2gv50
lrSOIxqw1cB1bE+Uz6oGg30K6Ru0D40aUnGWOshqGY7RfeS43MlzBU0AvRUlx+cu
GAuUd1dTMccYMZozth8owJZtOXYL1lslv9gEyuGs09GePdb0aG21LV568HkqKyEQ
kwHE1Xzueatol90yV2BSmYZBv91nD26UTb3q5fM0GOU+DInaG4GiUdqpBgyyKyX4
qcJlm7HbG+5qmQ/d/s8h4cWJYqezqZBfrxcxUF0NIhEDz+YTrx0vzA2o8wePRoqK
l0NXpIKekM2ZUSpCmoM7fs+Ri7Q56JbNQVd0NzI+bUHibb+CsnmESh8Moa+KSI8l
0Gnapj8Ksj7FssdQLJz/GfdPLLKhHLsFlHKa/Sh0GJ7w+7k2II7AHaKGwkhIGoqG
nOHJIvk6BesBKoDjMsjaqml5DhnuE42OmjcnITGXL5s27oB0U2UWezKdnjiTtDTd
/35CSb/OguS85rbEaD3Flu31vNrgd39tUU2vj+E+y1c/IeY9fPY1/cbcqQOFsyg7
iyB7CHTgUDaLTdhZDO6gWK95ygohA1/CLeOXfngDCSaydwrq7sM=
=7dp5
-----END PGP SIGNATURE-----

--=-/rqpfXBmpkig0s0hs6mi--


