Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A822FF35F
	for <lists+xen-devel@lfdr.de>; Thu, 21 Jan 2021 19:43:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.72351.130215 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2evO-0004U2-8m; Thu, 21 Jan 2021 18:43:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 72351.130215; Thu, 21 Jan 2021 18:43:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1l2evO-0004TV-5I; Thu, 21 Jan 2021 18:43:18 +0000
Received: by outflank-mailman (input) for mailman id 72351;
 Thu, 21 Jan 2021 18:43:16 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1l2evM-0004TD-Bw
 for xen-devel@lists.xenproject.org; Thu, 21 Jan 2021 18:43:16 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2evJ-0006f5-GF; Thu, 21 Jan 2021 18:43:13 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1l2evJ-0003e0-5k; Thu, 21 Jan 2021 18:43:13 +0000
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
	s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
	MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=I5Avv/f3sUVTijrGj7NvL0ABkTGC5lCiZril/XFCdGo=; b=sxmUsPladp8wfxvw6mxk4ZfoYE
	p3L5WihFBCuCJClsTDZZhOmAhXsRLKSKplK0Dn25EKNds3I1T6DPGqi7NMruEz7tBCPmmLLZJ9WRy
	vQuq/PWLbNQmyw2dYN1MG1WcbMbUVoTb7i9nyOZkcynkvW6r4UIO3VbUkNv65X4V3kaE=;
Subject: Re: [PATCH v5 10/10] xen/arm: smmuv3: Add support for SMMUv3 driver
To: Rahul Singh <Rahul.Singh@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>
Cc: "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Bertrand Marquis <Bertrand.Marquis@arm.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Wei Liu <wl@xen.org>,
 Paul Durrant <paul@xen.org>, Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1611153615.git.rahul.singh@arm.com>
 <b14ea889b0c27fec1b8843da91b570b0ccd66796.1611153615.git.rahul.singh@arm.com>
 <alpine.DEB.2.21.2101201212310.14528@sstabellini-ThinkPad-T480s>
 <9621B25B-E39A-4354-9AA3-1ECAED21B8B2@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <81104729-0354-f479-9329-04447df1b096@xen.org>
Date: Thu, 21 Jan 2021 18:43:10 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <9621B25B-E39A-4354-9AA3-1ECAED21B8B2@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

Hi Rahul,

Please try to trim the e-mail when quoting, otherwise it is quite 
difficult to find the only couple of answer you wrote.

On 21/01/2021 17:10, Rahul Singh wrote:
>> On 20 Jan 2021, at 8:31 pm, Stefano Stabellini <sstabellini@kernel.org> wrote:
>>> -static void __iomem *arm_smmu_ioremap(struct device *dev, resource_size_t start,
>>> -				      resource_size_t size)
>>> +
>>> +static void arm_smmu_free_structures(struct arm_smmu_device *smmu)
>>> {
>>> -	struct resource res = {
>>> -		.flags = IORESOURCE_MEM,
>>> -		.start = start,
>>> -		.end = start + size - 1,
>>> -	};
>>> +	if (smmu->cmdq.q.base)
>>> +		xfree(smmu->cmdq.q.base);
>>> +
>>> +	if (smmu->evtq.q.base)
>>> +		xfree(smmu->evtq.q.base);
>>>
>>> -	return devm_ioremap_resource(dev, &res);
>>> +	if (smmu->priq.q.base)
>>> +		xfree(smmu->priq.q.base);
>>> +
>>> +	if (smmu->strtab_cfg.strtab)
>>> +		xfree(smmu->strtab_cfg.strtab);
>>> +
>>> +	if (smmu->strtab_cfg.l1_desc)
>>> +		xfree(smmu->strtab_cfg.l1_desc);
>>
>>  From what I can tell we also need to free somewhere
>> smmu->strtab_cfg->l1_desc->l2ptr allocated by arm_smmu_init_l2_strtab
> 
> "l1_desc->l2ptr" is a pointer to the Level 1 Stream Table Descriptor if 2-level Stream Table supported.
> 
> If the device is protected by IOMMU, SMMUv3 driver will allocate the  "l1_desc->l2ptr” when the device is added to the IOMMU via arm_smmu_add_device() function and device will be configured in bypass/abort mode.
> 
> Once we assign the device to the domain(arm_smmu_assign_dev() ) smmuv3 hw will be configured correctly to match the StreamID. If there is a failure in assigning the device, that case also XEN will not remove the device and master device still be in bypass/abort mode.

I am a bit confused with this answer. Wouldn't this mean that we are 
"leaking" memory if we fail to assign the device?

> 
> As in XEN, there is no function to remove the master device from the IOMMU, because of that I feel there is no need to free the "l1_desc->l2ptr” in case of failure also.

Hmmm... Xen is able to remove device from the IOMMU. The reason this is 
not implemented yet on Arm is because you can't hot-unplug "platform" 
device.

I expect the removal function to be useful for PCI.

Cheers,

-- 
Julien Grall

