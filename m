Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAFC3635F3
	for <lists+xen-devel@lfdr.de>; Sun, 18 Apr 2021 16:44:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.112482.214624 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lY8ek-0004Eu-JA; Sun, 18 Apr 2021 14:44:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 112482.214624; Sun, 18 Apr 2021 14:44:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lY8ek-0004EX-FZ; Sun, 18 Apr 2021 14:44:14 +0000
Received: by outflank-mailman (input) for mailman id 112482;
 Sun, 18 Apr 2021 14:44:13 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f0kj=JP=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1lY8ei-0004ES-To
 for xen-devel@lists.xenproject.org; Sun, 18 Apr 2021 14:44:13 +0000
Received: from out3-smtp.messagingengine.com (unknown [66.111.4.27])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 938ca1c8-140c-41f0-911c-da4675981beb;
 Sun, 18 Apr 2021 14:44:11 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id D3FDD5C072D
 for <xen-devel@lists.xenproject.org>; Sun, 18 Apr 2021 10:44:10 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sun, 18 Apr 2021 10:44:10 -0400
Received: from mail-itl (ip5b434f04.dynamic.kabel-deutschland.de [91.67.79.4])
 by mail.messagingengine.com (Postfix) with ESMTPA id 1B09124005B
 for <xen-devel@lists.xenproject.org>; Sun, 18 Apr 2021 10:44:09 -0400 (EDT)
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
X-Inumbo-ID: 938ca1c8-140c-41f0-911c-da4675981beb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm2; bh=/DaDmn2YnvDnYuPUgAyzxj0zONTY5
	uW5qD4rJ+cMzac=; b=peqsJXqAKSdm8FKmQDrI0ZsKjOaqXg4o/EGNz6sEePAdO
	6bLZXIy2yzc+NyxLhYYAzy/Zc1qzbOvqh5mK8N7dYWDfzIfY6B+TJ1JGEvzjozBp
	dieMz2+gJi3DHClyxnCaE06PcPBuuZcZlX2RMj2bnuJnEtc7qbplDHTvfK6iqjkd
	NB3Ki1lTVnjQA91W8mSDxbfgmmQav7qtHD0BL6JUBDL+LNRD7qjuKgODmhOnGXR1
	FdQyGOP6PUq5chEr9Qd5wx6D1sIqgYxcYwdX78FAy2WSGNleFpi2Bi4UOxEZ90xU
	F7b3eZRf8K3R71SUnsotUsBeJtPKU6wPpUR/zzL0Q==
X-ME-Sender: <xms:ukV8YJWN5QWCvIKDkxu-LxGb1HiO0IQsYteqHb9lOnQxXBPshnPO7Q>
    <xme:ukV8YJlCQ8MbWIxvIJm4EC5ZzqBXswQCEnFgKvtzzMhvCpTtwMnL0_PGNjnF0zKif
    oR9th4OSYOzFQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvddttddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpeffhffvuffkgggtugesghdtreertd
    dtjeenucfhrhhomhepofgrrhgvkhcuofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhi
    uceomhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomheqne
    cuggftrfgrthhtvghrnheptddugfetudevudeiveevgfetueejlefggffghffhhfehtdff
    feefgfduueegfefhnecukfhppeeluddrieejrdejledrgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhi
    sghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:ukV8YFYp5Zu7VoAIRtcO-gQ16DfPHDgtepevVjgm8iS4ySzilvx4mA>
    <xmx:ukV8YMVJ4TceV99kPtbCHVbK21OBcjltvALMfMXDEFV0nMTWqfAWeQ>
    <xmx:ukV8YDkrE0d6i1emtxxc3N338sJgEgnzTE0RJhO08Lkms9Erx9yihA>
    <xmx:ukV8YNmrXpxeAi-UOnlEx7PUUaDgccMBoUSo4QqKs2etPVnHiMyyew>
Date: Sun, 18 Apr 2021 16:44:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: kernel NULL pointer dereference in gntdev_mmap ->
 mmu_interval_notifier_remove
Message-ID: <YHxFtj3dyjFbeusP@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="2+6I+Dj4NzXKj/UC"
Content-Disposition: inline


--2+6I+Dj4NzXKj/UC
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 18 Apr 2021 16:44:06 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: kernel NULL pointer dereference in gntdev_mmap ->
 mmu_interval_notifier_remove

Hi,

I've recently got the crash like below. I'm not sure what exactly
triggers it (besides grant table mapping as seen in the call trace), and
also I don't have reliable reproducer. It happened once for about ~30
startups.

Previous version tested was 5.10.25 and it didn't happened there, but
since reproduction rate is not great, it could be just luck...

