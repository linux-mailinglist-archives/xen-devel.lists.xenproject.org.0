Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D65132FF8FF
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 00:36:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72490.130555 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2jU6-0002Zm-Vt; Thu, 21 Jan 2021 23:35:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72490.130555; Thu, 21 Jan 2021 23:35:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2jU6-0002ZN-SY; Thu, 21 Jan 2021 23:35:26 +0000
Received: by outflank-mailman (input) for mailman id 72490;
 Thu, 21 Jan 2021 23:35:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hfWZ=GY=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l2jU5-0002ZI-LS
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 23:35:25 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 085ece7b-c484-4766-b0c8-6a658a439e97;
 Thu, 21 Jan 2021 23:35:24 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 86EE2AC95;
 Thu, 21 Jan 2021 23:35:23 +0000 (UTC)
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
X-Inumbo-ID: 085ece7b-c484-4766-b0c8-6a658a439e97
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611272123; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KfjcpEPQh2gL6oEMnT+zF2CkrJqn0bsGUA4cxcsDPoM=;
	b=FFGgLJRhTwe5Ey1RHe3kAM9DwbzRk6aBuF8lFyTLTJ013dIa9RyGFytqUS2a2WhK+1e0/l
	AMsK1KP2J+oEvg30xuo/SrcwMo8S4051uzo6Keeme41GqmFvr94kp/nJ2G5NCtWQlALSkj
	jFPXLh787XW8TULodrZeukVc76Of0Xo=
Message-ID: <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Julien Grall <julien@xen.org>, Anders =?ISO-8859-1?Q?T=F6rnqvist?=
	 <anders.tornqvist@codiax.se>, xen-devel@lists.xenproject.org, Stefano
	Stabellini <sstabellini@kernel.org>
Date: Fri, 22 Jan 2021 00:35:22 +0100
In-Reply-To: <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-0grzHQMUTvST//M2BxG8"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-0grzHQMUTvST//M2BxG8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-01-21 at 19:40 +0000, Julien Grall wrote:
> Hi Dario,
>=20
Hi!

> On 21/01/2021 18:32, Dario Faggioli wrote:
> > On Thu, 2021-01-21 at 11:54 +0100, Anders T=C3=B6rnqvist wrote:
> > > =C2=A0=20
> > > https://lists.xenproject.org/archives/html/xen-devel/2018-09/msg01213=
.html
> > > .
> > >=20
> > Right. Back then, PCI passthrough was involved, if I remember
> > correctly. Is it the case for you as well?
>=20
> PCI passthrough is not yet supported on Arm :). However, the bug was=20
> reported with platform device passthrough.
>=20
Yeah, well... That! Which indeed is not PCI. Sorry for the terminology
mismatch. :-)

> > Well, I'll think about it. >
> > > Starting the system without "sched=3Dnull vwfi=3Dnative" does not
> > > result
> > > in
> > > the problem.
> > >=20
> > Ok, how about, if you're up for some more testing:
> >=20
> > =C2=A0 - booting with "sched=3Dnull" but not with "vwfi=3Dnative"
> > =C2=A0 - booting with "sched=3Dnull vwfi=3Dnative" but not doing the IR=
Q
> > =C2=A0=C2=A0=C2=A0 passthrough that you mentioned above
> >=20
> > ?
>=20
> I think we can skip the testing as the bug was fully diagnostics back
> then. Unfortunately, I don't think a patch was ever posted.
>
True. But an hackish debug patch was provided and, back then, it
worked.

OTOH, Anders seems to be reporting that such a patch did not work here.
I also continue to think that we're facing the same or a very similar
problem... But I'm curious why applying the patch did not help this
time. And that's why I asked for more testing.

Anyway, it's true that we left the issue pending, so something like
this:

> =C2=A0From Xen PoV, any pCPU executing guest context can be considered=
=20
> quiescent. So one way to solve the problem would be to mark the pCPU=20
> when entering to the guest.
>=20
Should be done anyway.

We'll then see if it actually solves this problem too, or if this is
really something else.

Thanks for the summary, BTW. :-)

I'll try to work on a patch.

Regards

> [1]=20
>    =20
> https://lore.kernel.org/xen-devel/acbeae1c-fda1-a079-322a-786d7528ecfc@ar=
m.com/
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-0grzHQMUTvST//M2BxG8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAKD7oACgkQFkJ4iaW4
c+4WYRAAxIvxdrcmphAFH3mb8G4SJ4idDZmoU5QX4EcJHY/e5UARwMDaoMPl6jjJ
1dbSXFyvXcG0tMG9Hu7BqlLyylbiwVZqfkmRVr0zK0vmmXlElHRDkDN8oOblW40t
3cN0G8GaLmIqPQwNghvxuqPGNuCCLzvESC8h60EMMmdQ3MTUW1as1mI1PqE2DZhb
DHlasuUYa51t2gfkS8qWo/QUoPdG1JTj5deKIoKjOhaWBAo2vS/T43NpVuFyTpU1
VAOYB7yhUdePkGlnRpriyJskOOj31SD973BBNFx3/8xbI1Ox+6fLLfEVLrBfRR9y
hnnYzPJxzxY1lQ6gNonGx1IBZ6Jm614c/Q/6LXaLvfT8CP7nSi9sjtmonHGEq/Hl
gFMAUWAgOct/tmKqxzHuJ/ir4NIKxJZAx7p52wnIovXScFIDD4QYupuUulieXY2l
rhzafeUqHMCHKG8jMQMk9KKB3tBwnNOxDIy70Cp9jqBLycOZ5PA6k0eKimNtcZGj
sIxbDsyJNaPUzM3eHqEfnrfu8d4aAZMGL/aDm7Jth7qiCp2IOslJmT56ULTjodqZ
7qadBu0s+Vtqre5+gIewf/q3v/1447vTOrAOFIeWjuO/JmQG7XoGdYuL6Dc6lqs8
lvZ772hcRUVHQvrMZzaA26ttNxXWNj7pfrm4/ASDLs+zqTwsEsA=
=LT9U
-----END PGP SIGNATURE-----

--=-0grzHQMUTvST//M2BxG8--


