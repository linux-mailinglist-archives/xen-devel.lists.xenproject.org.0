Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 72C014EEE6D
	for <lists+xen-devel@lfdr.de>; Fri,  1 Apr 2022 15:46:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.297400.506600 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHbo-0003gp-MN; Fri, 01 Apr 2022 13:46:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 297400.506600; Fri, 01 Apr 2022 13:46:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1naHbo-0003e2-Ir; Fri, 01 Apr 2022 13:46:36 +0000
Received: by outflank-mailman (input) for mailman id 297400;
 Fri, 01 Apr 2022 13:46:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tlS5=UL=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1naHbn-0003dw-Nl
 for xen-devel@lists.xenproject.org; Fri, 01 Apr 2022 13:46:35 +0000
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 24070bb6-b1c2-11ec-8fbc-03012f2f19d4;
 Fri, 01 Apr 2022 15:46:34 +0200 (CEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 31E6532007F9;
 Fri,  1 Apr 2022 09:46:31 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Fri, 01 Apr 2022 09:46:32 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 1 Apr 2022 09:46:29 -0400 (EDT)
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
X-Inumbo-ID: 24070bb6-b1c2-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=hVyQEouGgaEt0F6DZ
	8ddM5JOZIXmifcHPNnQCe+kV+o=; b=k09j2MDQ6Won+fqlJJSeuNSgVJMKFU+xk
	oDqAyP9dMTARdNppZUVJFbwGI0Ny0bxSVrJH5TUxtAgaKPsJlnVd5nrWNJ0Tlb7O
	XJgHQQcS+QOolORNhDRKyLKdA/6YtvnzFfhyJ0MLUezpDnjKCmQV9XeINl322Gkf
	vNtLR7P4f0+Yy+P+itBSapdvptVzW+zme2hSdHhFulj3l6RZHT03U9ZScS64y0uN
	0TCYLzTEqgE+Z5yzdkdEo9HpU2EEYJnRPQIhZ/fRiqQ6IHYFSH25y5c6QV/046pZ
	EA7Kp3rBSXA8UPBGa/KaKzKk/W94HA/6M5zzysoBIRmXlK5GRN11g==
X-ME-Sender: <xms:NgJHYpCaa6WRZRXYcek6XIMKRZt3x1ixs9YAzheplHZAbga5HAf3lw>
    <xme:NgJHYnhLZMCitwLRmbkGQWt7gVAJSaRYcCoZSFzadOq1izOFys6SVp9DKu0WmxnCb
    PvCrk3Nho4bFg>
X-ME-Received: <xmr:NgJHYklKgqD-JollNRuVgR-3tYdLxCK2V4sV_6GT_OeZb79OQQ3NT4KKlBkuY6Ah9StvX6Z8A8xfQNaCV7vZx7M0i5ZOvXi9SQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeiiedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:NgJHYjyjZnTQo0voglcViDWLnpOcUspz931tyfV0d8hgWMeBpssXJA>
    <xmx:NgJHYuQs74UenpMUhAvF1vVhb5dbXK0DTGtD71EMxmTTE7aDpkr_PQ>
    <xmx:NgJHYmaRQYT5mIwmBriXWKe2on0d-ohTERoQZ-tiM9i8uVZD0wEbyg>
    <xmx:NgJHYkP3RaVCf_W3_0znTHgCJP210tcaMWdqyvptalcFxYyjAhrNSQ>
Date: Fri, 1 Apr 2022 15:46:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.14.5 ?
Message-ID: <YkcCMg8+dDjxBvJW@mail-itl>
References: <466e1d4b-a4b6-0797-ca1b-1ea59a3993ba@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1IRnIitUKwGMlx3k"
Content-Disposition: inline
In-Reply-To: <466e1d4b-a4b6-0797-ca1b-1ea59a3993ba@suse.com>


--1IRnIitUKwGMlx3k
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 1 Apr 2022 15:46:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	George Dunlap <george.dunlap@citrix.com>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Julien Grall <julien@xen.org>
Subject: Re: preparations for 4.14.5 ?

On Wed, Mar 30, 2022 at 12:16:00PM +0200, Jan Beulich wrote:
> All,
>=20
> while 4.14's general support period ended in January, we're considering
> to cut an out-of-band release due to the relatively large number of
> security relevant backports which has accumulated in just 2 months. By
> doing this we would _not_ be promising to do so again in the future.
> Please voice objections to the plan (or support for it) in the next
> couple of days.
>=20
> Since it's a little easier to "batch" releases, I would intend to keep
> 4.14.5 aligned with 4.16.1.
>=20
> Commits I have queued but not committed to the branch yet (and I won't
> until in a couple of days time, to allow for objections to the plan to
> be raised):
>=20
> dd6c062a7a4a tools/libxl: Correctly align the ACPI tables
> aa390d513a67 build: fix exported variable name CFLAGS_stack_boundary
> e62cc29f9b6c tools/libs: Fix build dependencies
> eddf13b5e940 x86emul: fix VPBLENDMW with mask and memory operand
> 6bd1b4d35c05 x86/console: process softirqs between warning prints
> 07449ecfa425 tools/libxl: don't allow IOMMU usage with PoD
> 10454f381f91 xz: avoid overlapping memcpy() with invalid input with in-pl=
ace decompression
> 0a21660515c2 xz: validate the value before assigning it to an enum variab=
le
> b4f211606011 vpci/msix: fix PBA accesses
>=20
> Please point out backports you find missing from both the respective
> staging branch and the list above, but which you consider relevant.

I'm not sure if "just" bugfix qualify for 4.14 at this point, but if so,
I'd propose:
0a20a53df158 tools/libs/light: set video_mem for PVH guests

In any case, the above should be backported to 4.15 and 4.16.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--1IRnIitUKwGMlx3k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJHAjIACgkQ24/THMrX
1yxrnwf+KhnFwQhyepbZzudjQ2PSmKP1K/Itp18wcMgYPy1kkRLAqwpe1YhlT88k
wdaOt2IeiUnyAvyl3aFU2rbwUCW4L3WchBGfiIVam642UWSWlKzTXjMLaU2mZ4xL
eRsNV/ct9XbuHs9GugueXHl0AObM2OxhLlwgiN05lNlS4KVPKFyz6HBaQSweZuT9
VzLpJgHFAzvLlJF5zhNG1etMreFFY5cFg6Qx6u+8p1ALuU49TC2YTZsVTwhr+CY4
mR+y0gUmeR9K65vFeVXABirqF86W05J7MnNMr9YXecog7Y2bVJ3Bf1D/ZLKG0kv/
OI2Yruf0Rw6F0joVEtgDO+uiaS10Jw==
=vUWc
-----END PGP SIGNATURE-----

--1IRnIitUKwGMlx3k--

