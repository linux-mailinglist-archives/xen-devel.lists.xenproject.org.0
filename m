Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DABAD46A128
	for <lists+xen-devel@lfdr.de>; Mon,  6 Dec 2021 17:21:31 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.239354.414862 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGjw-0004gN-OM; Mon, 06 Dec 2021 16:21:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 239354.414862; Mon, 06 Dec 2021 16:21:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1muGjw-0004eY-LA; Mon, 06 Dec 2021 16:21:20 +0000
Received: by outflank-mailman (input) for mailman id 239354;
 Mon, 06 Dec 2021 16:21:18 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1muGju-0004e8-Rw
 for xen-devel@lists.xenproject.org; Mon, 06 Dec 2021 16:21:18 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muGjr-0001Yy-W9; Mon, 06 Dec 2021 16:21:15 +0000
Received: from 54-240-197-231.amazon.com ([54.240.197.231]
 helo=[192.168.26.205]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1muGjr-00064c-QH; Mon, 06 Dec 2021 16:21:15 +0000
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
	bh=7Dg3ydem1lgxY47qSTmEkw750BxEA2zKC3KXdut4/xo=; b=00g9JKii2Fwhdqh6LGQ5ixXf15
	xVpi+mt5grMyQnuYlio/H8C1g71cAz475aL9gT4x2HeerqUAzC2GsGuoPTD3vw71hKk+op4qfl/9I
	FdKzn2QVK6QEJW4Biec78lz2Qe+txd13h2IGdaSMCSJJGBFZqqrmT//VpGA0NfiAZUpU=;
Message-ID: <9affccd1-0f74-c58e-ebd4-5a5546ec80b1@xen.org>
Date: Mon, 6 Dec 2021 16:21:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.3.2
Subject: Re: [PATCH 1/7] xz: add fall-through comments to a switch statement
To: Jan Beulich <jbeulich@suse.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Ian Jackson <iwj@xenproject.org>
References: <f96f014c-057a-80a7-b19d-04d7234d3f64@suse.com>
 <0ed245fa-58a7-a5f6-b82e-48f9ed0b6970@suse.com>
 <a36df6b5-9f55-a199-e8d3-3f6cd58a054d@xen.org>
 <b28ec75a-f5e5-cd3d-12b5-20338c7c88e0@xen.org>
 <0c0e67f3-5e0a-f047-ca09-1cf078e6b094@suse.com>
 <71ef250c-be92-2b2f-0f07-ce32c17d8050@xen.org>
 <ceec5b56-65fc-8bb4-b9e0-1e16aea8c412@suse.com>
 <c2d312c2-c413-4e07-1c0c-8652cab40784@xen.org>
 <0b808ce0-23a2-65ae-dfb3-b167d5565b31@suse.com>
 <6bcd1555-ee0d-dd6d-55ca-0ca0e64c3623@xen.org>
 <bef5ff51-475a-e8c4-83fc-950df4516399@suse.com>
 <24992.55453.893877.246946@mariner.uk.xensource.com>
 <2b4195da-21a8-6c30-27c8-43e943b821a1@suse.com>
 <c3e698ab-afd7-9638-3f7c-c7599908e173@xen.org>
 <e684eeca-a798-9cf1-c8c2-1db2e02bb65c@suse.com>
 <53cd2f84-f011-9c97-a108-fd946535920b@xen.org>
 <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <5a6ffa5a-6884-57b5-c296-904e9b0b4c78@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jan,

On 06/12/2021 16:12, Jan Beulich wrote:
> On 06.12.2021 17:06, Julien Grall wrote:
>> On 06/12/2021 15:06, Jan Beulich wrote:
>>> On 06.12.2021 15:28, Julien Grall wrote:
>>>> I am not going to ack it but I am also not going to Nack it if another
>>>> maintainer agrees with your approach.
>>>
>>> FTAOD I'll be giving it a week or so, but unless I get an outright NAK,
>>> I'm now in a position to put this in with Luca's R-b.
>>
>>   From the check-in policy section in MAINTAINERS:
>>
>> 4. There must be no "open" objections.
>>
>> So I think this cannot be check-in given two maintainers disagree on the
>> approach. That said, as I wrote earlier my condition for not Nacking is
>> another maintainer agree with your approach.
> 
> Hmm, I did address both your and Ian's concerns in v2, admittedly by only
> going as far as minimally necessary. I therefore wouldn't call this an
> "open objection".

I believe my objection is still open. I still have have no way to verify 
what you did is correct.

For instance, the tags in patch #2 are:

Link: http://lkml.kernel.org/r/20191104185107.3b6330df@tukaani.org
Reported-by: Yu Sun <yusun2@cisco.com>
Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Acked-by: Daniel Walker <danielwa@cisco.com>
[Linux commit: 8e20ba2e53fc6198cbfbcc700e9f884157052a8d]

The tags in the Linux commit are:

Signed-off-by: Lasse Collin <lasse.collin@tukaani.org>
Reported-by: Yu Sun <yusun2@cisco.com>
Acked-by: Daniel Walker <danielwa@cisco.com>
Cc: "Yixia Si (yisi)" <yisi@cisco.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>

* The first two matches the original e-mails
* I couldn't find the 3rd on the ML.
* The Cc could be ignored
* The signed-off-by are I guess what you call "mechanical"

Cheers,

-- 
Julien Grall

