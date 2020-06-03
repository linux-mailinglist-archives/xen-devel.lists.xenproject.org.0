Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEA71ECE69
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 13:33:07 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgRdc-00011Y-6f; Wed, 03 Jun 2020 11:32:52 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rNY3=7Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgRda-00011T-UQ
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 11:32:50 +0000
X-Inumbo-ID: f4b7d446-a58d-11ea-9947-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id f4b7d446-a58d-11ea-9947-bc764e2007e4;
 Wed, 03 Jun 2020 11:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hrefAA9Jg4cRJk55r6WANYtsWiWZsDqnYSBXDaZiI+4=; b=5n7vyFDxYnxUgR/unYz6AjUAP2
 6B4/LuVvWVBW/2C2whcJoPpekPEOs+uwWkgaZusn28F2hGPYkdZzK+/AWpMwsOv4HV9ZeuVxrlkmq
 PoLCYq5P2KiUJYoLWJHtS4JpS584zwYRNaGbOARohn/OqUWwtVBnk0Anz+umkQOF3D+c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgRdZ-0002kn-8x; Wed, 03 Jun 2020 11:32:49 +0000
Received: from [54.239.6.186] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgRdZ-0008W5-2e; Wed, 03 Jun 2020 11:32:49 +0000
Subject: Re: Keystone Issue
To: CodeWiz2280 <codewiz2280@gmail.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
Date: Wed, 3 Jun 2020 12:32:47 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
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
Cc: xen-devel@lists.xenproject.org, Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

(+Bertrand and Stefano)

On 01/06/2020 18:38, CodeWiz2280 wrote:
> Hi Julien,

Hi Dave,

> 
> As requested please see log below from the eval board booting dom0, some 
> notes are as follows:

Thanks for the logs and the notes. They are useful to understand your issue.

> 1. The offset that gets applied to the 32-bit address to translate it 
> to 36-bits is 0x7_8000_0000

Is this offset present in the Device-Tree?

> 2. Uboot has been setup to not change the address of the memory in the 
> device tree prior to launching xen, otherwise it would 
> automatically offset it and replace it with a 36-bit address and xen 
> would immediately panic at the 36-bit address for a 32-bit processor.

What is the list of the memory banks Xen will see?

Xen is able to support 36-bit address, can you point to the panic() you 
are hitting?

> 3. The RAM starting address placed in the device tree is 0x8000_0000, 
> which gets carved up by xen and replaced with 0xA000_0000 prior to 
> booting dom0..  I had to put in test code to have the kernel offset the 
> 0xA000_0000 32-bit starting address to the 36-bit address needed before 
> the kernel will attempt to switch.  If it stays 32-bit then it will not 
> switch over the address space.  Note that without xen in play uboot 
> would normally replace the address in the device tree with the 36-bit one.

IIUC, in the case of Linux boot directly, the Device-Tree will not 
describe the low memory range. Is that correct?

> 4. The dom0 kernel will boot from xen if the early_paging_init switch 
> step is skipped, and the low mem stays in 32-bit....but there is a 
> problem with the peripherals so this is not an acceptable solution.

Can you details a bit more the problem with the peripherals?

> 
> It seems that either the kernel would need some API to tell xen that 
> there is going to be a change in the memory its using prior to call 
> early_paging_init(), 

 From my understanding, the problem is very specific to the KeyStone. So 
I would rather avoid to introduce an hypercall specific to your 
platform. But...

> or Xen would need to add the additional 36-bit 
> addresses during the memory bank allocation step....but recognize that 
> they are not actually different physical memory but just aliased to a 
> different address.

... I think it is possible to fix it entirely in Xen without any 
modification in the device-tree.

It is seems better that Xen treats the low memory region as "not usable" 
and only use the high memory region internally. When allocating a Dom0 
memory banks, it would need to ensure that there is a corresponding 
alias in low memory.

Xen will also need to do two mappings in the Dom0 stage-2 page-tables. 
The extra one is for the alias.

This approach will prevent to use hypercall buffer from low memory and 
therefore require your guest to support LPAE. Is it going to be an issue 
for you?

Cheers,

-- 
Julien Grall

