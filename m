Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 76752BF412
	for <lists+xen-devel@lfdr.de>; Thu, 26 Sep 2019 15:31:37 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iDTpu-0007Ut-9c; Thu, 26 Sep 2019 13:29:34 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=cPk2=XV=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1iDTps-0007Ud-Bl
 for xen-devel@lists.xenproject.org; Thu, 26 Sep 2019 13:29:32 +0000
X-Inumbo-ID: aac7c0f5-e061-11e9-9654-12813bfff9fa
Received: from mx1.suse.de (unknown [195.135.220.15])
 by localhost (Halon) with ESMTPS
 id aac7c0f5-e061-11e9-9654-12813bfff9fa;
 Thu, 26 Sep 2019 13:29:31 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 7D36DAFCD;
 Thu, 26 Sep 2019 13:29:30 +0000 (UTC)
Message-ID: <77f14e7e8c054d499949d4ce1311cb52008c12d2.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: =?ISO-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>, 
 xen-devel@lists.xenproject.org
Date: Thu, 26 Sep 2019 15:29:29 +0200
In-Reply-To: <00d9a8c0-614c-c290-3c36-12d2d3c38096@suse.com>
References: <20190914085251.18816-1-jgross@suse.com>
 <20190914085251.18816-27-jgross@suse.com>
 <71a73c6c9224bcaaf1b47a3f0cd0c5a304334300.camel@suse.com>
 <2def1338-8048-58b3-9c5d-a0baf6f3dcb8@suse.com>
 <569f998ccb9a3c1c184c4f2c8244401ad730fb33.camel@suse.com>
 <00d9a8c0-614c-c290-3c36-12d2d3c38096@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v3 26/47] xen/sched: Change vcpu_migrate_*()
 to operate on schedule unit
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
Cc: George Dunlap <george.dunlap@eu.citrix.com>
Content-Type: multipart/mixed; boundary="===============1258100100940008975=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1258100100940008975==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-rU15wvenyP/9xsitamh5"


--=-rU15wvenyP/9xsitamh5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-09-26 at 06:51 +0200, J=C3=BCrgen Gro=C3=9F wrote:
> On 25.09.19 18:37, Dario Faggioli wrote:
> > > This is done by vcpu_sync_execstate(). Without the explicit call
> > > it would be done either when the vcpu is being scheduled on the
> > > new
> > > cpu
> > > or if another non-idle vcpu is becoming active on the old cpu.
> > >=20
> > Right. And does this then means that we're now doing it twice
> > (i.e.,
> > here and either of the other places you mentioned)?
>=20
> No, it checks whether it has to do anything.
>=20
Which I knew, but keep forgetting. :-(

Thanks, and sorry for the noise.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-rU15wvenyP/9xsitamh5
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl2MvTkACgkQFkJ4iaW4
c+62hA/+NgoxxPj5gkqoQyuPoN/OUYY9lnjvHxPPsMNMxuoyOfi5Ohvp7Btr6i6V
QFMA0TgmZYnIT2KOq7ZJnaLGvjZF9WrbH1VU9Q4QlfcyCq1N51QIAJbPrZpiTBgm
BpSTWySC+TPTMAA1L/8WcRbWICJQve1F+zbW9px4CYUs/zskpV2O1u5VjpDRG6x7
eVNgL+oo/nXYcvSqPvCrhuWxPHnhO8CjtoWFouVrlM85vzCNPbION9Al9VLp91b/
RWCAtGy6KIqwpMFc4Q5+M54lwCBmNthjSTsFrG0ZfyBdb5mdccY0mMu6elbxG75b
XJ33iCZzFVpt/lH6Wy4J+AUexYkyObj5wehAKz0j4NJEWUFgGjmbPJ9pRfKP+zDU
QGULMzcEgf//t7oRE++W8dFaxbta24wkSv6w654l6kj7sLmdXk6TeUX53qq+TZy5
dnUuv6EY+fBOMw82xzCvvT/aOVhAaEI0SG5+N6W/q3ENBJUQ736K/tI3fKsk5hwV
4Y7g2sZ58G0oABy5SMcgMifxtcpfHKWexsXLVlo4lRP0l0cwst4Le0e3ODV8J1GX
TkzsgcEkSB2YGivXLCDbk1WEK+IOlTKGTdje57ChgpFdKeYHVWCSpC2t2IbKYMzd
YMTKJEf2Ofnya1lCv2zGNbuUzRLBchnCTN+4Xr+IHhTsT4W1Gk4=
=83OX
-----END PGP SIGNATURE-----

--=-rU15wvenyP/9xsitamh5--



--===============1258100100940008975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1258100100940008975==--


