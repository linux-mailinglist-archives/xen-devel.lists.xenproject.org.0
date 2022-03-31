Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 339A74ED9B6
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 14:36:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296933.505624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZu2J-0005da-GJ; Thu, 31 Mar 2022 12:36:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296933.505624; Thu, 31 Mar 2022 12:36:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZu2J-0005bD-Ch; Thu, 31 Mar 2022 12:36:23 +0000
Received: by outflank-mailman (input) for mailman id 296933;
 Thu, 31 Mar 2022 12:36:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuZR=UK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nZu2H-0005b7-Mv
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 12:36:21 +0000
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 2a90a039-b0ef-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 14:36:20 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id A13D75C01A7;
 Thu, 31 Mar 2022 08:36:19 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Thu, 31 Mar 2022 08:36:19 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 31 Mar 2022 08:36:18 -0400 (EDT)
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
X-Inumbo-ID: 2a90a039-b0ef-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lL3fG21Bf+IQhMNp2
	gwZWgcIcXYyRS4yRWBGEJPLa7M=; b=CO7QIHIjfgqgrUQd42gh7vl6ZXEZkmySO
	uNUdtClcs+CQRxYCLGnNKR2Y1sKEI2A5DySTmaWRIDjUqqOfPXq6lclWML40+472
	UvbBU31fgEuj2PR0s7HIgGaw2wT8Sw8AoUOo+w/SE75nb5IVMC/XOi6IMlG7GBXX
	qc3x3qOB3YmKyrgh7KZTKQ364kvuJGz0zwhVeTVgl14c7yCGgyp68S54T2KrW0tM
	j186SN39Vz8HuCqD5j50yqoPjQGpflmj7rT874HNYmroJnehplpnicDfJhpTwklJ
	b9OzMuDCbR8LA2csxP+nHQhkPRgCUX6wHdOJH9HtctKFQwApKv2cw==
X-ME-Sender: <xms:Q6BFYmYmbGfqaCTKrGlZDTJW-CA9wbpoWqhA3SDh79B5jodHIfVagg>
    <xme:Q6BFYpYZilV0i6No6b6Rv467ha3hQD6xNvQKahPtWiYGTF42SqdeChvVpOx2ZSeLW
    b3GbjRUiarnJw>
X-ME-Received: <xmr:Q6BFYg8BciBLno624YjvCrCLPGseSY7FofAf4gI1SDeBYaDqHX5KUquu12leUsNtgMZkpUDBlgxiT0PkH5nZizTXeYsCp5nGHg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeigedgheefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:Q6BFYopZNX6oWHFe_UNABOMxngvO--qFPtO6JpXoHvp71o9gAc_v9Q>
    <xmx:Q6BFYhrgpB5c1Uc42QXyxgJgnzWeaiqCpRPm_XkRnNbbCRNigjEN8A>
    <xmx:Q6BFYmRjadIoK-aEpSWSKb15pK3RB_XwWCjPT6ET2yNkEIEDW3dHBg>
    <xmx:Q6BFYjGpIxkkO4sSFy0sBZ8QnMcyRncCq-6wmB5drf7I_t1JDlE85Q>
Date: Thu, 31 Mar 2022 14:36:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem
Message-ID: <YkWgQNKK7SarjKDN@mail-itl>
References: <YkUlLvnEDdc5hwN4@mail-itl>
 <2684376b-3ae6-a2b7-581f-2bd38ab6056b@suse.com>
 <YkWYGFJ/Cl+B2C37@mail-itl>
 <362b6115-e296-e01e-520f-31a0826426eb@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JyBv0FZkKPmuVRTm"
Content-Disposition: inline
In-Reply-To: <362b6115-e296-e01e-520f-31a0826426eb@suse.com>


--JyBv0FZkKPmuVRTm
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2022 14:36:15 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: Increasing domain memory beyond initial maxmem

On Thu, Mar 31, 2022 at 02:22:03PM +0200, Juergen Gross wrote:
> Maybe some kernel config differences, or other udev rules (memory onlining
> is done via udev in my guest)?
>=20
> I'm seeing:
>=20
> # zgrep MEMORY_HOTPLUG /proc/config.gz
> CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
> CONFIG_MEMORY_HOTPLUG=3Dy
> # CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE is not set
> CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
> CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512

I have:
# zgrep MEMORY_HOTPLUG /proc/config.gz=20
CONFIG_ARCH_ENABLE_MEMORY_HOTPLUG=3Dy
CONFIG_MEMORY_HOTPLUG=3Dy
CONFIG_MEMORY_HOTPLUG_DEFAULT_ONLINE=3Dy
CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy
CONFIG_XEN_MEMORY_HOTPLUG_LIMIT=3D512

Not sure if relevant, but I also have:
CONFIG_XEN_UNPOPULATED_ALLOC=3Dy

on top of that, I have a similar udev rule too:

SUBSYSTEM=3D=3D"memory", ACTION=3D=3D"add", ATTR{state}=3D=3D"offline", ATT=
R{state}=3D"online"

But I don't think they are conflicting.

> What type of guest are you using? Mine was a PVH guest.

PVH here too.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--JyBv0FZkKPmuVRTm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJFoEAACgkQ24/THMrX
1yycqQf7BK5jUyG4YSdhQTvYEB0asjxQfiMtQ5n5Rh5qRS3NZdIANwYlpFb0jRq9
+2ksM730Mr2sTfFVYDRemWR24rKXSS5RcRvQU0lqDzEQYy2PidwY093B4k5U1fQt
rhwvDz6fOhSwcNP4Ysl53+6JtiaTVJ8RuZuUmpifDzF9L/o4wVA5vSIwdhVXdjL8
09VZ1/kU17C71Zj7YuMJK0iu9SacdmRNrNHVI5Kw1G/NX0nY51i5PsQMrV1ZFO8P
FHLcRyg+wxg+7vbfpwY91P8cLQLqzxqxpfSFjNF59AWXddgb8zBM+b3ukY9o8+ef
VXykPTgXaNitxSXJpNuAqNxZDJXTkA==
=YezF
-----END PGP SIGNATURE-----

--JyBv0FZkKPmuVRTm--

