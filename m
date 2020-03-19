Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D842018AA26
	for <lists+xen-devel@lfdr.de>; Thu, 19 Mar 2020 02:03:25 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jEjWj-00024U-Jo; Thu, 19 Mar 2020 00:59:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=hP2b=5E=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jEjWh-00024P-Qm
 for xen-devel@lists.xenproject.org; Thu, 19 Mar 2020 00:59:12 +0000
X-Inumbo-ID: d824b86e-697c-11ea-bec1-bc764e2007e4
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d824b86e-697c-11ea-bec1-bc764e2007e4;
 Thu, 19 Mar 2020 00:59:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id EAF7E5C0390;
 Wed, 18 Mar 2020 20:59:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Wed, 18 Mar 2020 20:59:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=ZD7NCD
 uZyPyapB1+eCu/1R70b0/+XFAz60u4sOz8EtM=; b=IRclOp94KxJavVLW+GdiLQ
 MWcIrTyBqp0QvEjxduMtyYGAJGJoB8IM6CY0kqKSxx9e0TNlrQwAVTGa8tZhXhSW
 P1u+Nkx6mlWuPDF494lucY+Xa0L1Snje7ajnTaNNuAf6um2FgrDFngc8vqwSrO6E
 MXlL1qecSaegVkXJCallEf7DXprcC/OY+46+WgZyvmDj0TMh6/uvAX6sW0FJCdFW
 HtiVa3alWKmjnzczEQIdKYF4Ge/bsBCY5A3DkNoEBKdrgUvvO8MVsNR0ATCstTET
 e987qCUCVWde7c380LMuJXFZZ4u+9/x+SV6lFVhi3FwSKl8Tomz4uM6P6P30GRWA
 ==
X-ME-Sender: <xms:3sNyXq_A9TX9GuCR5-JmH8Xmrof5F-gacdbrNJ07FjDnoZQgIU6ofw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudefkedgvdelucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 hrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:3sNyXsryLYLQziX08Xn9XlxKKWGX_k4N1acW7oZmZC-X69E7SVPzng>
 <xmx:3sNyXqbPb2MvPjhVdY0_r2mRE6XucuOqP7Mp6G3lC3-dqDxfw03VPg>
 <xmx:3sNyXvyzpA8fu4tKP3Cgx00PzurhwMoSCPa7403kHXLWzyY8l11T_A>
 <xmx:3sNyXgKpbAHYpGPU0b7V7CLHqkjluxkqwu899fFocpZCv6zepcsZXQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id B8E88328005E;
 Wed, 18 Mar 2020 20:59:09 -0400 (EDT)
Date: Thu, 19 Mar 2020 01:59:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Dario Faggioli <dfaggioli@suse.com>
Message-ID: <20200319005904.GT18599@mail-itl>
References: <20200318141635.GW7869@mail-itl>
 <fa845540-fd8e-bc63-a3af-50673dede579@citrix.com>
 <20200318221006.GS18599@mail-itl>
 <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
MIME-Version: 1.0
In-Reply-To: <413cac496e18bcb04b0691ef633d206f3a14a8e3.camel@suse.com>
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13
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
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Juergen Gross <jgross@suse.de>,
 xen-devel <xen-devel@lists.xenproject.org>
Content-Type: multipart/mixed; boundary="===============0772074032564781441=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============0772074032564781441==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4sIpN43wh+0KCG0T"
Content-Disposition: inline


--4sIpN43wh+0KCG0T
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Xen crash after S3 suspend - Xen 4.13

On Thu, Mar 19, 2020 at 01:28:10AM +0100, Dario Faggioli wrote:
> Do you remember (or can easily test) whether this was also occurring on
> Xen 4.12,=20

Looking at my tests logs it did not happened on Xen 4.12.

> i.e., without core-scheduling code even being there, when
> this ASSERT was:
>=20
>  ASSERT(c2rqd(ops, vc->processor) =3D=3D svc->rqd );
>=20
> If no, that might mean we have some scheduling resource and/or master
> CPU issue on the S3 resume path.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--4sIpN43wh+0KCG0T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl5yw9gACgkQ24/THMrX
1yx7EwgAkNaI/kNHOj0glxRisHWOT2td4jCjpRnFWdcNTNUslVIBS/i0uU4Eo4Ez
ATEKET1288MvmbyB+7TtIcVuOTxeh2sjJ8yGEXFIbp/AZoh0vExFVmiic0qA0Ege
+e2NWHEiHbxw2550Udi7huDxkZDaCHHu4LIpisysvRg/CwT8c2uEwAvw16LO+B01
mdbeaeZAb30J8t8ehzd+RtPx8oP60jaN+UK+lD3PkLu6/FUWwv0WelFtbfARnJQE
b71AL58KAycnloP8nbzn9Sr/zefvpG8Y3RYIAY9H22VKaHRak7OuSKgE34Km5yoJ
iWwRbj7e+aaoKongd+5ZJL9xrW9lSw==
=Ap2J
-----END PGP SIGNATURE-----

--4sIpN43wh+0KCG0T--


--===============0772074032564781441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============0772074032564781441==--

