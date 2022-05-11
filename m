Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA17523D5A
	for <lists+xen-devel@lfdr.de>; Wed, 11 May 2022 21:25:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.327228.549999 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norxS-0001xZ-6N; Wed, 11 May 2022 19:25:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 327228.549999; Wed, 11 May 2022 19:25:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1norxS-0001u5-2z; Wed, 11 May 2022 19:25:14 +0000
Received: by outflank-mailman (input) for mailman id 327228;
 Wed, 11 May 2022 19:25:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+7Fu=VT=invisiblethingslab.com=marmarek@srs-se1.protection.inumbo.net>)
 id 1norxR-0001tz-7c
 for xen-devel@lists.xenproject.org; Wed, 11 May 2022 19:25:13 +0000
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com
 [64.147.123.19]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 123b7d53-d160-11ec-8fc4-03012f2f19d4;
 Wed, 11 May 2022 21:25:11 +0200 (CEST)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 6C41F3200033
 for <xen-devel@lists.xenproject.org>; Wed, 11 May 2022 15:25:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 11 May 2022 15:25:08 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Wed, 11 May 2022 15:25:07 -0400 (EDT)
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
X-Inumbo-ID: 123b7d53-d160-11ec-8fc4-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:from:from
	:in-reply-to:message-id:mime-version:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1652297107; x=1652383507; bh=V1yw90SJTCTbY
	oYc3HuR043djZK8xuxSRxAzr/fc/so=; b=EsuZjQK/8PXWbv8D1CCLhG30aG/do
	F4QUiPpp+LL6PVIp7on7cLe6UIcDDI8UovnHOxTHQJkSdH3jYFCKflSlp1POLp6B
	xS7ky3BCkT2I38h7Zrd1wmyU3CG2aSGdQb351CcbqETRmhc0fF/R+O4vgCsKIwys
	JAL2gMD6Ygaf8zluLvEpv3CFCFXbdXS/ZfUPrnO88WnxIHUxfB3/kB7gkPxtWtyR
	H0zx2tXUJoqUMtdbHCDEOT/lGtJK6SqhTNL1Jq/A/bF9hs5w3YYWyFI089+tIBFw
	pLch24n+m+YY9eSqgsaSCTGlvn+/abVc8Ywp5CfMcJu1BrS5n7ZlEKxOg==
X-ME-Sender: <xms:kw18YtmofeGe3wgUTM_LlgF4PA-C0D4xnIOKRYb8K9DQS33Q2MG4pg>
    <xme:kw18Yo32NQZ5NQ_WzIOyJYJgrtBJ7htDinGoEYY9MOeIw3knIrv7q2IJF-BShRCWF
    clPQbTyNZK_HA>
X-ME-Received: <xmr:kw18YjoA2ae4wRqAxkOCb2mwgmCmiAVViVSJ3caXcbu56-tzTxhUSuDc4GUSlpOLyBF7QsUp1rKKbSSHmOOs72s5MBEbkVDCCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgddufeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtroertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnhepvdekhfefjedvvdfffeffgeeitdevhefhfeetteetffeigfei
    keelteeuffetjeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtgho
    mh
X-ME-Proxy: <xmx:kw18Ytmg9DNcANNRdHoHa1QtJErLEIskqK1ZgXYsjEpI8FUnIrHdcw>
    <xmx:kw18Yr02-5nQRQw8UDTPrWTohPu0ER1CA4fxLmaB5JvSnoYBnDHtPA>
    <xmx:kw18Ysu4RiCGNch0EquyhFG1he2mj1vLcxWzJwOCS0ofCj4xuA5xBA>
    <xmx:kw18YsD1vteBLW41-bgbPuGkZP6dC1aieYVYDA7T63HLrgToGUWgrw>
Date: Wed, 11 May 2022 21:25:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: xen-blkfront crash on xl block-detach of not fully attached device
Message-ID: <YnwNjgtWtKaVLIuu@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7J16D5oq46R8xLJ6"
Content-Disposition: inline


--7J16D5oq46R8xLJ6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Wed, 11 May 2022 21:25:02 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: xen-blkfront crash on xl block-detach of not fully attached device

Hi,

The reproducer is trivial:

