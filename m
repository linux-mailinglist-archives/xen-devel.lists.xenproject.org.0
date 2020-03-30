Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AA640197A0A
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 13:00:16 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIs7c-0003Af-6Q; Mon, 30 Mar 2020 10:58:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pYPi=5P=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jIs7a-0003AV-GX
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:58:22 +0000
X-Inumbo-ID: 5ed1ed9a-7275-11ea-b58d-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5ed1ed9a-7275-11ea-b58d-bc764e2007e4;
 Mon, 30 Mar 2020 10:58:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40038AC9D;
 Mon, 30 Mar 2020 10:58:21 +0000 (UTC)
Message-ID: <f828909bab87d11f81ab216290db045b94ec0228.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 12:58:19 +0200
In-Reply-To: <671346c5-cb0c-4bc9-8124-07beeb5cbf73@xen.org>
References: <ac7e2df75c70affd992ed68b7d3e189fa59fa709.camel@suse.com>
 <671346c5-cb0c-4bc9-8124-07beeb5cbf73@xen.org>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-2z0lRw3/ma/Ld8BSDA/G"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] Tools build failure with gcc-9.2.1
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
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-2z0lRw3/ma/Ld8BSDA/G
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-03-29 at 18:19 +0100, Julien Grall wrote:
> On 25/03/2020 09:40, Dario Faggioli wrote:
> > /usr/include/string.h:43:14: note: expected 'void * restrict' but
> > argument is of type 'const char *'
> >     43 | extern void *memcpy (void *__restrict __dest, const void
> > *__restrict __src,
> >        |              ^~~~~~
> >=20
> > When building with:
> >=20
> > gcc version 9.2.1 20200306 [revision
> > c5edde44f5b17b4891f17a63517f355bbf89e7d3] (SUSE Linux)
> >=20
> > Already known and being dealt with?
>=20
> I suspect you have a new version of Ocaml built with -safe-string as
> per=20
> [1], String_Val() will return (const char *) rather than (char *).
>=20
Yep, I checked in the ocaml headers installed on the system, and that's
exactly the case.

> I am looking at writing a patch for it and send it to xen-devel.
>=20
Cool, thanks! I'll be happy to test it. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-2z0lRw3/ma/Ld8BSDA/G
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6B0MwACgkQFkJ4iaW4
c+47yQ/9G/BFIpvRokN5KHPq3CrZEy3E/YEYUdmiojd0xpGLqcX0Tvy+q+QMejxb
yFrwcOQDFuNdriSKdDKsXRxZ+gxjMBsaHz7pZ4qb5coJvdbHoKKKjZSa39kE7sHX
GQAVFrbuQ/QKtp+s6YC4amAjoQr33im5N+c4g4fL/SzQ9LtpS+fzWweC2I7LVM8h
O6Z26PblZiU/mTwpO4RISQHteTiI2pbkptkFNDdH+Fwg2IN3Q35X0amXSJOAP9hP
MDKtEOSwpQK8IGicBK7dycoVf0zySSNY+3P7tHhJIL4wQpcuOmPXR3ClbvTfU+HU
cvbWwj9OLDI0fXr2m8qBIsV09eg6TSf5wXuCcwys1UINGKceAE1vKS+Lz5DqKM4K
RwyLUU9twUVwpZX0mFCnUnoxl2S1ugsxpsQVCSfHO7nsW0VxgvSpJ1nV+Pxn4DYn
ZhXO0LxqB4xB4KmdWitLVnrbULup/0yl+GLT64PBNd3nUzH+Ng1oHOXEdkwnQAVf
wqRMPzelQNbCruyq3w8szXc2h9Kqje7x5IypgFI8JjgnLGWwqYZY4OD4mWRwtMZR
lXGkV2WTVj/6WRkCj7aPT02hs081z/jNEhtmB1xixWoubOqm8i4h0qP/+B+/4az6
ASv5DsKfO8vzkf0XXWxj3y1b5KaYI07y3jNb952A4VNHvYzOR2g=
=GTr7
-----END PGP SIGNATURE-----

--=-2z0lRw3/ma/Ld8BSDA/G--


