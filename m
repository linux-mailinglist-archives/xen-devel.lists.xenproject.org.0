Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A1433463F
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 19:06:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.96257.181966 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK3DG-0007kd-IX; Wed, 10 Mar 2021 18:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 96257.181966; Wed, 10 Mar 2021 18:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lK3DG-0007kE-FB; Wed, 10 Mar 2021 18:05:38 +0000
Received: by outflank-mailman (input) for mailman id 96257;
 Wed, 10 Mar 2021 18:05:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lK3DF-0007k9-E5
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 18:05:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lK3DE-0007on-5q; Wed, 10 Mar 2021 18:05:36 +0000
Received: from 54-240-197-234.amazon.com ([54.240.197.234]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lK3DD-00038u-SF; Wed, 10 Mar 2021 18:05:35 +0000
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
	bh=rVBK4deqEcBvSLxBe5QpT9AXxRZruW155bQgWbiYJdc=; b=OFFWacnzMFi1Wx1arQHOfS5HXh
	egpK2GP75hpIBC8nyMgNbrK/4IpUQHkUJ3o88oiyTzzALu+y5omocn9jPQeqUjCkAfPnSKhvH/m9x
	7s3YCpaf6uqg7a/TVqA6Gywppl5RecNtWMxA7wtnTv2bScLZsXwiaAXZbHFGwfHmjJr0=;
Subject: Re: [PATCH for-4.15] xen: Bump the minimum version of GCC supported
 to 4.9 (5.1 on arm64)
To: Jan Beulich <jbeulich@suse.com>
Cc: Julien Grall <jgrall@amazon.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org
References: <20210306214148.27021-1-julien@xen.org>
 <1897022d-7591-3450-4e57-884a2860b13d@suse.com>
 <7fd07dc9-9c03-bb13-3907-c3c268a4e970@xen.org>
 <2de5160f-8636-5cdf-a20c-acaa2640c893@suse.com>
 <e4ea36f5-7aca-e19d-5e78-45058b13697b@xen.org>
 <e1176ad2-0a66-3a6d-c053-f0da9d4ae35f@suse.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7ab87cab-8836-e8a0-993e-0cdeca3c45e3@xen.org>
Date: Wed, 10 Mar 2021 18:05:34 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <e1176ad2-0a66-3a6d-c053-f0da9d4ae35f@suse.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Jan,

On 09/03/2021 11:20, Jan Beulich wrote:
> On 08.03.2021 21:22, Julien Grall wrote:
>> On 08/03/2021 11:20, Jan Beulich wrote:
>>> On 08.03.2021 11:51, Julien Grall wrote:
>>>> On 08/03/2021 08:09, Jan Beulich wrote:
>>>>> Additionally - partly related to your own reply regarding the CI
>>>>> failures - imo there needs to be an analysis of what older distros
>>>>> will no longer build (at all or by default).
>>>>
>>>> Per the CI, this would be Ubuntu Trusty (and older), Centos 7 (and older)
>>>>
>>>> Do you have any other in mind?
>>>
>>> Our SLE12 (latest service pack is SP5 and still has a while to go
>>> to at least reach LTSS state) comes with gcc 4.8 as the default
>>> compiler.
>>
>> Thanks! That's good to know. Is it the old GCC Suse supports?
> 
> Not sure I understand the question: The default compiler of this or
> any distro is of course (expected to be) supported by the vendor
> for the lifetime of the OS.

Sorry for the wording. I was asking whether Suse also supports compiler 
older than GCC 4.8.

> 
>>>>>> --- a/xen/include/xen/compiler.h
>>>>>> +++ b/xen/include/xen/compiler.h
>>>>>> @@ -5,6 +5,19 @@
>>>>>>     #error Sorry, your compiler is too old/not recognized.
>>>>>>     #endif
>>>>>>     
>>>>>> +#if CONFIG_CC_IS_GCC
>>>>>> +# if CONFIG_GCC_VERSION < 40900
>>>>>> +/* https://gcc.gnu.org/bugzilla/show_bug.cgi?id=58145 */
>>>>>
>>>>> As per the bug report, the issue was determined to not be present
>>>>> in e.g. 4.3. Hence while such a bug may influence our choice of
>>>>> minimum version, I don't think it can reasonably be named here as
>>>>> the apparent only reason for the choice. Personally I don't think
>>>>> any justification should be put here.
>>>>
>>>> Ok.
>>>>
>>>>>
>>>>>> +#  error Sorry, your version of GCC is too old - please use 4.9 or newer.
>>>>>> +# elif defined(CONFIG_ARM_64) && CONFIG_GCC_VERSION < 50100
>>>>>> +/*
>>>>>> + * https://gcc.gnu.org/bugzilla/show_bug.cgi?id=63293
>>>>>> + * https://lore.kernel.org/r/20210107111841.GN1551@shell.armlinux.org.uk
>>>>>> + */
>>>>>> +#  error Sorry, your version of GCC is too old - please use 5.1 or newer.
>>>>>
>>>>>    From the bug entry the fix looks to have been backported to 4.9,
>>>>> or at least some (important?) branches thereof.
>>>>
>>>> It is not clear what's you are trying to point out. Mind clarifying?
>>>
>>> Some 4.9 compilers (perhaps widely used ones) may not have the bad
>>> issue, which puts under question their ruling out when the main
>>> reason for doing so is that bug.
>>
>> Well... We could surely try to hunt which GCC 4.9 has been fixed. But I
>> am not convinced this is useful, we would need to have an allowlist of
>> GCC compiler.
> 
> Or probe the compiler for the bug in question.

I thought about it but it is not clear to me whether the reproducer 
would work on every GCC version and how to detect that this was miscompiled.

Do you have any suggestion?

Cheers,

-- 
Julien Grall

