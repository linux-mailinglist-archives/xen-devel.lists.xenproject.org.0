Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA6F1EE69A
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 16:26:30 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgqoa-0007Ol-Fv; Thu, 04 Jun 2020 14:25:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=SnWc=7R=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1jgqoY-0007Of-6e
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 14:25:50 +0000
X-Inumbo-ID: 4946ae60-a66f-11ea-ae9c-12813bfff9fa
Received: from wout2-smtp.messagingengine.com (unknown [64.147.123.25])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4946ae60-a66f-11ea-ae9c-12813bfff9fa;
 Thu, 04 Jun 2020 14:25:49 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 1C164588;
 Thu,  4 Jun 2020 10:25:48 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Thu, 04 Jun 2020 10:25:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=bDtBHF
 WaN5CLSwkbqcp31cYLJxcUXX1vGtm06j7NDQQ=; b=uKTgCnmN7iQXfXMCIL4Bqp
 cCdDUzvrSnkR/3trM0rC68KaeGQUQN8S+OH/El4NSCu8CncirLzAvGVTACxMpr2S
 GOgcc+PZdvWLnZnqFu7eAgFSA6uZtVd5QDS6tw28D7lBMLPzB0nRQwK4tJi9Zm10
 qquljhxHt+6J+NTMRzpkI4+8/7GwYNdbZ23IfPQOEevLl3x0XWY9zDnaw2VYRaYG
 TFejM1uBNkwmjHoF+oK2O2aq6R8NXKRBDGwWzl80IZvJZdEY1rjkmt7AyuDIJp9i
 uoRIKLiNJ5CSSBqvXg2RhqxCMNY9rtuFPP6RQQ9DwjdqHGbvm9g2UYRWi69IyvjQ
 ==
X-ME-Sender: <xms:awTZXg2llrN_Zh01h0-pMXy67njhUqIN8_YEaQcHeAfvQ-B4rX66sA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrudeguddgjeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecuhfhrohhmpeforghrvghk
 ucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcuoehmrghrmhgrrhgvkhesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeetveff
 iefghfekhffggeeffffhgeevieektedthfehveeiheeiiedtudegfeetffenucfkpheple
 durdeihedrfeegrdeffeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
 ihhlfhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrd
 gtohhm
X-ME-Proxy: <xmx:awTZXrEQYIUvV6SNpdBT0fmdiQh2iVU5oeOLOstTwUMDvom1Qd3XIQ>
 <xmx:awTZXo55cvF3u3pqdoh9nwdVS9L3vSu8_6DEyfNVAnRAcc-HJnL6Lw>
 <xmx:awTZXp3Bvh4wqgOhC3RR8cjt0ULfHsLVDJPRbyrHBox4zRUlR_EFLg>
 <xmx:awTZXqxIGaRB0-NWIlNxuRpgx7zvLhx7PdaiO2Ly5iX8BZBpc6doxg>
Received: from mail-itl (ip5b412221.dynamic.kabel-deutschland.de [91.65.34.33])
 by mail.messagingengine.com (Postfix) with ESMTPA id 7E696328005D;
 Thu,  4 Jun 2020 10:25:46 -0400 (EDT)
Date: Thu, 4 Jun 2020 16:25:42 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?=
 <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom
Message-ID: <20200604142542.GC98582@mail-itl>
References: <20200604014621.GA203658@mail-itl>
 <4dcc0092-6f6d-5d63-06cb-15b2fec244db@suse.com>
 <ecca6d68-9b86-0549-1e1a-308704e11aad@citrix.com>
 <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="+RqgOR8y65RRYhVY"
Content-Disposition: inline
In-Reply-To: <c58d7d90-94cb-fa3e-a5ad-c3fb85b921a9@suse.com>
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel <xen-devel@lists.xenproject.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>


--+RqgOR8y65RRYhVY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: handle_pio looping during domain shutdown, with qemu 4.2.0 in
 stubdom

