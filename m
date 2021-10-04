Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA24442080F
	for <lists+xen-devel@lfdr.de>; Mon,  4 Oct 2021 11:15:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201234.355660 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXK3G-0007RZ-VN; Mon, 04 Oct 2021 09:14:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201234.355660; Mon, 04 Oct 2021 09:14:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXK3G-0007Pm-RQ; Mon, 04 Oct 2021 09:14:26 +0000
Received: by outflank-mailman (input) for mailman id 201234;
 Mon, 04 Oct 2021 09:14:25 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VfnQ=OY=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mXK3F-0007Pg-4B
 for xen-devel@lists.xenproject.org; Mon, 04 Oct 2021 09:14:25 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 773c1766-24f3-11ec-bea7-12813bfff9fa;
 Mon, 04 Oct 2021 09:14:23 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 9CBD05C00DF;
 Mon,  4 Oct 2021 05:14:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Mon, 04 Oct 2021 05:14:23 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Oct 2021 05:14:22 -0400 (EDT)
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
X-Inumbo-ID: 773c1766-24f3-11ec-bea7-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=FsTLAS
	qaOF28jU4O+Te0Kc4zpL99ewTaWCNEN3wKHR4=; b=P13CN9LJGdcQVK/cjUo298
	Z87hHI2kb3MWrgorjfF21xJSIiHb5SNTWCc5PKoWBdCZ/GjdjKEpjL3KwFTr6Orx
	M36JGjRq1WvoH/83g1bisIpRaLho50BclkOKHg7RoLu2pGRVEYeiV3IsbYVo3m9j
	L4HqLrVmGcmNRdc+xFXZQhnY4KdwRq6+36USYd/9Ud/yrdeO4vJSuDrAtp4TrWut
	3DUaGjyK1n9BsH8yr1dMeMX3i09d9x6Lkc6z1NopCO32RimDPaslivaI837ipz42
	yITd6ehfE47wpFNYhOg9M4GK/sHVa5NakP8Ty2wyiQ1tmeYj1d4kQVGfixSW5kyg
	==
X-ME-Sender: <xms:78VaYc3ByFQEtMQiBJoymjSiSjzW2jjsYtNagbPMG-ezekwsrazkIw>
    <xme:78VaYXHOii4INI7VUFxiz_N9QvQ936uz8O_gx56N5jIe4osrGeb4IZB4mrMwMO2ub
    9nSo09GODwYIg>
X-ME-Received: <xmr:78VaYU7EH8wvAt5B0Z3v8w5LQS6QUR4R-5GrqWMKq1umcOt48zRT5jz4l9k37qlOBQi7TLygSz9HEf5cdYZf-24K7zgdoyHs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudelvddgudduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
    iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucevlhhush
    htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhes
    ihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:78VaYV0VsFQPRHCyQqH3UOVenzfIucuRRN3sQvis5eKhEaNOKDFCug>
    <xmx:78VaYfFqKtZATjjyVGfdZ2aTSQnd1eEj8_CMM3_XiK9re6nF8LO0cg>
    <xmx:78VaYe-qNmEDO00E0riRd_odCVQIzDwTBhYpjOiTJLsM5n1WUwKWlA>
    <xmx:78VaYSPdlwT0nbwLnlOrKiE0GJbH66NhlFAW46bZAGCIcS-M-00KdA>
Date: Mon, 4 Oct 2021 11:14:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150
Message-ID: <YVrF65BAVsXTgRsd@mail-itl>
References: <YVk11h2l/u4GJNv0@mail-itl>
 <37c22c61-80be-fc48-18e6-2b1ee22cc765@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="m5hzGpkATQskl05r"
Content-Disposition: inline
In-Reply-To: <37c22c61-80be-fc48-18e6-2b1ee22cc765@suse.com>


--m5hzGpkATQskl05r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 4 Oct 2021 11:14:18 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: xen-balloon thread using 100% of CPU, regression in 5.4.150

On Mon, Oct 04, 2021 at 07:31:40AM +0200, Juergen Gross wrote:
> On 03.10.21 06:47, Marek Marczykowski-G=C3=B3recki wrote:
> > Hi,
> >=20
> > After updating a PVH domU to 5.4.150, I see xen-balloon thread using
> > 100% CPU (one thread).
> > This is a domain started with memory=3Dmaxmem=3D716800KiB (via libvirt)=
=2E Then,
> > inside, I see:
> >=20
> > # cat /sys/devices/system/xen_memory/xen_memory0/target_kb
> > 716924
> > # cat /sys/devices/system/xen_memory/xen_memory0/info/current_kb
> > 716400
> >=20
> > Doing `cat info/current_kb > target_kb` "fixes" the issue. But still,
> > something is wrong - on earlier kernel (5.4.143 to be precise), it
> > wasn't spinning, with exactly the same values reported in sysfs. It
> > shouldn't run in circles if it can't get that much memory it wants. I
> > strongly suspect "xen/balloon: use a kernel thread instead a workqueue"
> > or related commit being responsible, but I haven't verified it.
>=20
> I think you are right. I need to handle the BP_ECANCELED case similar to
> BP_EAGAIN in the kernel thread (wait until target size changes again).
>=20
> One further question: do you see any kernel message in the guest related
> to the looping balloon thread?

Nothing, only the usual "xen:balloon: Initialising balloon driver", and
nothing related to balloon after that.


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--m5hzGpkATQskl05r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFaxeoACgkQ24/THMrX
1yyblQgAmTE2UvnLHp+i61/5OwVDq7bcGnN8XmESmfNa3uTZzmBM/MXsb3T9QPHj
fcYlak+NOnufpv0qFWaJj/cbworXembown0ZKboAEbIQu33CjMkXAAl2gwUhf03h
QBMkkvibOMiYhwElqzUKWY8mwVACYypFwoWReYgSJXI7LJr2tn+19byXDCC3h0VB
Wp2SXPAiqOe7Re93YCmfJrcgny7wrvx0WXjHttFD8hXnEBUUSdNKqoMeP/wSGZQb
DOdfkMxcoNdJNZqxbtqEx09KaUBUhJYktN8jLClsIfTKLcLojHgqt6M16i2Ii52Z
CLF/+mV8xZahy97LqbsIwlD/RRcQlQ==
=nbaV
-----END PGP SIGNATURE-----

--m5hzGpkATQskl05r--

