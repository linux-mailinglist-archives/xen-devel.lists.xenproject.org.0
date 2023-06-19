Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E322735B82
	for <lists+xen-devel@lfdr.de>; Mon, 19 Jun 2023 17:50:21 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551190.860583 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH8o-0007K3-6D; Mon, 19 Jun 2023 15:50:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551190.860583; Mon, 19 Jun 2023 15:50:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBH8o-0007HO-2G; Mon, 19 Jun 2023 15:50:06 +0000
Received: by outflank-mailman (input) for mailman id 551190;
 Mon, 19 Jun 2023 15:50:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Mm0T=CH=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qBH8m-00063X-Mz
 for xen-devel@lists.xenproject.org; Mon, 19 Jun 2023 15:50:04 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f32072b2-0eb8-11ee-b234-6b7b168915f2;
 Mon, 19 Jun 2023 17:50:02 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 7FEB08285453;
 Mon, 19 Jun 2023 10:50:00 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id ObautJSbPPCA; Mon, 19 Jun 2023 10:49:59 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 1A0698285493;
 Mon, 19 Jun 2023 10:49:59 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id ox8DoC9g7tUs; Mon, 19 Jun 2023 10:49:58 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id 7B8C78285453;
 Mon, 19 Jun 2023 10:49:58 -0500 (CDT)
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
X-Inumbo-ID: f32072b2-0eb8-11ee-b234-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 1A0698285493
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687189799; bh=M8DSWQuc3DFCtwdfwz7/fLkKlEOedphds4EbsLPPV6c=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=FcnNGAh+XWu0aIECIC1cB7Dh1HoOLax77qkIvjQpgq7oPGh3bVDiTLjLQ79zGjVo+
	 3SUyisZTmp1vahs5bu6mEh9d3/DH2X1hZ6OkpptV6DthcrLPFbr/LUXpFkgQrEkdcF
	 MinkDzyaLrqzP3FIgvGyTQ3/+mWc2piy8KyZDAHM=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <85e5d7ca-e6e1-3802-22ac-5728a03fd86d@raptorengineering.com>
Date: Mon, 19 Jun 2023 10:49:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Andrew Cooper <andrew.cooper3@citrix.com>, xen-devel@lists.xenproject.org
Cc: tpearson@raptorengineering.com, George Dunlap <george.dunlap@citrix.com>,
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <8383dd1a-064c-17c9-bb7f-4509518b9b42@citrix.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/23 3:24 PM, Andrew Cooper wrote:
> On 16/06/2023 6:48 pm, Shawn Anastasio wrote:
>> Add the build system changes required to build for ppc64le (POWER8+).
>> As of now the resulting image simply boots to an infinite loop.
>>
>> $ make XEN_TARGET_ARCH=ppc64 -C xen openpower_defconfig
>> $ make XEN_TARGET_ARCH=ppc64 SUBSYSTEMS=xen -C xen build
> 
> I think the first of these isn't needed, given the config ARCH_DEFCONFIG
> default.  I'd suggest dropping it.

It seems like the build system expects an `$(ARCH)_defconfig` present if
you don't manually specify a defconfig target. I see riscv64 has a
tiny64_defconfig and a riscv64_defconfig that are idential, probably for
this same reason. Would you like me to take the same approach of
duplicating openpower_defconfig to ppc64_defconfig?

> On the second, what is the SUBSYSTEMS=xen?  It's not needed given the
> stripped down build system, but I don't see why we'd ever be compiling
> Xen with some kind of subsystem configuration for something else.

This was a remnant of the old head.o-only TARGET build command that I
got from the initial riscv commit. You're correct that it's unnecessary
now and I'll drop it from the commit message.

