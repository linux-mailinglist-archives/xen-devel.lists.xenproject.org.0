Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0F13EEEC8
	for <lists+xen-devel@lfdr.de>; Tue, 17 Aug 2021 16:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.167942.306621 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG0Qf-0003E2-BV; Tue, 17 Aug 2021 14:51:01 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 167942.306621; Tue, 17 Aug 2021 14:51:01 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mG0Qf-0003Ab-7o; Tue, 17 Aug 2021 14:51:01 +0000
Received: by outflank-mailman (input) for mailman id 167942;
 Tue, 17 Aug 2021 14:50:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=lICV=NI=invisiblethingslab.com=marmarek@srs-us1.protection.inumbo.net>)
 id 1mG0Qd-0003AS-OX
 for xen-devel@lists.xenproject.org; Tue, 17 Aug 2021 14:50:59 +0000
Received: from wout4-smtp.messagingengine.com (unknown [64.147.123.20])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 89503c4c-8165-4e8c-a5ed-d5347f39a13b;
 Tue, 17 Aug 2021 14:50:58 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id 37C223200035;
 Tue, 17 Aug 2021 10:50:57 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Tue, 17 Aug 2021 10:50:57 -0400
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 17 Aug 2021 10:50:55 -0400 (EDT)
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
X-Inumbo-ID: 89503c4c-8165-4e8c-a5ed-d5347f39a13b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:from:message-id
	:mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
	:x-me-sender:x-sasl-enc; s=fm3; bh=BgpSoOYDH/AN7ybyZM7gQVQah9umF
	E0/v12vAHg5o4M=; b=oU+dHAQZ1yCv1QxoZAKiDC1cTiKBp7/ZlDX+7QGDg6yjI
	2g7QRDX95rr7QEW/NqclTtj0dEOhrQ9vNag7P7TfsQTevlJoQUhLHRX0BzJN+mc4
	29t5VmtcPEwp6oSCC0FOGDhGb8hSYgCHxYEXYQ5BCsHCCW9vvDiSohO1I7KN1Fhf
	ClG+ztnZTrlImNMxpggKXl7J3EYI12CPi9seeizp2p1RE01+riqe/ZdxnL0nN4pl
	jf6e4zEmS88YHhNRUWAIcLLizyFTGPlAHUY74SdfAOMSi3r5eK6vvKXCDRCK4pHS
	CmFrgJAEPhHqFDUKrNZjAc0O15aTZCOu3PVCxMOaw==
X-ME-Sender: <xms:0MwbYWMfmeUCPt_GIiHqnq-9AAxtPKGGzk5XXpH6JEyr_UcU9SZI7g>
    <xme:0MwbYU9rn2UYb_Kcya1rKK71Jr_-OisCw4hCxSoxAwpCdNGDTiWhCIewCEbhAlpiT
    BRRUjsxBIYMoQ>
X-ME-Received: <xmr:0MwbYdQCfuWChwibV5gK4DoMYDgwt19IKRUL0ks1g0EEGaWv0CFafcAKPUz8hVvh1fj8QRq4W-qkonnQeCX-ynQxiypLf6Bi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrleefgdekudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvuffkgggtugesghdtreertddtjeenucfhrhhomhepofgrrhgvkhcuofgr
    rhgtiiihkhhofihskhhiqdfikphrvggtkhhiuceomhgrrhhmrghrvghksehinhhvihhsih
    gslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnheptddugfetudev
    udeiveevgfetueejlefggffghffhhfehtdfffeefgfduueegfefhnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrrhhmrghrvghksehinhhv
    ihhsihgslhgvthhhihhnghhslhgrsgdrtghomh
X-ME-Proxy: <xmx:0MwbYWsYhaUBAVFcYlRL3SUIXyzEfE6H_PpU53_6rTiUkQEDUe-UbA>
    <xmx:0MwbYedLg5bNfbpj_xatd0nIhD0RdprEbUu1_uhdYWNsL-QljILcog>
    <xmx:0MwbYa1389fKr-6pbZBRiayD75aES-T0iszGIrx1OpO5raFxmZevsA>
    <xmx:0MwbYWkm8RUsTEXHbeI0OxnfE83UxXtaILZFXearC8ipCdsVHE4NRg>
Date: Tue, 17 Aug 2021 16:50:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: S3 resume issue in cpufreq -> get_cpu_idle_time->vcpu_runstate_get
Message-ID: <YRvMy9NgGxYKRcNc@mail-itl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="88oDJORWelxpH9uQ"
Content-Disposition: inline


--88oDJORWelxpH9uQ
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Aug 2021 16:50:51 +0200
From: Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
To: Jan Beulich <jbeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: S3 resume issue in cpufreq -> get_cpu_idle_time->vcpu_runstate_get

