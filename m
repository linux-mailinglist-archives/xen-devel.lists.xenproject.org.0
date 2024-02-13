Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD80852DCC
	for <lists+xen-devel@lfdr.de>; Tue, 13 Feb 2024 11:24:19 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.679832.1057542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZpwY-00035d-UU; Tue, 13 Feb 2024 10:23:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 679832.1057542; Tue, 13 Feb 2024 10:23:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rZpwY-00033k-RD; Tue, 13 Feb 2024 10:23:14 +0000
Received: by outflank-mailman (input) for mailman id 679832;
 Tue, 13 Feb 2024 10:23:13 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rZpwX-00033e-Mm
 for xen-devel@lists.xenproject.org; Tue, 13 Feb 2024 10:23:13 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZpwS-000441-Dx; Tue, 13 Feb 2024 10:23:08 +0000
Received: from [15.248.2.25] (helo=[10.24.67.29])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rZpwS-0004Ug-56; Tue, 13 Feb 2024 10:23:08 +0000
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
	bh=M1qRgO2FVblnULgmMiZEVD2wNb+nBPTJELbkpwcrLc8=; b=z7ry7R40n5ijqKaUbAzU+cxCPH
	Be7RkjDbOj9ZEfTYmQGuxkVPXB+qLogh9cBZhxzLR2RUyFhd5GUpxDZ8vNR6WFGHqMf5S4wJDF3va
	EzBK7WLI2Hid8NDUv8DoGXucKrEGaP2KWAhwcgi63pcJFzsu8BravS4Zl/tTTjejL+No=;
Message-ID: <19e6204f-9adc-47ef-92ca-e7f941035ca6@xen.org>
Date: Tue, 13 Feb 2024 10:23:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] docs/misra: add asm-offset.c to exclude-list
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: Jan Beulich <jbeulich@suse.com>, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, andrew.cooper3@citrix.com, roger.pau@citrix.com,
 bertrand.marquis@arm.com, George Dunlap <george.dunlap@citrix.com>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <09b659e19bf2cc6b3ee4320e019bdfa7def5f3b8.1707406598.git.nicola.vetrini@bugseng.com>
 <891e8cc2-e073-4cd3-9998-4c01ae775a3b@suse.com>
 <8977390f-9549-40d5-bfdc-5c3da81521fc@xen.org>
 <efc0eee4-9903-4228-b33e-cb50d4c545ee@suse.com>
 <5cdae9ce-d2ff-40bd-bc07-aa1965275833@xen.org>
 <f6c91540dbb5a83d3172bb65b6d4ca4b@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f6c91540dbb5a83d3172bb65b6d4ca4b@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Nicola,

On 09/02/2024 13:20, Nicola Vetrini wrote:
> On 2024-02-09 13:17, Julien Grall wrote:
>> Hi Jan,
>>
>> On 09/02/2024 11:46, Jan Beulich wrote:
>>> On 09.02.2024 10:40, Julien Grall wrote:
>>>> Replying on the v2 as well.
>>>
>>> And answering here despite the respective question was raised on the
>>> v1 thread: I'm certainly okay with the more detailed commit message.
>>
>> Ah yes. Sorry, I replied to v1 first and then realized it may have 
>> been easier to comment on v2.
>>
>>> A few nits, though:
>>>
>>>> On 08/02/2024 15:56, Jan Beulich wrote:
>>>>> On 08.02.2024 16:50, Nicola Vetrini wrote:
>>>>>> These files contain several deliberate violations of MISRA C rules 
>>>>>> and
>>>>>> they are not linked in the final Xen binary, therefore they can be 
>>>>>> exempted
>>>>>> from MISRA compliance.
>>>>
>>>> I'd like the commit message to be expanded a little bit to explain 
>>>> which
>>>> MISRA rules are a problem. This helped me to understand why we excluded
>>>> rather than fixed.
>>>>
>>>> Base on the previous discussion, I would suggest:
>>>>
>>>> These files contain several deliberate violation of MISRA C rules 
>>>> such as:
>>>
>>> violations
>>>
>>>>     * R20.12 on Arm for macros DEFINE and OFFSET, where the second
>>>> argument of OFFSET is a macro and is used as a normal parameter and a
>>>> stringification operand.
>>>
>>> Is this really for Arm only?
>>
>> I don't exactly know. I took Nicola's comment and massage it for the 
>> commit message. I am assuming that this was also not exhaustive list, 
>> so my aim was to only provide some example.
>>
> 
> Yes, indeed. I mentioned the first two examples that I remembered.
> 
>> Thinking of it, I don't see why it would only be a problem on Arm. I 
>> can drop the "on Arm".
>>
> 
> My bad, I missed it in the output. Please drop the "on Arm" part.
> 
>>>
>>>>     * R2.1 because the file is not linked That said it was decided to
>>>> deviate the rule itselfed to deviate that aspect).
>>>
>>> There look to be punctuation issues here. Also s/itselfed/itself/, and
>>> the duplicate "deviate" is also a little odd to read (maybe "deal with"
>>> or "address" in place of the 2nd instance).
>>
>> Doh, indeed. This wants to be:
>>
>> "R2.1 because the file is not linked. That said, it was decided to 
>> deviate the ruule itself to address that aspect."
>          ^ rule
>>>> The files are also not linked in the final Xen binary, therefore they
>>>> can be expempted from MISRA compliance.
>>>
>>> Looks to duplicate what the latter half of the 2nd bullet point has.
>>> If to be kept: s/expempted/exempted/.
>>
>> I will remove.
>>
>>>
>>>>>> --- a/docs/misra/exclude-list.json
>>>>>> +++ b/docs/misra/exclude-list.json
>>>>>> @@ -101,6 +101,10 @@
>>>>>>                "rel_path": "arch/x86/efi/check.c",
>>>>>>                "comment": "The resulting code is not included in 
>>>>>> the final Xen binary, ignore for now"
>>>>>>            },
>>>>>> +        {
>>>>>> +          "rel_path": "arch/*/*/asm-offsets.c",
>>>>>> +          "comment": "The resulting code is not included in the 
>>>>>> final Xen binary, ignore for now"
>>>>>> +        },
>>>>>>            {
>>>>>>                "rel_path": "common/coverage/*",
>>>>>>                "comment": "Files to support gcov, ignore for now"
>>>>>
>>>>> ... something looks odd with indentation; can probably be adjusted
>>>>> while committing.
>>>>
>>>> I am happy to take care of both the commit message and the indentation
>>>> on commit.
>>>
>>> Okay, I'll leave that to you then.
>>
>> Thanks. I will do it shortly.
> 
> Thanks,

I have committed the patch now.

Cheers,

-- 
Julien Grall

