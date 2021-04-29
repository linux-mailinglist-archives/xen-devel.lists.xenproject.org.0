Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B265236E786
	for <lists+xen-devel@lfdr.de>; Thu, 29 Apr 2021 11:04:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.119797.226483 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2ae-00023l-3u; Thu, 29 Apr 2021 09:04:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 119797.226483; Thu, 29 Apr 2021 09:04:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lc2ae-00023M-0U; Thu, 29 Apr 2021 09:04:08 +0000
Received: by outflank-mailman (input) for mailman id 119797;
 Thu, 29 Apr 2021 09:04:06 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=xfjL=J2=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lc2ac-00023H-Pq
 for xen-devel@lists.xenproject.org; Thu, 29 Apr 2021 09:04:06 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9e3d16e3-ab0e-4c77-8ee9-8fe481de6eae;
 Thu, 29 Apr 2021 09:04:04 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 89683AE8D;
 Thu, 29 Apr 2021 09:04:03 +0000 (UTC)
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
X-Inumbo-ID: 9e3d16e3-ab0e-4c77-8ee9-8fe481de6eae
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1619687043; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XMf+4zQQ0ncV4K8/XY2rrqIbwGFQSKNYsoW5/w5lIDw=;
	b=rk1glSRJd+y/NPPJacZsgIphyVxHgKuqRelCyQ5q0HYqYo7yUsZXxkmXk7YElwU0y1gybX
	vC403CyndNTnkDefLDcIzfxzwqeUGTobc9NY4NiDt/9BcwxnmAF7KqvYPlhVIJigNVIq3T
	CHnQpe+Rqa/9BI6m1SYtOKSdk9a282A=
Subject: Re: [PATCH v3 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210426153741.26904-1-luca.fancellu@arm.com>
 <20210426153741.26904-4-luca.fancellu@arm.com>
 <eae12602-0616-9363-c8c6-ef6bbd78673c@suse.com>
 <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d50b05f7-f644-0123-9994-d31668bd5b5f@suse.com>
Date: Thu, 29 Apr 2021 11:04:01 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <E47AFE69-CA75-468D-868D-182F78C6992C@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 28.04.2021 16:59, Luca Fancellu wrote:
>> On 27 Apr 2021, at 14:57, Jan Beulich <jbeulich@suse.com> wrote:
>> On 26.04.2021 17:37, Luca Fancellu wrote:
>>> @@ -66,6 +67,7 @@
>>>  *     compiler barrier will still be required.
>>>  *
>>>  * Introducing a valid entry into the grant table:
>>> + * @code
>>>  *  1. Write ent->domid.
>>>  *  2. Write ent->frame:
>>>  *      GTF_permit_access:   Frame to which access is permitted.
>>> @@ -73,20 +75,25 @@
>>>  *                           frame, or zero if none.
>>>  *  3. Write memory barrier (WMB).
>>>  *  4. Write ent->flags, inc. valid type.
>>> + * @endcode
>>>  *
>>>  * Invalidating an unused GTF_permit_access entry:
>>> + * @code
>>>  *  1. flags = ent->flags.
>>>  *  2. Observe that !(flags & (GTF_reading|GTF_writing)).
>>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>>  *  NB. No need for WMB as reuse of entry is control-dependent on success of
>>>  *      step 3, and all architectures guarantee ordering of ctrl-dep writes.
>>> + * @endcode
>>>  *
>>>  * Invalidating an in-use GTF_permit_access entry:
>>> + *
>>>  *  This cannot be done directly. Request assistance from the domain controller
>>>  *  which can set a timeout on the use of a grant entry and take necessary
>>>  *  action. (NB. This is not yet implemented!).
>>>  *
>>>  * Invalidating an unused GTF_accept_transfer entry:
>>> + * @code
>>>  *  1. flags = ent->flags.
>>>  *  2. Observe that !(flags & GTF_transfer_committed). [*]
>>>  *  3. Check result of SMP-safe CMPXCHG(&ent->flags, flags, 0).
>>
>> Since neither in the cover letter nor in the description here I could
>> spot a link to the resulting generated doc, I wonder what the
>> inconsistencies above are about: You add @code/@endcode (and no blank
>> lines) to parts of what's being described, and _instead_ a blank line
>> to another part. I think the goal should be that not only the
>> generated doc ends up looking "nice", but that the source code also
>> remains consistent. Otherwise, someone like me coming across this
>> later on might easily conclude that there was a @code/@endcode pair
>> missed.
> 
> Yes I’ll explain better in the commit message, that part and other parts are
> enclosed by @code/@endcode because they are formatted using spaces.
> If the block is not enclosed the spaces are missing in the html page resulting
> In a mess.
> If you can suggest an alias for the @code/@endcode command, I can create
> it so that the user looking the source code can understand better what's going on.
> An example: @keepformat/@endkeepformat OR @keepindent/@endkeepindent

Oh, are you suggesting @code / @endcode isn't something doxygen mandates?
In this case either of your alternative suggestions would look better to
me. Which one depend on whether the goal to to merely keep indentation or
whether formatting should be kept altogether.

>>> @@ -97,18 +104,23 @@
>>>  *      transferred frame is written. It is safe for the guest to spin waiting
>>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>>  *      ent->flags).
>>> + * @endcode
>>>  *
>>>  * Invalidating a committed GTF_accept_transfer entry:
>>>  *  1. Wait for (ent->flags & GTF_transfer_completed).
>>>  *
>>
>> Why did this not also get enclosed by @code/@endcode?
> 
> In this case there are no spaces that contributes to the indentation.

