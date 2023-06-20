Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B39C73706E
	for <lists+xen-devel@lfdr.de>; Tue, 20 Jun 2023 17:28:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.551939.861719 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdHH-0007Mt-IK; Tue, 20 Jun 2023 15:28:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 551939.861719; Tue, 20 Jun 2023 15:28:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qBdHH-0007LW-F9; Tue, 20 Jun 2023 15:28:19 +0000
Received: by outflank-mailman (input) for mailman id 551939;
 Tue, 20 Jun 2023 15:28:18 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=G5hq=CI=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1qBdHG-0007LI-9a
 for xen-devel@lists.xenproject.org; Tue, 20 Jun 2023 15:28:18 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 12fffbba-0f7f-11ee-b234-6b7b168915f2;
 Tue, 20 Jun 2023 17:28:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 5A9AE8284F41;
 Tue, 20 Jun 2023 10:28:14 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id T0eUghUAq61c; Tue, 20 Jun 2023 10:28:13 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 467B08285596;
 Tue, 20 Jun 2023 10:28:13 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id PyPLzdND__xm; Tue, 20 Jun 2023 10:28:13 -0500 (CDT)
Received: from [10.11.0.2] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A6F378284F41;
 Tue, 20 Jun 2023 10:28:12 -0500 (CDT)
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
X-Inumbo-ID: 12fffbba-0f7f-11ee-b234-6b7b168915f2
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 467B08285596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1687274893; bh=GQnd/bnn/jngKatbSBOa0Rs/viCXfhFksKNkCLSdvFk=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=T6Pawpaf7fqx9csuy7aXYoqoFGcUPmh2964KkcZPlSxRHuTDcH5Z1+e60g1G+HhmM
	 vxKn6UH768o90nxf8fGkAckjKnrDBzvfBlc2aumGKaPKsSeFUoPSlCLbAksKAC1EIm
	 +jKMfzaNQ9wuPMPIZaQjiv+e1Xm8tlAyPnxzt53g=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <57bd1c94-7371-2d63-1f2e-ffadc9568664@raptorengineering.com>
Date: Tue, 20 Jun 2023 10:28:11 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux ppc64le; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v4 2/4] xen: Add files needed for minimal ppc64le build
Content-Language: en-US
To: Jan Beulich <jbeulich@suse.com>
Cc: tpearson@raptorengineering.com, Andrew Cooper
 <andrew.cooper3@citrix.com>, George Dunlap <george.dunlap@citrix.com>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <cover.1686936278.git.sanastasio@raptorengineering.com>
 <97a72e26edafb1d7b3a583755f015d04066c1e53.1686936278.git.sanastasio@raptorengineering.com>
 <5dc1965c-6d7d-16bd-09e5-85bc950ffea8@suse.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <5dc1965c-6d7d-16bd-09e5-85bc950ffea8@suse.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/20/23 5:15 AM, Jan Beulich wrote:
> On 16.06.2023 19:48, Shawn Anastasio wrote:
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
> 
> I think the "if" here is at best confusing. If / when ppc32 support
> is added, a potentially different default here would make necessary
> adjustments, yet imo would not be very likely to introduce this very
> "if".

Fair enough, I'll drop the if.

>> --- /dev/null
>> +++ b/xen/arch/ppc/arch.mk
>> @@ -0,0 +1,12 @@
>> +########################################
>> +# Power-specific definitions
>> +
>> +ppc-march-$(CONFIG_POWER_ISA_2_07B) := power8
>> +ppc-march-$(CONFIG_POWER_ISA_3_00) := power9
>> +
>> +CFLAGS += -m64 -mlittle-endian -mcpu=$(ppc-march-y)
>> +CFLAGS += -mstrict-align -mcmodel=large -mabi=elfv2 -mno-altivec -mno-vsx
> 
> Just for my own education: Besides the expected effect, -mstrict-align
> also appears to imply -mbit-align, which I'm not sure is intended here.
> Could you clarify the intentions for me?

If I'm reading the GCC documentation right, -mbit-align is the default
behavior regardless of -mstrict-align. The intention was simply to avoid
the generation of unaligned memory accesses in the kernel, since they
are only handled in hardware up to a certain width.

> As to -mabi=elfv2, it looks as if this limits us to gcc12 and newer.
> That's fine, but I think it wants pointing out in ./README (which has
> a section for this kind of information).

This is not the case. The ELFv2 ABI was released in 2014 and has been
the de facto standard on ppc64le since its inception. I know that ELFv2
support in GCC dates back to at least version 6 (the earliest I can
remember using), but I believe it goes back even further than that.

>> --- /dev/null
>> +++ b/xen/arch/ppc/include/asm/config.h
>> @@ -0,0 +1,63 @@
>> +#ifndef __PPC_CONFIG_H__
>> +#define __PPC_CONFIG_H__
>> +
>> +#include <xen/const.h>
>> +#include <xen/page-size.h>
>> +
>> +#if defined(CONFIG_PPC64)
>> +#define LONG_BYTEORDER 3
>> +#define ELFSIZE        64
>> +#define MAX_VIRT_CPUS  1024u
>> +#else
>> +#error "Unsupported PowerPC variant"
>> +#endif
>> +
>> +#define BYTES_PER_LONG (1 << LONG_BYTEORDER)
>> +#define BITS_PER_LONG  (BYTES_PER_LONG << 3)
>> +#define POINTER_ALIGN  BYTES_PER_LONG
>> +
>> +#define BITS_PER_LLONG 64
>> +
>> +/* xen_ulong_t is always 64 bits */
>> +#define BITS_PER_XEN_ULONG 64
>> +
>> +#define CONFIG_PPC_L1_CACHE_SHIFT  7
>> +#define CONFIG_PAGEALLOC_MAX_ORDER 18
>> +#define CONFIG_DOMU_MAX_ORDER      9
>> +#define CONFIG_HWDOM_MAX_ORDER     10
>> +
>> +#define OPT_CONSOLE_STR "dtuart"
>> +#define INVALID_VCPU_ID MAX_VIRT_CPUS
>> +
>> +/* Linkage for PPC */
>> +#ifdef __ASSEMBLY__
>> +#define ALIGN .align 2
> 
> I think I did ask for the same on RISC-V (yet sadly it's still .align
> there): .align is notoriously ambiguous. May I ask that you use .p2align
> (which I think is what is meant here, else .balign)?

Sure, will do.

> Jan

Thanks,
Shawn

