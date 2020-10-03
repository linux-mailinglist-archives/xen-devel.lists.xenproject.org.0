Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F23A3282463
	for <lists+xen-devel@lfdr.de>; Sat,  3 Oct 2020 15:57:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2551.7336 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kOi2U-0001PL-Ga; Sat, 03 Oct 2020 13:57:30 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2551.7336; Sat, 03 Oct 2020 13:57:30 +0000
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
	id 1kOi2U-0001Ow-DK; Sat, 03 Oct 2020 13:57:30 +0000
Received: by outflank-mailman (input) for mailman id 2551;
 Sat, 03 Oct 2020 13:57:29 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=CDDO=DK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1kOi2S-0001Or-TB
 for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 13:57:29 +0000
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f25ac761-053c-4a73-bae2-3e23c350f7d4;
 Sat, 03 Oct 2020 13:57:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id E03EB5C007D;
 Sat,  3 Oct 2020 09:57:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Sat, 03 Oct 2020 09:57:27 -0400
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de
 [91.64.170.89])
 by mail.messagingengine.com (Postfix) with ESMTPA id CBEA4328005A;
 Sat,  3 Oct 2020 09:57:26 -0400 (EDT)
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=CDDO=DK=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
	id 1kOi2S-0001Or-TB
	for xen-devel@lists.xenproject.org; Sat, 03 Oct 2020 13:57:29 +0000
X-Inumbo-ID: f25ac761-053c-4a73-bae2-3e23c350f7d4
Received: from out2-smtp.messagingengine.com (unknown [66.111.4.26])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id f25ac761-053c-4a73-bae2-3e23c350f7d4;
	Sat, 03 Oct 2020 13:57:28 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id E03EB5C007D;
	Sat,  3 Oct 2020 09:57:27 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 03 Oct 2020 09:57:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=rRcHf2ZexvPvfifjdfKFn/Ku1DnpV
	Pe5zMmLzF2yg+o=; b=OKLIol0VMBmxMKDtRmrw4VieRh3yLsvHScrkm4qAznpRv
	1V2III7Arbn2QzfghGVI7Q0fgXeUotdsf8fyyVKh4O6o+XNkLiAVibl16Fn5FrpH
	O42pjsVLoV7i1iiyMyju5nIbgKGvrY0tvb/+imefxAu6zAtJuVbBzpEoeInKhrCm
	4TWGqxcHOxTnq/Sr/Mnu0+WcCRPI8gbJdlBF4sjwDLMhF1BOwd/gzKB6WzeceV99
	PWhqEsKNyab2d7RZWV5vFTl2KMY+hmYzSTw4ErDz4Z5/H14531LCe4InPLqw8TzB
	y3rPcDnschj7xGlSZdx1AGY6vKipQ22z4shgA/7yw==
X-ME-Sender: <xms:R4N4X_YvTv5CLYiJ2-dQhZ6AnTwi_hOM7klsPTq4q4_u40Czbp1gnw>
    <xme:R4N4X-aLH1mZeDQ81PUDAKrY7CidudsmpM6V51guPJZGRMpSggoF_F4FA1wm093S_
    cRVgbjbSTlC9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeekgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfetudev
    udeiveevgfetueejlefggffghffhhfehtdfffeefgfduueegfefhnecukfhppeeluddrie
    egrddujedtrdekleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpehmrghrmhgrrhgvkhesihhnvhhishhisghlvghthhhinhhgshhlrggsrdgtoh
    hm
X-ME-Proxy: <xmx:R4N4Xx-Nh639lyS6aS891YbP4FYdwC735ejGCufxb2awpz3kBTEr1A>
    <xmx:R4N4X1pc-Or02wp0hhN0NkqS44gVKbLWpqnZhmicr639AYiiwM60Mg>
    <xmx:R4N4X6ry85mNR_scEjodn2oJGs_V-bxFL34eSAUr6C_7oHnK1EoYZw>
    <xmx:R4N4X31jvJyrWV-wrvXOO8_CB9m1_j2GpFA8s5q5pSPpCf2P5ZiQbg>
