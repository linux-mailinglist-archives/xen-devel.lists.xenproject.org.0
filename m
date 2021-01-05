Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F24232EB2BB
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 19:44:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62166.109914 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwrJa-0003uq-3s; Tue, 05 Jan 2021 18:44:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62166.109914; Tue, 05 Jan 2021 18:44:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwrJa-0003uR-0S; Tue, 05 Jan 2021 18:44:18 +0000
Received: by outflank-mailman (input) for mailman id 62166;
 Tue, 05 Jan 2021 18:44:16 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z2QB=GI=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kwrJX-0003uM-VZ
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 18:44:16 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 010767f1-318c-4c5b-8d38-626b4e3e78cb;
 Tue, 05 Jan 2021 18:44:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 729FF22D04;
 Tue,  5 Jan 2021 18:44:14 +0000 (UTC)
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
X-Inumbo-ID: 010767f1-318c-4c5b-8d38-626b4e3e78cb
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1609872254;
	bh=lqQ9FxfWjPnOJU+tIorRiminbSghlUtDdolvR5fCaDI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=MYoCxrLJn2QxSFwIZ6OIOUVoH1IZY3UKFFV/CV6t7VrNoK+2q7PFOTDzCLEwfzlEK
	 sSsSdIPmDovyrxXcAEooVCzqeAdqptsdTTSaqmDe6f0S0l7wnwqOIKZN7uEa0yVbQI
	 5lOt79At6GtK8KEvRrif5yIgEU2Qb+fVqfB4Pj+Jzv82xZxt/a8DxHH8FIbUwor2P3
	 I0umIb0w6xjDz5UmWylM31oMbE/ga3U/MSN+pVUQXIlCWFTNUfzyThutWsiW8kqzEd
	 WfSA7cSol7y+XApJ723iyaD2EFWRPcJXtXUSn0Y+Vp2hDwYu4LHFIiPIWR76Ux1T4V
	 aCo4lyQqPdT9A==
Date: Tue, 5 Jan 2021 10:44:06 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Andr=C3=A9_Przywara?= <andre.przywara@arm.com>
cc: Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>, 
    xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Ian Jackson <iwj@xenproject.org>
Subject: Re: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm:
 Emulate ID registers)
In-Reply-To: <338ef917-4b67-d839-82e4-164bbf46f85e@arm.com>
Message-ID: <alpine.DEB.2.21.2101051042230.4307@sstabellini-ThinkPad-T480s>
References: <cover.1608214355.git.bertrand.marquis@arm.com> <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org> <338ef917-4b67-d839-82e4-164bbf46f85e@arm.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2058439318-1609872239=:4307"
Content-ID: <alpine.DEB.2.21.2101051044010.4307@sstabellini-ThinkPad-T480s>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2058439318-1609872239=:4307
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <alpine.DEB.2.21.2101051044011.4307@sstabellini-ThinkPad-T480s>

