Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E40F7FC754
	for <lists+xen-devel@lfdr.de>; Tue, 28 Nov 2023 22:09:49 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.643479.1003764 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85KW-0006K8-BV; Tue, 28 Nov 2023 21:09:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 643479.1003764; Tue, 28 Nov 2023 21:09:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r85KW-0006Hh-8e; Tue, 28 Nov 2023 21:09:16 +0000
Received: by outflank-mailman (input) for mailman id 643479;
 Tue, 28 Nov 2023 21:09:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=9Vht=HJ=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r85KU-0006Hb-Mf
 for xen-devel@lists.xenproject.org; Tue, 28 Nov 2023 21:09:14 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5f76d719-8e32-11ee-9b0e-b553b5be7939;
 Tue, 28 Nov 2023 22:09:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id E7C6B828467E;
 Tue, 28 Nov 2023 15:09:08 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id dkK1w7bRXPu1; Tue, 28 Nov 2023 15:09:08 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id DF3E58285607;
 Tue, 28 Nov 2023 15:09:07 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id EaB2Bz80lqjb; Tue, 28 Nov 2023 15:09:07 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 36CB0828467E;
 Tue, 28 Nov 2023 15:09:07 -0600 (CST)
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
X-Inumbo-ID: 5f76d719-8e32-11ee-9b0e-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com DF3E58285607
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701205747; bh=+cV0U4FB92CxZSxKehpYbSRhssvtuhbVf5mHw/eox7E=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=nsBpVWxGVl++jz9h8hiLytQoqQdULR15ZjSlVFN5WUVuf6bm0pR7owbgV+O9kbimR
	 fSiHTg9tKjnGSt58vqWWQfHcl8pYpL5dJTeG5x1gM86IoGC3TmGA9ASElytwvOau5i
	 pRCMHzWhO8nLoYNsvBl1KnXUxz/tC5UGOwVdOk3I=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <8a77af08-fed1-4b9f-ad93-df4f5d7b4d53@raptorengineering.com>
Date: Tue, 28 Nov 2023 15:09:06 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] xen: remove <asm/delay.h>
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
References: <3d55bce44bd6ab9973cbe0ea2fc136cc44d35df2.1698759633.git.oleksii.kurochko@gmail.com>
 <e720e5a053c2ec6b68546f33bb5713b2f2e12c98.camel@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <e720e5a053c2ec6b68546f33bb5713b2f2e12c98.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

My apologies for the delay on this and thank you for reaching to me for
the ping, Oleksii.

Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>

