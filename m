Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 192DB7D413F
	for <lists+xen-devel@lfdr.de>; Mon, 23 Oct 2023 22:50:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.621607.968229 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv1se-0001KN-CA; Mon, 23 Oct 2023 20:50:32 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 621607.968229; Mon, 23 Oct 2023 20:50:32 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qv1se-0001JJ-91; Mon, 23 Oct 2023 20:50:32 +0000
Received: by outflank-mailman (input) for mailman id 621607;
 Mon, 23 Oct 2023 20:50:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=F7kl=GF=casper.srs.infradead.org=BATV+91fa634947ba19782c4e+7365+infradead.org+dwmw2@srs-se1.protection.inumbo.net>)
 id 1qv1sb-0001JD-J4
 for xen-devel@lists.xenproject.org; Mon, 23 Oct 2023 20:50:30 +0000
Received: from casper.infradead.org (casper.infradead.org
 [2001:8b0:10b:1236::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cb41a5bf-71e5-11ee-98d5-6d05b1d4d9a1;
 Mon, 23 Oct 2023 22:50:27 +0200 (CEST)
Received: from [2001:8b0:10b:5:545e:5208:5de0:9d33]
 (helo=u3832b3a9db3152.ant.amazon.com)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1qv1sV-00Fw6k-0u; Mon, 23 Oct 2023 20:50:23 +0000
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
X-Inumbo-ID: cb41a5bf-71e5-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=MIME-Version:Content-Type:Date:Cc:To:
	From:Subject:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=O80/DgkQXsRtr8Qsj2IUAKR7audyfvwsPYnnmQxMmQU=; b=Zxg8RCOSY8tU7rTJ+5oEvRL3F6
	qpVKvJJaTDCCI2GjW+QvZCZ2zOp/6Kpj3gaCgXIh5lKEaz7WfsYZZz7BLWUJHMV/w1/4dd7k34xUz
	FzgFBbmtWkpr6sCNipPa3A7ge3xZAB9NEAHTjqMuMajj/ZTZ0cGWBiTcC7e7wevOJ8KCeX2jnd9nK
	H0MkFVCtAS4dJpNxfSLuWuPic3SQr1mFCdPeiSsWyaV7L0kKcM3Ulo6Y4O9BaTAvlsYf+aSmxzbTt
	JvMAkQ65ma7qUYuj0/xLoAh+NWAMjnb9eGlFq7jZSBKuY4qQdNhlbD+qDhyXK2pBMrDXw0SFUc8Qr
	5N2bMrVQ==;
Message-ID: <b28fff67f7501e4713af9b8c777f853cc44d6c6f.camel@infradead.org>
Subject: Lockdep show 6.6-rc regression in Xen HVM CPU hotplug
From: David Woodhouse <dwmw2@infradead.org>
To: Juergen Gross <jgross@suse.com>, xen-devel
 <xen-devel@lists.xenproject.org>,  paulmck <paulmck@kernel.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Oleksandr Tyshchenko
 <oleksandr_tyshchenko@epam.com>, Rahul Singh <rahul.singh@arm.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Date: Mon, 23 Oct 2023 21:50:22 +0100
Content-Type: multipart/signed; micalg="sha-256"; protocol="application/pkcs7-signature";
	boundary="=-SrElBF+d/If5CbumhQBe"
User-Agent: Evolution 3.44.4-0ubuntu2 
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html


--=-SrElBF+d/If5CbumhQBe
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Since commit 87797fad6cce ("xen/events: replace evtchn_rwlock with
RCU"), I can no longer hotplug CPUs under Xen with lockdep enabled.

(This is real Xen 4.17.1; annoyingly I have different failure modes
with Xen guests under qemu/kvm and I'll deal with those next.)

Offlining complains thus:

[root@localhost cpu1]# echo 0 > online=20
[   52.936265]=20
[   52.936271] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   52.936274] WARNING: suspicious RCU usage
[   52.936277] 6.6.0-rc5+ #1357 Not tainted
[   52.936280] -----------------------------
[   52.936282] lib/maple_tree.c:856 suspicious rcu_dereference_check() usag=
e!
[   52.936287]=20
[   52.936287] other info that might help us debug this:
[   52.936287]=20
[   52.936289]=20
[   52.936289] RCU used illegally from offline CPU!
[   52.936289] rcu_scheduler_active =3D 2, debug_locks =3D 1
[   52.936293] 1 lock held by swapper/1/0:
[   52.936296]  #0: ffffffff89c03820 (rcu_read_lock){....}-{1:3}, at: mtree=
_load+0x90/0x590
[   52.936321]=20
[   52.936321] stack backtrace:
[   52.936324] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0-rc5+ #1357
[   52.936329] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   52.936332] Call Trace:
[   52.936335]  <TASK>
[   52.936340]  dump_stack_lvl+0x5b/0x90
[   52.936350]  lockdep_rcu_suspicious+0x15a/0x1c0
[   52.936366]  mtree_load+0x49e/0x590
[   52.936385]  irq_get_irq_data+0xe/0x20
[   52.936394]  xen_send_IPI_one+0xa4/0x100
[   52.936404]  __xen_send_IPI_mask+0x1b/0x50
[   52.936414]  generic_exec_single+0x35/0x1c0
[   52.936423]  smp_call_function_single+0xc2/0x140
[   52.936436]  ? cpuhp_report_idle_dead+0x42/0x60
[   52.936444]  do_idle+0xda/0xe0
[   52.936451]  cpu_startup_entry+0x2a/0x30
[   52.936456]  start_secondary+0x123/0x140
[   52.936465]  secondary_startup_64_no_verify+0x178/0x17b
[   52.936490]  </TASK>
[   52.936492]=20
[   52.936494] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
[   52.936496] WARNING: suspicious RCU usage
[   52.936498] 6.6.0-rc5+ #1357 Not tainted
[   52.936500] -----------------------------
[   52.936502] lib/maple_tree.c:812 suspicious rcu_dereference_check() usag=
e!
[   52.936505]=20
[   52.936505] other info that might help us debug this:
[   52.936505]=20
[   52.936507]=20
[   52.936507] RCU used illegally from offline CPU!
[   52.936507] rcu_scheduler_active =3D 2, debug_locks =3D 1
[   52.936510] 1 lock held by swapper/1/0:
[   52.936513]  #0: ffffffff89c03820 (rcu_read_lock){....}-{1:3}, at: mtree=
_load+0x90/0x590
[   52.936530]=20
[   52.936530] stack backtrace:
[   52.936532] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0-rc5+ #1357
[   52.936536] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   52.936538] Call Trace:
[   52.936540]  <TASK>
[   52.936543]  dump_stack_lvl+0x5b/0x90
[   52.936549]  lockdep_rcu_suspicious+0x15a/0x1c0
[   52.936562]  mtree_load+0x3b7/0x590
[   52.936580]  irq_get_irq_data+0xe/0x20
[   52.936586]  xen_send_IPI_one+0xa4/0x100
[   52.936594]  __xen_send_IPI_mask+0x1b/0x50
[   52.936601]  generic_exec_single+0x35/0x1c0
[   52.936609]  smp_call_function_single+0xc2/0x140
[   52.936621]  ? cpuhp_report_idle_dead+0x42/0x60
[   52.936626]  do_idle+0xda/0xe0
[   52.936632]  cpu_startup_entry+0x2a/0x30
[   52.936643]  start_secondary+0x123/0x140
[   52.936649]  secondary_startup_64_no_verify+0x178/0x17b
[   52.936672]  </TASK>
[   52.937164] smpboot: CPU 1 is now offline
[root@localhost cpu1]#=20

Onlining triple-faults:

[root@localhost cpu1]# echo 1 > online=20
[   58.049051] installing Xen timer for CPU 1
[   58.051533] smpboot: Booting Node 0 Processor 1 APIC 0x2

... and it dumps me back to the host prompt, where 'xl dmesg' says:

(XEN) *** Dumping Dom7 vcpu#1 state: ***
(XEN) ----[ Xen-4.17.1  x86_64  debug=3Dn  Not tainted ]----
(XEN) CPU:    6
(XEN) RIP:    0010:[<ffffffff88041879>]
(XEN) RFLAGS: 0000000000010002   CONTEXT: hvm guest (d7v1)
(XEN) rax: 0000000000000001   rbx: 0000000000000000   rcx: 0000000000000008
(XEN) rdx: fffffe0000001000   rsi: ffff8f364e10b048   rdi: 0000000000000001
(XEN) rbp: 0000000000000000   rsp: ffffa6f6400aff38   r8:  00000000fffffe5b
(XEN) r9:  0000000000000000   r10: ffff8f364e106078   r11: 0000000000000000
(XEN) r12: 0000000000000000   r13: 0000000000000000   r14: 0000000000000000
(XEN) r15: 0000000000000000   cr0: 0000000080050033   cr4: 00000000001300a0
(XEN) cr3: 000000002583c000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: ffff8f364e100000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: 0010

Not 100% sure where ffffffff88041879 is but there's a 'ud' at=20
0xffffffff81041879 in load_current_idt() for the
lockdep_assert_irqs_disabled().

And yes, if I comment that assertion out then onlining does succeed
without a triplefault but with a different warning:

[root@localhost cpu1]# echo 1 > online=20
[   35.843897] installing Xen timer for CPU 1
[   35.846134] smpboot: Booting Node 0 Processor 1 APIC 0x2
[   35.847297] ------------[ cut here ]------------
[   35.847307] WARNING: CPU: 1 PID: 0 at arch/x86/kernel/cpu/common.c:454 c=
r4_update_irqsoff+0x32/0x60
[   35.847323] Modules linked in:
[   35.847329] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 6.6.0-rc5+ #1358
[   35.847335] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   35.847338] RIP: 0010:cr4_update_irqsoff+0x32/0x60
[   35.847345] Code: 89 f7 65 48 8b 15 86 0a fd 68 8b 0d 60 1b dc 01 85 c9 =
74 18 65 8b 0d 1d f8 fb 68 85 c9 75 0d 65 8b 0d 0e f6 fb 68 85 c9 74 02 <0f=
> 0b 48 f7 d7 48 21 d7 48 09 c7 48 39 fa 75 05 c3 cc cc cc cc 65
[   35.847350] RSP: 0000:ffffad98400aff18 EFLAGS: 00010002
[   35.847356] RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00000000000=
00001
[   35.847359] RDX: 00000000001300a0 RSI: 000000000000000f RDI: 00000000000=
0000f
[   35.847362] RBP: ffff9c7a81398000 R08: 00000000fffffe14 R09: 00000000000=
00000
[   35.847365] R10: ffff9c7ace106078 R11: 0000000000000000 R12: 00000000000=
00001
[   35.847368] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[   35.847372] FS:  0000000000000000(0000) GS:ffff9c7ace100000(0000) knlGS:=
0000000000000000
[   35.847376] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.847379] CR2: 0000000000000000 CR3: 000000002883c000 CR4: 00000000001=
300a0
[   35.847385] Call Trace:
[   35.847389]  <TASK>
[   35.847392]  ? cr4_update_irqsoff+0x32/0x60
[   35.847398]  ? __warn+0x85/0x170
[   35.847410]  ? cr4_update_irqsoff+0x32/0x60
[   35.847419]  ? report_bug+0x171/0x1a0
[   35.847432]  ? handle_bug+0x3c/0x80
[   35.847438]  ? exc_invalid_op+0x17/0x70
[   35.847443]  ? asm_exc_invalid_op+0x1a/0x20
[   35.847464]  ? cr4_update_irqsoff+0x32/0x60
[   35.847473]  cpu_init+0x58/0x1a0
[   35.847482]  start_secondary+0x31/0x140
[   35.847490]  ? __pfx_start_secondary+0x10/0x10
[   35.847496]  secondary_startup_64_no_verify+0x178/0x17b
[   35.847519]  </TASK>
[   35.847522] irq event stamp: 111393
[   35.847524] hardirqs last  enabled at (111393): [<ffffffff9773008a>] acp=
i_idle_play_dead+0x4a/0x70
[   35.847533] hardirqs last disabled at (111392): [<ffffffff97126ca2>] do_=
idle+0x92/0xe0
[   35.847540] softirqs last  enabled at (111328): [<ffffffff97d084a6>] __d=
o_softirq+0x2e6/0x3a9
[   35.847549] softirqs last disabled at (111315): [<ffffffff970bbdbb>] __i=
rq_exit_rcu+0xab/0xd0
[   35.847555] ---[ end trace 0000000000000000 ]---
[   35.847585] ------------[ cut here ]------------
[   35.847588] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:4429 rcu_cpu_sta=
rting+0x16b/0x1d0
[   35.847602] Modules linked in:
[   35.847606] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          6=
.6.0-rc5+ #1358
[   35.847610] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   35.847613] RIP: 0010:rcu_cpu_starting+0x16b/0x1d0
[   35.847620] Code: cc 65 8b 05 97 64 e9 68 85 c0 75 cd 65 8b 05 88 62 e9 =
68 85 c0 74 c2 0f 0b eb be 65 8b 05 79 62 e9 68 85 c0 0f 84 bf fe ff ff <0f=
> 0b e9 b8 fe ff ff 89 c6 4c 89 ef e8 04 06 b8 00 90 e9 eb fe ff
[   35.847624] RSP: 0000:ffffad98400aff10 EFLAGS: 00010002
[   35.847628] RAX: 0000000000000001 RBX: 0000000000000000 RCX: 00000000000=
00000
[   35.847631] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00000000000=
00001
[   35.847633] RBP: 0000000000000000 R08: 000000001883c000 R09: 00000000000=
00000
[   35.847636] R10: ffff9c7ace106078 R11: 0000000000000000 R12: 00000000000=
00000
[   35.847639] R13: 0000000000000000 R14: 0000000000000000 R15: 00000000000=
00000
[   35.847642] FS:  0000000000000000(0000) GS:ffff9c7ace100000(0000) knlGS:=
0000000000000000
[   35.847645] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.847648] CR2: 0000000000000000 CR3: 000000002883c001 CR4: 00000000001=
706a0
[   35.847651] Call Trace:
[   35.847654]  <TASK>
[   35.847656]  ? rcu_cpu_starting+0x16b/0x1d0
[   35.847663]  ? __warn+0x85/0x170
[   35.847681]  ? rcu_cpu_starting+0x16b/0x1d0
[   35.847691]  ? report_bug+0x171/0x1a0
[   35.847701]  ? handle_bug+0x3c/0x80
[   35.847706]  ? exc_invalid_op+0x17/0x70
[   35.847711]  ? asm_exc_invalid_op+0x1a/0x20
[   35.847729]  ? rcu_cpu_starting+0x16b/0x1d0
[   35.847742]  start_secondary+0x42/0x140
[   35.847747]  ? __pfx_start_secondary+0x10/0x10
[   35.847753]  secondary_startup_64_no_verify+0x178/0x17b
[   35.847774]  </TASK>
[   35.847775] irq event stamp: 111393
[   35.847778] hardirqs last  enabled at (111393): [<ffffffff9773008a>] acp=
i_idle_play_dead+0x4a/0x70
[   35.847783] hardirqs last disabled at (111392): [<ffffffff97126ca2>] do_=
idle+0x92/0xe0
[   35.847788] softirqs last  enabled at (111328): [<ffffffff97d084a6>] __d=
o_softirq+0x2e6/0x3a9
[   35.847795] softirqs last disabled at (111315): [<ffffffff970bbdbb>] __i=
rq_exit_rcu+0xab/0xd0
[   35.847799] ---[ end trace 0000000000000000 ]---
[   35.847810] ------------[ cut here ]------------
[   35.847842] WARNING: CPU: 1 PID: 0 at kernel/rcu/tree.c:4462 rcu_cpu_sta=
rting+0x158/0x1d0
[   35.847851] Modules linked in:
[   35.847855] CPU: 1 PID: 0 Comm: swapper/1 Tainted: G        W          6=
.6.0-rc5+ #1358
[   35.847859] Hardware name: Xen HVM domU, BIOS 4.17.1 09/26/2023
[   35.847862] RIP: 0010:rcu_cpu_starting+0x158/0x1d0
[   35.847869] Code: 01 f0 83 44 24 fc 00 5b 5d 41 5c 41 5d 41 5e c3 cc cc =
cc cc 65 8b 05 97 64 e9 68 85 c0 75 cd 65 8b 05 88 62 e9 68 85 c0 74 c2 <0f=
> 0b eb be 65 8b 05 79 62 e9 68 85 c0 0f 84 bf fe ff ff 0f 0b e9
[   35.847872] RSP: 0000:ffffad98400aff10 EFLAGS: 00010002
[   35.847877] RAX: 0000000000000001 RBX: ffff9c7ace130280 RCX: 40000000000=
01492
[   35.847880] RDX: 3fffffffffffffff RSI: ffffffff98c03d18 RDI: ffff9c7a813=
98d48
[   35.847883] RBP: ffffffff98c03d00 R08: 0000000000000001 R09: 00000000000=
0003e
[   35.847886] R10: 0000000000000000 R11: ffff9c7a81398d48 R12: 00000000000=
00002
[   35.847889] R13: ffffffff98cb7280 R14: 0000000000000000 R15: 00000000000=
00000
[   35.847892] FS:  0000000000000000(0000) GS:ffff9c7ace100000(0000) knlGS:=
0000000000000000
[   35.847895] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   35.847898] CR2: 0000000000000000 CR3: 000000002883c001 CR4: 00000000001=
706a0
[   35.847901] Call Trace:
[   35.847903]  <TASK>
[   35.847905]  ? rcu_cpu_starting+0x158/0x1d0
[   35.847912]  ? __warn+0x85/0x170
[   35.847919]  ? rcu_cpu_starting+0x158/0x1d0
[   35.847929]  ? report_bug+0x171/0x1a0
[   35.847940]  ? handle_bug+0x3c/0x80
[   35.847958]  ? exc_invalid_op+0x17/0x70
[   35.847960]  ? asm_exc_invalid_op+0x1a/0x20
[   35.847969]  ? rcu_cpu_starting+0x158/0x1d0
[   35.847976]  start_secondary+0x42/0x140
[   35.847978]  ? __pfx_start_secondary+0x10/0x10
[   35.847981]  secondary_startup_64_no_verify+0x178/0x17b
[   35.847991]  </TASK>
[   35.847992] irq event stamp: 111393
[   35.847993] hardirqs last  enabled at (111393): [<ffffffff9773008a>] acp=
i_idle_play_dead+0x4a/0x70
[   35.847996] hardirqs last disabled at (111392): [<ffffffff97126ca2>] do_=
idle+0x92/0xe0
[   35.847998] softirqs last  enabled at (111328): [<ffffffff97d084a6>] __d=
o_softirq+0x2e6/0x3a9
[   35.848001] softirqs last disabled at (111315): [<ffffffff970bbdbb>] __i=
rq_exit_rcu+0xab/0xd0
[   35.848003] ---[ end trace 0000000000000000 ]---
[   35.850720] cpu 1 spinlock event irq 57



