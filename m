Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 653A535821F
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 13:40:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107199.204913 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUT1G-0008Q1-W0; Thu, 08 Apr 2021 11:40:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107199.204913; Thu, 08 Apr 2021 11:40:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUT1G-0008Pe-Sh; Thu, 08 Apr 2021 11:40:18 +0000
Received: by outflank-mailman (input) for mailman id 107199;
 Thu, 08 Apr 2021 11:40:17 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUT1F-0008PZ-Ld
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 11:40:17 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUT1E-0002IR-Dl; Thu, 08 Apr 2021 11:40:16 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUT1E-0001vF-5y; Thu, 08 Apr 2021 11:40:16 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=emOYBi9FEz55Nnve8Fy89stSKqmErzUOUKHiT5Z/9oY=; b=3L0JAcwPvicqLI+4K0LItKk5Oy
	lRraDTf8O/7hFpfi+2mIFHR+Mx00LbeU6UJ+cgpFvQXcCn9j3Q7M5cC5qz7gqjFzvU9+SPHl4wdlU
	extQSh52jUlTGnHolHQmvQ4LpOX+XWj8CbHgFzbBFysfdPsfSvYbAKkNlbb2J+VO9NwM=;
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
To: Luca Fancellu <luca.fancellu@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Jan Beulich <jbeulich@suse.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>, wei.chen@arm.com,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, xen-devel@lists.xenproject.org
References: <20210406103603.8530-1-luca.fancellu@arm.com>
 <20210406103603.8530-4-luca.fancellu@arm.com>
 <073e28bc-ad94-429d-6384-744864d12b57@suse.com>
 <alpine.DEB.2.21.2104061425040.31460@sstabellini-ThinkPad-T480s>
 <e15ed7b9-b153-b767-e625-e7a9d2aa76bf@suse.com>
 <DF5BE432-F79E-4874-92DF-60A4DCD9EDBD@arm.com>
 <5cad4ffb-44ec-4cde-f5bb-f59dc3ca59ca@suse.com>
 <alpine.DEB.2.21.2104071424190.31460@sstabellini-ThinkPad-T480s>
 <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <e3edf002-9d60-7836-f7f0-cd9877653c2c@xen.org>
Date: Thu, 8 Apr 2021 12:40:13 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <D0931FDE-29DA-41B0-87AF-EF18ABDDA37E@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Luca,

On 08/04/2021 12:02, Luca Fancellu wrote:
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
>>>>         uint64_t dev_bus_addr;
>>>>         grant_ref_t ref;
>>>>     } a;
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

If I understand correctly your proposal, the name of the structure would 
be the name of the field. The name of the fields are usually pretty 
generic so you will likely end up to redefine the structure name.

Unless we want to provide random name, the only safe naming would be to 
define the structure as upper_level_u_meaningful_name{1, 2}. But, this 
is going to be pretty awful to read.

But I am still a bit puzzled by the fact doxygen is not capable to deal 
with anynomous/unamed union. How do other projects deal with them?

> 
> Doing this will help a lot the documentation side because the html page will show the "struct upper_level" with inside the “union upper_level_u" and inside again
> the two struct “meaningful_name1" and “meaningful_name2", and from the point of view of the developer it can tell her/him exactly the name of the member to
> access when writing code (apart from the upper_level_u that can be accessed by u, but we can’t clearly change it).

I don't quite understand the last point. Wouldn't the developper see the 
field name? So how is it going to be different from seeing the structure 
name?

> If this sounds difficult to understand when reading, please generate the documentation and have a look on the page in one side and the source code in another.

Just to be clear, do you mean understanding what you wrote or a 
developper trying to understand the code?

Cheers,

-- 
Julien Grall

