Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E27132901FE
	for <lists+xen-devel@lfdr.de>; Fri, 16 Oct 2020 11:36:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.7856.20705 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTM9z-0006Qc-FS; Fri, 16 Oct 2020 09:36:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 7856.20705; Fri, 16 Oct 2020 09:36:27 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kTM9z-0006QD-CO; Fri, 16 Oct 2020 09:36:27 +0000
Received: by outflank-mailman (input) for mailman id 7856;
 Fri, 16 Oct 2020 09:36:26 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kTM9y-0006Q8-1h
 for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:36:26 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d477dd66-b8c6-47ac-a53c-579a8a7bd0ac;
 Fri, 16 Oct 2020 09:36:24 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTM9u-0008LW-BY; Fri, 16 Oct 2020 09:36:22 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kTM9t-000350-UV; Fri, 16 Oct 2020 09:36:22 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=VWaZ=DX=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kTM9y-0006Q8-1h
	for xen-devel@lists.xenproject.org; Fri, 16 Oct 2020 09:36:26 +0000
X-Inumbo-ID: d477dd66-b8c6-47ac-a53c-579a8a7bd0ac
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d477dd66-b8c6-47ac-a53c-579a8a7bd0ac;
	Fri, 16 Oct 2020 09:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=lrxXi9tez9sKle2WYq+9PsfzqQ5P97Rz7neO5OHVW2Q=; b=3BhTvwZRboR+pRwVCbp4vWVnFt
	Qh3Uip15APc5EriNUe9Dlz+Psr6Qv2yMsa2fC513Dl3V4gj7mAMJdKni4vrGH3qcrdudZbIbZ4IQf
	Gw5WmnlNe/MYqxxrcrtMDUe3wMvsNua1DraeOTQHdqhn352FJ+47ljgYZdBVWmpPlBzs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTM9u-0008LW-BY; Fri, 16 Oct 2020 09:36:22 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kTM9t-000350-UV; Fri, 16 Oct 2020 09:36:22 +0000
Subject: Re: [PATCH v2 1/2] xen/events: access last_priority and last_vcpu_id
 together
To: Jan Beulich <jbeulich@suse.com>
Cc: =?UTF-8?B?SsO8cmdlbiBHcm/Dnw==?= <jgross@suse.com>,
 xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>
References: <20201012092740.1617-1-jgross@suse.com>
 <20201012092740.1617-2-jgross@suse.com>
 <9485004c-b739-5590-202b-c8e6f84e5e54@suse.com>
 <821a77d3-7e37-d1d2-d904-94db0177893a@suse.com>
 <350a5738-b239-e36b-59aa-05b8f86648b8@suse.com>
 <548f80a9-0fa3-cd9e-ec44-5cd37d98eadc@xen.org>
 <4f4ecc8d-f5d2-81e9-1615-0f2925b928ba@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <4b77ba6d-bf49-7286-8f2a-53f7b2e7d122@xen.org>
Date: Fri, 16 Oct 2020 10:36:18 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <4f4ecc8d-f5d2-81e9-1615-0f2925b928ba@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 15/10/2020 13:07, Jan Beulich wrote:
> On 14.10.2020 13:40, Julien Grall wrote:
>> Hi Jan,
>>
>> On 13/10/2020 15:26, Jan Beulich wrote:
>>> On 13.10.2020 16:20, Jürgen Groß wrote:
>>>> On 13.10.20 15:58, Jan Beulich wrote:
>>>>> On 12.10.2020 11:27, Juergen Gross wrote:
>>>>>> The queue for a fifo event is depending on the vcpu_id and the
>>>>>> priority of the event. When sending an event it might happen the
>>>>>> event needs to change queues and the old queue needs to be kept for
>>>>>> keeping the links between queue elements intact. For this purpose
>>>>>> the event channel contains last_priority and last_vcpu_id values
>>>>>> elements for being able to identify the old queue.
>>>>>>
>>>>>> In order to avoid races always access last_priority and last_vcpu_id
>>>>>> with a single atomic operation avoiding any inconsistencies.
>>>>>>
>>>>>> Signed-off-by: Juergen Gross <jgross@suse.com>
>>>>>
>>>>> I seem to vaguely recall that at the time this seemingly racy
>>>>> access was done on purpose by David. Did you go look at the
>>>>> old commits to understand whether there really is a race which
>>>>> can't be tolerated within the spec?
>>>>
>>>> At least the comments in the code tell us that the race regarding
>>>> the writing of priority (not last_priority) is acceptable.
>>>
>>> Ah, then it was comments. I knew I read something to this effect
>>> somewhere, recently.
>>>
>>>> Especially Julien was rather worried by the current situation. In
>>>> case you can convince him the current handling is fine, we can
>>>> easily drop this patch.
>>>
>>> Julien, in the light of the above - can you clarify the specific
>>> concerns you (still) have?
>>
>> Let me start with that the assumption if evtchn->lock is not held when
>> evtchn_fifo_set_pending() is called. If it is held, then my comment is moot.
> 
> But this isn't interesting - we know there are paths where it is
> held, and ones (interdomain sending) where it's the remote port's
> lock instead which is held. What's important here is that a
> _consistent_ lock be held (but it doesn't need to be evtchn's).

