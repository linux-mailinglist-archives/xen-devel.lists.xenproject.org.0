Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 094AB17AD65
	for <lists+xen-devel@lfdr.de>; Thu,  5 Mar 2020 18:38:34 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j9uPP-0003FZ-2x; Thu, 05 Mar 2020 17:35:43 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=PwMB=4W=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1j9uPN-0003FU-GM
 for xen-devel@lists.xenproject.org; Thu, 05 Mar 2020 17:35:41 +0000
X-Inumbo-ID: bb2b7f92-5f07-11ea-a63a-12813bfff9fa
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id bb2b7f92-5f07-11ea-a63a-12813bfff9fa;
 Thu, 05 Mar 2020 17:35:40 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CBB19ACC6;
 Thu,  5 Mar 2020 17:35:38 +0000 (UTC)
Message-ID: <ed3b714bed3bcb8331e38c1cdafc06607c0fdfa2.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Ian Jackson <ian.jackson@citrix.com>
Date: Thu, 05 Mar 2020 18:35:37 +0100
In-Reply-To: <24160.57771.145327.230573@mariner.uk.xensource.com>
References: <E1j9RHW-0007Ya-1K@osstest.test-lab.xenproject.org>
 <ae66ce58d2548deaab15d1f430e2aa7a41448ce1.camel@suse.com>
 <24160.57771.145327.230573@mariner.uk.xensource.com>
Organization: SUSE
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [linux-linus bisection] complete
 test-amd64-amd64-xl-credit2
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1394655696289375435=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1394655696289375435==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-xHNBO8805le9QvA5hBCD"


--=-xHNBO8805le9QvA5hBCD
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2020-03-05 at 11:25 +0000, Ian Jackson wrote:
> Dario Faggioli writes ("Re: [Xen-devel] [linux-linus bisection]
> complete test-amd64-amd64-xl-credit2"):
> > >   Last fail repro:=20
> > > http://logs.test-lab.xenproject.org/osstest/logs/148053/
> > >=20
> > In OSSTest, we don't capture and save the guest serial console
> > output,
> > or do we?
>=20
> Sure, we do.  Although of course this ia a PV guest and it has no
> "serial".  It does have hvc0.
>
Sure, that's what I meant (sorry).
>=20
> Here is its console log:
>=20
> http://logs.test-lab.xenproject.org/osstest/logs/148053/test-amd64-amd64-=
xl-credit2/chardonnay1---var-log-xen-console-guest-debian.guest.osstest.log=
1
>=20
Ah, in fact, I did recall that we were collecting it.

But I forgot where.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-xHNBO8805le9QvA5hBCD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl5hOGkACgkQFkJ4iaW4
c+7sQw/+PuHXDI905GCRanD0jCwF1r/dcb+rTfWJV+RFgv4cZMIyef6uqFSAS8FB
GZgU/FHKLbo3rMEzqvYZTs22n3kyhbTrvhHYcPdtxvs8+YO13b1y+5I+CiwnnwEc
y8EfEKQSEaPVILMzqKFhs1zEpaKYIRoXPz2yMEavJ7nDBIEKqE6gGdD21869cvWz
ebnxLsgOQrrIGodHSh8WY0Wv8BKydNpbYvZZuVTXRhOWqNOQ0VDF9x1h7ywQTkDc
KRGY33IQoKkcwXsNhzG6+Sxpen8wEg/XPIbdfYoQ1RbovUeuy0yzVOpmM2rq3SLJ
iA0IxMMcKsfZVLH5xg0edVNz9q7t/Z1At+Gn03yJ0TAZT7SJ+eF5nR8vq2/tOJpc
hohgjY+REv4QAG9lCpLmR9JeSSRzDuBG9mMJRl8i5g7uDPeaz+momM6QET4/MCUo
PstN8dZaj++0Xq8evgxXkzBhWbi8DfG+rI8/1M2LrELOqFYni8hG0j3JDPKEV7ch
ZvLB/M5sZXOijsgrUYxknSxZVMHniIZ0HAq8DyYxLOOhtnqD2FTbahIW10pJFKbj
gmV3wxu18DpDtSHKcxkf/znF3ISPA/ZMrCl5dtnSc38v2XNd6V1oMbkVVwHWEvqt
dRj19LNy1zPU0aY+08YgkKWEzoV6iw4zT5dynjud8/Xo+TEf77M=
=kxVy
-----END PGP SIGNATURE-----

--=-xHNBO8805le9QvA5hBCD--



--===============1394655696289375435==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1394655696289375435==--


