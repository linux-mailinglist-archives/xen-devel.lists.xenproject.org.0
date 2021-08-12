Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 230343EAA0F
	for <lists+xen-devel@lfdr.de>; Thu, 12 Aug 2021 20:17:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.166549.303982 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEFGH-0007PB-WF; Thu, 12 Aug 2021 18:17:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 166549.303982; Thu, 12 Aug 2021 18:17:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mEFGH-0007Ml-TK; Thu, 12 Aug 2021 18:17:01 +0000
Received: by outflank-mailman (input) for mailman id 166549;
 Thu, 12 Aug 2021 18:17:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ckIB=ND=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mEFGG-0007Me-V5
 for xen-devel@lists.xenproject.org; Thu, 12 Aug 2021 18:17:01 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 7c48db28-fb99-11eb-a1f6-12813bfff9fa;
 Thu, 12 Aug 2021 18:16:59 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A3AA05C006F;
 Thu, 12 Aug 2021 14:16:59 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 12 Aug 2021 14:16:59 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 Aug 2021 14:16:58 -0400 (EDT)
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
X-Inumbo-ID: 7c48db28-fb99-11eb-a1f6-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qbz+nu
	Dfc54vSIjdJZhDygAZiZbGMDMrw5j49nmRxWo=; b=rcpSdXnjaYDvZrbmrOEFDR
	tmI4KwEYcRTUSUvLufyQnFQnuhw01FMsawH0YRTDz9EX9eXv3QjHSerKB+ShPFFI
	7rxDVeMIkDYXE9DeiTMnY/PMl75RGHRThkWrAS1dFODyBrBktrguked4L7Me3GDm
	/4tfWKYER+cQNfKKUqlmHMe3YC60MAT42QYfuMN2TFRNfGzFpRQ5B7C5O4HGifKZ
	juE5D6nK+2sH2uLXJM4XpLhCH9C8LYkhJC7zIwh2JTFHznYUGT568UsAlMINXMTq
	dL+gysSlomc7HqPiHB/iD35IRnZt/qcakd3QzvZ7Zx6IuG4JeGbwWDq40/OFE/fA
	==
X-ME-Sender: <xms:mmUVYSG7NillsEQKQcVe3hyt_10HQY4ayFxlbqFzwpGPFH_7B0gDsQ>
    <xme:mmUVYTVvzyDZqQtsEhTBAfy0tRGVAo9kuYQzVVsw5y9E6qnTS7SaYfZl9p9dDg14W
    7CPMP0g3_WNdw>
X-ME-Received: <xmr:mmUVYcJPeMinRBtPeNKRbU7vF_9ufrsHubP1vqVl1o4zSdsnT5waAgGA-xxqRNZNO5iWCzNFHzlFwWB4WRGu2qdZKE34a63N>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeefgdduvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:m2UVYcGtnXo5e2bhHC14uaH8eLihA7i5rN73FvvtNBmmzHUyeHhY-Q>
    <xmx:m2UVYYUlbqdfr2b-XtrfU6P8Te4zY6_1mSZRT0sBS-QywYuJhkuQnw>
    <xmx:m2UVYfMTHq1dO1cOpRkUNXiAtYlg4tZmPtNgKtWfeZgPkitR0V0YPg>
    <xmx:m2UVYVh-hMJCtj-9DfQu14h13ENBhnmX-t-pMEjXqSJJEDsDLhAeJg>
Date: Thu, 12 Aug 2021 20:16:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Fix shskt manipulation error with
 BUGFRAME_{warn,run_fn}
Message-ID: <YRVllTyg8SpsvzMA@mail-itl>
References: <20210812170350.23543-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zZ9X58O/aGMGCIb8"
Content-Disposition: inline
In-Reply-To: <20210812170350.23543-1-andrew.cooper3@citrix.com>


--zZ9X58O/aGMGCIb8
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Aug 2021 20:16:53 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <JBeulich@suse.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH] x86/cet: Fix shskt manipulation error with
 BUGFRAME_{warn,run_fn}

On Thu, Aug 12, 2021 at 06:03:50PM +0100, Andrew Cooper wrote:
> This was a clear oversight in the original CET work.  The BUGFRAME_run_fn=
 and
> BUGFRAME_warn paths update regs->rip without an equivlenet adjustment to =
the
> shadow stack, causes IRET to suffer #CP due to the mismatch.
>=20
> One subtle, and therefore fragile, aspect of extable_shstk_fixup() was th=
at it
> required regs->rip to have its old value as a cross-check that the correct
> word in the shadow stack was being adjusted.
>=20
> Rework extable_shstk_fixup() into fixup_exception_return() which takes
> ownership of the update to both the regular and shadow stacks, ensuring t=
hat
> the regs->rip update is ordered suitably.
>=20
> Use the new fixup_exception_return() for BUGFRAME_run_fn and BUGFRAME_war=
n to
> ensure that the shadow stack is updated too.
>=20
> Fixes: 209fb9919b50 ("x86/extable: Adjust extable handling to be shadow s=
tack compatible")
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

With this path, I don't observe the crash anymore. Thanks!

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--zZ9X58O/aGMGCIb8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEVZZUACgkQ24/THMrX
1yydKwgAjpzXEY+YiPmk5nvhO51Ilw8OrTVzfaG4u02M5DQeude7nOvtf2NT+g9R
HXlWJsDyfyhbV01dki/mrzuot9kP8ZeJm7BZBTRi/Mxjg4Vm6+8I2LFUYEUifeho
pp7ekJZcRt8x1i+t/6lhYIC1KP8FPAGEANkQKp6hBqxdr8bO3KVygIXokomZpubt
7LnqyFPzWfkKwuMJ3nnlBlHCcKce1FRO0IbtR736cAOt36/HLkIVz6G8gqNj5rZw
IdJJdUClcOhKnchwF5yhHpnrz8Xf/dqQa+bU+xE07KKqp8ncyLePjyn2PUun2m3B
pI3P8SR7tdJ4gZsckVpXNl2brt2SCg==
=XshT
-----END PGP SIGNATURE-----

--zZ9X58O/aGMGCIb8--

