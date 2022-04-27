Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DC07151222C
	for <lists+xen-devel@lfdr.de>; Wed, 27 Apr 2022 21:09:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.315409.533949 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njn1r-00083I-64; Wed, 27 Apr 2022 19:08:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 315409.533949; Wed, 27 Apr 2022 19:08:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1njn1r-00080T-2K; Wed, 27 Apr 2022 19:08:47 +0000
Received: by outflank-mailman (input) for mailman id 315409;
 Wed, 27 Apr 2022 19:08:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sNsI=VF=invisiblethingslab.com=demi@srs-se1.protection.inumbo.net>)
 id 1njn1o-00080N-Sj
 for xen-devel@lists.xenproject.org; Wed, 27 Apr 2022 19:08:45 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 73d8d129-c65d-11ec-a405-831a346695d4;
 Wed, 27 Apr 2022 21:08:43 +0200 (CEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 9C70C5C0232;
 Wed, 27 Apr 2022 15:08:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 27 Apr 2022 15:08:41 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 15:08:40 -0400 (EDT)
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
X-Inumbo-ID: 73d8d129-c65d-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1651086521; x=
	1651172921; bh=fsebkSD5sPqk3pdhzdwrcbmGClEPrZ02djtT55h4Sbw=; b=b
	iI3XI8gLOa7mCyy8bgGGjXrD/11XxGfHfOhUziPBEf70ZxDo6x6WmEUK+d3zz3Zj
	K9AySLDAODlc3Rm9yNV95nw6HFdA9LcBmhDQ+3GpvLeXS01nUfANo9wAfQqCarRF
	QkDFge/InPYJD0Yz1dCRwWyQ5LN2nOw9dqWImgZc0LF1Uvu+Z7BpjbcTbdixBsz+
	bzLn7CE4n5Lm3/DZ1cGP6AVH0YuVaYa4IWQB407BWaqTwmdkd/VmOQQb+0nLxhWn
	sWCI9BDCMt7vspH7LeQ2NrAAvAU8T/JHOlofH+pyqBvWw49goRcsDfCTBkHlhRq4
	oeuv1lfD5HVUognwgdIDg==
X-ME-Sender: <xms:uZRpYqsVFFulJNK6G8Ez4dJlRr-UJebHboicJigjO-P3P-OaJBBotA>
    <xme:uZRpYvf3nl6lSQ6ApV78PeTMuxQ-26qa4nY0sZ_hQRKotJaXdAbSzNuaYHVLY24h5
    6sUi_1J8NygouY>
X-ME-Received: <xmr:uZRpYlzWi90X54F822fYN4Uvdhy0qqoSwv1WK2Ee_dgSHvhZGMUxTgnKDOsw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudehgddufeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggujgesghdtroertddtvdenucfhrhhomhepffgvmhhi
    ucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvihhsihgslhgvthhhihhngh
    hslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepiefgudefjedujeelvddtgfegueei
    hfeugfdtgfevkedtkefgledvtddvvdekheeknecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhs
    lhgrsgdrtghomh
X-ME-Proxy: <xmx:uZRpYlNZ1KBZm0B_vNoelfqRfsJH7t1Mr2R14FLCNTD_qKVL5MzyCQ>
    <xmx:uZRpYq9ectGKHB5hWwJvSW-UIpOcNUvtQk7O-Hrr0SRZNRgaDpD1Ig>
    <xmx:uZRpYtUm_nozezwuZWV9wn4rzkskzLNyIAEgbvegY-PHc2TjZ5W1sw>
    <xmx:uZRpYhn69_wYZDn9r_b4Jc15tYDogca2lYnAFKm-xVev-zUugP3VzQ>
Date: Wed, 27 Apr 2022 15:08:36 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT
Message-ID: <YmmUtiBkhEYvXHUB@itl-email>
References: <Yl7aC2a+TtOaFtqZ@itl-email>
 <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="28Yvb+XBgtt99NWg"
Content-Disposition: inline
In-Reply-To: <3591eec7-1299-8783-26ad-ffe27bb9fdcd@suse.com>


--28Yvb+XBgtt99NWg
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 27 Apr 2022 15:08:36 -0400
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	George Dunlap <george.dunlap@citrix.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
	xen-devel@lists.xenproject.org
Subject: Re: [PATCH v3 3/4] Add a new hypercall to get the ESRT

On Wed, Apr 27, 2022 at 10:56:34AM +0200, Jan Beulich wrote:
> On 19.04.2022 17:49, Demi Marie Obenour wrote:
> > This hypercall can be used to get the ESRT from the hypervisor.  It
> > returning successfully also indicates that Xen has reserved the ESRT and
> > it can safely be parsed by dom0.
>=20
> I'm not convinced of the need, and I view such an addition as inconsistent
> with the original intentions. The pointer comes from the config table,
> which Dom0 already has access to. All a Dom0 kernel may need to know in
> addition is whether the range was properly reserved. This could be achiev=
ed
> by splitting the EFI memory map entry in patch 2, instead of only splitti=
ng
> the E820 derivation, as then XEN_FW_EFI_MEM_INFO can be used to find out
> the range's type. Another way to find out would be for Dom0 to attempt to
> map this area as MMIO, after first checking that no part of the range is =
in
> its own memory allocation. This 2nd approach may, however, not really be
> suitable for PVH Dom0, I think.

On further thought, I think the hypercall approach is actually better
than reserving the ESRT.  I really do not want XEN_FW_EFI_MEM_INFO to
return anything other than the actual firmware-provided memory
information, and the current approach seems to require more and more
special-casing of the ESRT, not to mention potentially wasting memory
and splitting a potentially large memory region into two smaller ones.
By copying the entire ESRT into memory owned by Xen, the logic becomes
significantly simpler on both the Xen and dom0 sides.

Is using ebmalloc() to allocate a copy of the ESRT a reasonable option?
Is it possible that the ESRT is so large that this causes boot to fail?
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--28Yvb+XBgtt99NWg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdodNnxM2uiJZBxxxsoi1X/+cIsEFAmJplLYACgkQsoi1X/+c
IsELRxAAiVq6ooCV4gTIqbiLlR5u2ESbwEYr4Zay7q6UkOJnosEMo97FGHHsjycp
MUMN3xPna+UXzf36EAz64CKlC9RVahhEIShnB7Dp2yQmBRvqURyD9VqrC2oSZq8M
2De7syyjEfINXRXBxR7TxSpljB0HKL5/OekmQ7t3Yz1KKF423PgG4nheepGgVjVd
DkNmKxPO1Ndi7myw3/O3S9JW+8hPbUCr0XswZOCyIZngN7RXTZ8GhcriYF8Ip2zT
GuhJg6BvNcZszScXwWj3X5Dnrj8B6/PrGinhPvs/oK3Il0MfHu+PcNsICo6o1B0Q
piRQ5Iql+ISSHlSse0rUlSAsc/YXP+jxVUBPZ44ZuuQFXIGiCedZ0k2UrWejWBGs
sYWwlCEXxr2q216RaNJfICZ9SeStb1PeWo0pCZouS3iC4KCVB0LzLOfTmbdNpzSi
PsXhZTC6f4gyjE+nSICLwtaEJl8Un8CUL49Nd6iJWMDsdOEqDKC01QgHU3Ica3Em
7c7hSE3/Nl3CfNL6yZyJsL97MzdmL0SYie3AsinhqfUIF7Jys9KKjtS/9ceu4DaP
Q/qa9JzJXZnIE2IxqvRAutJAIPLrwhmT5zTP8IFj2xEsqrzcX6z3lwVEBd5dDl1K
cLrX9ThWo7IHKIi4wNCyL9wJB+qIFDBjOD1owavuCuzYK5yM+5o=
=HSAP
-----END PGP SIGNATURE-----

--28Yvb+XBgtt99NWg--

