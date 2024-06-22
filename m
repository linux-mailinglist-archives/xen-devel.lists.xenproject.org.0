Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 91745913296
	for <lists+xen-devel@lfdr.de>; Sat, 22 Jun 2024 09:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.745776.1152893 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKvEM-0001DM-5p; Sat, 22 Jun 2024 07:32:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 745776.1152893; Sat, 22 Jun 2024 07:32:14 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sKvEM-0001BF-2t; Sat, 22 Jun 2024 07:32:14 +0000
Received: by outflank-mailman (input) for mailman id 745776;
 Sat, 22 Jun 2024 07:32:12 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1sKvEK-0001B9-R9
 for xen-devel@lists.xenproject.org; Sat, 22 Jun 2024 07:32:12 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sKvEK-0005Qm-3f; Sat, 22 Jun 2024 07:32:12 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1sKvEJ-0003bt-Of; Sat, 22 Jun 2024 07:32:11 +0000
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
	bh=WDj0/8UxFsPi20A5VayK2zsCM4zWM8yc5vKX79RS6n4=; b=Dhu/AUvOsmrn20nD6wN7Sl3NrO
	TGrYZfy+qC+ylmt/O28GMxIMXBe2wF1wqZf8ZZMnocVYnh0J8yLtt+TWT6dfSkDZDvzy4wZn81Zp2
	W3hO4cKRwygSJczQZOzkPj/IlwNIq6d0UrHIYu1VX/0X97e8W/8Tl0c883Z5XnR7n+ug=;
Message-ID: <917533b5-b79c-4e97-917d-9684993bf423@xen.org>
Date: Sat, 22 Jun 2024 08:32:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] xen: add explicit comment to identify notifier
 patterns
To: Stefano Stabellini <sstabellini@kernel.org>,
 Federico Serafini <federico.serafini@bugseng.com>
Cc: xen-devel@lists.xenproject.org, consulting@bugseng.com,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>,
 Dario Faggioli <dfaggioli@suse.com>, Juergen Gross <jgross@suse.com>
References: <d814434bf73e341f5d35836fa7063a728f7b7de4.1718788908.git.federico.serafini@bugseng.com>
 <f7d46c15-ff85-4a6f-afd7-df18649726c8@xen.org>
 <2072bf59-f125-4789-be77-40ed3641aec4@bugseng.com>
 <alpine.DEB.2.22.394.2406201811200.2572888@ubuntu-linux-20-04-desktop>
 <bce5eae2-973d-4d69-bee1-09f9f09dd011@bugseng.com>
 <alpine.DEB.2.22.394.2406211529130.2572888@ubuntu-linux-20-04-desktop>
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
In-Reply-To: <alpine.DEB.2.22.394.2406211529130.2572888@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Stefano,

On 21/06/2024 23:34, Stefano Stabellini wrote:
>>>> Yes, I also think this could be an opportunity to check the pattern
>>>> but no one has yet been identified to do this.
>>>
>>> I don't think I understand Julien's question and/or your answer.
>>>
>>> Is the question whether someone has done an analysis to make sure this
>>> patch covers all notifier patters in the xen codebase?
>>
>> I think Jan and Julien's concerns are about the fact that my patch
>> takes for granted that all the switch statements are doing the right
>> thing: someone should investigate the notifier patterns to confirm that
>> their are handling the different cases correctly.
> 
> That's really difficult to do, even for the maintainers of the code in
> question.
Sure it will require some work, but as any violation. However, I thought 
the whole point of MISRA is to improve the safety and our code base in 
general?

AFAIU, we already have some doubt that some notifiers are correct. So to 
me it seems wrong to add a comment because while this silence MISRA, 
this doesn't solve it in the true spirit.

> 
> And by not taking this patch we are exposing ourselves to more safety
> risks because we cannot make R16.4 blocking.
> 
> 
>>> If so, I expect that you have done an analysis simply by basing this
>>> patch on the 16.4 violations reported by ECLAIR?
>>
>> The previous version of the patch was based only on the reports of
>> ECLAIR but Jan said "you left out some patterns, why?".
>>
>> So, this version of the patch adds the comment for all the notifier
>> patterns I found using git grep "struct notifier_block \*"
>> (a superset of the ones reported by ECLAIR because some of them are in
>> files excluded from the analysis or deviated).
> 
> I think this patch is a step in the right direction. It doesn't prevent
> anyone in the community from making expert evaluations on whether the
> pattern is implemented correctly.

I am not sure I am reading this correctly. To me you are saying that for 
your MISRA, adding the default case is fine even if we believe some 
notifiers are incorrect. Did I understand right?

If so it does seems odd because this is really not solving the 
violation. You are just putting a smoke screen in front in the hope that 
there are no big issue in the code...

> 
> Honestly, I don't see another way to make progress on this, except for
> maybe deviating project-wide "struct notifier_block". But that's
> conceptually the same thing as this patch.

I still don't quite understand why you are so eager to hide violation 
just that you can progress faster on other bits.

I personally cannot put my name on a patch where the goal is to add a 
comment that no-one verified that it was actually true. (i.e. all the 
cases we care are handled). In particular in the Arm code, because IIRC 
we already identified issues in the past in the notifier.

I think it wouild be worth discussing the approach again in the next 
MISRA meeting.

Cheers,

> Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

-- 
Julien Grall

