Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A8F48674D
	for <lists+xen-devel@lfdr.de>; Thu,  6 Jan 2022 17:04:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.254146.435715 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VFm-0001Ls-En; Thu, 06 Jan 2022 16:04:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 254146.435715; Thu, 06 Jan 2022 16:04:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n5VFm-0001K2-B1; Thu, 06 Jan 2022 16:04:38 +0000
Received: by outflank-mailman (input) for mailman id 254146;
 Thu, 06 Jan 2022 16:04:37 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n5VFl-0001Jt-0k
 for xen-devel@lists.xenproject.org; Thu, 06 Jan 2022 16:04:37 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n5VFk-0008BU-NI; Thu, 06 Jan 2022 16:04:36 +0000
Received: from [54.239.6.184] (helo=[192.168.20.220])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n5VFk-000434-HI; Thu, 06 Jan 2022 16:04:36 +0000
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
	bh=g2pHpBzIchBGy91Y6oUrUXByn3LRPeRyYuN4azWyzio=; b=Kk01lNo/jVyPNi7Kr6U4dSXibY
	zUqnufwDmmm5du6M4PSVfwpEHJKlnyvS9nAOiu3cj1og/NMDWWt1oOxFoik7OJz8RKxZfuV4RMO+j
	uSnMthXSYZKX2GndyFmuJMMej+RFNietB2n0YFS6SX+JPMnIp0cr2OE9d6j+6zXkpFN0=;
Message-ID: <548d4954-96bf-6522-6cfc-98b4a0e02b51@xen.org>
Date: Thu, 6 Jan 2022 16:04:34 +0000
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
References: <20211217132304.GA4041869@EPUAKYIW015D>
 <04263b01-85a1-a6cf-9c36-a31629caef12@xen.org>
 <20211217135855.GA4072899@EPUAKYIW015D>
 <7924e699-5e70-6fdc-8633-6a15894d66db@xen.org>
 <20211220154127.GA1688861@EPUAKYIW015D>
 <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
 <20211224170243.GA1022822@EPUAKYIW015D>
 <045b2836-c95d-541b-462b-d276ae058b0d@xen.org>
 <20220106135328.GA1413532@EPUAKYIW015D>
 <55954632-e2c7-5455-6538-29c7990c8f62@xen.org>
 <20220106154338.GA1460271@EPUAKYIW015D>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20220106154338.GA1460271@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/01/2022 15:43, Oleksii Moisieiev wrote:
> On Thu, Jan 06, 2022 at 02:02:10PM +0000, Julien Grall wrote:
>>
>>
>> On 06/01/2022 13:53, Oleksii Moisieiev wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>>
>>> On Mon, Jan 03, 2022 at 01:14:17PM +0000, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 24/12/2021 17:02, Oleksii Moisieiev wrote:
>>>>> On Fri, Dec 24, 2021 at 03:42:42PM +0100, Julien Grall wrote:
>>>>>> On 20/12/2021 16:41, Oleksii Moisieiev wrote:
>>>>>>>>       2) What are the expected memory attribute for the regions?
>>>>>>>
>>>>>>> xen uses iommu_permit_access to pass agent page to the guest. So guest can access the page directly.
>>>>>>
>>>>>> I think you misunderstood my comment. Memory can be mapped with various type
>>>>>> (e.g. Device, Memory) and attribute (cacheable, non-cacheable...). What will
>>>>>> the firmware expect? What will the guest OS usually?
>>>>>>
>>>>>> The reason I am asking is the attributes have to matched to avoid any
>>>>>> coherency issues. At the moment, if you use XEN_DOMCTL_memory_mapping, Xen
>>>>>> will configure the stage-2 to use Device nGnRnE. As the result, the result
>>>>>> memory access will be Device nGnRnE which is very strict.
>>>>>>
>>>>>
>>>>> Let me share with you the configuration example:
>>>>> scmi expects memory to be configured in the device-tree:
>>>>>
>>>>> cpu_scp_shm: scp-shmem@0xXXXXXXX {
>>>>> 	compatible = "arm,scmi-shmem";
>>>>> 	reg = <0x0 0xXXXXXX 0x0 0x1000>;
>>>>> };
>>>>>
>>>>> where XXXXXX address I allocate in alloc_magic_pages function.
>>>>
>>>> The goal of alloc_magic_pages() is to allocate RAM. However, what you want
>>>> is a guest physical address and then map a part of the shared page.
>>>
>>> Do you mean that I can't use alloc_magic_pages to allocate shared
>>> memory region for SCMI?
>> Correct. alloc_magic_pages() will allocate a RAM page and then assign to the
>> guest. From your description, this is not what you want because you will
>> call XEN_DOMCTL_memory_mapping (and therefore replace the mapping).
>>
> 
> Ok thanks, I will refactor this part in v2.
> 
>>>
>>>>
>>>> I can see two options here:
>>>>     1) Hardcode the SCMI region in the memory map
>>>>     2) Create a new region in the memory map that can be used for reserving
>>>> memory for mapping.
>>>
>>> Could you please explain what do you mean under the "new region in the
>>> memory map"?
>>
>> I mean reserving some guest physical address that could be used for map host
>> physical address (e.g. SCMI region, GIC CPU interface...).
>>
>> So rather than hardcoding the address, we have something more flexible.
>>
> 
> Ok, I will fix that in v2.

