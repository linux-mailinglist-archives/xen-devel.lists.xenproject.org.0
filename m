Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBE0164820
	for <lists+xen-devel@lfdr.de>; Wed, 19 Feb 2020 16:15:52 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1j4R2L-0001el-Km; Wed, 19 Feb 2020 15:13:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gqO4=4H=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1j4R2J-0001eU-5C
 for xen-devel@lists.xenproject.org; Wed, 19 Feb 2020 15:13:15 +0000
X-Inumbo-ID: 5951c774-532a-11ea-bc8e-bc764e2007e4
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5951c774-532a-11ea-bc8e-bc764e2007e4;
 Wed, 19 Feb 2020 15:13:14 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 5956730A;
 Wed, 19 Feb 2020 10:13:13 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Wed, 19 Feb 2020 10:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=dwosWD
 6Kh0soTZoNTtrsbOoRr6liu2mywcsZMtjAPS4=; b=hpDesEc6d+Wtsfe1Inrn51
 1WZbvkd5jt22YOP9f6vVhaGEHB2k46a8KBIdRRIVY+dCPaYMZJHv3rDqCqUSkubw
 h1c5aGdj+koPcN9lySad9v7aldyi5CAAC6dqoocF88feL41CT0toRGQj5MvX1+VU
 i1MqVZZLXA52cgJ/bGCt66J+BJ56ZlurigQCS3VrxVo0yfDz0aZ7lzgehjb8dhs6
 LzlZi8m0CgKbNS1wpVVEgh2MjMcfLRP1JSpE27QaGYqzPA3sLB6PLoX7EkLnExJY
 x6L6F5GrVWzBboLj1zF802SlNJVqaz4b2VHo2fmPZGnpUNsNAvEGfAsTjftUIP7Q
 ==
X-ME-Sender: <xms:iFBNXpEmRMASmnQGU30zns8E8h-ml2VSQeWFxK1rwmQAaIKXbfEcgg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrkedtgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
 ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuffhomhgrihhnpeifihhkihhpvggu
 ihgrrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgs
 lhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:iFBNXlSz6Vyu4zsijoaXuKY05_i7Is78d14ZLCUYegsbVCKgSPR2SA>
 <xmx:iFBNXhl-zzvpI7pOOljGN7YqDnUYQPENhfqtGABMVi3cPw-kxLNLfQ>
 <xmx:iFBNXtkvIhFqOCgk8G3NYmZvzC2ioi4RzmS3YIQ5IZJb3XAN8P-cIg>
 <xmx:iFBNXnjFxqK3MRJGHH2wsZ7fbHsN1sWMqeq_Ut3dMFVAjH9-r_qm5g>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id D58643060BD1;
 Wed, 19 Feb 2020 10:13:11 -0500 (EST)
Date: Wed, 19 Feb 2020 16:13:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Ian Jackson <ian.jackson@citrix.com>
Message-ID: <20200219151304.GG2995@mail-itl>
References: <E1j4PiR-0000G9-KJ@lists.xenproject.org>
MIME-Version: 1.0
In-Reply-To: <E1j4PiR-0000G9-KJ@lists.xenproject.org>
Subject: Re: [Xen-devel] Xen mailing lists: dropping Subject line tags, etc.
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
Cc: xen-devel@lists.xenproject.org
Content-Type: multipart/mixed; boundary="===============1261355817749917466=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============1261355817749917466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AqCDj3hiknadvR6t"
Content-Disposition: inline


--AqCDj3hiknadvR6t
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen mailing lists: dropping Subject line tags, etc.

On Wed, Feb 19, 2020 at 01:48:39PM +0000, Ian Jackson wrote:
> Hi. This message is being sent once to each mailing list hosted by
> the Xen Project.
>=20
> Increasingly, mail systems on the public internet are demanding
> restrictive SPF configurations [1] and DKIM signatures [2].
>=20
> Currently the Xen Project systems have liberal configurations.
> Unfortunately this means that we are having trouble with mails being
> blocked as spam. We intend to tighten the configuration.
>=20
> For mailing lists, this will mean we need to stop adding the
> [list-name] tag to the Subject line, and stop adding the footers
> giving mailing list information.

Is that really necessary to make mail systems happy? I have managed some
mail servers including mailing lists few years ago and from what I
remember, it was necessary to just make it clear in the headers that
the email comes from the mailing list. This includes things like
(envelope) sender rewrite (SRS[3]) and adding own DKIM signature.

Personally, I don't mind dropping mail footer, but the tag in the
subject is really useful to distinguish various discussions in an INBOX
(when you're cc-ed explicitly).

[3] https://en.wikipedia.org/wiki/Sender_Rewriting_Scheme

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--AqCDj3hiknadvR6t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5NUIAACgkQ24/THMrX
1yyXwQf7BDUHJdo+PxDLCsq3UBh5REziBJBMUfdoV3OioQTBu2H1DBn2IyYkRstp
NuwtrvGgZ7OPxaE2BUrSJvipljMQauK9iFynoPuJp6n8jP7GPBY4kV1GLPKWhm5g
uubXXUbvefPCGZZOSUbyZADBZNOuaPxkUxO06GxsoxJQg+wKsgFCu9lJiqHMuuDh
e7e7mZ1kxGkJZSYXOnlS2/s1W6r9oxW36y5pbjrATsYggziWPeO0BuLUB2JosNqS
QbGfxCm6qSmhquKtKKS4Toith7SFWX5jRr+uGU9hEoDmsiQOkku4Sotg/3YsJujk
xPLOY++dw2BqbEkxvfCeKMKusXBUOQ==
=5ljx
-----END PGP SIGNATURE-----

--AqCDj3hiknadvR6t--


--===============1261355817749917466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============1261355817749917466==--

