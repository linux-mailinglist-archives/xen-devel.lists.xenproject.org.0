Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAB92A1352
	for <lists+xen-devel@lfdr.de>; Sat, 31 Oct 2020 04:28:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.16761.41582 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYhYi-00040G-3Q; Sat, 31 Oct 2020 03:28:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 16761.41582; Sat, 31 Oct 2020 03:28:04 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kYhYi-0003zr-04; Sat, 31 Oct 2020 03:28:04 +0000
Received: by outflank-mailman (input) for mailman id 16761;
 Sat, 31 Oct 2020 03:28:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Q0JK=EG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1kYhYg-0003zm-Bv
 for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 03:28:02 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 31a9884b-cd54-4ded-976a-67aa5fe2e73a;
 Sat, 31 Oct 2020 03:28:01 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4531BACDF;
 Sat, 31 Oct 2020 03:28:00 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Q0JK=EG=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
	id 1kYhYg-0003zm-Bv
	for xen-devel@lists.xenproject.org; Sat, 31 Oct 2020 03:28:02 +0000
X-Inumbo-ID: 31a9884b-cd54-4ded-976a-67aa5fe2e73a
Received: from mx2.suse.de (unknown [195.135.220.15])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 31a9884b-cd54-4ded-976a-67aa5fe2e73a;
	Sat, 31 Oct 2020 03:28:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1604114880;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7rwCsRcWUPaeuo0k5aDo+78o6carpCekxQlbYiWQtWA=;
	b=PTh13T4XXvn4gXC/VXfyk8Ce3bPH7I5O2EZeU0L9+5PsA1reui5aHbhWZ0T92R4qS33tjH
	je1wD27H1R216LA800PvKimk7UDbZyxEcZr02Yi3ST8gHEp7JkXMXhiOnms2trZBNZ9TZF
	maMgXb9RzUOHDqpKnfXP/14uBaufrT8=
Received: from relay2.suse.de (unknown [195.135.221.27])
	by mx2.suse.de (Postfix) with ESMTP id 4531BACDF;
	Sat, 31 Oct 2020 03:28:00 +0000 (UTC)
Message-ID: <c17e7a152a7e1922bd9c729f70a96acf4ca5240b.camel@suse.com>
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
From: Dario Faggioli <dfaggioli@suse.com>
To: "marmarek@invisiblethingslab.com" <marmarek@invisiblethingslab.com>
Cc: Juergen Gross <JGross@suse.com>, "frederic.pierret@qubes-os.org"
	 <frederic.pierret@qubes-os.org>, "George.Dunlap@citrix.com"
	 <George.Dunlap@citrix.com>, "xen-devel@lists.xenproject.org"
	 <xen-devel@lists.xenproject.org>, "andrew.cooper3@citrix.com"
	 <andrew.cooper3@citrix.com>
Date: Sat, 31 Oct 2020 04:27:58 +0100
In-Reply-To: <20201031025442.GF1447@mail-itl>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
	 <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
	 <deefd340-ec7a-bbb9-7471-d147da174f4a@suse.com>
	 <a333ea82c12086874f705fc9ea9baa991235edd4.camel@suse.com>
	 <533ce2f2-f268-a70b-fad7-d8f3f4033209@suse.com>
	 <182a90a89cc02beec9760559799e74572e18ce49.camel@suse.com>
	 <9632dc14-46d5-83c0-7e44-0c3bd4f5154a@qubes-os.org>
	 <ce07254a-0775-d35c-559b-7d9ab642accf@qubes-os.org>
	 <b1a18e6ed88db3c40a54c7ca15c3399bdc6f2b9c.camel@suse.com>
	 <20201031025442.GF1447@mail-itl>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-tKjOkQ94W1TVlSAcpjUA"
User-Agent: Evolution 3.38.1 (by Flathub.org) 
MIME-Version: 1.0


