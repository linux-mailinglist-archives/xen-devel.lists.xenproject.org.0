Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EAF5315DF
	for <lists+xen-devel@lfdr.de>; Mon, 23 May 2022 22:01:55 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.336082.560364 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntEFO-0004zx-2N; Mon, 23 May 2022 20:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 336082.560364; Mon, 23 May 2022 20:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ntEFN-0004xu-VO; Mon, 23 May 2022 20:01:45 +0000
Received: by outflank-mailman (input) for mailman id 336082;
 Mon, 23 May 2022 20:01:44 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1ntEFM-0004xo-ST
 for xen-devel@lists.xenproject.org; Mon, 23 May 2022 20:01:44 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntEFM-0007Sx-Lu; Mon, 23 May 2022 20:01:44 +0000
Received: from [54.239.6.190] (helo=[192.168.27.218])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1ntEFM-0000UT-GV; Mon, 23 May 2022 20:01:44 +0000
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
	bh=Wg9acVRVFvLwk0Cib3XG4OodNOG67zsICariUlF4cUE=; b=EwO1dPt4gG9RvoIl6jvjGtlZt4
	PG+e+4g3Exh+gUgKQuNVSsvud4Hfjjds2UgdMw63D/dE9dJWbJfItCF/9D5w84cGiFcQF4HlL9PAV
	f2+vX3ygdByJE1yzXgodR7nyMdW5HwUfc+4DeY9cMmwi6/uEPzc+gMIuI5SM9SdSSE4s=;
Message-ID: <fb2bc9d2-628e-3ab3-7091-dea09bc4c027@xen.org>
Date: Mon, 23 May 2022 21:01:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] xen/iommu: dt: Check the return value of
 xsm_deassign_dtdevice()
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Julien Grall <jgrall@amazon.com>,
 Stefano Stabellini <sstabellini@kernel.org>
References: <20220522165900.83104-1-julien@xen.org>
 <ab74884e-9a16-a9cb-de57-9f2907e21f71@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <ab74884e-9a16-a9cb-de57-9f2907e21f71@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/05/2022 08:00, Michal Orzel wrote:
> Hi Julien,
Hi Michal,


> On 22.05.2022 18:59, Julien Grall wrote:
>> From: Julien Grall <jgrall@amazon.com>
>>
>> xsm_deasign_dtdevice() will indicate whether the caller is allowed
> s/deasign/deassign/

Good spot! I will fix it on commit unless there are any objections.

> 
>> to issue the operation. So the return value has to be checked.
>>
>> Spotted by clang static analyzer.
>>
>> Fixes: fe36cccc483c ("xen/passthrough: Extend XEN_DOMCTL_*assign_device to support DT device")
>> Signed-off-by: Julien Grall <jgrall@amazon.com>
> 
> Apart from that:
> Reviewed-by: Michal Orzel <michal.orzel@arm.com>

Thanks!

Cheers,

-- 
Julien Grall

