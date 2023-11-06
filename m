Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 509007E200B
	for <lists+xen-devel@lfdr.de>; Mon,  6 Nov 2023 12:31:43 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.627926.978848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxpO-0003jy-Qq; Mon, 06 Nov 2023 11:31:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 627926.978848; Mon, 06 Nov 2023 11:31:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qzxpO-0003iJ-OG; Mon, 06 Nov 2023 11:31:34 +0000
Received: by outflank-mailman (input) for mailman id 627926;
 Mon, 06 Nov 2023 11:31:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qzxpM-0003i9-JO
 for xen-devel@lists.xenproject.org; Mon, 06 Nov 2023 11:31:32 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzxpL-0007GW-Id; Mon, 06 Nov 2023 11:31:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qzxpL-0008Nm-An; Mon, 06 Nov 2023 11:31:31 +0000
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
	bh=0d9jyMH64ANqw5HM4IjlCELfI0SKRl54FTCpftn33Xw=; b=QILZImVPDVOO3Fvj/AXxODPC57
	oO411s1EXrQgrkSejKD57ofJWxUxq+kpDVVF9xtRAvPvyXS7qfNkDBTzLHKk6C2TiPi1Nv+DK9p/I
	H3NEZAgW+OY0AFF/ZAmdeCaoGen/bN7y37iAfGPzOdwkYGa2Ua/wjUagct/w3W7QyAQg=;
Message-ID: <d4196b09-427d-458f-87f4-7e7126bf6f39@xen.org>
Date: Mon, 6 Nov 2023 11:31:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] xen/arm: Skip memory nodes if not enabled
Content-Language: en-GB
To: Leo Yan <leo.yan@linaro.org>, Stefano Stabellini <sstabellini@kernel.org>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20231013120442.1267488-1-leo.yan@linaro.org>
 <20231106021742.GA90848@leoy-huanghe.lan>
 <191b5aa4-182f-4b2e-8430-e605de592890@xen.org>
 <20231106103212.GE90848@leoy-huanghe.lan>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20231106103212.GE90848@leoy-huanghe.lan>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/11/2023 10:32, Leo Yan wrote:
> Hi Julien,
> 
> On Mon, Nov 06, 2023 at 09:52:45AM +0000, Julien Grall wrote:
> 
> [...]
> 
>>> Gentle ping.
>>>
>>> I don't see this patch is landed in Xen master or staging branch, should
>>> anything I need to follow up?
>>
>> The tree has been frozen for the past few weeks for any patches that are not
>> meant for 4.18. We branched for 4.18 last week so staging is now in
>> soft-reopening until 4.18 is released.
> 
> Thank you for the info.
> 
>> I am aware of few patches that are ready to be merged. But I haven't yet
>> gone through all of them and merge to 4.19. It will probably be done once
>> 4.18 is released.
> 
> Sure, good to know this.  I will wait a bit and just let me know if
> I need to follow up anything.

Please ping me in ~ 2 weeks time if your patch is still not merged.

@Stefano, did you add this patch in your for-next branch?

-- 
Julien Grall

