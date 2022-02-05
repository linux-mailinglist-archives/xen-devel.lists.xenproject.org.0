Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 375D74AA8CB
	for <lists+xen-devel@lfdr.de>; Sat,  5 Feb 2022 13:42:10 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.266030.459671 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGKO1-00045c-6k; Sat, 05 Feb 2022 12:41:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 266030.459671; Sat, 05 Feb 2022 12:41:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nGKO1-00043n-2K; Sat, 05 Feb 2022 12:41:53 +0000
Received: by outflank-mailman (input) for mailman id 266030;
 Sat, 05 Feb 2022 12:41:51 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1nGKNz-00042t-Au
 for xen-devel@lists.xenproject.org; Sat, 05 Feb 2022 12:41:51 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGKNs-0003sI-V2; Sat, 05 Feb 2022 12:41:44 +0000
Received: from home.octic.net ([81.187.162.82] helo=[10.0.1.193])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1nGKNs-0006D8-O6; Sat, 05 Feb 2022 12:41:44 +0000
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
	bh=br2bWfu0j617ZJE9HPhSK16fvT3XRgngGuhXvhXBy6M=; b=OxMiI2pS4FEZqYDQwMKiE9gCWK
	QPpj3tyy++riGRdRtsI1zqdYczlWXu2cI9Vi+UyV5Zx16i3OF1pzMZkrmZvhgII0Dj2F8EPgFIFc2
	sgg3PgmG1JrtBRPtrl3pGr9iYPx6q5MqVHq0+vF8K8z1SKwgBJPktM+pXPvfla6m92fg=;
Message-ID: <dfe15bd7-8816-2b7a-2193-6ec4efaccded@xen.org>
Date: Sat, 5 Feb 2022 12:41:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: Xen data from meta-virtualization layer
To: Michael Walle <michael@walle.cc>
Cc: Stefano Stabellini <stefano.stabellini@xilinx.com>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>, Zhiqiang.Hou@nxp.com,
 brucea@xilinx.com, cornelia.bruelhart@zal.aero, leo.krueger@zal.aero,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Peng Fan <peng.fan@nxp.com>, xen-devel <xen-devel@lists.xenproject.org>
References: <alpine.DEB.2.21.2011241743490.7979@sstabellini-ThinkPad-T480s>
 <20220204135814.1033356-1-michael@walle.cc>
 <alpine.DEB.2.22.394.2202041256040.4074808@ubuntu-linux-20-04-desktop>
 <faa7864d4df6d9373a3c6b489d3e4469@walle.cc>
 <CAJ=z9a0GX31E-yQRO3BpOujOCX09yOeeROkC57PzAUTUm3HV6g@mail.gmail.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <CAJ=z9a0GX31E-yQRO3BpOujOCX09yOeeROkC57PzAUTUm3HV6g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 04/02/2022 23:29, Julien Grall wrote:
> This message is harmless. This is printed because Xen on Arm
> doesn't hypercall the hypercall to add a PCI device. On Arm,

I meant "doesn't need the hypercall...".

> we don't need it yet (it might be necessary for PCI passthrough) and
> MSI/MSI-X are handled/registered the same way as on bare-metal
> (for your case through the ITS)
> 
>>
>> Not sure if it should work nonetheless.
> 
> I looked through the log and couldn't spot anything obvious. However,
> skimming through Linux, I noticed there are some changes in the
> ITS for freescale (now NXP) such as:
> 
> drivers/irqchip/irq-gic-v3-its-fsl-mc-msi.c
> 
> Is it something that might be used on the board you are using?
> 
> If the answer is yes, then my suggestion would be to look
> how this is meant to interact with the ITS. It might be possible
> that we are missing some pieces in Xen to properly support it.

Another tree you might want to look at is 
https://source.codeaurora.org/external/imx/imx-xen. It contains a bunch 
of patches for NXP SoC that was never upstreamed.

> 
>>
>>> It is possible that someone in CC to this email might already have a
>>> patch to introduce parsing of iommu-map in Xen.
> 
> Pass. I don't have any and couldn't find any submission on the ML.
> 
> 
>>
>> I guess they've used the old mmu-masters property.
>>
>> Btw. I don't know if it matters, but the SMARC-sAL28 normally doesn't
>> use TF-A and runs without it. Nonetheless, I've booted the board with
>> the bl31 from NXP and it doesn't help either. There is still a
>> difference between the NXP bootflow which uses bl1/bl2/bl31/u-boot
>> and this board which uses u-boot-spl/u-boot or u-boot-spl/bl31/u-boot.
>>
>> I just found GIC setup code in the bl31. I'll also have a look there.
>>
>> -michael
>>
>> [1] https://pastebin.com/raw/XMjE3BvG

Cheers,

-- 
Julien Grall

