Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F0A1F42AC
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 19:46:42 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jiiJz-0001yu-LF; Tue, 09 Jun 2020 17:45:59 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=EzbH=7W=kernel.org=maz@srs-us1.protection.inumbo.net>)
 id 1jiiJy-0001yp-23
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 17:45:58 +0000
X-Inumbo-ID: 12cf4636-aa79-11ea-8496-bc764e2007e4
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 12cf4636-aa79-11ea-8496-bc764e2007e4;
 Tue, 09 Jun 2020 17:45:57 +0000 (UTC)
Received: from disco-boy.misterjones.org (disco-boy.misterjones.org
 [51.254.78.96])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BFA39207ED;
 Tue,  9 Jun 2020 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591724756;
 bh=wlYabBiJGc7VSyncs6OWlQqlLE2Ut4rsDNdk6MY5J9I=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Rg8qy68Q9gMeVk5CtcZkF45VwE3MzspL/JUpzmRz3skLNCh6eGTwMSQTVdmOg8MrW
 Jy1B90gcDxJOdkh94D9fHreCd4KfvEFTY8AbjQFQzOz4h7475vC7kz53ORShzVpraG
 aIZNqVNIqJAHYxMDteRJUyt+BVwU88IF59uzCQHA=
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <maz@kernel.org>)
 id 1jiiJv-001WTZ-At; Tue, 09 Jun 2020 18:45:55 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Jun 2020 18:45:55 +0100
From: Marc Zyngier <maz@kernel.org>
To: Julien Grall <julien@xen.org>
Subject: Re: Keystone Issue
In-Reply-To: <2ec6255c-9d28-92e7-bd0a-59edb9fc078a@xen.org>
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
User-Agent: Roundcube Webmail/1.4.4
Message-ID: <6033f9cecbf10f50f4a713ce52105426@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: julien@xen.org, Bertrand.Marquis@arm.com,
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
 Stefano Stabellini <sstabellini@kernel.org>,
 CodeWiz2280 <codewiz2280@gmail.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Julien,

On 2020-06-09 18:32, Julien Grall wrote:
> (+ Marc)
> 
> On 09/06/2020 18:03, Bertrand Marquis wrote:
>> Hi
>> 
>>> On 9 Jun 2020, at 16:47, Julien Grall <julien@xen.org> wrote:
>>> 
>>> 
>>> 
>>> On 09/06/2020 16:28, Bertrand Marquis wrote:
>>>> Hi,
>>>>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>>>> 
>>>>> There does appear to be a secondary (CIC) controller that can 
>>>>> forward
>>>>> events to the GIC-400 and EDMA controllers for the keystone 2 
>>>>> family.
>>>>> Admittedly, i'm not sure how it is being used with regards to the
>>>>> peripherals.  I only see mention of the GIC-400 parent for the 
>>>>> devices
>>>>> in the device tree.  Maybe Bertrand has a better idea on whether 
>>>>> any
>>>>> peripherals go through the CIC first?  I see that gic_interrupt ()
>>>>> fires once in Xen, which calls doIRQ to push out the virtual 
>>>>> interrupt
>>>>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
>>>>> returns, but gic_interrupt() never fires again in Xen.
>>>> I do not remember of any CIC but the behaviour definitely look like 
>>>> an interrupt acknowledge problem.
>>>> Could you try the following:
>>>> --- a/xen/arch/arm/gic-v2.c
>>>> +++ b/xen/arch/arm/gic-v2.c
>>>> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc 
>>>> *desc)
>>>>       /* Lower the priority of the IRQ */
>>>>       gicv2_eoi_irq(desc);
>>>>       /* Deactivation happens in maintenance interrupt / via GICV */
>>>> +
>>>> +    /* Test for Keystone2 */
>>>> +    gicv2_dir_irq(desc);
>>>>   }
>>>> I think the problem I had was related to the vgic not deactivating 
>>>> properly the interrupt.
>>> 
>>> Are you suggesting the guest EOI is not properly forwarded to the 
>>> hardware when LR.HW is set? If so, this could possibly be workaround 
>>> in Xen by raising a maintenance interrupt every time a guest EOI an 
>>> interrupt.
>> 
>> Agree the maintenance interrupt would definitely be the right solution
> I would like to make sure we aren't missing anything in Xen first.
> From what you said, you have encountered this issue in the past with a
> different hypervisor. So it doesn't look like to be Xen related.
> 
> Was there any official statement from TI? If not, can we try to get
> some input from them first?
> 
> @Marc, I know you dropped 32-bit support in KVM recently :). Although,

Yes! Victory is mine! Freedom from the shackles of 32bit, at last! :D

> I was wondering if you heard about any potential issue with guest EOI
> not forwarded to the host. This is on TI Keystone (Cortex A-15).

Not that I know of. A-15 definitely works (TC2, Tegra-K1, Calxeda Midway 
all run just fine with guest EOI), and GIC-400 is a pretty solid piece 
of kit (it is just sloooooow...).

Thinking of it, you would see something like that if the GIC was seeing 
the writes coming from the guest as secure instead of NS (cue the early 
firmware on XGene that exposed the wrong side of GIC-400).

Is there some kind of funky bridge between the CPU and the GIC?

         M.
-- 
Jazz is not dead. It just smells funny...

