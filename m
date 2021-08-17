Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0963EE224
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 03:26:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167544.305850 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFnr8-0007cG-VQ; Tue, 17 Aug 2021 01:25:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167544.305850; Tue, 17 Aug 2021 01:25:30 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFnr8-0007aP-Qf; Tue, 17 Aug 2021 01:25:30 +0000
Received: by outflank-mailman (input) for mailman id 167544;
 Tue, 17 Aug 2021 01:25:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFnr7-0007aJ-30
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 01:25:29 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 00883eca-fefa-11eb-a482-12813bfff9fa;
 Tue, 17 Aug 2021 01:25:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 3FCFE32001C6
 for <xen-devel@lists.xenproject.org>; Mon, 16 Aug 2021 21:25:26 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute1.internal (MEProxy); Mon, 16 Aug 2021 21:25:26 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA for
 <xen-devel@lists.xenproject.org>; Mon, 16 Aug 2021 21:25:25 -0400 (EDT)
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
X-Inumbo-ID: 00883eca-fefa-11eb-a482-12813bfff9fa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=rIiULbhWMatr0BO+2bLfo6OEXt2mC
	3xR0wnLyP5CN/8=; b=XQGlfIEC+MxrDOnzVVntWJ7bQbuxjxReXpxtktTc0PXNS
	Y5t946xIz/0cVYHUMDBFRwlu8vF+Mia6lJaj4mgCpvCVxk5QNu6Q9Wx9oQlMt54K
	qwAIhuIF6+i7jtt333BkXyL4yww9BxTlxg8hkybITh4J5fzkCIcZFIZUER8jPQeo
	kNMSJY2kJLbQao5LEXO5tE3OzX1wUPKEVUT/j9Bm3UNm6OGvvyhaTSn/D0ug2FSi
	2cgRBCNvU5boy/RoytDeeEJZu58vipBHULyF/SwU8ZYGE7uBC7X7j91L7nZQ2AW8
	0S7T7II7TjIhed/wxbsCpEm8X3ILzR5/2NhRFtrYg==
X-ME-Sender: <xms:BRAbYSOOCO6_5BWoh-M3u2vTcHpWNwahT_b9BRBqJB6godx7FLpl2w>
    <xme:BRAbYQ8TkrNjKDgrw4teB4gbbl2G6EWOnhaFMsA-wHOlR4NUAdaEr88WWfRIO8LDA
    RIYqqeykXG95w>
X-ME-Received: <xmr:BRAbYZTvhT0bDGd7tvoHXo6LrG_DoTotJV5UgQXYAkZeLHfnEXhlboF9DCkJY1jkOASKcsYAsrTIpAsS02PxDQ6Rb5bPaUL_>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrledvgdegiecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecunecujfgurhepfffhvffukfggtggusehgtderredttd
    ejnecuhfhrohhmpeforghrvghkucforghrtgiihihkohifshhkihdqifpkrhgvtghkihcu
    oehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpedtudfgteduveduieevvefgteeujeelgffggffhhffhhedtffef
    fefgudeugeefhfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtohhm
X-ME-Proxy: <xmx:BRAbYStmmQBhDqlthCipJkqdijNYPr-_cmJAuEV4ALdvijn_Z2WxbQ>
    <xmx:BRAbYafmAskB7zsD8AbD39nlTMYE-NPZBaYhGyc-CHG-y4LBU17eow>
    <xmx:BRAbYW3bUCavJFy0uHpPe4lWh0xd6tdpT_fCKYn-Eug5oeYz4HxSvQ>
    <xmx:BRAbYUp6wdOFuifiodhUyM6-ZnygUu77zf8d8b3PghWmVsAOPZWl4Q>
Date: Tue, 17 Aug 2021 03:25:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: S3 resume issue in xstate_init
Message-ID: <YRsQArpQcpLB/Q5h@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7VhbuY6gWKyUon2r"
Content-Disposition: inline


--7VhbuY6gWKyUon2r
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 03:25:21 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>
Subject: S3 resume issue in xstate_init

Hi,

I've got another S3 issue:

