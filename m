Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EC4F27F65E
	for <lists+xen-devel@lfdr.de>; Fri,  2 Aug 2019 14:03:11 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1htWEg-00024g-Nm; Fri, 02 Aug 2019 12:00:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=0bN6=V6=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1htWEf-00024Z-Lk
 for xen-devel@lists.xenproject.org; Fri, 02 Aug 2019 12:00:37 +0000
X-Inumbo-ID: 210608a4-b51d-11e9-8c7f-57063c731a32
Received: from mx1.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 210608a4-b51d-11e9-8c7f-57063c731a32;
 Fri, 02 Aug 2019 12:00:32 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 00C36AFF1;
 Fri,  2 Aug 2019 12:00:31 +0000 (UTC)
Message-ID: <40213dac0d5d431c4cbc39efdeab23a222ddcc90.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Doug Goldstein <cardoe@cardoe.com>, xen-devel@lists.xenproject.org
Date: Fri, 02 Aug 2019 14:00:30 +0200
In-Reply-To: <65d9c6bf-3eec-59d0-a070-8142f34d9e15@cardoe.com>
References: <156413540514.22784.14073005924861814163.stgit@Palanthas>
 <65d9c6bf-3eec-59d0-a070-8142f34d9e15@cardoe.com>
Organization: SUSE
User-Agent: Evolution 3.32.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] ci: install C++ in opensuse-leap CI
 container
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
Content-Type: multipart/mixed; boundary="===============8044384601348431940=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8044384601348431940==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-5mMi5Hi1BplqyoOb/EZ3"


--=-5mMi5Hi1BplqyoOb/EZ3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-07-29 at 12:18 -0500, Doug Goldstein wrote:
> On 7/26/19 5:03 AM, Dario Faggioli wrote:
>=20
> > The openSUSE Leap container image, built after
> > opensuse-leap.dockerfile was missing the gcc-c++,
> > which is necessary, e.g., for building OVMF.
> >=20
> > Add it.
> >=20
> > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > ---
> > Cc: Doug Goldstein <cardoe@cardoe.com>
> > ---
>=20
> Acked-by: Doug Goldstein <cardoe@cardoe.com>
>=20
Hey, sorry, I missed this mail. Thanks for the Ack.

> Will you be pushing the rebuilt container or do you need me to do
> that?
>=20
I tried to push, but:

$ PUSH=3D1 make suse/opensuse-leap
docker build -t registry.gitlab.com/xen-project/xen/suse:opensuse-leap -f s=
use/opensuse-leap.dockerfile suse
Sending build context to Docker daemon  4.608kB
Step 1/7 : FROM opensuse/leap
 ---> dd4bf894d243
Step 2/7 : LABEL maintainer.name=3D"The Xen Project"       maintainer.email=
=3D"xen-devel@lists.xenproject.org"
...
...
...
Successfully built c78388ff370b
Successfully tagged registry.gitlab.com/xen-project/xen/suse:opensuse-leap
The push refers to repository [registry.gitlab.com/xen-project/xen/suse]
007cb8c7f305: Preparing=20
b399fccb00f7: Preparing=20
70ea1f18573b: Preparing=20
2379cf7101e2: Preparing=20
denied: requested access to the resource is denied
make: *** [Makefile:14: suse/opensuse-leap] Error 1

:-)

So, I guess someone else, with enough rights, would have to do that.

Or am I missing some auth step or aomething?

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-5mMi5Hi1BplqyoOb/EZ3
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl1EJd4ACgkQFkJ4iaW4
c+6G0Q//d6tZb4o+8N6IGN7yRYs19xGOFVnaJc8/Of3l7Pc37kEoHg4ssvSaU7/J
pBWVg1Uugo1lT+oF07wREqaXmDvCU1C8egDISlOYh3MG80Mu+VXUoVZO/kKGFxxa
Hq2koYpBTzBS52ASeEeLRo5fCzlj3dO8a9qk7Qwn0NO6/JgyUR1RxewD86e12E3Q
SY18xYhei2DKEcGx5wPYIVv15xegSLamR+3i+cRLAMHqzf8hul2uEULCbrNm9c8u
Eezb0g/VB6bmWjNOOfOc/pibPxDI81ob2VGf1f1aZQjCUmmHOKyOb25WLksAovMe
lWOkotD2Ml47nINfIVrOcPAX1S7Xx733RO81gR5pP2zHyFcGnoXqnDbdKiRfVWr3
P1lULy/+i12mEt+esJhjwehmF4G/i+pJBjsWunLQNmpNWGSWEwXxnJGRT3a/WjiE
gEYb3VQ0SeUgrgGgVgLtISmp0XUduiDuUNBrofSUYfpwKP6z32MBZL8BfRjFsqlU
a93UbW7s1Eqco0vNmnAgVV80U4/SL12/Wc6iuR+eXOVXoh2cW2i0DnTNVxnMqu+N
+ZXnqgLTy//ZBaJIBxo2N/CwkBel9ZMQqdpoCIvFxgVwN8FjniagHevNB7PUzWUc
JoHdIMcfNE9Pb97MZNnUCzaAUNAdPyPSJH0wIU6GreIh/m1x8Sk=
=Ohsi
-----END PGP SIGNATURE-----

--=-5mMi5Hi1BplqyoOb/EZ3--



--===============8044384601348431940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8044384601348431940==--


