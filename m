Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D324E231E
	for <lists+xen-devel@lfdr.de>; Wed, 23 Oct 2019 21:08:52 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iNLx1-0005D5-HQ; Wed, 23 Oct 2019 19:05:43 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=bla1=YQ=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iNLwz-0005D0-Om
 for xen-devel@lists.xenproject.org; Wed, 23 Oct 2019 19:05:41 +0000
X-Inumbo-ID: 1af4bc62-f5c8-11e9-beca-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 1af4bc62-f5c8-11e9-beca-bc764e2007e4;
 Wed, 23 Oct 2019 19:05:41 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id A050B490;
 Wed, 23 Oct 2019 15:05:39 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 23 Oct 2019 15:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=wOZWZ1
 IBttvHIJhNpapewyQlbXCt0E2Foe4sljHjBQQ=; b=iIw8w8tEGX63qsLuDM+bSc
 uMsruWu5A9k25H9usTviNzXCbqevo8i2QoD0ThFAPwH5m793nuvfJ+S4rHXgFX7L
 7Ik5J6LDH/wkTvJKE2YcP/tr/ONimp6J/kxJ1hIkNOOiR2w4NS9qj5COAhUx77Mq
 cLW0JXF6PHtR362FkREgerWucdABxquIi/C/HGWwYdXmGcsQFbTUOBXEpUaEIr2u
 Uefk2o1sPWfNwqB1FSNZXwwuKZYLKCYjyhgCKtwzp+U0wl0ljcsap+8bj3WkdPiN
 6pHh0P1FE1aOtD5i+F+ggk+cRKFw0P/G/32y8kYQ6N158DRrx8XNBTGIy3nK3i0Q
 ==
X-ME-Sender: <xms:gqSwXRxDmB3RloGZgiA1sK47xcAKJ-jnGZd1ygtQYIIQyQM2lK9Gkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrkeelgddufeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhdrohhr
 ghenucfkphepledurdeihedrfeegrdeffeenucfrrghrrghmpehmrghilhhfrhhomhepmh
 grrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomhenucevlhhu
 shhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:gqSwXdmnmk3k5G1BxRa4BLWWDD2Zk0zHwilF7Qu5UK7aJLIyWc_FGg>
 <xmx:gqSwXeF2sfZr0WEKsSy0ppbve5jvgADPvKDB6bdRGM7asGCiLuwd8A>
 <xmx:gqSwXVVjXQimx7x0eSc6lUNIg-n91zHq5SyTaxl4JhA-e2uhlj2dGw>
 <xmx:g6SwXWrMBdpraQAw91pKoqIqw_PZ-BJIVO7dQsNMOua1ye3shCCVZw>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5EEC6D6005F;
 Wed, 23 Oct 2019 15:05:37 -0400 (EDT)
Date: Wed, 23 Oct 2019 21:05:33 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: "K. Kahurani" <k.kahurani@gmail.com>
Message-ID: <20191023190533.GA4109@mail-itl>
References: <20191023084841.30903-1-k.kahurani@gmail.com>
 <20191023084841.30903-2-k.kahurani@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20191023084841.30903-2-k.kahurani@gmail.com>
Subject: Re: [Xen-devel] [PATCH 1/1] tools/configure: remove redundancy
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
Cc: admin@rapidseedbox.com, jbeulic@suse.com, ian.jackson@eu.citrix.com,
 jfehlig@suse.com, xen-devel@lists.xenproject.org, eblake@redhat.com
Content-Type: multipart/mixed; boundary="===============1520102963260763897=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1520102963260763897==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] [PATCH 1/1] tools/configure: remove redundancy

On Wed, Oct 23, 2019 at 11:48:41AM +0300, K. Kahurani wrote:
> This piece of code is redundant and results in a garbage error
> message on systems that do not have a default python executable.
>=20
> Signed-off-by: K. Kahurani <k.kahurani@gmail.com>
> ---
>  tools/configure | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
>=20
> diff --git a/tools/configure b/tools/configure
> index 82947ad..a1f36d1 100755
> --- a/tools/configure
> +++ b/tools/configure

configure script is a generated file, you should edit tools/configure.ac
instead (and then generate tools/configure out of it). You may also want
to look at this commit for reasoning of the current code shape:
https://xenbits.xen.org/gitweb/?p=3Dxen.git;a=3Dcommitdiff;h=3D9caed751db91=
10c785fd6b1def89d808baa1d907;hp=3D88339ae94f4309888eae81a6cceac9577a319d7e

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl2wpH4ACgkQ24/THMrX
1yyh0wf/U2BjxKlpU1QOTzeiTznSJejaYIPKURfJj09NNSuOrHpOczM0YyMT/Jhy
4xghkuCoMPCxMv8+U+GCTO7Nb1BYZz6wEiwCONS3YcGk3H67YsngnhilFHlhkO/M
QnxPKLAr5D5yU3PZG0hHNq+A6t7TW8Tp1MS5RiihkvCBTmtBEMmm0ehLUtp+JeG6
84EGjSoLTeT+PYsdNCaYOs8ybyQyEXoptILDPUNoPmb1y5QjJeyA7aZo71h3ZmCe
atyRYcBveZ4chesfbCsVZ3rTqMYc8yfF1C/yoZ/lwr5XkagvzpudizDuHd79yHGb
iu85jE9aFQbsFNaU/83c1LnU+BVGSg==
=fbyk
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--


--===============1520102963260763897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1520102963260763897==--

