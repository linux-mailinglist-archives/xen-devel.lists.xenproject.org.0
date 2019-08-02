Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F21D7F3F1
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 12:01:57 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htUJi-0001S3-Ox; Fri, 02 Aug 2019 09:57:42 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0bN6=V6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1htUJh-0001Ry-3B
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 09:57:41 +0000
X-Inumbo-ID: f44b6cca-b50b-11e9-9c81-db7ca68f38a8
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f44b6cca-b50b-11e9-9c81-db7ca68f38a8;
 Fri, 02 Aug 2019 09:57:36 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 97FCFACFE
 for <xen-devel@lists.xenproject.org>; Fri,  2 Aug 2019 09:57:35 +0000 (UTC)
Message-ID: <8558ac91c3b555619a9866a339e4db20817ef626.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: xen-devel@lists.xenproject.org, jgross@suse.com
Date: Fri, 02 Aug 2019 11:57:34 +0200
In-Reply-To: <20190801160048.11031-1-jgross@suse.com>
References: <20190801160048.11031-1-jgross@suse.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [ANNOUNCE] Xen 4.13 Development Update
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
Content-Type: multipart/mixed; boundary="===============0395009106218570511=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0395009106218570511==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-C7hqhoyqg7EadNMFhl0U"


--=-C7hqhoyqg7EadNMFhl0U
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-08-01 at 18:00 +0200, Juergen Gross wrote:
>=20
> =3D Projects =3D
>=20
> =3D=3D Hypervisor =3D=3D=20
>=20
> [...]
>
> *  Core aware scheduling (RFC v1)
>   -  Dario Faggioli
>=20
> *  Core aware scheduling for credit2 (RFC v1)
>   -  Dario Faggioli
>=20
So, in theory, my patches can be made work on top of yours. And if one
does not work core-scheduling, but just core-aware scheduling, can boot
with sched-gran=3Dcpu ("disabling" core-scheduling from Juergen's
patches) and with credit2-group-sched=3Dcore ("enabling" only core-aware
scheduling, from these patches.

For this very reason, I'm not throwing the code away. :-)

*However*, if this happens, I don't think it will be soon, and
definitely not for Xen 4.13.

So, I'd say we should drop these items from this list.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-C7hqhoyqg7EadNMFhl0U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1ECQ4ACgkQFkJ4iaW4
c+6+LQ//VYb7EBTO5KewUGOO+ht6/jaJ8Eqol3PWeJ09io/hqWaRL10k0/lGX5VL
pzU43/O08RBiCAFwW1YaMgGIkrHnb3YeGMwF2XEsT4vRlSdRX+xEUzXBViR3EjTK
QuSNzPsrZ6TgDMXrlqt3Ln2xZYFJ+2w0VQbZnDTk7XQsF/IV45bRuq5Rf9FU/Gm8
641kN2UBv26gFqCZVqP0LAkaAqKVWhYAWYFpJLCgll4ac/wHFEAwhyaSj+QVemH1
JB8WrVHkWuJCcbsdMpNzjX+qS5Recje/utP1z7tItiCNCeKK1pU6mZLOGlN9xtQl
VKw9gKijWzwrbUmAZIg9XvWXVDYQsdsQSvt2UwveTe11dkkV2TfyW14+HkI3BaRv
STjZx1lOpCjSuToxjYCVQ+EWfGknzDus3aKtCzp0or/fmuOBH6oc7CkshDvrwXIY
amupD9kVJxTBJl1yIESNxO88xxqzbxG4NQ2mn1nK/yzev568N535BWCP1+y4B8Y8
jZzSHiAt21N1PN0yKbIS0nZbdw6UGMTm55QQu7oApW1OJ84URm3DuY04gih16ce3
YyH434dCE+Oc7gEB6eTIqTgFg4/mlEUKEXHwZNrUJ12wc1BN/gzvPnEYYqWQPxQg
mEqBNZW6dtFLRoqxiNoYXatQzu1lVt9qbKm7piEPQKeEORXVwBc=
=WWUg
-----END PGP SIGNATURE-----

--=-C7hqhoyqg7EadNMFhl0U--



--===============0395009106218570511==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0395009106218570511==--


