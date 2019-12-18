Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 841B712427D
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:11:51 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVJm-0003XQ-QR; Wed, 18 Dec 2019 09:08:30 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihVJk-0003XL-Nm
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:08:28 +0000
X-Inumbo-ID: f391ae8a-2175-11ea-9048-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f391ae8a-2175-11ea-9048-12813bfff9fa;
 Wed, 18 Dec 2019 09:08:27 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 6ED56AE8D;
 Wed, 18 Dec 2019 09:08:26 +0000 (UTC)
Message-ID: <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 10:08:24 +0100
In-Reply-To: <20191218074859.21665-3-jgross@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-3-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH 2/9] xen/sched: make sched-if.h really
 scheduler private
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
Cc: Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Wei Liu <wl@xen.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============7866918659017326480=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============7866918659017326480==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-LueKxH0DnOH2MSWneNty"


--=-LueKxH0DnOH2MSWneNty
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 08:48 +0100, Juergen Gross wrote:
> include/xen/sched-if.h should be private to scheduler code, so move
> it
> to common/sched/sched-if.h and move the remaining use cases to
> cpupool.c and schedule.c.
>=20
Very, very nice cleanup.

> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Thanks and Regards=20
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-LueKxH0DnOH2MSWneNty
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl357IkACgkQFkJ4iaW4
c+7zvBAAlKev03PPADHpSS9QkL4XgboveUwJqsMGdR9WJneIFiD43UpQOMjCMNsB
tCZjzOOaHG+3CZBT+Zz3fe89jZEnRNyTV+tYS3pCwPcXPA/RR27bCzq1mM/I40QH
fYquKl9uzGmJwROrSmpe4IHbzpqnAdyRcUU6mdqM5sO5FfzrAAkQRRP49Neqb37x
O5M7u1l13N/YENBNqeN1T8McZN4uqc97UTVtdtKtgrkhmvMXhvVGBerDQ067Zi2y
HCE98NsLbDL82N8pFvfknZgwZaVs/WP+bYfHhrh9WLrqB45cz0FnmOippPcM3oYO
xb5TJg5B8vIfwhEcCw99E0tXCI8xC1UaX7KsXn2cTFHe2nVnbQG2vM/TKVgs4G6m
QLv8miBvh98uryzV+FT+nZDFNyB5XoM6LATFJ4bOEemG4RiU8S52lsNX7CVsh5/p
QTCg3HMWAEUn/rrJltT+MSi4ZKUbvy2nsOaJE0hKv7nxMTyK5dqcHisdCr5AvMYi
tO2N7IKiySKwke6XTFd03d5H64dlkmGonobrH0sLr6rIVwkZtlJUMqUbN8sDGkls
XWKcJEnvgr18FRGfzDNyYCJibNpJqH4UED4SJbpWfzMcHwL4tbxu1DbJQtigznEx
F6Jep8U9wM2AQGc5Al5nSTIfQup7a7tYl/4LHPQ6ruSuDzCBH8M=
=3M2u
-----END PGP SIGNATURE-----

--=-LueKxH0DnOH2MSWneNty--



--===============7866918659017326480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============7866918659017326480==--


