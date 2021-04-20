Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF1936551A
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 11:15:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113410.216088 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmSj-0003Ey-Qw; Tue, 20 Apr 2021 09:14:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113410.216088; Tue, 20 Apr 2021 09:14:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYmSj-0003EZ-NK; Tue, 20 Apr 2021 09:14:29 +0000
Received: by outflank-mailman (input) for mailman id 113410;
 Tue, 20 Apr 2021 09:14:28 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYmSi-0003EU-Io
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 09:14:28 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 07e20466-2c81-4e25-bcec-a1cdf9778306;
 Tue, 20 Apr 2021 09:14:27 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A60B7AEE7;
 Tue, 20 Apr 2021 09:14:26 +0000 (UTC)
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
X-Inumbo-ID: 07e20466-2c81-4e25-bcec-a1cdf9778306
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618910066; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kbcl8vcjPy9kXVmjDwpVpgdRC4aOqedP4eAuRtc4iQY=;
	b=LQ565028EfdQ7y7OHUZHXahiU1QXWNhooSLizbCofygvy3wysG3u+cJOKzYlo7w17ccrsq
	x5IzgosdN7S+Wn/ofOfsbqN0SMqTrAp6Zyc0fzM+P7++0BiVFcl3jDlJNZt1/CK9gtjrFw
	q+GaESDUQlUxCI/iIVoKavrjADT8DpA=
Subject: Re: [PATCH v2 3/3] docs/doxygen: doxygen documentation for
 grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210419091231.55684-1-luca.fancellu@arm.com>
 <20210419091231.55684-4-luca.fancellu@arm.com>
 <c8e1022f-abb0-56f3-db37-5cec4d01dead@suse.com>
 <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
Date: Tue, 20 Apr 2021 11:14:22 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <0F26E53E-0C0A-4596-AC88-F803BC7A0493@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 10:46, Luca Fancellu wrote:
>> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>>
>> On 19.04.2021 11:12, Luca Fancellu wrote:
>>> Modification to include/public/grant_table.h:
>>>
>>> 1) Add doxygen tags to:
>>> - Create Grant tables section
>>> - include variables in the generated documentation
>>> 2) Add .rst file for grant table for Arm64
>>
>> I'm missing some reasoning about at least some of the changes done
>> to grant_table.h. Looking at this and the earlier patches I also
>> couldn't spot any general outline of what is acceptable or even
>> necessary in such a header to be understood by doxygen. Without
>> this written down somewhere (or, if documented elsewhere, a
>> pointer provided to that doc) I'm afraid things might get screwed
>> up again later on.
> 
> Doxygen is a tool that generates documentation based on parsing the source code comments, it recognises some
> commands in the comments and builds the documentation sticking to what you wrote.
> 
> Here the doxygen docs: https://www.doxygen.nl/manual/docblocks.html
> 
> Basically it doesn’t react to all comments, it parses only some well crafted comments as explained in its documentation.

Providing this link somewhere might be helpful. However, also seeing
some of your further comments, it feels like to edit a public header
enabled for doxygen one has to know fair parts of this documentation.
While I'm certainly in favor of having a way to generate docs from
the headers, I'm afraid I don't think such knowledge should become a
prereq to e.g. adding a new sub-function of a hypercall. So far I was
assuming that the formatting requirements would be quite limited, and
that it would hence be possible to just glean them from existing code.
But e.g. the "/**<" notation isn't going to be obvious to spot.

>>> --- a/docs/hypercall-interfaces/arm64.rst
>>> +++ b/docs/hypercall-interfaces/arm64.rst
>>> @@ -8,6 +8,7 @@ Starting points
>>> .. toctree::
>>>    :maxdepth: 2
>>>
>>> +   arm64/grant_tables
>>>
>>>
>>> Functions
>>> diff --git a/docs/hypercall-interfaces/arm64/grant_tables.rst b/docs/hypercall-interfaces/arm64/grant_tables.rst
>>> new file mode 100644
>>> index 0000000000..8955ec5812
>>> --- /dev/null
>>> +++ b/docs/hypercall-interfaces/arm64/grant_tables.rst
>>> @@ -0,0 +1,8 @@
>>> +.. SPDX-License-Identifier: CC-BY-4.0
>>> +
>>> +Grant Tables
>>> +============
>>> +
>>> +.. doxygengroup:: grant_table
>>
>> Why is this Arm64-specific?
> 
> This particular one is Arm64 specific, but it doesn’t mean that grant tables are arm specific, it is only that for now I’m
> Introducing a partial documentation in the arm side. Any other user can in the future add more documentation for
> each platform.

I'm of the pretty strong opinion that common hypercalls should be
documented as common, and hence not live in an arch-specific
section.

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
>>> @@ -97,47 +104,55 @@
>>>  *      transferred frame is written. It is safe for the guest to spin waiting
>>>  *      for this to occur (detect by observing GTF_transfer_completed in
>>>  *      ent->flags).
>>> + * @endcode
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
>>
>> For example - are the blank lines you add necessary or merely nice
>> to have in your personal opinion?
> 
> The blank lines makes the docs output more good looking

I'm inclined to suggest to split beautification from basic enabling.

