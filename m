Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60CE13EEB6A
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:14:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167751.306241 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFx2z-0004ao-Vq; Tue, 17 Aug 2021 11:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167751.306241; Tue, 17 Aug 2021 11:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFx2z-0004Y1-SB; Tue, 17 Aug 2021 11:14:21 +0000
Received: by outflank-mailman (input) for mailman id 167751;
 Tue, 17 Aug 2021 11:14:20 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFx2y-0004Xv-9Q
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:14:20 +0000
Received: from wout3-smtp.messagingengine.com (unknown [64.147.123.19])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 43cb693a-ff4c-11eb-a4a1-12813bfff9fa;
 Tue, 17 Aug 2021 11:14:18 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 86AC43200A24;
 Tue, 17 Aug 2021 07:14:17 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Tue, 17 Aug 2021 07:14:17 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 07:14:15 -0400 (EDT)
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
X-Inumbo-ID: 43cb693a-ff4c-11eb-a4a1-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=Fh9jI5
	kNCYiP/4kuz+MIdunlEx8uZjKvXfnRxZ3uVK4=; b=Ctbw7Lw5p2k/CGFI+XJtIl
	7TqtPE+x7EF667uc4UU3/NCkVP8F7Vq646TP2y+pWw/5k+s3rsN3GordBEQ7bj9u
	TF9lxnyd0FHyuc+4xUTZAp4RTIubfGW6dMuYwkygV+FXCalWf7LVTvY90r/tl0jk
	mdKQkiHA5nOF6mwMgxWoblk50jK3Rk311Ir3xwhiKAKzQ8bPiWja4PEXk66Owv1d
	sldOTfm84BK3IzJobXUdvg/JKQGZqQZWS/Ot9QHoSodwl5ypAzOne1kyMpjtF6LI
	72ijemKYWYFEAqfaoDpnjfTh6Y6oHx2bKMpFBAzatt4xiA8IdRcRtu08cA+EFMPA
	==
X-ME-Sender: <xms:CJobYfiGaX-h3dpPMIZN7QLyHi66XD7BW-xxWYCXxvO-9fYwcP17yA>
    <xme:CJobYcBjx9NqKPWozKC8e4-hBkrqn7iAzaeYsmYIDIoT2JxnOceFBIMr1rzyXiNG1
    uv_nyB5XpkW1w>
X-ME-Received: <xmr:CJobYfFQ5LtBjxB8p5shYbU3TQ9WYoUwQIcfUw1dSWyf3h4qnmcvhxY9baeus9q_5vilFM9-lGf_RpvUZe8BnBeIvWlIvRG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdeflecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:CJobYcRo_gHpzkZT2Map41e5ZuYCeGSibT7hVwOhoECPzwQhoegsJQ>
    <xmx:CJobYcx3ZjTvNguBt3gd7dmH3wltbqfJRen-fOI2yK7vmXUe36j-vA>
    <xmx:CJobYS7mODh5r71DVspCpmXdcYyimmh7kwF_BGHvfSaNdDMuOn2GOA>
    <xmx:CZobYX8y5CZjnjkMaKRVkJw_a8_8C6HZMrtMizclPH9FLjf7d-z_Ew>
Date: Tue, 17 Aug 2021 13:14:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Fix build on newer versions of GCC
Message-ID: <YRuaBIc+bfErQnDy@mail-itl>
References: <20210817105656.19683-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FSGOdMofWGZPD2al"
Content-Disposition: inline
In-Reply-To: <20210817105656.19683-1-andrew.cooper3@citrix.com>


--FSGOdMofWGZPD2al
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 13:14:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Fix build on newer versions of GCC

On Tue, Aug 17, 2021 at 11:56:56AM +0100, Andrew Cooper wrote:
> Some versions of GCC complain with:
>=20
>   traps.c:405:22: error: 'get_shstk_bottom' defined but not used [-Werror=
=3Dunused-function]
>    static unsigned long get_shstk_bottom(unsigned long sp)
>                         ^~~~~~~~~~~~~~~~
>   cc1: all warnings being treated as errors
>=20
> Change #ifdef to if ( IS_ENABLED(...) ) to make the sole user of
> get_shstk_bottom() visible to the compiler.
>=20
> Fixes: 35727551c070 ("x86/cet: Fix shskt manipulation error with BUGFRAME=
_{warn,run_fn}")
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> CC: Wei Liu <wl@xen.org>
> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
>=20
> Not actually tested.  I don't seem to have a new enough GCC to hand.

I have just compile-tested it and it seems to fix the issue (indeed it
failed before with CONFIG_XEN_SHSTK disabled).

> Most of the delta here is indentation.  This diff is more easily reviewed=
 with
> `git show --ignore-all-space`

Wouldn't this make the compiler include the code even if
CONFIG_XEN_SHSTK is disabled (not a huge issue...)? Or is it smart
enough to optimize it out in that case?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--FSGOdMofWGZPD2al
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEbmgQACgkQ24/THMrX
1yxtjAf/UhYui49/iwiv8mpeP4KZgtwdRnjUE9Y3Wp0mjulgYn2JnqhgA6E1UhOF
ciV9QCKS5GzYEYpiijO9TZzwpJCYhrpbC0/4KnMQLLLl84PxNlivGzHUdWI19DbU
s9/eHONXbJTqPMKDx8miQ6wUy9Wj/80CqNGP1LlPhniQspzIpBXuuhV5/5HOourN
ln+Kz4Tq2yjoLa2gz3p7QUE3lh44tMj2SK7/f2jnN9Z6+sLviR9r4xcd3SjTRfx9
lwrZzDShZ2B+yFJK+moIRDgiYH/Lm+tbx0nyf11aZRRCqTbiIykwa59eVEcTEK7D
QfWfxgpFVpPtDhdPJ/Gw2Ohr3GUi9w==
=F4Kn
-----END PGP SIGNATURE-----

--FSGOdMofWGZPD2al--