Received: from mail-itl (ip5b40aa59.dynamic.kabel-deutschland.de [91.64.170.89])
	by mail.messagingengine.com (Postfix) with ESMTPA id CBEA4328005A;
	Sat,  3 Oct 2020 09:57:26 -0400 (EDT)
Date: Sat, 3 Oct 2020 15:57:23 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: S3 resume crash in memguard_guard_stack (stable-4.14)
Message-ID: <20201003135723.GO3962@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8WA4ILJSyYAmUzbY"
Content-Disposition: inline


--8WA4ILJSyYAmUzbY
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: S3 resume crash in memguard_guard_stack (stable-4.14)

Hi,

My journey to get S3 working on Xen 4.14 continues...
My current setup is:
 - stable-4.14 (28855ebcdb)
 - with "x86/S3: Fix Shadow Stack resume path"
 - with efi_get_time() disabled
 - with "write_cr4(read_cr4())" just after "system_state =3D
   SYS_STATE_resume" (should be more or less equivalent to "x86/S3:
   Restore CR4 earlier during resume"
 - with "xen: credit2: limit the max number of CPUs in a runqueue"
   reverted

With this, I get a crash on S3 resume:

(XEN) Preparing system for ACPI S3 state.
(XEN) Disabling non-boot CPUs ...
(XEN) Entering ACPI S3 state.
(XEN) [VT-D]Passed iommu=3Dno-igfx option.  Disabling IGD VT-d engine.
(XEN) mce_intel.c:773: MCA Capability: firstbank 0, extended MCE MSR 0, BCA=
ST, CMCI
(XEN) CPU0 CMCI LVT vector (0xf1) already installed
(XEN) Finishing wakeup from ACPI S3 state.
(XEN) Enabling non-boot CPUs  ...
(XEN) ----[ Xen-4.14.1-pre  x86_64  debug=3Dy   Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d040311090>] memguard_guard_stack+0x7/0x1a5
(XEN) RFLAGS: 0000000000010286   CONTEXT: hypervisor
(XEN) rax: ffff830250ca03f8   rbx: 0000000000000001   rcx: ffff830250cb10b0
(XEN) rdx: 0000003210739000   rsi: 0000000000000001   rdi: ffff830250ca0000
(XEN) rbp: ffff830049a6fd70   rsp: ffff830049a6fd40   r8:  0000000000000001
(XEN) r9:  0000000000000000   r10: 0000000000000001   r11: 0000000000000002
(XEN) r12: 0000000000010000   r13: 0000000000000000   r14: 0000000000000001
(XEN) r15: ffff82d040598440   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 0000000049a5d000   cr2: ffff830250ca03f8
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d040311090> (memguard_guard_stack+0x7/0x1a5):
(XEN)  c3 48 8d 87 f8 03 00 00 <48> 89 87 f8 03 00 00 48 8d 87 f8 07 00 00 =
48 89
(XEN) Xen stack trace from rsp=3Dffff830049a6fd40:
(XEN)    ffff82d040321c2e ffff82d040461b68 ffff82d040461b60 ffff82d040461240
(XEN)    0000000000000001 0000000000000000 ffff830049a6fdb8 ffff82d040221f9c
(XEN)    ffff830049a6fde0 0000000000000001 0000000000000000 00000000ffffffef
(XEN)    ffff830049a6fe08 0000000000000001 ffff830250b66000 ffff830049a6fdd0
(XEN)    ffff82d0402036cf 0000000000000001 ffff830049a6fdf8 ffff82d040203a4d
(XEN)    0000000000000000 0000000000000001 0000000000000010 ffff830049a6fe28
(XEN)    ffff82d040203d00 ffff830049a6fef8 0000000000000000 0000000000000003
(XEN)    0000000000000200 ffff830049a6fe58 ffff82d040270c9a ffff830250139f70
(XEN)    ffff830250b45000 0000000000000000 0000000000000000 ffff830049a6fe78
(XEN)    ffff82d040207064 ffff830250b451b8 ffff82d0405781b0 ffff830049a6fe90
(XEN)    ffff82d04022b7bb ffff82d0405781a0 ffff830049a6fec0 ffff82d04022ba9c
(XEN)    0000000000000000 ffff82d0405781b0 ffff82d04057ed00 ffff82d040598440
(XEN)    ffff830049a6fef0 ffff82d0402f33e3 ffff830252b0e000 ffff830250b45000
(XEN)    ffff830252b0f000 0000000000000000 ffff830049a6fdc8 ffff88818ce029e0
(XEN)    ffffc900026b7f08 0000000000000003 0000000000000000 0000000000003403
(XEN)    ffffffff8277a5a8 0000000000000246 0000000000000003 0000000000003403
(XEN)    0000000000003403 0000000000000000 ffffffff810020ea 0000000000003403
(XEN)    0000000000000010 deadbeefdeadf00d 0000010000000000 ffffffff810020ea
(XEN)    000000000000e033 0000000000000246 ffffc900026b7cb8 000000000000e02b
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN) Xen call trace:
(XEN)    [<ffff82d040311090>] R memguard_guard_stack+0x7/0x1a5
(XEN)    [<ffff82d040321c2e>] S smpboot.c#cpu_smpboot_callback+0xe5/0x6d5
(XEN)    [<ffff82d040221f9c>] F notifier_call_chain+0x6b/0x96
(XEN)    [<ffff82d0402036cf>] F cpu.c#cpu_notifier_call_chain+0x1b/0x33
(XEN)    [<ffff82d040203a4d>] F cpu_up+0x5f/0xd5
(XEN)    [<ffff82d040203d00>] F enable_nonboot_cpus+0xea/0x1fb
(XEN)    [<ffff82d040270c9a>] F power.c#enter_state_helper+0x152/0x606
(XEN)    [<ffff82d040207064>] F domain.c#continue_hypercall_tasklet_handler=
+0x4c/0xb9
(XEN)    [<ffff82d04022b7bb>] F tasklet.c#do_tasklet_work+0x76/0xa9
(XEN)    [<ffff82d04022ba9c>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0402f33e3>] F domain.c#idle_loop+0x40/0x96
(XEN)=20
(XEN) Pagetable walk from ffff830250ca03f8:
(XEN)  L4[0x106] =3D 8000000049a5b063 ffffffffffffffff
(XEN)  L3[0x009] =3D 0000000250cae063 ffffffffffffffff
(XEN)  L2[0x086] =3D 0000000250cad063 ffffffffffffffff
(XEN)  L1[0x0a0] =3D 8000000250ca0161 ffffffffffffffff
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=3D0003]
(XEN) Faulting linear address: ffff830250ca03f8
(XEN) ****************************************
(XEN)=20
(XEN) Reboot in five seconds...
(XEN) Executing kexec image on cpu0
(XEN) Shot down all CPUs

