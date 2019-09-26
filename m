Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB90BEEA9
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:44:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQHV-0003Ji-Ft; Thu, 26 Sep 2019 09:41:49 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDQHU-0003Jc-Bd
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:41:48 +0000
X-Inumbo-ID: db871944-e041-11e9-b588-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id db871944-e041-11e9-b588-bc764e2007e4;
 Thu, 26 Sep 2019 09:41:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E22A4B10B;
 Thu, 26 Sep 2019 09:41:46 +0000 (UTC)
Message-ID: <771cf77d9bb99a9b19dc50b8c8f0b6a369761226.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 11:41:45 +0200
In-Reply-To: <20190914085251.18816-47-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-47-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 46/47] xen/sched: disable scheduling when
 entering ACPI deep sleep states
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>,
 Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============6735987203610343037=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6735987203610343037==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0w0qdZvSlJpGjR3/L4YF"


--=-0w0qdZvSlJpGjR3/L4YF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> When entering deep sleep states all domains are paused resulting in
> all cpus only running idle vcpus. This enables us to stop scheduling
> completely in order to avoid synchronization problems with core
> scheduling when individual cpus are offlined.
>=20
> Disabling the scheduler is done by replacing the softirq handler
> with a dummy scheduling routine only enabling tasklets to run.
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


--=-0w0qdZvSlJpGjR3/L4YF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2Mh9kACgkQFkJ4iaW4
c+4cNw/+Prb9rI2kG4m+EsNE10HpYMvVh7CiLnB7x1esZnMYxjbbAKW7JyQn/+k0
56f+Y8XSTSthpgGULfwv2B5WA00X7KWopOwbs2fFB0arrtTZCkMO7hCtNWI8vbxm
eQQKNvmK5+xNVXudT6CCW52+5RYrIJWleUfAMJnOZgS1rHy7Kvb1MA3jfho6bOAw
rfw8J1J5F7upZNylz59w0mY2HrDcIGtTIII0HDcbBVQ7ea8F7IEcatRJ+Id9DA2o
rsYmLo6jObdeBjuxL/BBgEqiQ1Hl3XKeKOHNN/HV1lUv2lEzw7JFHQe097At4a+4
iLeNn9M1eDGZFmeN0XiEWhPU1hDYUGi9EIF3HpvdYahcebSqUOojXBzGcGt9hMlR
O3Gnpi3cz052oXgahvlhVDkxevCDgujljdJvWMUWGroRJ/CQ9ZsU1IvRRcW+G+MQ
QXz6AqPXwMApowgOjYe4F6MvSJIdpYsTSWA7viXZchT+prAm9VfZNwDgXusF5jPm
St9oiNndMEXcaPA56OeOtFf+X+er/DkKdHuxlAlUoPlel5PSd/hmmKi6qdssm06L
RzUYbGlM2UiDMAIC2JuRmSTDVZJKk7pkCeZG3/5r9tQmB1dhKQWPhkpNxIx5r1JJ
7zxa+9VFjlT8/377GsJ1fXEbqyXJa1ocnWjo067UX04turA1n+c=
=DtNW
-----END PGP SIGNATURE-----

--=-0w0qdZvSlJpGjR3/L4YF--



--===============6735987203610343037==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6735987203610343037==--