On Tue, Aug 17, 2021 at 04:04:24PM +0200, Jan Beulich wrote:
> On 17.08.2021 15:48, Marek Marczykowski-G=C3=B3recki wrote:
> > On Tue, Aug 17, 2021 at 02:29:20PM +0100, Andrew Cooper wrote:
> >> On 17/08/2021 14:21, Jan Beulich wrote:
> >>> On 17.08.2021 15:06, Andrew Cooper wrote:
> >>>> Perhaps we want the cpu_down() logic to explicitly invalidate their
> >>>> lazily cached values?
> >>> I'd rather do this on the cpu_up() path (no point clobbering what may
> >>> get further clobbered, and then perhaps not to a value of our liking),
> >>> yet then we can really avoid doing this from a notifier and instead do
> >>> it early enough in xstate_init() (taking care of XSS at the same time=
).
> >=20
> > Funny you mention notifiers. Apparently cpufreq driver does use it to
> > initialize things. And fails to do so:
> >=20
> > (XEN) Finishing wakeup from ACPI S3 state.
> > (XEN) CPU0: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
> > (XEN) Enabling non-boot CPUs  ...
> > (XEN) CPU1: xstate: size: 0x440 (uncompressed 0x440) and states: 0x1f
> > (XEN) ----[ Xen-4.16-unstable  x86_64  debug=3Dy  Not tainted ]----
> > (XEN) CPU:    0
> > (XEN) RIP:    e008:[<ffff82d04024ad2b>] vcpu_runstate_get+0x153/0x244
> > (XEN) RFLAGS: 0000000000010246   CONTEXT: hypervisor
> > (XEN) rax: 0000000000000000   rbx: ffff830049667c50   rcx: 000000000000=
0001
> > (XEN) rdx: 000000321d74d000   rsi: ffff830049667c50   rdi: ffff83025dcc=
0000
> > (XEN) rbp: ffff830049667c40   rsp: ffff830049667c10   r8:  ffff83020511=
a820
> > (XEN) r9:  ffff82d04057ef78   r10: 0180000000000000   r11: 800000000000=
0000
> > (XEN) r12: ffff83025dcc0000   r13: ffff830205118c60   r14: 000000000000=
0001
> > (XEN) r15: 0000000000000010   cr0: 000000008005003b   cr4: 000000000035=
26e0
> > (XEN) cr3: 0000000049656000   cr2: 0000000000000028
> > (XEN) fsb: 0000000000000000   gsb: 0000000000000000   gss: 000000000000=
0000
> > (XEN) ds: 0000   es: 0000   fs: 0000   gs: 0000   ss: 0000   cs: e008
> > (XEN) Xen code around <ffff82d04024ad2b> (vcpu_runstate_get+0x153/0x244=
):
> > (XEN)  48 8b 14 ca 48 8b 04 02 <4c> 8b 70 28 e9 01 ff ff ff 4c 8d 3d dd=
 64 32 00
> > (XEN) Xen stack trace from rsp=3Dffff830049667c10:
> > (XEN)    0000000000000180 ffff83025dcbd410 ffff83020511bf30 ffff8302051=
18c60
> > (XEN)    0000000000000001 0000000000000010 ffff830049667c80 ffff82d0402=
4ae73
> > (XEN)    0000000000000000 0000000000000000 0000000000000000 00000000000=
00000
> > (XEN)    0000000000000000 0000000000000000 ffff830049667cb8 ffff82d0402=
560a9
> > (XEN)    ffff830205118320 0000000000000001 ffff83020511bf30 ffff83025dc=
7a6f0
> > (XEN)    0000000000000000 ffff830049667d58 ffff82d040254cb1 00000001402=
e9f74
> > (XEN)    0000000000000000 ffff830049667d10 ffff82d040224eda 00000000002=
5dc81
> > (XEN)    000000321d74d000 ffff82d040571278 0000000000000001 ffff8300496=
67d28
> > (XEN)    ffff82d040228b44 ffff82d0403102cf 0000000000000000 ffff82d0402=
283a4
> > (XEN)    ffff82d040459688 ffff82d040459680 ffff82d040459240 00000000000=
00004
> > (XEN)    0000000000000000 ffff830049667d68 ffff82d04025510e ffff8300496=
67db0
> > (XEN)    ffff82d040221ba4 0000000000000000 0000000000000001 00000000000=
00001
> > (XEN)    0000000000000000 ffff830049667e00 0000000000000001 ffff82d0405=
8a5c0
> > (XEN)    ffff830049667dc8 ffff82d040203867 0000000000000001 ffff8300496=
67df0
> > (XEN)    ffff82d040203c51 ffff82d040459400 0000000000000001 00000000000=
00010
> > (XEN)    ffff830049667e20 ffff82d040203e26 ffff830049667ef8 00000000000=
00000
> > (XEN)    0000000000000003 0000000000000200 ffff830049667e50 ffff82d0402=
70bac
> > (XEN)    ffff83020116a640 ffff830258ff6000 0000000000000000 00000000000=
00000
> > (XEN)    ffff830049667e70 ffff82d0402056aa ffff830258ff61b8 ffff82d0405=
701b0
> > (XEN)    ffff830049667e88 ffff82d04022963c ffff82d0405701a0 ffff8300496=
67eb8
> > (XEN) Xen call trace:
> > (XEN)    [<ffff82d04024ad2b>] R vcpu_runstate_get+0x153/0x244

