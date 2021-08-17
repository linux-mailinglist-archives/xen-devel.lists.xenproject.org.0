Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DD53EEDB7
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 15:49:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167868.306471 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzSn-0005PY-9j; Tue, 17 Aug 2021 13:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167868.306471; Tue, 17 Aug 2021 13:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mFzSn-0005Nk-5h; Tue, 17 Aug 2021 13:49:09 +0000
Received: by outflank-mailman (input) for mailman id 167868;
 Tue, 17 Aug 2021 13:49:07 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mFzSl-0005Nc-53
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 13:49:07 +0000
Received: from wout1-smtp.messagingengine.com (unknown [64.147.123.24])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 6cd4b22b-b7ce-41d6-bd6a-926546f8ae0e;
 Tue, 17 Aug 2021 13:49:05 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.west.internal (Postfix) with ESMTP id 662F832003D3;
 Tue, 17 Aug 2021 09:49:04 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute4.internal (MEProxy); Tue, 17 Aug 2021 09:49:04 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 09:49:02 -0400 (EDT)
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
X-Inumbo-ID: 6cd4b22b-b7ce-41d6-bd6a-926546f8ae0e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=KJFKk2
	CF+T7mdC2Mk2qjAsrkzo7qKENtldXHJqvaQfA=; b=PLC34BqvkJGmh7dFQQ2jqM
	iOxmO7GUhCKIYTb99Nos4eYqrfhDNj2wGdXRF+RZR5AsY1hgB2R+v5ekY+5Blkag
	csetCKl0DYj2BO1lTqP3SmhOjdQHnAou84cnCl7prqJT39CaIdAMayemZDB5Zg/b
	Er899QfU24fNv4rCiD10VSniX0NK8wFntU5Q5ZuEbaYdYionk9F7iwAcrrmK1CJI
	NpouJ4qIVJVF6L0bG3pncEnq7634hyecZEaWOTZ51m4qQG9b1zg2OaTGewaILTli
	o2tg10YauqHLwConAHt0upRKM2Tr/uapqx5mfqD4vxDuKOjIuHfm0E1V0QT9Qfjg
	==
X-ME-Sender: <xms:T74bYdQ3w3SNVs6wmUktjuHEPVB3O5X0lV8iK8_zSiBCf25w2FFszA>
    <xme:T74bYWxZrbJZoIxOXGbxQBC4ACHgEFijloMxbgk8Jx-l3gh2jeIqFg6NhVKJSzf75
    c56S6N1gPBjtg>
X-ME-Received: <xmr:T74bYS1zFuGMMjRCVXgnkOYoMD3eClgmGWcfbsHO1bLhys-dDoDt4xPH9fvXCreWqHpxTuaMO2hTKb-sZL5eybO6FMssTroP>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdejtdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkfhggtggujgesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcu
    ofgrrhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvih
    hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepteevffei
    gffhkefhgfegfeffhfegveeikeettdfhheevieehieeitddugeefteffnecuvehluhhsth
    gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehi
    nhhvihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:T74bYVDkaHr8QGmxXeQmdiDAN-cK6dnAi3aXzqSMIVNSpAGTNppCwQ>
    <xmx:T74bYWjazHH8LummlN0MOJDzy9hMnV0hC81KyczcERsdFcaRwezGHg>
    <xmx:T74bYZoKOYkI4aAt9IcJ2pSFBqDxBBov2o8442zwEG_83I1gQsjovA>
    <xmx:UL4bYeLoO7ZcOVtcKHcDSPAfHxUaSRJjOb-NKqLGoLflzeh6g8UKww>
Date: Tue, 17 Aug 2021 15:48:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 resume issue in xstate_init
Message-ID: <YRu+SuX1N09pbCRp@mail-itl>
References: <YRsQArpQcpLB/Q5h@mail-itl>
 <YRuXNmpT+03aPo+p@mail-itl>
 <95ca90ae-9c37-c77c-67dc-66c1aabd1626@citrix.com>
 <YRuhFWLrplRRV6t+@mail-itl>
 <a575e7e0-156f-9ed1-cff2-92e4d7000090@suse.com>
 <78eb61ad-45ba-51f0-a5ba-624408d60cc8@citrix.com>
 <a704d6c5-c818-e47b-32b6-f57b2d9670f5@citrix.com>
 <96fe5a22-d1d2-1e74-313a-c5377e9899d1@suse.com>
 <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O8v7RpX0pI9MWJTl"
Content-Disposition: inline
In-Reply-To: <b631b56d-6048-c900-a47c-f87df9dc1a5a@citrix.com>


--O8v7RpX0pI9MWJTl
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 15:48:58 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Jan Beulich <jbeulich@suse.com>,
	xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: S3 resume issue in xstate_init

