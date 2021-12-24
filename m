Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 450B547EFAB
	for <lists+xen-devel@lfdr.de>; Fri, 24 Dec 2021 15:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.251401.432743 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lmR-0006gG-9k; Fri, 24 Dec 2021 14:42:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 251401.432743; Fri, 24 Dec 2021 14:42:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n0lmR-0006el-6d; Fri, 24 Dec 2021 14:42:47 +0000
Received: by outflank-mailman (input) for mailman id 251401;
 Fri, 24 Dec 2021 14:42:45 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1n0lmP-0006ec-G9
 for xen-devel@lists.xenproject.org; Fri, 24 Dec 2021 14:42:45 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0lmP-0003y2-52; Fri, 24 Dec 2021 14:42:45 +0000
Received: from [54.239.6.184] (helo=[192.168.17.79])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1n0lmO-0001LI-SV; Fri, 24 Dec 2021 14:42:45 +0000
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
	bh=S+5gym/LnTvjBBuOf+Xmtpt8BFxcfTdmN0QuwwMR9zo=; b=MVlhVfJWPEm6U6k5TjmzVmK5EY
	MbqI3HfFn1XWp02qbxSHTk8xDvy2SWHiL162h66VSu+zFC0+mxOD/jAQkLjIHdv+nmkl+JugzCdK4
	uLpAa717Tw4m5mDm+fXe20xJ4D+Gqu/gER9+Bg3nlJHgwftgawtG1NkZKDrXIBaCsUg0=;
Message-ID: <7b0d3f0d-bdf1-ac59-0ef8-bb7ec2d802d8@xen.org>
Date: Fri, 24 Dec 2021 15:42:42 +0100
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
From: Julien Grall <julien@xen.org>
In-Reply-To: <20211220154127.GA1688861@EPUAKYIW015D>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20/12/2021 16:41, Oleksii Moisieiev wrote:
> Hi Julien,

Hello,

> On Fri, Dec 17, 2021 at 04:38:31PM +0000, Julien Grall wrote:
>>
>>
>> On 17/12/2021 13:58, Oleksii Moisieiev wrote:
>>> Hi Julien,
>>
>> Hi,
>>
>>> On Fri, Dec 17, 2021 at 01:37:35PM +0000, Julien Grall wrote:
>>>> Hi,
>>>>
>>>> On 17/12/2021 13:23, Oleksii Moisieiev wrote:
>>>>>>> +static int map_memory_to_domain(struct domain *d, uint64_t addr, uint64_t len)
>>>>>>> +{
>>>>>>> +    return iomem_permit_access(d, paddr_to_pfn(addr),
>>>>>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
>>>>>>> +}
>>>>>>> +
>>>>>>> +static int unmap_memory_from_domain(struct domain *d, uint64_t addr,
>>>>>>> +                                     uint64_t len)
>>>>>>> +{
>>>>>>> +    return iomem_deny_access(d, paddr_to_pfn(addr),
>>>>>>> +                paddr_to_pfn(PAGE_ALIGN(addr + len -1)));
>>>>>>> +}
>>>>>>
>>>>>> I wonder, why we need an extra level of indirection here. And if this is
>>>>>> really needed, I wonder why map(unmap)_memory* name was chosen, as there is
>>>>>> no memory mapping/unmapping really happens here.
>>>>>>
>>>>>
>>>>> I've added extra indirection to hide math like
>>>>> paddr_to_pfn(PAGE_ALIGN(addr + len -1)
>>>>> so you don't have to math in each call. unmap_memory_from_domain called
>>>>> from 2 places, so I moved both calls to separate function.
>>>>> Although, I agree that map/unmap is not perfect name. I consider
>>>>> renaming it to mem_permit_acces and mam_deny_access.
>>>>
>>>> I haven't looked at the rest of the series. But this discussion caught my
>>>> eye. This code implies that the address is page-aligned but the length not.
>>>> Is that intended?
>>>>
>>>> That said, if you give permission to the domain on a full page then it means
>>>> it may be able to access address it should not. Can you explain why this is
>>>> fine?
>>>>
>>>
>>> The idea was that xen receives some memory from the dt_node linux,scmi_mem,
>>> then we split memory between the agents, so each agent get 1 page (we
>>> allocate 0x10 pages right now).
>>
>> Thanks for the clarification. Does this imply the guest will be able to
>> write message directly to the firmware?
> 
> We used DEN0056C Specification as base. Available on: https://developer.arm.com/documentation/den0056/latest.
> SCMI transport is described in Section 5.1. We implemented Shared Memory transport.
> Firmware has N pages of the shared memory, used to communicate with Agents.
> It allocates N agents and assign a page for each agent, such as:
> -------------------------------------
> | Agent H | Agent 1 | Agent 2 | ... |
> -------------------------------------
> Agent H is the privilleged Hypervisor agent, which is used to do the base commands,
> such as getting Agent list, set\unset permissions etc.
> Hypervisor assign agent to the guest and maps page, related to the agent to the Guest.
> So the Guest, which is Agent 1 will get an access to Agent 1 page.
> 
> Guest places SCMI message to Agent 1 memory, then sends SMC message.
> Hypervisor process SMC request, add agent id to the message parameters and redirects it to the Firmware.
> Based on the agent_id Firmware knows which page it should read.
> Then after permission check ( if the resetId/clockID/powerID etc from message
> is assigned to agent_id ) it does changes to the HW and places response to Agent
> shared memory and marks channel as FREE ( by setting free bit in shared memory ).
> Once channel is marked as free - Guest read response from the shared memory.

So, IIUC, the hypervisor will not control what is written in the shared 
memory. It will only control the SMC parameters. Is my understanding 
correct?

> 
> Non-virtualized systems will work as well. OS should send SMC directly to the Firmware.
> 
>>
>> If so, this brings a few more questions:
>>    1) What will the guest write in it? Can it contains addresses?
> Guest can write scmi request to the shared memory, which include the following data:
> 1) protocol_id - which protocol is requested, such as clock, power, reset etc
> 2) message_id - action that should be done to HW, such as do_reset or get_clock
> 3) message data - which includes reset_id/clock_id/power_id etc. that should be changed.
> Reset IDs and Clock IDs are assigned in Firmware. Guest receives ID, corresponding to the device from the device-tree.
> dt_node as an example:
> &avb {
> 	scmi_devid = <0>;
> 	clocks = <&scmi_clock 0>;
> 	power-domains = <&scmi_power 0>;
> 	resets = <&scmi_reset 0>;
> };
> 
>>    2) What are the expected memory attribute for the regions?
> 
> xen uses iommu_permit_access to pass agent page to the guest. So guest can access the page directly.

I think you misunderstood my comment. Memory can be mapped with various 
type (e.g. Device, Memory) and attribute (cacheable, non-cacheable...). 
What will the firmware expect? What will the guest OS usually?

The reason I am asking is the attributes have to matched to avoid any 
coherency issues. At the moment, if you use XEN_DOMCTL_memory_mapping, 
Xen will configure the stage-2 to use Device nGnRnE. As the result, the 
result memory access will be Device nGnRnE which is very strict.

Cheers,

-- 
Julien Grall

