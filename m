Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0840F2EB00B
	for <lists+xen-devel@lfdr.de>; Tue,  5 Jan 2021 17:29:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.62079.109693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwpCZ-0005kp-An; Tue, 05 Jan 2021 16:28:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 62079.109693; Tue, 05 Jan 2021 16:28:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kwpCZ-0005kQ-75; Tue, 05 Jan 2021 16:28:55 +0000
Received: by outflank-mailman (input) for mailman id 62079;
 Tue, 05 Jan 2021 16:28:53 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jvds=GI=arm.com=andre.przywara@srs-us1.protection.inumbo.net>)
 id 1kwpCX-0005kK-Fz
 for xen-devel@lists.xenproject.org; Tue, 05 Jan 2021 16:28:53 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id c6a06946-e2d5-4453-9f0e-916d288a19ef;
 Tue, 05 Jan 2021 16:28:51 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A73041FB;
 Tue,  5 Jan 2021 08:28:50 -0800 (PST)
Received: from [192.168.2.22] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DA3B73F70D;
 Tue,  5 Jan 2021 08:28:49 -0800 (PST)
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
X-Inumbo-ID: c6a06946-e2d5-4453-9f0e-916d288a19ef
Subject: Re: Smoke test failure on Arm (was Re: [PATCH v4 0/8] xen/arm:
 Emulate ID registers)
To: Julien Grall <julien@xen.org>, Bertrand Marquis
 <bertrand.marquis@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Ian Jackson <iwj@xenproject.org>
References: <cover.1608214355.git.bertrand.marquis@arm.com>
 <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org>
From: =?UTF-8?Q?Andr=c3=a9_Przywara?= <andre.przywara@arm.com>
Autocrypt: addr=andre.przywara@arm.com; prefer-encrypt=mutual; keydata=
 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
 i4aIXCH3Wv6K
Organization: ARM Ltd.
Message-ID: <338ef917-4b67-d839-82e4-164bbf46f85e@arm.com>
Date: Tue, 5 Jan 2021 16:28:25 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ea8e117c-26c0-5c94-e06a-12027d25d7d6@xen.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 05/01/2021 16:06, Julien Grall wrote:
> (+ Ian and Andre)
> 
> Hi Bertrand,
> 
> On IRC, Ian pointed out that the smoke test was failing on Cubietruck.
> The only patches because the last success and the failure are your series.
> 
> This seems to be a very early failure as there is no output from Xen [1].
> 
> I originally thought the problem was because some of the ID registers
> (such as ID_PFR2) introduced in patch #2 doesn't exist in Armv7.
> 
> But per B7.2.1 in ARM DDI 0406C.d, unallocated ID registers should be
> RAZ. So it would result to a crash. Andre confirmed that PFR2 can be
> accessed by writing a small baremetal code and booted on Cortex-A7 and
> Cortex-A20.
> 
> So I am not entirely sure what's the problem. Andre kindly accepted to
> try to boot Xen on his board. Hopefully, this will give us a clue on the
> problem.
> 
> If not, I will borrow a Cubietruck in OssTest and see if I can reproduce
> it and debug it.


So I just compiled master and staging and ran just that on an Allwinner
H3 (Cortex-A7 r0p5). Master boots fine (till it complains about the
missing Dom0, as expected). However staging indeed fails:

(XEN) Xen version 4.15-unstable (andprz01@slackpad.lan)
(arm-slackware-linux-gnueabihf-gcc (GCC) 8.2.0) debug=y  Tue Jan  5
16:09:40 GMT 2021
(XEN) Latest ChangeSet: Sun Nov 8 15:59:42 2020 +0100 git:c992efd06a
(XEN) build-id: 85d361b8565b90d4e0defe2beb2419e191fd76b4
(XEN) CPU0: Unexpected Trap: Undefined Instruction
(XEN) ----[ Xen-4.15-unstable  arm32  debug=y   Not tainted ]----
(XEN) CPU:    0
(XEN) PC:     0026b8c8 identify_cpu+0xc0/0xd4
(XEN) CPSR:   600001da MODE:Hypervisor
(XEN)      R0: 002acb20 R1: 00000000 R2: 00000000 R3: 11111111
(XEN)      R4: 002acb1c R5: 002acb20 R6: 4e000000 R7: 00000000
(XEN)      R8: 00000002 R9: 002d8200 R10:00008000 R11:002f7e6c R12:00000080
(XEN) HYP: SP: 002f7e68 LR: 002c419c
(XEN)
(XEN)   VTCR_EL2: 80002646
(XEN)  VTTBR_EL2: 00000018e628bb80
(XEN)
(XEN)  SCTLR_EL2: 30cd187f
(XEN)    HCR_EL2: 00000038
(XEN)  TTBR0_EL2: 000000004013a000
(XEN)
(XEN)    ESR_EL2: 00000000
(XEN)  HPFAR_EL2: 0003fff0
(XEN)      HDFAR: 9d110000
(XEN)      HIFAR: 0000a04a
(XEN)
(XEN) Xen stack trace from sp=002f7e68:
(XEN)    00000000 002f7f54 00008000 00000000 00002000 002a4584 00000000
00000000
(XEN)    00000000 00008000 49ff5000 002d81f0 40000000 00000000 00002000
00000001
(XEN)    00000000 50000000 49ffd000 00000000 50000000 00000000 00000000
50000000
(XEN)    4c000000 00000000 4e000000 00000000 ffffffff ffffffff 50000000
00000000
(XEN)    50000000 00000000 50000000 00000000 00000000 00000000 00000000
00000000
(XEN)    00000000 00000003 00000000 00000000 ffffffff 00000040 ffffffff
00000000
(XEN)    00000000 00000000 00000000 002a7000 40008050 0000001a 00000000
49ff5000
(XEN)    40008000 3fe08000 00000004 0020006c 00000000 00000000 00000000
00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000 00000000
00000000
(XEN)    00000000 00000000 00000000 00000000 00000000 00000000
(XEN) Xen call trace:
(XEN)    [<0026b8c8>] identify_cpu+0xc0/0xd4 (PC)
(XEN)    [<002c419c>] start_xen+0x778/0xe50 (LR)
(XEN)    [<002f7f54>] 002f7f54
(XEN)
(XEN)
(XEN) ****************************************
(XEN) Panic on CPU 0:
(XEN) CPU0: Unexpected Trap: Undefined Instruction
(XEN) ****************************************
(XEN)
(XEN) Reboot in five seconds...


