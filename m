Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0227F1F502C
	for <lists+xen-devel@lfdr.de>; Wed, 10 Jun 2020 10:21:22 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jivyf-0006Xq-Kd; Wed, 10 Jun 2020 08:20:53 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ieVI=7X=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1jivye-0006Xl-6E
 for xen-devel@lists.xenproject.org; Wed, 10 Jun 2020 08:20:52 +0000
X-Inumbo-ID: 4b8887c4-aaf3-11ea-b3ed-12813bfff9fa
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 4b8887c4-aaf3-11ea-b3ed-12813bfff9fa;
 Wed, 10 Jun 2020 08:20:51 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 74F1F2064C;
 Wed, 10 Jun 2020 08:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591777250;
 bh=hafAu8H+bcdMTAQQWhBcjfra9YfKGmt8aDKcWr+EsFw=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZPRoPWXu9DMS6DbQyZi+VvFTQvVEB/1Uyci2Cx53X5f63RfOeYxpnSRVgiVXIdVIh
 DBcQdPmUeCc8vjzVThMPf72CJayCxxJ0uNkR/rx1vw7GfOC7GpPwomf1DkjWmAt3u9
 2sLVZeU5htJ2U/idKW9QuXXdWf3EIRId4l0wPaUg=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jivyb-001ieD-0Y; Wed, 10 Jun 2020 09:20:49 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 10 Jun 2020 09:20:48 +0100
From: Marc Zyngier <maz@kernel.org>
To: Bertrand Marquis <Bertrand.Marquis@arm.com>
Subject: Re: Keystone Issue
In-Reply-To: <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDhpwbHTrjDaNmfW81m5Fqt6HbfqoqbGDH1qUxxJtMBmEA@mail.gmail.com>
 <8C6A23AE-6C2B-411F-ACAD-F5574211E8ED@arm.com>
 <CALYbLDiOX0JW_=6AgAb+m5q++3WvQtivJRy+ePrp5pJXd7T9Vg@mail.gmail.com>
 <14244e49-e1ac-a29d-bbd9-bd4c202bf186@xen.org>
 <CALYbLDjCdDvwja1VoahJmnrKDfKyw7DNhYBBcmJv70QDA4+6Ag@mail.gmail.com>
 <77006AAF-BC3B-4C6E-BDFC-577CF87DE64E@arm.com>
 <CALYbLDheT8jWSAqJJZvvjzWGvygJaJ6UG7ejgpLLYeQB-tCsJA@mail.gmail.com>
 <CALYbLDjZu-YzqZPjCk785=4hpd3BRsoXeotd3ygESD_Ezm63Yg@mail.gmail.com>
 <99E77330-049F-4471-ABF9-13F9AB4E95B5@arm.com>
 <CALYbLDizxgaXJzhNVeKVZ6q-Hbttm1T+ZPP7f-1PDvi49VFOjA@mail.gmail.com>
 <alpine.DEB.2.21.2006080911500.2815@sstabellini-ThinkPad-T480s>
 <CALYbLDh8F0JuGmRY0C1Nhp_b4FP041KMa14pOmyoSBtHcz=A2A@mail.gmail.com>
 <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
 <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
 <03607739-A4FF-486A-899A-F5F36870225A@arm.com>
 <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
 <6033f9cecbf10f50f4a713ce52105426@kernel.org>
 <32FA85C2-7685-49D2-875B-9FA1C138C92A@arm.com>
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <d16faf89f25a6183bc6cbdc6148af4b4@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: Bertrand.Marquis@arm.com, julien@xen.org,
 codewiz2280@gmail.com, sstabellini@kernel.org, xen-devel@lists.xenproject.org,
 nd@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: xen-devel <xen-devel@lists.xenproject.org>, nd <nd@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>,
 CodeWiz2280 <codewiz2280@gmail.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

