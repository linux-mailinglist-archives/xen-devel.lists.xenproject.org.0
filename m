Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75D358272
	for <lists+xen-devel@lfdr.de>; Thu,  8 Apr 2021 13:51:41 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.107206.204926 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTBN-00011a-4U; Thu, 08 Apr 2021 11:50:45 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 107206.204926; Thu, 08 Apr 2021 11:50:45 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lUTBN-00011F-0X; Thu, 08 Apr 2021 11:50:45 +0000
Received: by outflank-mailman (input) for mailman id 107206;
 Thu, 08 Apr 2021 11:50:43 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lUTBL-00011A-4H
 for xen-devel@lists.xenproject.org; Thu, 08 Apr 2021 11:50:43 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUTBJ-0002Sw-On; Thu, 08 Apr 2021 11:50:41 +0000
Received: from [54.239.6.188] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lUTBJ-0002xc-CD; Thu, 08 Apr 2021 11:50:41 +0000
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
	MIME-Version:Date:Message-ID:References:Cc:To:From:Subject;
	bh=k/hSsReF9jPFy0aDozzz+ViXl1T3EMFaljZoSbCxEgk=; b=bqJ1LZwibclsczEw5Oaeiu5Evn
	YX29ZGmU7DTV4QdXYOG67BV6/CpObntCn5GGB+5nA/m5KOUbnsLMcbaf6cj70KYEX0m3OwdV3rcE4
	uaHgpxnMJUczXOHp3C9HrrAxyY9aM+z6Mp7awaMA0lyZgiXvom1Hkz83+CLgA6Y/1w6o=;
Subject: Re: [PATCH 3/3] docs/doxygen: doxygen documentation for grant_table.h
From: Julien Grall <julien@xen.org>
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
 <e3edf002-9d60-7836-f7f0-cd9877653c2c@xen.org>
Message-ID: <2b5b6cd8-7898-46f7-10bb-4a9d95da58ef@xen.org>
Date: Thu, 8 Apr 2021 12:50:39 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <e3edf002-9d60-7836-f7f0-cd9877653c2c@xen.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 08/04/2021 12:40, Julien Grall wrote:
> Hi Luca,
> 
> On 08/04/2021 12:02, Luca Fancellu wrote:
>>
>>
>>> On 7 Apr 2021, at 22:26, Stefano Stabellini <sstabellini@kernel.org> 
>>> wrote:
>>>
>>> On Wed, 7 Apr 2021, Jan Beulich wrote:
>>>> On 07.04.2021 10:42, Luca Fancellu wrote:
>>>>> Just to be sure that we are in the same page, are you suggesting to 
>>>>> modify the name
>>>>> In this way?
>>>>>
>>>>> struct gnttab_cache_flush {
>>>>> -    union {
>>>>> +    union xen_gnttab_cache_flush_a {
>>>>>         uint64_t dev_bus_addr;
>>>>>         grant_ref_t ref;
>>>>>     } a;
>>>>>
>>>>> Following this kind of pattern: xen_<upper struct name>_<member 
>>>>> name> ?
>>>>
>>>> While in general I would be fine with this scheme, for field names like
>>>> "a" or "u" it doesn't fit well imo.
>>>
>>> "a" is a bad name anyway, even for the member. We can take the
>>> opportunity to find a better name. Almost anything would be better than
>>> "a". Maybe "refaddr"?
>>>
>>>
>>>> I'm also unconvinced this would be
>>>> scalable to the case where there's further struct/union nesting.
>>>
>>> How many of these instances of multilevel nesting do we have? Luca might
>>> know. Probably not many? They could be special-cased.
>>
>> There are not many multilevel nesting instances of anonymous 
>> struct/union and the maximum level of nesting I found in the public 
>> headers is 2:
>>
>> union {
>>     union/struct {
>>         …
>>     } <name>
>> } <name>
>>
>> I also see that in the majority of cases the unions have not 
>> meaningful names like “a” or “u” as member name, instead struct names 
>> are fine,
>> It could be fine to keep the meaningful name the same for the struct 
>> type name and use the pattern for the non-meaningful ones as long
>> as the names doesn’t create compilation errors?
>>
>> Example:
>>
>> struct upper_level {
>>     union {
>>         struct {
>>
>>         } meaningful_name1;
>>         struct {
>>
>>         } meaningful_name2;
>>     } u;
>> };
>>
>> becomes:
>>
>> struct upper_level {
>>     union upper_level_u {
>>         struct meaningful_name1 {
>>
>>         } meaningful_name1;
>>         struct meaningful_name2 {
>>
>>         } meaningful_name2;
>>     } u;
>> };
> 
> If I understand correctly your proposal, the name of the structure would 
> be the name of the field. The name of the fields are usually pretty 
> generic so you will likely end up to redefine the structure name.
> 
> Unless we want to provide random name, the only safe naming would be to 
> define the structure as upper_level_u_meaningful_name{1, 2}. But, this 
> is going to be pretty awful to read.
> 
> But I am still a bit puzzled by the fact doxygen is not capable to deal 
> with anynomous/unamed union. How do other projects deal with them?

While going through the list of anynomous union in Xen, I noticed we 
also have something like:

struct test {
     union {
         int a;
         int b;
     };
};

We can't name them because of syntactic reasons. What's your plan for them?

Cheers,

-- 
Julien Grall

