Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E04EEC02A7
	for <lists+xen-devel@lfdr.de>; Fri, 27 Sep 2019 11:48:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDmpS-0002ht-Fw; Fri, 27 Sep 2019 09:46:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=drc8=XW=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDmpQ-0002ho-SD
 for xen-devel@lists.xenproject.org; Fri, 27 Sep 2019 09:46:20 +0000
X-Inumbo-ID: a853b6ac-e10b-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a853b6ac-e10b-11e9-97fb-bc764e2007e4;
 Fri, 27 Sep 2019 09:46:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 1C6F6ABE3;
 Fri, 27 Sep 2019 09:46:18 +0000 (UTC)
Message-ID: <cd10ae4d7f48c5d59c5ce9505e2facd3f3058f45.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Fri, 27 Sep 2019 11:46:15 +0200
In-Reply-To: <20190927070050.12405-32-jgross@suse.com>
References: <20190927070050.12405-1-jgross@suse.com>
 <20190927070050.12405-32-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v4 31/46] xen/sched: modify
 cpupool_domain_cpumask() to be an unit mask
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
 Robert VanVossen <robert.vanvossen@dornerworks.com>,
 Julien Grall <julien.grall@arm.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============2499422704971635672=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============2499422704971635672==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Je0NW54owG0WXtpaiL2b"


--=-Je0NW54owG0WXtpaiL2b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2019-09-27 at 09:00 +0200, Juergen Gross wrote:
> cpupool_domain_cpumask() is used by scheduling to select cpus or to
> iterate over cpus. In order to support scheduling units spanning
> multiple cpus rename cpupool_domain_cpumask() to
> cpupool_domain_master_cpumask() and let it return a cpumask with only
> one bit set per scheduling resource.
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


--=-Je0NW54owG0WXtpaiL2b
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2N2mcACgkQFkJ4iaW4
c+6DSRAAnnl0/JSNoxW6/RIHwFgiTAF3bDEmUc69x3Us+AXPlJVGmp2JDkK5jzoN
dZRG0UMe7pwqjFn0UUFADzwpZx87nen1keHpRoQNb9s8Noz3RFuRT8CSNkWh8Avz
oxoKLCpLgVil2o8dUxe/G8XqjfVe+HR18ShH6ovFNUbVzHKXEMkdGUPn7DHnjnpD
eLsqs59lw8YMR3rdxMheeTnwj+DNcJ6tM9D64A8FrNzhofxYwvzKCPE/6ojUohIX
Uc71kvpwNYw9FcCP1abiteg+JNrjQrVfr760LqYYSqO19RdEM2kFV+XvvO/JvaoF
exVlxZLNTdghbES0nKI/V1nQHXolnzEh3PRBuxjhrtjrhleKlANUgFdNyEesoNA4
1954BveY7wpgf29W5Vu2QIRVOJT6fqOljWSSKe4JzSB9CjK9+VUEaoupyWW9cD5Q
fsR+xqO3Ibmyi0NtwtgXupnEGyLDrFANUiGSEckKjDeapPFl1uTwZ2yFXE/troVO
/BXmf4fEDmM5UNkhVQbWXsXYrrYWmx+GixwAi2btavFvowNtY23mr0FsYdJuhTdd
k9V4U7R13vIHFIODm3cADNSK2Zxgv8AliZfgw1382TA/BVSOXOqbNPBjYojVHoJF
DqeoQ1VAaSqYCuOZ0SD59CO3EhGBqPIedJXk3kfI/lkdtvoxYvE=
=o2GT
-----END PGP SIGNATURE-----

--=-Je0NW54owG0WXtpaiL2b--



--===============2499422704971635672==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============2499422704971635672==--


