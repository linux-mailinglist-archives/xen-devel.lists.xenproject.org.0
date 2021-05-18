Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 21752387C7B
	for <lists+xen-devel@lfdr.de>; Tue, 18 May 2021 17:31:02 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.129375.242852 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1fz-0001UD-Qq; Tue, 18 May 2021 15:30:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 129375.242852; Tue, 18 May 2021 15:30:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lj1fz-0001S4-Nm; Tue, 18 May 2021 15:30:31 +0000
Received: by outflank-mailman (input) for mailman id 129375;
 Tue, 18 May 2021 15:30:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=h4/q=KN=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1lj1fy-0001Ru-6D
 for xen-devel@lists.xenproject.org; Tue, 18 May 2021 15:30:30 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 70013234-f156-4ab8-8bb4-bfef67ccb8c4;
 Tue, 18 May 2021 15:30:29 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2A86BAFBF;
 Tue, 18 May 2021 15:30:28 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
X-Inumbo-ID: 70013234-f156-4ab8-8bb4-bfef67ccb8c4
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1621351828; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+czU1VmpyowP7r/f8lRmHd6JBxgqdQOEcws0oO8zlQ=;
	b=dWNAVAi3MOETbiOZOYzsONhAJzwQ9u0CeJ2p+ri2YkT2+U1l76eSR7/Yhig+qY53JgNmCl
	9PMbYx5+xvQzdCoLEO+zV6JC8sn6TPhocwzQboIDtUGBUwNXyqkNMx80wBta3UjH078Xno
	2k0G5bdXl4KneGOEApCM0jj5K7fZWzE=
Message-ID: <a393f47c5450195cf8be88e7ea5e9d3977576563.camel@suse.com>
Subject: Re: [PATCH 2/2] automation: fix dependencies on openSUSE Tumbleweed
 containers
From: Dario Faggioli <dfaggioli@suse.com>
To: Roger Pau =?ISO-8859-1?Q?Monn=E9?= <roger.pau@citrix.com>
Cc: xen-devel@lists.xenproject.org, Doug Goldstein <cardoe@cardoe.com>, 
	Andrew Cooper <andrew.cooper3@citrix.com>
Date: Tue, 18 May 2021 17:30:26 +0200
In-Reply-To: <9160502180e3c36a52cb841520615bc7fe91b42b.camel@suse.com>
References: <162133919718.25010.4197057069904956422.stgit@Wayrath>
	 <162133945335.25010.4601866854997664898.stgit@Wayrath>
	 <YKO/BcUAtjSgc2pV@Air-de-Roger>
	 <9160502180e3c36a52cb841520615bc7fe91b42b.camel@suse.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-ZXqkCeZwfnw85QfOh/fH"
User-Agent: Evolution 3.40.1 (by Flathub.org) 
MIME-Version: 1.0


--=-ZXqkCeZwfnw85QfOh/fH
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2021-05-18 at 16:33 +0200, Dario Faggioli wrote:
> On Tue, 2021-05-18 at 15:20 +0200, Roger Pau Monn=C3=A9 wrote:
> > On Tue, May 18, 2021 at 02:04:13PM +0200, Dario Faggioli wrote:
> > > From: Dario Faggioli <dario@Solace.fritz.box>
> > >=20
> Mmm... this email address does not really exist, and it's a mistake
> that it ended up here. :-/
>=20
> > > Fix the build inside our openSUSE Tumbleweed container by using
> > > the proper python development packages (and adding zstd headers).
> > >=20
> > > Signed-off-by: Dario Faggioli <dfaggioli@suse.com>
> > > ---
> > > Cc: Doug Goldstein <cardoe@cardoe.com>
> > > Cc: Roger Pau Monne <roger.pau@citrix.com>
> > > Cc: Andrew Cooper <andrew.cooper3@citrix.com>
> > > ---
> > > =C2=A0.../build/suse/opensuse-tumbleweed.dockerfile=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 5 ++---
> > > =C2=A01 file changed, 2 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > > b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > > index 8ff7b9b5ce..5b99cb8a53 100644
> > > --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > > +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > >=20
> > > @@ -56,10 +57,8 @@ RUN zypper install -y --no-recommends \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pandoc \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 patch \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pkg-config \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python-devel \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3 \
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python3-devel \
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 python38-devel \
> >=20
> > When I tested python3-devel was translated into python38-devel,=C2=A0
> >=20
> Oh, really? And when was it that you tested it, if I can ask?
>=20
> > which
> > I think is better as we don't need to modify the docker file for
> > every
> > new Python version?
> >=20
> That would definitely be better. Right now, I don't see any
> python3-devel package. If python3-devel can still be used (and it
> somehow translates to the proper -devel package), then sure we should
> use it. I'm not sure how that would happen, but maybe it's just me
> being unaware of some packaging magic.
>=20
> Let me put "python3-devel" there and test locally again, so we know
> if
> it actually works.
>=20
Ok, indeed it works. And, on a second though, it's not obscure at all
that it does.

