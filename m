Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0819232A10E
	for <lists+xen-devel@lfdr.de>; Tue,  2 Mar 2021 14:41:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.92370.174272 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH5HG-0006c4-W2; Tue, 02 Mar 2021 13:41:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 92370.174272; Tue, 02 Mar 2021 13:41:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lH5HG-0006bi-Sg; Tue, 02 Mar 2021 13:41:30 +0000
Received: by outflank-mailman (input) for mailman id 92370;
 Tue, 02 Mar 2021 13:41:29 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MJKK=IA=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lH5HF-0006bd-JB
 for xen-devel@lists.xenproject.org; Tue, 02 Mar 2021 13:41:29 +0000
Received: from out4-smtp.messagingengine.com (unknown [66.111.4.28])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 03c1edf3-7e52-4a69-b18e-48cc1fc4f785;
 Tue, 02 Mar 2021 13:41:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 3E7715C0050
 for <xen-devel@lists.xenproject.org>; Tue,  2 Mar 2021 08:41:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Tue, 02 Mar 2021 08:41:28 -0500
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id A5BFB108005F
 for <xen-devel@lists.xenproject.org>; Tue,  2 Mar 2021 08:41:27 -0500 (EST)
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
X-Inumbo-ID: 03c1edf3-7e52-4a69-b18e-48cc1fc4f785
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=bfykdhqW1pbs8W/A+KfC9/i9W6sQE
	52oi/IdW1s/LRg=; b=HrsxXZ747Y6uFKAqTstqyT2Y+0JBFgy2/WNW6weTPCZEL
	vR7/ALE8ujXasc0mYJg0ANCN6t3hQ+OOxSoJiKGldfzzkIlMk9Y4aASaVm0hu5QA
	7K11LAF9Mz9dlM9RQTXG/I0/syomKqxbWmVWSTPnqze8q+Hhb+t33SV2Tm8ebpJ5
	S0pwY6s/aKvGQDdhWsTwcZ1HaP10ev8hqLC6NNASgQcHMRmatC429bBZmiE2jKLx
	PSwEmRMHHzltUIvrog8eYJOk3nOMyvhT7CBZLyVX0dXFe75lYW6VfsVx1+hdaWSi
	49dcmwA+tYdq17HSvJ28PWlOW5x+lFvKGLPX7Lpvg==
X-ME-Sender: <xms:h0A-YKFKWUynafn-9zWk0zEM11QRVLFPhynDZhn9OeOEJPpC16qy2A>
    <xme:h0A-YLWIc23sb06bynWiD2POl2odMDeAxFGxdb2wLF52yoGZWwXMKeMyGDG-nJd2Q
    _sxKRiYha8q-w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledruddttddgheehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepteduteeiudevkeegvefhtdekhfelgffhhedukedvvdeuuddv
    jeehvddtieehudfgnecuffhomhgrihhnpehgihhthhhusgdrtghomhenucfkphepledurd
    eijedrjeelrdegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:iEA-YEIrQFs-_MdGLxu1785mev5tzEUO1rYRLzaG0-dMouPaymemvQ>
    <xmx:iEA-YEEj6-JRIw7KFH_KlbCq8MZyMZ0LS_a2hKsOTbk7_N6dANflmw>
    <xmx:iEA-YAUt-vkayod2v55pJYykiJirjmKu0GxN0Ux1Fr7BSpFSQH6qqQ>
    <xmx:iEA-YBUhC6Xkt6eWwi4lbNop7kRTkTxlP8T9V1wws7WbXcbJCFVp3Q>
Date: Tue, 2 Mar 2021 14:41:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux >= 5.9 PV dom0 crash when starting a HVM - AMD Ryzen 4750U,
 Xen 4.14.1
Message-ID: <YD5AhCSN/8ZS2pNn@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="V4+c/tmaqDsS6m6l"
Content-Disposition: inline


--V4+c/tmaqDsS6m6l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 2 Mar 2021 14:41:24 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux >= 5.9 PV dom0 crash when starting a HVM - AMD Ryzen 4750U,
 Xen 4.14.1