>> diff --git a/config/ppc64.mk b/config/ppc64.mk
>> new file mode 100644
>> index 0000000000..597f0668c3
>> --- /dev/null
>> +++ b/config/ppc64.mk
>> @@ -0,0 +1,5 @@
>> +CONFIG_PPC := y
>> +CONFIG_PPC64 := y
>> +CONFIG_PPC_$(XEN_OS) := y
> 
> I know you're copying the existing architectures, but I'm pretty certain
> these $(XEN_OS) expressions are pretty bogus.  The userspace stuff in
> tools/ may need to know the host OS it's being built for, but Xen really
> doesn't.
> 
> I'm pretty sure it will compile with this dropped, so please do.  I'll
> see about patching it out of the other architectures.

Sure, I'll drop this in v5.

>> diff --git a/xen/arch/ppc/Kconfig b/xen/arch/ppc/Kconfig
>> new file mode 100644
>> index 0000000000..a0a70adef4
>> --- /dev/null
>> +++ b/xen/arch/ppc/Kconfig
>> @@ -0,0 +1,42 @@
>> +config PPC
>> +	def_bool y
>> +
>> +config PPC64
>> +	def_bool y
>> +	select 64BIT
>> +
>> +config ARCH_DEFCONFIG
>> +	string
>> +	default "arch/ppc/configs/openpower_defconfig"
>> +
>> +menu "Architecture Features"
>> +
>> +source "arch/Kconfig"
>> +
>> +endmenu
>> +
>> +menu "ISA Selection"
>> +
>> +choice
>> +	prompt "Base ISA"
>> +	default POWER_ISA_2_07B if PPC64
>> +	help
>> +	  This selects the base ISA version that Xen will target.
>> +
>> +config POWER_ISA_2_07B
>> +	bool "Power ISA 2.07B"
>> +	help
>> +	  Target version 2.07B of the Power ISA (POWER8)
>> +
>> +config POWER_ISA_3_00
>> +	bool "Power ISA 3.00"
>> +	help
>> +	  Target version 3.00 of the Power ISA (POWER9)
> 
> For both of these, it will be helpful for anyone who isn't as
> PPC-knowledgeable if the POWER8/9 was in the title too, seeing as
> they're the most common name.
> 
> But as I'm a noob here too, how different are Power8 and 9?  Given they
> share a head.S, they're presumably not too disjoint in terms of ISA.
>
> While being able to target a specific CPU is something we're trying to
> retrofit to Xen, by default we do expect it to run on as broad a set of
> systems as possible.

They're not that different, and a kernel built for POWER8 should just
work on POWER9. The intent was to specify a baseline feature set that
guards whether, i.e., POWER9/ISA3.0-only features should be built.

> If that's not feasible, then fine, but if it is, it ought to be the
> default.  Which might be as simple as saying "or later" somewhere in
> this text, or might be a giant can of worms that I shouldn't open...

Originally the help text for the two ISA config options ended in a "+"
but that was deemed ambiguous. Would adding "or later" to the help text
for the two options clarify it sufficiently?

>> diff --git a/xen/arch/ppc/include/asm/page-bits.h b/xen/arch/ppc/include/asm/page-bits.h
>> new file mode 100644
>> index 0000000000..4c01bf9716
>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/page-bits.h
>> @@ -0,0 +1,7 @@
>> +#ifndef __PPC_PAGE_BITS_H__
>> +#define __PPC_PAGE_BITS_H__
>> +
>> +#define PAGE_SHIFT              16 /* 64 KiB Pages */
>> +#define PADDR_BITS              48
> 
> Is 64k the minimum granularity?  Or is 4k an option?

Both 4K and 64K are supported by the hardware.

> I ask because Xen has some very short sighted ABIs which we're still
> working on removing.  There are still quite a few expectations of
> PAGE_SHIFT being 12.
> 
> To be clear, we're looking to fix all of these ABIs, but I suspect it
> will be an easier lift to begin with at 4k.  (Or perhaps the right thing
> is to double down and just get them fixed.)

Interesting. Given this I'm inclined to go with 4k just to reduce pain
points during initial bring up, though supporting 64k would definitely
be desirable going forward.

