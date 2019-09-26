Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D04DBEE2D
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 11:13:29 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDPmv-0000Bp-AI; Thu, 26 Sep 2019 09:10:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDPmt-0000BX-PE
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 09:10:11 +0000
X-Inumbo-ID: 6f5147bc-e03d-11e9-97fb-bc764e2007e4
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id 6f5147bc-e03d-11e9-97fb-bc764e2007e4;
 Thu, 26 Sep 2019 09:10:08 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 5EE7FAFBC;
 Thu, 26 Sep 2019 09:10:07 +0000 (UTC)
Message-ID: <88356dd20d6ee1962a649b407af056fb5b11c967.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 11:10:06 +0200
In-Reply-To: <20190914085251.18816-40-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-40-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 39/47] xen/sched: reject switching smt
 on/off with core scheduling active
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
Content-Type: multipart/mixed; boundary="===============4907797863870115478=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============4907797863870115478==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ovqK1hx5zN86uYSPtNA6"


--=-ovqK1hx5zN86uYSPtNA6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> When core or socket scheduling are active enabling or disabling smt
> is
> not possible as that would require a major host reconfiguration.
>=20
> Add a bool sched_disable_smt_switching which will be set for core or
> socket scheduling.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> Acked-by: Jan Beulich <jbeulich@suse.com>
>
Acked-by: Dario Faggioli <dfaggioli@suse.com>

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-ovqK1hx5zN86uYSPtNA6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2MgG4ACgkQFkJ4iaW4
c+7YUBAAjFhk/ho6w6vGmBCM1/1XisJag8sgpHiupzFX59iJp44/Ka4KpQqaN1zw
bUPmryMb+Ufaq2KAlqCv4ZrckYQhWDFJSAE/2b7ngD68rAmTLQHzaYDvkstAjNDp
Et5MIX1AwxFEG8qTmYG6hp+NpiTU203OTKGqjUR+x95qQHBY0ezwXhhX+ZskVjRG
uLmFnUSKzcXne36GZ1rBq7BxHgm4C4FVvJ6iNbCsSPYFYg5PxbLAijQhxtFahQ+W
Pimm4pLt20NZozL32moCgUW+HNgOfX+qscjZBXR+6BM9+0cJc53u/Mqy9S7n7Vxg
zTnASrZMunM+El779sbQPd8tJMDP1DFybcmoyUngY8Zv93ZlWqqcn1ahDgUwp/iR
LmGFHj3zfhJ6voTIqgv+dk0tVakq84rJKT6SJ0+pKuA7mVzQnXUT9Cv/Qd1xFk63
xUW69wNL9TZDEf2IMZ3i3cmhFjOTqmtb6EOaJL0gOCLU7+jKn1a19n8CHgiVfrGh
iT3rruHd4SMSiXAqaX4z5h3NZGcFDbR7IK0MTgZeBDvCvdBXNT46DODWRyywXcZL
8PHi/xdqzXBxi98WUWOl4BwmjMbKBEsLWW9CJERtmjvFEAPkkqbmrmBnowJKXsPJ
SkyZ/t1m4A1zuzI8GMsWz8afd80jmBEMRZVRr6MwKpa7PmVYN4k=
=tLq5
-----END PGP SIGNATURE-----

--=-ovqK1hx5zN86uYSPtNA6--



--===============4907797863870115478==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============4907797863870115478==--


