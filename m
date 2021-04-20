Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 75920365620
	for <lists+xen-devel@lfdr.de>; Tue, 20 Apr 2021 12:27:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.113505.216347 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnb6-0002tZ-P5; Tue, 20 Apr 2021 10:27:12 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 113505.216347; Tue, 20 Apr 2021 10:27:12 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lYnb6-0002tB-Lk; Tue, 20 Apr 2021 10:27:12 +0000
Received: by outflank-mailman (input) for mailman id 113505;
 Tue, 20 Apr 2021 10:27:10 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nVk9=JR=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lYnb4-0002se-Se
 for xen-devel@lists.xenproject.org; Tue, 20 Apr 2021 10:27:10 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id eea5a426-0991-4969-8d3d-7da4aaaa313a;
 Tue, 20 Apr 2021 10:27:09 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E8C4BAF52;
 Tue, 20 Apr 2021 10:27:08 +0000 (UTC)
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
X-Inumbo-ID: eea5a426-0991-4969-8d3d-7da4aaaa313a
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1618914429; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yffckpk3BqX5vurVRTrGEdkk+6tlpR/jJQPmz9si//I=;
	b=oiAyvSImdjTmdgHqH0Cl3sh5XuUgxOeF5RDvFgafjNu0UxOedMYqZQnRYHN1rIPT8RHBQC
	eoyhDSjE74Z4b+PWmBACaLnNSGVWpimZIKtdMYeeaGS+nAR4kP0Z7bPNcKQ1Qdj0XanXo4
	k+GPQ03VGu5DnozlKjGo/nwwao0yw1U=
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
 <c6d80a92-b8e7-703a-e051-18dc845b242a@suse.com>
 <ADF98BE7-02CA-48C1-B0CF-E4C7B4C0E828@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <dbcf10ef-0d40-a687-d242-f01a01bca342@suse.com>
Date: Tue, 20 Apr 2021 12:27:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <ADF98BE7-02CA-48C1-B0CF-E4C7B4C0E828@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 20.04.2021 11:42, Luca Fancellu wrote:
>> On 20 Apr 2021, at 10:14, Jan Beulich <jbeulich@suse.com> wrote:
>> On 20.04.2021 10:46, Luca Fancellu wrote:
>>>> On 19 Apr 2021, at 12:05, Jan Beulich <jbeulich@suse.com> wrote:
>>>> On 19.04.2021 11:12, Luca Fancellu wrote:
>>>>> - */
>>>>> -
>>>>> -/*
>>>>> - * Reference to a grant entry in a specified domain's grant table.
>>>>> - */
>>>>> -typedef uint32_t grant_ref_t;
>>>>
>>>> Why does this get moved ...
>>>>
>>>>> -
>>>>> -/*
>>>>> + *
>>>>> * A grant table comprises a packed array of grant entries in one or more
>>>>> * page frames shared between Xen and a guest.
>>>>> + *
>>>>> * [XEN]: This field is written by Xen and read by the sharing guest.
>>>>> + *
>>>>> * [GST]: This field is written by the guest and read by Xen.
>>>>> + *
>>>>> + * @addtogroup grant_table Grant Tables
>>>>> + * @{
>>>>> */
>>>>>
>>>>> -/*
>>>>> - * Version 1 of the grant table entry structure is maintained purely
>>>>> - * for backwards compatibility.  New guests should use version 2.
>>>>> +/**
>>>>> + * Reference to a grant entry in a specified domain's grant table.
>>>>> */
>>>>> +typedef uint32_t grant_ref_t;
>>>>
>>>> ... here, past a comment unrelated to it?
>>>
>>> The comment “Version 1 of the grant table entry […]” was moved on top of the struct grant_entry_v1, in this way
>>> Doxygen associate the comment to that structure.
>>>
>>> The comment “Reference to a grant entry in a specified domain's grant table.” Is moved on top of typedef uint32_t grant_ref_t
>>> for the same reason above
>>
>> But it's the other comment ("A grant table comprises ...") that I
>> was asking about.
> 
> I thought it was part of the brief about grant tables, am I wrong? For that reason I moved it.

Well, the comment talks about grant table entries (the layout of which
gets defined immediately below, as visible in the original patch), not
grant references.

>>>>> @@ -243,23 +258,27 @@ union grant_entry_v2 {
>>>>>     * In that case, the frame field has the same semantics as the
>>>>>     * field of the same name in the V1 entry structure.
>>>>>     */
>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>    struct {
>>>>>        grant_entry_header_t hdr;
>>>>>        uint32_t pad0;
>>>>>        uint64_t frame;
>>>>>    } full_page;
>>>>> +    /** @endcond */
>>>>>
>>>>>    /*
>>>>>     * If the grant type is GTF_grant_access and GTF_sub_page is set,
>>>>>     * @domid is allowed to access bytes [@page_off,@page_off+@length)
>>>>>     * in frame @frame.
>>>>>     */
>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>    struct {
>>>>>        grant_entry_header_t hdr;
>>>>>        uint16_t page_off;
>>>>>        uint16_t length;
>>>>>        uint64_t frame;
>>>>>    } sub_page;
>>>>> +    /** @endcond */
>>>>>
>>>>>    /*
>>>>>     * If the grant is GTF_transitive, @domid is allowed to use the
>>>>> @@ -270,12 +289,14 @@ union grant_entry_v2 {
>>>>>     * The current version of Xen does not allow transitive grants
>>>>>     * to be mapped.
>>>>>     */
>>>>> +    /** @cond skip anonymous struct/union for doxygen */
>>>>>    struct {
>>>>>        grant_entry_header_t hdr;
>>>>>        domid_t trans_domid;
>>>>>        uint16_t pad0;
>>>>>        grant_ref_t gref;
>>>>>    } transitive;
>>>>> +    /** @endcond */
>>>>
>>>> While already better than the introduction of strange struct tags,
>>>> I'm still not convinced we want this extra clutter (sorry). Plus -
>>>> don't these additions mean the sub-structures then won't be
>>>> represented in the generated doc, rendering it (partly) useless?
>>>
>>> Are you suggesting to remove the structure from docs?
>>
>> Just yet I'm not suggesting anything here - I was merely guessing at
>> the effect of "@cond" and the associated "skip ..." to mean that this
>> construct makes doxygen skip the enclosed section. If that's not the
>> effect, then maybe the comment wants rewording? (And then - what does
>> @cond mean?)
> 
> Yes you were right, in the documentation the structure grant_entry_v2 won’t display the
> anonymous union.

In which case I'm now completely unclear about your prior question.

Jan

