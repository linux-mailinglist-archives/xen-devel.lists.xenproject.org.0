Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C121EEA3E
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 20:25:41 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jguXx-0006Um-LB; Thu, 04 Jun 2020 18:24:57 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jguXv-0006Uh-4v
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 18:24:55 +0000
X-Inumbo-ID: afe91718-a690-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id afe91718-a690-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 18:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o2u7qRwIyA6KctdfLGyL3Welp9ALHkwiNc9pTMz3FFQ=; b=20ytp0FBg7R51BGBpDWkPmN2aR
 lqrLBXyGtY7AwnRONBzgWLvgSH6lfPOhRHqumhitKGO4QgFLwJ3o38TRVRtVV6xDamrjq6oBt2pKz
 stUw+INya/GKEeQLGeUt+xKxqfQeFtP+ZVmfPKNsVC4HDajBfzBfWLO7dvKqeQBj6118=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jguXu-0003o2-9C; Thu, 04 Jun 2020 18:24:54 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jguXu-0001GI-2r; Thu, 04 Jun 2020 18:24:54 +0000
Subject: Re: Keystone Issue
To: CodeWiz2280 <codewiz2280@gmail.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
 <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
 <00E14EAD-BD23-4A3A-872E-0C47C26B7B41@arm.com>
 <c2466674-a56e-08a4-7f3f-2438d5565953@xen.org>
 <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <da23ecc8-60f0-8a26-58d5-ea692dcf0102@xen.org>
Date: Thu, 4 Jun 2020 19:24:52 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CALYbLDjNptWfVMGjw801y6f0zu40b2pzBnLS+w2Zx5eVStCUYQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
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
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi,

On 04/06/2020 13:07, CodeWiz2280 wrote:
> On Thu, Jun 4, 2020 at 6:16 AM Julien Grall <julien@xen.org> wrote:
>>
>> Hi,
>>
>> On 04/06/2020 10:08, Bertrand Marquis wrote:
>>> I would have thought that linux would have need some memory, even small in the 32bit space in order to boot.
>>
>> Yes it needs some, but then they are switching to use the high memory
>> alias after the MMU has been switch on.
>>
>>   From my understanding, the only difference is the page-tables will
>> point to the high memory alias address rather than the low memory one.
>> Linux will still be located at the same place but now accessed from the
>> high memory alias rather than the low one.
>>
>> Note that AFAICT the secondary CPUs will still be brought-up using the
>> low memory alias.
>>
>>> I could understand that some memory in the low address space needs to be reserved by Linux as DMA area for peripherals not supporting 36-bit addresses, but the whole low memory sounds like a big restriction.
>> Many platforms have devices only supporting 32-bit DMA, but none of them
>> require such aliasing. So this doesn't look to be the issue here.
>>
>> TBH, this code is only used by Keystone and switching address space is
>> expensive (you have to turn off the MMU, updates page-tables, flush the
>> cache...). I find hard to believe a developper would have come up with
>> this complexity if it were possible to always use the low memory address
>> range. It is even harder to believe Linux community would have accepted it.
>>
>>>
>>> Would it be possible to have a bit more information on the “problem with peripherals” here ?
>>
>> I am curious as well, so I looked in more depth :). Going through the
>> Linux history, one of the commit message [1] suggests they are switching
>> to a coherent address space. The datasheet [2] (page 75) also confirm
>> that the low region is not IO coherent.
>>
>> So I think you would not be able to do DMA without flush the cache which
>> can be pretty expensive. For a PoC, it might be possible to force Linux
>> flushing the area before and after each DMA request. This should be
>> possible by marking the devices as not coherent.
>>
>> Although, I am not entirely sure if there is any fallout.
>>
>> @Dave, do you think it is possible for you to have a try? I can provide
>> the patch for Linux to disable DMA coherency if possible.
> I attempted to do that, where I removed the "dma-coherent" flags from
> the device tree.  There are likely other issues, but the most glaring
> problem that I ran into is that the ethernet does not work.  Eth0
> shows up in ifconfig but there is no activity on it after a small
> handful of message exchanges, whereas booting without Xen it seems to
> work fine even if left in 32-bit mode (with the dma-coherent
> disabled).  I don't know what implications behind the scenes there are
> trying to stay in the lower 0x8000_0000 alias range either though. 

Thank you for the answer. As wrote, Linux is working fine in 32-bit mode 
when dma-coherent is left in 32-bit mode. So this suggest a different 
issue on the platform.

Given that you receive an handful of packet and then nothing, this would 
lead to maybe an interrupt problem. Can you check whether the number of 
interrupts increments the same way on baremetal and on Xen?

Dumping /proc/interrupts should be sufficient.

> I
> would rather run it as intended by switching to the upper
> 0x8_0000_0000 alias region.

I agree this would be ideal :).

Cheers,

-- 
Julien Grall

