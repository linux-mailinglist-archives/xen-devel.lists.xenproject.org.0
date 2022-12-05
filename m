Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C8F64275E
	for <lists+xen-devel@lfdr.de>; Mon,  5 Dec 2022 12:20:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.453439.711053 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29Vr-0003n3-LR; Mon, 05 Dec 2022 11:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 453439.711053; Mon, 05 Dec 2022 11:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1p29Vr-0003jc-ID; Mon, 05 Dec 2022 11:19:55 +0000
Received: by outflank-mailman (input) for mailman id 453439;
 Mon, 05 Dec 2022 11:19:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1p29Vq-0003jW-4M
 for xen-devel@lists.xenproject.org; Mon, 05 Dec 2022 11:19:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29Vn-000516-E3; Mon, 05 Dec 2022 11:19:51 +0000
Received: from 54-240-197-232.amazon.com ([54.240.197.232]
 helo=[192.168.30.208]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1p29Vn-0006WA-78; Mon, 05 Dec 2022 11:19:51 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=m4VFTsdZASr+KQyTVf+essBJg3ZDRMe+zqjDr1ercHM=; b=Jo5omRlAZmT7e5HiaREkf2Lv0x
	Vawc8C7XalpuoHqn+3URwNxKU6FSAfwi2c4/hdSSDyFi8xoRSyamMGFmVa3Zg12Kn2GxLTz2BhzJQ
	JytBT1AE4hBY4UeG7AZG+EG/Gg9u5HWa56SCvh50A/uDoTfgOPWq4sPQTXbwDvbLjVj4=;
Message-ID: <47760c77-f9d0-31bf-445c-63d4f5fec37d@xen.org>
Date: Mon, 5 Dec 2022 11:19:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2] process/release-technician-checklist: Explain how the
 banner in README is generated
Content-Language: en-US
From: Julien Grall <julien@xen.org>
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20221124190850.35344-1-julien@xen.org>
 <6819d05e-d1ab-fc3e-7795-bac650df3bc4@suse.com>
 <e68c068c-d648-7915-8709-0367d7f0c48f@xen.org>
In-Reply-To: <e68c068c-d648-7915-8709-0367d7f0c48f@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 05/12/2022 11:16, Julien Grall wrote:
> Hi Jan,
> 
> On 25/11/2022 09:17, Jan Beulich wrote:
>> On 24.11.2022 20:08, Julien Grall wrote:
>>> From: Julien Grall <jgrall@amazon.com>
>>>
>>> Explain how the banner in README is generated and take the opportunity
>>> to mention what it should look like for RC.
>>>
>>> Signed-off-by: Julien Grall <jgrall@amazon.com>
>>
>> Acked-by: Jan Beulich <jbeulich@suse.com>
>> albeit with a couple of nits:
>>
>>> --- a/docs/process/release-technician-checklist.txt
>>> +++ b/docs/process/release-technician-checklist.txt
>>> @@ -48,7 +48,12 @@ t=RELEASE-$r
>>>   * consider bumping sonames of shlibs
>>> -* change xen-unstable README (should say "Xen 4.5" in releases and 
>>> on stable branches, "Xen 4.5-unstable" on unstable)
>>> +* change xen-unstable README. Should say:
>>> +    - "Xen 4.5" in releases and on stable branches
>>> +    - "Xen 4.5-unstable" on unstable
>>> +    - "Xen 4.5-rc" for release candidate
>>> +
>>> +*   The banner is generated using figlet
>>>   * change xen-unstable Config.mk
>>
>> Perhaps insert another blank line between these two bullet points?
>> Or, if they're deemed to belong together, remove the one you insert?
> 
> I will add another blank line.
> 
>>
>> The new bullet point you add also would likely want to match the
>> others in style, both for the number of spaces after * and for not
>> using a capital first letter (maybe "generate banner using figlet").
> 
> Sure. I will address them before committing.

I had another look and went with the following:

+* change xen-unstable README. The banner (generated using figlet) 
should say:
+    - "Xen 4.5" in releases and on stable branches
+    - "Xen 4.5-unstable" on unstable
+    - "Xen 4.5-rc" for release candidate
+

So only one bullet point and using () to explain how the banner is 
generated.

Cheers,

-- 
Julien Grall

