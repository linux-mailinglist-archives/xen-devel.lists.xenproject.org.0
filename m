Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C2291298E99
	for <lists+xen-devel@lfdr.de>; Mon, 26 Oct 2020 14:55:42 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.12342.32166 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2y4-0007wq-UA; Mon, 26 Oct 2020 13:55:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 12342.32166; Mon, 26 Oct 2020 13:55:24 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kX2y4-0007wR-QI; Mon, 26 Oct 2020 13:55:24 +0000
Received: by outflank-mailman (input) for mailman id 12342;
 Mon, 26 Oct 2020 13:55:23 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1kX2y3-0007wM-74
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:55:23 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f8782f2f-cccf-490b-be74-30fc249871dd;
 Mon, 26 Oct 2020 13:55:21 +0000 (UTC)
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=Dsar=EB=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
	id 1kX2y3-0007wM-74
	for xen-devel@lists.xenproject.org; Mon, 26 Oct 2020 13:55:23 +0000
X-Inumbo-ID: f8782f2f-cccf-490b-be74-30fc249871dd
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id f8782f2f-cccf-490b-be74-30fc249871dd;
	Mon, 26 Oct 2020 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1603720521;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to;
  bh=wA4Bb9MdIDNPRKyJ32yU/qbfeRXOGFjmhf9hghEdhgs=;
  b=WfY4nImOp84H1iNGL1tXRIztyrIBp48g2730eK5eiHrPYDbjV0gQvGuj
   UJTUYr2EtGI4fqqvaEX2G8WEJ+prX4rUIIG1UrpkGB243XtbvO6Eay97a
   7VEEw9uWhzbyE17FbgjG0WH34FMyMedI7tzW1uOOmld8ny2+aa57er/LX
   g=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: qpxJKNKJ347VBdUy9zJ3ZSghHRMxR/BTnjGjJLi7Kj4meswgFDkA2RguwqDnthxAPsRkifHSOt
 B9+3wWteUI1jUPRj6tT+TN8YZGs5qWOD5d2/B/TDS4cL5GZRk5HTjil8ZcRvMbH8woSwBjKmG2
 Xmdc4M2wCuGL8K/rYA25ZSkykZa3oBCZc/ak//MwjDEiuOsey7Xk6h/egsmkTZXK3slnjHBw59
 Ctmi3lp902fwYn6YfkD24YcYTZl/4UqJAar9oN4t6M89zdm3hvuiJ4U8qcqMAtLG8E/ijMD2JA
 1rg=
X-SBRS: None
X-MesageID: 29783135
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.77,419,1596513600"; 
   d="asc'?scan'208";a="29783135"
Subject: Re: Recent upgrade of 4.13 -> 4.14 issue
To: =?UTF-8?B?RnLDqWTDqXJpYyBQaWVycmV0?= <frederic.pierret@qubes-os.org>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
CC: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?=
	<marmarek@invisiblethingslab.com>
References: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
From: Andrew Cooper <andrew.cooper3@citrix.com>
Message-ID: <30452e9c-bf27-fce2-cc20-4ce91018a15a@citrix.com>
Date: Mon, 26 Oct 2020 13:54:38 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <a8e9113c-70ef-53fa-e340-be15eb3cba57@qubes-os.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="t9lahTrSAdTYQgHuSPbDHYIyNAZ3SGZJH"
X-ClientProxiedBy: AMSPEX02CAS01.citrite.net (10.69.22.112) To
 FTLPEX02CL04.citrite.net (10.13.108.177)

--t9lahTrSAdTYQgHuSPbDHYIyNAZ3SGZJH
Content-Type: multipart/mixed; boundary="80iG2zyIyucGufSbPuRTmviQwt5RJC8dy"

--80iG2zyIyucGufSbPuRTmviQwt5RJC8dy
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Language: en-GB

