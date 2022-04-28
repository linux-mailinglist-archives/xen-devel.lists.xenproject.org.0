Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A0563513EBF
	for <lists+xen-devel@lfdr.de>; Fri, 29 Apr 2022 00:54:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.316821.535897 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkD1e-0006ww-Al; Thu, 28 Apr 2022 22:54:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 316821.535897; Thu, 28 Apr 2022 22:54:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nkD1e-0006v6-7O; Thu, 28 Apr 2022 22:54:18 +0000
Received: by outflank-mailman (input) for mailman id 316821;
 Thu, 28 Apr 2022 22:54:16 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Zsa2=VG=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nkD1c-0006uh-El
 for xen-devel@lists.xenproject.org; Thu, 28 Apr 2022 22:54:16 +0000
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f6e2f49-c746-11ec-8fc3-03012f2f19d4;
 Fri, 29 Apr 2022 00:54:14 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 181053200990;
 Thu, 28 Apr 2022 18:54:11 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 28 Apr 2022 18:54:11 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 18:54:09 -0400 (EDT)
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
X-Inumbo-ID: 1f6e2f49-c746-11ec-8fc3-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651186450; x=
	1651272850; bh=9l1HAiN7ppV23U31n5tXhB2CzREcaX0xYpVhVkV94Lc=; b=h
	OfJWukQtTrbcnysv8lTje2tKyfYEk1gXTDA/QZnSZPY4yWrV/OnkfwQ2r3zcXys5
	MDzdBmLCCdODBADYA5aS1E0LQwS1d9VtI5fO1fTmtJc0ADbv9mRaA71Js7PPj7zF
	/cQB15LxpdyGrEjQnvl55KAOxXSo0JVNt6Fr1Uh3seuTxT1ztW6zquhoDEjusLkm
	aFSw1ybho0r0/8jjh1qiHxkfmkJVXNwZX/x4Z2LVjpp2NRkoveRVdUryRnbEVYQk
	PHeQzm5osgj4t4hB+VuTx/HsVvQ5uhb5UsIHzCIZ5hexlz69ngBqB35LqCcivm8m
	nEMH7mrjmYr9DpOHItWHw==
X-ME-Sender: <xms:EhtrYobJmNiqPfUVM1ctTfnb-NboFc08d5fS3PH-tEELN6jwhFSbNQ>
    <xme:EhtrYjZOmsFvEoKwzJ2MQyZDli6JPWHyFan-oW7_3Biu-aOx9SX6mYWFPVs-kxcGj
    ibcgr2vsM_8E9A>
X-ME-Received: <xmr:EhtrYi8pIPa7lGTv-uCwyiZiBaSb9yr9qi5Mj8kAn0X2nkPShA8fSJF6-qPW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeffvghmihcu
    ofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgsh
    hlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeetgeekhfetudfhgfetffegfffg
    uddvgffhffeifeeikeektdehgeetheffleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhl
    rggsrdgtohhm
X-ME-Proxy: <xmx:EhtrYiov6a5R1QGNYfX-md8YUUyw8ZeYedGltlI9ULvq0_GJRpMGvA>
    <xmx:EhtrYjqVpBzf8mKfjdikSbziXEg7JUckz4ZnKhDoAd_s_DFY2TXOlA>
    <xmx:EhtrYgRChG6_AQ2ixra5XhVPP0PWoMCtTUJ7uGgUhTDu93e595BkrQ>
    <xmx:EhtrYkCYu2t0ZATakRMQC5crcYgqJlM5nb4LUHsmUob6dHd7Q7_MbQ>
Date: Thu, 28 Apr 2022 18:54:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Message-ID: <YmsbD9ktQqB4U33o@itl-email>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>
 <YmmUtiBkhEYvXHUB@itl-email>
 <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="d8nYrWvw8D75UqvP"
Content-Disposition: inline
In-Reply-To: <901c11d6-92f0-89b9-8500-4947bbdcd504@suse.com>


--d8nYrWvw8D75UqvP
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 28 Apr 2022 18:54:03 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT

On Thu, Apr 28, 2022 at 08:47:49AM +0200, Jan Beulich wrote:
> On 27.04.2022 21:08, Demi Marie Obenour wrote:
> > On Wed, Apr 27, 2022 at 10:56:34AM +0200, Jan Beulich wrote:
> >> On 19.04.2022 17:49, Demi Marie Obenour wrote:
> >>> This hypercall can be used to get the ESRT from the hypervisor.  It
> >>> returning successfully also indicates that Xen has reserved the ESRT =
and
> >>> it can safely be parsed by dom0.
> >>
> >> I'm not convinced of the need, and I view such an addition as inconsis=
tent
> >> with the original intentions. The pointer comes from the config table,
> >> which Dom0 already has access to. All a Dom0 kernel may need to know in
> >> addition is whether the range was properly reserved. This could be ach=
ieved
> >> by splitting the EFI memory map entry in patch 2, instead of only spli=
tting
> >> the E820 derivation, as then XEN_FW_EFI_MEM_INFO can be used to find o=
ut
> >> the range's type. Another way to find out would be for Dom0 to attempt=
 to
