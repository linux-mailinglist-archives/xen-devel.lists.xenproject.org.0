Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 407812803C4
	for <lists+xen-devel@lfdr.de>; Thu,  1 Oct 2020 18:22:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1451.4561 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kO1Ku-000199-SN; Thu, 01 Oct 2020 16:21:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1451.4561; Thu, 01 Oct 2020 16:21:40 +0000
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
	id 1kO1Ku-00018k-On; Thu, 01 Oct 2020 16:21:40 +0000
Received: by outflank-mailman (input) for mailman id 1451;
 Thu, 01 Oct 2020 16:21:39 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kO1Kt-00018f-9y
 for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:21:39 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 58177a19-272d-4f9d-bd5a-9fee4fc7ee5e;
 Thu, 01 Oct 2020 16:21:38 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO1Kp-0002Pc-R4; Thu, 01 Oct 2020 16:21:35 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kO1Kp-0008KT-H1; Thu, 01 Oct 2020 16:21:35 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=gWzX=DI=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kO1Kt-00018f-9y
	for xen-devel@lists.xenproject.org; Thu, 01 Oct 2020 16:21:39 +0000
X-Inumbo-ID: 58177a19-272d-4f9d-bd5a-9fee4fc7ee5e
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 58177a19-272d-4f9d-bd5a-9fee4fc7ee5e;
	Thu, 01 Oct 2020 16:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=rpw7CLr1ofwoC9m8MtvRNT24F+koh0FBsuE/Jf13sfE=; b=2Kcemwl0ddV+ybld1ZOm5FCZNF
	AdS0eiyouynTN/USgu1BZcekcm/M9gEt8V3tk+YZeNCHcNL1c4acYh58QlisN9w8JCmOd9oYOwoPj
	Z1l9UZRd+72kJopxfHyw1d0SbHiCNnV3lD7arSYcMcYj6smQ1mY9qCn1AvinUDNvVdpk=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO1Kp-0002Pc-R4; Thu, 01 Oct 2020 16:21:35 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kO1Kp-0008KT-H1; Thu, 01 Oct 2020 16:21:35 +0000
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>, paul@xen.org
Cc: xen-devel@lists.xenproject.org,
 'Andrew Cooper' <andrew.cooper3@citrix.com>,
 'George Dunlap' <George.Dunlap@eu.citrix.com>,
 'Ian Jackson' <iwj@xenproject.org>, 'Wei Liu' <wl@xen.org>,
 'Stefano Stabellini' <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <004b01d696ff$76873e50$6395baf0$@xen.org>
 <92d2714b-d762-2f15-086f-58257e3336a8@suse.com>
 <006401d69707$062a5090$127ef1b0$@xen.org>
 <3626d65c-bd5d-f65e-61ca-451110761258@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <f55cb87f-418d-61fa-65f1-0e746071fe37@xen.org>
Date: Thu, 1 Oct 2020 17:21:33 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <3626d65c-bd5d-f65e-61ca-451110761258@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 30/09/2020 11:16, Jan Beulich wrote:
> On 30.09.2020 10:52, Paul Durrant wrote:
>> Looking again, given that both send_guest_vcpu_virq() and
>> send_guest_global_virq() (rightly) hold the evtchn lock before
>> calling evtchn_port_set_pending() I think you could do away with
>> the virq lock by adding checks in those functions to verify
>> evtchn->state == ECS_VIRQ and u.virq == virq after having
>> acquired the channel lock but before calling
>> evtchn_port_set_pending().
> 
> I don't think so: The adjustment of v->virq_to_evtchn[] in
> evtchn_close() would then happen with just the domain's event
> lock held, which the sending paths don't use at all. The per-
> channel lock gets acquired in evtchn_close() a bit later only
> (and this lock can't possibly protect per-vCPU state).
> 
> In fact I'm now getting puzzled by evtchn_bind_virq() updating
> this array with (just) the per-domain lock held. Since it's
> the last thing in the function, there's technically no strict
> need for acquiring the vIRQ lock,

Well, we at least need to prevent the compiler to tear the store/load. 
If we don't use a lock, then we would should use ACCESS_ONCE() or 
{read,write}_atomic() for all the usage.

> but holding the event lock
> definitely doesn't help.

It helps because spin_unlock() and write_unlock() use the same barrier 
(arch_lock_release_barrier()). So ...

> All that looks to be needed is the
> barrier implied from write_unlock().

No barrier should be necessary. Although, I would suggest to add a 
comment explaining it.

Cheers,

-- 
Julien Grall