--=-SrElBF+d/If5CbumhQBe
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Disposition: attachment; filename="smime.p7s"
Content-Transfer-Encoding: base64

MIAGCSqGSIb3DQEHAqCAMIACAQExDzANBglghkgBZQMEAgEFADCABgkqhkiG9w0BBwEAAKCCEkQw
ggYQMIID+KADAgECAhBNlCwQ1DvglAnFgS06KwZPMA0GCSqGSIb3DQEBDAUAMIGIMQswCQYDVQQG
EwJVUzETMBEGA1UECBMKTmV3IEplcnNleTEUMBIGA1UEBxMLSmVyc2V5IENpdHkxHjAcBgNVBAoT
FVRoZSBVU0VSVFJVU1QgTmV0d29yazEuMCwGA1UEAxMlVVNFUlRydXN0IFJTQSBDZXJ0aWZpY2F0
aW9uIEF1dGhvcml0eTAeFw0xODExMDIwMDAwMDBaFw0zMDEyMzEyMzU5NTlaMIGWMQswCQYDVQQG
EwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYD
VQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50
aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKC
AQEAyjztlApB/975Rrno1jvm2pK/KxBOqhq8gr2+JhwpKirSzZxQgT9tlC7zl6hn1fXjSo5MqXUf
ItMltrMaXqcESJuK8dtK56NCSrq4iDKaKq9NxOXFmqXX2zN8HHGjQ2b2Xv0v1L5Nk1MQPKA19xeW
QcpGEGFUUd0kN+oHox+L9aV1rjfNiCj3bJk6kJaOPabPi2503nn/ITX5e8WfPnGw4VuZ79Khj1YB
rf24k5Ee1sLTHsLtpiK9OjG4iQRBdq6Z/TlVx/hGAez5h36bBJMxqdHLpdwIUkTqT8se3ed0PewD
ch/8kHPo5fZl5u1B0ecpq/sDN/5sCG52Ds+QU5O5EwIDAQABo4IBZDCCAWAwHwYDVR0jBBgwFoAU
U3m/WqorSs9UgOHYm8Cd8rIDZsswHQYDVR0OBBYEFAnA8vwL2pTbX/4r36iZQs/J4K0AMA4GA1Ud
DwEB/wQEAwIBhjASBgNVHRMBAf8ECDAGAQH/AgEAMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEF
BQcDBDARBgNVHSAECjAIMAYGBFUdIAAwUAYDVR0fBEkwRzBFoEOgQYY/aHR0cDovL2NybC51c2Vy
dHJ1c3QuY29tL1VTRVJUcnVzdFJTQUNlcnRpZmljYXRpb25BdXRob3JpdHkuY3JsMHYGCCsGAQUF
BwEBBGowaDA/BggrBgEFBQcwAoYzaHR0cDovL2NydC51c2VydHJ1c3QuY29tL1VTRVJUcnVzdFJT
QUFkZFRydXN0Q0EuY3J0MCUGCCsGAQUFBzABhhlodHRwOi8vb2NzcC51c2VydHJ1c3QuY29tMA0G
CSqGSIb3DQEBDAUAA4ICAQBBRHUAqznCFfXejpVtMnFojADdF9d6HBA4kMjjsb0XMZHztuOCtKF+
xswhh2GqkW5JQrM8zVlU+A2VP72Ky2nlRA1GwmIPgou74TZ/XTarHG8zdMSgaDrkVYzz1g3nIVO9
IHk96VwsacIvBF8JfqIs+8aWH2PfSUrNxP6Ys7U0sZYx4rXD6+cqFq/ZW5BUfClN/rhk2ddQXyn7
kkmka2RQb9d90nmNHdgKrwfQ49mQ2hWQNDkJJIXwKjYA6VUR/fZUFeCUisdDe/0ABLTI+jheXUV1
eoYV7lNwNBKpeHdNuO6Aacb533JlfeUHxvBz9OfYWUiXu09sMAviM11Q0DuMZ5760CdO2VnpsXP4
KxaYIhvqPqUMWqRdWyn7crItNkZeroXaecG03i3mM7dkiPaCkgocBg0EBYsbZDZ8bsG3a08LwEsL
1Ygz3SBsyECa0waq4hOf/Z85F2w2ZpXfP+w8q4ifwO90SGZZV+HR/Jh6rEaVPDRF/CEGVqR1hiuQ
OZ1YL5ezMTX0ZSLwrymUE0pwi/KDaiYB15uswgeIAcA6JzPFf9pLkAFFWs1QNyN++niFhsM47qod
x/PL+5jR87myx5uYdBEQkkDc+lKB1Wct6ucXqm2EmsaQ0M95QjTmy+rDWjkDYdw3Ms6mSWE3Bn7i
5ZgtwCLXgAIe5W8mybM2JzCCBhQwggT8oAMCAQICEQDGvhmWZ0DEAx0oURL6O6l+MA0GCSqGSIb3
DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVyMRAwDgYD
VQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNlY3RpZ28g
UlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBMB4XDTIyMDEwNzAw
MDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJARYTZHdtdzJAaW5mcmFkZWFkLm9y
ZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3GpC2bomUqk+91wLYBzDMcCj5C9m6
oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZHh7htyAkWYVoFsFPrwHounto8xTsy
SSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT9YgcBqKCo65pTFmOnR/VVbjJk4K2
xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNjP+qDrh0db7PAjO1D4d5ftfrsf+kd
RR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy2U+eITZ5LLE5s45mX2oPFknWqxBo
bQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3BgBEmfsYWlBXO8rVXfvPgLs32VdV
NZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/7auNVRmPB3v5SWEsH8xi4Bez2V9U
KxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmdlFYhAflWKQ03Ufiu8t3iBE3VJbc2
5oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9aelIl6vtbhMA+l0nfrsORMa4kobqQ5
C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMBAAGjggHMMIIByDAfBgNVHSMEGDAW
gBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeDMcimo0oz8o1R1Nver3ZVpSkwDgYD
VR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYwFAYIKwYBBQUHAwQGCCsGAQUFBwMC
MEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYBBQUHAgEWF2h0dHBzOi8vc2VjdGln
by5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9jcmwuc2VjdGlnby5jb20vU2VjdGln
b1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1haWxDQS5jcmwwgYoGCCsGAQUFBwEB
BH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdvLmNvbS9TZWN0aWdvUlNBQ2xpZW50
QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAjBggrBgEFBQcwAYYXaHR0cDovL29j
c3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5mcmFkZWFkLm9yZzANBgkqhkiG9w0B
AQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQvQ/fzPXmtR9t54rpmI2TfyvcKgOXp
qa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvIlSPrzIB4Z2wyIGQpaPLlYflrrVFK
v9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9ChWFfgSXvrWDZspnU3Gjw/rMHrGnql
Htlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0whpBtXdyDjzBtQTaZJ7zTT/vlehc/
tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9IzCCBhQwggT8oAMCAQICEQDGvhmW
Z0DEAx0oURL6O6l+MA0GCSqGSIb3DQEBCwUAMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3Jl
YXRlciBNYW5jaGVzdGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0
ZWQxPjA8BgNVBAMTNVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJl
IEVtYWlsIENBMB4XDTIyMDEwNzAwMDAwMFoXDTI1MDEwNjIzNTk1OVowJDEiMCAGCSqGSIb3DQEJ
ARYTZHdtdzJAaW5mcmFkZWFkLm9yZzCCAiIwDQYJKoZIhvcNAQEBBQADggIPADCCAgoCggIBALQ3
GpC2bomUqk+91wLYBzDMcCj5C9m6oZaHwvmIdXftOgTbCJXADo6G9T7BBAebw2JV38EINgKpy/ZH
h7htyAkWYVoFsFPrwHounto8xTsySSePMiPlmIdQ10BcVSXMUJ3Juu16GlWOnAMJY2oYfEzmE7uT
9YgcBqKCo65pTFmOnR/VVbjJk4K2xE34GC2nAdUQkPFuyaFisicc6HRMOYXPuF0DuwITEKnjxgNj
P+qDrh0db7PAjO1D4d5ftfrsf+kdRR4gKVGSk8Tz2WwvtLAroJM4nXjNPIBJNT4w/FWWc/5qPHJy
2U+eITZ5LLE5s45mX2oPFknWqxBobQZ8a9dsZ3dSPZBvE9ZrmtFLrVrN4eo1jsXgAp1+p7bkfqd3
BgBEmfsYWlBXO8rVXfvPgLs32VdVNZxb/CDWPqBsiYv0Hv3HPsz07j5b+/cVoWqyHDKzkaVbxfq/
7auNVRmPB3v5SWEsH8xi4Bez2V9UKxfYCnqsjp8RaC2/khxKt0A552Eaxnz/4ly/2C7wkwTQnBmd
lFYhAflWKQ03Ufiu8t3iBE3VJbc25oMrglj7TRZrmKq3CkbFnX0fyulB+kHimrt6PIWn7kgyl9ae
lIl6vtbhMA+l0nfrsORMa4kobqQ5C5rveVgmcIad67EDa+UqEKy/GltUwlSh6xy+TrK1tzDvAgMB
AAGjggHMMIIByDAfBgNVHSMEGDAWgBQJwPL8C9qU21/+K9+omULPyeCtADAdBgNVHQ4EFgQUzMeD
Mcimo0oz8o1R1Nver3ZVpSkwDgYDVR0PAQH/BAQDAgWgMAwGA1UdEwEB/wQCMAAwHQYDVR0lBBYw
FAYIKwYBBQUHAwQGCCsGAQUFBwMCMEAGA1UdIAQ5MDcwNQYMKwYBBAGyMQECAQEBMCUwIwYIKwYB
BQUHAgEWF2h0dHBzOi8vc2VjdGlnby5jb20vQ1BTMFoGA1UdHwRTMFEwT6BNoEuGSWh0dHA6Ly9j
cmwuc2VjdGlnby5jb20vU2VjdGlnb1JTQUNsaWVudEF1dGhlbnRpY2F0aW9uYW5kU2VjdXJlRW1h
aWxDQS5jcmwwgYoGCCsGAQUFBwEBBH4wfDBVBggrBgEFBQcwAoZJaHR0cDovL2NydC5zZWN0aWdv
LmNvbS9TZWN0aWdvUlNBQ2xpZW50QXV0aGVudGljYXRpb25hbmRTZWN1cmVFbWFpbENBLmNydDAj
BggrBgEFBQcwAYYXaHR0cDovL29jc3Auc2VjdGlnby5jb20wHgYDVR0RBBcwFYETZHdtdzJAaW5m
cmFkZWFkLm9yZzANBgkqhkiG9w0BAQsFAAOCAQEAyW6MUir5dm495teKqAQjDJwuFCi35h4xgnQv
Q/fzPXmtR9t54rpmI2TfyvcKgOXpqa7BGXNFfh1JsqexVkIqZP9uWB2J+uVMD+XZEs/KYNNX2PvI
lSPrzIB4Z2wyIGQpaPLlYflrrVFKv9CjT2zdqvy2maK7HKOQRt3BiJbVG5lRiwbbygldcALEV9Ch
WFfgSXvrWDZspnU3Gjw/rMHrGnqlHtlyebp3pf3fSS9kzQ1FVtVIDrL6eqhTwJxe+pXSMMqFiN0w
hpBtXdyDjzBtQTaZJ7zTT/vlehc/tDuqZwGHm/YJy883Ll+GP3NvOkgaRGWEuYWJJ6hFCkXYjyR9
IzGCBMcwggTDAgEBMIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVz
dGVyMRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMT
NVNlY3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEA
xr4ZlmdAxAMdKFES+jupfjANBglghkgBZQMEAgEFAKCCAeswGAYJKoZIhvcNAQkDMQsGCSqGSIb3
DQEHATAcBgkqhkiG9w0BCQUxDxcNMjMxMDIzMjA1MDIyWjAvBgkqhkiG9w0BCQQxIgQgLlO6kGma
lad0tVNWD/okxRcQ2vdcVBubcE7VRwvDu9Awgb0GCSsGAQQBgjcQBDGBrzCBrDCBljELMAkGA1UE
BhMCR0IxGzAZBgNVBAgTEkdyZWF0ZXIgTWFuY2hlc3RlcjEQMA4GA1UEBxMHU2FsZm9yZDEYMBYG
A1UEChMPU2VjdGlnbyBMaW1pdGVkMT4wPAYDVQQDEzVTZWN0aWdvIFJTQSBDbGllbnQgQXV0aGVu
dGljYXRpb24gYW5kIFNlY3VyZSBFbWFpbCBDQQIRAMa+GZZnQMQDHShREvo7qX4wgb8GCyqGSIb3
DQEJEAILMYGvoIGsMIGWMQswCQYDVQQGEwJHQjEbMBkGA1UECBMSR3JlYXRlciBNYW5jaGVzdGVy
MRAwDgYDVQQHEwdTYWxmb3JkMRgwFgYDVQQKEw9TZWN0aWdvIExpbWl0ZWQxPjA8BgNVBAMTNVNl
Y3RpZ28gUlNBIENsaWVudCBBdXRoZW50aWNhdGlvbiBhbmQgU2VjdXJlIEVtYWlsIENBAhEAxr4Z
lmdAxAMdKFES+jupfjANBgkqhkiG9w0BAQEFAASCAgB0uRLSS6YZBs5h6/zeUAL44dIMB/4WwjwC
i4jmZ32V66OYczpkT0o5yxu60FV9sVn5P8g4Uiurtew01nQD68A0HPpwPpJVwOUpDzilFZx3cyBC
H/D8dl+FH4zAiemliRFgseeBmykOcR6CPzsAWSIRzcYexmDe9yQ7e52k6NMs1i5b9T1XWcZd+rhW
FHM0fnS5rlDNUt5UCFRB5P9gNZlJuZYBxx3wxostyyiwBNGnMQdRbYrCWACo6T0r1RLqEs3NwaGO
ZPOqEGY3yMbjrQAPm++u9RhgC9p4l46WPwtbCxJBIWkKa9f/DutHc1ZC1+XT+rjiZE1oRqvKDo4y
7f212aB0NVyYKVKRORDOQfR2mLLAVTC5WYZzwM3BEtwUzQCMnL7o1BaQBFtjLwJfYhSdkapDdRWX
hrLA4/GKTW3bVyR0TDHI0SLK7BuANgwv9/DidGhkgNfY5aQRQj4ek+YfxnwptGZAp2aOzENz7FHR
GGBZIoAbxUfdAOaBMFJcZqPdTh5d2wxDtJVQd7522LTSdnzT33U/TjURvEiH2wTXsxWdr7zyWuXc
q/o7wJM9IQdYdwb4eLG4zBYGJuUaUJs4sdJ7xi/5qp8nEuh5Pc7gD9koDuY46k2fKwQ2Hv+2Zw5x
TIEUOxg4UF/9N9ncA8sqYEHS2F0JYCGmr6bAZfAV8QAAAAAAAA==


--=-SrElBF+d/If5CbumhQBe--