The code in question:
  26b8c0:       eef63a10        vmrs    r3, mvfr1
  26b8c4:       e5803058        str     r3, [r0, #88]   ; 0x58
> 26b8c8:       eef53a10        vmrs    r3, mvfr2
  26b8cc:       e580305c        str     r3, [r0, #92]   ; 0x5c
  26b8d0:       e28bd000        add     sp, fp, #0
  26b8d4:       e49db004        pop     {fp}       ; (ldr fp, [sp], #4)
  26b8d8:       e12fff1e        bx      lr

And indeed MVFR2 is not mentioned in the ARMv7 ARM, and in contrast to
the CP15 CPUID registers this is using the VMRS instruction, so it's not
protected by future-proof CPUID register scheme.

Not sure what to do about this, maybe #ifdef'ing this register access
with arm64?
I guess this comes from the slightly too optimistic code-sharing between
arm32 and arm64?

Cheers,
Andre

> On 17/12/2020 15:38, Bertrand Marquis wrote:
>> The goal of this serie is to emulate coprocessor ID registers so that
>> Xen only publish to guest features that are supported by Xen and can
>> actually be used by guests.
>> One practical example where this is required are SVE support which is
>> forbidden by Xen as it is not supported, but if Linux is compiled with
>> it, it will crash on boot. An other one is AMU which is also forbidden
>> by Xen but one Linux compiled with it would crash if the platform
>> supports it.
>>
>> To be able to emulate the coprocessor registers defining what features
>> are supported by the hardware, the TID3 bit of HCR must be disabled and
>> Xen must emulated the values of those registers when an exception is
>> catched when a guest is accessing it.
>>
>> This serie is first creating a guest cpuinfo structure which will
>> contain the values that we want to publish to the guests and then
>> provides the proper emulationg for those registers when Xen is getting
>> an exception due to an access to any of those registers.
>>
>> This is a first simple implementation to solve the problem and the way
>> to define the values that we provide to guests and which features are
>> disabled will be in a future patchset enhance so that we could decide
>> per guest what can be used or not and depending on this deduce the bits
>> to activate in HCR and the values that we must publish on ID registers.
>>
>> ---
>> Changes in V2:
>>    Fix First patch to properly handle DFR1 register and increase dbg32
>>    size. Other patches have just been rebased.
>>
>> Changes in V3:
>>    Add handling of reserved registers as RAZ
>>    Minor fixes described in each patch
>>
>> Changes in V4:
>>    Add a patch to switch implementation to use READ_SYSREG instead of the
>>    32/64 bit version of it.
>>    Move cases for reserved register handling from macros to the code
>>    itself.
>>    Various typos fixes.
>>
>> Bertrand Marquis (8):
>>    xen/arm: Use READ_SYSREG instead of 32/64 versions
>>    xen/arm: Add ID registers and complete cpuinfo
>>    xen/arm: Add arm64 ID registers definitions
>>    xen/arm: create a cpuinfo structure for guest
>>    xen/arm: Add handler for ID registers on arm64
>>    xen/arm: Add handler for cp15 ID registers
>>    xen/arm: Add CP10 exception support to handle MVFR
>>    xen/arm: Activate TID3 in HCR_EL2
>>
>>   xen/arch/arm/arm64/vsysreg.c        |  82 ++++++++++++++++++++
>>   xen/arch/arm/cpufeature.c           | 113 ++++++++++++++++++++++------
>>   xen/arch/arm/traps.c                |   7 +-
>>   xen/arch/arm/vcpreg.c               | 102 +++++++++++++++++++++++++
>>   xen/include/asm-arm/arm64/hsr.h     |  37 +++++++++
>>   xen/include/asm-arm/arm64/sysregs.h |  28 +++++++
>>   xen/include/asm-arm/cpregs.h        |  15 ++++
>>   xen/include/asm-arm/cpufeature.h    |  58 +++++++++++---
>>   xen/include/asm-arm/perfc_defn.h    |   1 +
>>   xen/include/asm-arm/traps.h         |   1 +
>>   10 files changed, 409 insertions(+), 35 deletions(-)
>>
> 
> [1]
> http://logs.test-lab.xenproject.org/osstest/logs/158152/test-armhf-armhf-xl/info.html
> 
> 


