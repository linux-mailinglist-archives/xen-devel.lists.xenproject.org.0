Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C57234D4DD
	for <lists+xen-devel@lfdr.de>; Mon, 29 Mar 2021 18:24:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103163.196894 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQugR-0000OP-W4; Mon, 29 Mar 2021 16:24:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103163.196894; Mon, 29 Mar 2021 16:24:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lQugR-0000O0-Si; Mon, 29 Mar 2021 16:24:07 +0000
Received: by outflank-mailman (input) for mailman id 103163;
 Mon, 29 Mar 2021 16:24:06 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=yGoF=I3=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lQugQ-0000Nr-Cn
 for xen-devel@lists.xenproject.org; Mon, 29 Mar 2021 16:24:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id de8aa2ce-0cb8-412b-adfd-f36fbae6f849;
 Mon, 29 Mar 2021 16:24:05 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id DF7ECAF4E;
 Mon, 29 Mar 2021 16:24:04 +0000 (UTC)
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
X-Inumbo-ID: de8aa2ce-0cb8-412b-adfd-f36fbae6f849
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617035045; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXa7aZhL7k4mbwPdIZACHQpcq75Boe+S6lB0fvSUzm8=;
	b=JQMgBA/G2J6zgBl6moTvsL6NJXB6lHfwcrCq15HBaTcnBLdumQU980dvkgUSQlP9YfnsLN
	lLaQUHfAX+Q47cKBamPWHtqHNQbKxqJ8VipGmRSu6M1gCJ21tDcwI8cTZNXWt+cP26hIOi
	/27BzBych2xqk/kHRkiJObMgODbfhY4=
Subject: Re: [PATCH 5/6] CHANGELOG.md: Add entries for emulation
To: George Dunlap <George.Dunlap@citrix.com>
Cc: Andrew Cooper <Andrew.Cooper3@citrix.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <20210324164407.302062-1-george.dunlap@citrix.com>
 <20210324164407.302062-5-george.dunlap@citrix.com>
 <33f78891-c894-b41a-a1a3-82aac1f57b8d@suse.com>
 <0A187740-DB6E-486C-8B10-5207CE6A5D72@citrix.com>
 <7407cac8-c55d-0372-123b-39c9949e6ca5@citrix.com>
 <acb63a0b-9200-b91d-0a9e-5f78ece3d73a@suse.com>
 <CBE8ACFF-4AA7-4254-8AF7-49E10C1F866C@citrix.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <5b0258db-e362-0085-43e4-78a9b9a88da6@suse.com>
Date: Mon, 29 Mar 2021 18:24:04 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CBE8ACFF-4AA7-4254-8AF7-49E10C1F866C@citrix.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 29.03.2021 18:06, George Dunlap wrote:
> 
> 
>> On Mar 25, 2021, at 1:58 PM, Jan Beulich <JBeulich@suse.com> wrote:
>>
>> On 25.03.2021 10:37, Andrew Cooper wrote:
>>> On 25/03/2021 09:04, George Dunlap wrote:
>>>>> On Mar 25, 2021, at 7:57 AM, Jan Beulich <jbeulich@suse.com> wrote:
>>>>> On 24.03.2021 17:44, George Dunlap wrote:
>>>>>> --- a/CHANGELOG.md
>>>>>> +++ b/CHANGELOG.md
>>>>>> @@ -14,6 +14,8 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>>>>>> - Named PCI devices for xl/libxl
>>>>>> - Support for zstd-compressed dom0 kernels
>>>>>> - Library improvements from NetBSD ports upstreamed
>>>>>> + - x86_emulate: Support AVX-VNNI instructions
>>>>>> + - x86_emulate: Expanded testing for several instruction classes
>>>>> TBH both seem too minor to me to be mentioned here. If I was to pick
>>>>> just one, I'd keep the former and drop the latter.
>>>> It’s always quite difficult in these releases to help express to people exactly what’s happened.  We’ve got over 1000 changesets — what have we been doing?  If my star chart is correct, the latter represents nearly 1700 extra lines of codes in tools/tests/x86_emulator/predicates.c.  It’s actually a reasonable chunk of code churn, which I think is worth highlighting.
>>>
>>> I agree with Jan.  New concrete instruction groups are useful for an end
>>> user to read.  "We refactored some internal of a test harness" isn't,
>>> especially when it would most likely be repeated every release.
>>>
>>> I'd drop the latter line and just keep the former.
>>
>> And then perhaps also not focus on the emulator, but merely on the
>> fact that guests now can use that ISA extension (for which the
>> emulator change is a [the only] prereq)?
> 
> Would you mind giving a concrete suggestion?

x86: Allow domains to use AVX-VNNI instructions

Jan

