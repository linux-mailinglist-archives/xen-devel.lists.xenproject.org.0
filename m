Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AEF2FECC8
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 15:20:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72111.129529 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2aot-0006l7-Mm; Thu, 21 Jan 2021 14:20:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72111.129529; Thu, 21 Jan 2021 14:20:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2aot-0006ki-JQ; Thu, 21 Jan 2021 14:20:19 +0000
Received: by outflank-mailman (input) for mailman id 72111;
 Thu, 21 Jan 2021 14:20:18 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F0IY=GY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1l2aor-0006kd-V5
 for xen-devel@lists.xen.org; Thu, 21 Jan 2021 14:20:18 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id a017b2db-1280-4ea7-83d9-25e362d1bb65;
 Thu, 21 Jan 2021 14:20:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id C6E0F1BA6
 for <xen-devel@lists.xen.org>; Thu, 21 Jan 2021 09:20:15 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 21 Jan 2021 09:20:15 -0500
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id EDDAD1080057
 for <xen-devel@lists.xen.org>; Thu, 21 Jan 2021 09:20:14 -0500 (EST)
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
X-Inumbo-ID: a017b2db-1280-4ea7-83d9-25e362d1bb65
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=883DNC
	ICWYCwPpONq9am5siGjzcQHp2BuKfi/93PzZk=; b=FVGz6+QqY9Dk5oMrjWoE/4
	t2/Qh3dTi9CXULSOc0u+f8rRGYA6CN1EQMsD07Vqpq2t7z5daUmIzrTGFEvJpbGo
	ge2XESrCwbTNN8NH/YTkdNtSg8tcvtGxH6m6ekOVKj1xoZwMriB7wVblm4aEBoeF
	VsZKHNe6XxFr+K4rounCSxt8qOg1uxUMiK7GaGzq4X9LqPDIK6OBZajigohecWG/
	tRz/NUhSHoRmsWxioXSsNlvP466zX+/6C58ECbpt0DdTbIO0emJs3s456r81jRHY
	KW77bqMalnn3HsjPjdODdOvYVbBm7NqpiWnKPCAEGoqvKCsC/aockfArFu0sFLUA
	==
X-ME-Sender: <xms:n40JYPykbVziCYsMLtFW5jh8o3NrrdFQi_ZdufqUbOjWbJ9vF1A-vg>
    <xme:n40JYHTDL8X_KkHesrfYC6mt6BiUA0uTMhJYgnCLOb1nBCEtNHEWsdW2QqfPf-ycA
    qQsDaWDTpkvNQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudeggdeiiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfhfgggtuggjsehgtderre
    dttdejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghk
    ihcuoehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqe
    enucggtffrrghtthgvrhhnpeejudeigeeiffekgfduvdetfeefhefhleefudevleejveet
    ffdugeekjedufffhfeenucffohhmrghinhepgigvnhdrohhrghenucfkphepledurdeige
    drudejtddrkeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:n40JYJXIQJ3qukk519FO31_OyXHjGQ8yIuKtQ1P0sB9Q0pO1vsOFxA>
    <xmx:n40JYJixCo1Vom24aqEcX3BZQypxRnvV-R_SnPF0KBH-9QpTXWg1QA>
    <xmx:n40JYBDyf21uwzOFBNqG7XWgmQ8WB2Da3HBg7yNbL_CE-4JuS_n4cQ>
    <xmx:n40JYNzd6Y7A5F1amVgO7P3zKGupokLuPF0jLukwXEuWY1d1KDjclQ>
Date: Thu, 21 Jan 2021 15:20:12 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel@lists.xen.org
Subject: Re: Xen Security Advisory 360 v1 - IRQ vector leak on x86
Message-ID: <20210121142012.GB1592@mail-itl>
References: <E1l2afg-0006PK-Gj@xenbits.xenproject.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2B/JsCI69OhZNC5r"
Content-Disposition: inline
In-Reply-To: <E1l2afg-0006PK-Gj@xenbits.xenproject.org>


--2B/JsCI69OhZNC5r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Xen Security Advisory 360 v1 - IRQ vector leak on x86

On Thu, Jan 21, 2021 at 02:10:48PM +0000, Xen.org security team wrote:
>                     Xen Security Advisory XSA-360
>=20
>                         IRQ vector leak on x86
>=20
> ISSUE DESCRIPTION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> A x86 HVM guest with PCI pass through devices can force the allocation
> of all IDT vectors on the system by rebooting itself with MSI or MSI-X
> capabilities enabled and entries setup.

(...)

> MITIGATION
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Not running HVM guests with PCI pass through devices will avoid the
> vulnerability.  Note that even non-malicious guests can trigger this
> vulnerability as part of normal operation.

Does the 'on_reboot=3D"destroy"' mitigate the issue too? Or on_soft_reset?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--2B/JsCI69OhZNC5r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAJjZsACgkQ24/THMrX
1yyWEAf+I9YtT/vf/ZDwJkt6lLw6pBXMzVsDBEnbobddNGKLgPzEyZiEFHxddrWJ
c0IIj7fTBnc+gmeg+PpfmQ3t0Q6OMpTPgcafWBhH2BCxY+48pKTwjyzLml0kO1QN
hgvGT1xx0wlsR/fkmwa9e6uKk6Wr6rd+ECoEF6SLcR5QkiYkLKzC7PAxDaXLbl4m
33nAfcwvKVALAEqKHwWZvgxt/x6tH6ZFGmmdHr2PzhvIyVjjO+klhxPq6coRaW/K
2woM/KGUfrIDSt9u4qJ2RRXMA5LTILja1NlOXPTnbCI00ZtqIUx79Pqz8n+xUAM0
ZTOGyJjk9y1C6hg7tnFff21Ypn1f/g==
=h4kx
-----END PGP SIGNATURE-----

--2B/JsCI69OhZNC5r--

