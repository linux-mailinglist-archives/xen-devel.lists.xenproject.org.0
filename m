Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0196B27F0B1
	for <lists+xen-devel@lfdr.de>; Wed, 30 Sep 2020 19:48:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.852.2907 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNgCy-0004aZ-Gw; Wed, 30 Sep 2020 17:48:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 852.2907; Wed, 30 Sep 2020 17:48:04 +0000
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
	id 1kNgCy-0004aA-DW; Wed, 30 Sep 2020 17:48:04 +0000
Received: by outflank-mailman (input) for mailman id 852;
 Wed, 30 Sep 2020 17:48:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNgCw-0004a5-Gf
 for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:48:02 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 77d811f4-bba5-4057-a351-b1aa34b25e92;
 Wed, 30 Sep 2020 17:48:01 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNgCg-0008LH-Tx; Wed, 30 Sep 2020 17:47:46 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNgCg-0004NF-KX; Wed, 30 Sep 2020 17:47:46 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=I3vy=DH=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNgCw-0004a5-Gf
	for xen-devel@lists.xenproject.org; Wed, 30 Sep 2020 17:48:02 +0000
X-Inumbo-ID: 77d811f4-bba5-4057-a351-b1aa34b25e92
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 77d811f4-bba5-4057-a351-b1aa34b25e92;
	Wed, 30 Sep 2020 17:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=MzGs+t1btdkIXoc1hZnZxaqTvzUwP2Oo8fmnt+tdJco=; b=l08q161ewQQlzFmwxLGWrjQAgZ
	vUhE3gJb3cmGeUXux8RfzvQ0Gs8CnWTQXm0wGmHRzhRlHhmJIs4kZrWzHZ6VeUo2dVGqugg1SYr1j
	a+4QjdUtbndqBKNlC+4et4r7vLO2QAKbE3Nvv7SDb3HY6VJ7eLnEtVqZba536pr4oQHs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNgCg-0008LH-Tx; Wed, 30 Sep 2020 17:47:46 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNgCg-0004NF-KX; Wed, 30 Sep 2020 17:47:46 +0000
Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
To: Oleksandr <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: paul@xen.org, 'Oleksandr Tyshchenko' <oleksandr_tyshchenko@epam.com>,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <george.dunlap@citrix.com>,
 'Ian Jackson' <ian.jackson@eu.citrix.com>, 'Jan Beulich'
 <jbeulich@suse.com>, 'Stefano Stabellini' <sstabellini@kernel.org>,
 'Wei Liu' <wl@xen.org>, =?UTF-8?B?J1JvZ2VyIFBhdSBNb25uw6kn?=
 <roger.pau@citrix.com>, 'Jun Nakajima' <jun.nakajima@intel.com>,
 'Kevin Tian' <kevin.tian@intel.com>, 'Tim Deegan' <tim@xen.org>,
 'Julien Grall' <julien.grall@arm.com>
References: <1599769330-17656-1-git-send-email-olekstysh@gmail.com>
 <1599769330-17656-3-git-send-email-olekstysh@gmail.com>
 <3997a705-ccb1-4b8f-41ca-c5507360c759@xen.org>
 <000201d69314$97bd8fa0$c738aee0$@xen.org>
 <c9131bce-f028-2824-9ffc-b4db08017569@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <2cbe7efd-f356-0f1b-0bb1-bfb2243f180c@xen.org>
Date: Wed, 30 Sep 2020 18:47:43 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <c9131bce-f028-2824-9ffc-b4db08017569@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

