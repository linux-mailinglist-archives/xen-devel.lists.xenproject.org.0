Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC46DF92D1
	for <lists+xen-devel@lfdr.de>; Tue, 12 Nov 2019 15:38:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iUXGN-0001Gq-IC; Tue, 12 Nov 2019 14:35:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=WMIP=ZE=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iUXGM-0001Gl-2j
 for xen-devel@lists.xenproject.org; Tue, 12 Nov 2019 14:35:22 +0000
X-Inumbo-ID: a7cce178-0559-11ea-b678-bc764e2007e4
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id a7cce178-0559-11ea-b678-bc764e2007e4;
 Tue, 12 Nov 2019 14:35:21 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 4800522283;
 Tue, 12 Nov 2019 09:35:21 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Tue, 12 Nov 2019 09:35:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=QyPeM6
 6v5A+xfI05GrKLsZv0bCeGDGJfERmOBh35jhI=; b=H1o4Zf1+3ZB21ebjZum+m9
 vfSwdLdqjH+XK1liM9hH9hCDsmlb0gUSYKkZwUQuJvnZS8FysFyRSfaCpG/txtAO
 QlFL+Az1MP5MHfpDil1fy3/9YKo8/ojUq31l1zUM5L3894WeaRLe416PEW0mgl3A
 1a1syWToMfGO2k5eqIWEKoFdxejiaCBQMgNRxPxEria4FPKd7v/sR3tXXCz172UA
 n34AGT7wZjGbja/bSJfFlS8t72PXKTOorqQ2AH+w4Bk93xF9ejIgTdgK+Q+O9tmj
 jIOhdA3HhHGN+BFjAAD7KJg+77MyEfLuYEoi8NcQIirVcbeA8fM407qDT97orQdQ
 ==
X-ME-Sender: <xms:KMPKXRnymDRqQGZbhDz_8jqi5zplOouyQOhGM0F_OthygD7BzMA7dg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvledgieejucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucfkphepledurdeihedrfeegrdef
 feenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslh
 gvthhhihhnghhslhgrsgdrtghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:KMPKXY-5TwSe8GhM_vRJjQ_6BeyKCh1I9mjzI_gCgb7n5qQVUzdeFw>
 <xmx:KMPKXTfIxrBbvHs5dBMfX8XDpmgYRgVTuOQlJ41C8qdjbKSDtvbQfw>
 <xmx:KMPKXa5ElbRdryZVqJQEKKsYgrlnllTMgCBMKn_E4_hH3I5L7x4wsA>
 <xmx:KcPKXUpuUKp-qKpqX-EX7yO09JvgagAUWsLx66nDKNpWzFXVmop5dQ>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 03F29306005C;
 Tue, 12 Nov 2019 09:35:19 -0500 (EST)
Date: Tue, 12 Nov 2019 15:35:17 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Anthony PERARD <anthony.perard@citrix.com>
Message-ID: <20191112143517.GK18277@mail-itl>
References: <20191112141943.245215-1-anthony.perard@citrix.com>
MIME-Version: 1.0
In-Reply-To: <20191112141943.245215-1-anthony.perard@citrix.com>
Subject: Re: [Xen-devel] [XEN PATCH for-4.13] libxl: Fix
 libxl_retrieve_domain_configuration error path
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
Cc: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Anthony PERARD <anthony.perard@gmail.com>,
 Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wl@xen.org>
Content-Type: multipart/mixed; boundary="===============3962921207960864385=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============3962921207960864385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5cSRzy0VGBWAML+b"
Content-Disposition: inline


--5cSRzy0VGBWAML+b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [XEN PATCH for-4.13] libxl: Fix
 libxl_retrieve_domain_configuration error path

On Tue, Nov 12, 2019 at 02:19:43PM +0000, Anthony PERARD wrote:
> From: Anthony PERARD <anthony.perard@gmail.com>
>=20
> If an error were to happen before the last step, for example the
> domain_configuration is missing, the error wouldn't be check by the
> _end callback.
>=20
> Fix that, also initialise `lock' to NULL because the exit path checks
> it.
>=20
> The issue shows up when there's a stubdom, and running `xl list -l`
> aborts. Instead, with this patch, `xl list -l` will not list stubdom,
> probably like before.
>=20
> Reported-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab=
=2Ecom>
> Fixes: 61563419257ed40278938db2cce7d697aed44f5d
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

With this patch applied, `xl list -l` no longer crashes and only prints
this error for a stubdomain:
libxl: error: libxl_domain.c:1937:retrieve_domain_configuration_lock_acquir=
ed: Domain 11:Fail to get domain configuration

The actual HVM is listed correctly. This was the previous behavior on
Xen 4.8 too.

Tested-by: Marek Marczykowski-G=C3=B3recki <marmarek@invisiblethingslab.com>

Thanks!

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--5cSRzy0VGBWAML+b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl3KwyQACgkQ24/THMrX
1yy4xggAmt7zBluPTWyrHWto/7Wyy4MOr3yi3GJ7zGt16TuDPqSvb2eJeOs3b+9u
BvwkVwD1lN7yum6kij/OWS8X0loaNBQaaiA77PhzbmeWE2tfC4QpJ7f6N68Aicfl
vCEghwOADMfxU1dO+O0FIJjDWfYOWHCItd+kplu6HbCJRa7NszaL/F/v6Pm+EUKH
aG79yfsoWbkQmwzn9uBBpipuhZCS/I90wLE3PN+6i3gSBLSPQVBtfbuzpS/9At09
Kfo2uXMd0Cmwfc2Hze1bjnzTLnIIwCFFVDeo+Q5eSXCO8DlL2UaaFqNmm7RblYor
WAcDCH+qv+QLk8fcRwyHjmJ90ggnWA==
=Sm0W
-----END PGP SIGNATURE-----

--5cSRzy0VGBWAML+b--


--===============3962921207960864385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============3962921207960864385==--

