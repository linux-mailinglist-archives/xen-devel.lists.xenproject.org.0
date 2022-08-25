Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2C5A0CCC
	for <lists+xen-devel@lfdr.de>; Thu, 25 Aug 2022 11:38:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.393201.632001 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9JE-0006lQ-O1; Thu, 25 Aug 2022 09:37:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 393201.632001; Thu, 25 Aug 2022 09:37:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oR9JE-0006j1-K0; Thu, 25 Aug 2022 09:37:56 +0000
Received: by outflank-mailman (input) for mailman id 393201;
 Thu, 25 Aug 2022 09:37:54 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oR9JC-0006iv-QZ
 for xen-devel@lists.xenproject.org; Thu, 25 Aug 2022 09:37:54 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oR9JA-0002Uh-BK; Thu, 25 Aug 2022 09:37:52 +0000
Received: from [54.239.6.188] (helo=[192.168.11.158])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oR9JA-00053j-4w; Thu, 25 Aug 2022 09:37:52 +0000
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
	bh=vCnSeX9d2yB9eluMaqM9GZROTv76SFSd5RREFmXmFh0=; b=p8CddktxHCak6smZJVTzonl4JL
	qCSn/H44SRI6y1BJyO+MBNYcCoTS4oxASPvnwMb/C8rOXO1CvaaJDGl1XltLKn6898c80VXPxuP3N
	0j1QRxuMiFYpeqcoYTKDvyGjOLLLvELN7+fM8KlvojviGSyG9WCEvPLwI5VUge4joXdw=;
Message-ID: <32a74a0a-9f4f-7b3a-622b-6fb5e9a097b0@xen.org>
Date: Thu, 25 Aug 2022 10:37:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.0
Subject: Re: [PATCH v2 7/7] xen/arm: introduce new xen,enhanced property value
Content-Language: en-US
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: Rahul Singh <Rahul.Singh@arm.com>,
 xen-devel <xen-devel@lists.xenproject.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1660902588.git.rahul.singh@arm.com>
 <2fb69ff7cf9a36dd1294da4f9f4b968ff7076d42.1660902588.git.rahul.singh@arm.com>
 <d5ed6097-8a08-eb4d-35a0-ab28f82b881f@xen.org>
 <1E823DBF-8576-4E26-B12D-B69CE581F36F@arm.com>
 <c9330b72-193c-5478-9bad-9593ac7398a9@xen.org>
 <3D33311C-5FBA-4C46-A18F-105DE814C306@arm.com>
 <685e53cc-1b83-8d66-7086-dad4135c0587@xen.org>
 <474E0887-7EFC-4A0C-9815-DFBDAE9A93A9@arm.com>
 <alpine.DEB.2.22.394.2208241439220.15247@ubuntu-linux-20-04-desktop>
 <da07bb5d-98c3-9c94-a1f0-6021e398f898@xen.org>
 <alpine.DEB.2.22.394.2208241810390.15247@ubuntu-linux-20-04-desktop>
 <646CFFC2-9259-45C8-89AB-D59AA5B0DBC1@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <646CFFC2-9259-45C8-89AB-D59AA5B0DBC1@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 25/08/2022 08:39, Bertrand Marquis wrote:
> Hi,
> 
>> On 25 Aug 2022, at 02:10, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>
>> On Wed, 24 Aug 2022, Julien Grall wrote:
>>> On 24/08/2022 22:59, Stefano Stabellini wrote:
>>>> On Wed, 24 Aug 2022, Rahul Singh wrote:
>>>>>> On 24 Aug 2022, at 4:36 pm, Julien Grall <julien@xen.org> wrote:
>>>>>> On 24/08/2022 15:42, Rahul Singh wrote:
>>>>>>>> On 24 Aug 2022, at 1:59 pm, Julien Grall <julien@xen.org> wrote:
>>>>>>>>
>>>>>>>>
>>>>>>>>
>>>>>>>> On 24/08/2022 13:15, Rahul Singh wrote:
>>>>>>>>> Hi Julien,
>>>>>>>>
>>>>>>>> Hi Rahul,
>>>>>>>>
>>>>>>>>> Please let me know your view on this.
>>>>>>>>> diff --git a/xen/arch/arm/domain_build.c
>>>>>>>>> b/xen/arch/arm/domain_build.c
>>>>>>>>> index bfe7bc6b36..a1e23eee59 100644
>>>>>>>>> --- a/xen/arch/arm/domain_build.c
>>>>>>>>> +++ b/xen/arch/arm/domain_build.c
>>>>>>>>> @@ -3562,12 +3562,7 @@ static int __init construct_domU(struct
>>>>>>>>> domain *d,
>>>>>>>>>     if ( rc == -EILSEQ ||
>>>>>>>>>       rc == -ENODATA ||
>>>>>>>>>       (rc == 0 && !strcmp(dom0less_enhanced, “enabled”)) )
>>>>>>>>> -  {
>>>>>>>>> -    if ( hardware_domain )
>>>>>>>>>         kinfo.dom0less_enhanced = true;
>>>>>>>>> -    else
>>>>>>>>> -      panic(“Tried to use xen,enhanced without dom0\n”);
>>>>>>>>> -  }
>>>>>>>>
>>>>>>>> You can't use "xen,enhanced" without dom0. In fact, you will end up
>>>>>>>> to dereference NULL in alloc_xenstore_evtchn(). That's because
>>>>>>>> "xen,enhanced" means the domain will be able to use Xenstored.
>>>>>>>>
>>>>>>>> Now if you want to support your feature without a dom0. Then I think
>>>>>>>> we want to introduce an option which would be the same as
>>>>>>>> "xen,enhanced" but doesn't expose Xenstored.
>>>>>>> If we modify the patch as below we can use the "xen,enhanced" for
>>>>>>> domUs without dom0.
>>>>>>> I tested the patch and its works fine. Do you see any issue with this
>>>>>>> approach?
>>>>>>
>>>>>> Yes. For two reasons:
>>>>>> 1) It is muddying the meaning of "xen,enhanced". In particular a user
>>>>>> may not realize that Xenstore is not available if dom0 is not present.
>>>>>> 2) It would be more complicated to handle the case where Xenstored lives
>>>>>> in a non-dom0 domain. I am not aware of anyone wanting this on Arm yet,
>>>>>> but I don't want to close the door.
>>>>>>
>>>>>> So if you want to support create "xen,xen" without all the rest. Then I
>>>>>> think we need a different property value. I don't have a good suggestion
>>>>>> for the name.
>>>>>
>>>>> Is that okay if we use the earlier approach, when user set  "xen,enhanced
>>>>> = evtchn” we will not call alloc_xenstore_evtchn()
>>>>> but we create hypervisor node with all fields.
>>>>
>>>> Thinking more about this, today xen,enhanced has the implication that:
>>>>
>>>> - the guest will get a regular and complete "xen,xen" node in device tree
>>>> - xenstore and PV drivers will be available (full Xen interfaces support)
>>>>
>>>> We don't necessarely imply that dom0 is required (from a domU point of
>>>> view) but we do imply that xenstore+evtchn+gnttab will be available to
>>>> the domU.
>>>>
>>>> Now, static event channels are different. They don't require xenstore
>>>> and they don't require gnttab.
>>>>
>>>> It is as if the current xen,enhanced node actually meant:
>>>>
>>>>    xen,enhanced = "xenstore,gnttab,evtchn";
>>>
>>> Correct.
>>>
>>>>
>>>> and now we are only enabling a subset:
>>>>
>>>>    xen,enhanced = "evtchn";
>>>>
>>>> Is that a correct understanding?
>>>
>>> Yes with some cavears (see below).
>>>
>>>>
>>>>
>>>> If so, we can clarify that:
>>>>
>>>>    xen,enhanced;
>>>>
>>>> it is a convenient shortend for:
>>>>
>>>>    xen,enhanced = "xenstore,gnttab,evtchn";
>>>>
>>>> and that other combinations are also acceptable, e.g.:
>>>>
>>>>    xen,enhanced = "gnttab";
>>>>    xen,enhanced = "evtchn";
>>>>    xen,enhanced = "evtchn,gnttab";
>>>>
>>>> It is OK to panic if the user specifies an option that is currently
>>>> unsupported (e.g. "gnttab").
>>>
>>> So today, if you create the node "xen,xen", the guest will expect to be able
>>> to use both grant-table and event channel.
>>>
>>> Therefore, in the list above, the only configuration we can sensibly support
>>> without any major rework is "evtchn,gnttab".
>>>
>>> If we want to support "evtchn" or "gnttab" only. Then we likely need to define
>>> a new binding (or new version) because neither "regs" nor "interrupts" are
>>> optional (although a guest OS is free to ignore them).
>>
>> Yes I think you are right. I also broadly agree with the rest of your
>> reply.
>>
>> Thinking about it and given the above, we only need 2 "levels" of
>> enhancement:
>>
>> 1) everything: xenstore, gnttab, evtchn
>> 2) gnttab, evtchn, but not xenstore
>>
>> Nothing else is really possible because, as Julien pointed out,
>> "xen,enhanced" implies the xen,xen node in the domU device tree and in
>> turn that node implies both evtchn and gnttab.
> 
> So we could say that xen,enhanced always includes gnttab and Xenstore is optional.

Not really, Xenstore has always been part of the story in Xen. So I 
think making it optional for "xen,enhanced" is going to make more 
difficult for user to understand what the meaning of the option (in 
particular that in the future we may want to support Xenstored in a 
separate domain).

>> So I think we just need to add a way to express 2). We could do
>> something like:
>>
>>   xen,enhanced = "evtchn,gnttab";
> 
> I am a bit puzzled here as gnttab is always there.

What do you mean?

> 
>>
>> Or we could use a new separate option like Julien initially suggested,
>> e.g.:
>>
>>   xen,enhanced-no-xenstore;
>>
>> "xen,enhanced-no-xenstore" is a terrible name actually, but just to
>> explain what I am thinking :-)
> 
> I think most common use case will be to have all, so make sense to allow to disable Xenstore.
> 
> How about:
> xen,enhanced = “no-xenstore” ?

I would be fine with it.

> 
> An other solution is to keep xen,enhanced as it is and introduce a new option:
> Xen,no-xenstore

I don't like the idea of introducing yet another option.

> 
> At the end Xenstore cannot be used if there is no Dom0 and that we can detect easily.
> Also there is no solution at this stage to have an other domain then Dom0 providing
> Xenstore (maybe in the long term someone will want to introduce that and we will need
> a way to specify which domain is handling it).
> 
> So I still think that we could just say that Xenstore can only be active if there is a Dom0
> and just disable Xenstore automatically if it is not the case.

See above about disabling Xenstore automatically.

> If there is a dom0 and someone wants a guest without Xenstore, then we would need to
> have the no-xenstore support.
> But is it a use case ?

Do you mean when "xen,enhanced" is specified? If yes, this could be 
useful if one want to limit the interface exposed to the guest.

> 
> All in all, enhance dom0less was not supported before 4.17 so we will not create any
> backward compatibility issue.

I agree we still have the flexibility to change.

Cheers,

-- 
Julien Grall