On Thu, Jun 04, 2020 at 02:36:26PM +0200, Jan Beulich wrote:
> On 04.06.2020 13:13, Andrew Cooper wrote:
> > On 04/06/2020 08:08, Jan Beulich wrote:
> >> On 04.06.2020 03:46, Marek Marczykowski-G=C3=B3recki wrote:
> >>> Then, we get the main issue:
> >>>
> >>>     (XEN) d3v0 handle_pio port 0xb004 read 0x0000
> >>>     (XEN) d3v0 Weird PIO status 1, port 0xb004 read 0xffff
> >>>     (XEN) domain_crash called from io.c:178
> >>>
> >>> Note, there was no XEN_DOMCTL_destroydomain for domain 3 nor its stub=
dom
> >>> yet. But XEN_DMOP_remote_shutdown for domain 3 was called already.
> >> I'd guess an issue with the shutdown deferral logic. Did you / can
> >> you check whether XEN_DMOP_remote_shutdown managed to pause all
> >> CPUs (I assume it didn't, since once they're paused there shouldn't
> >> be any I/O there anymore, and hence no I/O emulation)?
> >=20
> > The vcpu in question is talking to Qemu, so will have v->defer_shutdown
> > intermittently set, and skip the pause in domain_shutdown()
> >=20
> > I presume this lack of pause is to allow the vcpu in question to still
> > be scheduled to consume the IOREQ reply?=C2=A0 (Its fairly opaque logic=
 with
> > 0 clarifying details).
> >=20
> > What *should* happen is that, after consuming the reply, the vcpu should
> > notice and pause itself, at which point it would yield to the
> > scheduler.=C2=A0 This is the purpose of vcpu_{start,end}_shutdown_defer=
ral().
> >=20
> > Evidentially, this is not happening.
>=20
> We can't tell yet, until ...
>=20
> > Marek: can you add a BUG() after the weird PIO printing?=C2=A0 That sho=
uld
> > confirm whether we're getting into handle_pio() via the
> > handle_hvm_io_completion() path, or via the vmexit path (at which case,
> > we're fully re-entering the guest).
>=20
> ... we know this. handle_pio() gets called from handle_hvm_io_completion()
> after having called hvm_wait_for_io() -> hvm_io_assist() ->
> vcpu_end_shutdown_deferral(), so the issue may be that we shouldn't call
> handle_pio() (etc) at all anymore in this state. IOW perhaps
> hvm_wait_for_io() should return "!sv->vcpu->domain->is_shutting_down"
> instead of plain "true"?
>=20
> Adding Paul to Cc, as being the maintainer here.

Got it, by sticking BUG() just before that domain_crash() in
handle_pio(). And also vcpu 0 of both HVM domains do have
v->defer_shutdown.

(XEN) hvm.c:1620:d6v0 All CPUs offline -- powering off.
(XEN) d3v0 handle_pio port 0xb004 read 0x0000
(XEN) d3v0 handle_pio port 0xb004 read 0x0000
(XEN) d3v0 handle_pio port 0xb004 write 0x0001
(XEN) d3v0 handle_pio port 0xb004 write 0x2001
(XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 reason 0
(XEN) d4v0 domain 3 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d4v0 XEN_DMOP_remote_shutdown domain 3 done
(XEN) hvm.c:1620:d5v0 All CPUs offline -- powering off.
(XEN) d1v0 handle_pio port 0xb004 read 0x0000
(XEN) d1v0 handle_pio port 0xb004 read 0x0000
(XEN) d1v0 handle_pio port 0xb004 write 0x0001
(XEN) d1v0 handle_pio port 0xb004 write 0x2001
(XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 reason 0
(XEN) d2v0 domain 1 domain_shutdown vcpu_id 0 defer_shutdown 1
(XEN) d2v0 XEN_DMOP_remote_shutdown domain 1 done
(XEN) grant_table.c:3702:d0v0 Grant release 0x3 ref 0x11d flags 0x2 d6
(XEN) grant_table.c:3702:d0v0 Grant release 0x4 ref 0x11e flags 0x2 d6
(XEN) d3v0 handle_pio port 0xb004 read 0x0000
(XEN) d3v0 Unexpected PIO status 1, port 0xb004 read 0xffff
(XEN) Xen BUG at io.c:178
(XEN) ----[ Xen-4.13.0  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d0802fcb0f>] handle_pio+0x1e4/0x1e6
(XEN) RFLAGS: 0000000000010282   CONTEXT: hypervisor (d3v0)
(XEN) rax: ffff8301ba6fffff   rbx: 0000000000000002   rcx: 0000000000000000
(XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: ffff82d080438698
(XEN) rbp: ffff8301ba6ffe90   rsp: ffff8301ba6ffe58   r8:  0000000000000001
(XEN) r9:  ffff8301ba6ffdc0   r10: 0000000000000001   r11: 000000000000000f
(XEN) r12: 000000000000b004   r13: ffff8300bfcf1000   r14: 0000000000000001
(XEN) r15: ffff8300bfcf4000   cr0: 000000008005003b   cr4: 00000000000006e0
(XEN) cr3: 00000000bebb8000   cr2: 00007d081d9b82a0
(XEN) fsb: 00007d081cafcb80   gsb: ffff9ae510c00000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d0802fcb0f> (handle_pio+0x1e4/0x1e6):
(XEN)  03 09 00 e8 5b 83 f4 ff <0f> 0b 55 48 89 e5 e8 b2 f5 ff ff 48 85 c0 =
74 0f
(XEN) Xen stack trace from rsp=3Dffff8301ba6ffe58:
(XEN)    000000000000ffff ffff8300bfcfffff 000000000000007b ffff8301ba6ffef8
(XEN)    ffff8300bfcf1000 ffff8300bfcf4000 0000000000000000 ffff8301ba6ffee8
(XEN)    ffff82d0803128f1 00ff8301ba6ffec0 ffff82d08030c257 ffff8301ba6ffef8
(XEN)    ffff8300bfcf1000 ffff8300bfcf4000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 00007cfe459000e7 ffff82d08031470b
(XEN)    0000000000000010 0000000000000010 0000000000000010 ffffa92ec001fd0c
(XEN)    000000000000b004 0000000000000010 0000000000000001 0000000000000000
(XEN)    0000000000000002 000000000000b004 ffffa92ec001fca4 0000000000000002
(XEN)    000000000000b004 ffffa92ec001fd0c 000000000000b004 0000beef0000beef
(XEN)    ffffffffaa5d43bf 000000bf0000beef 0000000000000046 ffffa92ec001fca0
(XEN)    000000000000beef 000000000000beef 000000000000beef 000000000000beef
(XEN)    000000000000beef 0000e01000000001 ffff8300bfcf4000 000000313a1d6000
(XEN)    00000000000006e0 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d0802fcb0f>] R handle_pio+0x1e4/0x1e6
(XEN)    [<ffff82d0803128f1>] F svm_vmexit_handler+0x97a/0x165b
(XEN)    [<ffff82d08031470b>] F svm_stgi_label+0x8/0x18
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Xen BUG at io.c:178
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--+RqgOR8y65RRYhVY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl7ZBGUACgkQ24/THMrX
1yyfegf+NN6ftiu7aH5eyEwvj+jE9XK595wR39HTVkAnWUCu3vTMxe19rjtoSGCg
LkxVgwtgO4IKpiVBcIl7U+pYnXuh95+/RsPDabuudKuMdIyw8rgoIMV3CtHf8EM0
SoxsyCHO9AIAHRogYykTpZECvm32YlWLV+bGEajb82BsdXSAe19EVKifbiOMEbXm
+EQ/hchwTLFRCvBvQpco8WtkILhH/1H56/QE0Qf4ct0huaNpVPxlfVLzEIat6iNV
HVV7lCb/h+HLF496t7G7tNnYgsnwxG6B8NqDl3YvgGUQEPWLMiW/QhdHSP7nVXwV
4lO1h1VeDdvEnu4dC6jEVJIaOa9PYQ==
=Pwft
-----END PGP SIGNATURE-----

--+RqgOR8y65RRYhVY--

