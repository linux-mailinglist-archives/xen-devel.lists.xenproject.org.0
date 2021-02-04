Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB4530FB27
	for <lists+xen-devel@lfdr.de>; Thu,  4 Feb 2021 19:22:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.81399.150410 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7jGi-0001ds-IP; Thu, 04 Feb 2021 18:22:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 81399.150410; Thu, 04 Feb 2021 18:22:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l7jGi-0001dT-Ew; Thu, 04 Feb 2021 18:22:16 +0000
Received: by outflank-mailman (input) for mailman id 81399;
 Thu, 04 Feb 2021 18:22:14 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=YSLV=HG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l7jGg-0001dO-Fz
 for xen-devel@lists.xenproject.org; Thu, 04 Feb 2021 18:22:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 3d617343-9321-4ca4-bf83-8d19b4f65e38;
 Thu, 04 Feb 2021 18:22:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 3C3A8AE95;
 Thu,  4 Feb 2021 18:22:12 +0000 (UTC)
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
X-Inumbo-ID: 3d617343-9321-4ca4-bf83-8d19b4f65e38
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1612462932; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mySUJzLqMMp5dhbVZgKoKySONi5gQVEHn+PHotScFBY=;
	b=J+8f0n1N4zmA8i9J2BVgIpZ3TERksCAZCcUonXsaDOSPbA9BT/jI8R011O9+/py8dhW3UC
	68aI3RMKL0FYwJKS9q1W884OPw2yY6rDPkPUkqBloaxcObgwzi72eKRf7jmK9CRCmtjZwQ
	fHvNAC2MIB3fNaYCC6oSDsZBTRvh2n4=
Message-ID: <c3f4d5f15a6be36388e10bbf1e0e38b247f190aa.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 - call for notification/status of
 significant bugs
From: Dario Faggioli <dfaggioli@suse.com>
To: Tamas K Lengyel <tamas.k.lengyel@gmail.com>
Cc: Ian Jackson <iwj@xenproject.org>, Committers
 <committers@xenproject.org>,  Xen-devel <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Julien Grall <julien@xen.org>,  community.manager@xenproject.org
Date: Thu, 04 Feb 2021 19:22:10 +0100
In-Reply-To: <CABfawhkT5JBsT2-reSLB-bNFhP1em5U3vBs+z_FM6_Kcd7TSiQ@mail.gmail.com>
References: <24600.8030.769396.165224@mariner.uk.xensource.com>
	 <24603.58528.901884.980466@mariner.uk.xensource.com>
	 <6d0d7181bad79259aff28351621d2ac1eeaca113.camel@suse.com>
	 <CABfawhkT5JBsT2-reSLB-bNFhP1em5U3vBs+z_FM6_Kcd7TSiQ@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-lW61QBr3CT5ho3U8Z+Tw"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-lW61QBr3CT5ho3U8Z+Tw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2021-02-04 at 10:00 -0500, Tamas K Lengyel wrote:
> On Thu, Feb 4, 2021 at 9:21 AM Dario Faggioli <dfaggioli@suse.com>
> wrote:
> >=20
> > On Thu, 2021-02-04 at 12:12 +0000, Ian Jackson wrote:
> > > B. "scheduler broken" bugs.
> >=20
> > - Null scheduler and vwfi native problem
> >   =20
> > https://lists.xenproject.org/archives/html/xen-devel/2021-01/msg01634.h=
tml
> >=20
> > =C2=A0 RCU issues, but manifests due to scheduler behavior (especially
> > =C2=A0 NULL scheduler, especially on ARM).
> > =C2=A0 I'm actively working on it.
> >=20
> > =C2=A0 Patches that should solve the issue for ARM posted already. They
> > =C2=A0 will need to be slightly adjusted to cover x86 as well. Waiting =
a
> > =C2=A0 couple days more for a confirmation from the reporter that the
> > =C2=A0 patches do help, at least on ARM.
> >=20
>=20
> I've run into null-scheduler causing CPU lockups as well on x86.
> Required physical machine reboot. Seems to be triggered with domain
> destruction when destroying fork vms. Happens only intermittently.
>=20
Yes, we know that it's generic and not ARM-only. It's just that on ARM
is easier (or I should say deterministic) to trigger it.

Thanks for reporting, though.

I'll add you in Cc when I send the updated version of the patches that
covers x86 as well, in case you want to test. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-lW61QBr3CT5ho3U8Z+Tw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAcO1IACgkQFkJ4iaW4
c+7pFA/+PHla4bOzIEJy6rSwvLpSNEWzxN1RoIjMLiQgsOK6iFXe3FN2dDXAKNtE
vNxT1jYtqxGdAR+FasSDLa3qmiLMDIaa4fb6ivk03AJ9Q6YlRd6PHdWqh0b816C8
iP/yMuXCYBIiAcKZURUpJgaBjLhF/3E51no8NV1NtMSa0ZhkyMsOKRy/tfHqTFdx
XHaw9zNzpDSDlxzY3VhLI+H6315oUEAIesNI0qC+hed53bjuQy80d44tD9ER+r3q
kaaMSNzLakE+XnpEh0AT1B/7dd/QeskAGpwqeK3ESeU0UMg5wHyoZSwAC+gO9cp0
JLEYGqx7frH93zC/OS3cVdjTs7/wtkvQJRybzrPVnCSWPCoW/5uBsxbDuiybjlQS
3xyazNnA4Hr/nZgkSTc36UktigsJz+CpovYWcGA1mFwVp6RpVl/NMyOkBCZViG2l
Adv6dOyyBzMbBiuZBosBnQ0EnTZutSRYiEUjsWq7nIy2rLY9nXD0hNaJ7A+/1v6d
V12mkxj2nNfWoFWRKa8UTFXevqp9GAPpcziGzmRSbHvGqNxbww6fjXkdlVRHUgsZ
l/5q0fGwexiSZeBJX8vP3tXQ2jh7Z2vddVnSYY1weAmJ1JF497URzY+cHB77bIve
SVzezk+OnKiyWglaCRxxjzNs+4ZAyXz14mWWgwqN7rVTOZCCnaM=
=V/Wy
-----END PGP SIGNATURE-----

--=-lW61QBr3CT5ho3U8Z+Tw--


