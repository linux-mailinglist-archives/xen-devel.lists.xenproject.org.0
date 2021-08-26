Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1B3F9085
	for <lists+xen-devel@lfdr.de>; Fri, 27 Aug 2021 00:53:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.173212.316067 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJODR-0001Mc-UF; Thu, 26 Aug 2021 22:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 173212.316067; Thu, 26 Aug 2021 22:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mJODR-0001Jh-Qy; Thu, 26 Aug 2021 22:51:21 +0000
Received: by outflank-mailman (input) for mailman id 173212;
 Thu, 26 Aug 2021 22:51:20 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yDkH=NR=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mJODQ-0001Jb-Af
 for xen-devel@lists.xenproject.org; Thu, 26 Aug 2021 22:51:20 +0000
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 0fb332e6-d78c-4aa5-9a71-753d37dc8072;
 Thu, 26 Aug 2021 22:51:19 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id B5CF83200495;
 Thu, 26 Aug 2021 18:51:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 26 Aug 2021 18:51:18 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 26 Aug 2021 18:51:15 -0400 (EDT)
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
X-Inumbo-ID: 0fb332e6-d78c-4aa5-9a71-753d37dc8072
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=5Suu6S
	G9f1yQ11fAHPPixQldMZEur3imMo8fM9CGUaE=; b=vh5JRkrsyY/xhMNMEL4cyd
	jTylQDKKiOhAM8ZAgQ+2/CdUM/b7p50OYG4JabTVhyl2wZa2iB2n6B+W3FrCQAoM
	bTuJIHYdVsDTdAeHf4K9b62kwtBBxrGkJ/mG33lpnydjkOJXLN/0zlxAhozoGOjU
	M7ACZNsIxfSub1e091XhNzvdf9Z+7kjkVqPZyb9guj5XaTsnn/XIzzg2fMw+sLoe
	xQ5YV50JDBNj/jRB2QP2QkfeQJcHZCE+8G7l848TrhbfoqR4tpydzpPLxXnx/elB
	kmd1L+K/QuCB96S1/8RHpOM6VnCfc2u/XM0wpZ4YBlfDE3NIZvmpZNNk9y0YvJuw
	==
X-ME-Sender: <xms:5BooYTXpN3_OJgCzpKrFjvpy2iFaOKJbZcOxDP6xNVXcOc3TX8uOAw>
    <xme:5BooYbkFJqFcDg92E_To6kDI5mDa8IcgEvSNGyn2c41cRq8Ga2be-YDYFKv7SPbDs
    _mP7ePcVR8hkA>
X-ME-Received: <xmr:5BooYfb9QHItqcvKQRlHS5F7-8Tx8I25KXTWncQuPhPXCNv2_JSoe94DVozc7H6b4RM5ZvIhrKzEQ4jvjKBfQRZN18zXCpH2>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudduvddgudehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
    ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
    hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeehvedv
    ueevheekhefhvefggffgvedugeetuefgleeivdehgfeuieeugfetteeiffenucffohhmrg
    hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
    pehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhvihhsihgslhgvthhhihhnghhslh
    grsgdrtghomh
X-ME-Proxy: <xmx:5BooYeWRgsGSj22cAP3TAOSMzH43cC3jiJ8yllHnCtvzGKseN7aBAQ>
    <xmx:5BooYdmgCwVMLDo9wgBTqJrjLk0W88x5lh01jLvU8gNd2M21U1AJUw>
    <xmx:5BooYbcOaY8mmS_OjhWUuDsSrFtC7PARgKCuAmfLtrNolRnMs5oBtg>
    <xmx:5RooYdsU4nbr6b6DNNnZaNBOksI_352ziDxLfea5YUs83iC9PE0w4g>
Date: Fri, 27 Aug 2021 00:51:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: HVM guest only bring up a single vCPU
Message-ID: <YSga4JLYURMXpB5V@mail-itl>
References: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qRqheSQeIMEhD/m2"
Content-Disposition: inline
In-Reply-To: <a1724918-94bf-748f-5c4b-5a3ec176368f@xen.org>


--qRqheSQeIMEhD/m2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Aug 2021 00:51:12 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Julien Grall <julien@xen.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	"xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
	Jan Beulich <jbeulich@suse.com>
Subject: Re: HVM guest only bring up a single vCPU

