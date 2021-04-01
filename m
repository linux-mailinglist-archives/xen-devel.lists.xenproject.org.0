Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BC0351637
	for <lists+xen-devel@lfdr.de>; Thu,  1 Apr 2021 17:33:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.104625.200345 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzJg-00045X-Ri; Thu, 01 Apr 2021 15:33:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 104625.200345; Thu, 01 Apr 2021 15:33:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRzJg-000458-OL; Thu, 01 Apr 2021 15:33:04 +0000
Received: by outflank-mailman (input) for mailman id 104625;
 Thu, 01 Apr 2021 15:33:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lRzJe-000453-Gx
 for xen-devel@lists.xenproject.org; Thu, 01 Apr 2021 15:33:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRzJc-0000Ol-OI; Thu, 01 Apr 2021 15:33:00 +0000
Received: from 54-240-197-239.amazon.com ([54.240.197.239]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lRzJc-0006CF-G6; Thu, 01 Apr 2021 15:33:00 +0000
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
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=4t09i6lJcaCeOqAFZogMPxgcn8hcZFRDYFfERFzoBiQ=; b=ZnqWjMdJOa/dPvy8ApezXvsCP6
	fj9M7DibZQYRIX/WoivaGhYcBCKs7XkbdLjAVtQuq8vp3iJGrHPAAs7UBJKXAs5WPceDWEuhvDuzp
	9ipmx6Ip+wrvmGyoUym+nhmlbCEXm8Ocj9ggX2GII3uPBmuBmoFtp8AIs9cNYWfDFS8o=;
Subject: Re: [PATCH 00/23] further population of xen/lib/
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <c53a6802-8bae-1dc6-5ac4-6238e122aaa4@suse.com>
 <27916fa0-9ebd-a49a-bbb9-1ef47c2b5bf6@xen.org>
 <4f745d03-baa8-e9e6-692c-f9c9f401b766@suse.com>
 <6a38f0db-938b-fd13-48e6-6b538c85fe42@xen.org>
 <d9a21b2c-8eca-027d-5672-e5d9dfaaf4b7@suse.com>
 <3bdbd0ba-ce7d-3814-3280-c4f628b74d93@xen.org>
 <0d763d3a-6fcd-dd5c-803d-a52876a54f6c@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6eb1614d-fc16-9101-201d-9f63c2adcae7@xen.org>
Date: Thu, 1 Apr 2021 16:32:58 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <0d763d3a-6fcd-dd5c-803d-a52876a54f6c@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit



On 01/04/2021 16:25, Jan Beulich wrote:
> On 01.04.2021 16:55, Julien Grall wrote:
>>
>>
>> On 01/04/2021 15:27, Jan Beulich wrote:
>>> On 01.04.2021 16:04, Julien Grall wrote: >> So overall, the number of functions requiring overriding will likely be
>>>> pretty limited and #ifdef would be IMHO tolerable.
>>>>
>>>> Although, I would be OK with creating a file per function that are
>>>> already overrided. For all the others, I think this is just pointless.
>>>
>>> Well, I don't see a reason to special case individual functions.
>>> Plus any reasonable static library should imo have one (global)
>>> function per object file in the normal case; there may be very
>>> few exceptions. Drawing an ad hoc boundary at what currently has
>>> an override somewhere doesn't look very attractive to me. Plus
>>> to be honest while I would find it unfair to ask to further
>>> split things if I did just a partial conversion (i.e. invest yet
>>> more time), I find it rather odd to be asked to undo some of the
>>> splitting when I've already taken the extra time to make things
>>> consistent.
>>
>> I am sure each of us spent time working on a solution that some
>> reviewers were not necessary convinced of the usefulness and they had to
>> undo the series...
>>
>> In this case, you sent a large series with close to 0 commit message + a
>> small cover letter. So I think it is fair for a reviewer to be
>> unconvinced and ask for more input.
>>
>> You provided that now, I think we want a short summary (or a link to the
>> conversation) in each commit message.
>>
>> This will be helpful to understand why the move was made without having
>> to spend ages finding the original discussion.
> 
> I'll add "Allow the function to be individually linkable, discardable,
> and overridable." to all the str*() and mem*() patch descriptions. Is
> that going to be good enough?
It will be good for me.

Cheers,

> 
> Jan
> 

-- 
Julien Grall

