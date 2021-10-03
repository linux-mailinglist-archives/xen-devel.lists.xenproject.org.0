Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90208420010
	for <lists+xen-devel@lfdr.de>; Sun,  3 Oct 2021 06:48:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.201095.355517 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWtPK-0003vZ-Bp; Sun, 03 Oct 2021 04:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 201095.355517; Sun, 03 Oct 2021 04:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mWtPK-0003ts-7U; Sun, 03 Oct 2021 04:47:26 +0000
Received: by outflank-mailman (input) for mailman id 201095;
 Sun, 03 Oct 2021 04:47:24 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=xgPy=OX=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mWtPI-0003tm-I6
 for xen-devel@lists.xenproject.org; Sun, 03 Oct 2021 04:47:24 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 2e24ca65-8992-4f6c-98fc-c94ab568b96a;
 Sun, 03 Oct 2021 04:47:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CB78732003C0;
 Sun,  3 Oct 2021 00:47:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 03 Oct 2021 00:47:22 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 3 Oct 2021 00:47:20 -0400 (EDT)
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
X-Inumbo-ID: 2e24ca65-8992-4f6c-98fc-c94ab568b96a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm1; bh=1y8M4P/hiJ1PP8+Pb/DaVZFVNJQSS
	bnivk0mqqAPAC4=; b=FBy2L5gsgRLJHoOnf+zW+zHoiS+tEBQ7pm2Jyw2hw+sFj
	ifzy77IxYGZL5QnBoGUGNoXecla/Pp6v5zYIJ33zl6LTjMBqIl4SS6Tji75B5MG2
	FFsc99TOO4m2LUIRFULECpHDWfH2bo89OxYABl6rvmnFm5Mqap3uqNL660LgK2Xm
	VO0RFUoDcCwEbOCz7SJgu1IZ3gcuO6cf/SItxEmsIUMU0zR/Vp/4ftwQbuhzrQAu
	yIrgt+PfqYPckEmFwzMXjSdvHwHaa3BBrHbiVrXpWJjvIrmNLczOvRNwE9Punazj
	p2hJANoKJZ/yPrs3IaHXFNOcuJ+UdKdV8X86cpnxw==
X-ME-Sender: <xms:2TVZYXGtbvXHSLCsnKxyXudjUtaerhZPhsotFJOSSMjtCDxWVky30Q>
    <xme:2TVZYUV7FRoBBeO1LxljpnyyZ03vsJTufUCG6bXmGjbHrujOCI4-3dJsv-BU-yFmF
    Y7BmgPGmlD1SA>
X-ME-Received: <xmr:2TVZYZLS4diMq691WY8CCPF6avkwiZk17Oy3KtW2rS3uXtXXBOGvP2ddeIfOe2X5tmBReqDpdkrV8EgTSqfnyNH5FIHzQ1Bt>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudekledgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfggtggusehgtderredttdejnecuhfhrohhmpeforghrvghkucfo
    rghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvhhish
    hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedtudfgtedu
    veduieevvefgteeujeelgffggffhhffhhedtffeffefgudeugeefhfenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:2TVZYVFA0Tqb_5ijL4J8LdqtwW9BeNh0bVTtO2J9IN2TADctm7LOIA>
    <xmx:2TVZYdXs0M_kXmJ-7aEGWZ3iEiXm1RWXCu7jM8bYHVRe3dONj7d-eg>
    <xmx:2TVZYQPR_rt3dGRdFwX9AkLwPifvvV5LoLt8woD_zsRbGg8sEDxGgw>
    <xmx:2TVZYefvS3y-rP56-ojneMlnc3Q0yzeU9lLi9camo2p-ij523_vTLA>
Date: Sun, 3 Oct 2021 06:47:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: xen-balloon thread using 100% of CPU, regression in 5.4.150
Message-ID: <YVk11h2l/u4GJNv0@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oLSao2sPpm0inQ0V"
Content-Disposition: inline


--oLSao2sPpm0inQ0V
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 3 Oct 2021 06:47:17 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Cc: Juergen Gross <jgross@suse.com>, Jan Beulich <jbeulich@suse.com>
Subject: xen-balloon thread using 100% of CPU, regression in 5.4.150

Hi,

After updating a PVH domU to 5.4.150, I see xen-balloon thread using
100% CPU (one thread).
This is a domain started with memory=3Dmaxmem=3D716800KiB (via libvirt). Th=
en,
inside, I see:

# cat /sys/devices/system/xen_memory/xen_memory0/target_kb
716924
# cat /sys/devices/system/xen_memory/xen_memory0/info/current_kb
716400

Doing `cat info/current_kb > target_kb` "fixes" the issue. But still,
something is wrong - on earlier kernel (5.4.143 to be precise), it
wasn't spinning, with exactly the same values reported in sysfs. It
shouldn't run in circles if it can't get that much memory it wants. I
strongly suspect "xen/balloon: use a kernel thread instead a workqueue"
or related commit being responsible, but I haven't verified it.

This specific test is from Xen 4.8.5 (+quite a lot of patches), but I've
got report of the same issue on 4.14.3 too. Anyway, I don't think Xen
version matters here much.

I have _not_ managed to reproduce the issue on 5.10.70, nor 5.14.9. In
both cases, just after starting the domain, I see
current_kb=3Dtarget_kb=3D716412. And writing 716924 to target_kb manually
does not cause xen-balloon thread to spin.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oLSao2sPpm0inQ0V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmFZNdUACgkQ24/THMrX
1yzJkQf/fy7zmFrnXFbpxTfQN2a7fMxJKm2wHAYJpd9I95rXRWM1ryt7TUE8GjmN
PxUkltEitH8tM6VzM7TqkpcQqIkK9u+r7ahP2WsMiVR4tUz75RZTGAO19p66ojle
2afTAqZKIxrMimfolEOhWEqvigCOxHLES5fKsfvMO/g0sr/mIOygaH0B3rGZO8kg
K253XN6QgKf6hp+YCH1JxSaS7tikEbPrKCaMnShsaFk7Q/q0Duv7VDD2nvzus5ql
N06cnoBb14ikkHz8S+swTb+MLTggSlQt/NWmRZZcC6NulnXRUwaN3XI9+Pl2YdYg
Bm4h3NnbMgVAOfMlLhhOgkjvKp0CYA==
=nn/A
-----END PGP SIGNATURE-----

--oLSao2sPpm0inQ0V--