On 30/09/2020 14:39, Oleksandr wrote:
> 
> Hi Julien
> 
> On 25.09.20 11:19, Paul Durrant wrote:
>>> -----Original Message-----
>>> From: Julien Grall <julien@xen.org>
>>> Sent: 24 September 2020 19:01
>>> To: Oleksandr Tyshchenko <olekstysh@gmail.com>; 
>>> xen-devel@lists.xenproject.org
>>> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>; Andrew 
>>> Cooper <andrew.cooper3@citrix.com>;
>>> George Dunlap <george.dunlap@citrix.com>; Ian Jackson 
>>> <ian.jackson@eu.citrix.com>; Jan Beulich
>>> <jbeulich@suse.com>; Stefano Stabellini <sstabellini@kernel.org>; Wei 
>>> Liu <wl@xen.org>; Roger Pau
>>> Monné <roger.pau@citrix.com>; Paul Durrant <paul@xen.org>; Jun 
>>> Nakajima <jun.nakajima@intel.com>;
>>> Kevin Tian <kevin.tian@intel.com>; Tim Deegan <tim@xen.org>; Julien 
>>> Grall <julien.grall@arm.com>
>>> Subject: Re: [PATCH V1 02/16] xen/ioreq: Make x86's IOREQ feature common
>>>
>>>
>>>
>>> On 10/09/2020 21:21, Oleksandr Tyshchenko wrote:
>>>> +static bool hvm_wait_for_io(struct hvm_ioreq_vcpu *sv, ioreq_t *p)
>>>> +{
>>>> +    unsigned int prev_state = STATE_IOREQ_NONE;
>>>> +    unsigned int state = p->state;
>>>> +    uint64_t data = ~0;
>>>> +
>>>> +    smp_rmb();
>>>> +
>>>> +    /*
>>>> +     * The only reason we should see this condition be false is 
>>>> when an
>>>> +     * emulator dying races with I/O being requested.
>>>> +     */
>>>> +    while ( likely(state != STATE_IOREQ_NONE) )
>>>> +    {
>>>> +        if ( unlikely(state < prev_state) )
>>>> +        {
>>>> +            gdprintk(XENLOG_ERR, "Weird HVM ioreq state transition 
>>>> %u -> %u\n",
>>>> +                     prev_state, state);
>>>> +            sv->pending = false;
>>>> +            domain_crash(sv->vcpu->domain);
>>>> +            return false; /* bail */
>>>> +        }
>>>> +
>>>> +        switch ( prev_state = state )
>>>> +        {
>>>> +        case STATE_IORESP_READY: /* IORESP_READY -> NONE */
>>>> +            p->state = STATE_IOREQ_NONE;
>>>> +            data = p->data;
>>>> +            break;
>>>> +
>>>> +        case STATE_IOREQ_READY:  /* IOREQ_{READY,INPROCESS} -> 
>>>> IORESP_READY */
>>>> +        case STATE_IOREQ_INPROCESS:
>>>> +            wait_on_xen_event_channel(sv->ioreq_evtchn,
>>>> +                                      ({ state = p->state;
>>>> +                                         smp_rmb();
>>>> +                                         state != prev_state; }));
>>>> +            continue;
>>> As I pointed out previously [1], this helper was implemented with the
>>> expectation that wait_on_xen_event_channel() will not return if the vCPU
>>> got rescheduled.
>>>
>>> However, this assumption doesn't hold on Arm.
>>>
>>> I can see two solution:
>>>      1) Re-execute the caller
>>>      2) Prevent an IOREQ to disappear until the loop finish.
>>>
>>> @Paul any opinions?
>> The ioreq control plane is largely predicated on there being no 
>> pending I/O when the state of a server is modified, and it is assumed 
>> that domain_pause() is sufficient to achieve this. If that assumption 
>> doesn't hold then we need additional synchronization.

I don't think this assumption even hold on x86 because domain_pause() 
will not wait for I/O to finish.

On x86, the context switch will reset the stack and therefore 
wait_on_xen_event_channel() is not going to return. Instead, 
handle_hvm_io_completion() will be called from the tail callback in 
context_switch(). get_pending_vcpu() would return NULL as the IOREQ 
server disappeared. Although, it is not clear whether the vCPU will 
continue to run (or not).

Did I miss anything?

Regarding the fix itself, I am not sure what sort of synchronization we 
can do. Are you suggesting to wait for the I/O to complete? If so, how 
do we handle the case the IOREQ server died?

> May I please clarify whether a concern still stands (with what was said 
> above) and we need an additional synchronization on Arm?

Yes the concern is still there (See above).

Cheers,

-- 
Julien Grall

