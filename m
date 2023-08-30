Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C5ECC78D5FE
	for <lists+xen-devel@lfdr.de>; Wed, 30 Aug 2023 14:53:29 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.592888.925725 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKh8-0005VF-NJ; Wed, 30 Aug 2023 12:53:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 592888.925725; Wed, 30 Aug 2023 12:53:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qbKh8-0005TZ-KY; Wed, 30 Aug 2023 12:53:14 +0000
Received: by outflank-mailman (input) for mailman id 592888;
 Wed, 30 Aug 2023 12:53:12 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Gtsd=EP=bugseng.com=simone.ballarin@srs-se1.protection.inumbo.net>)
 id 1qbKh6-0005TT-Nr
 for xen-devel@lists.xenproject.org; Wed, 30 Aug 2023 12:53:12 +0000
Received: from support.bugseng.com (mail.bugseng.com [162.55.131.47])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2c2bee5f-4734-11ee-9b0d-b553b5be7939;
 Wed, 30 Aug 2023 14:53:10 +0200 (CEST)
Received: from [192.168.8.109] (unknown [151.82.72.120])
 by support.bugseng.com (Postfix) with ESMTPSA id 2A8894EE0738;
 Wed, 30 Aug 2023 14:53:09 +0200 (CEST)
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
X-Inumbo-ID: 2c2bee5f-4734-11ee-9b0d-b553b5be7939
Message-ID: <8d82e827-6ad9-4695-5ec0-65c65b79b055@bugseng.com>
Date: Wed, 30 Aug 2023 14:53:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [XEN PATCH 03/13] xen/arm: address violations of MISRA C:2012
 Directive 4.10
Content-Language: en-US
To: Julien Grall <julien.grall.oss@gmail.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, consulting@bugseng.com,
 sstabellini@kernel.org, xen-devel@lists.xenproject.org
References: <cover.1693228255.git.simone.ballarin@bugseng.com>
 <2d37ca48cf6556ebfcb4b17cddd2446fa549f689.1693228255.git.simone.ballarin@bugseng.com>
 <CAJ=z9a2hnjCAkGN_YtCQRh8ZcyMMawxBhF8LOwgrQ5-nML1chg@mail.gmail.com>
From: Simone Ballarin <simone.ballarin@bugseng.com>
Organization: BUGSENG
In-Reply-To: <CAJ=z9a2hnjCAkGN_YtCQRh8ZcyMMawxBhF8LOwgrQ5-nML1chg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 29/08/23 00:10, Julien Grall wrote:
> Hi,
> 
> On Mon, 28 Aug 2023 at 09:20, Simone Ballarin <simone.ballarin@bugseng.com>
> wrote:
> 
>> Add or move inclusion guards to address violations of
>> MISRA C:2012 Directive 4.10 ("Precautions shall be taken in order
>> to prevent the contents of a header file being included more than
>> once").
>>
>> Inclusion guards must appear at the beginning of the headers
>> (comments are permitted anywhere).
>>
>> Mechanical change.
>>
>> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>
>> ---
>>   xen/arch/arm/efi/efi-boot.h          | 6 ++++++
>>   xen/arch/arm/include/asm/hypercall.h | 6 +++---
>>   xen/arch/arm/include/asm/iocap.h     | 6 +++---
>>   3 files changed, 12 insertions(+), 6 deletions(-)
>>
>> diff --git a/xen/arch/arm/efi/efi-boot.h b/xen/arch/arm/efi/efi-boot.h
>> index 1c3640bb65..aba522ead5 100644
>> --- a/xen/arch/arm/efi/efi-boot.h
>> +++ b/xen/arch/arm/efi/efi-boot.h
>> @@ -3,6 +3,10 @@
>>    * is intended to be included by common/efi/boot.c _only_, and
>>    * therefore can define arch specific global variables.
>>    */
>> +
>> +#ifndef __ARM_EFI_EFI_BOOT_H__
>> +#define __ARM_EFI_EFI_BOOT_H__
>> +
>>   #include <xen/device_tree.h>
>>   #include <xen/libfdt/libfdt.h>
>>   #include <asm/setup.h>
>> @@ -1003,6 +1007,8 @@ static void __init efi_arch_flush_dcache_area(const
>> void *vaddr, UINTN size)
>>       __flush_dcache_area(vaddr, size);
>>   }
>>
>> +#endif /* __ARM_EFI_EFI_BOOT_H__*/
>> +
>>   /*
>>    * Local variables:
>>    * mode: C
>> diff --git a/xen/arch/arm/include/asm/hypercall.h
>> b/xen/arch/arm/include/asm/hypercall.h
>> index ccd26c5184..4f4d96f1f2 100644
>> --- a/xen/arch/arm/include/asm/hypercall.h
>> +++ b/xen/arch/arm/include/asm/hypercall.h
>> @@ -1,10 +1,10 @@
>> +#ifndef __ASM_ARM_HYPERCALL_H__
>> +#define __ASM_ARM_HYPERCALL_H__
>> +
>>   #ifndef __XEN_HYPERCALL_H__
>>   #error "asm/hypercall.h should not be included directly - include
>> xen/hypercall.h instead"
>>   #endif
>>
>> -#ifndef __ASM_ARM_HYPERCALL_H__
>> -#define __ASM_ARM_HYPERCALL_H__
>> -
> 
> 
> I understand that you are trying to fix a misra violation. However, this
> feels like it was done on purpose.
> 
> With the new change, you would not always check that the file were included
> at the correct place. I am not against this change but this ought to be
> explained.
I don't think the semantics have changed. Please correct me if I'm wrong.

With this change, the only situation where the check is not performed is 
when __ASM_ARM_HYPERCALL_H__ is defined (i.e. the file has already been 
successfully included). This implies that if __ASM_ARM_HYPERCALL_H__ is 
defined, then __XEN_HYPERCALL_H__ is also defined, so the check would be 
useless.

The same thing happened with the code before the change: if I include 
the file after xen/hypercall.h, the check will always succeed.

> 
> 
>>   #include <public/domctl.h> /* for arch_do_domctl */
>>
>>   long subarch_do_domctl(struct xen_domctl *domctl, struct domain *d,
>> diff --git a/xen/arch/arm/include/asm/iocap.h
>> b/xen/arch/arm/include/asm/iocap.h
>> index 276fefbc59..4db1b16839 100644
>> --- a/xen/arch/arm/include/asm/iocap.h
>> +++ b/xen/arch/arm/include/asm/iocap.h
>> @@ -1,10 +1,10 @@
>> -#ifndef __X86_IOCAP_H__
>> -#define __X86_IOCAP_H__
>> +#ifndef __ASM_ARM_IOCAP_H__
>> +#define __ASM_ARM_IOCAP_H__
>>
>>   #define cache_flush_permitted(d)                        \
>>       (!rangeset_is_empty((d)->iomem_caps))
>>
>> -#endif
>> +#endif /* __ASM_ARM_IOCAP_H__ */
> 
> 
> I don’t understand how this is related to the rest of the patch. You wrote
> that inclusion must appear first and this is the case here.
> 
> However the name is technically not correct. Is this really related to
> directive 4.10? If so, this should be clarified in the commit message. If
> not, then I think this should be in a separate commit.
>

Yes, you are right. This is not correlated to this series. I will put it 
on a separate commit.

> Cheers,
> 
> 
>>
>>   /*
>>    * Local variables:
>> --
>> 2.34.1
>>
>>
> 

-- 
Simone Ballarin, M.Sc.

Field Application Engineer, BUGSENG (https://bugseng.com)


