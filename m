Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CD528690F1A
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:24:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492804.762526 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAef-00031B-CW; Thu, 09 Feb 2023 17:24:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492804.762526; Thu, 09 Feb 2023 17:24:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAef-0002yg-8k; Thu, 09 Feb 2023 17:24:17 +0000
Received: by outflank-mailman (input) for mailman id 492804;
 Thu, 09 Feb 2023 17:24:15 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAed-0002yK-0w
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 17:24:15 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAeb-0003Ln-SS; Thu, 09 Feb 2023 17:24:13 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAeb-00023q-L5; Thu, 09 Feb 2023 17:24:13 +0000
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
	bh=Gwv0+i9rGhdmE7m4P9YKBe4hHLpaLETIcWI34rg75Ec=; b=Dn9l+ylQDQwC5KwdXTiyeADsn7
	6iMpxo/PvIYkXGtWTzacM2fNnzlEmOF7VfQB8n7q9jpjbiHWYgF9lR5lxEYU9jN02IV+dJlr7W/zx
	/LoNhvrhxRu+YjDt1xXd2oGA3IFrSHJa6Ec4cbSUyg9tGztucOthYe4x4eXC+a3wo5SI=;
Message-ID: <b996e423-6dfd-0203-4538-2f9e298d22df@xen.org>
Date: Thu, 9 Feb 2023 17:24:11 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH 0/8] docs/process: branching-checklist: Update it
Content-Language: en-US
To: Henry Wang <Henry.Wang@arm.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "ijackson@chiark.greenend.org.uk" <ijackson@chiark.greenend.org.uk>
References: <20221212093410.36289-1-julien@xen.org>
 <AS8PR08MB7991A0C040E47BD98123953792E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <AS8PR08MB7991A0C040E47BD98123953792E29@AS8PR08MB7991.eurprd08.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 12/12/2022 09:49, Henry Wang wrote:
> Hi Julien,

Hi Henry,

Sorry for the late reply.

>> -----Original Message-----
>> From: Julien Grall <julien@xen.org>
>> Subject: [PATCH 0/8] docs/process: branching-checklist: Update it
>>
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Hi all,
>>
>> This is a collection of improvement for the branching checklist.
> 
> Thanks for this work! Since from the docs/process/RUBRIC we are having:
> ```
> They are living documents, and no special approval is needed to modify
> them beyond the usual acks for commit.  They should be updated as and
> when it seems expediant.
> ```
> 
> I don't know if my reviewed-by counts but I did go through the whole
> series, so for the whole series:
> 
> Reviewed-by: Henry Wang <Henry.Wang@arm.com>

All reviews count :). Thanks for looking through them. I have added your 
tag to all but one which needs a respin.

> 
> Kind regards,
> Henry
> 
>>
>> Cheers,
>>
>> Julien Grall (8):
>>    docs/process: branching-checklist: Use consistent indentation
>>    docs/process: branching-checklist: Remove reference to qemu-ijw.git
>>    docs/process: branching-checklist: Remove reference to root
>>    docs/process: branching-checklist: Clarify steps to add the branch in
>>      osstest

I have committed up to this patch.

>>    docs/process: branching-checklist: Reword the section about Config.mk
>>    docs/process: branching-checklist: Remove section about the cambridge
>>      colo
>>    docs/proces: branching-checklist: Update the section "add to patchbot"
>>    docs/process: branching-checklist: Add a list of accounts at the
>>      beginning
>>
>>   docs/process/branching-checklist.txt | 122 +++++++++++++--------------
>>   1 file changed, 60 insertions(+), 62 deletions(-)
>>
>> --
>> 2.38.1
> 

Cheers,

-- 
Julien Grall

