Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4EF4E6487
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 14:57:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294321.500391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNx9-0006Eo-6i; Thu, 24 Mar 2022 13:56:39 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294321.500391; Thu, 24 Mar 2022 13:56:39 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXNx9-0006CY-2q; Thu, 24 Mar 2022 13:56:39 +0000
Received: by outflank-mailman (input) for mailman id 294321;
 Thu, 24 Mar 2022 13:56:38 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=oofn=UD=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1nXNx7-0006CR-Or
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 13:56:37 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 37a209b3-ab7a-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 14:56:35 +0100 (CET)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A5BE5C0140
 for <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 09:56:34 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 24 Mar 2022 09:56:34 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Thu, 24 Mar 2022 09:56:34 -0400 (EDT)
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
X-Inumbo-ID: 37a209b3-ab7a-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=UMa1nviksUHshzxx13Mfy06/AQsSP41Jyx9w96vbw
	dY=; b=AejbEkavn3b2sGHf5Q0sUS/ln0qr04NRZok++WiX5N6hNlEkEptQY0HkC
	3JnRMoIl7R5KoteLNnN8Hg9491OPhWsjGAvCSrdYbSKpW4+navGljYSqmQa2joKg
	eiLiPX7lEqmsfW8yL9s0QVylxCd2kpo300swOhp+2NzWTz2idVUev3k5GjAb2o0z
	5q6DVpPv7cH6ot6nQ50yA9G6BdLmA9xJlGsXjtzDqZB1a2+6bSoZnDTYJ0tuyZCH
	fmBlEAXcAmv9OJR20T5XdPs460eOFxPh3gSwxFor6NgTAxxOVSzwx5hhKuTc7Em0
	nLrrslwJiTDcHDfGsTa0/2zjwWCJQ==
X-ME-Sender: <xms:kng8Yh3c96IEMXhgG5WqschiqU6uA6W3B99dXqRwi0aeXNIJmT8DpA>
    <xme:kng8YoHi_GvcQB6kPPjoCIN089ZFSPSj_M_u_q2D18bjHrFyfYlc0rR2sNjkKk_t-
    -hI5juX9VbVoLA>
X-ME-Received: <xmr:kng8Yh6veNJi13aFh88LANiyAEihjNahiE9QKW19_Q4nSMvUSFxZV4UVFM90>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttddvnecuhfhrohhmpeffvghmihcuofgr
    rhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrg
    gsrdgtohhmqeenucggtffrrghtthgvrhhnpedujefgjeeggeelhfevkeeltdekvdeuhfet
    iefffefhkeehhfevhefhkefgudegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhisghlvghthhhinhhgshhlrggs
    rdgtohhm
X-ME-Proxy: <xmx:kng8Yu3vQsOg_kHmKQKjJ_yPF9DNxJB9pwRRmNG0_4zmPd0qcdX_pw>
    <xmx:kng8YkHazjf9sxiCFc9QkfQlZdx_FJM8I-g526TS22bdEO1h5CbLJg>
    <xmx:kng8Yv_v-60J4wr0_swomx4YIocIR35e5rhTLO5FYrQHMutu1il7dg>
    <xmx:kng8YoTNKlNvgbrS1Qzwg7fllV6tkBdBRJfJuiKKlBRok7wvS5Hy9Q>
Date: Thu, 24 Mar 2022 09:56:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Support status of OpenBSD frontend drivers
Message-ID: <Yjx4kNv7hG4FGGot@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OvSRlnlvMHP5qRcf"
Content-Disposition: inline


--OvSRlnlvMHP5qRcf
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Mar 2022 09:56:29 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Support status of OpenBSD frontend drivers

As per private discussion with Theo de Raadt, OpenBSD does not consider
bugs in its xnf(4) that allow a backend to cause mischief to be security
issues.  I believe the same applies to its xbf(4).  Should the support
document be updated?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--OvSRlnlvMHP5qRcf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmI8eJAACgkQsoi1X/+c
IsEZfRAAjOawJff87ilrTAnWwj28MEaqydK8NCYSJHgEBhLVTSb/DQNF4gkurfPA
BbxXe5FLtNTGzV0k6GV1diyJ+Wl+XBeymjGlXVLuJpUGZ5mm9EVKpQkNvXvhdN/V
dHCd2/mwLpv8GMtcjpHJkpi5BZFBhSB0URLCdoXW2Hhzk5OQyQwUBDsZCpXTNHsR
W3lWPfkpCuGOW73CuIqTd1touG0yckKQaRJjBcnBlNS9dwdcLEC56Shz/EZWdfsK
/fifUX1GPhuqLEODvutno8NfUFPGUy2MkHX1sO2fxAd4ewy/K3C/sSYxrguoSK+N
3TmqcqW/U87PmWLuPkHxCUmO95O1czTrB+qtarlhmziH5VgLS5s1ldGjpM2vYeUx
u5DNJJ4/SkSj4Y64NdEwWSY/QIU8vmlxQcqnDheBL/kxjsBKJzaGTeEzOoKQhrNe
Lb7sNseCR+SQO2ONeGg/VQlVg850IIP50LaqyG0k2dRHmcRnrWJewkX2+nODlMkE
LZpsv4MLx+uS2vKs/vukCBkoceDhBoaXdkvy7EzriNzxXxJs0RNDCsKa/1sApEHi
Qfz+datu/6lHt5icHaBd4QuK3TEnHCdNokIElNCmQZwkXrHFBYAaE9cIZdiVn4bo
pnS+DfMx50XCqHWCr8pr/gT5j74N5UJM4VPPB90QQ2QOx2aN2BA=
=nBDZ
-----END PGP SIGNATURE-----

--OvSRlnlvMHP5qRcf--

