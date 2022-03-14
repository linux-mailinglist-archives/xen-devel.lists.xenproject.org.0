Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5774D831A
	for <lists+xen-devel@lfdr.de>; Mon, 14 Mar 2022 13:12:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.290189.492104 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTjYX-0002Vh-KQ; Mon, 14 Mar 2022 12:12:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 290189.492104; Mon, 14 Mar 2022 12:12:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nTjYX-0002TA-GJ; Mon, 14 Mar 2022 12:12:09 +0000
Received: by outflank-mailman (input) for mailman id 290189;
 Mon, 14 Mar 2022 12:12:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=mLdE=TZ=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nTjYW-0002T4-HA
 for xen-devel@lists.xenproject.org; Mon, 14 Mar 2022 12:12:08 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id f0fed5e2-a38f-11ec-853b-5f4723681683;
 Mon, 14 Mar 2022 13:11:57 +0100 (CET)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E9F3A3200C4A
 for <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 08:12:04 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 14 Mar 2022 08:12:05 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 14 Mar 2022 08:12:03 -0400 (EDT)
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
X-Inumbo-ID: f0fed5e2-a38f-11ec-853b-5f4723681683
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; bh=WJaavbppBbDykN/gozQA4SsbY4XMOo60fQI2ApBw9
	30=; b=FffC23GLxhgObHTj9Xb9112uCVpB8XONGcPKkiAIuXzC+GNwGnm7u9y3V
	RBtX3mHsLbO5D6xrFxFj75qQtI9VbJ7Xbr66A0DT07n24g2fjG4ZW16B6NV+TarH
	cOG4uaD+Sb1O1N+qTp0PcyYPE8ahbqMr3T0OubfZHqfdzkT9fF+2ixu/UeBZ7E5a
	KMJ7DMmPfHcNNwHIadcWA2Rtj0zEfZjzBMHwkU+pw1CAEkOBu05+Q31qV4I5SUhz
	kOm543nTz1tvkYY8VtQEuhq44a0S4k2e+/834Z4pisI69yRDk0tUspLsHmBM79FS
	NXv64PsyTWtK2Uu6btP7/dIkWud0A==
X-ME-Sender: <xms:FDEvYuONGkRY0ypFNi9ozSTw8Vy9Pb68bYwOs3Tu3_B2WdX5xvZeYw>
    <xme:FDEvYs93Asrv0jHvAq13VK2Spv7N8y4gB4NHlDrBh32u50VZasPoe4a26SdsT0aAo
    hFt0mLJ7DhHFQ>
X-ME-Received: <xmr:FDEvYlRV5SaxWIdWLHFTNv7QXt2ekj_lVgqkfjBz8dPrWjGmEC-yeDB79EwAA7xpt5OHDQR4dEHHLnC4lMqyRy_AQGtnesIyiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddruddvkedgfeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddv
    jeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:FDEvYus4omBJ-amrsk_KOPIfc_Ci5F7XU-BspFmjeRukX4583tYvjQ>
    <xmx:FDEvYmciHWNQ11CP8jzEysPCOQ3Y857c7foX5SYBAFlb7scOQPaOBQ>
    <xmx:FDEvYi3MKuraA71Kt1srVdWwnJcblrKblbtoruFV69NYMel4g3g_PA>
    <xmx:FDEvYgqyq1AE9DDhaFOGyxVsNGw0z8eDOCa13wdIoAkNhvM5o8u1bw>
Date: Mon, 14 Mar 2022 13:12:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: System hangs shortly after S3 resume, if suspended for a longer time
Message-ID: <Yi8xEf0eUsh0ObPT@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2mOIVKUrHDzd1AkA"
Content-Disposition: inline


--2mOIVKUrHDzd1AkA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Mon, 14 Mar 2022 13:12:01 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: System hangs shortly after S3 resume, if suspended for a longer time

Hi,

I have another S3 issue, on the TGL system (the one with S3 present). If
I suspend it for a short time, it works. But if I suspend it for longer,
then it hangs shortly after resume - sometimes dom0's screenlocker
manages to display password prompt, sometimes not even that.
I have console on this system (it is the Intel LPSS one...), but I don't
see anything interesting there. When it hangs, it stops responding to
triple Ctrl-a too. Adding sync_console (Xen) and no_console_suspend
(Linux) doesn't give much more info.

I haven't exactly figured out what "longer" means. 1h is enough, 1min is
not.

Another user reported similar issue here:
https://github.com/QubesOS/qubes-issues/issues/7340
That system uses totally different firmware (Lenovo vs Coreboot + EDK2).
While it doesn't completely rule out firmware issue, I'd say it's
unlikely in this case.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2mOIVKUrHDzd1AkA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmIvMREACgkQ24/THMrX
1yzYwQf/dsqltCUW1GQom1Q/5R9U/nEve8ru3XxZ0sOQjYRXsYL3Z4CVHgz4i7vs
ZnBj4qtcBflIq+R6P2L5cywOY+rK6FGJSzbIKtezqV2LGz7Ho/eokuho4wwz2QYx
nkTBdC0tJ4KeeHz3pAlqbz47Hx9gasTa0fzszuHAAAddWa/+9YPUnXqnTWH9/B2g
mnFMiY4161Kt6WZ1kJhfGWm65C6TNRb5pVibaISaTYKUEKfe8FFAPWj4wem7f+Fs
AkDfosyZ26N5KRUPNZ0OuYHr3LrrF2oLawkwBe4WMChElEeROsDwI6XntTZrVL8R
Ew4lpBvdMOjD3JAvmUnZ1csPrpeTlg==
=g8y2
-----END PGP SIGNATURE-----

--2mOIVKUrHDzd1AkA--