>>> - */
>>> -
>>> -/*
>>> - * Reference to a grant entry in a specified domain's grant table.
>>> - */
>>> -typedef uint32_t grant_ref_t;
>>
>> Why does this get moved ...
>>
>>> -
>>> -/*
>>> + *
>>>  * A grant table comprises a packed array of grant entries in one or more
>>>  * page frames shared between Xen and a guest.
>>> + *
>>>  * [XEN]: This field is written by Xen and read by the sharing guest.
>>> + *
>>>  * [GST]: This field is written by the guest and read by Xen.
>>> + *
>>> + * @addtogroup grant_table Grant Tables
>>> + * @{
>>>  */
>>>
>>> -/*
>>> - * Version 1 of the grant table entry structure is maintained purely
>>> - * for backwards compatibility.  New guests should use version 2.
>>> +/**
>>> + * Reference to a grant entry in a specified domain's grant table.
>>>  */
>>> +typedef uint32_t grant_ref_t;
>>
>> ... here, past a comment unrelated to it?
> 
> The comment “Version 1 of the grant table entry […]” was moved on top of the struct grant_entry_v1, in this way
> Doxygen associate the comment to that structure.
> 
> The comment “Reference to a grant entry in a specified domain's grant table.” Is moved on top of typedef uint32_t grant_ref_t
> for the same reason above

But it's the other comment ("A grant table comprises ...") that I
was asking about.

>>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>>      * In that case, the frame field has the same semantics as the
>>>      * field of the same name in the V1 entry structure.
>>>      */
>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>     struct {
>>>         grant_entry_header_t hdr;
>>>         uint32_t pad0;
>>>         uint64_t frame;
>>>     } full_page;
>>> +    /** @endcond */
>>>
>>>     /*
>>>      * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>>      * @domid is allowed to access bytes [@page_off,@page_off+@length)
>>>      * in frame @frame.
>>>      */
>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>     struct {
>>>         grant_entry_header_t hdr;
>>>         uint16_t page_off;
>>>         uint16_t length;
>>>         uint64_t frame;
>>>     } sub_page;
>>> +    /** @endcond */
>>>
>>>     /*
>>>      * If the grant is GTF_transitive, @domid is allowed to use the
>>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>>      * The current version of Xen does not allow transitive grants
>>>      * to be mapped.
>>>      */
>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>     struct {
>>>         grant_entry_header_t hdr;
>>>         domid_t trans_domid;
>>>         uint16_t pad0;
>>>         grant_ref_t gref;
>>>     } transitive;
>>> +    /** @endcond */
>>
>> While already better than the introduction of strange struct tags,
>> I'm still not convinced we want this extra clutter (sorry). Plus -
>> don't these additions mean the sub-structures then won't be
>> represented in the generated doc, rendering it (partly) useless?
> 
> Are you suggesting to remove the structure from docs?

Just yet I'm not suggesting anything here - I was merely guessing at
the effect of "@cond" and the associated "skip ..." to mean that this
construct makes doxygen skip the enclosed section. If that's not the
effect, then maybe the comment wants rewording? (And then - what does
@cond mean?)

>>> @@ -433,7 +454,12 @@ typedef struct gnttab_transfer gnttab_transfer_t;
>>> DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>
>>>
>>> -/*
>>> +#define _GNTCOPY_source_gref      (0)
>>> +#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>> +#define _GNTCOPY_dest_gref        (1)
>>> +#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>> +
>>> +/**
>>>  * GNTTABOP_copy: Hypervisor based copy
>>>  * source and destinations can be eithers MFNs or, for foreign domains,
>>>  * grant references. the foreign domain has to grant read/write access
>>> @@ -451,18 +477,15 @@ DEFINE_XEN_GUEST_HANDLE(gnttab_transfer_t);
>>>  * bytes to be copied.
>>>  */
>>>
>>> -#define _GNTCOPY_source_gref      (0)
>>> -#define GNTCOPY_source_gref       (1<<_GNTCOPY_source_gref)
>>> -#define _GNTCOPY_dest_gref        (1)
>>> -#define GNTCOPY_dest_gref         (1<<_GNTCOPY_dest_gref)
>>> -
>>> struct gnttab_copy {
>>
>> Again the question - why the movement?
> 
> Doxygen takes the comment just above the data structure to build the docs, so here we are moving the
> Comment just on top of the described structure.

Well, okay, this then is an explanation _that_ the #define-s want
moving, but not an explanation for where they got moved (father
away from what they actually relate to). Personally I consider it
good practice to have such #define-s next to the field they relate
to (and we have such placement elsewhere). Perhaps worth
considering to move them down rather than up?

Jan

>>> @@ -579,17 +602,19 @@ struct gnttab_swap_grant_ref {
>>> typedef struct gnttab_swap_grant_ref gnttab_swap_grant_ref_t;
>>> DEFINE_XEN_GUEST_HANDLE(gnttab_swap_grant_ref_t);
>>>
>>> -/*
>>> +/**
>>>  * Issue one or more cache maintenance operations on a portion of a
>>>  * page granted to the calling domain by a foreign domain.
>>>  */
>>> struct gnttab_cache_flush {
>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>     union {
>>>         uint64_t dev_bus_addr;
>>>         grant_ref_t ref;
>>>     } a;
>>> -    uint16_t offset; /* offset from start of grant */
>>> -    uint16_t length; /* size within the grant */
>>> +    /** @endcond */
>>> +    uint16_t offset; /**< offset from start of grant */
>>> +    uint16_t length; /**< size within the grant */
>>
>> Skipping just part of a struct is perhaps even more confusing than
>> omitting it altogether.
>>
>> Also, what's the significance of "/**<" ?
> 
> It is a doxygen pattern that tells it to use the comment as a field related documentation.
> If you build the documentation you will find the result, I encourage you to see it to
> realize the power of the tool and the benefits that Xen can get with it.
> 
> Cheers,
> Luca

