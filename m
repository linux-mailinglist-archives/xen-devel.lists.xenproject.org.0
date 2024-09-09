Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4F97240B
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 22:59:58 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794880.1203900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snlU6-0004NY-ER; Mon, 09 Sep 2024 20:59:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794880.1203900; Mon, 09 Sep 2024 20:59:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snlU6-0004Kw-Am; Mon, 09 Sep 2024 20:59:42 +0000
Received: by outflank-mailman (input) for mailman id 794880;
 Mon, 09 Sep 2024 20:59:41 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snlU5-0004Kq-AD
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 20:59:41 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snlU3-0007Jk-2C; Mon, 09 Sep 2024 20:59:39 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snlU2-00020t-RJ; Mon, 09 Sep 2024 20:59:38 +0000
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
	bh=DNww8K9rZcAtrwfDjUqwpwQASEUPAgEfVtX3viHSPu4=; b=oEkmxii1G/lyfDe3wYFFCt4gWY
	t8YmATrxluqkBp275GvEmZJ3VYgN3on9eXJqH4KCTYB+4WNgAwvlvA9izeGpiqETxKNqB9nUIMUnf
	IQPZbwRTr6DZb55jCQJ6DFHXyfl7Zu6nJY+ZjVDRTe0WMVMk2mq5j3kqG8fsPq0k35MQ=;
Message-ID: <d3ebe193-4228-4fda-b7f8-0849c41ed999@xen.org>
Date: Mon, 9 Sep 2024 21:59:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] docs: fusa: Add Assumption of Use (AOU)
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Ayan Kumar Halder <ayankuma@amd.com>, Michal Orzel
 <michal.orzel@amd.com>, Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, Bertrand Marquis <bertrand.marquis@arm.com>,
 Artem Mygaiev <artem_mygaiev@epam.com>
References: <20240906101318.1419954-1-ayan.kumar.halder@amd.com>
 <57632c2f-82e6-49bb-b989-e75c95070b03@xen.org>
 <46b9567e-d27c-467b-b21d-65d63b6cd1e2@amd.com>
 <5de31172-8319-4cd3-9486-a6992a5cdc22@xen.org>
 <880e0578-c27b-45d3-8ed6-91ad648fa735@amd.com>
 <c308f03b-247d-4fd9-a9b4-f630d8a22bee@xen.org>
 <alpine.DEB.2.22.394.2409091252570.3672@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2409091252570.3672@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Stefano,