[ 1053.550389] BUG: kernel NULL pointer dereference, address: 0000000000000=
3b0
[ 1053.557844] #PF: supervisor read access in kernel mode
[ 1053.557847] #PF: error_code(0x0000) - not-present page
[ 1053.557851] PGD 0 P4D 0=20
[ 1053.557858] Oops: 0000 [#1] SMP NOPTI
[ 1053.557863] CPU: 1 PID: 8806 Comm: Xorg Tainted: G        W         5.10=
=2E28-1.fc32.qubes.x86_64 #1
[ 1053.557865] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS =
0.0.0 02/06/2015
[ 1053.557876] RIP: e030:mmu_interval_notifier_remove+0x2e/0x190
[ 1053.557879] Code: 00 41 55 41 54 55 48 89 fd 53 48 83 ec 30 4c 8b 67 38 =
65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 c7 04 24 00 00 00 00 <49=
> 8b 9c 24 b0 03 00 00 48 c7 44 24 08 00 00 00 00 48 c7 44 24 10
[ 1053.557881] RSP: e02b:ffffc90041617d18 EFLAGS: 00010246
[ 1053.557883] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[ 1053.557884] RDX: 0000000000000001 RSI: ffffffff81c3e9a0 RDI: ffff8881258=
8b700
[ 1053.557885] RBP: ffff88812588b700 R08: 7fffffffffffffff R09: 00000000000=
00000
[ 1053.557886] R10: ffff8881088d4708 R11: ffff888108aa6180 R12: 00000000000=
00000
[ 1053.557887] R13: 00000000fffffffc R14: ffff888106a3ec00 R15: ffff888106a=
3ec10
[ 1053.557913] FS:  0000716f7f9a3a40(0000) GS:ffff888140300000(0000) knlGS:=
0000000000000000
[ 1053.557915] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1053.557916] CR2: 00000000000003b0 CR3: 0000000105cf4000 CR4: 00000000000=
00660
[ 1053.557919] Call Trace:
[ 1053.557944]  gntdev_mmap+0x275/0x2f9 [xen_gntdev]
[ 1053.557950]  mmap_region+0x47e/0x720
[ 1053.557953]  do_mmap+0x438/0x540
[ 1053.557959]  ? security_mmap_file+0x81/0xd0
[ 1053.557963]  vm_mmap_pgoff+0xdf/0x130
[ 1053.557967]  ksys_mmap_pgoff+0x1d6/0x240
[ 1053.557973]  do_syscall_64+0x33/0x40
[ 1053.557977]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[ 1053.557981] RIP: 0033:0x716f7fe8c2e6
[ 1053.557985] Code: 01 00 66 90 f3 0f 1e fa 41 f7 c1 ff 0f 00 00 75 2b 55 =
48 89 fd 53 89 cb 48 85 ff 74 37 41 89 da 48 89 ef b8 09 00 00 00 0f 05 <48=
> 3d 00 f0 ff ff 77 62 5b 5d c3 0f 1f 80 00 00 00 00 48 8b 05 79
[ 1053.557986] RSP: 002b:00007ffcb4ef35c8 EFLAGS: 00000246 ORIG_RAX: 000000=
0000000009
[ 1053.557988] RAX: ffffffffffffffda RBX: 0000000000000001 RCX: 0000716f7fe=
8c2e6
[ 1053.557989] RDX: 0000000000000001 RSI: 0000000000001000 RDI: 00000000000=
00000
[ 1053.557990] RBP: 0000000000000000 R08: 0000000000000009 R09: 00000000000=
00000
[ 1053.557991] R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffcb4e=
f35e0
[ 1053.557992] R13: 0000000000000001 R14: 0000000000000009 R15: 00000000000=
00001
[ 1053.557995] Modules linked in: loop nf_tables nfnetlink vfat fat xfs snd=
_hda_codec_generic ledtrig_audio snd_hda_intel snd_intel_dspcfg soundwire_i=
ntel soundwire_generic_allocation ppdev snd_soc_core snd_compress snd_pcm_d=
maengine soundwire_cadence joydev snd_hda_codec snd_hda_core ac97_bus snd_h=
wdep snd_seq snd_seq_device snd_pcm edac_mce_amd snd_timer pcspkr snd sound=
core e1000e i2c_piix4 parport_pc parport xenfs fuse ip_tables dm_crypt boch=
s_drm drm_vram_helper drm_kms_helper cec drm_ttm_helper ttm serio_raw drm v=
irtio_scsi virtio_console ehci_pci ehci_hcd ata_generic pata_acpi floppy qe=
mu_fw_cfg xen_privcmd xen_pciback xen_blkback xen_gntalloc xen_gntdev xen_e=
vtchn uinput
[ 1053.558040] CR2: 00000000000003b0
[ 1053.558135] ---[ end trace 3c5c2ca63aac717a ]---
[ 1054.277085] snd_hda_intel 0000:00:03.0: IRQ timing workaround is activat=
ed for card #0. Suggest a bigger bdl_pos_adj.
[ 1054.927022] RIP: e030:mmu_interval_notifier_remove+0x2e/0x190
[ 1054.929170] Code: 00 41 55 41 54 55 48 89 fd 53 48 83 ec 30 4c 8b 67 38 =
65 48 8b 04 25 28 00 00 00 48 89 44 24 28 31 c0 48 c7 04 24 00 00 00 00 <49=
> 8b 9c 24 b0 03 00 00 48 c7 44 24 08 00 00 00 00 48 c7 44 24 10
[ 1054.937800] RSP: e02b:ffffc90041617d18 EFLAGS: 00010246
[ 1054.947281] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00000
[ 1054.949535] RDX: 0000000000000001 RSI: ffffffff81c3e9a0 RDI: ffff8881258=
8b700
[ 1054.973016] RBP: ffff88812588b700 R08: 7fffffffffffffff R09: 00000000000=
00000
[ 1054.976678] R10: ffff8881088d4708 R11: ffff888108aa6180 R12: 00000000000=
00000
[ 1054.978850] R13: 00000000fffffffc R14: ffff888106a3ec00 R15: ffff888106a=
3ec10
[ 1054.980751] FS:  0000716f7f9a3a40(0000) GS:ffff888140300000(0000) knlGS:=
0000000000000000
[ 1054.982878] CS:  e030 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1054.984509] CR2: 00000000000003b0 CR3: 0000000105cf4000 CR4: 00000000000=
00660
[ 1054.990508] Kernel panic - not syncing: Fatal exception
[ 1054.991967] Kernel Offset: disabled
(XEN) Hardware Dom0 crashed: rebooting machine in 5 seconds.

