Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 320B219795F
	for <lists+xen-devel@lfdr.de>; Mon, 30 Mar 2020 12:35:54 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jIrj3-00016D-1n; Mon, 30 Mar 2020 10:33:01 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=pYPi=5P=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1jIrj0-000168-Pk
 for xen-devel@lists.xenproject.org; Mon, 30 Mar 2020 10:32:58 +0000
X-Inumbo-ID: d23f0af0-7271-11ea-9e09-bc764e2007e4
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d23f0af0-7271-11ea-9e09-bc764e2007e4;
 Mon, 30 Mar 2020 10:32:57 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB309ADDA;
 Mon, 30 Mar 2020 10:32:56 +0000 (UTC)
Message-ID: <6d61bb63ddee0d8dc16029bf3fa545a57e838d84.camel@suse.com>
From: Dario Faggioli <dfaggioli@suse.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Date: Mon, 30 Mar 2020 12:32:55 +0200
In-Reply-To: <3e6adbd8-c255-3455-2089-3233d5069b96@citrix.com>
References: <158524374263.32448.13098482060302794023.stgit@Palanthas>
 <3e6adbd8-c255-3455-2089-3233d5069b96@citrix.com>
Organization: SUSE
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-mBgYRxgTV9zH9x87OrEp"
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
Subject: Re: [Xen-devel] [PATCH] automation: update openSUSE Tumbleweed
 building dependencies
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
Cc: Doug Goldstein <cardoe@cardoe.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--=-mBgYRxgTV9zH9x87OrEp
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2020-03-27 at 13:50 +0000, Andrew Cooper wrote:
> On 26/03/2020 17:29, Dario Faggioli wrote:
> >=20
> > diff --git a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > index 2676a87c85..e80d773a79 100644
> > --- a/automation/build/suse/opensuse-tumbleweed.dockerfile
> > +++ b/automation/build/suse/opensuse-tumbleweed.dockerfile
> > @@ -54,8 +54,8 @@ RUN zypper install -y --no-recommends \
> >          pandoc \
> >          patch \
> >          pkg-config \
> > -        python \
> > -        python-devel \
> > +        python3 \
> > +        python3-devel \
>=20
> These containers get used for older Xen branches as well, so you
> generally can't take deps out like this (Until we stop building the
> oldest branches which need the dependency).
>
Ah, ok, didn't think about that. Makes sense.

> Will tumbleweed cope with both packages installed concurrently?
>=20
It does. I'll test building in a container that has both and (if it
works) submit v2 of this patch.

Thanks and Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)


--=-mBgYRxgTV9zH9x87OrEp
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl6BytcACgkQFkJ4iaW4
c+7UhQ//X6TV2bzSKx1B7BHiHSLamzEMBKY/7o76ZyP+iGacSmBoVEX4TmM7pTsz
1ece7oTiDcanRZteHpM+p8EugwiZZO1ZUokMA6H9fCyJNXkVcN7oU6G6XGnEToDR
jQVaa/WPKnkHRretDufXQJW2umTbHtd5XnJKW6M953OzhShJ6Q53ZnaYxrWoDUH9
R/8imJDOTeLcj1tytWQrn7CBD3pfBhZ2JJb2KFaDsphDoxeirAI1O3yZMYql2zz3
Y+hNr/T/Z4wyulO1mnf8d3qU2sMoOs6Nwrcktyg/1Poa30Hw3jcEEM0bZd3Mncoh
77j5RZ7MMkNcmGNJQxFcloHaJ1LlBeTxgZoTROKMuuEUEVPUn3yS6OTIbEcCJXiJ
IdTdwJuddqmeuQji4POhqyO8Muy+/gCwfV7dxO8yBCAwcfhPbYPPxe21bH552pMb
EQq405S4EUMDvSISMNutn7qm4d/DB+osA3RyL2pX/RYFfmlS1xd6HGhs+Qypb2su
qTJ0ddcB9ZmkVYl2iG/Akrch2FBNc6D2voji1fkikSqJ8b7PruMAA04wBFdMFhCw
h4l/Jh5azrSJ26ggjDbzvq5k0Wo2UOLp2zXQw8uKXlEgJqXJ5ETlskPPDz0j2xYT
hDQz+JGE8+go30+OrgnmbWTKfsHFwDqUmuW3ByUPTqpMcJ13Edg=
=YG8q
-----END PGP SIGNATURE-----

--=-mBgYRxgTV9zH9x87OrEp--