Hi,

I've got a report about a Linux regression on AMD hardware, this time
with a backtrace! Reportedly, the last functional kernel was 5.8.x (.16,
but that's because we moved to 5.9.x and skipped .17 and .18). This is
consistent with other reports that anything >=3D 5.9 is unstable on some
AMD machines.

Details of this config:
 - Xen 4.14.1 close to vanilla hypervisor-wise
 - PV dom0
 - Dom0 kernel also very close to vanilla
 - HVM domains in question both have PCI passthrough and qemu in
   stubdomain (but that's probably not relevant here)
 - AMD Ryzen 4750U

The backtrace:
[   43.497440] kernel BUG at arch/x86/xen/p2m.c:656!
[   43.497923] invalid opcode: 0000 [#1] SMP NOPTI
[   43.498404] CPU: 0 PID: 2347 Comm: xenstored Tainted: G        W        =
 5.10.16-1.fc32.qubes.x86_64 #1
[   43.498874] Hardware name: HP HP EliteBook 835 G7 Notebook PC/8760, BIOS=
 S77 Ver. 01.02.03 11/27/2020
[   43.499362] RIP: e030:___set_phys_to_machine+0x71/0x190
[   43.499847] Code: 85 c0 75 28 b8 01 00 00 00 48 8b 4c 24 08 65 48 2b 0c =
25 28 00 00 00 0f 85 0a 01 00 00 00 48 83 c4 10 5b 5d c3 48 83 fe ff 74 da =
<0f> 0b 48 03 3d ce
[   43.500368] RSP: e02b:ffffc90001ff7cc8 EFLAGS: 00010293
[   43.500895] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff888139c=
18a88
[   43.501426] RDX: 00000000ffffffd8 RSI: 0000000000a51101 RDI: 00000000001=
47fff
[   43.501958] RBP: 0000000000a51101 B08: 0000000000000000 B09: ffffc90001f=
f7b30
[   43.502407] R10: ffffc90001ff7b28 R11: ffffffff82944488 R12: ffff8881071=
4c6a8
[   43.503020] R13: 0000000000a51101 R14: 0000000000147fff R15: 00000000000=
00000
[   43.503557] FS: 00007813cd907d00(0000) GS:ffff888139c00000(0000) kn1GS:0=
000000000000000
[   43.504101] CS: e030 DS: 0000 ES: 0000 CR0: 0000000000050033
[   43.504651] CR2: 000000000000d8c038 CR3: 0000000102ae4000 CR4: 000000000=
0050660
[   43.505203] Call Trace:
[   43.505744]  set_foreign_p2m_mapping.part.0+0x164/0x320
[   43.506302]  gntdev_map_grant_pages+0x5d/0x350 (xen_gntdev)
[   43.506852]  gntdev_mmap+0x199/0x2f9 (xen_gntdev)
[   43.507408]  mmap_region+0x47e/0x720
[   43.507957]  do_mmap+0x438/0x540
[   43.508514]  ? security_mmap_file+0x81/0xd0
[   43.509054]  vm_mmap_pgoff+0xdf/0x130
[   43.509606]  ksys_mmap_pgoff+Ox1d6/0x240
[   43.510170]  do_syscall_64+0x33/0x40
[   43.510714]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[   43.511263] RIP: 0033:0x7813cdbfa2e6
[   43.511835] Code: 01 00 66 90 f3 0f 1e fa 41 f7 c1 ff 0f 00 00 75 2b 55 =
48 89 fd 53 89 cb 48 85 ff 74 37 41 89 da 48 89 ef b8 09 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77
[   43.512442] RSP: 002b:00007ffeb83042f8 EGLAGS 00000246 ORIG_RAX: 0000000=
000000009
[   43.513045] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 00007813cdb=
fa2c6
[   43.513654] RDX: 0000000000000003 RSI: 0000000000001000 RDI: 00000000000=
00000
[   43.514276] RBP: 0000000000000000 R08: 000000000000000f R09: 00000000000=
00000
[   43.514688] R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffcb83=
04310
[   43.515498] R13: 0000000000000003 Ri4: 000000000000000f R15: 00000000000=
00001
[   43.516188] Modules linked in: nf_tables nfnetlink vfat fat hp_smi spars=
e_keymap wmi_bmof uvcvideo videobuf2_vmalloc videobuf2_memops videobuf2_v41=
2 videobuf2_common=20
da_codec_generic k10temp i2c_piix4 snd_pci_acp3x lcdtrig_audio mc snd_hda_c=
odec_hdmi snd_hda_intel btusb snd_intel_dspcfg joydev btrtl snd_hda_codec b=
tbcm btintel snd_hda=20
pcm snd_timer iwlwifi snd soundcore cfg80211 ucsi_acpi typec_ucsi rfkill ty=
pec wmi cm32181 video industrialio hp_wireless fuse xenfs ip_tables dm_thin=
_pool dm_persistent
titouch amdgpu crct10duf_pclmul crc32_pclmul crc32c_intel nvme iommu_v2 gpu=
_sched ttm i2c_algo_bit drm_kms_helper cec drm ghash_cimuini_intel xhci_pci=
 xhci_pci_renesas=20
back xen_blkback xen_gntalloc xen_gntdev
[   43.516186] xen_evtchn uinput
[   43.528491] ---[ end trace 0f195b254c08766c ]---
[   43.689504] RIP: e030:__set_phys_to_machine+0x71/0x190
[   43.618326] Code: 05 c0 75 28 b8 01 00 00 00 48 0b 4c 24 O8 65 48 2b 0c =
25 28 00 00 00 Of 05 0a 01 00 00 48 83 c4 10 5b 5d c3 48 83 fe ff 74 da <Of=
> 0b 48 03 34 ce 31
[   43.611124] RSP: e02b:ffffc90001ff7cc8 EFLAGS: 00010293
[   43.611933] RAX: 0000000000000000 RBX: 0000000000000001 RCX: ffff888139c=
18a88
[   43.612736] RDX: 00000000ffffffd8 RSI: 0000000000a51101 RDI: 00000000001=
47fff
[   43.613534] RBP: 9999999999a51101 R08: 0000000000000000 R09: ffffc90001f=
f7b38
[   43.614320] R10: ffffc90001ff7b20 R11: fffffffff8294488 R12: ffff8881871=
4c6a8
[   43.615119] R13: 0000000000a51101 R14: 0000000000147fff R15: 00000000000=
00000
[   43.615925] FS:  00007813cd987d00(0000) GS:ffff888139c00000(0000) kn1GS:=
0000000000000000
[   43.616714] CS:  e030 DS: 0000 ES: 0000 CRO: 0000000000050033
[   43.617519] CR2: 0000000000d8c038 CR3: 0000000102ae4000 CR4: 00000000000=
58660
[   43.618313] Kernel panic - not syncing: Fatal exception
[   43.619137] Kernel Offset: disabled

The original report:
https://github.com/QubesOS/qubes-issues/issues/6397#issuecomment-788879968

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--V4+c/tmaqDsS6m6l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmA+QIQACgkQ24/THMrX
1yw3Tgf+NqLQwCMP2OtD1gQvM4yl6152K6LEOqo+sq9tma4e91nPZUSgy5BRJnI/
Gd8y/kz9bOn3fskqxeXlTCV/4vn4tFIdu2kjFphICIm/2hrgtWm0ts077ysl3g/t
F0rYlkcUpmk5CYTrSLdAEf9O9ibMqhkYYzR6ua9/9B6n52AdmamhZK7dp7sn4N9w
EPAtqDSkd9hftyAbXHdtPa24K/ImOg6sUOHDUPg7tLjsHzGmhTPte1/G/lrxUm7r
0TmawpYfR4LnNszBMl6tXRk3YSJC5Xd6p+vaRwPUfVyOb5B1/hWoDDX1ghqCQXGE
eTPSjukVUr+WUpWdAx0AfFMRdxyNzA==
=N8IZ
-----END PGP SIGNATURE-----

--V4+c/tmaqDsS6m6l--

