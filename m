Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EF733EEBDF
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 13:46:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167776.306295 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxYB-0001ot-K5; Tue, 17 Aug 2021 11:46:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167776.306295; Tue, 17 Aug 2021 11:46:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFxYB-0001mQ-Gr; Tue, 17 Aug 2021 11:46:35 +0000
Received: by outflank-mailman (input) for mailman id 167776;
 Tue, 17 Aug 2021 11:46:33 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFxY9-0001mJ-Rf
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 11:46:33 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c4972f8c-ff50-11eb-a4a7-12813bfff9fa;
 Tue, 17 Aug 2021 11:46:33 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 93A373200A68;
 Tue, 17 Aug 2021 07:46:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Aug 2021 07:46:31 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 07:46:29 -0400 (EDT)
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
X-Inumbo-ID: c4972f8c-ff50-11eb-a4a7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=NZuPud
	xD2yyXFz7NgCfQautxcFxtYepDL1l20Y1po+U=; b=PHFkDqiajhzfz20ANUa8lf
	CR8GT17u0cTUnzrZ5tFUDe5wT1Dz5d26KZnWDeyLO1mGnDkAccf+Ub+ZpH+dMeag
	fW6UkIK9qt7m8+oNrKcUjAK7TxZsg4PaCRRme4zRNCQ5+/1fmJT5VKiE+JRm0Uqr
	UEUsJDU6NL6yU1DomePij8yM6hlPjyCoiRIgexyt9fdwTd8ptX2h41ofNDQTrXMJ
	HuoI5Tq2VxW4wtCCSjbUy3TZoaG+yTQjPACKDU0DaNdj7IIIpquPVnsHUhUBCBVB
	Og5VDHBQwWoREsr0QUX5E2LnybcHJPEle8huHAQTeMDeW2R3BbBddpMR9rh/jghA
	==
X-ME-Sender: <xms:lqEbYfmNDdJjzw4OMBHehbtUhc2INw6pY50qV7nJs9HZ-eZ0uEt5rw>
    <xme:lqEbYS1F1bTXgKC4XAzTgA4QH12PvevQy6rfTpan6UYGMTqcEX2UPDpt6bBX2MZk1
    yyk4uUKVcxnAQ>
X-ME-Received: <xmr:lqEbYVo60V28pcd6jVkqo1OSIPBpRbunLy37UXeazo4xWgpGRjHhdG7ysSV1F9_qbFPBx-CwFtJw7ZOMuksl4KHFGf1883oW>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdeghecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:lqEbYXkgXgiGPxAnM_zS3RY_BY4CliyK4ihNEmAgIsbPdHMby474aw>
    <xmx:lqEbYd1NEDsiJu3kO5kfldLivbl2WB-JVnb1OI-gC27sYRXPCaz21A>
    <xmx:lqEbYWtRiLr6WOgqpvLt0zKy7NZWjPrbso1M2dGGMzdHq-o_4gq4gQ>
    <xmx:l6EbYbBZMv6Fp5zfqQPHO0fCwhk7pNO4_ueJsByHdlgsl6nJ6quoRA>
Date: Tue, 17 Aug 2021 13:46:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Fix build on newer versions of GCC
Message-ID: <YRuhkuvuknY7SMR9@mail-itl>
References: <20210817105656.19683-1-andrew.cooper3@citrix.com>
 <YRuaBIc+bfErQnDy@mail-itl>
 <e80d5b51-47a2-c778-f9ef-707efd73aa5f@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XpwdLiUVoP5oJcpr"
Content-Disposition: inline
In-Reply-To: <e80d5b51-47a2-c778-f9ef-707efd73aa5f@citrix.com>


--XpwdLiUVoP5oJcpr
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 13:46:26 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Fix build on newer versions of GCC

On Tue, Aug 17, 2021 at 12:17:31PM +0100, Andrew Cooper wrote:
> On 17/08/2021 12:14, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 17, 2021 at 11:56:56AM +0100, Andrew Cooper wrote:
> >> Some versions of GCC complain with:
> >>
> >>   traps.c:405:22: error: 'get_shstk_bottom' defined but not used [-Wer=
ror=3Dunused-function]
> >>    static unsigned long get_shstk_bottom(unsigned long sp)
> >>                         ^~~~~~~~~~~~~~~~
> >>   cc1: all warnings being treated as errors
> >>
> >> Change #ifdef to if ( IS_ENABLED(...) ) to make the sole user of
> >> get_shstk_bottom() visible to the compiler.
> >>
> >> Fixes: 35727551c070 ("x86/cet: Fix shskt manipulation error with BUGFR=
AME_{warn,run_fn}")
> >> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
> >> ---
> >> CC: Jan Beulich <JBeulich@suse.com>
> >> CC: Roger Pau Monn=C3=A9 <roger.pau@citrix.com>
> >> CC: Wei Liu <wl@xen.org>
> >> CC: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>
> >>
> >> Not actually tested.  I don't seem to have a new enough GCC to hand.
> > I have just compile-tested it and it seems to fix the issue (indeed it
> > failed before with CONFIG_XEN_SHSTK disabled).
>=20
> Oh, thanks!

And I can confirm it doesn't break anything runtime (but that's pretty
obvious looking at the patch).

> >> Most of the delta here is indentation.  This diff is more easily revie=
wed with
> >> `git show --ignore-all-space`
> > Wouldn't this make the compiler include the code even if
> > CONFIG_XEN_SHSTK is disabled (not a huge issue...)? Or is it smart
> > enough to optimize it out in that case?
>=20
> Its a trivial dead-code elimination example, and yes - the compiler is
> smart enough.

:)

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--XpwdLiUVoP5oJcpr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEboZIACgkQ24/THMrX
1yxCKQf+MK8a+oB0oNpBstKP9oqLYrWUh2qYUrkTYtn3I3md44fJbEtaYJh+wdyG
R2tcAMX+aAHFJHMs93PSizN6fKgr4a5DhMvb6u6KDHwNYhwwd3+ucBRMpWnQLzUb
aJY1LWMHEOBNicm7tzpcG2cDfCrqT+JM0rEl3d0aXh+DQLtzFxCS9LuZ1e+v647d
TkhL0AwlGluMzvNXjjTTBjSzZ/XD/5jFu021g5CfpS84mq3/0BFj3r0FeA3+S8SM
FsAKMhOgwOjYHl0NI+UmR0GVmED6gLbK+w49js8MhBTV0g2Uu214fp28L/lBvZFe
kUO704sIoGmcEHagb6ZFBuuWNuEb2w==
=bYAA
-----END PGP SIGNATURE-----

--XpwdLiUVoP5oJcpr--

