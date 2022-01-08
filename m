Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 235414880F0
	for <lists+xen-devel@lfdr.de>; Sat,  8 Jan 2022 03:39:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254774.436642 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n61di-0001Ln-0U; Sat, 08 Jan 2022 02:39:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254774.436642; Sat, 08 Jan 2022 02:39:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n61dh-0001Jy-TY; Sat, 08 Jan 2022 02:39:29 +0000
Received: by outflank-mailman (input) for mailman id 254774;
 Sat, 08 Jan 2022 02:39:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T8k6=RY=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1n61dg-0001Js-In
 for xen-devel@lists.xenproject.org; Sat, 08 Jan 2022 02:39:28 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 328a97e9-702c-11ec-9ce5-af14b9085ebd;
 Sat, 08 Jan 2022 03:39:27 +0100 (CET)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id DB8A95C0124;
 Fri,  7 Jan 2022 21:39:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Fri, 07 Jan 2022 21:39:26 -0500
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Jan 2022 21:39:25 -0500 (EST)
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
X-Inumbo-ID: 328a97e9-702c-11ec-9ce5-af14b9085ebd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=NQvTSs
	3/vd63uTiwrJonZmwh12Z28cMqQwsuOKLz/WU=; b=RyWkCpipBMuxm4Q3sydUaj
	Juuvi8tj9VpgDgUs/nUz9DCNTs/qJf0O3rAK2sJtMvkcGCtwQZlaJ+0o/qbwOOpg
	qbD+gC3JRdARsfJxNXDfSNZHFWLjGvLSaOLvpoiAgnnbHrCRtgoF1LwIJXxAuPCj
	nx6pUa+G35vmFBtnaBfT24T5wA14uR87tJVjLlBo9iYkvXVv81rP0OGAWkk9PJFM
	jxdRzeD/aJQz6HYRaXdq4O+/8EPqWfeLDBdqNwwdXyvq94P1Dl8Sef816XVLj6Oe
	0aWzQm5T8Okxjmx+wl2eCupC0uv3KuzTyxc3RrhbjH1YAji2S5+RYyuGcU11F0Mg
	==
X-ME-Sender: <xms:XvnYYelCSDkxZwYz4h3VA6Lel9PLJ-Ghi1ppTMBx_fULL_FbiUk3eQ>
    <xme:XvnYYV3vo1Quo7xgduUsOqk2PCEF9BBmbf8L97GbKiWYiKAW9AxG5DzohB0xeK-t7
    GvsONhpV-vNpg>
X-ME-Received: <xmr:XvnYYcrQ9pm_P9KqbbTSzq7tFCtT-AUB7151VnDtStpRs-05H1Q8P4MlNrFUkjqIE64KujSvc1DI1Bf_iTsPhbIYDcS1twwT>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrudegfedggeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:XvnYYSnOxzgMzIqYFyinRm75AxPNYyc5s0zdErNIWLzYCUeKKVaPVQ>
    <xmx:XvnYYc1hW4gLTeriiS4CokoEEot2UGbvHC-6fVTrjGGqqbr4HY_kug>
    <xmx:XvnYYZtuqZjM1aMDV6RDOatIkkgoC9FfAwsKNRlH_77WrTPg4eTocg>
    <xmx:XvnYYWo04HhSFSWDIcOnb-i6cBebS5NrfenZSsYjpXAf-4_YViTtdQ>
Date: Sat, 8 Jan 2022 03:39:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org,
	Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 6/7] xenstored: do_introduce: handle the late_init
 case
Message-ID: <Ydj5WW6bBp6hMTOL@mail-itl>
References: <alpine.DEB.2.22.394.2201071614090.2060010@ubuntu-linux-20-04-desktop>
 <20220108004912.3820176-6-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BfLtsGd9IOVKQ1Fe"
Content-Disposition: inline
In-Reply-To: <20220108004912.3820176-6-sstabellini@kernel.org>


--BfLtsGd9IOVKQ1Fe
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 8 Jan 2022 03:39:21 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, julien@xen.org,
	Bertrand.Marquis@arm.com, Luca Miccio <lucmiccio@gmail.com>,
	Stefano Stabellini <stefano.stabellini@xilinx.com>, wl@xen.org,
	Anthony PERARD <anthony.perard@citrix.com>,
	Juergen Gross <jgross@suse.com>
Subject: Re: [XEN PATCH 6/7] xenstored: do_introduce: handle the late_init
 case

On Fri, Jan 07, 2022 at 04:49:11PM -0800, Stefano Stabellini wrote:
> From: Luca Miccio <lucmiccio@gmail.com>
>=20
> If the function is called with late_init set then also notify the domain
> using the xenstore event channel.
>=20
> Signed-off-by: Luca Miccio <lucmiccio@gmail.com>
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> CC: wl@xen.org
> CC: Anthony PERARD <anthony.perard@citrix.com>
> CC: Juergen Gross <jgross@suse.com>
> CC: julien@xen.org
> ---
>  tools/xenstore/xenstored_domain.c | 15 ++++++++++-----

Isn't the same necessary in oxenstored too? Otherwise, I think it needs
some explicit documentation, that late PV with dom0less requires
cxenstored.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--BfLtsGd9IOVKQ1Fe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmHY+VoACgkQ24/THMrX
1ywU7Af/Y2pD/TELodChRmqiUpd2e3uWzmJmuxCzLVU3DnXs/sj/OHoSlbrVkuUb
BNX4X+eGjFC7RR5BGZ5wWihqgp+0C5Q1RBFxkIAReTR3rFDZEDORCrXy+MolPSSa
/u+g4tCy9hifRRTXfqc0SVLCjK+hmnM/iS78DSaVoc7B7f0gTMUnmgt9bav17dK1
uiJyS+9Hen2ZDLnlp1YJPFC6fY8tMOsMJjrzj16+V9Qfu1ss+pX85UvfepzacXzT
ysD61QAXnLnmA0YR34pkoxDCX+a4pEQbsUNiLLToeJtW2mQjj0o1ltJZnhPtoD7U
d0CMg5kVDLJRNFNL7GTksQacOAzfbw==
=S7J7
-----END PGP SIGNATURE-----

--BfLtsGd9IOVKQ1Fe--

