Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB073755EA
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 16:50:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123629.233219 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefJn-0003lO-Tq; Thu, 06 May 2021 14:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123629.233219; Thu, 06 May 2021 14:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lefJn-0003im-Qb; Thu, 06 May 2021 14:49:35 +0000
Received: by outflank-mailman (input) for mailman id 123629;
 Thu, 06 May 2021 14:49:34 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnkQ=KB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lefJm-0003ig-A0
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 14:49:34 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bcaeb701-3a31-4c01-b779-095b100a0db7;
 Thu, 06 May 2021 14:49:33 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 34087B201;
 Thu,  6 May 2021 14:49:32 +0000 (UTC)
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
X-Inumbo-ID: bcaeb701-3a31-4c01-b779-095b100a0db7
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620312572; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pAtdHnFg6XXrZdcey6Qvh/5tLAWYrPESQ9+K1HaRcSs=;
	b=dpzYtN+uLlWM9+tEoxzqMi0UN/XwwIZaXZHSLHNhW3T+7PgCr3kJa4ThNi8LfSrtt+9drM
	DRmuhqzgnjOu0ll99T/vhTW5JpWSCW4O31J6Fq3nszcfy0/JysY4UE1Q+nFReDLQPepKEM
	UNTk1iLxuV9eKT9DhIARPxKZJcGUjHw=