On 26/10/2020 13:37, Fr=C3=A9d=C3=A9ric Pierret wrote:
> Hi all,
>
> I'm experiencing problem with a HP ProLiant DL360p Gen8 and recent
> upgrade of 4.13 -> 4.14. dom0 and the entire system becomes unstable
> and freeze at some point.
>
> I've managed to get three pieces of logs (last one after a reboot and
> just before total freeze) by connecting to the serial console with
> loglvl options and also redirecting linux kernel output to the serial
> console:
>
> ```
> [ 2150.954883] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2150.954934] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 7-...0: (3 GPs behind)
> idle=3D842/1/0x4000000000000000 softirq=3D64670/64671 fqs=3D14673
> [ 2150.954962]=C2=A0=C2=A0=C2=A0=C2=A0 (detected by 12, t=3D60002 jiffi=
es, g=3D236593, q=3D126)
> [ 2150.954984] Sending NMI from CPU 12 to CPUs 7:
> [ 2160.968519] rcu: rcu_sched kthread starved for 10008 jiffies!
> g236593 f0x0 RCU_GP_DOING_FQS(6) ->state=3D0x0 ->cpu=3D9
> [ 2160.968568] rcu: RCU grace-period kthread stack dump:
> [ 2160.968586] rcu_sched=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 R=C2=A0 ru=
nning task=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 =
10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2
> 0x80004000
> [ 2160.968612] Call Trace:
> [ 2160.968634]=C2=A0 ? xen_hypercall_xen_version+0xa/0x20
> [ 2160.968658]=C2=A0 ? xen_force_evtchn_callback+0x9/0x10
> [ 2160.968918]=C2=A0 ? check_events+0x12/0x20
> [ 2160.968946]=C2=A0 ? schedule+0x39/0xa0
> [ 2160.968964]=C2=A0 ? schedule_timeout+0x96/0x150
> [ 2160.968981]=C2=A0 ? __next_timer_interrupt+0xd0/0xd0
> [ 2160.969002]=C2=A0 ? rcu_gp_fqs_loop+0xea/0x2a0
> [ 2160.969019]=C2=A0 ? rcu_gp_kthread+0xb5/0x140
> [ 2160.969035]=C2=A0 ? rcu_gp_init+0x470/0x470
> [ 2160.969052]=C2=A0 ? kthread+0x115/0x140
> [ 2160.969067]=C2=A0 ? __kthread_bind_mask+0x60/0x60
> [ 2160.969085]=C2=A0 ? ret_from_fork+0x35/0x40
> ```
>
> and also
>
> ```
> [ 2495.945931] CPU: 14 PID: 24181 Comm: Xorg Not tainted
> 5.4.72-2.qubes.x86_64 #1
> [ 2495.945954] Hardware name: HP ProLiant DL360p Gen8, BIOS P71
> 05/24/2019
> [ 2495.945984] RIP: e030:smp_call_function_many+0x20a/0x270
> [ 2495.946004] Code: 8a 00 3b 05 4c b5 69 01 89 c7 0f 83 89 fe ff ff
> 48 63 c7 49 8b 17 48 03 14 c5 80 f9 3d 82 8b 42 18 a8 01 74 09 f3 90
> 8b 42 18 <a8> 01 75 f7 eb c9 48 c7 c2 a0 6f 82 82 4c 89 f6 89 df e8 bf =
b2
> 8a
> [ 2495.946051] RSP: e02b:ffffc90003aa7cf0 EFLAGS: 00000202
> [ 2495.946068] RAX: 0000000000000003 RBX: 0000000000000010 RCX:
> 0000000000000007
> [ 2495.946090] RDX: ffff8882413ef640 RSI: 0000000000000010 RDI:
> 0000000000000007
> [ 2495.946113] RBP: ffffffff81082fc0 R08: 0000000000000007 R09:
> 0000000000000000
> [ 2495.946134] R10: 0000000000000000 R11: ffffffff8265b6a8 R12:
> 0000000000000000
> [ 2495.946156] R13: 0000000000000001 R14: 0000000000029ac0 R15:
> ffff8882415a9b00
> [ 2495.946211] FS:=C2=A0 00007a0d51a91a40(0000) GS:ffff888241580000(000=
0)
> knlGS:0000000000000000
> [ 2495.946235] CS:=C2=A0 e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2495.946253] CR2: 000070abab15a000 CR3: 00000001e18ee000 CR4:
> 0000000000040660
> [ 2495.946290] Call Trace:
> [ 2495.946314]=C2=A0 ? do_kernel_range_flush+0x50/0x50
> [ 2495.946334]=C2=A0 on_each_cpu+0x28/0x50
> [ 2495.946354]=C2=A0 decrease_reservation+0x22f/0x310
> [ 2495.946377]=C2=A0 alloc_xenballooned_pages+0xeb/0x120
> [ 2495.946396]=C2=A0 ? __kmalloc+0x183/0x260
> [ 2495.946413]=C2=A0 gnttab_alloc_pages+0x11/0x40
> [ 2495.946434]=C2=A0 gntdev_alloc_map+0x12f/0x250 [xen_gntdev]
> [ 2495.946454]=C2=A0 gntdev_ioctl_map_grant_ref+0x73/0x1d0 [xen_gntdev]=

> [ 2495.946479]=C2=A0 do_vfs_ioctl+0x2fb/0x490
> [ 2495.946500]=C2=A0 ? syscall_trace_enter+0x1d1/0x2c0
> [ 2495.946551]=C2=A0 ksys_ioctl+0x5e/0x90
> [ 2495.946567]=C2=A0 __x64_sys_ioctl+0x16/0x20
> [ 2495.946583]=C2=A0 do_syscall_64+0x5b/0xf0
> [ 2495.946601]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 2495.946620] RIP: 0033:0x7a0d51f763bb
> [ 2495.946727] Code: 0f 1e fa 48 8b 05 dd aa 0c 00 64 c7 00 26 00 00
> 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ad aa 0c 00 f7 d8 64 89 =
01
> 48
> [ 2495.946804] RSP: 002b:00007fffc48d5058 EFLAGS: 00000206 ORIG_RAX:
> 0000000000000010
> [ 2495.946863] RAX: ffffffffffffffda RBX: 0000000000001000 RCX:
> 00007a0d51f763bb
> [ 2495.946885] RDX: 00007fffc48d5060 RSI: 0000000000184700 RDI:
> 0000000000000009
> [ 2495.946939] RBP: 00007fffc48d5100 R08: 00007fffc48d512c R09:
> 00007a0d51a30010
> [ 2495.946998] R10: 0000000000000000 R11: 0000000000000206 R12:
> 00007fffc48d5060
> [ 2495.947020] R13: 0000000000000001 R14: 0000000000000009 R15:
> 0000000000000001
> [ 2510.964667] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 2510.964716] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 7-...0: (3 GPs behind)
> idle=3D842/1/0x4000000000000000 softirq=3D64670/64671 fqs=3D96182
> [ 2510.964744]=C2=A0=C2=A0=C2=A0=C2=A0 (detected by 12, t=3D420012 jiff=
ies, g=3D236593, q=3D11404)
> [ 2510.964769] Sending NMI from CPU 12 to CPUs 7:
> [ 2523.945643] watchdog: BUG: soft lockup - CPU#14 stuck for 22s!
> [Xorg:24181]
> [ 2523.945686] Modules linked in: snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device snd_timer snd soundcore br_netfilter xt_physdev
> xen_netback loop bridge stp llc rfkill ebtable_filter ebtables
> ip6table_filter ip
> 6_tables iptable_filter intel_rapl_msr iTCO_wdt ipmi_ssif
> iTCO_vendor_support intel_rapl_common sb_edac rapl raid456
> async_raid6_recov async_memcpy async_pq async_xor async_tx xor
> raid6_pq pcspkr joydev hpilo lpc
> _ich hpwdt ioatdma dca tg3 r8169 ipmi_si ipmi_devintf ipmi_msghandler
> acpi_power_meter xenfs ip_tables dm_thin_pool dm_persistent_data
> libcrc32c dm_bio_prison dm_crypt uas usb_storage uhci_hcd
> crct10dif_pclmul cr
> c32_pclmul crc32c_intel ghash_clmulni_intel mgag200 drm_kms_helper
> serio_raw drm_vram_helper ttm drm ata_generic pata_acpi i2c_algo_bit
> ehci_pci ehci_hcd xhci_pci xhci_hcd hpsa scsi_transport_sas
> xen_privcmd xen_
> pciback xen_blkback xen_gntalloc xen_gntdev xen_evtchn uinput
> pkcs8_key_parser
> [ 2523.945934] CPU: 14 PID: 24181 Comm: Xorg Tainted: G=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> L=C2=A0=C2=A0=C2=A0 5.4.72-2.qubes.x86_64 #1
> [ 2523.945960] Hardware name: HP ProLiant DL360p Gen8, BIOS P71
> 05/24/2019
> [ 2523.945989] RIP: e030:smp_call_function_many+0x20a/0x270
> [ 2523.946010] Code: 8a 00 3b 05 4c b5 69 01 89 c7 0f 83 89 fe ff ff
> 48 63 c7 49 8b 17 48 03 14 c5 80 f9 3d 82 8b 42 18 a8 01 74 09 f3 90
> 8b 42 18 <a8> 01 75 f7 eb c9 48 c7 c2 a0 6f 82 82 4c 89 f6 89 df e8 bf =
b2
> 8a
> [ 2523.946057] RSP: e02b:ffffc90003aa7cf0 EFLAGS: 00000202
> [ 2523.946075] RAX: 0000000000000003 RBX: 0000000000000010 RCX:
> 0000000000000007
> [ 2523.946097] RDX: ffff8882413ef640 RSI: 0000000000000010 RDI:
> 0000000000000007
> [ 2523.946119] RBP: ffffffff81082fc0 R08: 0000000000000007 R09:
> 0000000000000000
> [ 2523.946162] R10: 0000000000000000 R11: ffffffff8265b6a8 R12:
> 0000000000000000
> [ 2523.946184] R13: 0000000000000001 R14: 0000000000029ac0 R15:
> ffff8882415a9b00
> [ 2523.946233] FS:=C2=A0 00007a0d51a91a40(0000) GS:ffff888241580000(000=
0)
> knlGS:0000000000000000
> [ 2523.946256] CS:=C2=A0 e030 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 2523.946275] CR2: 000070abab15a000 CR3: 00000001e18ee000 CR4:
> 0000000000040660
> [ 2523.946313] Call Trace:
> [ 2523.946336]=C2=A0 ? do_kernel_range_flush+0x50/0x50
> [ 2523.946356]=C2=A0 on_each_cpu+0x28/0x50
> [ 2523.946376]=C2=A0 decrease_reservation+0x22f/0x310
> [ 2523.946397]=C2=A0 alloc_xenballooned_pages+0xeb/0x120
> [ 2523.946418]=C2=A0 ? __kmalloc+0x183/0x260
> [ 2523.946434]=C2=A0 gnttab_alloc_pages+0x11/0x40
> [ 2523.946457]=C2=A0 gntdev_alloc_map+0x12f/0x250 [xen_gntdev]
> [ 2523.946478]=C2=A0 gntdev_ioctl_map_grant_ref+0x73/0x1d0 [xen_gntdev]=

> [ 2523.946502]=C2=A0 do_vfs_ioctl+0x2fb/0x490
> [ 2523.946559]=C2=A0 ? syscall_trace_enter+0x1d1/0x2c0
> [ 2523.946578]=C2=A0 ksys_ioctl+0x5e/0x90
> [ 2523.946594]=C2=A0 __x64_sys_ioctl+0x16/0x20
> [ 2523.946610]=C2=A0 do_syscall_64+0x5b/0xf0
> [ 2523.946713]=C2=A0 entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 2523.946738] RIP: 0033:0x7a0d51f763bb
> [ 2523.946782] Code: 0f 1e fa 48 8b 05 dd aa 0c 00 64 c7 00 26 00 00
> 00 48 c7 c0 ff ff ff ff c3 66 0f 1f 44 00 00 f3 0f 1e fa b8 10 00 00
> 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d ad aa 0c 00 f7 d8 64 89 =
01
> 48
> [ 2523.946867] RSP: 002b:00007fffc48d5058 EFLAGS: 00000206 ORIG_RAX:
> 0000000000000010
> [ 2523.946927] RAX: ffffffffffffffda RBX: 0000000000001000 RCX:
> 00007a0d51f763bb
> [ 2523.946950] RDX: 00007fffc48d5060 RSI: 0000000000184700 RDI:
> 0000000000000009
> [ 2523.946972] RBP: 00007fffc48d5100 R08: 00007fffc48d512c R09:
> 00007a0d51a30010
> [ 2523.947029] R10: 0000000000000000 R11: 0000000000000206 R12:
> 00007fffc48d5060
> [ 2523.947051] R13: 0000000000000001 R14: 0000000000000009 R15:
> 0000000000000001
> ```
>
> and finally
>
> ```
> [ 1597.971380] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [ 1597.971409] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 0-...0: (5 ticks this GP) i=
dle=3Dcd2/0/0x1
> softirq=3D59121/59122 fqs=3D14998
> [ 1597.971420] rcu:=C2=A0=C2=A0=C2=A0=C2=A0 7-...0: (2 ticks this GP)
> idle=3De9e/1/0x4000000000000000 softirq=3D49519/49519 fqs=3D14998
> [ 1597.971431]=C2=A0=C2=A0=C2=A0=C2=A0 (detected by 11, t=3D60002 jiffi=
es, g=3D234321, q=3D83)
> [ 1597.971441] Sending NMI from CPU 11 to CPUs 0:
> [ 1597.972452] NMI backtrace for cpu 0
> [ 1597.972453] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 5.4.72-2.qubes.x86_64 #1
> [ 1597.972453] Hardware name: HP ProLiant DL360p Gen8, BIOS P71
> 05/24/2019
> [ 1597.972454] RIP: e030:xen_hypercall_sched_op+0xa/0x20
> [ 1597.972454] Code: 51 41 53 b8 1c 00 00 00 0f 05 41 5b 59 c3 cc cc
> cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc 51 41 53 b8 1d 00 00
> 00 0f 05 <41> 5b 59 c3 cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc cc =
cc
> cc
> [ 1597.972455] RSP: e02b:ffffc90001403d88 EFLAGS: 00000002
> [ 1597.972456] RAX: 0000000000000000 RBX: ffff888241215f80 RCX:
> ffffffff810013aa
> [ 1597.972456] RDX: ffff88823c070428 RSI: ffffc90001403da8 RDI:
> 0000000000000003
> [ 1597.972456] RBP: ffff8882365d8bf0 R08: ffffffff8265b6a0 R09:
> 0000000000000000
> [ 1597.972457] R10: 0000000000000000 R11: 0000000000000202 R12:
> 0000000000000049
> [ 1597.972457] R13: 0000000000000100 R14: ffff8882422b6640 R15:
> 0000000000000001
> [ 1597.972458] FS:=C2=A0 0000729633b7d700(0000) GS:ffff888241200000(000=
0)
> knlGS:0000000000000000
> [ 1597.972458] CS:=C2=A0 10000e030 DS: 0000 ES: 0000 CR0: 0000000080050=
033
> [ 1597.972458] CR2: 000077f6508c47c0 CR3: 000000020d006000 CR4:
> 0000000000040660
> [ 1597.972459] Call Trace:
> [ 1597.972459]=C2=A0 <IRQ>
> [ 1597.972459]=C2=A0 ? xen_poll_irq+0x73/0xa0
> [ 1597.972459]=C2=A0 ? xen_qlock_wait+0x7b/0x80
> [ 1597.972460]=C2=A0 ? pv_wait_head_or_lock+0x85/0xb0
> [ 1597.972460]=C2=A0 ? __pv_queued_spin_lock_slowpath+0xb5/0x1b0
> [ 1597.972460]=C2=A0 ? _raw_spin_lock_irqsave+0x32/0x40
> [ 1597.972461]=C2=A0 ? bfq_finish_requeue_request+0xb5/0x120
> [ 1597.972461]=C2=A0 ? blk_mq_free_request+0x3a/0xf0
> [ 1597.972461]=C2=A0 ? scsi_end_request+0x95/0x140
> [ 1597.972461]=C2=A0 ? scsi_io_completion+0x74/0x190
> [ 1597.972462]=C2=A0 ? blk_done_softirq+0xea/0x180
> [ 1597.972462]=C2=A0 ? __do_softirq+0xd9/0x2c8
> [ 1597.972462]=C2=A0 ? irq_exit+0xcf/0x110
> [ 1597.972462]=C2=A0 ? xen_evtchn_do_upcall+0x2c/0x40
> [ 1597.972463]=C2=A0 ? xen_do_hypervisor_callback+0x29/0x40
> [ 1597.972463]=C2=A0 </IRQ>
> [ 1597.972463]=C2=A0 ? xen_hypercall_sched_op+0xa/0x20
> [ 1597.972464]=C2=A0 ? xen_hypercall_sched_op+0xa/0x20
> [ 1597.972464]=C2=A0 ? xen_safe_halt+0xc/0x20
> [ 1597.972464]=C2=A0 ? default_idle+0x1a/0x140
> [ 1597.972465]=C2=A0 ? cpuidle_idle_call+0x139/0x190
> [ 1597.972465]=C2=A0 ? do_idle+0x73/0xd0
> [ 1597.972465]=C2=A0 ? cpu_startup_entry+0x19/0x20
> [ 1597.972466]=C2=A0 ? start_kernel+0x68a/0x6bf
> [ 1597.972466]=C2=A0 ? xen_start_kernel+0x6a2/0x6c1
> [ 1597.972470] Sending NMI from CPU 11 to CPUs 7:
> [ 1607.976873] rcu: rcu_sched kthread starved for 10007 jiffies!
> g234321 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D11
> [ 1607.976924] rcu: RCU grace-period kthread stack dump:
> [ 1607.976942] rcu_sched=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 I=C2=A0=C2=
=A0=C2=A0 0=C2=A0=C2=A0=C2=A0 10=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 2 0x800040=
00
> [ 1607.976972] Call Trace:
> [ 1607.976999]=C2=A0 __schedule+0x217/0x570
> [ 1607.977020]=C2=A0 ? schedule+0x39/0xa0
> [ 1607.977038]=C2=A0 ? schedule_timeout+0x96/0x150
> [ 1607.977056]=C2=A0 ? __next_timer_interrupt+0xd0/0xd0
> [ 1607.977079]=C2=A0 ? rcu_gp_fqs_loop+0xea/0x2a0
> [ 1607.977096]=C2=A0 ? rcu_gp_kthread+0xb5/0x140
> [ 1607.977112]=C2=A0 ? rcu_gp_init+0x470/0x470
> [ 1607.977130]=C2=A0 ? kthread+0x115/0x140
> [ 1607.977145]=C2=A0 ? __kthread_bind_mask+0x60/0x60
> [ 1607.977164]=C2=A0 ? ret_from_fork+0x35/0x40
> ```
>
> I've tried to increase memory, set maximum of dom0 vcps to 1 or 4, pin
> vcpus too, multiple 5.4 kernels tool...no luck.
>
> I've also observed that some (never the same) VM (PVH or HVM) fail to
> start randomly because of being stuck at boot time with analog stack
> trace as the first piece of log provided above. Those VM are
> impossible to desroy and then it "propagates" though dom0 with the two
> latest piece of codes.
>
> If anyone would have any idea of what's going on, that would be very
> appreciated. Thank you.

