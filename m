Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A909B6030
	for <lists+xen-devel@lfdr.de>; Wed, 30 Oct 2024 11:32:44 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.828023.1242818 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6605-0006h7-8r; Wed, 30 Oct 2024 10:32:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 828023.1242818; Wed, 30 Oct 2024 10:32:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t6605-0006dz-5F; Wed, 30 Oct 2024 10:32:29 +0000
Received: by outflank-mailman (input) for mailman id 828023;
 Wed, 30 Oct 2024 10:32:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=z9hZ=R2=gmail.com=julien.grall.oss@srs-se1.protection.inumbo.net>)
 id 1t6603-0006dp-1m
 for xen-devel@lists.xenproject.org; Wed, 30 Oct 2024 10:32:27 +0000
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3f5d1166-96aa-11ef-99a3-01e77a169b0f;
 Wed, 30 Oct 2024 11:32:22 +0100 (CET)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4314f38d274so82329625e9.1
 for <xen-devel@lists.xenproject.org>; Wed, 30 Oct 2024 03:32:22 -0700 (PDT)
Received: from [10.24.67.19] ([15.248.2.239]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38058bb4461sm14918691f8f.113.2024.10.30.03.32.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Oct 2024 03:32:21 -0700 (PDT)
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
X-Inumbo-ID: 3f5d1166-96aa-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwOS44NS4xMjguNDIiLCJoZWxvIjoibWFpbC13bTEtZjQyLmdvb2dsZS5jb20ifQ==
X-Custom-Transaction: eyJpZCI6IjNmNWQxMTY2LTk2YWEtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMwMjg0MzQyLjU2Njg4Mywic2VuZGVyIjoianVsaWVuLmdyYWxsLm9zc0BnbWFpbC5jb20iLCJyZWNpcGllbnQiOiJ4ZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcifQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730284342; x=1730889142;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L33PnbqEyk+PVBpX3rxIMF4yyg9tRTkiD84adMMPIew=;
        b=kMABBaANuaPhMQBsX0V7NMir3F36eEWvogGZH19hL0zCoIeMZVln+I3aKxGKfljA8B
         uPVPDqIdLhvUQ5TvwHoCA3StSZjKMBLjKztYDCTJeNa/yDRoHMwYUa/CvIcaB6lMVqTO
         dNTGfbMJex6S1d5bnajrF0M1O6j3/T18ZeuuhpZGzfvOK4o7o+IRVSHLi5c38pYF6BKK
         3pip3Rz9Y0lHxTFaMIhfn1+DNnOz1B9g0u/ozQ3NdwzeZ7AtRyAWR25B3CILJtbEIX16
         maxYHDCd/q7qgz/Y6C9Nh3AIPt+jHhXO1Ol7sD0bisJDysbAJMI1/cLGroRyA5LNL278
         IwAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSYqG5+Bbk4pFPV+fG/jn+ZVYTS0moF1B+Nw1lJI+Px24HbtFRUl/cE2hxKzPH2/roLiCCoREZVZc=@lists.xenproject.org
X-Gm-Message-State: AOJu0YxBGjcFBLN4V1JNUn3qCKewECpEpCU7RDIxHJueUm4TAbpGC/KE
	sO6rU2ihIFV6Jh+znwqpqeDymyJu3v6jFBDd9cVUkxhlyZUMSZaT
X-Google-Smtp-Source: AGHT+IG2NLFfl4HCnpKZEDeWzsr001O6ZcoNmbbmuIw08DinBSKGJu5eklBriM0kUbU2EX6Z8FnAgw==
X-Received: by 2002:a05:600c:3b87:b0:431:59b2:f0c4 with SMTP id 5b1f17b1804b1-4319ac99158mr163563335e9.8.1730284341761;
        Wed, 30 Oct 2024 03:32:21 -0700 (PDT)
Message-ID: <8ee005f3-baf7-408a-b084-833475ced50d@xen.org>
Date: Wed, 30 Oct 2024 10:32:20 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julien Grall <julien@xen.org>
Subject: Re: [PATCH v4 4/6] xen/arm: mpu: Create boot-time MPU protection
 regions
To: Luca Fancellu <Luca.Fancellu@arm.com>,
 Julien Grall <julien.grall.oss@gmail.com>
Cc: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20241028124547.1371867-1-ayan.kumar.halder@amd.com>
 <20241028124547.1371867-5-ayan.kumar.halder@amd.com>
 <FE41FD6C-EBCE-4EDA-ADD4-E09A58773763@arm.com>
 <CAJ=z9a1d2vzXh-fK5E2z-k4SOjE0cjJUGfFnaJiobvQpS+Y5Rw@mail.gmail.com>
 <3963FE44-9ED1-4462-BD42-DA1B1A5040C5@arm.com>
Content-Language: en-GB
In-Reply-To: <3963FE44-9ED1-4462-BD42-DA1B1A5040C5@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 30/10/2024 10:08, Luca Fancellu wrote:
> Hi Julien,
> 
>> On 30 Oct 2024, at 09:52, Julien Grall <julien.grall.oss@gmail.com> wrote:
>>
>> On Wed, 30 Oct 2024 at 09:17, Luca Fancellu <Luca.Fancellu@arm.com> wrote:
>>>
>>> Hi Ayan,
>>>
>>> While I rebased the branch on top of your patches, I saw you’ve changed the number of regions
>>> mapped at boot time, can I ask why?
>>
>> I have asked the change. If you look at the layout...
> 
> Apologies, I didn’t see you’ve asked the change

No need to apologies! I think I asked a few revisions ago.

> 
>>
>>>
>>> Compared to https://patchwork.kernel.org/project/xen-devel/patch/20230626033443.2943270-25-Penny.Zheng@arm.com/:
>>
>>
>> ... you have two sections with the same permissions:
>>
>> xen_mpumap[1] : Xen read-only data
>> xen_mpumap[2] : Xen read-only after init data
>> xen_mpumap[3] : Xen read-write data
>>
>> During boot, [2] and [3] will share the same permissions. After boot,
>> this will be [1] and [2]. Given the number of MPU regions is limited,
>> this is a bit of a waste.
>>
>> We also don't want to have a hole in the middle of Xen sections. So
>> folding seemed to be a good idea.
>>
>>>
>>>> +FUNC(enable_boot_cpu_mm)
>>>> +
>>>> +    /* Get the number of regions specified in MPUIR_EL2 */
>>>> +    mrs   x5, MPUIR_EL2
>>>> +
>>>> +    /* x0: region sel */
>>>> +    mov   x0, xzr
>>>> +    /* Xen text section. */
>>>> +    ldr   x1, =_stext
>>>> +    ldr   x2, =_etext
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_TEXT_PRBAR
>>>> +
>>>> +    /* Xen read-only data section. */
>>>> +    ldr   x1, =_srodata
>>>> +    ldr   x2, =_erodata
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5, attr_prbar=REGION_RO_PRBAR
>>>> +
>>>> +    /* Xen read-only after init and data section. (RW data) */
>>>> +    ldr   x1, =__ro_after_init_start
>>>> +    ldr   x2, =__init_begin
>>>> +    prepare_xen_region x0, x1, x2, x3, x4, x5
>>>
>>>          ^— this, for example, will block Xen to call init_done(void) later, I understand this is earlyboot,
>>>                but I guess we don’t want to make subsequent changes to this part when introducing the
>>>                patches to support start_xen()
>>
>> Can you be a bit more descriptive... What will block?
> 
> This call in setup.c:
>      rc = modify_xen_mappings((unsigned long)&__ro_after_init_start,
>                               (unsigned long)&__ro_after_init_end,
>                               PAGE_HYPERVISOR_RO);
> 
> Cannot work anymore because xen_mpumap[2] is wider than only (__ro_after_init_start, __ro_after_init_end).

Is this because the implementation of modify_xen_mappings() is only able 
to modify a full region? IOW, it would not be able to split regions 
and/or merge them?

> 
> If that is what we want, then we could wrap the above call into something MMU specific that will execute the above call and
> something MPU specific that will modify xen_mpumap[1] from (_srodata, _erodata) to (_srodata, __ro_after_init_end)
> and xen_mpumap[2] from (__ro_after_init_start, __init_begin) to (__ro_after_init_end, __init_begin).

I think it would make sense to have the call mmu/mpu specific. This 
would allow to limit the number of MPU regions used by Xen itself.

The only problem is IIRC the region is not fixed because we will skip 
empty regions during earlyboot.

Cheers,

-- 
Julien Grall


