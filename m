Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D322D3581BD
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 13:28:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107190.204903 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSpb-0006eE-S4; Thu, 08 Apr 2021 11:28:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107190.204903; Thu, 08 Apr 2021 11:28:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUSpb-0006dp-Ot; Thu, 08 Apr 2021 11:28:15 +0000
Received: by outflank-mailman (input) for mailman id 107190;
 Thu, 08 Apr 2021 11:28:14 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=e/uL=JF=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lUSpa-0006dk-Qf
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 11:28:14 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9aeb4c76-c621-4dab-bdb3-9fb60d343b98;
 Thu, 08 Apr 2021 11:28:13 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 767E8B138;
 Thu,  8 Apr 2021 11:28:12 +0000 (UTC)
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
X-Inumbo-ID: 9aeb4c76-c621-4dab-bdb3-9fb60d343b98
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1617881292; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kawX5P+Vt+0SGErESCEqU7jbVFZd1jUoRyWpe1E/zEY=;
	b=WlmnN7EMu5xny0X0H0ZsCCIE3gBAiWpm3XbZW7ImFzpnXbttg/HFKcSGMBfI/FPPJ5p6Ej
	+8fmHAgoO9naHI8PI2nCaKhXP1dyaig9F2FovySQJDrRDT5hcgQieQqcbTObe+aunpbT+j
	VVweX5bDU64G9KFk76bmi8aSLKYLJCM=
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>
Cc: Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
 <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
 <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
 <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <452286e1-8574-0501-a864-73ef1ff072bb@suse.com>
Date: Thu, 8 Apr 2021 13:28:11 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 08.04.2021 13:02, Luca Fancellu wrote:
> 
> 
>> On 7 Apr 2021, at 22:26, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Wed, 7 Apr 2021, Jan Beulich wrote:
>>> On 07.04.2021 10:42, Luca Fancellu wrote:
>>>> Just to be sure that we are in the same page, are you suggesting to modify the name
>>>> In this way?
>>>>
>>>> struct gnttab_cache_flush {
>>>> -    union {
>>>> +    union xen_gnttab_cache_flush_a {
>>>>        uint64_t dev_bus_addr;
>>>>        grant_ref_t ref;
>>>>    } a;
>>>>
>>>> Following this kind of pattern: xen_<upper struct name>_<member name> ?
>>>
>>> While in general I would be fine with this scheme, for field names like
>>> "a" or "u" it doesn't fit well imo.
>>
>> "a" is a bad name anyway, even for the member. We can take the
>> opportunity to find a better name. Almost anything would be better than
>> "a". Maybe "refaddr"?
>>
>>
>>> I'm also unconvinced this would be
>>> scalable to the case where there's further struct/union nesting.
>>
>> How many of these instances of multilevel nesting do we have? Luca might
>> know. Probably not many? They could be special-cased.
> 
> There are not many multilevel nesting instances of anonymous struct/union and the maximum level of nesting I found in the public headers is 2:
> 
> union {
> 	union/struct {
> 		…
> 	} <name>
> } <name>
> 
> I also see that in the majority of cases the unions have not meaningful names like “a” or “u” as member name, instead struct names are fine,
> It could be fine to keep the meaningful name the same for the struct type name and use the pattern for the non-meaningful ones as long
> as the names doesn’t create compilation errors?
> 
> Example:
> 
> struct upper_level {
> 	union {
> 		struct {
> 		
> 		} meaningful_name1;
> 		struct {
> 		
> 		} meaningful_name2;
> 	} u;
> };
> 
> becomes:
> 
> struct upper_level {
> 	union upper_level_u {
> 		struct meaningful_name1 {
> 		
> 		} meaningful_name1;
> 		struct meaningful_name2 {
> 		
> 		} meaningful_name2;
> 	} u;
> };

As you say - as long as there aren't any compilation issues. Two
top level struct-s could have identically named struct/union fields
without tag, in which case your approach outlined above will fail.
And even if there was no such case right now, the case would need
to be covered in whatever naming model was to be used (except, of
course, the one without any names).

Jan