(XEN) Preparing system for ACPI S3 state.
(XEN) Disabling non-boot CPUs ...
(XEN) Broke affinity for IRQ1, new: ffff
(XEN) Broke affinity for IRQ16, new: ffff
(XEN) Broke affinity for IRQ9, new: ffff
(XEN) Broke affinity for IRQ139, new: ffff
(XEN) Broke affinity for IRQ8, new: ffff
(XEN) Broke affinity for IRQ14, new: ffff
(XEN) Broke affinity for IRQ20, new: ffff
(XEN) Broke affinity for IRQ137, new: ffff
(XEN) Broke affinity for IRQ138, new: ffff
(XEN) Entering ACPI S3 state.
(XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, BCA=
ST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf1) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) microcode: CPU0 updated from revision 0xca to 0xea, date =3D 2021-01-=
05
(XEN) xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
(XEN) Enabling non-boot CPUs  ...
(XEN) xstate: size: 0x440 (uncompressed 0x240) and states: 0x1f
(XEN) Xen BUG at xstate.c:673
(XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
(XEN) CPU:    1
(XEN) RIP:    e008:[<ffff82d040350ee4>] xstate_init+0x24b/0x2ff
(XEN) RFLAGS: 0000000000010087   CONTEXT: hypervisor
(XEN) rax: 0000000000000240   rbx: 000000000000001f   rcx: 0000000000000440
(XEN) rdx: 0000000000000001   rsi: 000000000000000a   rdi: 000000000000001f
(XEN) rbp: ffff83025dc9fd38   rsp: ffff83025dc9fd20   r8:  0000000000000001
(XEN) r9:  ffff83025dc9fc88   r10: 0000000000000001   r11: 0000000000000001
(XEN) r12: ffff83025dc9fd80   r13: 000000000000001f   r14: 0000000000000001
(XEN) r15: 0000000000000000   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 0000000049656000   cr2: 0000000000000000
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040350ee4> (xstate_init+0x24b/0x2ff):
(XEN)  ff e9 a2 00 00 00 0f 0b <0f> 0b 89 f8 89 f1 0f a2 89 f2 4c 8b 0d cb =
b4 0f
(XEN) Xen stack trace from rsp=3Dffff83025dc9fd20:
(XEN)    0000000000000240 ffff83025dc9fd80 0000000000000001 ffff83025dc9fd70
(XEN)    ffff82d04027e7a1 000000004035a7f1 7ffafbbf01100800 00000000bfebfbff
(XEN)    0000000000000001 00000000000000c8 ffff83025dc9feb8 ffff82d0402e43ce
(XEN)    000000160a9e0106 bfebfbff80000008 2c1008007ffaf3bf 0000000f00000121
(XEN)    00000000029c6fbf 0000000000000100 000000009c002e00 02afcd7f00000000
(XEN)    756e654700000000 6c65746e49656e69 65746e4904b21920 726f43202952286c
(XEN)    376920294d542865 432048303537382d 322e322040205550 000000007a484730
(XEN)    ffff830000000000 ffff83025dc9fe18 00002400402e8e0b 000000085dc9fe30
(XEN)    00000002402e9f21 0000000000000001 ffffffff00000000 ffff82d0402e0040
(XEN)    00000000003526e0 ffff83025dc9fe68 ffff82d04027bd15 0000000000000001
(XEN)    ffff8302590a0000 0000000000000000 00000000000000c8 0000000000000001
(XEN)    0000000000000001 ffff83025dc9feb8 ffff82d0402e32b7 0000000000000001
(XEN)    0000000000000001 00000000000000c8 0000000000000001 ffff83025dc9fee8
(XEN)    ffff82d04030e401 0000000000000001 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffff82d040200122 0800002000000002
(XEN)    0100000400010000 0000002000000000 2000000000100000 0000001000000000
(XEN)    2000000000000000 0000000029000000 0000008000000000 00110000a0000000
(XEN)    8000000080000000 4000000000000008 0000100000000000 0200000040000080
(XEN)    0004000000000000 0000010000000002 0400002030000000 0000000060000000
(XEN)    0400001000010000 0000000010000000 0000004010000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d040350ee4>] R xstate_init+0x24b/0x2ff
(XEN)    [<ffff82d04027e7a1>] F identify_cpu+0x318/0x4af
(XEN)    [<ffff82d0402e43ce>] F recheck_cpu_features+0x1f/0x72
(XEN)    [<ffff82d04030e401>] F start_secondary+0x255/0x38a
(XEN)    [<ffff82d040200122>] F __high_start+0x82/0x91
(XEN)=20
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 1:
(XEN) Xen BUG at xstate.c:673
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...

This is with added debug patch:

diff --git a/xen/arch/x86/xstate.c b/xen/arch/x86/xstate.c
index 6aaf9a2f1546..7873a21b356a 100644
--- a/xen/arch/x86/xstate.c
+++ b/xen/arch/x86/xstate.c
@@ -668,6 +668,8 @@ void xstate_init(struct cpuinfo_x86 *c)
     else
     {
         BUG_ON(xfeature_mask !=3D feature_mask);
+        printk("xstate: size: %#x (uncompressed %#x) and states: %#"PRIx64=
"\n",
+               xsave_cntxt_size, hw_uncompressed_size(feature_mask), featu=
re_mask);
         BUG_ON(xsave_cntxt_size !=3D hw_uncompressed_size(feature_mask));
     }
=20

As can be seen above - the xsave size differs between BSP and other
CPU(s) - likely because of (not) loaded ucode update there.
I guess it's a matter of moving ucode loading somewhere else, right?


--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--7VhbuY6gWKyUon2r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEbEAEACgkQ24/THMrX
1yynwwf/UdUr1oQFwU8YTZOuIInEVrW2NQkx6XoScIalY7FnKnVsmAm3M5Y+kwUd
ukhgvPxZ4HhQSANwctxxbZzbH+8CmZZwfXT3kdf6r6E9uaPZAriIJ/lLT9odTsCH
n9plNm+BjvPhcWjeUSOrF6c+Rw9x5wTGwQfqCaTgv+YG8Vv9qQOIJ/I7FK1CuJk0
lrTI4JVH8ZtXRA6eq5ukCBn7DDte2w9DpiYpmE/lnjHZO7XDmbU/lzY4lF+qzbUU
LH1LkZzlg5pQpaCU4PYclv68Oj6cOCtC4SfcV7fxrsxyYA1RTHzZasmPcYxFYJNH
7/8WxlCPxrBXmAHFeufxYWuI3H6vxA==
=N6rK
-----END PGP SIGNATURE-----

--7VhbuY6gWKyUon2r--