The code in question seems to belong to this commit:

commit 91d26ed304ff562f341824be12bf49bd78c39e39
Author: Andrew Cooper <andrew.cooper3@citrix.com>
Date:   Thu Apr 23 20:20:59 2020 +0100

    x86/shstk: Create shadow stacks


Disabling Shadow Stack in Kconfig makes the issue gone - I got S3 resume
working on this machine, at least once. Then it hanged after second S3
resume (most likely yet another proble...).

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?

--8WA4ILJSyYAmUzbY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAl94g0EACgkQ24/THMrX
1ywnrwgAlTTUDuGrBn7ZBOkHA8BC+K8GQRNNIPEgP4ATXpitO/ZYYnF11sIUw61R
zeO5FNrx2SdA9Bhsvzp+2xmbDQU12ifb+ZRu0YIEp4c/TrC4qzRyI474BOCqKJAn
l4g/WbM18n7PsKrIGSmg31mYHBDw5JpWvzTF2NWn62iIYrvaUWGbgecJzsRPlKDP
yRx8lt9DZmDHvkKEwF8zH0u3St/WC/aGyG/FUzedSCiZV4CK6r/zN6KLGNRTsVPL
MWYsOYnv+FSspEYFBOsKyw9qC75hy8pAWSPdjdbYdo/Lc/pmifouxHwG64zInHAD
ZBktKrQiPwqvwh6q8ExBfVGlWJVg8A==
=evJ1
-----END PGP SIGNATURE-----

--8WA4ILJSyYAmUzbY--

