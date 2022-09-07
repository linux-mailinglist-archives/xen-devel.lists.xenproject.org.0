Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CE485B0605
	for <lists+xen-devel@lfdr.de>; Wed,  7 Sep 2022 16:05:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.401837.643784 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvfF-0004W4-8A; Wed, 07 Sep 2022 14:04:25 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 401837.643784; Wed, 07 Sep 2022 14:04:25 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVvfF-0004Ts-5H; Wed, 07 Sep 2022 14:04:25 +0000
Received: by outflank-mailman (input) for mailman id 401837;
 Wed, 07 Sep 2022 14:04:23 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVvfD-0004Tm-Ll
 for xen-devel@lists.xenproject.org; Wed, 07 Sep 2022 14:04:23 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvfD-00079n-9B; Wed, 07 Sep 2022 14:04:23 +0000
Received: from 54-240-197-233.amazon.com ([54.240.197.233]
 helo=[192.168.17.46]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVvfD-0005J5-0Q; Wed, 07 Sep 2022 14:04:23 +0000
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
	bh=nxkRo1vel5WQZoR9U0o5JU1tt69PxQWaxWXCFuA+Kzc=; b=g3sZBOc4J5MLBep7tZ7IIodsxv
	cjOpQmT3OjuUn5+jzKemAK6N7YgZCGBpX1ykvXAJUpN/DOc68S4ZFNxsrAk5h2FrLWw+qerImaicx
	1wOHjzIV5iT4/UDAoV+aqEABh1pJbElGiLKI3UXygh5eSoZd4abxq2NSdRVXDGcGdEoo=;
Message-ID: <39862a75-ed08-1289-0a0d-a2580f27fdf1@xen.org>
Date: Wed, 7 Sep 2022 15:04:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v3 2/4] docs, xen/arm: Introduce static heap memory
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Chen <Wei.Chen@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Penny Zheng <Penny.Zheng@arm.com>
References: <20220907083643.20152-1-Henry.Wang@arm.com>
 <20220907083643.20152-3-Henry.Wang@arm.com>
 <968529ba-3a9d-0812-1a5f-430d467e827f@xen.org>
 <9a66b6df-bc37-d836-8175-3b98be07c696@amd.com>
 <e5e9a62d-6072-463e-6c4c-8d94aa29589b@xen.org>
 <a29a07fd-40ad-602f-9a79-a36783ada947@amd.com>
 <e8bf68b1-0217-c8cd-4864-ea7fe415fb0a@xen.org>
 <b0b85a1c-ff00-ea06-a960-e49799d507eb@amd.com>
 <ED046919-0B75-48C6-900F-44F3295553B7@arm.com>
 <7997786c-78ff-47df-12de-d1fe38e5624d@amd.com>
 <4B69D9F9-04AC-4042-AF74-F51630816208@arm.com>
 <eed26206-9684-4010-278c-14ed3602582b@amd.com>
 <759E29A4-AADA-4678-A88B-E96C5C15A462@arm.com>
 <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB79916A5189182179F6BEB29192419@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Henry,

On 07/09/2022 14:49, Henry Wang wrote:
>> -----Original Message-----
>> From: Bertrand Marquis <Bertrand.Marquis@arm.com>
>>>>>> But in any case we should only add one pair here for sure, as you say
>> the
>>>>>> only implication is to add a couple of 0 in the worst case.
>>>>> I agree. The only drawback is the need to modify the already introduced
>> properties
>>>>> to be coherent.
>>>>
>>>> Agree, someone will need to do a pass on the whole doc which might be
>> easier with all things in.
>>>>
>>> Well, not only docs. If we decide to use a single pair of #address-cells and
>> #size-cells, then
>>> we need to modify the code that expects different properties e.g.
>> xen,static-mem-{address/size}-cells.
>>
>> Right I forgot that some parts are already in.
>> So we will need an extra patch to handle those.
> 
> I think I've addressed all comments from Julien regarding my series,

If it is not too late for you would you be able to resend your series 
without the 'address-cells'/'size-cells' change? This will give me the 
opportunity to have an other review today.

> so I think I've got some bandwidth to do the clean-up patch tomorrow
> after the agreement, unless someone would like to do it himself?

Renaming "xen,static-mem-..." is a bit tricky because they have been 
defined in Xen 4.16.

I couldn't find any support statement specific to the static memory 
feature. So it would technically fall under the "dom0less" section which 
is security supported.

That said, I don't think we can consider that the static memory feature 
is even supported because, until yesterday, the code wasn't properly 
handling request to balloon in/out. So I would view this is a tech 
preview (Could someone send a patch to clarify SUPPORT.MD)?

This would mean that would be that we could consider the binding 
unstable and we could do a straight renaming. That said, I can 
understand this may be undesirable.

If that's the case then we would need to keep the current binding as-is. 
So we would have two options:
   1) Provide a new compatible so #address-cells #size-cells can be 
used. The current binding can be deprecated
   2) Leave as-is and accept the difference

I don't have a strong opinion on which way to go. Whichever, it would be 
good to write down the rationale in the commit message of the "future" 
patch.

I would not block this series on the renaming for existing property 
(what matter is the new ones are consistent with the discussion). The 
renaming could be done afterwards. I would even say post the feature 
freeze on Friday because this could be considered as a bug fix (assuming 
you agree as the release manager :)).

Cheers,

-- 
Julien Grall

