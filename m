Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7458214ABBB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Jan 2020 22:40:27 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.89)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1iwC4Y-0000nW-QL; Mon, 27 Jan 2020 21:37:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=URqW=3Q=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1iwC4X-0000nP-8B
 for xen-devel@lists.xenproject.org; Mon, 27 Jan 2020 21:37:29 +0000
X-Inumbo-ID: 36e4e6f6-414d-11ea-acc1-bc764e2007e4
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 36e4e6f6-414d-11ea-acc1-bc764e2007e4;
 Mon, 27 Jan 2020 21:37:28 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.west.internal (Postfix) with ESMTP id 1C4BB601;
 Mon, 27 Jan 2020 16:37:27 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Mon, 27 Jan 2020 16:37:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=mxyWu6
 CWONTmIq1wOJHphQ9GAlhBQDXPlF2M8dW/a2U=; b=wK39JAaCvRdys20TC7mWbQ
 jT7PkuvTGIwtprp03SjKNyvx+yrbkQ3QGDyPKHPsgdA6Kzf23ltiJ7cGSvKCVNCQ
 TXsnFkwS9c6y2zQ6UFmKVeaNJPrCKBAGv2CiuauGw4/kKEXnY4TZlCaYO6tctMqf
 m7xMtLH1TeVx6xDf/Zg1PUN6ZIpWhcQfA3MbiyQkul7mENSI0yaq2RuzJuRQAOJR
 iwwRaNbg8DFDs8IbtLe1V6pD493EC/9/b+sU0E8ehmX2QrAxguEtjVy2saGSGx3A
 x+CSmEc1ylT208J0lyKqW0wVLqLGRV6x3YkOIB34a2gayfpQTK+hDKR7R+Ve6r5Q
 ==
X-ME-Sender: <xms:FlgvXpZlOuT2_i08EFnWaJEl3Fi3uHk2gMptgFQSEfzMgbyLsktK8Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrfedvgddugeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucffohhmrghinhepgigvnhhprhho
 jhgvtghtrdhorhhgnecukfhppeeluddrieehrdefgedrfeefnecuvehluhhsthgvrhfuih
 iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhs
 ihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:FlgvXrhn1OXubK1JpXPjDhGCdDpp2NOGeTBKxkM8MrAFznmAV58tkA>
 <xmx:FlgvXrW9GDM8Y93ZvtK2BtxkRbdY1s2ZxIA3wbQsXAJpEC2kEPMnJg>
 <xmx:FlgvXm5SZ8tUMq73Kuk1lGtTTwVyX4YT3YuknvwdmYYngzaYz2Mw-A>
 <xmx:FlgvXkKCQfd5L1jAbnJT4wwiyDQ7dCSMDRDcgI0xkNj0W2QqCeDH_Q>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id A53ED306A53C;
 Mon, 27 Jan 2020 16:37:25 -0500 (EST)
Date: Mon, 27 Jan 2020 22:37:22 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: =?utf-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>
Message-ID: <20200127213722.GC2995@mail-itl>
References: <alpine.DEB.2.20.2001271510110.7272@whs-18.cs.helsinki.fi>
 <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
MIME-Version: 1.0
In-Reply-To: <c7acac38-e598-feec-e9c1-7c1599aba8cf@suse.com>
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel@lists.xenproject.org,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@cs.helsinki.fi>
Content-Type: multipart/mixed; boundary="===============6999624588924564543=="
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--===============6999624588924564543==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MAH+hnPXVZWQ5cD/"
Content-Disposition: inline


--MAH+hnPXVZWQ5cD/
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Xen-devel] Linux 5.5 fails to boot in VM

On Mon, Jan 27, 2020 at 03:45:11PM +0100, J=C3=BCrgen Gro=C3=9F wrote:
> On 27.01.20 14:16, Ilpo J=C3=A4rvinen wrote:
> > Hi,
> >=20
> > I've noted that 5.5-rcs and now 5.5-based kernel fails to boot in VM.
> > 5.4 based kernels worked fine and there seems to have been some changes=
 in
