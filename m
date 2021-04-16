Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3165E361749
	for <lists+xen-devel@lfdr.de>; Fri, 16 Apr 2021 04:02:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.111553.213371 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXDnD-0000yO-Co; Fri, 16 Apr 2021 02:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 111553.213371; Fri, 16 Apr 2021 02:01:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lXDnD-0000y6-5q; Fri, 16 Apr 2021 02:01:11 +0000
Received: by outflank-mailman (input) for mailman id 111553;
 Fri, 16 Apr 2021 02:01:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tgR2=JN=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lXDnC-0000y1-AT
 for xen-devel@lists.xenproject.org; Fri, 16 Apr 2021 02:01:10 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id be0891ad-d479-450f-92fe-261c642593ef;
 Fri, 16 Apr 2021 02:01:09 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id BDED95C0065
 for <xen-devel@lists.xenproject.org>; Thu, 15 Apr 2021 22:01:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute4.internal (MEProxy); Thu, 15 Apr 2021 22:01:08 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 4A4EF24005A
 for <xen-devel@lists.xenproject.org>; Thu, 15 Apr 2021 22:01:08 -0400 (EDT)
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
X-Inumbo-ID: be0891ad-d479-450f-92fe-261c642593ef
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=ER5ob46IhoIPdLqiOw6y/LsjmCgWz
	DAdOxZJUDKZVPg=; b=oSRXTBMyPh+qwovt+Oj5xN/0vrvG9WBxumUvnfWMz55JC
	GwokOBg/4FJ6z39iTymiOeiPsIw3/qSKyLccpAaOmWScpNgEG0LW7xtFtrwHYll9
	LYAw/T81lSCOdA8tAXrcWdVgBr1C7emFRG7C86xmmC/ckiW0Bft/TCveCh52nFui
	s28v00Zh1cVU5aEqstTjrMV+9NfWdlPxpcjgS9OLzx7jp0UnSYoglq35AZHiCvuJ
	V6IWTPGvA1ToFa3IE8BvS4Y7nL6FaO1RebfeW83yCeFOk8QKSfeZ6vwWpEPNZghE
	6UasxxOAMjpIqss36pNicZrOGODGMkhBVy4t3jGGw==
X-ME-Sender: <xms:5O94YFMonH2egrX4s3ulq86MmZstifeabbqstKzCyVM4_ObwVEsX2Q>
    <xme:5O94YH4-sVaKL55PGVhaAQV4zITfyAroNWQP8ZonPKftxdozGkA-45m4ma8xT2iSL
    hr95eAYRNxFcA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrudelgedgheegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepgfdvfffhiedvvdejleejfeehvdegffduhfekveejffehudeg
    leeutdeuleejvdelnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpmhgrrhhkmhgrih
    hlrdhorhhgpdhgihhthhhusgdrtghomhenucfkphepledurdeijedrjeelrdegnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvg
    hksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:5O94YBLF6aioaKnJ-GHm_noIlHBzu9t_dlWIdpW0kUGWl18wv0oPwA>
    <xmx:5O94YJcB2vxvovtoJeA00DRAgpJd8U0rqq0DUg8ixYdZbGKZgqKC-g>
    <xmx:5O94YMdgc_5d4POVxTxa-RsOpHbJpRCN_ERdPD04LMarGwQaU5Q6lg>
    <xmx:5O94YNFC8y0fld-cJe0HhWuyerL1OmuSOIjYaotUPjjYoyMAu5IcQQ>
Date: Fri, 16 Apr 2021 04:01:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Slow HVM start with direct kernel boot
Message-ID: <YHjv4DGpEmyJjpei@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="GYUzbTmlz0P1c9cp"
Content-Disposition: inline


--GYUzbTmlz0P1c9cp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Apr 2021 04:01:03 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Slow HVM start with direct kernel boot

Hi,

I observe much slower HVM start time than PVH, on Xen 4.14. It is using
qemu in (linux) stubdomain and direct kernel boot. The overall
difference is ~50s vs ~20s on some not particularly new laptop. On a
newer one I get 24s vs 6s, but I choose to debug it on the older one, as
the difference is more apparent. My measurements are taken with `time
qvm-start <vmname>`, which includes some (constant time) preparation,
starting the domain via libvirt and then waiting until system is fully
started.

I've identified several factors:
1. qemu is running in stubdomain there - it needs to start, and also
   get all domU's disk attached - slowness of block script is doubled
   here (4 disks, configured as block devices so the simplest case - it
   takes nearly 2s to run all the scripts)
2. Linux in HVM takes 64MB for SWIOTLB, which is significant given the
   domU has 400MB in total - this makes later system startup slower
   (less page cache, some swapping)
3. Finally, there is a huge delay between starting qemu (actually,
   last line of SeaBIOS output) and first output from Linux - about 10s or
   more.

For part of the debugging I've switched to qemu in dom0 - which reduced
point 1 above, but other points still applies.

What I've got so far for the above:

1. Some solutions discussed in
https://lore.kernel.org/xen-devel/YGyCECo8O0rwS8Z5@mail-itl/ and
https://xen.markmail.org/thread/ytikjjbs4kpihzi5. I've made the simplest
test of replacing the whole block script with a one-liner xenstore-write
(no locking, no sharing check etc), but it didn't helped much.

2. I don't have PCI passthrough there. Is the SWIOTLB needed there? Can
I disable it (I know how to reduce its size with swiotlb=3D, but is there
an option for disabling?)

3. This one, I discussed on IRC today and Anthony gave me this link:
https://lore.kernel.org/xen-devel/20180216204031.000052e9@gmail.com/
I've applied the change to qemu (fw_cfg_init_io -> fw_cfg_init_io_dma),
without any mentioned further work, and it does wonders already. The
kernel loading time is reduced from 10-15s, down to 1-2s.

That said, I/O handling in qemu seems to be slow. For example, a large
amount of time is spent on locking/unlocking map-cache. I believe this
may add to subjectively HVM feeling slower than PVH. Here is 'perf'
report collected while domU was loading kernel (via fw_cfg apparently):
https://gist.github.com/marmarek/350158269b77ebb8492d7c9392db686f


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--GYUzbTmlz0P1c9cp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmB47+AACgkQ24/THMrX
1yyA+Qf/e4NkxDojZqQs29TKY23p/i+WMVFnvTFyR9EpOvwCoF85gv8zrRXmiELZ
rd4GC5z3mm1XJ7HvTbc8I9bbrarI+A23U1c5iS4m5HjeSsZxFizH2aFNGWPQEP+L
2D94FOBrYMTDpQ6w5PcDSSU1oBKd1DqIyANkVPZxzaTWHuEgvKUoHy+IS3KlrUrl
u9nsVKYF2o10KJ/P4tN+1JHIuPWBl4tn7aLpdVKuDTypJzVimGAaZUw2467vnMns
ZgpY1AsUF0DN787D9IMELiDBOZ3gcdSclvs+Hv71UJxqvuaE9dWpOfO9byo9GHo6
MxY3s0m9tFBsxFa49PkR7bkH/e2jEQ==
=+Usq
-----END PGP SIGNATURE-----

--GYUzbTmlz0P1c9cp--

