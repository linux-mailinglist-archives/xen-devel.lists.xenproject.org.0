Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE8486CB25
	for <lists+xen-devel@lfdr.de>; Thu, 29 Feb 2024 15:15:04 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.687165.1070169 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhBU-0007Sh-SF; Thu, 29 Feb 2024 14:14:52 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 687165.1070169; Thu, 29 Feb 2024 14:14:52 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfhBU-0007Pp-PR; Thu, 29 Feb 2024 14:14:52 +0000
Received: by outflank-mailman (input) for mailman id 687165;
 Thu, 29 Feb 2024 14:14:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1rfhBS-0007PW-Vn
 for xen-devel@lists.xenproject.org; Thu, 29 Feb 2024 14:14:50 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfhBR-00064j-U2; Thu, 29 Feb 2024 14:14:49 +0000
Received: from [15.248.3.86] (helo=[10.45.19.50])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1rfhBR-0007Tv-Ng; Thu, 29 Feb 2024 14:14:49 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID;
	bh=bmwGVTfkjIMYE3GpyYTpwmNMOuHBCDVt2ZBFy8r5+FE=; b=fCcqv+PBonuyddsny68kHe+wU5
	PtlPxuoBSz+jt3ELaKHZ7D4w7rbOHqVbqzoG/o+cvYfMbi8adKMlC61vkHZRW0Doj4JUnjHmrmCO0
	BEluY/MzqKrnxQTtZdT15PBQU7R5vlIl6NZslPt0HwlkF7KzuZs6nXtU8rrtOftTesIQ=;
Message-ID: <b86733f5-e61e-43ab-8375-8a3c7480c8d3@xen.org>
Date: Thu, 29 Feb 2024 14:14:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 23/23] xen/README: add compiler and binutils versions
 for RISC-V64
Content-Language: en-GB
To: Jan Beulich <jbeulich@suse.com>
Cc: George Dunlap <george.dunlap@citrix.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 xen-devel@lists.xenproject.org, Oleksii Kurochko
 <oleksii.kurochko@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>
References: <cover.1708962629.git.oleksii.kurochko@gmail.com>
 <ebaa05ded3cfddb1e3f7c87cd806b866312878fb.1708962629.git.oleksii.kurochko@gmail.com>
 <73a38d85-0798-4cfa-8625-0f8c9e05b2a3@suse.com>
 <80fb8091-9a26-40a4-b2e7-371df9411861@xen.org>
 <889b132b-b92e-465b-94af-4e4133e4c297@suse.com>
 <52188e88-374c-449f-a71c-bfce9b6d07f4@xen.org>
 <cd52114b-c4f1-4bb9-96a4-d802dc50bade@citrix.com>
 <2a112321-f4fd-4ab4-a431-a0bb4cb6eaa2@suse.com>
 <9b212dec-59ef-4cbb-bea7-add3867e4599@xen.org>
 <aa3fbfca-4675-4f92-9037-a4a7c5eca4dd@suse.com>
 <8eed0200-eabf-4024-b018-74be45ef95db@xen.org>
 <f28e22b7-2657-40d9-8a97-e747c689c2b0@suse.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <f28e22b7-2657-40d9-8a97-e747c689c2b0@suse.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 29/02/2024 14:07, Jan Beulich wrote:
