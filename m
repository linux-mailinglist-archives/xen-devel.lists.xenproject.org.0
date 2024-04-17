Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5608A8822
	for <lists+xen-devel@lfdr.de>; Wed, 17 Apr 2024 17:51:54 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.707640.1105727 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx7Yh-0004Vg-CK; Wed, 17 Apr 2024 15:50:51 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 707640.1105727; Wed, 17 Apr 2024 15:50:51 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rx7Yh-0004Tb-9b; Wed, 17 Apr 2024 15:50:51 +0000
Received: by outflank-mailman (input) for mailman id 707640;
 Wed, 17 Apr 2024 15:50:50 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rx7Yf-0004TV-TB
 for xen-devel@lists.xenproject.org; Wed, 17 Apr 2024 15:50:49 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx7Ye-0000PG-Qb; Wed, 17 Apr 2024 15:50:48 +0000
Received: from [15.248.3.90] (helo=[10.24.67.26])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rx7Ye-0001I1-FC; Wed, 17 Apr 2024 15:50:48 +0000
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
	bh=hzyy1R+5/vqu34H54lXJgu9FSfMf7mcDszgr/gfc7bg=; b=raDIOmzW3bzF+sY+SNJrAX7qG1
	Y57UqlhIwuD6kpDSl/ReV2L2cs99HwRDmkRy8LPhZMBDDCQFkQUMdtQz8z5ZVl16IujbEBxJGLu0f
	VhsxeNuCGSJkPiGv+EzxVzMttj1ZxV77DafXSNwEeVhcCl4NH+gPfzOHN4Ey0dEYxrZA=;
Message-ID: <24d70e87-1846-4988-bdc6-081b9a74f6f5@xen.org>
Date: Wed, 17 Apr 2024 16:50:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH] automation/eclair_analysis: substitute deprecated
 service
Content-Language: en-GB
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org,
 michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com,
 consulting@bugseng.com, bertrand.marquis@arm.com,
 Simone Ballarin <simone.ballarin@bugseng.com>,
 Doug Goldstein <cardoe@cardoe.com>
References: <4850cedd9680e521cfac350930b24af19cdf1ab8.1713338908.git.nicola.vetrini@bugseng.com>
 <64c40ce6-3305-4fa0-82cb-5ae3431b0ce6@xen.org>
 <504af9967255fcaec1b870e53dfc2617@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <504af9967255fcaec1b870e53dfc2617@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 17/04/2024 16:05, Nicola Vetrini wrote:
> On 2024-04-17 16:57, Julien Grall wrote:
>> Hi Nicola,
>>
>> On 17/04/2024 15:51, Nicola Vetrini wrote:
>>> The service STD.emptrecd is in the process of being removed in favour
>>> of STD.anonstct.
>>
>> I am guessing this is not a new feature and the current ECLAIR version 
>> is supporting it?
>>
>> Cheers,
>>
> 
> Yes, it was just an oversight to leave the old emptrcd there. It will 
> eventually be phased out in the next release.

Thanks for confirming!

I don't have a way to test ECLAIR or any knowledge. But if you need an ack:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,


> 
>>>
>>> No functional change.
>>>
>>> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
>>> ---
>>>   automation/eclair_analysis/ECLAIR/toolchain.ecl | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/automation/eclair_analysis/ECLAIR/toolchain.ecl 
>>> b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>> index 71a1e2cce029..86e9a79b5231 100644
>>> --- a/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>> +++ b/automation/eclair_analysis/ECLAIR/toolchain.ecl
>>> @@ -44,8 +44,8 @@
>>>   -doc_end
>>>     -doc_begin="See Section \"6.19 Structures with No Members\" of 
>>> "GCC_MANUAL"."
>>> --config=STD.emptrecd,behavior+={c99,GCC_ARM64,specified}
>>> --config=STD.emptrecd,behavior+={c99,GCC_X86_64,specified}
>>> +-config=STD.anonstct,behavior+={c99,GCC_ARM64,specified}
>>> +-config=STD.anonstct,behavior+={c99,GCC_X86_64,specified}
>>>   -doc_end
>>>     -doc_begin="See Section \"6.18 Arrays of Length Zero\" of 
>>> "GCC_MANUAL"."
> 

-- 
Julien Grall