Subject: Re: [PATCH v5 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: xen-devel@lists.xenproject.org,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20210504133145.767-1-luca.fancellu@arm.com>
 <20210504133145.767-4-luca.fancellu@arm.com>
 <alpine.DEB.2.21.2105041514260.5018@sstabellini-ThinkPad-T480s>
 <9E7D7B58-0ABA-4800-B2D3-9EE3E29CF599@arm.com>
 <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
 <BFE99431-6929-4A14-BE57-BFD6D6AA2997@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <b66c7973-385d-2380-21f6-8948cca7f5c7@suse.com>
Date: Thu, 6 May 2021 16:49:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <BFE99431-6929-4A14-BE57-BFD6D6AA2997@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 06.05.2021 16:43, Luca Fancellu wrote:
>> On 6 May 2021, at 10:58, Jan Beulich <jbeulich@suse.com> wrote:
>> On 06.05.2021 10:48, Luca Fancellu wrote:
>>>> On 4 May 2021, at 23:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>>> On Tue, 4 May 2021, Luca Fancellu wrote:
>>>>> @@ -51,13 +55,10 @@
>>>>> * know the real machine address of a page it is sharing. This makes
>>>>> * it possible to share memory correctly with domains running in
>>>>> * fully virtualised memory.
>>>>> - */
>>>>> -
>>>>> -/***********************************
>>>>> + *
>>>>> * GRANT TABLE REPRESENTATION
>>>>> - */
>>>>> -
>>>>> -/* Some rough guidelines on accessing and updating grant-table entries
>>>>> + *
>>>>> + * Some rough guidelines on accessing and updating grant-table entries
>>>>> * in a concurrency-safe manner. For more information, Linux contains a
>>>>> * reference implementation for guest OSes (drivers/xen/grant_table.c, see
>>>>> * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
>>>>> @@ -66,6 +67,7 @@
>>>>> *     compiler barrier will still be required.
>>>>> *
>>>>> * Introducing a valid entry into the grant table:
>>>>> + * @keepindent
>>>>> *  1. Write ent->domid.
>>>>> *  2. Write ent->frame:
>>>>> *      GTF_permit_access:   Frame to which access is permitted.
>>>>> @@ -73,20 +75,25 @@
>>>>> *                           frame, or zero if none.
>>>>> *  3. Write memory barrier (WMB).
>>>>> *  4. Write ent->flags, inc. valid type.
>>>>> + * @endkeepindent
>>>>> *
>>>>> * Invalidating an unused GTF_permit_access entry:
>>>>> + * @keepindent
>>>>> *  1. flags = ent->flags.
>>>>> *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>>> *  NB. No need for WMB as reuse of entry is control-dependent on success of
>>>>> *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
>>>>> + * @endkeepindent
>>>>> *
>>>>> * Invalidating an in-use GTF_permit_access entry:
>>>>> + *
>>>>> *  This cannot be done directly. Request assistance from the domain controller
>>>>> *  which can set a timeout on the use of a grant entry and take necessary
>>>>> *  action. (NB. This is not yet implemented!).
>>>>> *
>>>>> * Invalidating an unused GTF_accept_transfer entry:
>>>>> + * @keepindent
>>>>> *  1. flags = ent->flags.
>>>>> *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>>>> *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>>> @@ -97,18 +104,24 @@
>>>>> *      transferred frame is written. It is safe for the guest to spin waiting
>>>>> *      for this to occur (detect by observing GTF_transfer_completed in
>>>>> *      ent->flags).
>>>>> + * @endkeepindent
>>>>> *
>>>>> * Invalidating a committed GTF_accept_transfer entry:
>>>>> *  1. Wait for (ent->flags & GTF_transfer_completed).
>>>>> *
>>>>> * Changing a GTF_permit_access from writable to read-only:
>>>>> + *
>>>>> *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>>>>> *
>>>>> * Changing a GTF_permit_access from read-only to writable:
>>>>> + *
>>>>> *  Use SMP-safe bit-setting instruction.
>>>>> + *
>>>>> + * @addtogroup grant_table Grant Tables
>>>>> + * @{
>>>>> */
>>>>>
>>>>> -/*
>>>>> +/**
>>>>> * Reference to a grant entry in a specified domain's grant table.
>>>>> */
>>>>> typedef uint32_t grant_ref_t;
>>>>
>>>> Just below this typedef there is the following comment:
>>>>
>>>> /*
>>>> * A grant table comprises a packed array of grant entries in one or more
>>>> * page frames shared between Xen and a guest.
>>>> * [XEN]: This field is written by Xen and read by the sharing guest.
>>>> * [GST]: This field is written by the guest and read by Xen.
>>>> */
>>>>
>>>> I noticed it doesn't appear in the output html. Any way we can retain it
>>>> somewhere? Maybe we have to move it together with the larger comment
>>>> above?
>>>
>>> I agree with you, this comment should appear in the html docs, but to do so
>>> It has to be moved together with the larger comment above.
>>>
>>> In the original patch it was like that but I had to revert it back due to objection, my proposal is
>>> to put it together with the larger comment and write something like this to
>>> maintain a good readability:
>>>
>>>   *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>>>   *
>>>   * Changing a GTF_permit_access from read-only to writable:
>>>   *
>>>   *  Use SMP-safe bit-setting instruction.
>>> + *
>>> + * A grant table comprises a packed array of grant entries in one or more
>>> + * page frames shared between Xen and a guest.
>>
>> I think if this part was moved to the top of this big comment while ...
>>
>>> + * Data structure fields or defines described below have the following tags:
>>> + * * [XEN]: This field is written by Xen and read by the sharing guest.
>>> + * * [GST]: This field is written by the guest and read by Xen.
>>
>> ... this part was, as suggested by you, left near its bottom, I could
>> agree.
> 
> Hi Jan,
> 
> Just to be sure that we are on the same page, something like this could be ok?
> 
>  * fully virtualised memory.
>  *
>  * GRANT TABLE REPRESENTATION
>  *
> + * A grant table comprises a packed array of grant entries in one or more
> + * page frames shared between Xen and a guest.
> + *
>  * Some rough guidelines on accessing and updating grant-table entries
>  * in a concurrency-safe manner. For more information, Linux contains a
> […]
>  * Changing a GTF_permit_access from read-only to writable:
>  *
>  *  Use SMP-safe bit-setting instruction.
>  *
> + * Data structure fields or defines described below have the following tags:
> + * * [XEN]: This field is written by Xen and read by the sharing guest.
> + * * [GST]: This field is written by the guest and read by Xen.
>  *
>  * @addtogroup grant_table Grant Tables
>  * @{

I think so, yes. Thanks.

Jan

