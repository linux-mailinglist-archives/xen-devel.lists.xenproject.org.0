Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 785B677BA8D
	for <lists+xen-devel@lfdr.de>; Mon, 14 Aug 2023 15:48:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.583675.913948 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXux-0004ZW-4W; Mon, 14 Aug 2023 13:47:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 583675.913948; Mon, 14 Aug 2023 13:47:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qVXux-0004Wg-17; Mon, 14 Aug 2023 13:47:35 +0000
Received: by outflank-mailman (input) for mailman id 583675;
 Mon, 14 Aug 2023 13:47:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qVXuv-0004WX-5u
 for xen-devel@lists.xenproject.org; Mon, 14 Aug 2023 13:47:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVXus-0007sD-64; Mon, 14 Aug 2023 13:47:30 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qVXur-0007XP-VO; Mon, 14 Aug 2023 13:47:30 +0000
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
	bh=zjdb59kUcV36lCaLzJvsjPdpRcwFKCMLakxSOQb8Y4A=; b=OJkjI8n0pFRDOLpMvfGbQj2nlo
	DxoAhKQruNnNmQ5ZKAMmnfAnoaSk8uBQw1cYYjoTKzQS2/2lUqxFq2TCZg1Vn6WRbkbYsf2txaW1K
	/Q/1aZJF3muI2yuOaxqsg8CFg3u34fqyI8JyJSVFirG6PIUbOQ3CoyffSEoMMxkuj1io=;
Message-ID: <29adc671-0706-46f6-9949-2107ef41257b@xen.org>
Date: Mon, 14 Aug 2023 14:47:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH 3/6] x86/vm_event: add missing include
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, michal.orzel@amd.com, xenia.ragiadakou@amd.com,
 ayan.kumar.halder@amd.com, consulting@bugseng.com,
 xen-devel@lists.xenproject.org, tamas@tklengyel.com,
 aisaila@bitdefender.com, ppircalabu@bitdefender.com,
 Nicola Vetrini <nicola.vetrini@bugseng.com>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com>
 <f303a1782aeb67186c3181e01a51153fdce70cfb.1691676251.git.nicola.vetrini@bugseng.com>
 <30d1ef98-d847-b0ca-6771-4bc0abcdb214@suse.com>
 <808999f0142825bebfdbe16a309d529f@bugseng.com>
 <935367a1-7fc1-4df6-901a-e25e983aeed6@xen.org>
 <87c7a0fa02066c65e5e80830d6868014@bugseng.com>
 <5dda39e3-14f8-487d-a2df-0bf6734bd192@xen.org>
 <0ae77fda-379a-09ef-0aa5-83568b9eff6f@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <0ae77fda-379a-09ef-0aa5-83568b9eff6f@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 14/08/2023 14:31, Jan Beulich wrote:
> On 14.08.2023 15:06, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 14/08/2023 13:53, Nicola Vetrini wrote:
>>> On 14/08/2023 13:01, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 14/08/2023 11:33, Nicola Vetrini wrote:
>>>>> On 14/08/2023 09:39, Jan Beulich wrote:
>>>>>> On 11.08.2023 09:19, Nicola Vetrini wrote:
>>>>>>> The missing header included by this patch provides declarations for
>>>>>>> the functions
>>>>>>> 'vm_event_{fill_regs,set_registers,monitor_next_interrupt}'
>>>>>>> that are defined in the source file. This also resolves violations
>>>>>>> of MISRA C:2012 Rule 8.4.
>>>>>>>
>>>>>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>>>>>> Fixes: adc75eba8b15 ("x86/vm_event: consolidate hvm_event_fill_regs
>>>>>>> and p2m_vm_event_fill_regs")
>>>>>>> Fixes: 975efd3baa8d ("introduce VM_EVENT_FLAG_SET_REGISTERS")
>>>>>>> Fixes: 9864841914c2 ("x86/vm_event: add support for
>>>>>>> VM_EVENT_REASON_INTERRUPT")
>>>>>>
>>>>>> It's hard to see how it can be three commit here. The oldest one is at
>>>>>> fault, I would say.
>>>>>
>>>>> Since the patch is concerned with more than one function then in a
>>>>> sense I agree
>>>>> with you (the headers should have been included in the proper way the
>>>>> first time around), but
>>>>> then more definitions have been added by adc75eba8b15 and
>>>>> 9864841914c2, and these should have
>>>>> triggered a refactoring too. I can leave just 975efd3baa8d in the
>>>>> Fixes if the preferred way is to list just the first problematic
>>>>> commit (perhaps with a little explanation after --- ).
>>>>
>>>> To be honest, I don't exactly see the value of using Fixes tag for
>>>> those patches. I agree they are technically issues, but they are
>>>> unlikely going to be backported.
>>>>
>>>> So if it were me, I would just drop all the Fixes tags for missing
>>>> includes unless there is an actual bug associated
>>>> with them (e.g. a caller was miscalling the function because the
>>>> prototype was incorrect).
>>>>
>>>> Cheers,
>>>
>>> Adding those tags for this kind of situation was requested on the
>>> previous discussion [1],
>>> so in this series I kept the same strategy (though probably here I put
>>> too many of them).
>>
>> I disagree with the suggestion made. They are just noise for this sort
>> of patch and require extra digging (I assume you spent 10-15min to
>> figure out the multiple fixes) for a limited benefits (I don't expect
>> anyone to backport the patches).
> 
> While I agree that Fixes: is primarily for marking of backporting
> candidates, I don't think this is its exclusive purpose. As far as I'm
> concerned, it also aids review in the specific cases here (this isn't
> a commonly occurring aspect, though, I agree). Yet the primary reason
> I asked for them to be added is because each of the omissions is an
> at least latent bug.

I agree they are latent bugs. But the question is whether the time 
looking up the histoy is well spent?

In this situation, we have a lot of of similar patches where we need to 
add Fixes. So there is quite a bit of time sinked into finding the 
original commit message. Is it valuable? I don't believe so.

A least for Arm, I would not require the tag to be added for any missing 
prototypes.

Cheers,

-- 
Julien Grall