Yes, a _consistent_ lock *should* be sufficient. But it is better to use 
the same lock everywhere so it is easier to reason (see more below).

> 
>>   From my understanding, the goal of lock_old_queue() is to return the
>> old queue used.
>>
>> last_priority and last_vcpu_id may be updated separately and I could not
>> convince myself that it would not be possible to return a queue that is
>> neither the current one nor the old one.
>>
>> The following could happen if evtchn->priority and
>> evtchn->notify_vcpu_id keeps changing between calls.
>>
>> pCPU0				| pCPU1
>> 				|
>> evtchn_fifo_set_pending(v0,...)	|
>> 				| evtchn_fifo_set_pending(v1, ...)
>>    [...]				|
>>    /* Queue has changed */	|
>>    evtchn->last_vcpu_id = v0 	|
>> 				| -> evtchn_old_queue()
>> 				| v = d->vcpu[evtchn->last_vcpu_id];
>>     				| old_q = ...
>> 				| spin_lock(old_q->...)
>> 				| v = ...
>> 				| q = ...
>> 				| /* q and old_q would be the same */
>> 				|
>>    evtchn->las_priority = priority|
>>
>> If my diagram is correct, then pCPU1 would return a queue that is
>> neither the current nor old one.
> 
> I think I agree.
> 
>> In which case, I think it would at least be possible to corrupt the
>> queue. From evtchn_fifo_set_pending():
>>
>>           /*
>>            * If this event was a tail, the old queue is now empty and
>>            * its tail must be invalidated to prevent adding an event to
>>            * the old queue from corrupting the new queue.
>>            */
>>           if ( old_q->tail == port )
>>               old_q->tail = 0;
>>
>> Did I miss anything?
> 
> I don't think you did. The important point though is that a consistent
> lock is being held whenever we come here, so two racing set_pending()
> aren't possible for one and the same evtchn. As a result I don't think
> the patch here is actually needed.

I haven't yet read in full details the rest of the patches to say 
whether this is necessary or not. However, at a first glance, I think 
this is not a sane to rely on different lock to protect us. And don't 
get me started on the lack of documentation...

Furthermore, the implementation of old_lock_queue() suggests that the 
code was planned to be lockless. Why would you need the loop otherwise?

Therefore, regardless the rest of the discussion, I think this patch 
would be useful to have for our peace of mind.

> 
> If I take this further, then I think I can reason why it wasn't
> necessary to add further locking to send_guest_{global,vcpu}_virq():
> The virq_lock is the "consistent lock" protecting ECS_VIRQ ports. The
> spin_barrier() while closing the port guards that side against the
> port changing to a different ECS_* behind the sending functions' backs.
> And binding such ports sets ->virq_to_evtchn[] last, with a suitable
> barrier (the unlock).

This makes sense.

> 
> Which leaves send_guest_pirq() before we can drop the IRQ-safe locking
> again. I guess we would need to work towards using the underlying
> irq_desc's lock as consistent lock here, but this certainly isn't the
> case just yet, and I'm not really certain this can be achieved.
I can't comment on the PIRQ code but I think this is a risky approach 
(see more above).

Cheers,

-- 
Julien Grall