On 2020-06-10 09:06, Bertrand Marquis wrote:
> Hi,
> 
>> On 9 Jun 2020, at 18:45, Marc Zyngier <maz@kernel.org> wrote:
>> 
>> Hi Julien,
>> 
>> On 2020-06-09 18:32, Julien Grall wrote:
>>> (+ Marc)
>>> On 09/06/2020 18:03, Bertrand Marquis wrote:
>>>> Hi
>>>>> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
>>>>> On 09/06/2020 16:28, Bertrand Marquis wrote:
>>>>>> Hi,
>>>>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> 
>>>>>>> wrote:
>>>>>>> There does appear to be a secondary (CIC) controller that can 
>>>>>>> forward
>>>>>>> events to the GIC-400 and EDMA controllers for the keystone 2 
>>>>>>> family.
>>>>>>> Admittedly, i'm not sure how it is being used with regards to the
>>>>>>> peripherals.  I only see mention of the GIC-400 parent for the 
>>>>>>> devices
>>>>>>> in the device tree.  Maybe Bertrand has a better idea on whether 
>>>>>>> any
>>>>>>> peripherals go through the CIC first?  I see that gic_interrupt 
>>>>>>> ()
>>>>>>> fires once in Xen, which calls doIRQ to push out the virtual 
>>>>>>> interrupt
>>>>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt 
>>>>>>> and
>>>>>>> returns, but gic_interrupt() never fires again in Xen.
>>>>>> I do not remember of any CIC but the behaviour definitely look 
>>>>>> like an interrupt acknowledge problem.
>>>>>> Could you try the following:
>>>>>> --- a/xen/arch/arm/gic-v2.c
>>>>>> +++ b/xen/arch/arm/gic-v2.c
>>>>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct 
>>>>>> irq_desc *desc)
>>>>>>      /* Lower the priority of the IRQ */
>>>>>>      gicv2_eoi_irq(desc);
>>>>>>      /* Deactivation happens in maintenance interrupt / via GICV 
>>>>>> */
>>>>>> +
>>>>>> +    /* Test for Keystone2 */
>>>>>> +    gicv2_dir_irq(desc);
>>>>>>  }
>>>>>> I think the problem I had was related to the vgic not deactivating 
>>>>>> properly the interrupt.
>>>>> Are you suggesting the guest EOI is not properly forwarded to the 
>>>>> hardware when LR.HW is set? If so, this could possibly be 
>>>>> workaround in Xen by raising a maintenance interrupt every time a 
>>>>> guest EOI an interrupt.
>>>> Agree the maintenance interrupt would definitely be the right 
>>>> solution
>>> I would like to make sure we aren't missing anything in Xen first.
>>> From what you said, you have encountered this issue in the past with 
>>> a
>>> different hypervisor. So it doesn't look like to be Xen related.
>>> Was there any official statement from TI? If not, can we try to get
>>> some input from them first?
>>> @Marc, I know you dropped 32-bit support in KVM recently :). 
>>> Although,
>> 
>> Yes! Victory is mine! Freedom from the shackles of 32bit, at last! :D
>> 
>>> I was wondering if you heard about any potential issue with guest EOI
>>> not forwarded to the host. This is on TI Keystone (Cortex A-15).
>> 
>> Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda 
>> Midway all run just fine with guest EOI), and GIC-400 is a pretty 
>> solid piece of kit (it is just sloooooow...).
>> 
>> Thinking of it, you would see something like that if the GIC was 
>> seeing the writes coming from the guest as secure instead of NS (cue 
>> the early firmware on XGene that exposed the wrong side of GIC-400).
>> 
>> Is there some kind of funky bridge between the CPU and the GIC?
> 
> Yes the behaviour I had was coherent with the GIC seeing the processor
> in secure mode and not in non secure hence making the VGIC ack non
> functional.

Can you please check this with the TI folks? It may be fixable if
the bridge is SW configurable.

> So the only way to solve this is actually to do the interrupt
> deactivate inside Xen (using a maintenance interrupt).

That's a terrible hack, and one that would encourage badly integrated 
HW.
I appreciate the need to "make things work", but I'd be wary of putting
this in released SW. Broken HW must die. I have written more than my 
share
of these terrible hacks (see TX1 support), and I deeply regret it, as
it has only given Si vendors an excuse not to fix things.

> I remember that I also had to do something specific for the
> configuration of edge/level and priorities to have an almost proper
> behaviour.

Well, the moment the GIC observes secure accesses when they should be
non-secure, all bets are off and you have to resort to the above hacks.
The fun part is that if you have secure SW running on this platform,
you can probably DoS it from non-secure. It's good, isn't it?

> Sadly I have no access to the code anymore, so I would need to guess
> back what that was..

I'd say this *is* a good thing.

         M.
-- 
Jazz is not dead. It just smells funny...

