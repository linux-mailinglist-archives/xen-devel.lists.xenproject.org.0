Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 42C52145CCE
	for <lists+xen-devel@lfdr.de>; Wed, 22 Jan 2020 21:02:02 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iuM98-0003lB-9a; Wed, 22 Jan 2020 19:58:38 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=1mKO=3L=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iuM96-0003l6-KZ
 for xen-devel@lists.xenproject.org; Wed, 22 Jan 2020 19:58:36 +0000
X-Inumbo-ID: 93014f38-3d51-11ea-bd39-12813bfff9fa
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 93014f38-3d51-11ea-bd39-12813bfff9fa;
 Wed, 22 Jan 2020 19:58:35 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 85AAC21EAD;
 Wed, 22 Jan 2020 14:58:35 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute7.internal (MEProxy); Wed, 22 Jan 2020 14:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=I1Js8o
 oW+G0pfs/R6ATM70Eem4dQX5++TolKTF3tuuk=; b=xrLOggGh6EMQSw3ArbDzZk
 j9rxxGjaqan+BH4pbGowHMWcfFqNGEaJAZciKFW0wsEDZR4SLzHE+bz5q3MVaHZt
 ZnRvAkQJCWRBgoCmfHCs7GMb4uiKyhG2GzkNaNnRNOdPItH8JSxkiDAlq1Yc1ZUq
 4GJ3T+DptGIO0QhhiedRp1JknaIjhS7Nt2l3y0sW435Db5wcut+8+Nc6aoG0R6jM
 BGyVFK+ZYXvQBrKYLSIsBliDNK3LXmPcrQrFlq/W9MXPArSF7/Px53PrOg7ogP33
 PSKpDVx0a8fwFZrQ1B2qAnXlv1wEu0Al8uQJlUCSI5IedQYjORccFSkud0ewXfVw
 ==
X-ME-Sender: <xms:a6koXv_mD-4MTsZTi9r1GwLcD5B_5l-CmR_Z7GNi885GR7Q-sNOAHA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrvddtgdduvdeiucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkfhggtggujgesghdtre
 ertddtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggt
 khhiuceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
 eqnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivgeptdenucfr
 rghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhih
 hnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:a6koXpUvAgnmXe7WVPOB0nm9BKD9QJsFQZHVNvwj-UDKp8jzdbsbHg>
 <xmx:a6koXkayQq9SNeN0bCdNfd-UWVN2mO00u9VXsVdR1bsa02CSD70drQ>
 <xmx:a6koXjqYQGoq_EOt83LTV5d0piRiHTFJfc1KrHpLEC9nBMV_PqE47w>
 <xmx:a6koXipofARbzFXj4p_8qF0org8YF1zKfMs-v9QnFtZVSvGY_ZztzA>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id DBFFB3280063;
 Wed, 22 Jan 2020 14:58:34 -0500 (EST)
Date: Wed, 22 Jan 2020 20:58:31 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: tosher 1 <akm2tosher@yahoo.com>
Message-ID: <20200122195831.GB1314@mail-itl>
References: <1284035258.1445298.1579543677315.ref@mail.yahoo.com>
 <1284035258.1445298.1579543677315@mail.yahoo.com>
 <20200122012713.GB2995@mail-itl>
 <1699773700.2581218.1579712175340@mail.yahoo.com>
 <20200122190133.GS2507@mail-itl>
 <409698033.2707956.1579722613556@mail.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <409698033.2707956.1579722613556@mail.yahoo.com>
Subject: Re: [Xen-devel] HVM Driver Domain
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
Cc: Xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============5048346735188553762=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============5048346735188553762==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eVN8q1r3v0Uw6/qa"
Content-Disposition: inline


--eVN8q1r3v0Uw6/qa
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] HVM Driver Domain

On Wed, Jan 22, 2020 at 07:50:13PM +0000, tosher 1 wrote:
>=20
> > I don't see what is wrong here. Are you sure the backend domain is runn=
ing?
> If you mean the HVM network driver domain then, Yes, I am running the bac=
kend domain.
>=20
> > Probably irrelevant at this stage, but do you have "xendriverdomain" se=
rvice running in the backend?
> I do not have this service running. However, my PV network driver domain =
works fine, though this service is not running.
>=20
> What version of Xen are you using that have xendriverdomain service?

I know it works with Xen 4.8, 4.12, and 4.13, but I wouldn't expect
any issues in a version between them.

I'd try increasing verbosity (xl -vvv create ...) and looking if
something earlier didn't gone wrong.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--eVN8q1r3v0Uw6/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4oqWcACgkQ24/THMrX
1ywdLAf+P/sRGZg2Pny8awcZF59r1Q+uUhROADqDVLsKcA6pvkAmS5qyFeL/wii2
vczlKkDqeiuy3r6oxn6BX2nGnkzNP5gPELvlp6TDSkd31Qf6jL7lcNk95bVI5pTb
emAAgVLKh8lqQr6D/trFGw2PLT2jD4VWvjoVoMkGFAOuG56Y1ftYEI7XJMT5eYbE
QTlF4bVH0A4TWRAfut1iE//gZTFlbui2Sj95Y9HfHwEGGG9t2b69j5FaU0XWQtTU
bx5d7HAik3fExS0Nzbk8Ws18d7e8wK99haHLIB74xmbWN5DnpeyIino7AO1rfvA6
sFy3yWQ9aw0/pILMX+E6kIOe2IUXCA==
=btrC
-----END PGP SIGNATURE-----

--eVN8q1r3v0Uw6/qa--


--===============5048346735188553762==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============5048346735188553762==--