Just for avoidance of doubt. I was clarify option 2 and not requesting 
to implement. That said, if you want to implement option 2 I would be 
happy to review it.

> 
>>>
>>>>
>>>> We still have plenty of space in the guest memory map. So the former is
>>>> probably going to be fine for now.
>>>>
>>>>> Then I get paddr of the scmi channel for this domain and use
>>>>> XEN_DOMCTL_memory_mapping to map scmi channel address to gfn.
>>>>>    > Hope I wass able to answer your question.
>>>>
>>>> What you provided me is how the guest OS will locate the shared memory. This
>>>> still doesn't tell me which memory attribute will be used to map the page in
>>>> Stage-1 (guest page-tables).
>>>>
>>>> To find that out, you want to look at the driver and how the mapping is
>>>> done. The Linux driver (drivers/firmware/arm_scmi) is using devm_ioremap()
>>>> (see smc_chan_setup()).
>>>>
>>>> Under the hood, the function devm_ioremap() is using PROT_DEVICE_nGnRE
>>>> (arm64) which is one of the most restrictive memory attribute.
>>>>
>>>> This means the firmware should be able to deal with the most restrictive
>>>> attribute and therefore using XEN_DOMCTL_memory_mapping to map the shared
>>>> page in stage-2 should be fine.
>>>>
>>>
>>> I'm using vmap call to map channel memory (see smc_create_channel()).
>>> vmap call sets PAGE_HYPERVISOR flag which sets MT_NORMAL (0x7) flag.
>>
>> You want to use ioremap().
>>
> 
> I've used ioremap originally, but changed it to vmap because ioremap
> doesn't support memcpy.
> What if I use __vmap with MT_DEVICE_nGnRE flag?

That's not going to help. Our implementation of memcpy() is using 
unaligned access (which is forbidden on Device memory).

You will need something similar to memcpy_toio() in Linux. I don't think 
we have one today in Xen, so I would suggest to import the 
implementation from Linux.

> 
>>> Considering that protocol is synchronous and only one agent per channel is
>>> expected - this works fine for now.
>>> But I agree that the same memory attributes should be used in xen and
>>> kernel. I fill fix that in v2.
>>
>> I am a bit confused. Are you mapping the full shared memory area in Xen? If
>> yes, why do you need to map the memory that is going to be shared with a
>> domain?
>>
> 
> Xen should have an access to all agent channels because it should send
> SCMI_BASE_DISCOVER_AGENT to each channel and receive agent_id during
> scmi_probe call.

Hmmm... Just to confirm, this will only happen during Xen boot? IOW, Xen 
will never write to the channel when a domain is running?

If yes, then I think it would be best to unmap the channel once they are 
used. This would prevent all sort of issues (e.g. Xen mistakenly written 
in them).

Cheers,

-- 
Julien Grall

