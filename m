Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7751BE55
	for <lists+xen-devel@lfdr.de>; Mon, 13 May 2019 22:04:14 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1hQH7Q-0005ys-J3; Mon, 13 May 2019 20:00:16 +0000
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=lf2i=TN=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1hQH7O-0005yn-DS
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 20:00:14 +0000
X-Inumbo-ID: b79175d5-75b9-11e9-8980-bc764e045a96
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-dfw2.inumbo.com (Halon) with ESMTPS
 id b79175d5-75b9-11e9-8980-bc764e045a96;
 Mon, 13 May 2019 20:00:12 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id D6EB6245DC;
 Mon, 13 May 2019 16:00:11 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Mon, 13 May 2019 16:00:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=cIZr2f
 dp545GpHk4+Dg6i/RLB43x+d66G4q2HrdLzLk=; b=fAX44u5cElfPZ4ksKAh+8j
 1RsKjdebaVyhmv0TtEpOa2doTifkmR0Bu2Afx2hjxQ81C4tdNEwqfmOk+puTYxEZ
 FsF+zolI+X5arU9gKtrtFdj+67IRCQeBqC5jEO08hUb95pBthaEsPYkmkCOSxb9w
 Zh/gCsACaHqiBH3YRTO1FTWrm4fKZzfuex96HSgejQGYhoO3jcN+duMoxUPbVh5p
 7DauqAvrYRljUvBzYkgAtDwB5u+7vNldUsoEO2s6gcMDhv2zfWeNU9JeiKjrcNXd
 U8bef/ZqnIbvzIDWzOVYvxZeMVPmhd7S1xMg2cKaQeo5k2OKdkWh3Q186rRhUk4w
 ==
X-ME-Sender: <xms:yMzZXBv8awCiSlb0Qh9eiOh5b78fT2RPEUNRbwSWSdTyzhORov55iQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrleeggddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjfgesghdtreertderjeenucfhrhhomhepofgrrhgv
 khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
 hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecukfhppeeluddrieehrdefgedr
 feefnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisg
 hlvghthhhinhhgshhlrggsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:yMzZXKbavwQDAknUkX2HBU7tP4TFZmET6PZbPqVVKmq3msQd802Oug>
 <xmx:yMzZXAVbKvmMwjcngyEmIUOplt2yGdsrRTp48yzL45LoGw4sBGV10w>
 <xmx:yMzZXNKTM8AncYqdE766zXSdsX4yJLOkhd7LaYiF6NoQEm0kAqXEKQ>
 <xmx:y8zZXOAVA6UG6zgziHq6xFeTmTkab6lEY46AOyeWVhLjnO28Ew3dLw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3C66D80059;
 Mon, 13 May 2019 16:00:07 -0400 (EDT)
Date: Mon, 13 May 2019 22:00:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Wei Liu <wei.liu2@citrix.com>
Message-ID: <20190513200002.GM1502@mail-itl>
References: <20190513153414.GU2798@zion.uk.xensource.com>
MIME-Version: 1.0
In-Reply-To: <20190513153414.GU2798@zion.uk.xensource.com>
User-Agent: Mutt/1.11.1+94 (9b965fac) (2019-01-05)
Subject: Re: [Xen-devel] Anyone using blktap2?
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Juergen Gross <jgross@suse.com>, Xen-devel <xen-devel@lists.xenproject.org>,
 Olaf Hering <olaf@aepfle.de>, Alistair Francis <alistair.francis@xilinx.com>
Content-Type: multipart/mixed; boundary="===============8696678285172973000=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============8696678285172973000==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/j2O6PQ6715aG3up"
Content-Disposition: inline


--/j2O6PQ6715aG3up
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 13, 2019 at 04:34:14PM +0100, Wei Liu wrote:
> Hello
>=20
> Seeing that you were the last people who changed blktap2 in a meaningful
> way: do you use it at all?
>=20
> I'm thinking about dropping it (again).

Fine with me too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--/j2O6PQ6715aG3up
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAlzZzMEACgkQ24/THMrX
1yyOHQgAjUEhtKxdccoT2QRQovBSvoq9+iq90UR0xdvPfr0M2HSSq4Vcb9Ks3R5M
aQEXKa9b7apZ71NrJl/b3j2BC0MTwthUH2x60R7r4C/9qUwgTJPJYNr5nFDiapz/
i2p7FyoCPHAjSB/i8nzaqFvwumdMX8EsxAk++Z4RVa6SI9o6/xc4LknnbYxCNNpp
yEuYXLM7g7LspDPP7QpzojAawnF7Cemf9+CXfszSUx3TacSPcaOqXq66KWKVvzci
7T3GAaR3B01DdhKLncHTqqInLzFXaeRvHMt1g+eZrBGffuFC1n+/CQOy/M3lWevM
rEvw3N9bFqGmbJr1wqOS8QQDLsqqHA==
=2ivi
-----END PGP SIGNATURE-----

--/j2O6PQ6715aG3up--


--===============8696678285172973000==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============8696678285172973000==--