>> +
>> +#endif /* __PPC_PAGE_BITS_H__ */
>> diff --git a/xen/arch/ppc/ppc64/Makefile b/xen/arch/ppc/ppc64/Makefile
>> new file mode 100644
>> index 0000000000..3340058c08
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/Makefile
>> @@ -0,0 +1 @@
>> +obj-y += head.o
>> diff --git a/xen/arch/ppc/ppc64/asm-offsets.c b/xen/arch/ppc/ppc64/asm-offsets.c
>> new file mode 100644
>> index 0000000000..e69de29bb2
>> diff --git a/xen/arch/ppc/ppc64/head.S b/xen/arch/ppc/ppc64/head.S
>> new file mode 100644
>> index 0000000000..0b289c713a
>> --- /dev/null
>> +++ b/xen/arch/ppc/ppc64/head.S
>> @@ -0,0 +1,27 @@
>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>> +
>> +.section .text.header, "ax", %progbits
>> +
>> +ENTRY(start)
>> +    /*
>> +     * Depending on how we were booted, the CPU could be running in either
>> +     * Little Endian or Big Endian mode. The following trampoline from Linux
>> +     * cleverly uses an instruction that encodes to a NOP if the CPU's
>> +     * endianness matches the assumption of the assembler (LE, in our case)
>> +     * or a branch to code that performs the endian switch in the other case.
>> +     */
>> +    tdi 0, 0, 0x48    /* Reverse endian of b . + 8          */
>> +    b . + 44          /* Skip trampoline if endian is good  */
>> +    .long 0xa600607d  /* mfmsr r11                          */
>> +    .long 0x01006b69  /* xori r11,r11,1                     */
>> +    .long 0x00004039  /* li r10,0                           */
>> +    .long 0x6401417d  /* mtmsrd r10,1                       */
>> +    .long 0x05009f42  /* bcl 20,31,$+4                      */
>> +    .long 0xa602487d  /* mflr r10                           */
>> +    .long 0x14004a39  /* addi r10,r10,20                    */
>> +    .long 0xa6035a7d  /* mtsrr0 r10                         */
>> +    .long 0xa6037b7d  /* mtsrr1 r11                         */
>> +    .long 0x2400004c  /* rfid                               */
>> +
>> +    /* Now that the endianness is confirmed, continue */
>> +1:  b 1b
> 
> .size start, . - start
> .type start, %function
> 
> Lets get the ELF metadata right from the start.

Good point. Following the example in the Power ELFv2 ABI
specification [1] for function type annotation, I'll place

.type start, @function

in the ENTRY macro. It's not clear what the difference between %function
and @function are in this context (my toolchain seems to accept both and
produce the same ELF metadata), but the latter is more idiomatic in
Power assembly. The same goes for its placement before the entrypoint
vs. after the last instruction.

As for the size annotation, I'll follow Julien's suggestion and
introduce an END macro.

>> diff --git a/xen/arch/ppc/xen.lds.S b/xen/arch/ppc/xen.lds.S
>> new file mode 100644
>> index 0000000000..a72e519c6a
>> --- /dev/null
>> +++ b/xen/arch/ppc/xen.lds.S
>> @@ -0,0 +1,172 @@
>> <snip>
>> +    DISCARD_SECTIONS
>> +
>> +    STABS_DEBUG_SECTIONS
>> +
>> +    ELF_DETAILS_SECTIONS
>> +}
> 
> In the other architectures, we now assert that sections such as .got are
> empty, because we've had enough bugs in the past.
> 
> I'd recommend doing the same from the outset for all the dynamic
> relocation sections, unless you're expecting to have to support them?

No plans on supporting dynamic relocation (for now), so I can go ahead
and add these assertions.

> ~Andrew

Thanks,
Shawn

[1] Page 77 https://wiki.raptorcs.com/w/images/7/70/Leabi-20170510.pdf