> >> map this area as MMIO, after first checking that no part of the range =
is in
> >> its own memory allocation. This 2nd approach may, however, not really =
be
> >> suitable for PVH Dom0, I think.
> >=20
> > On further thought, I think the hypercall approach is actually better
> > than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO to
> > return anything other than the actual firmware-provided memory
> > information, and the current approach seems to require more and more
> > special-casing of the ESRT, not to mention potentially wasting memory
> > and splitting a potentially large memory region into two smaller ones.
> > By copying the entire ESRT into memory owned by Xen, the logic becomes
> > significantly simpler on both the Xen and dom0 sides.
>=20
> I actually did consider the option of making a private copy when you did
> send the initial version of this, but I'm not convinced this simplifies
> things from a kernel perspective: They'd now need to discover the table
> by some entirely different means. In Linux at least such divergence
> "just for Xen" hasn't been liked in the past.
>=20
> There's also the question of how to propagate the information across
> kexec. But I guess that question exists even outside of Xen, with the
> area living in memory which the OS is expected to recycle.

Indeed it does.  A simple rule might be, =E2=80=9COnly trust the ESRT if it=
 is
in memory of type EfiRuntimeServicesData.=E2=80=9D  That is easy to achieve=
 by
monkeypatching the config table as you suggested below.

I *am* worried that the config table might be mapped read-only on some
systems, in which case the overwrite would cause a fatal page fault.  Is
there a way for Xen to check for this?  It could also be undefined
behavior to modify it.

> > Is using ebmalloc() to allocate a copy of the ESRT a reasonable option?
>=20
> I'd suggest to try hard to avoid ebmalloc(). It ought to be possible to
> make the copy before ExitBootServices(), via normal EFI allocation. If
> replacing a pointer in the config table was okay(ish), this could even
> be utilized to overcome the kexec problem.

What type should I use for the allocation?  EfiLoaderData looks like the
most consistent choice, but I am not sure if memory so allocated remains
valid when Xen hands off to the OS, so EfiRuntimeServicesData might be a
better choice.  To avoid memory leaks from repeated kexec(), this could
be made conditional on the ESRT not being in memory of type
EfiRuntimeServicesData to begin with.

--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--d8nYrWvw8D75UqvP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJrGxAACgkQsoi1X/+c
IsE/rxAAnZ5LGXqdmgaE2of9KvKMKieXq3b6bGj8gVNow63OyPhSN5W3KwI+9OoH
Cf+vuW3f88CK18PkIqfjAuhsvdEgj7iXVCv3tvcQSZcjvFj6ALnMMoe7RUMzUhse
8g+F3cZqBVRDNQ3dkQVRIbtQn/LMyv1N1QyahQ4rJJmlQKsMF+az8M2cUSL59rU7
FJntKbYq9edyWNhwcDn2Iw7PZsyMKXiqRt5huXVi7wdJGskFJsRVs5il2JSVzsGA
FvNGZqBBb/o5V3PAz/w2yBJQXodEZdgHORsUbHk9EqzZSpuzT2Lt7T07RVwn5+SW
rx9P4tcgtqUGu63zVvmd+N+JvSTp4BGKbl+3U/0vmZlJyqgFB5qLWHAZVotO5jo9
Wp45glY9WWvvvWOcRd98sk8PeWSU/kPCJpsWoQzHkYk8IBKk7PGYgwdu0wYD09x/
Vl0/S0AULJuYQf/nGTR4s6sa00TeFB0ZNa2jnZasNllXf8utGDu7qGfVh0JhyXln
oecXPMLQHNq/xPOsCr2g6Sm/w01KN6bOp6zLejhH8xUrIhe1bgAk2B/jSw520X2x
pdAO9KE6XqzDI4KSMBwoVpYgsggVWx08JzSo5UBU8Ign8tN/oBipYMxdM22FTqus
tnakVeRYXKL/DoVhU0/cz1JLgmHz0xV1UU/d6nZXs7ntnEsjCuc=
=7V/z
-----END PGP SIGNATURE-----

--d8nYrWvw8D75UqvP--

