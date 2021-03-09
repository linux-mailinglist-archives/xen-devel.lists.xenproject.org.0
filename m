Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FC9833285C
	for <lists+xen-devel@lfdr.de>; Tue,  9 Mar 2021 15:18:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.95481.180284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdBs-00006i-L5; Tue, 09 Mar 2021 14:18:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 95481.180284; Tue, 09 Mar 2021 14:18:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lJdBs-00006J-Ho; Tue, 09 Mar 2021 14:18:28 +0000
Received: by outflank-mailman (input) for mailman id 95481;
 Tue, 09 Mar 2021 14:18:27 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=Bv84=IH=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1lJdBr-00006E-KF
 for xen-devel@lists.xenproject.org; Tue, 09 Mar 2021 14:18:27 +0000
Received: from mx2.suse.de (unknown [195.135.220.15])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ca759845-8655-405a-95ee-0941319d7786;
 Tue, 09 Mar 2021 14:18:26 +0000 (UTC)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 19635AD73;
 Tue,  9 Mar 2021 14:18:26 +0000 (UTC)
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
X-Inumbo-ID: ca759845-8655-405a-95ee-0941319d7786
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1615299506; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CHh8+kJ84TZtcBZshuUDucjJA4FWbaKgQHy8XtOErIQ=;
	b=C1eW7VdPW+Uis2KKBKSeYxkt2J6/IadkWOfQ6dlaAMnskoCScj+hAWKwjgRUwDW2dURnB1
	nijHjG6muiAjZJBF4nyXMCS2q6+VfCzwp6er5yMUFNBpHwIrA++SCBHvldYzHtc6VBCJLs
	ZFxTu8z7vllrlVL3sZ4cgfbzG9cVTDQ=
Subject: Re: [PATCH v2] arm: Add Kconfig entry to select CONFIG_DTB_FILE
To: Michal Orzel <michal.orzel@arm.com>
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
From: Jan Beulich <jbeulich@suse.com>
Message-ID: <d8fcf052-077c-5dde-2cb9-5c4c68abc3ff@suse.com>
Date: Tue, 9 Mar 2021 15:18:25 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <4a2a8caa-fc13-e18d-6c60-02f3597dc9f9@arm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 09.03.2021 14:55, Michal Orzel wrote:
> 
> 
> On 09.03.2021 14:32, Julien Grall wrote:
>>
>>
>> On 09/03/2021 11:07, Jan Beulich wrote:
>>> On 09.03.2021 11:20, Julien Grall wrote:
>>>> On 09/03/2021 07:34, Michal Orzel wrote:
>>>>> On 08.03.2021 15:31, Julien Grall wrote:
>>>>>> On 08/03/2021 13:59, Michal Orzel wrote:
>>>>>>> --- a/xen/arch/arm/Makefile
>>>>>>> +++ b/xen/arch/arm/Makefile
>>>>>>> @@ -68,7 +68,7 @@ extra-y += $(TARGET_SUBARCH)/head.o
>>>>>>>       #obj-bin-y += ....o
>>>>>>>     -ifdef CONFIG_DTB_FILE
>>>>>>> +ifneq ($(CONFIG_DTB_FILE),"")
>>>>>>>     obj-y += dtb.o
>>>>>>>     AFLAGS-y += -DCONFIG_DTB_FILE=\"$(CONFIG_DTB_FILE)\"
>>>>>>>     endif
>>>>>>> @@ -137,8 +137,6 @@ asm-offsets.s: $(TARGET_SUBARCH)/asm-offsets.c
>>>>>>>     xen.lds: xen.lds.S
>>>>>>>         $(CPP) -P $(a_flags) -MQ $@ -o $@ $<
>>>>>>>     -dtb.o: $(CONFIG_DTB_FILE)
>>>>>>> -
>>>>>>
>>>>>> Why is this dropped?
>>>>> 1)This line is not needed as it has no impact on creating dtb.o
>>>>> 2)It causes the build failure once CONFIG_DTB_FILE option is in the Kconfig as string within quotes.
>>>>
>>>> Because of 1), this should have ideally be part of a separate patch. But
>>>> I am OK to keep it in this patch so long it is explained in the commit
>>>> message.
>>>
>>> Wasn't the intention to have dtb.o re-compiled when the blob
>>> has changed? This would be lost with the removal of this line.
>>
>> Ah yes. I was only thinking about a name change (this would be caught via the update of the config header) and not a file update.
>>
> I already pushed v3 but I agree. Something like this would do the job:
> dtb.o: $(subst $\",,$(CONFIG_DTB_FILE))
> to remove quotes

Besides struggling with the $\", may I suggest
$(patsubst "%",%,$(CONFIG_DTB_FILE))? If the double quote needs
special treatment, I think it wants to be done via an abstraction
similar to squote (near the top of ./Config.mk).

Jan

