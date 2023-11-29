Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB3B7FE04F
	for <lists+xen-devel@lfdr.de>; Wed, 29 Nov 2023 20:27:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.644162.1004833 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QDU-0001VK-HX; Wed, 29 Nov 2023 19:27:24 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 644162.1004833; Wed, 29 Nov 2023 19:27:24 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r8QDU-0001TS-Ep; Wed, 29 Nov 2023 19:27:24 +0000
Received: by outflank-mailman (input) for mailman id 644162;
 Wed, 29 Nov 2023 19:27:23 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s3b2=HK=raptorengineering.com=sanastasio@srs-se1.protection.inumbo.net>)
 id 1r8QDT-0001TM-Bn
 for xen-devel@lists.xenproject.org; Wed, 29 Nov 2023 19:27:23 +0000
Received: from raptorengineering.com (mail.raptorengineering.com
 [23.155.224.40]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4f501734-8eed-11ee-9b0f-b553b5be7939;
 Wed, 29 Nov 2023 20:27:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 039B282859FC;
 Wed, 29 Nov 2023 13:27:18 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id 8oVBy4rkpq1p; Wed, 29 Nov 2023 13:27:17 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
 by mail.rptsys.com (Postfix) with ESMTP id 14B098285C21;
 Wed, 29 Nov 2023 13:27:17 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
 by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id tpOk4zqb3YbG; Wed, 29 Nov 2023 13:27:16 -0600 (CST)
Received: from [10.11.0.3] (5.edge.rptsys.com [23.155.224.38])
 by mail.rptsys.com (Postfix) with ESMTPSA id A194882859FC;
 Wed, 29 Nov 2023 13:27:16 -0600 (CST)
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
X-Inumbo-ID: 4f501734-8eed-11ee-9b0f-b553b5be7939
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 14B098285C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1701286037; bh=0UlIRHXiNdL2VBVsLzm8Afq4oPS3mvqs9lW9i4EketE=;
	h=Message-ID:Date:MIME-Version:To:From;
	b=mF1XWZZZhRi4TKnS3Nf7R9qxxJ6+U2lE7pAsgbZkS/briFyZAX2Ajvfj/vugXO4Bz
	 WtY0Jd+wav6mBg6JlvgzQ4aIQqHI2CjnX+NDWAt+TzskUCwHFkc4JxcgTxOMDwO28Z
	 rjUoHDBaPHgopA6j5BH15d7FcZUyVKmlQMfkW5Lw=
X-Virus-Scanned: amavisd-new at rptsys.com
Message-ID: <f666efdb-e274-4c66-aa66-4a1d83332edb@raptorengineering.com>
Date: Wed, 29 Nov 2023 13:27:16 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 10/14] xen/asm-generic: introduce stub header monitor.h
Content-Language: en-US
To: Oleksii <oleksii.kurochko@gmail.com>, xen-devel@lists.xenproject.org
Cc: Tamas K Lengyel <tamas@tklengyel.com>,
 Alexandru Isaila <aisaila@bitdefender.com>,
 Petre Pircalabu <ppircalabu@bitdefender.com>, Jan Beulich <jbeulich@suse.com>
References: <cover.1701093907.git.oleksii.kurochko@gmail.com>
 <83e16ccc588d35042b804e0d56ebdb5fe710695b.1701093907.git.oleksii.kurochko@gmail.com>
 <22ffed63-8f05-477f-b37c-c660410c2ce6@raptorengineering.com>
 <c1501f5f5e1047b06be1e41461b222711a4b4882.camel@gmail.com>
From: Shawn Anastasio <sanastasio@raptorengineering.com>
In-Reply-To: <c1501f5f5e1047b06be1e41461b222711a4b4882.camel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/29/23 6:39 AM, Oleksii wrote:
> Hi Shawn,
> 
> On Tue, 2023-11-28 at 16:21 -0600, Shawn Anastasio wrote:
>> Hi Oleksii,
>>
>> On 11/27/23 8:13 AM, Oleksii Kurochko wrote:
>>> diff --git a/xen/arch/ppc/include/asm/Makefile
>>> b/xen/arch/ppc/include/asm/Makefile
>>> index 319e90955b..bcddcc181a 100644
>>> --- a/xen/arch/ppc/include/asm/Makefile
>>> +++ b/xen/arch/ppc/include/asm/Makefile
>>> @@ -5,6 +5,7 @@ generic-y += div64.h
>>>  generic-y += hardirq.h
>>>  generic-y += hypercall.h
>>>  generic-y += iocap.h
>>> +generic-y += monitor.h
>>>  generic-y += paging.h
>>>  generic-y += percpu.h
>>>  generic-y += random.h
>>> diff --git a/xen/arch/ppc/include/asm/monitor.h
>>> b/xen/arch/ppc/include/asm/monitor.h
>>> deleted file mode 100644
>>> index e5b0282bf1..0000000000
>>> --- a/xen/arch/ppc/include/asm/monitor.h
>>> +++ /dev/null
>>> @@ -1,43 +0,0 @@
>>> -/* SPDX-License-Identifier: GPL-2.0-only */
>>> -/* Derived from xen/arch/arm/include/asm/monitor.h */
>>> -#ifndef __ASM_PPC_MONITOR_H__
>>> -#define __ASM_PPC_MONITOR_H__
>>> -
>>> -#include <public/domctl.h>
>>> -#include <xen/errno.h>
>>> -
>>> -static inline
>>> -void arch_monitor_allow_userspace(struct domain *d, bool
>>> allow_userspace)
>>> -{
>>> -}
>>> -
>>> -static inline
>>> -int arch_monitor_domctl_op(struct domain *d, struct
>>> xen_domctl_monitor_op *mop)
>>> -{
>>> -    /* No arch-specific monitor ops on PPC. */
>>> -    return -EOPNOTSUPP;
>>> -}
>>> -
>>> -int arch_monitor_domctl_event(struct domain *d,
>>> -                              struct xen_domctl_monitor_op *mop);
>>> -
>>> -static inline
>>> -int arch_monitor_init_domain(struct domain *d)
>>> -{
>>> -    /* No arch-specific domain initialization on PPC. */
>>> -    return 0;
>>> -}
>>> -
>>> -static inline
>>> -void arch_monitor_cleanup_domain(struct domain *d)
>>> -{
>>> -    /* No arch-specific domain cleanup on PPC. */
>>> -}
>>> -
>>> -static inline uint32_t arch_monitor_get_capabilities(struct domain
>>> *d)
>>> -{
>>> -    BUG_ON("unimplemented");
>>
>> I'm not sure how I feel about this assertion being dropped in the
>> generic header. In general my philosophy when creating these stub
>> headers was to insert as many of these assertions as possible so we
>> don't end up in a scenario where during early bringup I miss a
>> function
>> that was originally stubbed but ought to be implemented eventually.
>>
>> Looking at ARM's monitor.h too, it seems that this function is the
>> only
>> one that differs from the generic/stub version. I'm wondering if it
>> would make sense to leave this function out of the generic header, to
>> be
>> defined by the arch similar to what you've done with some other
>> functions in this series. That would also allow ARM to be brought in
>> to
>> using the generic variant.
> Thanks for the comment.
> 
> For RISC-V, I did in the same way ( about BUG() and unimplemented for
> time being functions ).
> 
> I agree that such implementation isn't correct for generic header. I
> think the best one solution will be to include <asm-generic/monitor.h>
> in <asm/monitor.h> whwere only this function will be implemented (
> because implementation of other functions are the same for Arm, PPC and
> RISC-V ).
>

That approach sounds great to me.

> ~ Oleksii

Thanks,
Shawn

