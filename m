Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 155174E6A9C
	for <lists+xen-devel@lfdr.de>; Thu, 24 Mar 2022 23:21:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.294515.500827 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXVpT-0001iE-KD; Thu, 24 Mar 2022 22:21:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 294515.500827; Thu, 24 Mar 2022 22:21:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nXVpT-0001gB-G7; Thu, 24 Mar 2022 22:21:15 +0000
Received: by outflank-mailman (input) for mailman id 294515;
 Thu, 24 Mar 2022 22:21:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=TFZE=UD=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nXVpS-0001g5-9l
 for xen-devel@lists.xenproject.org; Thu, 24 Mar 2022 22:21:14 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b582812b-abc0-11ec-8fbc-03012f2f19d4;
 Thu, 24 Mar 2022 23:21:12 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id A438E3200F81;
 Thu, 24 Mar 2022 18:21:09 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 24 Mar 2022 18:21:09 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 24 Mar 2022 18:21:08 -0400 (EDT)
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
X-Inumbo-ID: b582812b-abc0-11ec-8fbc-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zSmOaTjKgF1zD872f
	y8X4xW3i1h1CKcBxR4DGXJ3Xo0=; b=WzBsatHgfvMxW+mmEWOqtOJGc/3vxC4Fz
	jkUMwCron1NpsOyAM4Jr9e8yYcfxqNUqgGs1VLlP94IrWZB+JlPDVlfoBNjuRWyg
	XgjSCZIPBS5KBudENmKNDxOB9jwt9P3YtSkg4oN8eBys39kO+70sFTeuajt1iLGo
	1JDdYVJ06wKETzxjWPS1sO/F2B1CV1r44PhAIA2D9RziVUX2S95tFZfxZmZ+IEbZ
	Or6tbmxMP7bpSX4KOOttUkwELHEWyragBuBbRGfP2FCt6ZphZhcP1KATsNpuQ9tW
	AbcmclC9srQ1rAtseey8P1OyBca6veaOaAhGbaTxwTtcUcl8IajYQ==
X-ME-Sender: <xms:1e48YpHCbUutlE7j3YZKkWNXXPDsxpGkFI3Bns7BrAS81ROWPRP7Mg>
    <xme:1e48YuU5LB5un-xAaHwW-eCe8NdZuXR2J3ztbT_KVDahhaMYYyfoNw22Zl6HUVoeu
    4fhIrVrvje7qQ>
X-ME-Received: <xmr:1e48YrK8VIFmKp5MGkZXqo-GuUyXQKNSNtLldyVpvdsigK21_EyzffjBa8rLN0VbXKHNxgchjH6OB68Fg1g19iYFJrRd7KmGZQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudegledgudehjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgv
    khcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinh
    hvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteev
    ffeigffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghk
    sehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:1e48YvGvl8fMAckPQvhJnDWygX93wkm18CuOkLPDlD9Xpm8sXC1huw>
    <xmx:1e48YvUzGLAsrHbr5zu8bgsri7Un824RkU_HJ6YsX15LotJCNwLUXQ>
    <xmx:1e48YqPZvpUZA-Z4rQE07sk-B4IzC2N6hzQFRWppR__QL1Ln86MeNQ>
    <xmx:1e48Ygf-JUkXjhgOpYO3GgsDXuNz-HEGrwxd0e90YtXj9K8IHgIs1A>
Date: Thu, 24 Mar 2022 23:21:05 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Support status of OpenBSD frontend drivers
Message-ID: <Yjzu0Zz8HCu/9mFg@mail-itl>
References: <Yjx4kNv7hG4FGGot@itl-email>
 <Yjx8G5tH4Xf8+oVx@Air-de-Roger>
 <f101f6f6-d6d3-4877-20a4-ebae0130c756@invisiblethingslab.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="VvCUMnsIOvIQLhde"
Content-Disposition: inline
In-Reply-To: <f101f6f6-d6d3-4877-20a4-ebae0130c756@invisiblethingslab.com>


--VvCUMnsIOvIQLhde
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 24 Mar 2022 23:21:05 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Demi Marie Obenour <demi@invisiblethingslab.com>
Cc: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>
Subject: Re: Support status of OpenBSD frontend drivers

On Thu, Mar 24, 2022 at 11:49:14AM -0400, Demi Marie Obenour wrote:
> On 3/24/22 10:11, Roger Pau Monn=C3=A9 wrote:
> > On Thu, Mar 24, 2022 at 09:56:29AM -0400, Demi Marie Obenour wrote:
> >> As per private discussion with Theo de Raadt, OpenBSD does not consider
> >> bugs in its xnf(4) that allow a backend to cause mischief to be securi=
ty
> >> issues.  I believe the same applies to its xbf(4).  Should the support
> >> document be updated?
> >=20
> > I think that's already reflected in the support document:
> >=20
> > 'Status, OpenBSD: Supported, Security support external'
> >=20
> > Since the security support is external it's my understanding OpenBSD
> > security team gets to decide what's a security issue and what is not.
> >=20
> > That however creates differences in the level of support offered by
> > the different OSes, but I think that's unavoidable. It's also hard to
> > track the status here because those are external components in
> > separate code bases.
> >=20
> > Could be added as a mention together with the Windows note about
> > frontends trusting backends, but then I would fear this is likely to
> > get out of sync if OpenBSD ever changes their frontends to support
> > untrusted backends (even if not considered as a security issue).
>=20
> As a Qubes OS developer, I still think this is useful information and
> should be documented.  For instance, if I choose to add proper OpenBSD
> guest support to Qubes OS (as opposed to the current =E2=80=9Cyou can run
> anything in an HVM=E2=80=9D situation), I might decide to have OpenBSD
> guests use devices emulated by a Linux-based stubdomain, since the
> stubdomain=E2=80=99s netfront and blkfront drivers *are* security-support=
ed
> against malicious backends.  I might also choose to have a warning in
> the GUI when switching the NetVM of an OpenBSD guest to something other
> than the empty string (meaning no network access) or the (normally
> fairly trusted) sys-firewall or sys-whonix qubes.

I'm with Roger on this - when security support is external, such
information in xen.git could easily become stale. If anything, there
could be a link to OpenBSD security status info, maintained by whoever
such support provides.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--VvCUMnsIOvIQLhde
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmI87tEACgkQ24/THMrX
1yzGkAf/ZwdWdiOFGAuhBNltUlvKnPWBn0VQcfLdjmWXmM+PMQ1XZfLIP/P+6Onk
uOr5vcft2faF3Q2DR3BCTrIlHZq65TiiIUzy0ReGm+s0aVt2uIDQEVGDFdz8zhD9
HB1S7fpjdNz9eHQn3up4cvgOJQcOLcNhf8bvC593Hr3KnRjTO1hdhKtx4Z9VQg39
CGh2eTiRpblXCtrkDfrLvKMZPiSmFvi98X6sHWzFVOZ/2Gl2JiCby5UkUToZDlHd
J32CdB7HSFpqU4iLPkWCFypL3smvC5PPA1/sj/vWoHh/rmrpAs/weMSXarPtLYkg
iKFFYxx0HO/7VqNuMu1bwHH5Sx6N9A==
=dC/k
-----END PGP SIGNATURE-----

--VvCUMnsIOvIQLhde--

