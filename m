Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F28081CB42
	for <lists+xen-devel@lfdr.de>; Fri, 22 Dec 2023 15:22:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.659385.1028963 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGgPm-000610-0g; Fri, 22 Dec 2023 14:22:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 659385.1028963; Fri, 22 Dec 2023 14:22:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rGgPl-0005yu-U5; Fri, 22 Dec 2023 14:22:13 +0000
Received: by outflank-mailman (input) for mailman id 659385;
 Fri, 22 Dec 2023 14:22:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rGgPk-0005yo-9Z
 for xen-devel@lists.xenproject.org; Fri, 22 Dec 2023 14:22:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGgPe-0004SA-EB; Fri, 22 Dec 2023 14:22:06 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rGgPe-0008SH-5V; Fri, 22 Dec 2023 14:22:06 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=EoNyJO5vv2JraW6JPDVb1MQdUbdODi3+bIU/00VGu74=; b=GaPvPKqP9rip8T5bRzp/RAn8U0
	879Zp6jX4nASua9V7m8pvosBAvdMTeehuhaqN56r46GlGamx5x1yH+DJ9tSlqMDFpbXU6+5ZZ6ka8
	OP5b2ZsR6HHs1mANe1b0S1D5fy8Pziia+Zh4oJjtvEvmHSU7kdUMWBCM9pH1tWPlgO7c=;
Message-ID: <0f729b61-b839-48f6-89ae-b5570b1eae0b@xen.org>
Date: Fri, 22 Dec 2023 14:22:04 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 5/9] xen/asm-generic: introduce stub header numa.h
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>, Oleksii <oleksii.kurochko@gmail.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>,
 Shawn Anastasio <sanastasio@raptorengineering.com>,
 xen-devel@lists.xenproject.org
References: <cover.1703072575.git.oleksii.kurochko@gmail.com>
 <08bca9a4158a190a0a953e5bc071a512cfe5f0f8.1703072575.git.oleksii.kurochko@gmail.com>
 <341249d1-217f-4ad2-9455-b1aded4b9b56@xen.org>
 <03cf5145-2124-4150-9f20-904f08bcabda@suse.com>
 <9f8c4fe0a87742444b52a42aa5924cf046ee18b0.camel@gmail.com>
 <67bf2be7-53f4-40d0-a856-8ae631a054b0@suse.com>
 <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
In-Reply-To: <955e9b02-20bd-4279-9f60-bb757cdf1a03@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 22/12/2023 13:58, Julien Grall wrote:
> Hi Jan,
> 
> On 22/12/2023 13:20, Jan Beulich wrote:
>> On 22.12.2023 14:07, Oleksii wrote:
>>> On Fri, 2023-12-22 at 09:22 +0100, Jan Beulich wrote:
>>>> On 21.12.2023 20:09, Julien Grall wrote:
>>>>> On 20/12/2023 14:08, Oleksii Kurochko wrote:
>>>>>> <asm/numa.h> is common through some archs so it is moved
>>>>>> to asm-generic.
>>>>>>
>>>>>> Signed-off-by: Oleksii Kurochko <oleksii.kurochko@gmail.com>
>>>>>> Reviewed-by: Michal Orzel <michal.orzel@amd.com>
>>>>>> Acked-by: Jan Beulich <jbeulich@suse.com>
>>>>>> Acked-by: Shawn Anastasio <sanastasio@raptorengineering.com>
>>>>>
>>>>> I think this patch will need to be rebased on top of the lastest
>>>>> staging
>>>>> as this should clash with 51ffb3311895.
>>>>
>>>> No, and I'd like to withdraw my ack here. In this case a stub header
>>>> isn't
>>>> the right choice imo - the !NUMA case should be handled in common
>>>> code. I
>>>> would have submitted the patch I have, if only the first_valid_mfn
>>>> patch
>>>> hadn't been committed already (which I now need to re-base over).
>>> I haven't seen your patch yet (waiting for it), but I assume that
>>> <asm/numa.h> will still be necessary and remain the same across Arm,
>>> PPC, and RISC-V.
>>>
>>> What am I missing?
>>
>> asm/numa.h will be necessary for an arch only if it actually has a way
>> to have CONFIG_NUMA enabled. Below, for your reference, the patch in
>> the not-yet-rebased form. As you can see, Arm's (and PPC's) header goes
>> away. If and when they choose to support NUMA, they may need to regain
>> one; whether at that point we can sort how an asm-generic/ form of the
>> header might sensibly look like remains to be seen.
>>
>> Jan
>>
>> NUMA: no need for asm/numa.h when !NUMA
>>
>> There's no point in every architecture carrying the same stubs for the
>> case when NUMA isn't enabled (or even supported). Move all of that to
>> xen/numa.h; replace explicit uses of asm/numa.h in common code. Make
>> inclusion of asm/numa.h dependent upon NUMA=y.
>>
>> Address the TODO regarding first_valid_mfn by making the variable static
>> when NUMA=y, thus also addressing a Misrs C:2012 rule 8.4 concern. Drop
>> the not really applicable "implement NUMA support" comment - in a !NUMA
>> section this simply makes no sense.
> 
> I have to admit, I am not really thrill with the approach you have 
> taken. As I said before, I don't quite understand the problem of having 
> first_valid_mfn exposed in all the circumstances.
> 
> This is better than trying to do...
> 
>> --- unstable.orig/xen/common/page_alloc.c
>> +++ unstable/xen/common/page_alloc.c
>> @@ -140,7 +140,6 @@
>>   #include <xen/vm_event.h>
>>   #include <asm/flushtlb.h>
>> -#include <asm/numa.h>
>>   #include <asm/page.h>
>>   #include <public/sysctl.h>
>> @@ -256,10 +255,14 @@ static PAGE_LIST_HEAD(page_broken_list);
>>    * BOOT-TIME ALLOCATOR
>>    */
>> +#ifndef CONFIG_NUMA
>>   /*
>>    * first_valid_mfn is exported because it is use in ARM specific NUMA
>>    * helpers. See comment in arch/arm/include/asm/numa.h.
>>    */
>> +#else
>> +static
>> +#endif
> 
> ... this sort ugliness.

Just to add more thoughts. My main concern here is that we likely have 
other variables that may only be exposed for a given arch. I would 
rather not like if we start sprinkling the code with #ifdef CONFIG_XXX 
static #else.

If there is a desire for everyone to start reducing the scope of the 
variable. Then we should come up with a way to do what you did above on 
the same line rather than multiple one. Maybe:

STATIC_IF(CONFIG_NUMA) unsigned long first_valid_mfn.

Cheers,

-- 
Julien Grall

