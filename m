Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B794ED203
	for <lists+xen-devel@lfdr.de>; Thu, 31 Mar 2022 05:52:19 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.296632.504973 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZlqD-0001LH-6y; Thu, 31 Mar 2022 03:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 296632.504973; Thu, 31 Mar 2022 03:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nZlqD-0001JU-3s; Thu, 31 Mar 2022 03:51:21 +0000
Received: by outflank-mailman (input) for mailman id 296632;
 Thu, 31 Mar 2022 03:51:19 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=nuZR=UK=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1nZlqB-0001JN-JT
 for xen-devel@lists.xenproject.org; Thu, 31 Mar 2022 03:51:19 +0000
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cf973922-b0a5-11ec-a405-831a346695d4;
 Thu, 31 Mar 2022 05:51:17 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 96A695C0103
 for <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 23:51:13 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Wed, 30 Mar 2022 23:51:13 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 30 Mar 2022 23:51:12 -0400 (EDT)
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
X-Inumbo-ID: cf973922-b0a5-11ec-a405-831a346695d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; bh=cJTllDblkGJLI8PnStYppUoNxFyzvj+QJYSqvc0Ux
	ZQ=; b=U/71m0MeVHYlw6gbkGrQYnNkYglMY5CQ2Tj4RnG/FbrlNLMah+IYJwEWz
	STsRVO2NQaANccyIA71/r2W9yqjEtK1JNS3ytnuYpYc9FsJILnrCerdhOw9zHDjG
	QUnBpuuTTauK89v8I0XykBgYgETL2JGdVmKSX4n9kncr0v3A8jEcYjg9xOs5qFkk
	bNIS+32kL3tBCuJZL9fnAdPPZT3ySBJJoR7rYtkI0e7gIJ+mapvKZ/lviKzJYyol
	6ghX1It0Ww4Fqsr1dhSMyurmOhdVY8JZNdXNP6sgkN9aZWLzCgNJLKpMfw6xGXvZ
	xpimPej7hTH+drXRv050EIb5c4jeA==
X-ME-Sender: <xms:MSVFYqhz4Ln0IRJddpH-F0FWmwz4knz5xHU9Jx1kZ69Ui36k4POCeQ>
    <xme:MSVFYrBKUGNnmYWU9JG8qtIi6K1snYnfCMfrk9PrJq6GpW5rf8YKHzSufY-ngAnp4
    ybu7orYBUDfGg>
X-ME-Received: <xmr:MSVFYiFF6t2yg2DTT86pEb8sG7hB2g8LjV0v7lfU6hq5L_uQXrTLXhc_7tYuxKOM3ifC_xDvUGVyUEgsdwn-BEVajS2oGkoOrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeifedgjedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddv
    jeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhn
    vhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:MSVFYjSBKpRJGvvLnBUNjtdGxMYHID6xnaQzS_J1O-XzAH5PxB-XyQ>
    <xmx:MSVFYnx_YbbtaM5SNixChkCsbojS_9WpovbthufvGDhBZgPNFhX-EA>
    <xmx:MSVFYh5MQ8_CF8nhUD-GAYH1-EvlVO-oUx0lVh-kPzmHCIpuLj2gfg>
    <xmx:MSVFYm-rXPkGQ35hkVnVXEJ5hOjDndrnHxoVZpFas7LmW3l5VYLQvQ>
Date: Thu, 31 Mar 2022 05:51:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Increasing domain memory beyond initial maxmem
Message-ID: <YkUlLvnEDdc5hwN4@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="oT31JiaygZtMJYSR"
Content-Disposition: inline


--oT31JiaygZtMJYSR
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 31 Mar 2022 05:51:10 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Increasing domain memory beyond initial maxmem

Hi,

I'm trying to make use of CONFIG_XEN_BALLOON_MEMORY_HOTPLUG=3Dy to increase
domain memory beyond initial maxmem, but I hit few issues.