> > drivers/xen post-5.4 so perhaps they broke something?
>=20
> I can't reproduce your problem. Just booted a VM with kernel 5.5 as
> PV- and as HVM-guest without any problems.

It looks like an issue with gntdev driver, so reproducing it require any
userspace that actually makes use of it. Any idea what recent change
could cause that?

> > Loading Linux 5.5.0-accecn30 ...
> >=20
> > .[5;22H      [ initrd.img-5.5.0-acc  16.52MiB  100%  10.23MiB/s ].[5;1H=
Setting up swapspace version 1, size =3D 1073737728 bytes
> > /dev/xvda3: clean, 852118/1294896 files, 3076785/5190907 blocks
> > [    2.730931] BUG: kernel NULL pointer dereference, address: 000000000=
00003b0
> > [    2.730959] #PF: supervisor read access in kernel mode
> > [    2.730966] #PF: error_code(0x0000) - not-present page
> > [    2.730973] PGD 0 P4D 0
> > [    2.730978] Oops: 0000 [#1] SMP PTI
> > [    2.730985] CPU: 1 PID: 402 Comm: qubesdb-daemon Tainted: G         =
  O      5.5.0-accecn30 #31
> > [    2.731000] RIP: 0010:mmu_interval_read_begin+0x24/0xc0
> > [    2.731008] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 fc 55=
 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8b 47 38=
 <48> 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b 64
> > [    2.731030] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
> > [    2.731037] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 0000000=
000000000
> > [    2.731047] RDX: ffff8a4ef53add00 RSI: 0000000000000000 RDI: ffff8a4=
e94712500
> > [    2.731057] RBP: ffff8a4e0bf7a640 R08: 00007bc5c0573000 R09: 0000000=
000000008
> > [    2.731066] R10: ffff8a4ec756c190 R11: 00007bc5c05a2000 R12: ffff8a4=
e94712500
> > [    2.731076] R13: ffff8a4ed3ab9d50 R14: 0000000000000000 R15: 0000000=
000000001
> > [    2.731086] FS:  00007bc5c00dc7c0(0000) GS:ffff8a4ef5d00000(0000) kn=
lGS:0000000000000000
> > [    2.731097] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    2.731105] CR2: 00000000000003b0 CR3: 000000008148e004 CR4: 0000000=
0003606e0
> > [    2.731116] Call Trace:
> > [    2.731123]  ? vma_merge+0xef/0x370
> > [    2.731132]  gntdev_mmap+0x153/0x30e [xen_gntdev]
> > [    2.731139]  mmap_region+0x3d9/0x660
> > [    2.731146]  do_mmap+0x372/0x520
> > [    2.731153]  vm_mmap_pgoff+0xd2/0x120
> > [    2.731160]  ksys_mmap_pgoff+0x1b8/0x270
> > [    2.731167]  ? ksys_ioctl+0x60/0x90
> > [    2.731174]  do_syscall_64+0x5b/0x180
> > [    2.731182]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> > [    2.731191] RIP: 0033:0x7bc5c03e8133
> > [    2.731196] Code: 54 41 89 d4 55 48 89 fd 53 4c 89 cb 48 85 ff 74 56=
 49 89 d9 45 89 f8 45 89 f2 44 89 e2 4c 89 ee 48 89 ef b8 09 00 00 00 0f 05=
 <48> 3d 00 f0 ff ff 77 7d 5b 5d 41 5c 41 5d 41 5e 41 5f c3 66 2e 0f
> > [    2.731219] RSP: 002b:00007ffcbccc89b8 EFLAGS: 00000246 ORIG_RAX: 00=
00000000000009
> > [    2.731230] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007bc=
5c03e8133
> > [    2.731243] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 0000000=
000000000
> > [    2.731252] RBP: 0000000000000000 R08: 0000000000000007 R09: 0000000=
000000000
> > [    2.731263] R10: 0000000000000001 R11: 0000000000000246 R12: 0000000=
000000003
> > [    2.731273] R13: 0000000000001000 R14: 0000000000000001 R15: 0000000=
000000007
> > [    2.731284] Modules linked in: xen_netback u2mfn(O) xen_gntdev xen_g=
ntalloc xen_blkback xen_evtchn parport_pc ppdev xenfs xen_privcmd lp parpor=
t ip_tables xen_netfront xen_blkfront crc32c_intel
> > [    2.731309] CR2: 00000000000003b0
> > [    2.731315] fbcon: Taking over console
> > [    2.731321] ---[ end trace 5ec57aa3f3a40247 ]---
> > [    2.731329] RIP: 0010:mmu_interval_read_begin+0x24/0xc0
> > [    2.731336] Code: e9 51 66 e1 ff 90 0f 1f 44 00 00 41 54 49 89 fc 55=
 53 48 83 ec 30 65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 8b 47 38=
 <48> 8b a8 b0 03 00 00 48 8d 5d 0c 48 89 df e8 49 27 6f 00 4d 8b 64
> > [    2.731358] RSP: 0018:ffff9873001e7d20 EFLAGS: 00010246
> > [    2.731365] RAX: 0000000000000000 RBX: ffff8a4e94712500 RCX: 0000000=
000000000
> > [    2.731375] RDX: ffff8a4ef53add00 RSI: 0000000000000000 RDI: ffff8a4=
e94712500
> > [    2.731385] RBP: ffff8a4e0bf7a640 R08: 00007bc5c0573000 R09: 0000000=
000000008
> > [    2.731395] R10: ffff8a4ec756c190 R11: 00007bc5c05a2000 R12: ffff8a4=
e94712500
> > [    2.731405] R13: ffff8a4ed3ab9d50 R14: 0000000000000000 R15: 0000000=
000000001
> > [    2.731415] FS:  00007bc5c00dc7c0(0000) GS:ffff8a4ef5d00000(0000) kn=
lGS:0000000000000000
> > [    2.731427] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [    2.731436] CR2: 00000000000003b0 CR3: 000000008148e004 CR4: 0000000=
0003606e0
> > [    2.731446] Kernel panic - not syncing: Fatal exception
> > [    2.731527] Kernel Offset: 0x2a000000 from 0xffffffff81000000 (reloc=
ation range: 0xffffffff80000000-0xffffffffbfffffff)
> >=20
> > --
> >   i.
> >=20
> > _______________________________________________
> > Xen-devel mailing list
> > Xen-devel@lists.xenproject.org
> > https://lists.xenproject.org/mailman/listinfo/xen-devel
> >=20
>=20
>=20
> _______________________________________________
> Xen-devel mailing list
> Xen-devel@lists.xenproject.org
> https://lists.xenproject.org/mailman/listinfo/xen-devel

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--MAH+hnPXVZWQ5cD/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl4vWBIACgkQ24/THMrX
1yyiPgf+JmtFjez3xLRP0+8eoEZYPOIkZhnqayAUqMwBd13QgoTxeC7cTq1QKABV
hY8/hI9Wtmmyof5DCiiA4aFtdDHKvBJ6hpC0w8UH/FhEM3rZz3yN+yxpHX8/Zf5t
YPXtr7YXMH2ZAnw5aHouAqljdRhminh0yhRPUXsxZE7dTKNpNgdHBVf5siV0hUj7
/PW0m92s1FIc+9xEq7xOhjJeK1hRDTpXZKPZ96Bl1ECbL/QT60mQDA9sjuX/E5Dt
K2xNG0Jasd+QH2cOlbkMn4PDzugt4oNEQV9OlneFhIrChrYe0gG2i6Lk7u3pHhEA
YM1yJ9+/zMXuPiWjSNsj8F47zggcgA==
=Do4z
-----END PGP SIGNATURE-----

--MAH+hnPXVZWQ5cD/--


--===============6999624588924564543==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==

--===============6999624588924564543==--

