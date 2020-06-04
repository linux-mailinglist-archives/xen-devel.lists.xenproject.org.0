Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DC181EE066
	for <lists+xen-devel@lfdr.de>; Thu,  4 Jun 2020 11:00:46 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgliz-0007uK-Ak; Thu, 04 Jun 2020 08:59:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=uZ5H=7R=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jglix-0007uF-Qh
 for xen-devel@lists.xenproject.org; Thu, 04 Jun 2020 08:59:43 +0000
X-Inumbo-ID: bb180d32-a641-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id bb180d32-a641-11ea-9947-bc764e2007e4;
 Thu, 04 Jun 2020 08:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r4y/N2C0djKsg8FqZM/vBcEgbQvLvqVDERZBiJhJQoY=; b=tk0S+4L+BXkHROMRjVXWGBsiZ+
 csk98VfX8f4EFc+5hw2ZRUksiB/ngPDa4VIHTJYcLV3N4CRnHco4r/WXxN/tJWR/BI3lWVnbZJPab
 F/gO2O254Kd6lrWW6LHgmRdc5sQeiKtd4PkxR0OG9ie0FM1CWS3IcLuYpOf9vmurmte8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgliw-0008B6-P5; Thu, 04 Jun 2020 08:59:42 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgliw-0001nt-I0; Thu, 04 Jun 2020 08:59:42 +0000
Subject: Re: Keystone Issue
To: Bertrand Marquis <Bertrand.Marquis@arm.com>,
 CodeWiz2280 <codewiz2280@gmail.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
 <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
 <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <3ff17aa9-0aae-d598-40ce-4e90d4e50cc7@xen.org>
Date: Thu, 4 Jun 2020 09:59:40 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <8C39F9D0-8351-4671-9A39-D5D4BFF02BD6@arm.com>
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



On 04/06/2020 09:02, Bertrand Marquis wrote:
> Hi,

Hi Bertrand,

> 
>> On 3 Jun 2020, at 19:09, Julien Grall <julien@xen.org> wrote:
>>
>>
>>
>> On 03/06/2020 18:13, CodeWiz2280 wrote:
>>> Hi Julien,
>>
>> Hello,
>>
>> In general, we avoid top post on xen-devel, instead we reply inline. I believe gmail should allow you to do it :).
>>
>>> The offset is already applied to the memory nodes in the device tree, meaning a direct Linux boot from uboot would have only the 36-bit addresses in the device tree (0x8_0000_0000 and 0x8_8000_0000).  Linux would start executing from a 32-bit address space however and then switch over to the aliased 36-bit addresses in the device tree as discussed below by early_paging_init().
>>> I had to add the 32-bit memory node 0x8000_0000 in uboot in place of the 0x8_0000_0000 node otherwise Xen would detect the 32-bit processor and panic on "Unable to detect the first memory bank" in domain_build.c.
>>
>> So for 32-bit Xen requires to have the first bank below 4GB. This is because you can't boot from a physical address above 32-bit.
>>
>> Obviously, this check wouldn't work on your platform because all your memory will be above 4GB.
> 
> I think that the Keystone board has low memory accessible at 2 different address (one low and one high).
> 
> I would here suggest to have a dtb with 2 regions (one under 4GB and one over) and remove from the region over 4G the area already addressed by the region under 4GB.

I thought about this. However, in an earlier reply, David wrote:

"4. The dom0 kernel will boot from xen if the early_paging_init switch 
step is skipped, and the low mem stays in 32-bit....but there is a
problem with the peripherals so this is not an acceptable solution."

It is not clear to me what sort of issues will arise with the 
peripherals. But I have assumed that it wouldn't be possible for Dom0 to 
keep using the memory below 4GB.

Cheers,

-- 
Julien Grall