On Thu, Aug 26, 2021 at 10:00:58PM +0100, Julien Grall wrote:
> Hi Andrew,
>=20
> While doing more testing today, I noticed that only one vCPU would be
> brought up with HVM guest with Xen 4.16 on my setup (QEMU):
>=20
> [    1.122180] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.122180] UBSAN: shift-out-of-bounds in
> oss/linux/arch/x86/kernel/apic/apic.c:2362:13
> [    1.122180] shift exponent -1 is negative
> [    1.122180] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc7+ #304
> [    1.122180] Hardware name: Xen HVM domU, BIOS 4.16-unstable 06/07/2021
> [    1.122180] Call Trace:
> [    1.122180]  dump_stack_lvl+0x56/0x6c
> [    1.122180]  ubsan_epilogue+0x5/0x50
> [    1.122180]  __ubsan_handle_shift_out_of_bounds+0xfa/0x140
> [    1.122180]  ? cgroup_kill_write+0x4d/0x150
> [    1.122180]  ? cpu_up+0x6e/0x100
> [    1.122180]  ? _raw_spin_unlock_irqrestore+0x30/0x50
> [    1.122180]  ? rcu_read_lock_held_common+0xe/0x40
> [    1.122180]  ? irq_shutdown_and_deactivate+0x11/0x30
> [    1.122180]  ? lock_release+0xc7/0x2a0
> [    1.122180]  ? apic_id_is_primary_thread+0x56/0x60
> [    1.122180]  apic_id_is_primary_thread+0x56/0x60
> [    1.122180]  cpu_up+0xbd/0x100
> [    1.122180]  bringup_nonboot_cpus+0x4f/0x60
> [    1.122180]  smp_init+0x26/0x74
> [    1.122180]  kernel_init_freeable+0x183/0x32d
> [    1.122180]  ? _raw_spin_unlock_irq+0x24/0x40
> [    1.122180]  ? rest_init+0x330/0x330
> [    1.122180]  kernel_init+0x17/0x140
> [    1.122180]  ? rest_init+0x330/0x330
> [    1.122180]  ret_from_fork+0x22/0x30
> [    1.122244] =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [    1.123176] installing Xen timer for CPU 1
> [    1.123369] x86: Booting SMP configuration:
> [    1.123409] .... node  #0, CPUs:      #1
> [    1.154400] Callback from call_rcu_tasks_trace() invoked.
> [    1.154491] smp: Brought up 1 node, 1 CPU
> [    1.154526] smpboot: Max logical packages: 2
> [    1.154570] smpboot: Total of 1 processors activated (5999.99 BogoMIPS)
>=20
> I have tried a PV guest (same setup) and the kernel could bring up all the
> vCPUs.
>=20
> Digging down, Linux will set smp_num_siblings to 0 (via detect_ht_early())
> and as a result will skip all the CPUs. The value is retrieve from a CPUID
> leaf. So it sounds like we don't set the leaft correctly.
>=20
> FWIW, I have also tried on Xen 4.11 and could spot the same issue. Does t=
his
> ring any bell to you?

Is it maybe this:
https://lore.kernel.org/xen-devel/20201106003529.391649-1-bmasney@redhat.co=
m/T/#u
?

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--qRqheSQeIMEhD/m2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEoGuAACgkQ24/THMrX
1yxoigf8Cyfa3ZhpyHyno3X1M5SH8d3m2vjWNSzMcyKDZb9vZBJUvQBwyq8qXU8G
wbUvtwM6Z4EzhTyalIN7s/ITRwC9d9FUklcGGbzaC7szTIyMUxMKPf+emLE+zxag
QSKGEJZXkYzTjzfPS1ocHz1DGWXGCdFQL5h4JSdG2x9zVA3AQ7W+nTJgMYSFeFru
9/ytSCDuhGZKEsrSFnSsCjLy8BXhdJjoy3x58CS/sSz8q5rQRUHS8yt9Ogveggru
JVXJk942FM8iJibyeXtSoWy0kZg2tuUQ6qM4Zk5yi8zJ+H4cw41+3LRuJdpp99Mb
Uvg/ZURdZKCtefGVzOrVuaorNlddtA==
=dvua
-----END PGP SIGNATURE-----

--qRqheSQeIMEhD/m2--

