Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CDA30818E
	for <lists+xen-devel@lfdr.de>; Thu, 28 Jan 2021 23:56:28 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.77489.140361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5GCj-0004VJ-KP; Thu, 28 Jan 2021 22:55:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 77489.140361; Thu, 28 Jan 2021 22:55:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l5GCj-0004Uu-H5; Thu, 28 Jan 2021 22:55:57 +0000
Received: by outflank-mailman (input) for mailman id 77489;
 Thu, 28 Jan 2021 22:55:56 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ue11=G7=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l5GCi-0004Up-83
 for xen-devel@lists.xenproject.org; Thu, 28 Jan 2021 22:55:56 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 404bab29-d9f8-4ad0-bb1f-7eadbfd1199d;
 Thu, 28 Jan 2021 22:55:54 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 1E314AC60;
 Thu, 28 Jan 2021 22:55:54 +0000 (UTC)
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
X-Inumbo-ID: 404bab29-d9f8-4ad0-bb1f-7eadbfd1199d
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611874554; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=k0f8Wp0+uXKvQs+GP87iM2ln1QnlEbp/tZnieWpA6V4=;
	b=DXzuXvPPIpqIfAiyzBcBbOSm8nDTtEE9JjB1+Sp5YQdtUz8PsvqIoDIvyPCIBA2cY6XDVW
	FsOtQ0kxvanFcsTVLmSDLb1kS+TFKNlMaOpAN6POBkMFsf4fngLxAhc9OBFZatbYeNTy4x
	xOGqkdcTj7aKaRAS0uye5y46vpm+2p0=
Message-ID: <0605f27e9e2215f5b71690dcc60d481dd630b35f.camel@suse.com>
Subject: Re: [ANNOUNCE] Xen 4.15 release schedule and feature tracking
From: Dario Faggioli <dfaggioli@suse.com>
To: "Lengyel, Tamas" <tamas.lengyel@intel.com>, "Cooper, Andrew"
	 <andrew.cooper3@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
	"xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>, "committers@xenproject.org"
	 <committers@xenproject.org>, Tamas K Lengyel <tamas@tklengyel.com>, 
	=?UTF-8?Q?Micha=C5=82_Leszczy=C5=84ski?=
	 <michal.leszczynski@cert.pl>
Date: Thu, 28 Jan 2021 23:55:52 +0100
In-Reply-To: <CY4PR11MB0056C25748617098F9B9D15DFBA70@CY4PR11MB0056.namprd11.prod.outlook.com>
References: <24567.7198.846779.557032@mariner.uk.xensource.com>
	 <24576.27654.137226.608671@mariner.uk.xensource.com>
	 <017cd214-fce8-f8b7-7134-0a89eb45c2ac@citrix.com>
	 <CY4PR11MB0056C25748617098F9B9D15DFBA70@CY4PR11MB0056.namprd11.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-hlYbpTe4hl9fEhjoOSGw"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-hlYbpTe4hl9fEhjoOSGw
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-15 at 15:14 +0000, Lengyel, Tamas wrote:
>=20
> > 2) "scheduler broken" bugs.=C2=A0 We've had 4 or 5 reports of Xen not
> > working,
> > and very little investigation on whats going on.=C2=A0 Suspicion is tha=
t
> > there
> > might be two bugs, one with smt=3D0 on recent AMD hardware, and one
> > more general "some workloads cause negative credit" and might or
> > might
> > not be specific to credit2 (debugging feedback differs - also might
> > be 3
> > underlying issue).
>=20
> We've also ran into intermittent Xen lockups requiring power-cycling
> servers. We switched back to credit1 and had no issues since.=C2=A0
>
Ah, that's interesting... Among the issues that I listed in my other
email, when trying to do a quick summary, "only" number 1 is about
Credit working when Credit2 does not. This one you're mentioning here
may be the second... or it may be the same! :-O

As said there, my theory so far is that there's a bug somewhere, not
necessarily in scheduling code, to which the two algorithms react
differently. Of course this is a theory, and I've not been able to
confirm it yet (otherwise I also would have fixed the problem. :-P).

But really, it would be interesting to double check if at least the
symptoms are the same than the ones of the issue reported here.

> Hard to tell if it was related to the scheduler or the pile of other
> experimental stuff we are running with but right now we have stable
> systems across the board with credit1.
>=20
Well, sure, that's understandable. :-) Which is why it's tricky at
times to debug these issue. In fact, I cannot reproduce them myself,
and users, rightfully, move on if they found a workaround.

Anyway, if at some point you decide to investigate, I'll be happy to
help.

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-hlYbpTe4hl9fEhjoOSGw
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmATQPgACgkQFkJ4iaW4
c+60bhAAnIT3DkkqxjCJ+sWv0Ehxm1WYfwkes9cweV6AogNLGOaS82nyF6KEUJXz
sbJ2DpQbvJOdtHG19uFjmpJL6/MzEir8C5TJLNHdlfbHiwDbUd+YwBBlyen+F9VW
Ol195A0TlzbXCN7BtweeDvy8xHuYT1ZkjCHMQ9mkr6hH2tjbgOxI8Q3uLTpJbR45
CJdIYPN7Xphe4uJMLvckCQTF4F4meyAtf19eB+jIBARtjfVUCavkUAMUjzWQ4k61
uHB0Fqm0dUOI3UoQZEkOz+NlgFaQ7LNxgSqcCXNiF8fK22VL7mAoMgptUM/C4ANw
NzOmWCd44gQEX5ZyAtDKpACapA2Lfv3o+tOnZrPLKtcGCDlineSk38sZRiASmRHb
ToBoVyUYGlW2U0Cdt91aM7ZghQ6P6TVDON0ldeEGRzcIVAla71qVIrr+imz9St2i
W7CZMHGom/rJ7WBmbtIhkOQN2749k8mUiqGKeL44+ByY9ahGPiXNJAm+TlSFDVyX
fuZiq2t2bGHqnjrY022IYWzBP2nxVJOotv3QgaVK/LucmRghMPe+Q0ILWDypePHV
YGCQPCCk4DaDjlxVzA5xipbF1QqjzAA7ht3nu1hBOl13NFygDK3XY5fBwlsUG0c/
99Fpb5gsdNqt/LnVhNJ1LvNYXAiONeHLfuUanTHCHNUvPUS5sMU=
=pX7N
-----END PGP SIGNATURE-----

--=-hlYbpTe4hl9fEhjoOSGw--