It's just that python38-devel _provides_ python3-devel, which makes a
lot of sense, and it was silly of me to not think it does that and use
just python3-devel in the first place:

dario@4b10a592ca98:~> zypper if --provides python38-devel
Information for package python38-devel:                                    =
                                                                           =
                                                                           =
            =20
---------------------------------------                                    =
                                                                           =
                                                                           =
            =20
Repository     : @System                                                   =
                                                                           =
                                                                           =
            =20
Name           : python38-devel                                            =
                                                                           =
                                                                           =
            =20
Version        : 3.8.10-1.2
Arch           : x86_64
Vendor         : openSUSE
Installed Size : 882.7 KiB
Installed      : Yes
Status         : up-to-date
Source package : python38-core-3.8.10-1.2.src
Summary        : Include Files and Libraries Mandatory for Building Python =
Modules
[...]
Provides       : [8]
    libpython3.so()(64bit)
    pkgconfig(python-3.8) =3D 3.8
    pkgconfig(python-3.8-embed) =3D 3.8
    pkgconfig(python3) =3D 3.8
    pkgconfig(python3-embed) =3D 3.8
    python3-devel =3D 3.8.10
    python38-devel =3D 3.8.10-1.2
    python38-devel(x86-64) =3D 3.8.10-1.2

What now puzzles me a little, though, is why the build was failing, as
python3-devel was already there in the docker file. Maybe we "just"
forgot to push the image?

Well, there's a different issue (missing libzstd-devel), so I'll send a
v2 of this series anyway.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-ZXqkCeZwfnw85QfOh/fH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmCj3ZIACgkQFkJ4iaW4
c+4sbRAAjkTFmVhbLi+vYpgAPIgX+YyN41Y8x9Ejb8UqCFyB1HKWoeOaQdodOp1z
zIkdKS+8F1GaA0vxlD+rzD0s8DWtH1O30K/6DJDeSY/qpKnNB23Pp3M7lcgluwlO
Se0wOq1aYT88KaOg013inf2t21U/uN2frrYkM2UAD0Ha5o1qh7iy86qDhLBrpBjV
zkhY0VPQtFLn68m/1COqIB+G6DbZ8ccDo1tu/xk3tdV+9R/2Ll/o6V6+BaefvTUB
dwch/KYAqXRM8hvaYvGnXpKs9mAOlijqJNvYZQxP/clH7jTadVQQF3IIB1fXRwxX
ytVV8bBuX1Nxorb/hSqVI8xiwdoGOsZKuILK2Uh8Vjn/5KfvHPVyiNUEIOVD1TeY
tQzNZ2f4shqYkmvS+Rz/26g78RcN6UMcDEPHQV0/Pc0NpjQVzRfpnUC3WQLegKTN
92r9PqWjIxXPKd05pfQChtSTs8kJVwr3DqHiYiABJfVj5y0BsBZJOX9IJreoFffW
/50v8WlBmy+aADq8Kfv1DvM0mBne1l4XI7rwBUSEdB/SGyuzSuWgsFizBnG0WKyv
/Z7sVBBNedmGiMxOkDyDUJ7uEFd4KjuIgktAWEo8w0Ye2Gwqzv4sExibFJf7F1zs
0Sb4/Xh29JoGn/w8+oEU93R9EgeZOXdALYCnRRiBdXkQVt2APd0=
=80KJ
-----END PGP SIGNATURE-----

--=-ZXqkCeZwfnw85QfOh/fH--


