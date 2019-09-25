Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C76BDF82
	for <lists+xen-devel@lfdr.de>; Wed, 25 Sep 2019 15:55:33 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iD7i5-0004pj-2x; Wed, 25 Sep 2019 13:52:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=zvtg=XU=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iD7i4-0004pe-49
 for xen-devel@lists.xenproject.org; Wed, 25 Sep 2019 13:52:00 +0000
X-Inumbo-ID: a4b0f620-df9b-11e9-9631-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id a4b0f620-df9b-11e9-9631-12813bfff9fa;
 Wed, 25 Sep 2019 13:51:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 52D6CB626;
 Wed, 25 Sep 2019 13:51:58 +0000 (UTC)
Message-ID: <61ab530c85a7159128d2cfcbb0a443dbd66210c1.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 25 Sep 2019 15:51:57 +0200
In-Reply-To: <20190914085251.18816-19-jgross@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-19-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 18/47] xen/sched: make arinc653 scheduler
 vcpu agnostic.
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Robert VanVossen <robert.vanvossen@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============5124391560502715306=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5124391560502715306==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-fNQAc4GUE7xlqXL+iJmx"


--=-fNQAc4GUE7xlqXL+iJmx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2019-09-14 at 10:52 +0200, Juergen Gross wrote:
> Switch arinc653 scheduler completely from vcpu to sched_unit usage.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
>
Reviewed-by: Dario Faggioli <dfaggioli@suse.com>

Similar considerations to the ones I made on sched_rt applies here, I
guess.

But again, as soon as core scheduling is not actually used, things
should be fine. And I'm less familiar with this scheduler than with the
others, so I'll leave any further analysis to the maintainers.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-fNQAc4GUE7xlqXL+iJmx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2LcP0ACgkQFkJ4iaW4
c+4lJw//bNvVeLb1c3zhGxF5ttiNzV4+trRiD9SbNNHaC5r1/SoVsWcRxCjWyzt5
bxQotzwB1+cabmaQ9p8oS4zjXoNPEbAu3I9+GlT17TawwcWkns9pOvy4qhs0UrJb
Pi9Id1ew+lIF5r4rnHeOSav3PXdRTURIQ7A++aPEHjhI8XgYFFkgt1XKPKyeS83M
KMKvrOH4f4wvsfQfq1KcI3DsrVfHAwb5BLeroiyC2v/OBVVHcxxWhf7i3EAd+fMN
x6+zWPt7UMpV6fw/bM9XWOVl+TrMxdtVDcElAbqLrsZOXXaUYJcPcLQUg0hEaRWE
OD5xezbPH5AGf+t/W6iUvv8p3DTByz+EBxZ8uIepQpYvzyETWBewZjmTzZIToLrU
FTsLGombabC+FEVPkX6FVj7PK+pmyXCC43zbx59d6qv8sGXndWirZNOgaP8wVM/b
ToSddZJC8pOMSWwG0haeOUq+J2Q/BA+n34S1uyMoVJ9zdckZic/kSyHrrAfdu9b4
W2yRksNu586otYSDU9XgA5UpjArcw1v4Tui0NDdf3tkIksiNQheSOQT+jlmoocTJ
GL5XjGCZePGiHhzgrCefblgO5DNAV/iekKmqRbyXFyT88GLNM9lIPcbi9tyeBOL7
pMCesm7HXk6ZdPc+NBrLrKDQ6q1C6P7HVQmsJGKSL0me5VRYU6g=
=ES3K
-----END PGP SIGNATURE-----

--=-fNQAc4GUE7xlqXL+iJmx--



--===============5124391560502715306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5124391560502715306==--