Does booting Xen with `sched=3Dcredit` make a difference?

~Andrew


--80iG2zyIyucGufSbPuRTmviQwt5RJC8dy--

--t9lahTrSAdTYQgHuSPbDHYIyNAZ3SGZJH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEzzVJW36m9w6nfSF2ZcP5BqXXn6AFAl+W1SUACgkQZcP5BqXX
n6DGTw/5AZ4OhkG469Z9v2QwZ2bD7OVw25TesyJSwW26M5RQ7gHyB1/pMNwSun2q
l7rhnsVxwioYDwOElnKW5KHufTisYOh6lSJ9z0QLq6TQkdKVc58GS4XsKoNFP8n6
mLkmgH8FtFxnbOUKpUd8cTyOnRrN47KxicNIvLrAb57dorkaQ0Q9EdEvG1Y37AwE
f8m2BGwNXMzDzrinYFqtjnSmeglmGNcpIFskGHikRw84Dcx90PY++o1bj1N7KOUi
Hbtxnt7rrBVkhJOQ5rfQzz+s3exa/rgW2BIr8HH79uUNNv7fyWfPiMd6iXFhJzCu
1rddbh56PjL1JS4zhnmkU/E8wUyM/Pu8TjuBBWnQGPVIcZWXNXR8hgHINuy7U2Z3
vQft/jILIrM0xE9Uz3bj4Wag5S7B+FT9IZD0I/L7WaTHSeHQO6oP+vlKbmLReM3/
r5DmHcQQC8qNSfbvBDYwD8so5vNKPgBuu1xJiN1LoblJsFoZxSRWypYDHZ9/Vvv4
fRvO8uEHwvMBhaJMlmvaEzzNSTc3f9GumjHVuhzmoBJRzV/5bDFpyQw0NRVU/VpM
/NObA54dDMMAS/pV2N52YmQRdwBBjFciOLIARe6ocQzZkOY7RjD9Q8C4UC/Lkjs7
wsOGKmth6UDFh6GNM5mUXeS2FQjmk9m1dgblnnI7ou0I81KG7rU=
=sh0S
-----END PGP SIGNATURE-----

--t9lahTrSAdTYQgHuSPbDHYIyNAZ3SGZJH--

