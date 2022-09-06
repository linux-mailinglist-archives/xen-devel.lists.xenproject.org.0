Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D765AF10F
	for <lists+xen-devel@lfdr.de>; Tue,  6 Sep 2022 18:50:23 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.399968.641419 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVblY-0006xy-J6; Tue, 06 Sep 2022 16:49:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 399968.641419; Tue, 06 Sep 2022 16:49:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oVblY-0006uu-FN; Tue, 06 Sep 2022 16:49:36 +0000
Received: by outflank-mailman (input) for mailman id 399968;
 Tue, 06 Sep 2022 16:49:34 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1oVblW-0006um-KJ
 for xen-devel@lists.xenproject.org; Tue, 06 Sep 2022 16:49:34 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVblW-0007z4-7S; Tue, 06 Sep 2022 16:49:34 +0000
Received: from 54-240-197-225.amazon.com ([54.240.197.225]
 helo=[192.168.11.176]) by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1oVblW-0006Wu-1A; Tue, 06 Sep 2022 16:49:34 +0000
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
	bh=AavnYCVndaxZ8M1n1FkbJ038HCZ5aYrZ/ftYuVs5Gg0=; b=NkwqR/tFQwH9cDoZLXptrDK5ei
	F1CtwpuHdKwNwmEL0l+42s8s8w97icZrFUIe1tFpYzSwVkwrbWbrQTRy2QKDlMqRkzEGozMFfqS6M
	B8lIHbvNUlxkwQmFVDTq+EqLsGy19km2sYmeyS5LzxZs0htGIi4hsLgDpuqDo7ZcY8qg=;
Message-ID: <b2edc092-5c7d-70b5-7525-810e21ac1370@xen.org>
Date: Tue, 6 Sep 2022 17:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.2.1
Subject: Re: [PATCH v4 00/10] xen/arm: smmuv3: Merge Linux fixes to Xen
Content-Language: en-US
To: Rahul Singh <rahul.singh@arm.com>, xen-devel@lists.xenproject.org
Cc: Bertrand Marquis <bertrand.marquis@arm.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
References: <cover.1662455798.git.rahul.singh@arm.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <cover.1662455798.git.rahul.singh@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 06/09/2022 10:55, Rahul Singh wrote:
> This patch series merge the applicable Linux fixes to Xen.
> 
> Bixuan Cui (1):
>    xen/arm: smmuv3: Change *array into *const array
> 
> Christophe JAILLET (1):
>    xen/arm: smmuv3: Avoid open coded arithmetic in memory allocation
> 
> Gustavo A. R. Silva (1):
>    xen/arm: smmuv3: Fix fall-through warning for Clang
> 
> Jean-Philippe Brucker (2):
>    xen/arm: smmuv3: Fix endianness annotations
>    xen/arm: smmuv3: Move definitions to a header
> 
> Robin Murphy (1):
>    xen/arm: smmuv3: Remove the page 1 fixup
> 
> Zenghui Yu (2):
>    xen/arm: smmuv3: Fix l1 stream table size in the error message
>    xen/arm: smmuv3: Remove the unused fields for PREFETCH_CONFIG command
> 
> Zhen Lei (1):
>    xen/arm: smmuv3: Remove unnecessary oom message
> 
> Zhou Wang (1):
>    xen/arm: smmuv3: Ensure queue is read after updating prod pointer

I didn't get the full series in my inbox. So I used the branch Bertrand 
pushed on gitlab [1]. That said, I had to tweak all the commit messages 
to remove the tags Issue-Id and Change-Id.

I have also added Bertrand's reviewed-by tag on patch #3.

It is now fully committed.

Cheers,

[1] 
https://gitlab.com/xen-project/people/bmarquis/xen-arm-poc/-/tree/temp/smmuv3-fixes

> 
>   xen/drivers/passthrough/arm/smmu-v3.c | 741 ++------------------------
>   xen/drivers/passthrough/arm/smmu-v3.h | 672 +++++++++++++++++++++++
>   2 files changed, 708 insertions(+), 705 deletions(-)
>   create mode 100644 xen/drivers/passthrough/arm/smmu-v3.h
> 

-- 
Julien Grall

