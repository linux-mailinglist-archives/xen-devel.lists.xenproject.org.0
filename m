Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DCF23751DD
	for <lists+xen-devel@lfdr.de>; Thu,  6 May 2021 11:58:49 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.123405.232734 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leamA-0007Md-Gu; Thu, 06 May 2021 09:58:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 123405.232734; Thu, 06 May 2021 09:58:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1leamA-0007K3-Dc; Thu, 06 May 2021 09:58:34 +0000
Received: by outflank-mailman (input) for mailman id 123405;
 Thu, 06 May 2021 09:58:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EnkQ=KB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1leam8-0007Jv-Lr
 for xen-devel@lists.xenproject.org; Thu, 06 May 2021 09:58:32 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id c6d73a61-f6dc-4d8e-b965-465957ebd4de;
 Thu, 06 May 2021 09:58:31 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id EAEC9AFE5;
 Thu,  6 May 2021 09:58:30 +0000 (UTC)
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
X-Inumbo-ID: c6d73a61-f6dc-4d8e-b965-465957ebd4de
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1620295111; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QUOUlIUOvJykJmlLzC6jcydGahCRVB5E9NbdpyDKMzI=;
	b=oL+5pMen2EjjLiwJJ3/8qqYWB17gwl62bpwVa+kIpHz74UE18w0dAgYxM+jzKakojFy7+G
	QO5+36FPxY+OQrnfX81rGPJXbO4amK9S5JHvC9o9LCm319Dl7umSsLpMPWckRW7rLZZyfV
	aUsmbZB5mKU10EnenWCFimvTGCGh9mk=
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <8fada713-9ae5-ddd3-585b-0f090748fc49@suse.com>
Date: Thu, 6 May 2021 11:58:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <9E7D7B58-0ABA-4800-B2D3-9EE3E29CF599@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 06.05.2021 10:48, Luca Fancellu wrote:
>> On 4 May 2021, at 23:27, Stefano Stabellini <sstabellini@kernel.org> wrote:
>> On Tue, 4 May 2021, Luca Fancellu wrote:
>>> @@ -51,13 +55,10 @@
>>>  * know the real machine address of a page it is sharing. This makes
>>>  * it possible to share memory correctly with domains running in
>>>  * fully virtualised memory.
>>> - */
>>> -
>>> -/***********************************
>>> + *
>>>  * GRANT TABLE REPRESENTATION
>>> - */
>>> -
>>> -/* Some rough guidelines on accessing and updating grant-table entries
>>> + *
>>> + * Some rough guidelines on accessing and updating grant-table entries
>>>  * in a concurrency-safe manner. For more information, Linux contains a
>>>  * reference implementation for guest OSes (drivers/xen/grant_table.c, see
>>>  * http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/xen/grant-table.c;hb=HEAD
>>> @@ -66,6 +67,7 @@
>>>  *     compiler barrier will still be required.
>>>  *
>>>  * Introducing a valid entry into the grant table:
>>> + * @keepindent
>>>  *  1. Write ent->domid.
>>>  *  2. Write ent->frame:
>>>  *      GTF_permit_access:   Frame to which access is permitted.
>>> @@ -73,20 +75,25 @@
>>>  *                           frame, or zero if none.
>>>  *  3. Write memory barrier (WMB).
>>>  *  4. Write ent->flags, inc. valid type.
>>> + * @endkeepindent
>>>  *
>>>  * Invalidating an unused GTF_permit_access entry:
>>> + * @keepindent
>>>  *  1. flags = ent->flags.
>>>  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>  *  NB. No need for WMB as reuse of entry is control-dependent on success of
>>>  *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
>>> + * @endkeepindent
>>>  *
>>>  * Invalidating an in-use GTF_permit_access entry:
>>> + *
>>>  *  This cannot be done directly. Request assistance from the domain controller
>>>  *  which can set a timeout on the use of a grant entry and take necessary
>>>  *  action. (NB. This is not yet implemented!).
>>>  *
>>>  * Invalidating an unused GTF_accept_transfer entry:
>>> + * @keepindent
>>>  *  1. flags = ent->flags.
>>>  *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>> @@ -97,18 +104,24 @@
>>>  *      transferred frame is written. It is safe for the guest to spin waiting
>>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>>  *      ent->flags).
>>> + * @endkeepindent
>>>  *
>>>  * Invalidating a committed GTF_accept_transfer entry:
>>>  *  1. Wait for (ent->flags & GTF_transfer_completed).
>>>  *
>>>  * Changing a GTF_permit_access from writable to read-only:
>>> + *
>>>  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>>>  *
>>>  * Changing a GTF_permit_access from read-only to writable:
>>> + *
>>>  *  Use SMP-safe bit-setting instruction.
>>> + *
>>> + * @addtogroup grant_table Grant Tables
>>> + * @{
>>>  */
>>>
>>> -/*
>>> +/**
>>>  * Reference to a grant entry in a specified domain's grant table.
>>>  */
>>> typedef uint32_t grant_ref_t;
>>
>> Just below this typedef there is the following comment:
>>
>> /*
>> * A grant table comprises a packed array of grant entries in one or more
>> * page frames shared between Xen and a guest.
>> * [XEN]: This field is written by Xen and read by the sharing guest.
>> * [GST]: This field is written by the guest and read by Xen.
>> */
>>
>> I noticed it doesn't appear in the output html. Any way we can retain it
>> somewhere? Maybe we have to move it together with the larger comment
>> above?
> 
> I agree with you, this comment should appear in the html docs, but to do so
> It has to be moved together with the larger comment above.
> 
> In the original patch it was like that but I had to revert it back due to objection, my proposal is
> to put it together with the larger comment and write something like this to
> maintain a good readability:
> 
>    *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>    *
>    * Changing a GTF_permit_access from read-only to writable:
>    *
>    *  Use SMP-safe bit-setting instruction.
> + *
> + * A grant table comprises a packed array of grant entries in one or more
> + * page frames shared between Xen and a guest.

I think if this part was moved to the top of this big comment while ...

> + * Data structure fields or defines described below have the following tags:
> + * * [XEN]: This field is written by Xen and read by the sharing guest.
> + * * [GST]: This field is written by the guest and read by Xen.

... this part was, as suggested by you, left near its bottom, I could
agree.

However, you making this suggestion caused me to look more closely at
what the comments actually describe. If there's effort to make the
documentation easier accessible by extracting it from the header, I
wonder whether - like with the v1 vs v2 comment pointed out previously
as misleading - we shouldn't, as a prereq step, make an attempt to
actually have the documentation be correct. For example I found this:

/*
 * Version 1 and version 2 grant entries share a common prefix.  The
 * fields of the prefix are documented as part of struct
 * grant_entry_v1.
 */
struct grant_entry_header {
    uint16_t flags;
    domid_t  domid;
};

The comment is wrong. "flags" here is only holding what's tagged
[GST] for v1. The [XEN] tagged bits actually live in grant_status_t.
This can perhaps best be seen in gnttab_set_version()'s code
dealing with the first 8 entries. However, contrary to v2's
intentions, GTF_transfer_committed and GTF_transfer_completed (which
aren't properly tagged either way) get set by Xen in shared entries,
not status ones. Maybe this was considered "okay" because the frame
field also gets written in this case (i.e. the cache line will get
dirtied in any event).

Similarly I'd like to refer to my still pending "gnttab: GTF_sub_page
is a v2-only flag", which also corrects documentation in this regard.
And perhaps there's more.

An alternative to correcting the (as it seems) v2 related issues, it
may be worth considering to extract only v1 documentation in this
initial phase.

Jan

