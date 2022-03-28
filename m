Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 181FC4E8BF9
	for <lists+xen-devel@lfdr.de>; Mon, 28 Mar 2022 04:13:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.295279.502394 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYet9-0002tJ-DV; Mon, 28 Mar 2022 02:13:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 295279.502394; Mon, 28 Mar 2022 02:13:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nYet9-0002qN-9i; Mon, 28 Mar 2022 02:13:47 +0000
Received: by outflank-mailman (input) for mailman id 295279;
 Mon, 28 Mar 2022 02:13:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=GJzZ=UH=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nYet7-0002qD-Sh
 for xen-devel@lists.xenproject.org; Mon, 28 Mar 2022 02:13:45 +0000
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b194f621-ae3c-11ec-a405-831a346695d4;
 Mon, 28 Mar 2022 04:13:44 +0200 (CEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 117CF5C022E;
 Sun, 27 Mar 2022 22:13:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 27 Mar 2022 22:13:44 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 27 Mar 2022 22:13:32 -0400 (EDT)
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
X-Inumbo-ID: b194f621-ae3c-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=g/9SHO1l6D+aiBnug
	Ns0qQ04w6ZbR7RJhoEXQhWGLx0=; b=BG6THnWaXNaCnw+deH4I4pHR0aDX8YOwe
	LIjjOjZGd3RKWLYpz2slKBS/HqfWn4D7krPtGmw13VDTBHlGT7EeXcMVPofg/k0i
	xojWmU+8h3IlVDUYYZXxhQbxj3qcgSZ+13OHTnaXDImYMU4yyw5WDU/QreS7pE/v
	Ntc3zs85VQauG3yUgMdTU8zfkp57QDfTtXg6qhb1u57WZlVRR7VqDTvUD8SMvUrz
	YTtHVSm3Q50qFVWBe3Pqkt+t/7BpXUfFER2aGH4jdMncJdWuSrutXBGfuEqUfy9J
	p3EINCJfHx+Wlu7Wu7Vfz88kn5mcZYdnytpqMjm6QNBH79JUqmrLw==
X-ME-Sender: <xms:1xlBYlXY76Y08mioIzsTzZ-UhO-WNOth2y3NKnoeULJ7QEwK_lh_ig>
    <xme:1xlBYlmWzfwBWmjT7q9WXiKlVTz6vtFrI6ePACAuTvjohjgeks2zU4yjO7PMi8Zsi
    4yY86VsNav-Ag>
X-ME-Received: <xmr:1xlBYhZSCRjDP7328iFgi1zyvlbmvSYdzjInH5H5b9IfXd1pAgctyYmsgIZzrg4ff7CtW7gIj5PvodndlSbEbJb7G6bnXj503Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehiedgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeekfedt
    kefggedugfdvgfegtdelveektdekgfejteegveeijeeutdeuvedulefgffenucffohhmrg
    hinhepgigvnhhprhhojhgvtghtrdhorhhgpdhquhgsvghsqdhoshdrohhrghenucevlhhu
    shhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkh
    esihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:1xlBYoUj46DboZ08X5t6gRNuNUA8I0BFb5clW6irPsyz_z4SazsZtw>
    <xmx:1xlBYvlhf-OLGfGcjxS32tUWu5RiKss1oaFCjjqXhC3ZbNAh2NLmgw>
    <xmx:1xlBYlcJtQ8kRTZ19dyRZuTIy9xdXSzg-zNY-aqbpL10actzD2oAQQ>
    <xmx:2BlBYkxVDf4DFzCpG0cO_fw_B1k3Mi2dnA5PtxGA7aWS55_1HbocXQ>
Date: Mon, 28 Mar 2022 04:13:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Damien Miller <djm@mindrot.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)
Message-ID: <YkEZymbp7dZrXYvp@mail-itl>
References: <Yj3qW/y20htoSvuK@itl-email>
 <37a4b6-cd56-1993-be2-b5522b9aa4d7@mindrot.org>
 <YkEZjYJOcjaRhP89@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/7K1JpZ8qb9pCh5L"
