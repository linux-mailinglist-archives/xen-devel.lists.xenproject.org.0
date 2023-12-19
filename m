Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C3362818FDE
	for <lists+xen-devel@lfdr.de>; Tue, 19 Dec 2023 19:39:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.657090.1025773 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFf0G-0003tP-Er; Tue, 19 Dec 2023 18:39:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 657090.1025773; Tue, 19 Dec 2023 18:39:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rFf0G-0003rB-C9; Tue, 19 Dec 2023 18:39:40 +0000
Received: by outflank-mailman (input) for mailman id 657090;
 Tue, 19 Dec 2023 18:39:39 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rFf0F-0003po-5c
 for xen-devel@lists.xenproject.org; Tue, 19 Dec 2023 18:39:39 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFf0E-00009h-MK; Tue, 19 Dec 2023 18:39:38 +0000
Received: from 54-240-197-227.amazon.com ([54.240.197.227]
 helo=[192.168.3.234]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rFf0E-0002C0-GL; Tue, 19 Dec 2023 18:39:38 +0000
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
	bh=Ksz/ketnprKdw4UGq9ZBWd7cTMfB8j14aqTnUmBh6IY=; b=BnEH/ThZz4qch8n3om0u/ZiCOu
	DEgT08LxR3NreNLOvBsrxt7q+iq6mvP0AkLnyOdZOIPirjf91NmIisbY28lvxpOeKjb1YOhglS8yo
	4d12icDmbEZZ39VkRZJ4oLLAo/SGhIJ/OGH7TBlqCpUH6rwbrDokZNCcjN69z5CuL0iM=;
Message-ID: <ce925557-a030-44a2-b991-661d6f64d05e@xen.org>
Date: Tue, 19 Dec 2023 18:39:36 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs/misra/rules.rst: add Rule 17.1
Content-Language: en-GB
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com,
 jbeulich@suse.com, george.dunlap@citrix.com, bertrand.marquis@arm.com,
 roger.pau@citrix.com, roberto.bagnara@bugseng.com,
 federico.serafini@bugseng.com
References: <alpine.DEB.2.22.394.2312081738100.1703076@ubuntu-linux-20-04-desktop>
 <d7b880b2-10ec-4c3d-bf12-1c29995857d6@xen.org>
 <alpine.DEB.2.22.394.2312151251450.3175268@ubuntu-linux-20-04-desktop>
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2312151251450.3175268@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 15/12/2023 21:02, Stefano Stabellini wrote:
> On Fri, 15 Dec 2023, Julien Grall wrote:
>> Hi Stefano,
>>
>> On 09/12/2023 01:39, Stefano Stabellini wrote:
>>>
>>> Signed-off-by: Stefano Stabellini <stefano.stabellini@amd.com>
>>> ---
>>> Changes in v2:
>>> - separated 17.1 in its own patch
>>> - add a comment
>>>
>>> diff --git a/docs/misra/rules.rst b/docs/misra/rules.rst
>>> index 8a659d8d47..f29b4c3d9a 100644
>>> --- a/docs/misra/rules.rst
>>> +++ b/docs/misra/rules.rst
>>> @@ -189,6 +189,12 @@ existing codebase are work-in-progress.
>>>         - A switch-expression shall not have essentially Boolean type
>>>         -
>>>    +   * - `Rule 17.1
>>> <https://gitlab.com/MISRA/MISRA-C/MISRA-C-2012/Example-Suite/-/blob/master/R_17_01.c>`_
>>> +     - Required
>>> +     - The features of <stdarg.h> shall not be used
>>> +     - It is understood that in some limited circumstances <stdarg.h> is
>>> +       appropriate to use, such as the implementation of printk.
>>
>> The last bullet point is unclear to me. You don't define what "appropriate"
>> means here. So who is going to decide? Also, how is this going to be deviated?
>>
>> Possibly the solution here is to remove the last bullet point and have a
>> paragraph in deviations.rst explaining why we are using va_args.
> 
> Actually, I agree with you. I added the last bullet to address Jan's
> concern:
> https://marc.info/?l=xen-devel&m=170191695511513
> https://marc.info/?l=xen-devel&m=170193528120968
> 
> This was my original reply:
> 
> "We agreed that in certain situations stdarg.h is OK to use and in those
> cases we would add a deviation. Would you like me to add something to
> that effect here? I could do that but it would sound a bit vague.  Also
> if we want to specify a project-wide deviation it would be better
> documented in docs/misra/deviations.rst. I would leave Rule 17.1 without
> a note."
> 
> My preference is still to remove the last bullet (because too generic)
> and add any specific information to deviations.rst as usual.
> 
> Julien, would you be OK with this patch if I remove the last bullet and
> leave it blank?

I would be fine with that:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

