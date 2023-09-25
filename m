Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DFE7AD49A
	for <lists+xen-devel@lfdr.de>; Mon, 25 Sep 2023 11:35:38 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.607728.946003 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkhzc-00029Z-BO; Mon, 25 Sep 2023 09:35:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 607728.946003; Mon, 25 Sep 2023 09:35:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qkhzc-00026j-8k; Mon, 25 Sep 2023 09:35:04 +0000
Received: by outflank-mailman (input) for mailman id 607728;
 Mon, 25 Sep 2023 09:35:02 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qkhza-00026d-Tt
 for xen-devel@lists.xenproject.org; Mon, 25 Sep 2023 09:35:02 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkhzQ-0001C4-5V; Mon, 25 Sep 2023 09:34:52 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qkhzP-0004Ze-Qr; Mon, 25 Sep 2023 09:34:51 +0000
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
	bh=crmq3pzBVGieTA8ED/L1colBz2S4qigRY0llT4ruybY=; b=zArYjK5pYG/r6DTDobfV0ULOoe
	G5dgZAenHCi4WbO96xpbA1yc5RBG0TlVQ3xFbW4Prod0xLxy9REU3ZEBrRKRTjamaG3sSz3/2xZRr
	OiN/b9L08jOzFV+RHbSiClhRHCzGHByzRTijzyoI5QpJ5iggyTD/6nJYLkKrByz5zqy8=;
Message-ID: <1a056bd6-a918-4c76-82b0-0eded46b23a8@xen.org>
Date: Mon, 25 Sep 2023 10:34:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Xen 4.18 release: Reminder about code freeze
Content-Language: en-GB
To: Henry Wang <Henry.Wang@arm.com>, Jan Beulich <jbeulich@suse.com>,
 "committers@xenproject.org" <committers@xenproject.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 "jgross@suse.com" <jgross@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Anthony PERARD <anthony.perard@citrix.com>,
 "community.manager@xenproject.org" <community.manager@xenproject.org>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>
References: <AS8PR08MB7991D1099E32CC9F03B0E0F692FCA@AS8PR08MB7991.eurprd08.prod.outlook.com>
 <6399a816-ac1a-b741-ed52-b5d03b498ee6@suse.com>
 <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <2AB20BED-9ED9-4713-A39A-59891E09E02C@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Henry,

On 25/09/2023 07:40, Henry Wang wrote:
>> On Sep 25, 2023, at 14:32, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 25.09.2023 03:25, Henry Wang wrote:
>>> Hi everyone,
>>>
>>> This is the reminder that we are currently in code freeze. The hard code
>>> freeze date will be in two weeks, i.e. Fri Oct 6, 2023.
>>
>> Could you further remind us about what is (not) permitted to go in during
>> this time?
> 
> Sorry, my bad. From code freeze, technically only bugfixes and release
> Blockers can go in.
> 
>> I also understand all commits need a release ack from now on?
> 
> I think so.
> 
>> (I'm sorry, we're doing releases only every once in a while, so it is
>> always good for things to be re-spelled out, i.e. even if they haven't
>> changed from earlier releases.)
> 
> Actually, thanks for asking! For MISRA work...
> 
> 
>> This, for example, would then likely mean
>> that all Misra work now needs queuing for after the tree re-opens ...
> 
> …I also thought about this, to be honest I am tempted to loose the control
> or at least offer some flexibility on this specific part, as normally MISRA
> related changes are harmless and actually harden the code. I am wondering
> if there are any objections from others…
> 
> Committers, would you mind sharing your opinion on this one? Thanks!

I am split. On one hand, I agree they low risk and would be good to have 
them. But on the other hand, they tend to be invasive and may interfere 
with any bug we need to fix during the hardening period.

So I would lean towards at least restricting the number of MISRA patches 
we are merging. We also need to consider a time limit so we don't end up 
to push the release just because a MISRA patches broke the build. I 
would suggest any MISRA patches should be committed by the first RC.

Cheers,

-- 
Julien Grall