Content-Disposition: inline
In-Reply-To: <YkEZjYJOcjaRhP89@mail-itl>


--/7K1JpZ8qb9pCh5L
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 28 Mar 2022 04:13:29 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Damien Miller <djm@mindrot.org>
Cc: Demi Marie Obenour <demi@invisiblethingslab.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	OpenBSD technical mailing list <tech@openbsd.org>
Subject: Re: Security support status of xnf(4) and xbf(4)

On Mon, Mar 28, 2022 at 04:12:29AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> On Mon, Mar 28, 2022 at 12:45:24PM +1100, Damien Miller wrote:
> > On Fri, 25 Mar 2022, Demi Marie Obenour wrote:
> >=20
> > > Linux=E2=80=99s netfront and blkfront drivers recently had a security
> > > vulnerability (XSA-396) that allowed a malicious backend to potential=
ly
> > > compromise them.  In follow-up audits, I found that OpenBSD=E2=80=99s=
 xnf(4)
> > > currently trusts the backend domain.  I reported this privately to Th=
eo
> > > de Raadt, who indicated that OpenBSD does not consider this to be a
> > > security concern.
> > >=20
> > > This is obviously a valid position for the OpenBSD project to take, b=
ut
> > > it is surprising to some (such as myself) from the broader Xen
> > > ecosystem.  Standard practice in the Xen world is that bugs in fronte=
nds
> > > that allow a malicious backend to cause mischief *are* considered
> > > security bugs unless there is explicit documentation to the contrary.
> > > As such, I believe this deserves to be noted in xnf(4) and xbf(4)=E2=
=80=99s man
> > > pages.  If the OpenBSD project agrees, I am willing to write a patch,
> > > but I have no experience with mandoc so it might take a few tries.
> >=20
> > Hang on, what is a "malicious backend" in this context? Is it something
> > other than the Xen Hypervisor? If not, then it seems not to be a useful
> > attack model, as the hypervisor typically has near-complete access to
> > guests' memory and CPU state.
>=20
> No, Xen supports running backends for PV devices in arbitrary domain,

*Yes

> not only dom0. You can read more about it at
> https://wiki.xenproject.org/wiki/Driver_Domain
> See also Andrew's response, Xen is way more disaggregated than KVM.
>=20
> Qubes OS makes heavy use of this feature - for example network traffic
> never passes through dom0 (which has no network interfaces at all!). You
> can read more about it at the link below (especially look for the
> diagram at the end, if you want just a quick look):
> https://www.qubes-os.org/doc/architecture/
>=20
> --=20
> Best Regards,
> Marek Marczykowski-G=C3=B3recki
> Invisible Things Lab



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--/7K1JpZ8qb9pCh5L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJBGcoACgkQ24/THMrX
1yyLYAf/VUZjPtfmtzbij4ukxLLV2wcEg/JSGKeEksF/vcBcvhGbSiClIFgdE6vy
SenbCBFkyabAuOieoM5RO5UFC8DvhJSptSnWmU3feG5QVHYsXG6xpWZgh+aaEZQC
cF/5GL44iAjUx777qHKHbE4374Vp80vvVJcPNNghHL6nUuWkNnrCwSqOdK6KwsE3
sroKDQrK6S/3PS1kU2I9bT5emlbLCwh6gSXdavQ6n25J3ZVEfvgLP78lsXk3uiEj
jbItFTLOKDDsdqO/hd6fklLfkF8N9mohjvA55gPxc9VW8wSZE7HOynIkZRk7lrdE
9ZcAbpJ7RKchyWHOe4FV/t9x9Hw/DA==
=6zNz
-----END PGP SIGNATURE-----

--/7K1JpZ8qb9pCh5L--