Looking at the surrounding code, it is access to 0x3b0(%r12), which is
0x38(%rdi):

ffffffff812f5930 <mmu_interval_notifier_remove>:
ffffffff812f5930:       e8 8b 09 d7 ff          callq  ffffffff810662c0 <__=
fentry__>
ffffffff812f5935:       41 55                   push   %r13
ffffffff812f5937:       41 54                   push   %r12
ffffffff812f5939:       55                      push   %rbp
ffffffff812f593a:       48 89 fd                mov    %rdi,%rbp
ffffffff812f593d:       53                      push   %rbx
ffffffff812f593e:       48 83 ec 30             sub    $0x30,%rsp
ffffffff812f5942:       4c 8b 67 38             mov    0x38(%rdi),%r12
ffffffff812f5946:       65 48 8b 04 25 28 00    mov    %gs:0x28,%rax
ffffffff812f594d:       00 00=20
ffffffff812f594f:       48 89 44 24 28          mov    %rax,0x28(%rsp)
ffffffff812f5954:       31 c0                   xor    %eax,%eax
ffffffff812f5956:       48 c7 04 24 00 00 00    movq   $0x0,(%rsp)
ffffffff812f595d:       00=20
ffffffff812f595e:       49 8b 9c 24 b0 03 00    mov    0x3b0(%r12),%rbx
ffffffff812f5965:       00=20

If my calculation is right, it means map->notifier->mm is NULL.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--2+6I+Dj4NzXKj/UC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmB8RbcACgkQ24/THMrX
1yxybAf/SM0WYhntjqU25pnhyY45urc8C7+N4+K1pfiYhvQay9yE9hjw5ADCEGjA
fRK22UAs7b8X6SWBMmRZcRT/3iI+VhNpSPluqDgY+xkk0uvtt5dl3jKC28yrlonI
b6XFhzR49X2kfNBqI8h0O19/LVOG2RKEHNypTwKFAb/7rpbwjkTyFdYwpwono9jA
rd7OnI8g5JRcggROuSLUEUSLm84qfNTfitjcoaNgXJYHZZ71vMN13+rtZkArqc1x
j4Q+U7iaT7nsjeq3wp/z7xDfG2i8yb+I+RXb0bAs8ycFSghfS4lQHPuRVuaV8mlO
Caf0nTHd8jMY/ZJI+4KHawTPCQahnA==
=I7Hh
-----END PGP SIGNATURE-----

--2+6I+Dj4NzXKj/UC--

