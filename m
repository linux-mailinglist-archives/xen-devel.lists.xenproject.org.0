Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5D690EC6
	for <lists+xen-devel@lfdr.de>; Thu,  9 Feb 2023 18:00:55 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.492778.762481 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAH5-00063n-Me; Thu, 09 Feb 2023 16:59:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 492778.762481; Thu, 09 Feb 2023 16:59:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pQAH5-00061c-JT; Thu, 09 Feb 2023 16:59:55 +0000
Received: by outflank-mailman (input) for mailman id 492778;
 Thu, 09 Feb 2023 16:59:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1pQAH4-00061W-CG
 for xen-devel@lists.xenproject.org; Thu, 09 Feb 2023 16:59:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAH3-0002gM-6v; Thu, 09 Feb 2023 16:59:53 +0000
Received: from [54.239.6.186] (helo=[192.168.16.230])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1pQAH2-0000hR-WB; Thu, 09 Feb 2023 16:59:53 +0000
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
	bh=ZUSzi/wdDUAimOkEc/kmjMP1f0yhFP0kEzE9IINWkBU=; b=C6nvDIAG3ZheVVVKBaIGUv+I7k
	C1WjysEl2yPfpO3HCo6odxuAPqowLik4lDQOyoWOn/jZeJMcBtacH5s2hnNaZqFa6RUmyGiY/vbyW
	mKTMZBa5KGn+TXEPEQukX67+6sauXVqYBroKGJiKoZt8cUBtCFR9ebpJwIMkapJgO8zE=;
Message-ID: <96b3edcc-fa20-6be2-e0a3-966a50ecbbcb@xen.org>
Date: Thu, 9 Feb 2023 16:59:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] docs/process: branching-checklist: Reword the section
 about Config.mk
Content-Language: en-US
To: George Dunlap <george.dunlap@cloud.com>
Cc: xen-devel@lists.xenproject.org, Henry.Wang@arm.com,
 Julien Grall <jgrall@amazon.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20221212093410.36289-1-julien@xen.org>
 <20221212093410.36289-6-julien@xen.org>
 <CA+zSX=b3rA=Jc4Au5DhpZK9HZ484sxdR3GdCD6Gjpx114aiyvg@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CA+zSX=b3rA=Jc4Au5DhpZK9HZ484sxdR3GdCD6Gjpx114aiyvg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi George,

Sorry for the late answer.

On 12/12/2022 12:33, George Dunlap wrote:
> On Mon, Dec 12, 2022 at 9:34 AM Julien Grall <julien@xen.org> wrote:
> 
>> From: Julien Grall <jgrall@amazon.com>
>>
>> Since at least Xen 4.12, the revision for external trees don't contain
>> the word "unstable". So explicitely list the *_REVISION variables that
>> need to be updated as part of the branching process.
>>
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>> ---
>>   docs/process/branching-checklist.txt | 8 +++-----
>>   1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/process/branching-checklist.txt
>> b/docs/process/branching-checklist.txt
>> index d1550385c96e..7004f16e8311 100644
>> --- a/docs/process/branching-checklist.txt
>> +++ b/docs/process/branching-checklist.txt
>> @@ -69,11 +69,9 @@ ov=4.0
>>       git add versions
>>       git commit -m "Branch for $v"
>>
>> -Ensure references to qemu trees in xen.git's Config.mk are updated.
>> -Check this with
>> -    grep unstable Config.mk
>> -which should produce no output.  Replace as necessary.
>> -(There may well be none.)
>> +Ensure references to qemu trees and Mini-OS in xen.git's Config.mk are
>> updated.
>> +The variables are QEMU_UPSTREAM_REVISION, QEMU_TRADITIONAL_REVISION and
>> +MINIOS_UPSTREAM_REVISION.
>>
> 
> One advantage of the previous wording was that it helped you know what the
> references *weren't* supposed to look like (although it might have been
> more helpful to know what the references *were* supposed to look like).
> Would it make sense to add a few words about what they're supposed to look
> like?

Good point. I will replace the last sentences to:

The variables and there content should be:
   - QEMU_UPSTREAM_REVISION: qemu-xen-X.Y.0
   - QEMU_TRADITIONAL_REVISION: xen-X.Y.0
   - MINIOS_UPSTREAM_REVISION: xen-RELEASE-X.Y.0

Where X.Y is the release version (e.g. 4.17).

Cheers,

-- 
Julien Grall

