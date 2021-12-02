Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA0246601E
	for <lists+xen-devel@lfdr.de>; Thu,  2 Dec 2021 10:06:45 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.236392.410056 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msi2a-0002gX-RY; Thu, 02 Dec 2021 09:06:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 236392.410056; Thu, 02 Dec 2021 09:06:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1msi2a-0002e8-OX; Thu, 02 Dec 2021 09:06:08 +0000
Received: by outflank-mailman (input) for mailman id 236392;
 Thu, 02 Dec 2021 09:06:07 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1msi2Z-0002e0-Ao
 for xen-devel@lists.xenproject.org; Thu, 02 Dec 2021 09:06:07 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msi2T-0005YX-Nn; Thu, 02 Dec 2021 09:06:01 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1msi2T-0005KT-HW; Thu, 02 Dec 2021 09:06:01 +0000
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
	bh=lDwEy1J6TG2cq2JQtW2mU4oOXVGl8ltMAdLmt8+meng=; b=JahmZwbw8Q6e499FYnDitG2adR
	0c4kAlMxBl5loPsAhjAI30+j9o4RnzmFRIUQfhUQhGviF7ym6QGLNsvUyQ2Ek10b76dJ3Q0PND5be
	OSG2enA/kJYwg9YgqoUGfwR4d8u/8eDOKrFurUmgqYZn/BxGircA14RSnn//AKxgVWm0=;
Message-ID: <acb3dd21-688e-4ad5-2e30-7e505a8e2945@xen.org>
Date: Thu, 2 Dec 2021 09:05:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH v2] bitops: Fix incorrect value in comment
To: Andrew Cooper <amc96@srcf.net>, Jan Beulich <jbeulich@suse.com>
Cc: sstabellini@kernel.org, stefanos@xilinx.com, Volodymyr_Babchuk@epam.com,
 bertrand.marquis@arm.com, Ayan Kumar Halder <ayankuma@xilinx.com>,
 andre.przywara@arm.com, Ayan Kumar Halder <ayan.kumar.halder@xilinx.com>,
 xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>
References: <20211130181238.5501-1-ayankuma@xilinx.com>
 <c018e9dc-5221-a7e8-3da9-ebdb2c88311b@xen.org>
 <3caf216e-95dd-97e1-b380-a31f5388dc86@suse.com>
 <959d50ef-2a4c-8850-4a89-7eff0b649a13@xen.org>
 <77a6b9b4-8117-e818-e68e-af37eeec2dd7@srcf.net>
From: Julien Grall <julien@xen.org>
In-Reply-To: <77a6b9b4-8117-e818-e68e-af37eeec2dd7@srcf.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 01/12/2021 21:38, Andrew Cooper wrote:
> On 01/12/2021 09:56, Julien Grall wrote:
>> Hi,
>>
>> On 01/12/2021 09:38, Jan Beulich wrote:
>>> On 01.12.2021 10:33, Julien Grall wrote:
>>>> On 30/11/2021 18:12, Ayan Kumar Halder wrote:
>>>>> --- a/xen/include/xen/bitops.h
>>>>> +++ b/xen/include/xen/bitops.h
>>>>> @@ -5,7 +5,7 @@
>>>>>     /*
>>>>>      * Create a contiguous bitmask starting at bit position @l and
>>>>> ending at
>>>>>      * position @h. For example
>>>>> - * GENMASK(30, 21) gives us the 32bit vector 0x01fe00000.
>>>>> + * GENMASK(30, 21) gives us the 32bit value 0x7fe00000.
>>>>
>>>> ... there are two extra changes here:
>>>>      1) The bitmask is now described with 8-characters (rather than 9)
>>>>      2) 'vector' is replaced with 'value'
>>>>
>>>> The former makes sense to me, but it is not clear to me why the latter
>>>> should be changed.
>>>
>>> Would you mind explaining to me in which way you see "vector" accurately
>>> describe the entity talked about?
>>
>> This can be seen as a vector of bit. I can see why people may think
>> otherwise. However... if you think it doesn't describe it accurately,
>> then I think this ought to be changed in Linux first (where the code
>> and comment comes from).
>>
>>>
>>> I also think the commit message is quite fine as is.
>> IMHO, this is similar to when one do coding style change in a patch.
>> They are unrelated but would be acceptable so long they are explained
>> in the commit message.
>>
>> What I request is something like:
>>
>> "GENMASK(30, 21) should be 0x7fe00000 and only use 8-characters (it is
>> a 32-bit comment). Fixed this in the comment.
>>
>> Take the opportunity to replace 'vector' with 'value' because..."
>>
>> This is simple enough and clarify what is the intent of the patch.
> 
> This is an unreasonable quantity of bikeshedding. 

I didn't realize that two emails were considered bikeshedding.
I actually provided and worked towards a solution rather than
unhelpfully saying just no.

> It's just a comment,
> and a commit message of "fix the comment" is perfectly fine.
> Furthermore, the intent of the text is clear.
> 
> However, "32bit $WHATEVER" is also wrong because GENMASK() yields a
> unsigned long constant.  Importantly, not 32 bits in an ARM64 build.
> 
> 
> This trivial patch has lingered far too long.  I have committed it,
> along with an adjustment.  Further bikeshedding will be redirected to
> /dev/null.

It is an interesting approach. I could have committed this patch
after updating the commit message like you did ;).

But, so far, I have refrained from blatantly ignoring comments and going
ahead with committing ([1] is an example where this could be used)
because I think we should try to have a consensus first.

Anyway, I am happy to accept that two maintainers have an opposite view 
from me and go with the tide. That said, there are probably better a way 
to express your view...

Cheers,

[1] 
https://lore.kernel.org/xen-devel/062bcbd3-420e-e1c0-3aa0-0dfb229e6ae9@suse.com/

-- 
Julien Grall

