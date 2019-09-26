Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA4ACBEEB7
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:48:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDQLd-0003Y0-4b; Thu, 26 Sep 2019 09:46:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDQLb-0003Xv-Mt
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:46:03 +0000
X-Inumbo-ID: 73728770-e042-11e9-964c-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 73728770-e042-11e9-964c-12813bfff9fa;
 Thu, 26 Sep 2019 09:46:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BEC2EAD4E;
 Thu, 26 Sep 2019 09:46:01 +0000 (UTC)
Message-ID: <f6cae9fa652707ec7548cd0929f9aa06fcd8affc.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 11:46:00 +0200
In-Reply-To: <20190914085251.18816-48-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-48-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 47/47] xen/sched: add scheduling
 granularity enum
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
Content-Type: multipart/mixed; boundary="===============4056603745944434758=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4056603745944434758==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-+l4LrLjxAYLPgNrPa4CA"


--=-+l4LrLjxAYLPgNrPa4CA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Add a scheduling granularity enum ("cpu", "core", "socket") for
> specification of the scheduling granularity. Initially it is set to
> "cpu", this can be modified by the new boot parameter (x86 only)
> "sched-gran".
>=20
> According to the selected granularity sched_granularity is set after
> all cpus are online.
>=20
> A test is added for all sched resources holding the same number of
> cpus. Fall back to core- or cpu-scheduling in that case.
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


--=-+l4LrLjxAYLPgNrPa4CA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2MiNgACgkQFkJ4iaW4
c+4tRg//cjXjdq1ka+SIi8tdNiHY3hxXNwK910orehHX+mvIOK+YZB3EY/1SNo3I
RZI3wkHrayW7AsCLhTW9ZI5e/bdbBGME8W7kx/JgNAYd0xm7nkJkgyS/69IqW+TY
PSTeuORhxU18/RdRCJAf5Y9nUOYNkrwQJLT/gP1WcnKVqAnIxBGC3KtC32Lyb+ng
S5MswAKTlOe2B5PEWsyjDk3KeoBkXvD1n3YLTz9U5wD9wYEIhQtEYTuEuFifOVgO
pJ9wv8Cy3m3Oq4f+8DGkRj4Y1OWVyOYGFtZlpbXli3gC/abbiG87IMpBWbnnAnlj
01OZZm6JwR8pBNNvsDVCY19DfCcPjhB5vW0DCWmuKkZus6uK4DzS4FHQZJe+0Q/O
7wKZR00xhIK5y0H95qHkK6K211ZL0LigPibacNgQU2a9Y/0+hnohHrETelCp05TZ
XGo3oFSe95jIFLJ9eArYQKAUVnteF2xrxgDqlaDJXAwROFY6svSPYAKMAyu6UgAq
0zNYYdnrul4AFlM1psCMZpMBhrw79g2QXu2HoouRYkT6MPCL14sfJlBVZvA3N8l/
Wiw/idnQEL+jloClk7EQeOw3vIOSmMpP0cByF5hi19tBxehcLpOY3tyMXnNgDbQE
GM333W/YazAQLeO9LIse8AQhW2ES76FWxQYskPgDYzYfoGhs1wA=
=FAkz
-----END PGP SIGNATURE-----

--=-+l4LrLjxAYLPgNrPa4CA--



--===============4056603745944434758==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4056603745944434758==--


