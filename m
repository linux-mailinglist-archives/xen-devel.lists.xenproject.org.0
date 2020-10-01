Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1C527FEB9
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 14:00:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1235.4167 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxFy-0008Sx-RS; Thu, 01 Oct 2020 12:00:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1235.4167; Thu, 01 Oct 2020 12:00:18 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNxFy-0008SY-MV; Thu, 01 Oct 2020 12:00:18 +0000
Received: by outflank-mailman (input) for mailman id 1235;
 Thu, 01 Oct 2020 12:00:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kNxFx-0008SP-K3
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:00:17 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 319ff8f1-d79c-41fa-8bca-7b67391b9f42;
 Thu, 01 Oct 2020 12:00:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 83F275C02CC;
 Thu,  1 Oct 2020 08:00:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Thu, 01 Oct 2020 08:00:16 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id 0DE763064691;
 Thu,  1 Oct 2020 08:00:14 -0400 (EDT)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=DWMX=DI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kNxFx-0008SP-K3
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 12:00:17 +0000
X-Inumbo-ID: 319ff8f1-d79c-41fa-8bca-7b67391b9f42
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 319ff8f1-d79c-41fa-8bca-7b67391b9f42;
	Thu, 01 Oct 2020 12:00:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 83F275C02CC;
	Thu,  1 Oct 2020 08:00:16 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Thu, 01 Oct 2020 08:00:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=2ydlEz
	OZ+usLXd4GScthKQJDQB3Tg8b90AhwjSeRP0I=; b=LHoDqwv40ptS4gKDkbnM2O
	Lxl47rf+AJChWNwl2KUzxFuogdQhX5meWeCDX5HPljo6OXH2QXxw7RnISLSAVgpJ
	WVdEVLFih1WrNZEC0IHuNnUDqW8uugOhoF4wBoePCp6uL2xAqNHcvVSAkO3C75VB
	B5XQ3BlKNJFd6dppRzKNCq7JLc7Ca8lzgbM0euAY8G33PQbHJqFK1tf5ENsrDzc8
	R1sI/Pft84CC7SrXkUwChMQLsCG4A1fJSSLk+Ffgty8k7Hq665/Wpfd9Gi4VgqY7
	Hea9bxJ5eUxLNRteAwSv4Lk4XMMKGgZ2DWfDRnYzeWuemOhcy+ONGSao5FtWVxjw
	==
X-ME-Sender: <xms:z8R1X45Hh5sWEb8ASk-WDJzEc9nrOK1hbdnSqFpcauPk5uVpDsBe6w>
    <xme:z8R1X54nwSWQwpB349XNqUiPTqCiV_Jkp9eSsGvNkVo62RPUBZlej9mIHQetdq9mu
    mEJiCfkI1UjwA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeggdegjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecukfhppeelud
    drieegrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
    gtohhm
X-ME-Proxy: <xmx:z8R1X3cq3h1qqh0xnjDHRzUYl8V95AyuNy9IwR8V_YGF4BtdD4DuCA>
    <xmx:z8R1X9JqVu62zYW93prOY-d3Y-3SzBSnp6MZ-N-QXCb4ZwdmjejZZg>
    <xmx:z8R1X8Lrn_DbT24RWIXrxIwzFPjMSQbxRgnG7nIJspTA2nNVEMpIoA>
    <xmx:0MR1XxXWtyfkgiVVgm2AAzHvyNmwEwrwMwOc9q5HsR8qfEKMNgHpeA>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0DE763064691;
	Thu,  1 Oct 2020 08:00:14 -0400 (EDT)
Date: Thu, 1 Oct 2020 14:00:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Yet another S3 issue in Xen 4.14
Message-ID: <20201001120010.GI1482@mail-itl>
References: <20201001011245.GL3962@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hWKK+vUwUWSC3a08"
Content-Disposition: inline
In-Reply-To: <20201001011245.GL3962@mail-itl>


--hWKK+vUwUWSC3a08
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: Yet another S3 issue in Xen 4.14

On Thu, Oct 01, 2020 at 03:12:47AM +0200, Marek Marczykowski-G=C3=B3recki w=
rote:
> Hi,
>=20
> After patching the previous issue ("x86/S3: Fix Shadow Stack resume
> path") I still encounter issues resume from S3.
> Since I had it working on Xen 4.13 on this particular hardware (Thinkpad
> P52), I bisected it and got this:
>=20
> commit 4304ff420e51b973ec9eb9dafd64a917dd9c0fb1
> Author: Andrew Cooper <andrew.cooper3@citrix.com>
> Date:   Wed Dec 11 20:59:19 2019 +0000
>=20
>     x86/S3: Drop {save,restore}_rest_processor_state() completely
>    =20
>     There is no need to save/restore FS/GS/XCR0 state.  It will be handled
>     suitably on the context switch away from the idle.
>    =20
>     The CR4 restoration in restore_rest_processor_state() was actually fi=
ghting
>     later code in enter_state() which tried to keep CR4.MCE clear until e=
verything
>     was set up.  Delete the intermediate restoration, and defer final res=
toration
>     until after MCE is reconfigured.
>    =20
>     Restoring PAT can be done earlier, and ideally before paging is enabl=
ed.  By
>     moving it into the trampoline during the setup for 64bit, the call ca=
n be
>     dropped from cpu_init().  The EFI path boot path doesn't disable pagi=
ng, so
>     make the adjustment when switching onto Xen's pagetables.
>    =20
>     The only remaing piece of restoration is load_system_tables(), so sus=
pend.c
>     can be deleted in its entirety.
>    =20
>     Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
>     Reviewed-by: Jan Beulich <jbeulich@suse.com>
>=20
> Parent of this commit suspends and resumes just fine. With this commit
> applied, it (I think) it panics, at least I get reboot after 5s. Sadly, I
> don't have serial console there.

Reading the patch and discussion about it, I think the important details
is this uses EFI boot.
That may also explain why I haven't see it while bisecting the other
S3 issue, where I use legacy boot path.

> I tried also master and stable-4.14 with this commit reverted (and also
> the other fix applied), but it doesn't work. In this case I get a hang on
> resume (power led still flashing, but fan woke up). There are probably
> some other dependencies.
>=20
> Any idea?
>=20
> PS This is different than "Xen crash after S3 suspend - Xen 4.13"
> thread, as this one broke with 4.13 -> 4.14 update.
>=20



--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--hWKK+vUwUWSC3a08
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl91xMsACgkQ24/THMrX
1yxHIQf+K/Omvv7Z88//dZRx5ByyMvNXfIDiz2VZrsyAnqtVZ95k7LwEFajI68Fh
xXlpgT1+tbRY/zVahDOKIFQ938HLhDaXE+ONITQjca102GB2Sz20aK4lGRCuLhZk
CoUgf6TIzetqt5LoF9hYjeKNoWSI0SA13qgs+NYPtFFUZ/tzQkiiFJHM+4MzDj26
btPAkAhCGBqYQ9PFqtsIeKCcksvvjJhHfb6FBC+ycrdUXUDRYPe/4EkthAscSZHX
DvxSMWDZIlwo0ITRLz0U2w2q+7xfiQ13Ws0kkczewG15FjS11L4gGnr9NnyrJB+T
Uea/eo5hV67k75EVgB4/9UTszxba0Q==
=LOsR
-----END PGP SIGNATURE-----

--hWKK+vUwUWSC3a08--

