Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A97081F3FC6
	for <lists+xen-devel@lfdr.de>; Tue,  9 Jun 2020 17:48:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jigTg-0005Ot-QZ; Tue, 09 Jun 2020 15:47:52 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=ZEd4=7W=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jigTe-0005Om-Nm
 for xen-devel@lists.xenproject.org; Tue, 09 Jun 2020 15:47:50 +0000
X-Inumbo-ID: 9231ae3e-aa68-11ea-b339-12813bfff9fa
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9231ae3e-aa68-11ea-b339-12813bfff9fa;
 Tue, 09 Jun 2020 15:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=knUPWeEHpKkGT/n+B/uvklakdHQkghzNXzeHLXijbDg=; b=sjfp+Wi90YW819JgWkcmBk/neQ
 2Pwm8+K5NehwqXWprRAd8/9vISzCU0IEgV2RYAc7qBVkAewoe42RlE4rjZFE2yEmmXUUTEghRWoUO
 e6Bvv3lIBXuCgSjzPrRoWTkVrf9dFAhIHu8V+WB9SqLGvzxOzmI62YUU5SStk3mkdnF0=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jigTd-00028Q-5C; Tue, 09 Jun 2020 15:47:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jigTc-0005sM-Us; Tue, 09 Jun 2020 15:47:49 +0000
Subject: Re: Keystone Issue
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 CodeWiz2280 <codewiz2280@gmail.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
 <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
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
From: Julien Grall <julien@xen.org>
Message-ID: <b28cbead-c7ce-7848-4e21-109a022e64da@xen.org>
Date: Tue, 9 Jun 2020 16:47:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <363A05E0-61C6-4AE4-9C84-EEAC466989D8@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 Stefano Stabellini <sstabellini@kernel.org>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>



On 09/06/2020 16:28, Bertrand Marquis wrote:
> Hi,
> 
>> On 9 Jun 2020, at 15:33, CodeWiz2280 <codewiz2280@gmail.com> wrote:
>>
>> There does appear to be a secondary (CIC) controller that can forward
>> events to the GIC-400 and EDMA controllers for the keystone 2 family.
>> Admittedly, i'm not sure how it is being used with regards to the
>> peripherals.  I only see mention of the GIC-400 parent for the devices
>> in the device tree.  Maybe Bertrand has a better idea on whether any
>> peripherals go through the CIC first?  I see that gic_interrupt ()
>> fires once in Xen, which calls doIRQ to push out the virtual interrupt
>> to the dom0 kernel.  The dom0 kernel then handles the interrupt and
>> returns, but gic_interrupt() never fires again in Xen.
> 
> I do not remember of any CIC but the behaviour definitely look like an interrupt acknowledge problem.
> 
> Could you try the following:
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -667,6 +667,9 @@ static void gicv2_guest_irq_end(struct irq_desc *desc)
>       /* Lower the priority of the IRQ */
>       gicv2_eoi_irq(desc);
>       /* Deactivation happens in maintenance interrupt / via GICV */
> +
> +    /* Test for Keystone2 */
> +    gicv2_dir_irq(desc);
>   }
> 
> I think the problem I had was related to the vgic not deactivating properly the interrupt.

Are you suggesting the guest EOI is not properly forwarded to the 
hardware when LR.HW is set? If so, this could possibly be workaround in 
Xen by raising a maintenance interrupt every time a guest EOI an interrupt.

> This might make the interrupt fire indefinitely !!

Most likely with level interrupt ;).

Cheers,

-- 
Julien Grall