On Tue, 5 Jan 2021, André Przywara wrote:
> On 05/01/2021 16:06, Julien Grall wrote:
> > (+ Ian and Andre)
> > 
> > Hi Bertrand,
> > 
> > On IRC, Ian pointed out that the smoke test was failing on Cubietruck.
> > The only patches because the last success and the failure are your series.
> > 
> > This seems to be a very early failure as there is no output from Xen [1].
> > 
> > I originally thought the problem was because some of the ID registers
> > (such as ID_PFR2) introduced in patch #2 doesn't exist in Armv7.
> > 
> > But per B7.2.1 in ARM DDI 0406C.d, unallocated ID registers should be
> > RAZ. So it would result to a crash. Andre confirmed that PFR2 can be
> > accessed by writing a small baremetal code and booted on Cortex-A7 and
> > Cortex-A20.
> > 
> > So I am not entirely sure what's the problem. Andre kindly accepted to
> > try to boot Xen on his board. Hopefully, this will give us a clue on the
> > problem.
> > 
> > If not, I will borrow a Cubietruck in OssTest and see if I can reproduce
> > it and debug it.
> 
> 
> So I just compiled master and staging and ran just that on an Allwinner
> H3 (Cortex-A7 r0p5). Master boots fine (till it complains about the
> missing Dom0, as expected). However staging indeed fails:
> 
> (XEN) Xen version 4.15-unstable (andprz01@slackpad.lan)
> (arm-slackware-linux-gnueabihf-gcc (GCC) 8.2.0) debug=y  Tue Jan  5
> 16:09:40 GMT 2021
> (XEN) Latest ChangeSet: Sun Nov 8 15:59:42 2020 +0100 git:c992efd06a
> (XEN) build-id: 85d361b8565b90d4e0defe2beb2419e191fd76b4
> (XEN) CPU0: Unexpected Trap: Undefined Instruction
> (XEN) ----[ Xen-4.15-unstable  arm32  debug=y   Not tainted ]----
> (XEN) CPU:    0
> (XEN) PC:     0026b8c8 identify_cpu+0xc0/0xd4
> (XEN) CPSR:   600001da MODE:Hypervisor
> (XEN)      R0: 002acb20 R1: 00000000 R2: 00000000 R3: 11111111
> (XEN)      R4: 002acb1c R5: 002acb20 R6: 4e000000 R7: 00000000
> (XEN)      R8: 00000002 R9: 002d8200 R10:00008000 R11:002f7e6c R12:00000080
> (XEN) HYP: SP: 002f7e68 LR: 002c419c
> (XEN)
> (XEN)   VTCR_EL2: 80002646
> (XEN)  VTTBR_EL2: 00000018e628bb80
> (XEN)
> (XEN)  SCTLR_EL2: 30cd187f
> (XEN)    HCR_EL2: 00000038
> (XEN)  TTBR0_EL2: 000000004013a000
> (XEN)
> (XEN)    ESR_EL2: 00000000
> (XEN)  HPFAR_EL2: 0003fff0
> (XEN)      HDFAR: 9d110000
> (XEN)      HIFAR: 0000a04a
> (XEN)
> (XEN) Xen stack trace from sp=002f7e68:
> (XEN)    00000000 002f7f54 00008000 00000000 00002000 002a4584 00000000
> 00000000
> (XEN)    00000000 00008000 49ff5000 002d81f0 40000000 00000000 00002000
> 00000001
> (XEN)    00000000 50000000 49ffd000 00000000 50000000 00000000 00000000
> 50000000
> (XEN)    4c000000 00000000 4e000000 00000000 ffffffff ffffffff 50000000
> 00000000
> (XEN)    50000000 00000000 50000000 00000000 00000000 00000000 00000000
> 00000000
> (XEN)    00000000 00000003 00000000 00000000 ffffffff 00000040 ffffffff
> 00000000
> (XEN)    00000000 00000000 00000000 002a7000 40008050 0000001a 00000000
> 49ff5000
> (XEN)    40008000 3fe08000 00000004 0020006c 00000000 00000000 00000000
> 00000000
> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
> 00000000
> (XEN)    00000000 00000000 00000000 00000000 00000000 00000000
> (XEN) Xen call trace:
> (XEN)    [<0026b8c8>] identify_cpu+0xc0/0xd4 (PC)
> (XEN)    [<002c419c>] start_xen+0x778/0xe50 (LR)
> (XEN)    [<002f7f54>] 002f7f54
> (XEN)
> (XEN)
> (XEN) ****************************************
> (XEN) Panic on CPU 0:
> (XEN) CPU0: Unexpected Trap: Undefined Instruction
> (XEN) ****************************************
> (XEN)
> (XEN) Reboot in five seconds...
> 
> 
> The code in question:
>   26b8c0:       eef63a10        vmrs    r3, mvfr1
>   26b8c4:       e5803058        str     r3, [r0, #88]   ; 0x58
> > 26b8c8:       eef53a10        vmrs    r3, mvfr2
>   26b8cc:       e580305c        str     r3, [r0, #92]   ; 0x5c
>   26b8d0:       e28bd000        add     sp, fp, #0
>   26b8d4:       e49db004        pop     {fp}       ; (ldr fp, [sp], #4)
>   26b8d8:       e12fff1e        bx      lr
> 
> And indeed MVFR2 is not mentioned in the ARMv7 ARM, and in contrast to
> the CP15 CPUID registers this is using the VMRS instruction, so it's not
> protected by future-proof CPUID register scheme.
> 
> Not sure what to do about this, maybe #ifdef'ing this register access
> with arm64?
> I guess this comes from the slightly too optimistic code-sharing between
> arm32 and arm64?

Yes and #ifdef'ing is what we have been doing with the other registers.
It looks OK in cpufeature.c; it looks ugly in cpufeature.h but I
couldn't come up with something nicer at the moment.

diff --git a/xen/arch/arm/cpufeature.c b/xen/arch/arm/cpufeature.c
index 1f6a85aafe..9e3377eae3 100644
--- a/xen/arch/arm/cpufeature.c
+++ b/xen/arch/arm/cpufeature.c
@@ -150,7 +150,9 @@ void identify_cpu(struct cpuinfo_arm *c)
 
         c->mvfr.bits[0] = READ_SYSREG(MVFR0_EL1);
         c->mvfr.bits[1] = READ_SYSREG(MVFR1_EL1);
+#ifdef CONFIG_ARM_64
         c->mvfr.bits[2] = READ_SYSREG(MVFR2_EL1);
+#endif
 }
 
 /*
diff --git a/xen/include/asm-arm/cpufeature.h b/xen/include/asm-arm/cpufeature.h
index 6058744c18..29a63a91c8 100644
--- a/xen/include/asm-arm/cpufeature.h
+++ b/xen/include/asm-arm/cpufeature.h
@@ -271,9 +271,15 @@ struct cpuinfo_arm {
         uint32_t bits[7];
     } isa32;
 
+#ifdef CONFIG_ARM_64
     struct {
         register_t bits[3];
     } mvfr;
+#else
+    struct {
+        register_t bits[2];
+    } mvfr;
+#endif
 };
 
 extern struct cpuinfo_arm boot_cpu_data;
--8323329-2058439318-1609872239=:4307--

