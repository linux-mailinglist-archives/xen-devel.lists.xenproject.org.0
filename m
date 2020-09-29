Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDA927D44B
	for <lists+xen-devel@lfdr.de>; Tue, 29 Sep 2020 19:18:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.319.909 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kNJGV-0003jP-TY; Tue, 29 Sep 2020 17:18:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 319.909; Tue, 29 Sep 2020 17:18:11 +0000
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
	id 1kNJGV-0003j0-Pw; Tue, 29 Sep 2020 17:18:11 +0000
Received: by outflank-mailman (input) for mailman id 319;
 Tue, 29 Sep 2020 17:18:10 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kNJGT-0003iu-Tp
 for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:18:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 38f4487e-9cfb-455c-91a4-5aa782a166e1;
 Tue, 29 Sep 2020 17:18:08 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNJGP-0008IW-EZ; Tue, 29 Sep 2020 17:18:05 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kNJGP-0000ei-4W; Tue, 29 Sep 2020 17:18:05 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57] helo=us1-amaz-eas2.inumbo.com)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=pXYx=DG=xen.org=julien@srs-us1.protection.inumbo.net>)
	id 1kNJGT-0003iu-Tp
	for xen-devel@lists.xenproject.org; Tue, 29 Sep 2020 17:18:09 +0000
X-Inumbo-ID: 38f4487e-9cfb-455c-91a4-5aa782a166e1
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
	id 38f4487e-9cfb-455c-91a4-5aa782a166e1;
	Tue, 29 Sep 2020 17:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=h/e/NyqCO5W4bbu7MG0fJPjheZPoZZTs7AowXjolJag=; b=CXbSlXx3DAZo++tqTddeKBsdck
	gb1TjTBOMwPpLW23hAnyZx4POvd3fX2s6XgIvuhXuwl0DdHrVoYULCqioCHjwW05Jepym59DCXj+d
	80HYACaEJHFzCqPDM01me5qxhSVzYPrgOVYxcpqHQjo8z+VYOxvOI4gtR5POWndiyVnU=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNJGP-0008IW-EZ; Tue, 29 Sep 2020 17:18:05 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <julien@xen.org>)
	id 1kNJGP-0000ei-4W; Tue, 29 Sep 2020 17:18:05 +0000
Subject: Re: [PATCH 11/12] evtchn: convert vIRQ lock to an r/w one
To: Jan Beulich <jbeulich@suse.com>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <George.Dunlap@eu.citrix.com>, Ian Jackson
 <iwj@xenproject.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <0d5ffc89-4b04-3e06-e950-f0cb171c7419@suse.com>
 <6e529147-2a76-bc28-ac16-21fc9a2c8f03@suse.com>
 <56faf769-d305-22d3-c3fe-2f9d767f0f07@xen.org>
 <60490a6c-593b-7aed-5e83-b0418500eed2@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <c4de244b-417e-39cb-59b0-dbda7108dc21@xen.org>
Date: Tue, 29 Sep 2020 18:18:03 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <60490a6c-593b-7aed-5e83-b0418500eed2@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 29/09/2020 14:37, Jan Beulich wrote:
> On 29.09.2020 15:03, Julien Grall wrote:
>> On 28/09/2020 12:02, Jan Beulich wrote:
>>> There's no need to serialize all sending of vIRQ-s; all that's needed
>>> is serialization against the closing of the respective event channels
>>> (by means of a barrier). To facilitate the conversion, introduce a new
>>> rw_barrier().
>>
>> Looking at the code below, all the spin_lock() have been replaced by a
>> read_lock_*(). This is a bit surprising,
> 
> It is, I agree, but that's what it ends up being. It is my understanding
> that the lock really only exists for the purpose of the barrier in
> evtchn_close().
> 
>>> --- a/xen/common/spinlock.c
>>> +++ b/xen/common/spinlock.c
>>> @@ -2,7 +2,7 @@
>>>    #include <xen/irq.h>
>>>    #include <xen/smp.h>
>>>    #include <xen/time.h>
>>> -#include <xen/spinlock.h>
>>> +#include <xen/rwlock.h>
>>
>> I would prefer if keep including <xen/spinlock.h> as the fact
>> <xen/rwlock.h> include it is merely an implementation details.
> 
> Can do, sure.
> 
>>> @@ -334,6 +334,12 @@ void _spin_unlock_recursive(spinlock_t *
>>>        }
>>>    }
>>>    
>>> +void _rw_barrier(rwlock_t *lock)
>>> +{
>>> +    check_barrier(&lock->lock.debug);
>>> +    do { smp_mb(); } while ( _rw_is_locked(lock) );
>>> +}
>>
>> Why do you need to call smp_mb() at each loop? Would not it be
>> sufficient to write something similar to spin_barrier(). I.e:
>>
>> smp_mb();
>> while ( _rw_is_locked(lock) )
>>     cpu_relax();
>> smp_mb();
> 
> Yes, this looks to be possible. Both for this and the question
> below it may be relevant to know that this patch pre-dates the
> conversion to ticket locks by quite a bit. Hence the construct
> above resembles the _spin_barrier() back at the time.
> 
>> But I wonder if there is a risk with either implementation for
>> _rw_is_locked() to always return true and therefore never end.
>>
>> Let say we receive an interrupt, by the time it is handled, the
>> read/lock may have been taken again.
> 
> With non-ticket locks I would say there was the same issue. But
> yes, ...

Most likely yes.

> 
>> spin_barrier() seems to handle this situation fine because it just wait
>> for the head to change. I don't think we can do the same here...
>>
>> I am thinking that it may be easier to hold the write lock when doing
>> the update.
> 
> ... perhaps this is indeed better. I have to admit that I never
> fully understood the benefit of using spin_barrier() in this code
> (as opposed to the use in evtchn_destroy()).

I am not entirely sure either. It looks like it is an attempt to make 
v->virq_to_evtchn[X] visible without holding a lock.

Any holder of the lock after spin_barrier() has completed will read 0 
and not try to use the lock.

But the update of v->virq_to_evtchn[X] should have used either 
ACCESS_ONCE() or write_atomic().

Cheers,

-- 
Julien Grall

