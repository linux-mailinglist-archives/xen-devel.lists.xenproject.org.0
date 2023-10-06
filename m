Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6107BB7DE
	for <lists+xen-devel@lfdr.de>; Fri,  6 Oct 2023 14:40:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.613576.954189 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qok8A-0002Zt-7w; Fri, 06 Oct 2023 12:40:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 613576.954189; Fri, 06 Oct 2023 12:40:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qok8A-0002WW-3t; Fri, 06 Oct 2023 12:40:34 +0000
Received: by outflank-mailman (input) for mailman id 613576;
 Fri, 06 Oct 2023 12:40:32 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qok87-0002Vx-VY
 for xen-devel@lists.xenproject.org; Fri, 06 Oct 2023 12:40:31 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qok87-0006OK-Kt; Fri, 06 Oct 2023 12:40:31 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qok87-0004Ac-Fz; Fri, 06 Oct 2023 12:40:31 +0000
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
	bh=8eeiZZQ4HDS+aRXypRrGiyh1EFJMl+r+lwZ0vmE3KSw=; b=H91bMzqOROgBm6d4R16tQh3q90
	HLrzQPaYtCTDrTL1JRhXKVudL4ue7cIKdYbpfquhvfFKt/tGDHBpLsf1tVNX2A6HM4YvJCHgONGh8
	Gef5nGxTAo/IfYlkCijrX+427aOro8HhwiNjd5hr/cHCJRtgX0gkL4o5gh/lyLxivb/8=;
Message-ID: <e6486fd1-bc4c-45dd-8139-4ea988ad6811@xen.org>
Date: Fri, 6 Oct 2023 13:40:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [for-4.18][PATCH 2/2] xen/public: arch-arm: Update list of
 supported hypercalls
Content-Language: en-GB
To: Michal Orzel <michal.orzel@amd.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 "Daniel P. Smith" <dpsmith@apertussolutions.com>, Henry.Wang@arm.com
References: <20231006075142.9803-1-michal.orzel@amd.com>
 <20231006075142.9803-3-michal.orzel@amd.com>
 <b9d30cbc-255f-473c-974d-6dd262f22325@xen.org>
 <40878a29-d681-485b-8d58-0187ec586a2b@amd.com>
 <64feb572-6799-4d9c-a66e-94d5828081fd@xen.org>
 <215ce137-0b0f-4804-b500-548e16f0cca2@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <215ce137-0b0f-4804-b500-548e16f0cca2@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 06/10/2023 13:38, Michal Orzel wrote:
> Hello,
> 
> On 06/10/2023 14:31, Julien Grall wrote:
>> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>>
>>
>> On 06/10/2023 11:20, Michal Orzel wrote:
>>> On 06/10/2023 12:11, Julien Grall wrote:
>>>>
>>>>
>>>> Hi Michal,
>>>>
>>>> On 06/10/2023 08:51, Michal Orzel wrote:
>>>>> The list is out of date and does not specify all the hypercalls/sub-ops
>>>>> we support, so update it.
>>>>>
>>>>> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>>>>> ---
>>>>>     xen/include/public/arch-arm.h | 21 +++++++++++++++++++++
>>>>>     1 file changed, 21 insertions(+)
>>>>>
>>>>> diff --git a/xen/include/public/arch-arm.h b/xen/include/public/arch-arm.h
>>>>> index 6a4467e8f5d1..263b1e182eb3 100644
>>>>> --- a/xen/include/public/arch-arm.h
>>>>> +++ b/xen/include/public/arch-arm.h
>>>>> @@ -104,6 +104,7 @@
>>>>>      *   Exactly these sub-operations are supported:
>>>>>      *    * HVMOP_set_param
>>>>>      *    * HVMOP_get_param
>>>>> + *    * HVMOP_guest_request_vm_event
>>>>>      *
>>>>>      *  HYPERVISOR_grant_table_op
>>>>>      *   All generic sub-operations
>>>>> @@ -116,6 +117,26 @@
>>>>>      *  HYPERVISOR_argo_op
>>>>>      *   All generic sub-operations
>>>>>      *
>>>>> + *  HYPERVISOR_hypfs_op
>>>>> + *   All generic sub-operations
>>>>> + *
>>>>> + *  HYPERVISOR_platform_op
>>>>> + *   Exactly these sub-operations are supported:
>>>>> + *    * XENPF_settime64
>>>>> + *
>>>>> + *  HYPERVISOR_vm_assist
>>>>> + *   All generic sub-operations
>>>>> + *
>>>>> + *  HYPERVISOR_dm_op
>>>>> + *   All ioreq server sub-operations are supported as well as:
>>>>
>>>> I interpret this sentence as all the hypercall with 'ioreq' in their
>>>> name is supported. But, for Arm, we at least don't support
>>>> XEN_DMOP_map_mem_type_to_ioreq_server.
>>> What I meant is that we support all sub-ops from ioreq_server_dm_op (ioreq.c).
>>> XEN_DMOP_map_mem_type_to_ioreq_server is only accessible on x86 and not part of ioreq.c
>>
>>
>> The header is a public interface and meant to be read by OS developper
>> which may not be familiar with the source code. How about listing the
>> subops we support?
>>
>> This will avoid the developper to go through the source code to find out
>> if a sub-op is implemented in ioreq.c or not.
> Sure, I fully agree so I will then send a v2 with:
>   *  HYPERVISOR_dm_op
>   *   Exactly these sub-operations are supported:
>   *    * XEN_DMOP_create_ioreq_server
>   *    * XEN_DMOP_get_ioreq_server_info
>   *    * XEN_DMOP_map_io_range_to_ioreq_server
>   *    * XEN_DMOP_unmap_io_range_from_ioreq_server
>   *    * XEN_DMOP_set_ioreq_server_state
>   *    * XEN_DMOP_destroy_ioreq_server
>   *    * XEN_DMOP_set_irq_level
>   *    * XEN_DMOP_nr_vcpus

Thanks! With that you can add:

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

-- 
Julien Grall

