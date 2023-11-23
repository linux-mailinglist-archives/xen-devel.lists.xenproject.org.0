Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E6F17F5D00
	for <lists+xen-devel@lfdr.de>; Thu, 23 Nov 2023 11:54:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.639589.997112 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67Lx-0005tk-Ic; Thu, 23 Nov 2023 10:54:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 639589.997112; Thu, 23 Nov 2023 10:54:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r67Lx-0005rc-G1; Thu, 23 Nov 2023 10:54:37 +0000
Received: by outflank-mailman (input) for mailman id 639589;
 Thu, 23 Nov 2023 10:54:36 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1r67Lw-0005rS-ML
 for xen-devel@lists.xenproject.org; Thu, 23 Nov 2023 10:54:36 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r67Lw-0007tj-Cv; Thu, 23 Nov 2023 10:54:36 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=[192.168.16.119]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1r67Lw-0007MJ-6l; Thu, 23 Nov 2023 10:54:36 +0000
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
	References:Cc:To:From:Subject:MIME-Version:Date:Message-ID;
	bh=f/0eUcQ+hoC6Jvb/kig9tr4w+LVzKu24OPUZ63DLWIs=; b=06npTCtIxwTQ1cf+EDt1fqFvaN
	E5m29Xmai4oNOZ8Sx+UwtJ+0GmgsTJY0UWBexGKYZ2n35LYB0V7U6sHMM322ZcotNeJB0n96GD/ZT
	oPhtdItni1Fw3CG/kiYECUaBbbZVA0CVpeA5LBM7YlstrLZramift8euNPBDofAcB4Ag=;
Message-ID: <087da3be-d739-4674-91f5-51fb728e2358@xen.org>
Date: Thu, 23 Nov 2023 10:54:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] xen/arm: gicv3: clean up GICD_CTRL write
Content-Language: en-GB
From: Julien Grall <julien@xen.org>
To: Stewart Hildebrand <stewart.hildebrand@amd.com>,
 xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <20231122144602.2282417-1-stewart.hildebrand@amd.com>
 <6b1b4507-96ee-4457-a913-3f71b6fd551a@xen.org>
In-Reply-To: <6b1b4507-96ee-4457-a913-3f71b6fd551a@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 23/11/2023 10:52, Julien Grall wrote:
> Hi Stewart,
> 
> On 22/11/2023 14:46, Stewart Hildebrand wrote:
>> GICD_CTL_ENABLE is a GICv2 bit. Remove it. The definitions of
>> GICD_CTL_ENABLE and GICD_CTLR_ENABLE_G1 are identical, so the value
>> written is unchanged.
> 
> Thanks for spotting it. Maybe we should move GICv2 specific definitions 
> out of gic.h. Anyway, this is a separate clean-up. So...
> 
>>
>> Signed-off-by: Stewart Hildebrand <stewart.hildebrand@amd.com>
> 
> ...
> 
> Reviewed-by: Julien Grall <jgrall@amazon.com>

And committed.

Cheers,

-- 
Julien Grall