A little context: domains in Qubes OS start with rather little memory
(400MB by default) but maxmem set higher (4GB by default). Then, there is
qmemman daemon, that adjust balloon targets for domains, based on (among
other things) demand reported by the domains themselves. There is also a
little swap, to mitigate qmemman latency (few hundreds ms at worst).
This initial memory < maxmmem in case of PVH / HVM makes use of PoD
which I'm trying to get rid of. But also, IIUC Linux will waste some
memory for bookkeeping based on maxmem, not actually usable memory.

First issue: after using `xl mem-max`, `xl mem-set` still refuses to
increase memory more than initial maxmem. That's because xl mem-max does
not update 'memory/static-max' xenstore node. This one is easy to work
around.

Then, the actual hotplug fails on the domU side with:

[   50.004734] xen-balloon: vmemmap alloc failure: order:9, mode:0x4cc0(GFP=
_KERNEL|__GFP_RETRY_MAYFAIL), nodemask=3D(null),cpuset=3D/,mems_allowed=3D0
[   50.004774] CPU: 1 PID: 34 Comm: xen-balloon Not tainted 5.16.15-1.37.fc=
32.qubes.x86_64 #1
[   50.004792] Call Trace:
[   50.004799]  <TASK>
[   50.004808]  dump_stack_lvl+0x48/0x5e
[   50.004821]  warn_alloc+0x162/0x190
[   50.004832]  ? __alloc_pages+0x1fa/0x230
[   50.004842]  vmemmap_alloc_block+0x11c/0x1c5
[   50.004856]  vmemmap_populate_hugepages+0x185/0x519
[   50.004868]  vmemmap_populate+0x9e/0x16c
[   50.004878]  __populate_section_memmap+0x6a/0xb1
[   50.004890]  section_activate+0x20a/0x278
[   50.004901]  sparse_add_section+0x70/0x160
[   50.004911]  __add_pages+0xc3/0x150
[   50.004921]  add_pages+0x12/0x60
[   50.004931]  add_memory_resource+0x12b/0x320
[   50.004943]  reserve_additional_memory+0x10c/0x150
[   50.004958]  balloon_thread+0x206/0x360
[   50.004968]  ? do_wait_intr_irq+0xa0/0xa0
[   50.004978]  ? decrease_reservation.constprop.0+0x2e0/0x2e0
[   50.004991]  kthread+0x16b/0x190
[   50.005001]  ? set_kthread_struct+0x40/0x40
[   50.005011]  ret_from_fork+0x22/0x30
[   50.005022]  </TASK>

Full dmesg: https://gist.github.com/marmarek/72dd1f9dbdd63cfe479c94a3f4392b=
45

After the above, `free` reports correct size (1GB in this case), but
that memory seems to be unusable really. "used" is kept low, and soon
OOM-killer kicks in.

I know the initial 400MB is not much for a full Linux, with X11 etc. But
I wouldn't expect it to fail this way when _adding_ memory.

I've tried also with initial 800MB. In this case, I do not get "alloc
failure" any more, but monitoring `free`, the extra memory still doesn't
seem to be used.

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--oT31JiaygZtMJYSR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJFJS4ACgkQ24/THMrX
1yxPngf/Z3dKtT//OT8bWUXoOSVDeSe/RJBYhPnoFJgF4OctFBFJngIOgwpFw+kb
6q+GeVqVkeln5AgVUCwZEHBvOfGhU57xOzqdBWSOCTPF2mmhEVHOpr0FucfeCMyx
DZaF2GJ9UXJ/WvT1h1VmpaIbeNax+0CzXlTmS85sRNLfn1BJ6X9kPDP8tB1ul42+
ZqpTFkJRhBflm8lOCEjb0kUZIAJfsIvcqnQE26fIMQulWePW8fdDbUwT8ytzh1Wt
IC4QasLsbo5CPtnntFvMdL2asBAw0OJQlIVYQSSWyAQG6jv+6LIiNgv5neKHppTH
GqrXAoorMH9FUv05UCIT28xU3Vr3BA==
=ecdV
-----END PGP SIGNATURE-----

--oT31JiaygZtMJYSR--