[user@dom0 ~]$ sudo xl block-attach work backend=3Dsys-usb vdev=3Dxvdi targ=
et=3D/dev/sdz
[user@dom0 ~]$ xl block-list work
Vdev  BE  handle state evt-ch ring-ref BE-path                      =20
51712 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51712
51728 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51728
51744 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51744
51760 0   241    4     -1     -1       /local/domain/0/backend/vbd/241/51760
51840 3   241    3     -1     -1       /local/domain/3/backend/vbd/241/51840
                 ^ note state, the /dev/sdz doesn't exist in the backend

[user@dom0 ~]$ sudo xl block-detach work xvdi
[user@dom0 ~]$ xl block-list work
Vdev  BE  handle state evt-ch ring-ref BE-path                      =20
work is an invalid domain identifier

And its console has:

BUG: kernel NULL pointer dereference, address: 0000000000000050
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 80000000edebb067 P4D 80000000edebb067 PUD edec2067 PMD 0=20
Oops: 0000 [#1] PREEMPT SMP PTI
CPU: 1 PID: 52 Comm: xenwatch Not tainted 5.16.18-2.43.fc32.qubes.x86_64 #1
RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b =
5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 7=
4 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
Call Trace:
 <TASK>
 blkback_changed+0x95/0x137 [xen_blkfront]
 ? read_reply+0x160/0x160
 xenwatch_thread+0xc0/0x1a0
 ? do_wait_intr_irq+0xa0/0xa0
 kthread+0x16b/0x190
 ? set_kthread_struct+0x40/0x40
 ret_from_fork+0x22/0x30
 </TASK>
Modules linked in: snd_seq_dummy snd_hrtimer snd_seq snd_seq_device snd_tim=
er snd soundcore ipt_REJECT nf_reject_ipv4 xt_state xt_conntrack nft_counte=
r nft_chain_nat xt_MASQUERADE nf_nat nf_conntrack nf_defrag_ipv6 nf_defrag_=
ipv4 nft_compat nf_tables nfnetlink intel_rapl_msr intel_rapl_common crct10=
dif_pclmul crc32_pclmul crc32c_intel ghash_clmulni_intel xen_netfront pcspk=
r xen_scsiback target_core_mod xen_netback xen_privcmd xen_gntdev xen_gntal=
loc xen_blkback xen_evtchn ipmi_devintf ipmi_msghandler fuse bpf_preload ip=
_tables overlay xen_blkfront
CR2: 0000000000000050
---[ end trace 7bc9597fd06ae89d ]---
RIP: 0010:blk_mq_stop_hw_queues+0x5/0x40
Code: 00 48 83 e0 fd 83 c3 01 48 89 85 a8 00 00 00 41 39 5c 24 50 77 c0 5b =
5d 41 5c 41 5d c3 c3 0f 1f 80 00 00 00 00 0f 1f 44 00 00 <8b> 47 50 85 c0 7=
4 32 41 54 49 89 fc 55 53 31 db 49 8b 44 24 48 48
RSP: 0018:ffffc90000bcfe98 EFLAGS: 00010293
RAX: ffffffffc0008370 RBX: 0000000000000005 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000005 RDI: 0000000000000000
RBP: ffff88800775f000 R08: 0000000000000001 R09: ffff888006e620b8
R10: ffff888006e620b0 R11: f000000000000000 R12: ffff8880bff39000
R13: ffff8880bff39000 R14: 0000000000000000 R15: ffff88800604be00
FS:  0000000000000000(0000) GS:ffff8880f3300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000050 CR3: 00000000e932e002 CR4: 00000000003706e0
Kernel panic - not syncing: Fatal exception
Kernel Offset: disabled


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7J16D5oq46R8xLJ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmJ8DY4ACgkQ24/THMrX
1yyA7gf+LUWcGFvGYVvjAeySGghi3Tvy8LGqpOtmEph+wjZwfIedzY5bISfRnbQC
/G2dODwChn3HBU576P9AYJ95v0FoFn+RfyJqEc/Ykxdvjh9z7vSmbR6aPh/0YIsu
NjxQnQPAgpMUERl33ccKw3hO6bEytaqdZKWAoUim//eVPc9AFUtknSXL+ODzm+FC
SUNBXGFt5WLs5hrllfJZ2I93X90GvzSraO78luj0/Wj9pIAkuFta4d+r6MaFRfSF
ErM18Ta+wNzF8+hP7PWgR9wTWyr3ayaD12ebqHtAv+byQVyBXq4sATef1tJKeFJd
1mzfRLnKBk9tr7IvumKsWlcWMONvFQ==
=w6OM
-----END PGP SIGNATURE-----

--7J16D5oq46R8xLJ6--

