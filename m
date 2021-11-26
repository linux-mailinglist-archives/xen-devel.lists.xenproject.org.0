Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0710B45E9DA
	for <lists+xen-devel@lfdr.de>; Fri, 26 Nov 2021 10:04:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.232417.402937 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqX8p-0004f0-Bc; Fri, 26 Nov 2021 09:03:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 232417.402937; Fri, 26 Nov 2021 09:03:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mqX8p-0004bo-7q; Fri, 26 Nov 2021 09:03:35 +0000
Received: by outflank-mailman (input) for mailman id 232417;
 Fri, 26 Nov 2021 09:03:33 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1mqX8n-0004bi-Bv
 for xen-devel@lists.xenproject.org; Fri, 26 Nov 2021 09:03:33 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqX8j-0002vP-QB; Fri, 26 Nov 2021 09:03:29 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1mqX8j-00028u-HM; Fri, 26 Nov 2021 09:03:29 +0000
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
	bh=SNivb7ZRKcoDAkET0wJ+uoadWTWNJrW1fwZH36Mns6M=; b=xkytt+2dyFz5IyDwJX3wId3mEX
	yjK8w9ymmTG0V5mw/v4U2t43bW6L3rzkD/ODsrwbOUrW7p40bYLqYAQ3g9Z01QlIuui23vbbj+34m
	2qE4+1joBIe/Q0lE1Tz6ux/M7jFL82HReP4hA0iFGY7HKkgfEE96HVNjoJlh6/LjrMSw=;
Message-ID: <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
Date: Fri, 26 Nov 2021 09:03:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 26/11/2021 07:37, Jan Beulich wrote:
> On 25.11.2021 18:13, Julien Grall wrote:
>> Hi,
>>
>> On 25/11/2021 17:03, Jan Beulich wrote:
>>> On 25.11.2021 17:54, Julien Grall wrote:
>>>> On 25/11/2021 16:49, Julien Grall wrote:
>>>>> On 19/11/2021 10:21, Jan Beulich wrote:
>>>>>> From: Lasse Collin <lasse.collin@tukaani.org>
>>>>>>
>>>>>> It's good style. I was also told that GCC 7 is more strict and might
>>>>>> give a warning when such comments are missing.
>>>>>>
>>>>>> Suggested-by: Andrei Borzenkov <arvidjaar@gmail.com>
>>>>>> Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
>>>>
>>>> Actually, any reason why there are some signed-off-by missing?
>>>
>>> I often keep the author's, but drop ones which clearly got there only
>>> because of the path a patch has taken through trees.
>>
>> This might be clear for you. For me, as a reviewer, I have to do extra
>> work to check whether you keeped the relevant signed-off-by.
>>
>>> These aren't
>>> relevant imo when pulling over the change;
>>
>> They are technically part of the "chain of approval".
> 
> But the Linux chain of approval is precisely what is of no interest to
> us. We need to approve the change ourselves; Linux having had it
> approved is merely a data point.

I can understand this point of view. But as I wrote above, a reviewer as 
to do extra work to check you correctly propagated the signed-off-by 
(see more below).

> 
>>> I could as well take the
>>> email submission as my basis, after all, where just the single S-o-b
>>> would be there.
>>
>> That's a fair point. That said, you took the commit-as-is from linus.git
> 
> How would you be able to tell?

That's easy. You wrote in your commit message:

[Linux commit: 5a244f48ecbbd03a11eb84819c5c599db81823ee]

That's indicating you used the Linux commit rather than the one on the 
ML. So I will tend to diff the commit and the what's different.

> 
>> so I think we ought to keep them.
> 
> I disagree. And I'd like to remain consistent with what I've been doing
> in the past.
I actually tried to find the original submission but failed. I didn't 
look for long though...

Anyway, I think it would save time for everyone (you had to manually 
delete signed-off-by after all) if you just copy the commit (including 
all the signed-off-by) message as-is.

Cheers,

-- 
Julien Grall

