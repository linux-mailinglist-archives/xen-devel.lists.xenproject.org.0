Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BB0DC82407
	for <lists+xen-devel@lfdr.de>; Mon,  5 Aug 2019 19:33:00 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hugoP-00088D-MB; Mon, 05 Aug 2019 17:30:21 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=fHnn=WB=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1hugoO-000888-KD
 for xen-devel@lists.xenproject.org; Mon, 05 Aug 2019 17:30:20 +0000
X-Inumbo-ID: b1b3892f-b7a6-11e9-8980-bc764e045a96
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b1b3892f-b7a6-11e9-8980-bc764e045a96;
 Mon, 05 Aug 2019 17:30:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id E3B7AAD7F;
 Mon,  5 Aug 2019 17:30:17 +0000 (UTC)
Message-ID: <1e165c9cff8827288097eec56f538f4e63771757.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: George Dunlap <george.dunlap@citrix.com>, Jan Beulich <JBeulich@suse.com>
Date: Mon, 05 Aug 2019 19:30:16 +0200
In-Reply-To: <1b6be92e-6acd-0fd8-fa63-f34c5e0ccc97@citrix.com>
References: <156412188377.2385.12588508835559819141.stgit@Palanthas>
 <156412235104.2385.3911161728130674771.stgit@Palanthas>
 <13f139f6-c39d-f30f-11ae-3338d044a7fe@suse.com>
 <1b6be92e-6acd-0fd8-fa63-f34c5e0ccc97@citrix.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH v2 1/4] xen: sched: refector code around
 vcpu_deassign() in null scheduler
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
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0814002187933358409=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0814002187933358409==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lMTohnKu3D4t9n2O0HmM"


--=-lMTohnKu3D4t9n2O0HmM
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-08-05 at 17:04 +0100, George Dunlap wrote:
> On 8/5/19 4:58 PM, Jan Beulich wrote:
> > On 26.07.2019 08:25, Dario Faggioli wrote:
> > >=20
> > 1) The commit is empty, presumably because I did apply the patch a
> > few
> > days ago already.
> >=20
> > 2) The committer is recorded as "Patchew Importer <
> > importer@patchew.org>".
> > Do we really want to hide the fact who has been committing a patch?
> > While it's mostly mechanical, there's still the human decision of
> > "this
> > is ready to go in" involved, which I don't think a bot can reliably
> > take
> > in all cases.
>=20
> Both of these are mistakes, and due to the fact that I `git fetch`ed
> patchew's commit rather than doing `git am` of the mbox provided by
> patchew.  (And I used patchew's commit because somehow 4/4 didn't
> reach
> my inbox.)
>
And this last part is apparently my fault, as your email address is
actually wrong, in the Cc line of that patch.

So I guess I had a part in this as well... Sorry about that! :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-lMTohnKu3D4t9n2O0HmM
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1IZ6gACgkQFkJ4iaW4
c+79eQ//WG/5yr+GksQpEeu+ipa2I4CkaQfMXFTPFtAamA8+Q8geRzxhXjaizO+C
dtORFcBFLn70bHCZ5HMix6+JTpZRq5g6TisPEKF5dZ7orgiNEnSBOwEBDrH/QCRh
PBJfpYMJKhR8Od4l1DwVT+C8SwqZKaU1uJMN7LeHX6xH064KaKqCrV/TpaXlj50Z
mHgVpBsD01fw8BKgJNvd7lNoZ3VSKbNMFX0i8Y/+BCR4r8FwTN7QEQE9ZriJtnBs
J+KWyJayJw/2FVyRij3C3MmPiYl7rXmmYEJkn19XT465l3upCh2Iqr8it63pNwm/
GpH/0djQaMt82bUwmuaLwLXRdTQsx03bZQEfCZTKH6XHxXoazEAVMcrh+zcrmS2Q
TioVontf6WRFdDG5p0aUDSEyNlmLYw+IHG05zTt9++akFUZk63Nss8qFMUp2mGaT
4ulIvmNFIAQWKUdb9P/UiQpHn1LBZ1gjkNncDA1aJ9700SARntAOKJ5Wu406F+IE
KPhuUhNl+rc4kHitRXRDnB/W69CrwU1OSzssVcG/AgVrk/LceONS6LIqxbNP3a5J
i7HHJ2tLf11vsXq4VoD0HZqaxLGBwQwYNWJAxljL8O+GpSZahcWdHOyX67YNZAgl
n4afDPwwZArYGwa5ScKT1s/fxG2bckMohGtVfNOVMNsa9WoIk7k=
=NF1i
-----END PGP SIGNATURE-----

--=-lMTohnKu3D4t9n2O0HmM--



--===============0814002187933358409==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0814002187933358409==--


