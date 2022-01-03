Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E90F3483151
	for <lists+xen-devel@lfdr.de>; Mon,  3 Jan 2022 14:15:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.252953.433900 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4NAL-0004MD-Iv; Mon, 03 Jan 2022 13:14:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 252953.433900; Mon, 03 Jan 2022 13:14:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n4NAL-0004KL-Fb; Mon, 03 Jan 2022 13:14:21 +0000
Received: by outflank-mailman (input) for mailman id 252953;
 Mon, 03 Jan 2022 13:14:20 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n4NAK-0004KF-9f
 for xen-devel@lists.xenproject.org; Mon, 03 Jan 2022 13:14:20 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n4NAJ-0007sL-Uj; Mon, 03 Jan 2022 13:14:19 +0000
Received: from 54-240-197-226.amazon.com ([54.240.197.226]
 helo=[192.168.24.212]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n4NAJ-0007tU-Og; Mon, 03 Jan 2022 13:14:19 +0000
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
	bh=rLp3lPXyCNL98uKPu54GR9kl6NDR2PnYH4lkViZpiSc=; b=lFiX6ACl4D6xUb6FgFnEgG8J3J
	tO+0H/65DqoR4zzNGZh9mZUERar3iBqwAfq42RBLVrPck28uKmwuGqXyvycyrsOpIwMbQ00kBxi4M
	/Eg06b4DnsuWL/0izpq6XdbC8p+glZdvqUrLJw2M3w0kcbg4GxiYr8dNA8ScUrGvpL8s=;
Message-ID: <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
Date: Mon, 3 Jan 2022 13:14:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [RFC v1 3/5] xen/arm: introduce SCMI-SMC mediator driver
To: Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc: Oleksandr <olekstysh@gmail.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>
References: <cover.1639472078.git.oleksii_moisieiev@epam.com>
 <e9dadd96aa5b64b9232e10a083ce393af620adde.1639472078.git.oleksii_moisieiev@epam.com>
 <51104b62-14a1-79b8-1184-4f4d8418a2f6@gmail.com>
 <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
 <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
 <20211224170243.GA1022822@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211224170243.GA1022822@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 24/12/2021 17:02, Oleksii Moisieiev wrote:
> On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
>> On 20/12/2021 16:41, Oleksii Moisieiev wrote:
>>>>     2) What are the expected memory attribute for the regions?
>>>
>>> xen uses iommu_permit_access to pass agent page to the guest. So guest can access the page directly.
>>
>> I think you misunderstood my comment. Memory can be mapped with various type
>> (e.g. Device, Memory) and attribute (cacheable, non-cacheable...). What will
>> the firmware expect? What will the guest OS usually?
>>
>> The reason I am asking is the attributes have to matched to avoid any
>> coherency issues. At the moment, if you use XEN_DOMCTL_memory_mapping, Xen
>> will configure the stage-2 to use Device nGnRnE. As the result, the result
>> memory access will be Device nGnRnE which is very strict.
>>
> 
> Let me share with you the configuration example:
> scmi expects memory to be configured in the device-tree:
> 
> cpu_scp_shm: scp-shmem@0xXXXXXXX {
> 	compatible = "arm,scmi-shmem";
> 	reg = <0x0 0xXXXXXX 0x0 0x1000>;
> };
> 
> where XXXXXX address I allocate in alloc_magic_pages function.

The goal of alloc_magic_pages() is to allocate RAM. However, what you 
want is a guest physical address and then map a part of the shared page.

I can see two options here:
   1) Hardcode the SCMI region in the memory map
   2) Create a new region in the memory map that can be used for 
reserving memory for mapping.

We still have plenty of space in the guest memory map. So the former is 
probably going to be fine for now.

> Then I get paddr of the scmi channel for this domain and use
> XEN_DOMCTL_memory_mapping to map scmi channel address to gfn.
>  > Hope I wass able to answer your question.

What you provided me is how the guest OS will locate the shared memory. 
This still doesn't tell me which memory attribute will be used to map 
the page in Stage-1 (guest page-tables).

To find that out, you want to look at the driver and how the mapping is 
done. The Linux driver (drivers/firmware/arm_scmi) is using 
devm_ioremap() (see smc_chan_setup()).

Under the hood, the function devm_ioremap() is using PROT_DEVICE_nGnRE 
(arm64) which is one of the most restrictive memory attribute.

This means the firmware should be able to deal with the most restrictive 
attribute and therefore using XEN_DOMCTL_memory_mapping to map the 
shared page in stage-2 should be fine.

Cheers,

-- 
Julien Grall

