Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 252DD1454C1
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 14:06:15 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuFfn-0007e7-7G; Wed, 22 Jan 2020 13:03:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fyJD=3L=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iuFfm-0007e2-BN
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 13:03:54 +0000
X-Inumbo-ID: 9e7376f0-3d17-11ea-9fd7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 9e7376f0-3d17-11ea-9fd7-bc764e2007e4;
 Wed, 22 Jan 2020 13:03:44 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 57397B2A9;
 Wed, 22 Jan 2020 13:03:43 +0000 (UTC)
Message-ID: <69666659718468421a55e573a8dfa4db584cbcdb.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org
Date: Wed, 22 Jan 2020 14:03:41 +0100
In-Reply-To: <20200108152328.27194-2-jgross@suse.com>
References: <20200108152328.27194-1-jgross@suse.com>
 <20200108152328.27194-2-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.34.3 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/9] xen/sched: move schedulers and
 cpupool coding to dedicated directory
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
 Meng Xu <mengxu@cis.upenn.edu>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>
Content-Type: multipart/mixed; boundary="===============5300917365488892839=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5300917365488892839==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-10PHVB7cjvNxDx9k74Yu"


--=-10PHVB7cjvNxDx9k74Yu
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2020-01-08 at 16:23 +0100, Juergen Gross wrote:
> Move sched*c and cpupool.c to a new directory common/sched.
>=20
> Signed-off-by: Juergen Gross <jgross@suse.com>
> ---
> V2:
> - renamed sources (Dario Faggioli, Andrew Cooper)
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


--=-10PHVB7cjvNxDx9k74Yu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl4oSC0ACgkQFkJ4iaW4
c+6R3w/8DDIvCWc8E7d85/fbf+Za7SAWUIpdK3JEVvv2PLdIJXwTdJnp0TR/9C3e
OWnaHx/80mCRYdHqUahuYPAh4nuFIRWHbe6WXBJO9ktx45ZJQtVf2zeCdWwsOLwq
82Ahuisw+db3hqh+S3vGneeuOM7O1WZqVstEO8ivT3S7zt3hmPZIVMJyKC+j2jMU
v3zENeapCEJXDPY7PYr4h+1HW3arIQioY61mN7+VAkMV4TtA3T3uhGPGhXf8FdKz
YSpBEU+2iCFFqhBuO3dpZ//2Pnj5Bk380sI23ZZGJWDBS6LbCJgedqakD5WBykju
snsVOYDjOfAW6Z4jI0UckTHs9YpuEDyztDELbQJgyxXBH8yM3AY0bz2fvAJlrBJ3
euhOMR62Hmt2pFZJ2VnVkf+tHQXgZd2/LoG//6+csdBuN3DplOLXpZf7ORcAdk9Q
ifx6t84lNBCnL+iJ3sJBlJ3z2lnVoJ7sdUH8Uq1//frQXZSV0DxRlI5pScYih2B1
ZAYgAN7mLIYgCzM6a9JFbyNdT0VFv3j6EbzLDBsk7sJVhvQTDzVO0QHofyWvDf2m
bbvmlRkqm+gwBKita8dB/f7zi5/uAM5nLCd1Qt3rPk1uRkT3u2T9rmj3feCL+O00
HW/+21+Be8kwY1hdlmaElYhfw2JRKfysb6vhPKXdTH0Dtwil/0c=
=nQgL
-----END PGP SIGNATURE-----

--=-10PHVB7cjvNxDx9k74Yu--



--===============5300917365488892839==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5300917365488892839==--


