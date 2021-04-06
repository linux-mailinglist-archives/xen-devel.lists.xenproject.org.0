Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DB26F355862
	for <lists+xen-devel@lfdr.de>; Tue,  6 Apr 2021 17:45:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.106089.202861 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTntR-0007Fw-DQ; Tue, 06 Apr 2021 15:45:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 106089.202861; Tue, 06 Apr 2021 15:45:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lTntR-0007Fb-9v; Tue, 06 Apr 2021 15:45:29 +0000
Received: by outflank-mailman (input) for mailman id 106089;
 Tue, 06 Apr 2021 15:45:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QGEI=JD=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lTntP-0007FU-L0
 for xen-devel@lists.xenproject.org; Tue, 06 Apr 2021 15:45:27 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id e64a7472-adeb-4adf-a5a6-f9ddee07f2cc;
 Tue, 06 Apr 2021 15:45:26 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.west.internal (Postfix) with ESMTP id 019B612FA;
 Tue,  6 Apr 2021 11:45:24 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Tue, 06 Apr 2021 11:45:25 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2007F24005B;
 Tue,  6 Apr 2021 11:45:24 -0400 (EDT)
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
X-Inumbo-ID: e64a7472-adeb-4adf-a5a6-f9ddee07f2cc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=PO0+7FT9TKWmzjx0sAJfwf38Vr6YG
	+cGV22fL96XXS8=; b=KNxDjtMgV/tC9DKU8Trx09zMjE8n7Q8PX0tYy0QlnTyNq
	t//PthGb7v+rcQ3nSdWw71OtmPMw9O1OMrVRjg8y3nAP3Y2d+L6PFZbs7KyGtJlC
	kL1Dt3G5G4e+DvNIzzh+yNotgGJNapRX52JW9KtLHmuGwC2i2uLb41G8TWqt24DD
	foSkAYC2whk7PdUChzwf/FV52hma69zI6vAWJ/he0r+n4lccORBwhRMoqNNhN+1c
	aFvC24f2R5dD8ly0OEiH/5mJt1PqnQgCq7xj8w0buR9Wji0L7ezZmZfkADTrpF6p
	xRXpHuqbiXnU2KoJcpvOygutNmmEDDZndS8+Pzv7g==
X-ME-Sender: <xms:FIJsYIbl3TdMDk9RlZh8KrqhR7ve393RkF5-l-ffC2EGC04wim3OJA>
    <xme:FIJsYFaJW229BMiAB0oMzy0J4Idnqh-BDV0og912358nrTXJmVNqTA0P1NNWN-HyY
    3Kcq34Qy_YJNA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudejhedggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeegvefhtddt
    veehudfgtddttdejkeeltdfhheegleffhfevgfeuieeuteehuddtjeenucffohhmrghinh
    epmhgrrhhkmhgrihhlrdhorhhgnecukfhppeeluddrieejrdejledrgeenucevlhhushht
    vghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesih
    hnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FIJsYMU-GmVFTJb_r82vMYJdTlQtwocY6d-uSu2l4prEAkKbNuzUuQ>
    <xmx:FIJsYE2tUvXepMct_rTy3TKsHm8dInd6Nl2rUK0WDMNGIkWm87QjOg>
    <xmx:FIJsYLbkjQZpLp_0LuDZIm0nd7zPoxK_82XDZcmXBo8MF2aIM_Kp4A>
    <xmx:FIJsYODYgQb_NG9B9fNiup1lAsukuR_4AlX6tNNMTnKu1z_fB74sEA>
Date: Tue, 6 Apr 2021 17:45:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "Demi M. Obenour" <demi@invisiblethingslab.com>
Subject: block script performance
Message-ID: <YGyCECo8O0rwS8Z5@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Y7Epn8F7IAMLWrHw"
Content-Disposition: inline


--Y7Epn8F7IAMLWrHw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 6 Apr 2021 17:45:20 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: "Demi M. Obenour" <demi@invisiblethingslab.com>
Subject: block script performance

Hi,

Some time ago I've done an analysis what's the easiest way to improve VM
startup time, and one of the things that really stands out is block
script. VM with 4 disks can take up to 2s on waiting for block scripts.
A while ago I proposed a patch[1] that short-circuits the block script for
the simplest case - already existing block device. There is also similar
slightly more complex but common case - a file-based disk, needing a
loop device.

While there are several ways I can fix this in Qubes-specific
configuration, I'd like to have a solution useful for upstream too. And
for loop devices it would be especially useful, as the Linux API here
has a _huge_ potential for all kind of races (resulting for example in a
wrong disk being connected to a VM). Currently those races are avoided
by the block script by taking a global lock, which also adds to the
performance issues...
Furthermore, I'd like a solution that is compatible with driver domains
(backend in a distinct place than the toolstack), preferably using the
same code path for both (to reduce regression risk, because most test
only dom0 case...).

Recently I've talked with Demi (in cc) about it, and we came to a conclusion
that it should be somewhere in libxl, in a place that is also called in
`xl devd` (to cover non-dom0 case).=20
I think I know libxl well enough to find the right place to plug this
in, but I'd like to ask first, if this would be acceptable in upstream
libxl. Note this will be Linux-specific (both because of loop devices
part, but also because of writing xen-blkback specific xenstore entry).

[1] https://xen.markmail.org/thread/ytikjjbs4kpihzi5

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--Y7Epn8F7IAMLWrHw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmBsghEACgkQ24/THMrX
1ywOCgf9GpwlqW9+D+2vJ77PaPaeYtcUskVGugHXsRTUDzk6FmQcAY73OYFBVYC7
LH3jC+50CNEIAZf5Mw2TSg4aD1jyIoN4IlDqw+yd2AZKAAIWXNAW6ydZ5mevviA6
FX5rRqrLLBS8NaOdacrv4m4YJaWNspjnp+sqHI88txrg0wtmaWVXutnBUB1zzsbQ
D4LRIjyH9aEIop5S8C0coywUdcVV166CttMu1jTeK7A5QqBFUdhE1JH6ahEOP8nf
Ohcwg0iepxYTNAulXg4K6ELmQYxArIAZ1ue1CO5veWQ0cJ/RiW/zUfBpe1CVsGKs
OUOcq+mh2+ymSqeGBBNURjrl41NPag==
=84I/
-----END PGP SIGNATURE-----

--Y7Epn8F7IAMLWrHw--

