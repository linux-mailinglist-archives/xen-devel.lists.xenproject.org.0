Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 587EE1242F1
	for <lists+xen-devel@lfdr.de>; Wed, 18 Dec 2019 10:24:08 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ihVVo-0005e4-TT; Wed, 18 Dec 2019 09:20:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lBFt=2I=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1ihVVn-0005dz-Ky
 for xen-devel@lists.xenproject.org; Wed, 18 Dec 2019 09:20:55 +0000
X-Inumbo-ID: ac715288-2177-11ea-88e7-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id ac715288-2177-11ea-88e7-bc764e2007e4;
 Wed, 18 Dec 2019 09:20:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id DD428ACC4;
 Wed, 18 Dec 2019 09:20:45 +0000 (UTC)
Message-ID: <0bdb496a5e8dbfbfd3f1fa2adf299862150a35fb.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Wed, 18 Dec 2019 10:20:43 +0100
In-Reply-To: <ace0f426-61ee-a2a6-ff89-3974706c9ddf@suse.com>
References: <20191218074859.21665-1-jgross@suse.com>
 <20191218074859.21665-3-jgross@suse.com>
 <242410d6fa204129b0d99cdfda05badf276f24ed.camel@suse.com>
 <bbe9f829-0b79-9d1c-4f08-8bd936a8e0a7@citrix.com>
 <ace0f426-61ee-a2a6-ff89-3974706c9ddf@suse.com>
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
 Ian Jackson <ian.jackson@eu.citrix.com>,
 Josh Whitehead <josh.whitehead@dornerworks.com>,
 Meng Xu <mengxu@cis.upenn.edu>, Jan Beulich <jbeulich@suse.com>,
 Stewart Hildebrand <stewart.hildebrand@dornerworks.com>,
 Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Content-Type: multipart/mixed; boundary="===============5355739283258815579=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5355739283258815579==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-7I+/Mc28TywY3mFQWv3t"


--=-7I+/Mc28TywY3mFQWv3t
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-12-18 at 10:15 +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 18.12.19 10:10, Andrew Cooper wrote:
> > On 18/12/2019 09:08, Dario Faggioli wrote:
> > > > Signed-off-by: Juergen Gross <jgross@suse.com>
> > > >=20
> > > Reviewed-by: Dario Faggioli <dfaggioli@suse.com>
> >=20
> > Thoughts on simply naming it private.h?
>=20
> Fine with me. Dario?
>=20
Ah, yes, indeed.

In fact, it being called sched-if inside common/sched would have been
another instance of the 'sched' repetition I suggested myself to
limit/get rid of... but I did not notice it myself when looking at the
patch. :-)

I am indeed ok with private.h

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-7I+/Mc28TywY3mFQWv3t
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl3572sACgkQFkJ4iaW4
c+7qXA/9EKYPYu0r5L/p8HgEqLShxK/US+JILFojCTm+tQUCQMkZvxjCQ4VvQ+VC
NTPl+F/gYfp5gZacS7UofLXB33sb41ho5jstuwTYj7fcaz2sA+dr1l/ZuSayUeNW
8jEt/WkPoJ3/ilASO+M/b/T3fdvizHzXmoVrvtW/QRSeGE7bIFHfKaIEGLDj1Lqz
L9XyIuiV/bzQ5eau8Qp2CUcbR3JPrzqXcik7zRgkIv1rsl7JCp4v3Gc6RyvKGesc
/lPI+J++y0iZZ31TVREZPY4Y5bFHIij1y0ZITU3FfLd5+UOjr1WOTcFhBqh3dPFh
IVqyu1TkhJLVV71BNcTkZEM3+rtD45MAYmgKjPmQlShjLFGTmy1izHWf/mnUmLaJ
fjnZjDD1fRyqMPRgMWqWxmF8tSwgoVl9gTQ0GXNnGth4AP1e5rQ8JSQqMIKg1P2y
4A9L2HcvIyk6LRHNvHFkbz7v4K8BVI2dsgNgly0gmPkOnsNRIESZ6HetBGZvxKIS
DtuHXXAKTAZMHr3RGjl1boyIbXaoNioldhBgFp2x/foJ0cfyq9b1wvf3kSvEsjo+
xdxyJ/eTyCCf1y8p8elsta2SaoE5GdtK2CgwRxHX8Y7tvuXOREl6EawMJLQNPGLs
X9IXpyv7qgh2OK3Ysx2BQ4juXZwcZUEo+n6OVZUubPUC+9pezIw=
=IuTj
-----END PGP SIGNATURE-----

--=-7I+/Mc28TywY3mFQWv3t--



--===============5355739283258815579==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5355739283258815579==--