On Tue, Aug 17, 2021 at 02:29:20PM +0100, Andrew Cooper wrote:
> On 17/08/2021 14:21, Jan Beulich wrote:
> > On 17.08.2021 15:06, Andrew Cooper wrote:
> >> On 17/08/2021 13:53, Andrew Cooper wrote:
> >>> On 17/08/2021 13:21, Jan Beulich wrote:
> >>>> I'm kind of guessing that set_xcr0() mistakenly skips the actual XCR0
> >>>> write, due to the cached value matching the to-be-written one, yet
> >>>> the cache having gone stale across S3.
> >>> This is a rats nest, and area for concern, but ...
> >>>
> >>>>  I think this is to be expected
> >>>> for previously parked CPUs, as those don't have their per-CPU data
> >>>> de-allocated (and hence also not re-setup, and thus also not starting
> >>>> out as zero).
> >>> ... we don't deallocate regular APs either, so I don't see why the sm=
t=3D
> >>> setting would make a difference in this case.
> >>>
> >>> To be clear - I think your guess about set_xcr0() skipping the write =
is
> >>> correct, because 0x240 is correct for xcr0=3DX87, but I don't see why=
 smt=3D
> >>> makes a difference.
> > Right - as per my later reply to Marek I don't see an immediate reason
> > anymore either. I could see an indirect reason via different scheduler
> > decisions, affecting what ran last on the respective CPUs.
>=20
> Modern Linux has stripped all MPX support, so won't set
> %xcr0.bnd{reg,csr} in the first place, and will differ from Xen's
> default setting.
>=20
> Therefore, I suppose we have a real difference in Xen's idea of the
> lazily-cached value depending on whether we're in half or full idle conte=
xt.

:(

> >>>>  I guess an easy fix would be to write 0 to
> >>>> this_cpu(xcr0) directly early in xstate_init(), maybe in an "else"
> >>>> to the early "if ( bsp )".
> >>>>
> >>>> I'm not sure though this would be a good fix longer term, as there
> >>>> might easily be other similar issues elsewhere. IOW we may need to
> >>>> see whether per-CPU data initialization wouldn't want changing.
> >>> We've got other registers too, like MSR_TSC_AUX, but I don't think we
> >>> want to be doing anything as drastic as changing how the initialisati=
on
> >>> works.
> >>>
> >>> The S3 path needs to explicitly write every register we do lazy conte=
xt
> >>> switching of.
> >> Actually no - that's a dumb suggestion because the APs don't know
> >> better, and we don't want for_each_cpu() loops running from the BSP.
> >>
> >> Perhaps we want the cpu_down() logic to explicitly invalidate their
> >> lazily cached values?
> > I'd rather do this on the cpu_up() path (no point clobbering what may
> > get further clobbered, and then perhaps not to a value of our liking),
> > yet then we can really avoid doing this from a notifier and instead do
> > it early enough in xstate_init() (taking care of XSS at the same time).

Funny you mention notifiers. Apparently cpufreq driver does use it to
initialize things. And fails to do so:

