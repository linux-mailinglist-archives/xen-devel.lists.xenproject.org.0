Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B398560ADC
	for <lists+xen-devel@lfdr.de>; Wed, 29 Jun 2022 22:05:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.358060.587036 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6duj-00039V-Ae; Wed, 29 Jun 2022 20:03:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 358060.587036; Wed, 29 Jun 2022 20:03:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1o6duj-00037G-7d; Wed, 29 Jun 2022 20:03:53 +0000
Received: by outflank-mailman (input) for mailman id 358060;
 Wed, 29 Jun 2022 20:03:51 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=6n86=XE=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1o6duh-00037A-69
 for xen-devel@lists.xenproject.org; Wed, 29 Jun 2022 20:03:51 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 969de4bb-f7e6-11ec-bd2d-47488cf2e6aa;
 Wed, 29 Jun 2022 22:03:49 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA8E6620D2;
 Wed, 29 Jun 2022 20:03:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A553C34114;
 Wed, 29 Jun 2022 20:03:45 +0000 (UTC)
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
X-Inumbo-ID: 969de4bb-f7e6-11ec-bd2d-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1656533027;
	bh=welFEjVoKls0lDEjJTFKkpCLJrP+fIwuTGzM9lJhdbM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jQ/6N+RcquSq/VinnIGfZma81pTSCvwbpUyOr556DOn5aJWN1CaR/xbqPHFqKndhr
	 xS+Gm7p1WTaV5Apk3YAx11sIpGBT+dYtYuiA6UVtucnsGIzXasxe0YXFNgHeaBtfo8
	 wx9Y4/0r7JRXwjsAAo/vkdQ2Z5tBYf8MDjDTgl9+qRhaWabqgSyvnpola5Enain/rM
	 1JUKe78dMS97GYN5rSoXa72e6xr6ST1NHpYWw09RtvV/lOHRQIjznpcw+9uft7Pa1W
	 DbWX7HcspjO+zpFQo3c8jWahfNyW4mIOePVDmMp18IL60OgrvjWDveQ4HFvx4dnPpH
	 9n3tpnysFhM4A==
Date: Wed, 29 Jun 2022 13:03:44 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Julien Grall <julien@xen.org>
cc: "SK, SivaSangeetha (Siva Sangeetha)" <SivaSangeetha.SK@amd.com>, 
    "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, jgross@suse.com, 
    boris.ostrovsky@oracle.com
Subject: Re: Reg. Tee init fail...
In-Reply-To: <7689497b-1977-b30a-5835-587fa266c721@xen.org>
Message-ID: <alpine.DEB.2.22.394.2206291251240.4389@ubuntu-linux-20-04-desktop>
References: <DM4PR12MB5200C7C38770E07B5946424A80B49@DM4PR12MB5200.namprd12.prod.outlook.com> <7689497b-1977-b30a-5835-587fa266c721@xen.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Adding Juergen and Boris because this is a Linux/x86 issue.


As you can see from this Linux driver:
https://elixir.bootlin.com/linux/latest/source/drivers/crypto/ccp/tee-dev.c#L132

Linux as dom0 on x86 is trying to communicate with firmware (TEE). Linux
is calling __pa to pass a physical address to firmware. However, __pa
returns a "fake" address not an mfn. I imagine that a quick workaround
would be to call "virt_to_machine" instead of "__pa" in tee-dev.c.

Normally, if this was a device, the "right fix" would be to use
swiotlb-xen:xen_swiotlb_map_page to get back a real physical address.

However, xen_swiotlb_map_page is meant to be used as part of the dma_ops
API and takes a struct device *dev as input parameter. Maybe
xen_swiotlb_map_page can be used for tee-dev as well?


Basically tee-dev would need to call dma_map_page before passing
addresses to firmware, and dma_unmap_page when it is done. E.g.:


  cmd_buffer = dma_map_page(dev, virt_to_page(cmd),
                            cmd & ~PAGE_MASK,
                            ring_size,
                            DMA_TO_DEVICE);


Juergen, Boris,
what do you think?



On Fri, 24 Jun 2022, Julien Grall wrote:
> Hi,
> 
> (moving the discussion to xen-devel as I think it is more appropriate)
> 
> On 24/06/2022 10:53, SK, SivaSangeetha (Siva Sangeetha) wrote:
> > [AMD Official Use Only - General]
> 
> Not clear what this means.
> 
> > 
> > Hi Xen team,
> > 
> > In TEE driver, We allocate a ring buffer, get its physical address from
> > __pa() macro, pass the physical address to secure processor for mapping it
> > and using in secure processor side.
> > 
> > Source:
> > https://elixir.bootlin.com/linux/latest/source/drivers/crypto/ccp/tee-dev.c#L132
> > 
> > This works good natively in Dom0 on the target.
> > When we boot the same Dom0 kernel, with Xen hypervisor enabled, ring init
> > fails.
> 
> Do you have any error message or error code?
> 
> > 
> > 
> > We suspect that the address passed to secure processor, is not same when xen
> > is enabled, and when xen is enabled, some level of address translation might
> > be required to get exact physical address.
> 
> If you are using Xen upstream, Dom0 will be mapped with IPA == PA. So there
> should be no need for translation.
> 
> Can you provide more details on your setup (version of Xen, Linux...)?
> 
> Cheers,
> 
> -- 
> Julien Grall
> 

