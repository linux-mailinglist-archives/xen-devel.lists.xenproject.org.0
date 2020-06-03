Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CD61ED5DD
	for <lists+xen-devel@lfdr.de>; Wed,  3 Jun 2020 20:10:06 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1jgXpH-0003Bz-Vs; Wed, 03 Jun 2020 18:09:19 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=rNY3=7Q=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1jgXpG-0003Bq-Hi
 for xen-devel@lists.xenproject.org; Wed, 03 Jun 2020 18:09:18 +0000
X-Inumbo-ID: 5745ba88-a5c5-11ea-81bc-bc764e2007e4
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5745ba88-a5c5-11ea-81bc-bc764e2007e4;
 Wed, 03 Jun 2020 18:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z3kV3c89rh2AGBiuIci0itQ8FahxqdbX55Sg4/68Wpk=; b=vpvCVmSJtRB+3wEyXgiHXAbjpA
 HJEIvPJ3ei/LjkdVHDyArp+9ZqcUih1Nq5PYd6DcyPXshj9BJgVPOQt5TQl+cxrv1hHBkOTurqi4s
 SXdynXjjHQqGVSwqhQQElMlE3ZHw+iN44zSOvXe4faLLU7G8TYrDziF5kCs9Zb9jq5Qs=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgXpF-0003H7-1S; Wed, 03 Jun 2020 18:09:17 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1jgXpE-0008Lg-RE; Wed, 03 Jun 2020 18:09:16 +0000
Subject: Re: Keystone Issue
To: CodeWiz2280 <codewiz2280@gmail.com>
References: <CALYbLDiNtHZusupf8=yhKtw1EA7HjMP3o3+WGdv9Omv9v8yVHg@mail.gmail.com>
 <fce2434d-9a0c-50ef-46b6-5858ede00bc4@xen.org>
 <CALYbLDgwjjF5C+CrVn5bYiGVEmocAhmTDKmdj8aAxzsfjcVs0g@mail.gmail.com>
 <CALYbLDit9mx=DHbUAu2mTrKTvkxt3RfPhV1xQPRVP1gPmxU6aw@mail.gmail.com>
 <25953300-f69d-19a4-9215-49cfedbd16ed@xen.org>
 <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <deee1523-cfb5-f186-11a3-33fa1f7b94c1@xen.org>
Date: Wed, 3 Jun 2020 19:09:15 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <CALYbLDh3C02+CV88LqR2zv+ggRgup-Qhi+udGzgePmkdM0KcFw@mail.gmail.com>
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



On 03/06/2020 18:13, CodeWiz2280 wrote:
> Hi Julien,

Hello,

In general, we avoid top post on xen-devel, instead we reply inline. I 
believe gmail should allow you to do it :).

> 
> The offset is already applied to the memory nodes in the device tree, 
> meaning a direct Linux boot from uboot would have only the 36-bit 
> addresses in the device tree (0x8_0000_0000 and 0x8_8000_0000).  Linux 
> would start executing from a 32-bit address space however and then 
> switch over to the aliased 36-bit addresses in the device tree as 
> discussed below by early_paging_init().
> 
> I had to add the 32-bit memory node 0x8000_0000 in uboot in place of the 
> 0x8_0000_0000 node otherwise Xen would detect the 32-bit processor and 
> panic on "Unable to detect the first memory bank" in domain_build.c. 

So for 32-bit Xen requires to have the first bank below 4GB. This is 
because you can't boot from a physical address above 32-bit.

Obviously, this check wouldn't work on your platform because all your 
memory will be above 4GB.

> If 
> I leave only the 36-bit addresses in the device tree and skip past the 
> panic check in domain_build.c, then I could not get the dom0 kernel to 
> boot at all.  I believe I would only see "Serial input to DOM0" and 
> nothing else at that point.

Which would make sense per above.

> 
> Yes, leaving LPAE support on for the kernel is preferred.

Ok, so the solution I suggested below should work. Unfortunately, I 
don't have time to work on it. Although, I would be more than happy to 
answers questions and reviewing the patches.

Would you be willing to have a try to implement it?

Cheers,

-- 
Julien Grall