--=-tKjOkQ94W1TVlSAcpjUA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2020-10-31 at 03:54 +0100, marmarek@invisiblethingslab.com
wrote:
> On Sat, Oct 31, 2020 at 02:34:32AM +0000, Dario Faggioli wrote:
> (XEN) *** Dumping CPU7 host state: ***
> (XEN) Xen call trace:
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040223625>] R _spin_lock+0x35/0x40
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402233cd>] S on_selected_cpus+0x1d/0xc0
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040284aba>] S vmx_do_resume+0xba/0x1b0
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d0402df160>] S context_switch+0x110/0xa60
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d04024310a>] S core.c#schedule+0x1aa/0x25=
0
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040222d4a>] S softirq.c#__do_softirq+0x5=
a/0xa0
> (XEN)=C2=A0=C2=A0=C2=A0 [<ffff82d040291b6b>] S vmx_asm_do_vmentry+0x2b/0x=
30
>=20
> And so on, for (almost?) all CPUs.
>=20
Yes, you're right.

So, I indeed saw the spin_lock() calls, but I somehow thought I had
seen them in the in the guests' contextes (for which, we probably don't
even print the callstak! :-O). Instead they're there in the host ones.

Sorry for the oversight.

> Note the '*' output is (I think) from a different instances of the
> freeze, so cannot be correlated with other outputs...
>=20
> > Maybe they're stuck in the kernel, not in Xen? Thoughs ?
>=20
> Given the above spin locks, I don't think so. But also, even if they
> are
> stuck in the kernel, it clearly happened after 4.13 -> 4.14
> upgrade...
>=20
Right. So, it seems like a live (I would say) lock. It might happen on
some resource which his shared among domains. And introduced (the
livelock, not the resource or the sharing) in 4.14.

Just giving a quick look, I see that vmx_do_resume() calls
vmx_clear_vmcs() which calls on_selected_cpus() which takes the
call_lock spinlock.

And none of these seems to have received much attention recently.

But this is just a really basic analysis!

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-tKjOkQ94W1TVlSAcpjUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAl+c2b8ACgkQFkJ4iaW4
c+6q5A/8D5ZEfxXTKlS8ZRFVRiFTmyTMgljXxR63FMsSA+RHyXIjbcSxLVfxio7E
xjcVK+57qlbSeQAoFgDdC03dv7P5WUKEpEmzu73AZjNV84U6AfmbwDANmtV0rFx0
DJLgjrQiiXXDQ8L8qeshHuoQPN9r1n83mAO0JSgxDQLtc+sqE10KIr/9pYieWLmg
VU0IkA14yX6DDQUv7Ok0U4P+NUOEpVdIjZCd1HKdXWtolyDeYmcAsKRQMGHpgTAd
xNe0EyAVbQa6/zTeIE+JbMQEWoZkygj1jwgAveByJ/KutFEE3WW9vfKgUyICRE0m
dX54OUQfXiBAkb5A5zmsKBZjNYmseodoY9bj4Rpqwlz14LVFuO+BQsp/Op9dUHmt
dqJIsrOGFIMpr1CT21QizPxi2NKGbqMSBHzrv2aRvgxLGdJdl/PjNrJL547BtDvR
VIQW+vteVQqumBxWo0fKZ95PXlWLiVMSECc1WL05MKxrF+q4wQWz7qvv7JQ2FP6T
tKwLFuCfvHIRnofoO32ProiK0Ybnff7mVd4caco3D9oY7hDTZpjm8bGvD1zsDOcG
SfeSEKh83mAPGUldxkliLE+8F8HsxLhx19tS2q18moqAoMKGANZtN/SklyW7yS3H
fR0gmbAgBSjYgwTIom6h5Cfmx8B/rLVOBZDS5/njrMhIyMlWAOY=
=xoxF
-----END PGP SIGNATURE-----

--=-tKjOkQ94W1TVlSAcpjUA--


