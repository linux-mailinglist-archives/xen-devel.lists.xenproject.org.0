Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3609C333605
	for <lists+xen-devel@lfdr.de>; Wed, 10 Mar 2021 07:51:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95863.180972 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJsgS-0005Ci-Uq; Wed, 10 Mar 2021 06:51:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95863.180972; Wed, 10 Mar 2021 06:51:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJsgS-0005CJ-Ri; Wed, 10 Mar 2021 06:51:04 +0000
Received: by outflank-mailman (input) for mailman id 95863;
 Wed, 10 Mar 2021 06:51:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Iqsa=II=arm.com=michal.orzel@srs-us1.protection.inumbo.net>)
 id 1lJsgQ-0005By-Kl
 for xen-devel@lists.xenproject.org; Wed, 10 Mar 2021 06:51:02 +0000
Received: from foss.arm.com (unknown [217.140.110.172])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTP
 id d49f1c06-0e90-4f1b-afdd-b5a4e7b0965c;
 Wed, 10 Mar 2021 06:51:00 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E96061FB;
 Tue,  9 Mar 2021 22:50:59 -0800 (PST)
Received: from [10.57.15.227] (unknown [10.57.15.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 424493F70D;
 Tue,  9 Mar 2021 22:50:58 -0800 (PST)
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
X-Inumbo-ID: d49f1c06-0e90-4f1b-afdd-b5a4e7b0965c
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Jan Beulich <jbeulich@suse.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Wei Liu <wl@xen.org>, bertrand.marquis@arm.com,
 xen-devel@lists.xenproject.org, Julien Grall <julien@xen.org>
References: <20210308135937.1692-1-michal.orzel@arm.com>
 <745c5049-fb09-5605-8bc1-838a4def45d6@xen.org>
 <3353ecf1-3a76-70ee-0475-b7eed90c783c@arm.com>
 <d7fc35e8-fe09-d78b-7f8b-7e30c58662cb@xen.org>
 <1a1c8cf1-4c41-7fe2-ef4c-4f92d5b956c8@suse.com>
 <dabb851d-fc67-7291-e7d1-ffab4276b8ea@xen.org>
 <4a2a8caa-fc13-e18d-6c60-02f3597dc9f9@arm.com>
 <d8fcf052-077c-5dde-2cb9-5c4c68abc3ff@suse.com>
From: Michal Orzel <michal.orzel@arm.com>
Message-ID: <fdcf15d1-e452-3746-6591-e211c994aea8@arm.com>
Date: Wed, 10 Mar 2021 07:50:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <d8fcf052-077c-5dde-2cb9-5c4c68abc3ff@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit



On 09.03.2021 15:18, Jan Beulich wrote:
> On 09.03.2021 14:55, Michal Orzel wrote:
>>
>>
>> On 09.03.2021 14:32, Julien Grall wrote:
>>>
>>>
>>> On 09/03/2021 11:07, Jan Beulich wrote:
>>>> On 09.03.2021 11:20, Julien Grall wrote:
>>>>> On 09/03/2021 07:34, Michal Orzel wrote:
>>>>>> On 08.03.2021 15:31, Julien Grall wrote:
>>>>>>> On 08/03/2021 13:59, Michal Orzel wrote:
>>>>>>>> --- a/xen/arch/arm/Makefile
>>>>>>>> +++ b/xen/arch/arm/Makefile
>>>>>>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>>>>>>       #obj-bin-y += ....o
>>>>>>>>     -ifdef CONFIG_DTB_FILE
>>>>>>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>>>>>>     obj-y += dtb.o
>>>>>>>>     AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>>>>>>     endif
>>>>>>>> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>>>>>>>     xen.lds: xen.lds.S
>>>>>>>>         $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>>>>>>>     -dtb.o: $(CONFIG_DTB_FILE)
>>>>>>>> -
>>>>>>>
>>>>>>> Why is this dropped?
>>>>>> 1)This line is not needed as it has no impact on creating dtb.o
>>>>>> 2)It causes the build failure once CONFIG_DTB_FILE option is in the Kconfig as string within quotes.
>>>>>
>>>>> Because of 1), this should have ideally be part of a separate patch. But
>>>>> I am OK to keep it in this patch so long it is explained in the commit
>>>>> message.
>>>>
>>>> Wasn't the intention to have dtb.o re-compiled when the blob
>>>> has changed? This would be lost with the removal of this line.
>>>
>>> Ah yes. I was only thinking about a name change (this would be caught via the update of the config header) and not a file update.
>>>
>> I already pushed v3 but I agree. Something like this would do the job:
>> dtb.o: $(subst $\",,$(CONFIG_DTB_FILE))
>> to remove quotes
> 
> Besides struggling with the $\", may I suggest
> $(patsubst "%",%,$(CONFIG_DTB_FILE))? If the double quote needs
> special treatment, I think it wants to be done via an abstraction
> similar to squote (near the top of ./Config.mk).
> 
The line $(patsubst "%",%,$(CONFIG_DTB_FILE)) is sufficient.
I checked and dtb.o is recompiled when the blob is changed.
I will fix it in v4
> Jan
> 
Michal