> On 29.02.2024 14:44, Julien Grall wrote:
>> Hi Jan,
>>
>> On 29/02/2024 12:51, Jan Beulich wrote:
>>> On 29.02.2024 13:32, Julien Grall wrote:
>>>> On 29/02/2024 12:17, Jan Beulich wrote:
>>>>> On 29.02.2024 13:05, Andrew Cooper wrote:
>>>>>> On 29/02/2024 10:23 am, Julien Grall wrote:
>>>>>>>>>> IOW it is hard for me to see why RISC-V needs stronger restrictions
>>>>>>>>>> here
>>>>>>>>>> than other architectures. It ought to be possible to determine a
>>>>>>>>>> baseline
>>>>>>>>>> version. Even if taking the desire to have "pause" available as a
>>>>>>>>>> requirement, gas (and presumably gld) 2.36.1 would already suffice.
>>>>>>>>>
>>>>>>>>> I think we want to bump it on Arm. There are zero reasons to try to
>>>>>>>>> keep
>>>>>>>>> a lower versions if nobody tests/use it in production.
>>>>>>>>>
>>>>>>>>> I would suggest to do the same on x86. What's the point of try to
>>>>>>>>> support Xen with a 15+ years old compiler?
>>>>>>>>
>>>>>>>> It could have long been bumped if only a proper scheme to follow for
>>>>>>>> this and future bumping would have been put forward by anyone keen on
>>>>>>>> such bumping, like - see his reply - e.g. Andrew. You may recall that
>>>>>>>> this was discussed more than once on meetings, with no real outcome.
>>>>>>>> I'm personally not meaning to stand in the way of such bumping as long
>>>>>>>> as it's done in a predictable manner, but I'm not keen on doing so and
>>>>>>>> hence I don't view it as my obligation to try to invent a reasonable
>>>>>>>> scheme. (My personal view is that basic functionality should be
>>>>>>>> possible to have virtually everywhere, whereas for advanced stuff it
>>>>>>>> is fine to require a more modern tool chain.)
>>>>>>>
>>>>>>> That's one way to see it. The problem with this statement is a user
>>>>>>> today is mislead to think you can build Xen with any GCC versions
>>>>>>> since 4.1. I don't believe we can guarantee that and we are exposing
>>>>>>> our users to unnecessary risk.
>>>>>>>
>>>>>>> In addition to that, I agree with Andrew. This is preventing us to
>>>>>>> improve our code base and we have to carry hacks for older compilers.
>>>>>>
>>>>>> I don't think anyone here is suggesting that we switch to a
>>>>>> bleeding-edge-only policy.  But 15y of support is extreme in the
>>>>>> opposite direction.
>>>>>>
>>>>>> Xen ought to be buildable in the contemporary distros of the day, and I
>>>>>> don't think anyone is going to credibly argue otherwise.
>>>>>>
>>>>>> But, it's also fine for new things to have newer requirements.
>>>>>>
>>>>>> Take CET for example.  I know we have disagreements on exactly how it's
>>>>>> toolchain-conditionalness is implemented, but the basic principle of "If
>>>>>> you want shiny new optional feature $X, you need newer toolchain $Y" is
>>>>>> entirely fine.
>>>>>>
>>>>>> A brand new architecture is exactly the same.  Saying "this is the
>>>>>> minimum, because it's what we test" doesn't preclude someone coming
>>>>>> along and saying "can we use $N-1 ?  See here it works, and here's a
>>>>>> change to CI test it".
>>>>>>
>>>>>>
>>>>>> Anyway, its clear we need to write some policy on this, before making
>>>>>> specific adjustments.  To get started, is there going to be any
>>>>>> objection whatsoever on some principles which begin as follows:
>>>>>
>>>>> Largely not, but one aspect needs clarifying up front:
>>>>>
>>>>>> * For established architectures, we expect Xen to be buildable on the
>>>>>> common contemporary distros.  (i.e. minima is not newer than what's
>>>>>> available in contemporary distros, without a good reason)
>>>>>
>>>>> What counts as contemporary distro? Still in normal support? LTS? Yet
>>>>> more extreme forms?
>>>>
>>>> LTS makes sense. More I am not sure. I am under the impression that
>>>> people using older distros are those that wants a stable system. So they
>>>> would unlikely try to upgrade the hypervisor.
>>>>
>>>> Even for LTS, I would argue that if it has been released 5 years ago,
>>>> then you probably want to update it at the same time as moving to a
>>>> newer Xen version.
>>>
>>> For the purposes of distros I agree. For the purposes of individuals
>>> I don't: What's wrong with running a newer hypervisor and/or kernel
>>> underneath an older distro?
>>
>> There is nothing wrong. I just don't understand the benefits for us to
>> support that use case. To me there are two sorts of individuals:
>>    1. The ones that are using distro packages. They will unlikely want to
>> switch to a newer hypervisor
>>    2. The ones that are happy to compile and hack their system. Fairly
>> likely they will use a more distros and/or would not be put up by
>> upgrading it.
>>
>> What individuals do you have in mind?
> 
> People like me.

Which means? From what I read you mostly use an older distros for smoke 
testing/convenience.

>> Also, for me, the minimum doesn't prevent anyone to try to compile with
>> an older compiler. It is only here to say that as a community we will
>> not investigate or trying to workaround bugs in those compilers.
> 
> Besides this also allowing to use functionality you won't have an easy
> way of replacing, what you say also doesn't make clear whether - for
> cases where the issue can be (reasonably easily) worked around - patches
> would be accepted, or rejected on the basis of only helping a below-the-
> line compiler.

I would not accept them.

Cheers,

-- 
Julien Grall