On 09/09/2024 20:53, Stefano Stabellini wrote:
> On Mon, 9 Sep 2024, Julien Grall wrote:
>> On 09/09/2024 10:50, Ayan Kumar Halder wrote:
>>> On 09/09/2024 10:11, Julien Grall wrote:
>>>>
>>>>
>>>> On 09/09/2024 09:56, Michal Orzel wrote:
>>>>> Hi Julien,
>>>>>
>>>>> On 08/09/2024 23:05, Julien Grall wrote:
>>>>>>
>>>>>>
>>>>>> Hi Ayan,
>>>>>>
>>>>>> On 06/09/2024 11:13, Ayan Kumar Halder wrote:
>>>>>>> From: Michal Orzel <michal.orzel@amd.com>
>>>>>>>
>>>>>>> AOU are the assumptions Xen relies on other components (eg platform,
>>>>>>> domains)
>>>>>>
>>>>>> Searching online, I think the abbrevition is AoU rather than AOU. This
>>>>>> would also match how we abbreviate in Xen (IOW if we use a lower case
>>>>>> letter from the expanded name, then the letter in the acronym is also
>>>>>> lower case).
>>>>>>
>>>>>>> to fulfill its requirements. In our case, platform means a
>>>>>>> combination of
>>>>>>> hardware, firmware and bootloader.
>>>>>>>
>>>>>>> We have defined AOU in the intro.rst and added AOU for the generic
>>>>>>> timer.
>>>>>>>
>>>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>>>> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
>>>>>>> ---
>>>>>>>     .../reqs/design-reqs/arm64/generic-timer.rst  | 19 +++++++++++++
>>>>>>> ++++++
>>>>>>>     docs/fusa/reqs/intro.rst                      | 10 ++++++++++
>>>>>>>     2 files changed, 29 insertions(+)
>>>>>>>
>>>>>>> diff --git a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst b/
>>>>>>> docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>> index f2a0cd7fb8..9df87cf4e0 100644
>>>>>>> --- a/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>> +++ b/docs/fusa/reqs/design-reqs/arm64/generic-timer.rst
>>>>>>> @@ -116,6 +116,25 @@ Rationale:
>>>>>>>
>>>>>>>     Comments:
>>>>>>>
>>>>>>> +Covers:
>>>>>>> + - `XenProd~emulated_timer~1`
>>>>>>> +
>>>>>>> +Assumption of Use on the Platform
>>>>>>> +=================================
>>>>>>> +
>>>>>>> +Expose system timer frequency via register
>>>>>>> +------------------------------------------
>>>>>>> +
>>>>>>> +`XenSwdgn~arm64_generic_timer_pf_program_cntfrq_el0~1`
>>>>>>> +
>>>>>>> +Description:
>>>>>>> +Underlying platform shall ensure that CNTFRQ_EL0 register contains
>>>>>>> the system
>>>>>>> +timer frequency.
>>>>>>
>>>>>> The wording in [1] (not yet merged) implies that CNTFRQ_EL0 may be
>>>>> It is merged:
>>>>> https://xenbits.xen.org/gitweb/?
>>>>> p=xen.git;a=commit;h=51ad2c57a2d21b583a5944a0dc21c709af022f3c
>>>>>
>>>>>> invalid. This seems to contradict the Assumption of Use. Can you
>>>>>> explain
>>>>>> the difference?
>>>>> The requirement you refer to is written from a domain perspective and is
>>>>> about Xen exposing the frequency
>>>>> to domains via CNTFRQ and/or dt property. In case of a presence of dt
>>>>> property in the host dtb, Xen could for instance decide
>>>>> to emulate CNTFRQ instead of relying on the domain to parse the dt at
>>>>> runtime.
>>>>
>>>> AFAICT, you can't trap CNTFRQ access. So what you suggest would not work.
>>>>
>>>>>
>>>>> The AoU on the platform (hw/firmware/bootloader) is written from Xen
>>>>> perspective and is about the platform
>>>>> exposing the correct frequency via register. This is Xen expected
>>>>> behavior on the platform. In other words, the platform should
>>>>> expose the correct frequency via register.
>>>>
>>>> Xen is able to deal with broken CNTFRQ_EL0.
>>> Yes, this is correct if the user provides "clock-frequency" dt property.
>>>> So I don't understand why we we would want to make an assumption that it
>>>> shall not be broken. What do you gain?
>>>
>>> Refer https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/
>>> linux.git/tree/Documentation/devicetree/bindings/timer/arm,arch_timer.yaml
>>>
>>> ```
>>>
>>> Use of this property is strongly discouraged; fix your firmware unless
>>> absolutely impossible.
>>>
>>> ```
>>>
>>> We wish to put the onus on the platform/firmware provider to program the
>>> register correctly. Otherwise, we will have to document it somewhere (may be
>>> safety manual) that User needs to provide the "clock-frequency" dt property.
>>
>> I think you will have to. The integrator may not have the possibility to
>> modify the firmware.
> 
> Without getting into the specifics of CNTFRQ_EL0 and clock-frequency,
> given that this is one of the first AoUs, let me clarify the spirit of
> the AoUs.
> 
> When we say that Xen is "safe" we mean that it went through thousands of
> tests so we are sure that in this specific configuration it is as
> bug-free as we can reasonably make it.
> 
> "in this specific configuration" is important. Changing the
> configuration might expand the scope or invalidate some of the tests.
> Think of moving from a board with GICv2 to GICv3 as an example (we are
> actually targeting GICv3 for safety, so this is not a great example,
> but just to explain the point.)
> 
> So the AoUs are the set of assumptions Xen has toward the rest of the
> system to make sure Xen operates "safely", with the word "safely"
> defined as above.
> 
> Of course, Xen could totally work on systems with different AoUs (see
> the GICv2 vs GICv3 example) but it would be outside the safety
> parameters. In a way, it is similar to "security supported": there are
> a bunch of Xen features that should work fine but are outside of
> "security support" for one reason or the other.
> 
> If a user wants to use Xen on a system that breaks one of the AoUs, they
> can, but we wouldn't promise it is "safe". For instance, imagine a user
> running Xen on a GICv3 system if the safe version of Xen only validated
> the GICv2 driver. Similarly to "security support", sometimes it is a bit
> of a judgement call and it could be argued either way.
> 
> In the specific case of CNTFRQ_EL0, if we think Xen can be "safe" on a
> system with a broken CNTFRQ_EL0 (thanks to the clock-frequency DT
> property or other mechanisms), then we can remove this from the AoU. We
> would probably have to have a different AoU about the presence of
> clock-frequency. Otherwise, if we think we cannot really promise that
> Xen is "safe" if CNTFRQ_EL0 is broken, then it is better to leave as is.
> 
> Keep in mind that users interested in safety, they are very likely to be
> interested in the safety-certification of the entire system, which
> includes the hardware as well. It is very likely that users will choose
> a safety-certified board, which I am guessing would have a working
> CNTFRQ_EL0. This is just a guess, I don't know the relationship between
> CNTFRQ_EL0 and achieving hardware safety certifications.

Thanks for your input. I am open with the idea to require CNTFRQ_EL0 to 
be valid. But I think we need some consistency across the safety docs.

In this case, I think it would be inconsistent to mention 
"clock-frequency" in the requirement.

Cheers,

-- 
Julien Grall

