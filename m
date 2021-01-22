Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0092FFEEE
	for <lists+xen-devel@lfdr.de>; Fri, 22 Jan 2021 10:05:22 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72584.130728 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sNV-0000s1-7o; Fri, 22 Jan 2021 09:05:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72584.130728; Fri, 22 Jan 2021 09:05:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2sNV-0000rc-4k; Fri, 22 Jan 2021 09:05:13 +0000
Received: by outflank-mailman (input) for mailman id 72584;
 Fri, 22 Jan 2021 09:05:11 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=uWJh=GZ=suse.com=dfaggioli@srs-us1.protection.inumbo.net>)
 id 1l2sNT-0000rX-QX
 for xen-devel@lists.xenproject.org; Fri, 22 Jan 2021 09:05:11 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1dc070e9-7c06-4d6c-b87d-692b4580b6c8;
 Fri, 22 Jan 2021 09:05:11 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4AABBABD6;
 Fri, 22 Jan 2021 09:05:10 +0000 (UTC)
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
X-Inumbo-ID: 1dc070e9-7c06-4d6c-b87d-692b4580b6c8
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1611306310; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J29Tg9opctdrw/vqmniXKYQNAbGCaYFLSx1F5FIfVcU=;
	b=dmfCrbRNGJtuOKKl8po4evqowb/gq+dVJ5br/dhEpQ1jj4RO9y4Pu462b1WnFyzMBg8+7O
	Z1LPHix7Jm3o3TQPtVZoZbAwC5oZX4y7zXbkf5oXtI2/FVTbfxeCVifL4kDs4S8OnwIWtD
	gszDilXXnGXv7xip1OnlcZ4F2+iUZcY=
Message-ID: <08a2dae9e5c0aa92d659fb303ebe89c6cb0e10eb.camel@suse.com>
Subject: Re: Null scheduler and vwfi native problem
From: Dario Faggioli <dfaggioli@suse.com>
To: Anders =?ISO-8859-1?Q?T=F6rnqvist?= <anders.tornqvist@codiax.se>, 
 Julien Grall <julien@xen.org>, xen-devel@lists.xenproject.org, Stefano
 Stabellini <sstabellini@kernel.org>
Date: Fri, 22 Jan 2021 10:05:09 +0100
In-Reply-To: <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
References: <fe3dd9f0-b035-01fe-3e01-ddf065f182ab@codiax.se>
	 <207305e4e2998614767fdcc5ad83ced6de982820.camel@suse.com>
	 <e85548f4-e03b-4717-3495-9ed472ed03c9@xen.org>
	 <e18ba69efd0d12fc489144024305fd3c6102c330.camel@suse.com>
	 <e37fe8a9-c633-3572-e273-2fd03b35b791@codiax.se>
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-Kr64K2RPJOVyL8WPfhFI"
User-Agent: Evolution 3.38.3 (by Flathub.org) 
MIME-Version: 1.0


--=-Kr64K2RPJOVyL8WPfhFI
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2021-01-22 at 09:06 +0100, Anders T=C3=B6rnqvist wrote:
> On 1/22/21 12:35 AM, Dario Faggioli wrote:
>=20
>=20
> - booting with "sched=3Dnull" but not with "vwfi=3Dnative"
> Without "vwfi=3Dnative" it works fine to destroy and to re-create the
> domain.
> Both printouts comes after a destroy:
> (XEN) End of domain_destroy function
> (XEN) End of complete_domain_destroy function
>=20
Ok, thanks for doing these tests.

The fact that not using "vwfi=3Dnative" makes things work, seem to point
in the direction that myself and Julien (and you as well!) were
suspecting. I.e., it is the same issue than the one in the old xen-
devel thread.

I'm still a but puzzled why the debug patch posted back then does not
work for you... but that's not really super important. Let's try to
come up with a new debug patch and, this time, a proper fix. :-)

Regards
--=20
Dario Faggioli, Ph.D
http://about.me/dario.faggioli
Virtualization Software Engineer
SUSE Labs, SUSE https://www.suse.com/
-------------------------------------------------------------------
<<This happens because _I_ choose it to happen!>> (Raistlin Majere)

--=-Kr64K2RPJOVyL8WPfhFI
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEES5ssOj3Vhr0WPnOLFkJ4iaW4c+4FAmAKlUUACgkQFkJ4iaW4
c+5hDhAArqfRG/uz0kmAlDYKdDm27guk3MZRCTNak/fk577SnOoHvP6r+n2tmoTD
KWnf3gE67jMx6LzNLHRa15hPWjWkAGKiFGIBk7bqiRAQ9OsZDdg4ntZp9uD6kPLp
TcBCCuJ6eaXd/jVkXypO9YN1KuURjK/3Rf/X1668HEZY1oqnsImqJqNZrwL7iuon
4OcRQHVybaN4xFqbtXuMoFjoc78h0Xh4URpikigyYWETapvn6DCnGxDz/z9SHwDB
6hu1ZNXgmEnxldrjmkyrR1qbrYen614KbuvG1kSqzu0KfudiAyr2ffPeGGGD5B10
W/ReXH88xIVzfzJ0+8ftmX1E+fBbXpmZaJe8eHEZY9V9JwTFg3j8yaPl5IY6jKHl
Km9PZi+8rE0SUO/eMq87BeB6+Okmvr1Lnx7EWxW08cImQEgRL1TuP4Bw9OAbPpsA
nqt++RBBxXDwYuPGUBClOcBT/IyKeIT8LanISiY6iYmGo5h6Yyst4educ98iwyjh
01wq+P/ySJmTUo3lcknzF/cPs/wgWh8LQG07ZmwOBKp6BQr9GioEkJGBX3iqRnog
iIsF7I4a4+r9uVPUe5ncVT53QhOtRmKhUh+XvXicDloSJgmpjrjh2vyFkd68W4qO
uKYTHq/sfBYkG18xDe7fyuJTEO+wFGIXZ0x+SauY/SOoV1ffFRI=
=YUBE
-----END PGP SIGNATURE-----

--=-Kr64K2RPJOVyL8WPfhFI--


