Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D95A7F6225
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 15:58:03 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639775.997473 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6B9H-0001Pa-OA; Thu, 23 Nov 2023 14:57:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639775.997473; Thu, 23 Nov 2023 14:57:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r6B9H-0001MP-KB; Thu, 23 Nov 2023 14:57:47 +0000
Received: by outflank-mailman (input) for mailman id 639775;
 Thu, 23 Nov 2023 14:57:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r6B9F-0001MJ-Qh
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 14:57:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6B9C-0003xD-Mq; Thu, 23 Nov 2023 14:57:42 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.119]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r6B9C-00029Q-CZ; Thu, 23 Nov 2023 14:57:42 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=FDbqb8AizAaW/Ds6q8kPkMYSC5GdzYOmgJamcbamTjI=; b=rQ57aXEUU7IN5Uf5MpTcbG3Ox7
	gZOeuWzPGtFtjBoMX0/6ypubzXyRotuaRtI1iqi64Ipz3JWUMmV+6QTCV7eRamYO93ZHgkAc/tKmA
	g5CM72IrgLEqPO88LQXXew66Gt/j12tuxJiFt2dHS4KxmkjeijiY+vVjRhkTbA4Eost8=;
Message-ID: <b1d7fce9-d7fe-4c0e-a689-c28d2fac1ef0@xen.org>
Date: Thu, 23 Nov 2023 14:57:40 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-linus test] 183794: regressions - FAIL
Content-Language: en-GB
To: Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: osstest service owner <osstest-admin@xenproject.org>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>, oleksandr_tyshchenko@epam.com
References: <osstest-183794-mainreport@xen.org>
 <f7b11bb5-9d08-4678-bb97-3a2d96537439@suse.com>
 <alpine.DEB.2.22.394.2311201631140.773207@ubuntu-linux-20-04-desktop>
 <alpine.DEB.2.22.394.2311211823110.2053963@ubuntu-linux-20-04-desktop>
 <ff31f5a6-396e-48cc-8b1b-6941369c620b@suse.com>
 <alpine.DEB.2.22.394.2311221501340.2053963@ubuntu-linux-20-04-desktop>
 <fade29d2-2383-4f99-9735-6edebc66cd87@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <fade29d2-2383-4f99-9735-6edebc66cd87@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Juergen,