But if, for consistency, @code / @endcode were added here, all would
still be well?

>>>  * Changing a GTF_permit_access from writable to read-only:
>>> + *
>>>  *  Use SMP-safe CMPXCHG to set GTF_readonly, while checking !GTF_writing.
>>>  *
>>>  * Changing a GTF_permit_access from read-only to writable:
>>> + *
>>>  *  Use SMP-safe bit-setting instruction.
>>
>> And these two?
> 
> These two lines makes the resulting html page looks better, the source code however
> seems not too impacted by the change though.

I was rather asking about the absence of @code / @endcode here.

>>> + * @addtogroup grant_table Grant Tables
>>
>> And no blank (comment) line ahead of this?
> 
> Here there is no need for a blank line in the comment, but if in your opinion the source
> code will look better I can add it

I think so, yes.

>>> @@ -120,24 +132,26 @@ typedef uint32_t grant_ref_t;
>>>  * [GST]: This field is written by the guest and read by Xen.
>>>  */
>>>
>>> -/*
>>> - * Version 1 of the grant table entry structure is maintained purely
>>> - * for backwards compatibility.  New guests should use version 2.
>>> - */
>>> #if __XEN_INTERFACE_VERSION__ < 0x0003020a
>>> #define grant_entry_v1 grant_entry
>>> #define grant_entry_v1_t grant_entry_t
>>> #endif
>>> +/**
>>> + * Version 1 of the grant table entry structure is maintained purely
>>> + * for backwards compatibility.  New guests should use version 2.
>>> + */
>>
>> In case I didn't say so already before - I think this would be a good
>> opportunity to drop the comment pointing at v2. With v2 optionally
>> unavailable altogether, this can't possibly be a generally valid
>> course of action.
> 
> Could you explain me better that? Do you want to get rid of this comment?

Especially the second sentence is misleading. If new code used v2, it
would not work on Xen with v2 support turned off.

> /**
> * Version 1 of the grant table entry structure is maintained purely
> * for backwards compatibility.  New guests should use version 2.
> */
> 
> In this case I don’t think this commit is the right place to do that, I can just
> put it back where it was so that the documentation simply doesn’t show that.

Keeping misleading information out of the docs is imo rather desirable.
Of course we should, independently of that, also address the misleading
information in the source code. I can accept that doing the adjustment
right in this patch may not be ideal. I don't suppose I could talk you
into adding a prereq patch dropping at least that 2nd sentence?

Jan