(XEN) Finishing wakeup from ACPI S3 state.
(XEN) CPU0: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
(XEN) Enabling non-boot CPUs  ...
(XEN) CPU1: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
(XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
(XEN) CPU:    0
(XEN) RIP:    e008:[<ffff82d04024ad2b>] vcpu_runstate_get+0x153/0x244
(XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
(XEN) rax: 0000000000000000   rbx: ffff830049667c50   rcx: 0000000000000001
(XEN) rdx: 000000321d74d000   rsi: ffff830049667c50   rdi: ffff83025dcc0000
(XEN) rbp: ffff830049667c40   rsp: ffff830049667c10   r8:  ffff83020511a820
(XEN) r9:  ffff82d04057ef78   r10: 0180000000000000   r11: 8000000000000000
(XEN) r12: ffff83025dcc0000   r13: ffff830205118c60   r14: 0000000000000001
(XEN) r15: 0000000000000010   cr0: 000000008005003b   cr4: 00000000003526e0
(XEN) cr3: 0000000049656000   cr2: 0000000000000028
(XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 0000000000000000
(XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
(XEN) Xen code around <ffff82d04024ad2b> (vcpu_runstate_get+0x153/0x244):
(XEN)  48 8b 14 ca 48 8b 04 02 <4c> 8b 70 28 e9 01 ff ff ff 4c 8d 3d dd 64 =
32 00
(XEN) Xen stack trace from rsp=3Dffff830049667c10:
(XEN)    0000000000000180 ffff83025dcbd410 ffff83020511bf30 ffff830205118c60
(XEN)    0000000000000001 0000000000000010 ffff830049667c80 ffff82d04024ae73
(XEN)    0000000000000000 0000000000000000 0000000000000000 0000000000000000
(XEN)    0000000000000000 0000000000000000 ffff830049667cb8 ffff82d0402560a9
(XEN)    ffff830205118320 0000000000000001 ffff83020511bf30 ffff83025dc7a6f0
(XEN)    0000000000000000 ffff830049667d58 ffff82d040254cb1 00000001402e9f74
(XEN)    0000000000000000 ffff830049667d10 ffff82d040224eda 000000000025dc81
(XEN)    000000321d74d000 ffff82d040571278 0000000000000001 ffff830049667d28
(XEN)    ffff82d040228b44 ffff82d0403102cf 0000000000000000 ffff82d0402283a4
(XEN)    ffff82d040459688 ffff82d040459680 ffff82d040459240 0000000000000004
(XEN)    0000000000000000 ffff830049667d68 ffff82d04025510e ffff830049667db0
(XEN)    ffff82d040221ba4 0000000000000000 0000000000000001 0000000000000001
(XEN)    0000000000000000 ffff830049667e00 0000000000000001 ffff82d04058a5c0
(XEN)    ffff830049667dc8 ffff82d040203867 0000000000000001 ffff830049667df0
(XEN)    ffff82d040203c51 ffff82d040459400 0000000000000001 0000000000000010
(XEN)    ffff830049667e20 ffff82d040203e26 ffff830049667ef8 0000000000000000
(XEN)    0000000000000003 0000000000000200 ffff830049667e50 ffff82d040270bac
(XEN)    ffff83020116a640 ffff830258ff6000 0000000000000000 0000000000000000
(XEN)    ffff830049667e70 ffff82d0402056aa ffff830258ff61b8 ffff82d0405701b0
(XEN)    ffff830049667e88 ffff82d04022963c ffff82d0405701a0 ffff830049667eb8
(XEN) Xen call trace:
(XEN)    [<ffff82d04024ad2b>] R vcpu_runstate_get+0x153/0x244
(XEN)    [<ffff82d04024ae73>] F get_cpu_idle_time+0x57/0x59
(XEN)    [<ffff82d0402560a9>] F cpufreq_statistic_init+0x191/0x210
(XEN)    [<ffff82d040254cb1>] F cpufreq_add_cpu+0x3cc/0x5bb
(XEN)    [<ffff82d04025510e>] F cpufreq.c#cpu_callback+0x27/0x32
(XEN)    [<ffff82d040221ba4>] F notifier_call_chain+0x6c/0x96
(XEN)    [<ffff82d040203867>] F cpu.c#cpu_notifier_call_chain+0x1b/0x36
(XEN)    [<ffff82d040203c51>] F cpu_up+0xaf/0xc8
(XEN)    [<ffff82d040203e26>] F enable_nonboot_cpus+0x6b/0x1f8
(XEN)    [<ffff82d040270bac>] F power.c#enter_state_helper+0x152/0x60a
(XEN)    [<ffff82d0402056aa>] F domain.c#continue_hypercall_tasklet_handler=
+0x4c/0xb9
(XEN)    [<ffff82d04022963c>] F tasklet.c#do_tasklet_work+0x76/0xac
(XEN)    [<ffff82d040229920>] F do_tasklet+0x58/0x8a
(XEN)    [<ffff82d0402e6607>] F domain.c#idle_loop+0x74/0xdd
(XEN)=20
(XEN) Pagetable walk from 0000000000000028:
(XEN)  L4[0x000] =3D 000000025dce1063 ffffffffffffffff
(XEN)  L3[0x000] =3D 000000025dce0063 ffffffffffffffff
(XEN)  L2[0x000] =3D 000000025dcdf063 ffffffffffffffff
(XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
(XEN)=20
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) FATAL PAGE FAULT
(XEN) [error_code=3D0000]
(XEN) Faulting linear address: 0000000000000028
(XEN) ****************************************

This is after adding brutal `this_cpu(xcr0) =3D 0` in xstate_init().

> What we actually want to do is read the hardware register into the
> cached location.=C2=A0 %xcr0 is possibly the only lazy register we also do
> extra sanity checks on.

Yes, better load the actual XCR0 value into cache, instead of 0
(although in this very case, it will get immediately overwritten).
I've added similar cache init for XSS - and this one should be safe-ish
- get_msr_xss() is not used anywhere.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--O8v7RpX0pI9MWJTl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEbvkoACgkQ24/THMrX
1ywtxAf/dzeSa41RElZdiRHahGaBKN3L06EmlCl7/143cncH2shq3KPbVVFL7D24
wni2+JTGnXCD1dwh8/NalzMDDKhuJHPtnYelg58DFlQbfIvm62IdcZ0W0iMkL3Ii
QM+KZJHRJOPHdr2WnWj8n8P9A2KpqpSzkJCQqK9gX/zApO+XhTDRrsXZsubVyJhI
I5CsJWozImT89gIXfGSTi1dGEkGlhjlYPE3LXpKF07aKbx52ebWdIVgSBNxjLEYJ
lXS7OgIU4ZhRpzKRrplnUgOZaCjNt1OMF0wTouN3x9FS20Thpi8Ymj1+GkVSrBjb
iC6Rm3VtVie5t3rW/20+MMaqSab8DQ==
=piUc
-----END PGP SIGNATURE-----

--O8v7RpX0pI9MWJTl--

