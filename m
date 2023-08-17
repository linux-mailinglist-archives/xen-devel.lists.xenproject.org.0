Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id C1D8877F56A
	for <lists+xen-devel@lfdr.de>; Thu, 17 Aug 2023 13:39:35 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.585309.916391 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbLC-0006M2-Ld; Thu, 17 Aug 2023 11:39:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 585309.916391; Thu, 17 Aug 2023 11:39:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qWbLC-0006KN-Iz; Thu, 17 Aug 2023 11:39:02 +0000
Received: by outflank-mailman (input) for mailman id 585309;
 Thu, 17 Aug 2023 11:39:01 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qWbLA-0006KH-Ve
 for xen-devel@lists.xenproject.org; Thu, 17 Aug 2023 11:39:00 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWbLA-0002hk-9u; Thu, 17 Aug 2023 11:39:00 +0000
Received: from [54.239.6.180] (helo=[192.168.0.78])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qWbLA-0002oP-3V; Thu, 17 Aug 2023 11:39:00 +0000
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
	bh=0tqbUT7x5pR5jMFJ1xTQa6fUZZov5HVLwQuhA0LGwQw=; b=QVk0YLqKAZT2+x2vyv2dkw02uI
	fm/wfLMObxZr4ByEEjsl5IB6cQIZzxeMwvgkr7fQ0+S0rS9Om3CONF6/vJ/T44FY4m08moFahCA2u
	M2LFnYUvQt8p0vGgb3Jj5zgGs+icCpDHmozzngTE1F4COJznkFeu8De630la73z0S7iA=;
Message-ID: <337ec77b-c74e-4738-88b3-f180afd88529@xen.org>
Date: Thu, 17 Aug 2023 12:38:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [XEN PATCH v2] misra: add more entires to exclude-list.json
Content-Language: en-GB
To: Federico Serafini <federico.serafini@bugseng.com>,
 xen-devel@lists.xenproject.org
Cc: consulting@bugseng.com, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <186af44774dc4670cb1ca0d8238e0620c3d0fc2f.1692266054.git.federico.serafini@bugseng.com>
 <472241eb-0417-46e8-b713-79586642df55@xen.org>
 <fa50cb01-1d4f-a7e1-28f5-ff765d798e51@bugseng.com>
 <88c992b7-bdd3-201b-1c06-d5984f7d76bc@bugseng.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <88c992b7-bdd3-201b-1c06-d5984f7d76bc@bugseng.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 17/08/2023 11:13, Federico Serafini wrote:
> 
> 
> On 17/08/23 12:02, Federico Serafini wrote:
>> On 17/08/23 11:57, Julien Grall wrote:
>>> Hi,
>>>
>>> On 17/08/2023 10:55, Federico Serafini wrote:
>>>> Add entries to the exclude-list.json for those files that need to be
>>>> excluded from the analysis scan.
>>>>
>>>> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
>>>> ---
>>>> Changes in v2:
>>>> - fixed indentation.
>>>
>>> What's the difference with the other v2 you posted ~10 min ago?
>>>
>>> Is this the patch we need to review? If so, can you review on the 
>>> previous one to explicitely say it should be ignored.
>>>
>>> Cheers,
>>>
>>
>> There is no difference,
>> it seems that two mails have been sent,
>> sorry for that.
>>
> 
> The patches to be reviewed are:
> [XEN PATCH v2] misra: add more entires to exclude-list.json
> [XEN PATCH 1/2] automation/eclair: update configuration
> 
> When a v2 of a patch within a series is needed,
> should I send a v2 of the whole series?

It depends on the situation. In your case here, I would have commented 
on the patch that the indentation is wrong and wait for more input on 
the rest of the series.

If this was the only change, then most likely it could have been dealt 
on commit. Otherwise you could have sent a new revision for the full series.

Cheers,

-- 
Julien Grall