This is xen/common/sched/core.c:322. get_sched_res(v->processor) is
NULL at this point for CPU1.

The only place that can calls set_sched_res() and doesn't expect the
previous value to be valid, is cpu_schedule_up(). For non-BSP its called
_only_ from notifier at CPU_UP_PREPARE (cpu_schedule_callback()), but
that notifier explicitly exclude suspend/resume case:

    static int cpu_schedule_callback(
        struct notifier_block *nfb, unsigned long action, void *hcpu)
    {
        unsigned int cpu =3D (unsigned long)hcpu;
        int rc =3D 0;

        /*
         * All scheduler related suspend/resume handling needed is done in
         * cpupool.c.
         */
        if ( system_state > SYS_STATE_active )
            return NOTIFY_DONE;

But, nothing in cpupool.c is calling into set_sched_res().

On the other hand, sched_rm_cpu() (which I believe is called as part of
parking the CPU) calls cpu_schedule_down(), which then calls
set_sched_res(cpu, NULL).

In short: scheduler for parked CPUs is not re-initialized during resume.
But cpufreq expects it to be...


> > (XEN)    [<ffff82d04024ae73>] F get_cpu_idle_time+0x57/0x59
> > (XEN)    [<ffff82d0402560a9>] F cpufreq_statistic_init+0x191/0x210
> > (XEN)    [<ffff82d040254cb1>] F cpufreq_add_cpu+0x3cc/0x5bb
> > (XEN)    [<ffff82d04025510e>] F cpufreq.c#cpu_callback+0x27/0x32
> > (XEN)    [<ffff82d040221ba4>] F notifier_call_chain+0x6c/0x96
> > (XEN)    [<ffff82d040203867>] F cpu.c#cpu_notifier_call_chain+0x1b/0x36
> > (XEN)    [<ffff82d040203c51>] F cpu_up+0xaf/0xc8
> > (XEN)    [<ffff82d040203e26>] F enable_nonboot_cpus+0x6b/0x1f8
> > (XEN)    [<ffff82d040270bac>] F power.c#enter_state_helper+0x152/0x60a
> > (XEN)    [<ffff82d0402056aa>] F domain.c#continue_hypercall_tasklet_han=
dler+0x4c/0xb9
> > (XEN)    [<ffff82d04022963c>] F tasklet.c#do_tasklet_work+0x76/0xac
> > (XEN)    [<ffff82d040229920>] F do_tasklet+0x58/0x8a
> > (XEN)    [<ffff82d0402e6607>] F domain.c#idle_loop+0x74/0xdd
> > (XEN)=20
> > (XEN) Pagetable walk from 0000000000000028:
> > (XEN)  L4[0x000] =3D 000000025dce1063 ffffffffffffffff
> > (XEN)  L3[0x000] =3D 000000025dce0063 ffffffffffffffff
> > (XEN)  L2[0x000] =3D 000000025dcdf063 ffffffffffffffff
> > (XEN)  L1[0x000] =3D 0000000000000000 ffffffffffffffff
> > (XEN)=20
> > (XEN) ****************************************
> > (XEN) Panic on CPU 0:
> > (XEN) FATAL PAGE FAULT
> > (XEN) [error_code=3D0000]
> > (XEN) Faulting linear address: 0000000000000028
> > (XEN) ****************************************
> >=20
> > This is after adding brutal `this_cpu(xcr0) =3D 0` in xstate_init().
>=20
> And presumably again only with "smt=3D0"?=20

Yes. With smt=3D1 suspend works fine on this particular machine. At least
with only dom0 running (haven't tried with any domU yet)...

> In any event, for us to not mix
> things, may I ask that you start a new thread for this further issue?

Sure.

--=20
Best Regards,
Marek Marczykowski-G=C3=B3recki
Invisible Things Lab

--88oDJORWelxpH9uQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhrpukzGPukRmQqkK24/THMrX1ywFAmEbzMsACgkQ24/THMrX
1yyOLwf/c1JZH68gy9u0YX6aTt8rhrMEueiQpzwSIT7xCUfoaarzeRBrP27ly4dO
acW94j2IuSuiWOoiHzOomhwFUgK/ujJ9bCAGQyNe/qk6o3B8vspj8se1OCHh7gKj
nF75xXVoSOcP2FJVGikv4DVpTdtHjgMW0HvT65Hm1Qw+8lxdaKFIQk/c643UoSJL
Jaeywwz+q+4NvRqaRzv8V/lYEBey+0Jtt0e8CSTSUb2BapjaO68w7mipAWYdBRBS
RSO3rQZBSCrYVObhH3n+sH5YdMTIbVLpbK0NfmDwP93AKp3VrjIShAOZcvDOL9A4
5gk6FPFy4quxdjHTXnJ1Kn+NC8zifg==
=iPcC
-----END PGP SIGNATURE-----

--88oDJORWelxpH9uQ--

