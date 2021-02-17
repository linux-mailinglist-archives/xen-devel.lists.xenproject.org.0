Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 83C5A31D4CC
	for <lists+xen-devel@lfdr.de>; Wed, 17 Feb 2021 06:13:35 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.86106.161261 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCF8G-00011J-5c; Wed, 17 Feb 2021 05:12:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 86106.161261; Wed, 17 Feb 2021 05:12:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lCF8G-00010w-1x; Wed, 17 Feb 2021 05:12:12 +0000
Received: by outflank-mailman (input) for mailman id 86106;
 Wed, 17 Feb 2021 05:12:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SSRj=HT=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lCF8E-00010r-8F
 for xen-devel@lists.xenproject.org; Wed, 17 Feb 2021 05:12:10 +0000
Received: from out1-smtp.messagingengine.com (unknown [66.111.4.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 0ba0c179-b4d4-451b-bb23-fd706effe475;
 Wed, 17 Feb 2021 05:12:08 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 20A985C00DE
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 00:12:08 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 17 Feb 2021 00:12:08 -0500
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id A01161080057
 for <xen-devel@lists.xenproject.org>; Wed, 17 Feb 2021 00:12:07 -0500 (EST)
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
X-Inumbo-ID: 0ba0c179-b4d4-451b-bb23-fd706effe475
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=hqxfMtVLYQTpWK3DxeliVp4K2OtYZ
	NHD5kIqDxzCy+c=; b=Z3zWm3gMsUE94b2X4X4jaf754x+6lwrkThw5Tj6Y33lmv
	gViGmsLHfseJMS33iDps1hG0j10Uu5y4HFjmY62vFfF4pPD1kKwppBJ9SFnPFpbA
	qIff6At2uTClTarOlyLBRUXT61ypXoZQYSo3YgVe7PssyDbXZTQYq1Vucj+chXEx
	uZPd2+riZf6RzuVTyalRVOuxDNTGFXqE24CWknZIaAn4Myj8f6Qk1dpPpM18RyLP
	+NCv2y877gUPVy6NRAr0eBzkPoLD1umuoU6Vx0Jmv2BwSzWa+olFkb7imUC748uu
	RNwgT8gIUNQ3Ay9DhQ9ho9fwOH+sTKfGAQkUJdbXA==
X-ME-Sender: <xms:p6UsYPAdQ-loRQ3RSETy8bsijQLwoBa9Y9b2rwzUJz8K4jt3JK-IdQ>
    <xme:p6UsYFh7r58ORawhUeuM7J_T9b3qdkNjNM7SOztuUQdmkvcKiB89KkQ0Cx9i68LP2
    Q6-D9HovgEM2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrjedugdejkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedtudfgteduveduieevvefgteeujeelgffggffhhffhhedtffef
    fefgudeugeefhfenucfkphepledurdeijedrjeelrdegnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgs
    lhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:p6UsYKnsCKPOcmqZ6nzdv1HPcMBT6gr_HtwSInovcZwwew4VUrVMug>
    <xmx:p6UsYBwGHG5B-1boEHoTW8-WgJN_tmSOr2Wir4Opd5Mw-hiApNeBqA>
    <xmx:p6UsYESGfzX493s0St6CJztqRVkLtp9FaTVsPMhWFDS6qQ31KwdYEw>
    <xmx:qKUsYKB2HdIOfspB7ZWLJi1OzTVG5TDEM7OPahErgl37JBrKZ94jog>
Date: Wed, 17 Feb 2021 06:12:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux PV/PVH domU crash on (guest) resume from suspend
Message-ID: <YCylpKU8F+Hsg8YL@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="L2+TYTG2qmBDfrpw"
Content-Disposition: inline


--L2+TYTG2qmBDfrpw
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 17 Feb 2021 06:12:04 +0100
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: Linux PV/PVH domU crash on (guest) resume from suspend

Hi,

I'm observing Linux PV/PVH guest crash when I resume it from sleep. I do
this with:

    virsh -c xen dompmsuspend <vmname> mem
    virsh -c xen dompmwakeup <vmname>=20

But it's possible to trigger it with plain xl too:

    xl save -c <vmname> <some-file>

The same on HVM works fine.

This is on Xen 4.14.1, and with guest kernel 5.4.90, the same happens
with 5.4.98. Dom0 kernel is the same, but I'm not sure if that's
relevant here. I can reliably reproduce it.

The crash message:

[  219.844995] Freezing user space processes ... (elapsed 0.011 seconds) do=
ne.
[  219.856564] OOM killer disabled.
[  219.856566] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s) done.
[  277.562118] register_vcpu_info failed: cpu=3D0 err=3D-22
[  219.858384] xen:grant_table: Grant tables using version 1 layout
[  219.858442] ------------[ cut here ]------------
[  219.858446] kernel BUG at drivers/xen/events/events_fifo.c:369!
[  219.858503] invalid opcode: 0000 [#1] SMP NOPTI
[  219.858511] CPU: 0 PID: 11 Comm: migration/0 Not tainted 5.4.90-1.qubes.=
x86_64 #1
[  219.858527] RIP: e030:evtchn_fifo_resume+0x58/0x90
[  219.858532] Code: eb 48 8b 04 dd 80 29 3e 82 4e 8b 04 20 4d 85 c0 74 d5 =
48 0f a3 1d b8 40 20 01 73 10 4c 89 c6 89 ef e8 5c fb ff ff 85 c0 79 bd <0f=
> 0b 31 f6 4c 89 c7 e8 7c 8a c8 ff 48 8b 04 dd 80 29 3e 82 4a c7
[  219.858538] RSP: e02b:ffffc9000025be10 EFLAGS: 00010082
[  219.858542] RAX: ffffffffffffffea RBX: 0000000000000000 RCX: 00000000000=
00000
[  219.858545] RDX: ffff888018400000 RSI: ffffc9000025bde0 RDI: 00000000000=
0000b
[  219.858548] RBP: 0000000000000000 R08: ffff888018143000 R09: 00000000000=
001e0
[  219.858552] R10: ffff88800e50f440 R11: ffffc9000025bcbd R12: 00000000000=
26ea0
[  219.858555] R13: 0000000000000000 R14: ffffc9000029bdf8 R15: 00000000000=
00003
[  219.858567] FS:  0000000000000000(0000) GS:ffff888018400000(0000) knlGS:=
0000000000000000
[  219.858571] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  219.858574] CR2: 0000581c2753e030 CR3: 000000000260a000 CR4: 00000000000=
00660
[  219.858578] Call Trace:
[  219.858615]  xen_irq_resume+0x1b/0xe0
[  219.858620]  xen_suspend+0x13e/0x190
[  219.858626]  multi_cpu_stop+0x6c/0x100
[  219.858630]  ? stop_machine_yield+0x10/0x10
[  219.858633]  cpu_stopper_thread+0xb0/0x110
[  219.858638]  smpboot_thread_fn+0xc5/0x160
[  219.858641]  ? smpboot_register_percpu_thread+0xf0/0xf0
[  219.858645]  kthread+0x115/0x140
[  219.858648]  ? __kthread_bind_mask+0x60/0x60
[  219.858653]  ret_from_fork+0x22/0x40
[  219.858657] Modules linked in: nf_conntrack_netlink nft_reject_ipv4 nft_=
reject xt_nat nf_tables_set nft_ct nf_tables nfnetlink e1000e rfkill xt_RED=
IRECT ip6table_filter ip6table_mangle ip6table_raw ip6_tables edac_mce_amd =
pcspkr ipt_REJECT nf_reject_ipv4 xen_pcifront xt_state xt_conntrack iptable=
_filter iptable_mangle iptable_raw xt_MASQUERADE iptable_nat nf_nat nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 libcrc32c xen_scsiback target_core_mod =
xen_netback xen_privcmd xen_gntdev xen_gntalloc xen_blkback xen_evtchn drm =
fuse ip_tables overlay xen_blkfront
[  219.858754] ---[ end trace 54d868ea756768db ]---
[  219.858758] RIP: e030:evtchn_fifo_resume+0x58/0x90
[  219.858762] Code: eb 48 8b 04 dd 80 29 3e 82 4e 8b 04 20 4d 85 c0 74 d5 =
48 0f a3 1d b8 40 20 01 73 10 4c 89 c6 89 ef e8 5c fb ff ff 85 c0 79 bd <0f=
> 0b 31 f6 4c 89 c7 e8 7c 8a c8 ff 48 8b 04 dd 80 29 3e 82 4a c7
[  219.858768] RSP: e02b:ffffc9000025be10 EFLAGS: 00010082
[  219.858770] RAX: ffffffffffffffea RBX: 0000000000000000 RCX: 00000000000=
00000
[  219.858774] RDX: ffff888018400000 RSI: ffffc9000025bde0 RDI: 00000000000=
0000b
[  219.858777] RBP: 0000000000000000 R08: ffff888018143000 R09: 00000000000=
001e0
[  219.858780] R10: ffff88800e50f440 R11: ffffc9000025bcbd R12: 00000000000=
26ea0
[  219.858783] R13: 0000000000000000 R14: ffffc9000029bdf8 R15: 00000000000=
00003
[  219.858790] FS:  0000000000000000(0000) GS:ffff888018400000(0000) knlGS:=
0000000000000000
[  219.858793] CS:  10000e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[  219.858796] CR2: 0000581c2753e030 CR3: 000000000260a000 CR4: 00000000000=
00660
[  219.858801] Kernel panic - not syncing: Fatal exception
[  219.858819] Kernel Offset: disabled

Note the time besides "register_vcpu_info failed" - it is in the future.
I think the offset depends on the uptime, with shorter uptime I get much
smaller difference (like 49 vs 51).

Any ideas?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--L2+TYTG2qmBDfrpw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmAspaQACgkQ24/THMrX
1yxwjwgAj8AL+J6HxH9lwMsGR19Ghz8uJu6zC93lTr6xH/AiSqwoiEsVwRdcvxs6
YiEDGyJjfnu5ea+GhTooWplyTcIMI01IdLbogtncnzlH4YrKJn/Oo/31Of3toL0n
ubyDfPHHnbBOqDiD+0XL009xWbSpdNxhiuQbA+3TGjn/y7k99boPjqZuuoWe+NwE
AK6ebMMw6czL9+HJnSiOuxODy69e02rN5FPds9ZMz+uJFExhq3A3on5BTAN05zcB
bltwV/fvMhy0UEybouzYwSuJYkuZucWPHrz3mOfte20oMkExn642H4OHFCdiM5+W
84BmZ2lNewz0/v0h5BJaRNJNlUMAyw==
=MOTm
-----END PGP SIGNATURE-----

--L2+TYTG2qmBDfrpw--