On 23/11/2023 05:57, Juergen Gross wrote:
> On 23.11.23 00:07, Stefano Stabellini wrote:
>> On Wed, 22 Nov 2023, Juergen Gross wrote:
>>> On 22.11.23 04:07, Stefano Stabellini wrote:
>>>> On Mon, 20 Nov 2023, Stefano Stabellini wrote:
>>>>> On Mon, 20 Nov 2023, Juergen Gross wrote:
>>>>>> On 20.11.23 03:21, osstest service owner wrote:
>>>>>>> flight 183794 linux-linus real [real]
>>>>>>> http://logs.test-lab.xenproject.org/osstest/logs/183794/
>>>>>>>
>>>>>>> Regressions :-(
>>>>>>>
>>>>>>> Tests which did not succeed and are blocking,
>>>>>>> including tests which could not be run:
>>>>>>>     test-arm64-arm64-examine      8 reboot                   fail 
>>>>>>> REGR.
>>>>>>> vs.
>>>>>>> 183766
>>>>>>
>>>>>> I'm seeing the following in the serial log:
>>>>>>
>>>>>> Nov 20 00:25:41.586712 [    0.567318] kernel BUG at
>>>>>> arch/arm64/xen/../../arm/xen/enlighten.c:164!
>>>>>> Nov 20 00:25:41.598711 [    0.574002] Internal error: Oops - BUG:
>>>>>> 00000000f2000800 [#1] PREEMPT SMP
>>>>>>
>>>>>> The related source code lines in the kernel are:
>>>>>>
>>>>>> ········err = HYPERVISOR_vcpu_op(VCPUOP_register_vcpu_info,
>>>>>> xen_vcpu_nr(cpu),
>>>>>> ································ &info);
>>>>>> ········BUG_ON(err);
>>>>>>
>>>>>> I suspect commit 20f3b8eafe0ba to be the culprit.
>>>>>>
>>>>>> Stefano, could you please have a look?
>>>>
>>>> The good news and bad news is that I cannot repro this neither with nor
>>>> without CONFIG_UNMAP_KERNEL_AT_EL0. I looked at commit 20f3b8eafe0ba 
>>>> but
>>>> I cannot see anything wrong with it. Looking at the register dump, 
>>>> from:
>>>>
>>>> x0 : fffffffffffffffa
>>>>
>>>> I am guessing the error was -ENXIO which is returned from 
>>>> map_guest_area
>>>> in Xen.
>>>>
>>>> Could it be that the struct is crossing a page boundary? Or that it is
>>>> not 64-bit aligned? Do we need to do something like the following?
>>>>
>>>> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
>>>> index 9afdc4c4a5dc..5326070c5dc0 100644
>>>> --- a/arch/arm/xen/enlighten.c
>>>> +++ b/arch/arm/xen/enlighten.c
>>>> @@ -484,7 +485,7 @@ static int __init xen_guest_init(void)
>>>>         * for secondary CPUs as they are brought up.
>>>>         * For uniformity we use VCPUOP_register_vcpu_info even on cpu0.
>>>>         */
>>>> -    xen_vcpu_info = alloc_percpu(struct vcpu_info);
>>>> +    xen_vcpu_info = __alloc_percpu(struct vcpu_info, PAGE_SIZE);
>>>>        if (xen_vcpu_info == NULL)
>>>>            return -ENOMEM;
>>>
>>> May I suggest to use a smaller alignment? What about:
>>>
>>> 1 << fls(sizeof(struct vcpu_info) - 1)
>>
>> See below
>>
>> ---
>> [PATCH] arm/xen: fix xen_vcpu_info allocation alignment

Stefano, are you going to submit the patch formally?

>>
>> xen_vcpu_info is a percpu area than needs to be mapped by Xen.
>> Currently, it could cross a page boundary resulting in Xen being unable
>> to map it:
>>
>> [    0.567318] kernel BUG at 
>> arch/arm64/xen/../../arm/xen/enlighten.c:164!
>> [    0.574002] Internal error: Oops - BUG: 00000000f2000800 [#1] 
>> PREEMPT SMP
>>
>> Fix the issue by using __alloc_percpu and requesting alignment for the
>> memory allocation.
>>
>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>

I am guessing we want to backport it. So should this contain a tag to 
indicate the intention?

>>
>> diff --git a/arch/arm/xen/enlighten.c b/arch/arm/xen/enlighten.c
>> index 9afdc4c4a5dc..09eb74a07dfc 100644
>> --- a/arch/arm/xen/enlighten.c
>> +++ b/arch/arm/xen/enlighten.c
>> @@ -484,7 +484,8 @@ static int __init xen_guest_init(void)
>>        * for secondary CPUs as they are brought up.
>>        * For uniformity we use VCPUOP_register_vcpu_info even on cpu0.
>>        */
>> -    xen_vcpu_info = alloc_percpu(struct vcpu_info);
>> +    xen_vcpu_info = __alloc_percpu(sizeof(struct vcpu_info),
>> +                                   1 << fls(sizeof(struct vcpu_info) 
>> - 1));
> 
> Nit: one tab less, please (can be fixed while committing).
> 
>>       if (xen_vcpu_info == NULL)
>>           return -ENOMEM;
> 
> Reviewed-by: Juergen Gross <jgross@suse.com>

Juergen, looking at the x86 code, you seem to use DEFINE_PER_CPU(). So 
what guarantees that this is not going to cross a page?

Cheers,

-- 
Julien Grall