On 11/27/23 4:26 AM, Oleksii wrote:
> Hello Shawn,
>=20
> Could you kindly review the patch when you have a moment?
> It can help with merging other patch series.
>=20
> Thanks in advance.
>=20
> ~ Oleksii
>=20
> On Tue, 2023-10-31 at 16:28 +0200, Oleksii Kurochko wrote:
>> <asm/delay.h> only declares udelay() function so udelay()
>> declaration was moved to xen/delay.h.
>>
>> For x86, __udelay() was renamed to udelay() and removed
>> inclusion of <asm/delay.h> in x86 code.
>>
>> For ppc, udelay() stub definition was moved to ppc/stubs.c.
>>
>> Suggested-by: Jan Beulich <jbeulich@suse.com>
>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>> Reviewed-by: Jan Beulich <jbeulich@suse.com>
>> ---
>> Changes in v2:
>> =C2=A0- rebase on top of the latest staging.
>> =C2=A0- add Suggested-by:/Reviewed-by: Jan Beulich <jbeulich@suse.com>=
.
>> =C2=A0- remove <asm/delay.h> for PPC.
>> =C2=A0- remove changes related to RISC-V's <asm/delay.h> as they've no=
t
>> =C2=A0=C2=A0 introduced in staging branch yet.
>> ---
>> =C2=A0xen/arch/arm/include/asm/delay.h=C2=A0 | 14 --------------
>> =C2=A0xen/arch/ppc/include/asm/delay.h=C2=A0 | 12 ------------
>> =C2=A0xen/arch/ppc/stubs.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++++
>> =C2=A0xen/arch/x86/cpu/microcode/core.c |=C2=A0 2 +-
>> =C2=A0xen/arch/x86/delay.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A0xen/arch/x86/include/asm/delay.h=C2=A0 | 13 -------------
>> =C2=A0xen/include/xen/delay.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
>> =C2=A07 files changed, 10 insertions(+), 42 deletions(-)
>> =C2=A0delete mode 100644 xen/arch/arm/include/asm/delay.h
>> =C2=A0delete mode 100644 xen/arch/ppc/include/asm/delay.h
>> =C2=A0delete mode 100644 xen/arch/x86/include/asm/delay.h
>>
>> diff --git a/xen/arch/arm/include/asm/delay.h
>> b/xen/arch/arm/include/asm/delay.h
>> deleted file mode 100644
>> index 042907d9d5..0000000000
>> --- a/xen/arch/arm/include/asm/delay.h
>> +++ /dev/null
>> @@ -1,14 +0,0 @@
>> -#ifndef _ARM_DELAY_H
>> -#define _ARM_DELAY_H
>> -
>> -extern void udelay(unsigned long usecs);
>> -
>> -#endif /* defined(_ARM_DELAY_H) */
>> -/*
>> - * Local variables:
>> - * mode: C
>> - * c-file-style: "BSD"
>> - * c-basic-offset: 4
>> - * indent-tabs-mode: nil
>> - * End:
>> - */
>> diff --git a/xen/arch/ppc/include/asm/delay.h
>> b/xen/arch/ppc/include/asm/delay.h
>> deleted file mode 100644
>> index da6635888b..0000000000
>> --- a/xen/arch/ppc/include/asm/delay.h
>> +++ /dev/null
>> @@ -1,12 +0,0 @@
>> -/* SPDX-License-Identifier: GPL-2.0-only */
>> -#ifndef __ASM_PPC_DELAY_H__
>> -#define __ASM_PPC_DELAY_H__
>> -
>> -#include <xen/lib.h>
>> -
>> -static inline void udelay(unsigned long usecs)
>> -{
>> -=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
>> -}
>> -
>> -#endif /* __ASM_PPC_DELAY_H__ */
>> diff --git a/xen/arch/ppc/stubs.c b/xen/arch/ppc/stubs.c
>> index 4c276b0e39..a96e45626d 100644
>> --- a/xen/arch/ppc/stubs.c
>> +++ b/xen/arch/ppc/stubs.c
>> @@ -337,3 +337,10 @@ int __init parse_arch_dom0_param(const char *s,
>> const char *e)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
>> =C2=A0}
>> +
>> +/* delay.c */
>> +
>> +void udelay(unsigned long usecs)
>> +{
>> +=C2=A0=C2=A0=C2=A0 BUG_ON("unimplemented");
>> +}
>> diff --git a/xen/arch/x86/cpu/microcode/core.c
>> b/xen/arch/x86/cpu/microcode/core.c
>> index 65ebeb50de..22d5e04552 100644
>> --- a/xen/arch/x86/cpu/microcode/core.c
>> +++ b/xen/arch/x86/cpu/microcode/core.c
>> @@ -23,6 +23,7 @@
>> =C2=A0
>> =C2=A0#include <xen/alternative-call.h>
>> =C2=A0#include <xen/cpu.h>
>> +#include <xen/delay.h>
>> =C2=A0#include <xen/earlycpio.h>
>> =C2=A0#include <xen/err.h>
>> =C2=A0#include <xen/guest_access.h>
>> @@ -35,7 +36,6 @@
>> =C2=A0
>> =C2=A0#include <asm/apic.h>
>> =C2=A0#include <asm/cpu-policy.h>
>> -#include <asm/delay.h>
>> =C2=A0#include <asm/nmi.h>
>> =C2=A0#include <asm/processor.h>
>> =C2=A0#include <asm/setup.h>
>> diff --git a/xen/arch/x86/delay.c b/xen/arch/x86/delay.c
>> index 2662c26272..b3a41881a1 100644
>> --- a/xen/arch/x86/delay.c
>> +++ b/xen/arch/x86/delay.c
>> @@ -15,7 +15,7 @@
>> =C2=A0#include <asm/msr.h>
>> =C2=A0#include <asm/processor.h>
>> =C2=A0
>> -void __udelay(unsigned long usecs)
>> +void udelay(unsigned long usecs)
>> =C2=A0{
>> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long ticks =3D usecs * (cpu_khz / 10=
00);
>> =C2=A0=C2=A0=C2=A0=C2=A0 unsigned long s, e;
>> diff --git a/xen/arch/x86/include/asm/delay.h
>> b/xen/arch/x86/include/asm/delay.h
>> deleted file mode 100644
>> index 9be2f46590..0000000000
>> --- a/xen/arch/x86/include/asm/delay.h
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -#ifndef _X86_DELAY_H
>> -#define _X86_DELAY_H
>> -
>> -/*
>> - * Copyright (C) 1993 Linus Torvalds
>> - *
>> - * Delay routines calling functions in arch/i386/lib/delay.c
>> - */
>> -
>> -extern void __udelay(unsigned long usecs);
>> -#define udelay(n) __udelay(n)
>> -
>> -#endif /* defined(_X86_DELAY_H) */
>> diff --git a/xen/include/xen/delay.h b/xen/include/xen/delay.h
>> index 9150226271..8fd3b8f99f 100644
>> --- a/xen/include/xen/delay.h
>> +++ b/xen/include/xen/delay.h
>> @@ -3,7 +3,7 @@
>> =C2=A0
>> =C2=A0/* Copyright (C) 1993 Linus Torvalds */
>> =C2=A0
>> -#include <asm/delay.h>
>> +void udelay(unsigned long usecs);
>> =C2=A0
>> =C2=A0static inline void mdelay(unsigned long msec)
>> =C2=A0{
>=20

