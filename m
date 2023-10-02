Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F1A47B4D79
	for <lists+xen-devel@lfdr.de>; Mon,  2 Oct 2023 10:45:39 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.611221.950696 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEYS-0000PU-He; Mon, 02 Oct 2023 08:45:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 611221.950696; Mon, 02 Oct 2023 08:45:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qnEYS-0000ND-E5; Mon, 02 Oct 2023 08:45:28 +0000
Received: by outflank-mailman (input) for mailman id 611221;
 Mon, 02 Oct 2023 08:45:27 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1qnEYR-0000Mc-0A
 for xen-devel@lists.xenproject.org; Mon, 02 Oct 2023 08:45:27 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnEYQ-0007SB-O6; Mon, 02 Oct 2023 08:45:26 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.240])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1qnEYQ-0005ni-Hd; Mon, 02 Oct 2023 08:45:26 +0000
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
	bh=iW4QaHGyzxiCNehmVBHSpm/7yzIWTi2J7pCzG0InZcw=; b=LESsLM7VcQAJGe8rZuSAOrFULQ
	X01wiUdq/Xq5h1ZRkeVP6iqS5kdvfx8fL3/13djmZlhsEYknt5HpRgLvY0s2HT15olkNS8c7aC0Ej
	yoIcbyUzqE9CiYZUawVDzUO33HrZJvp8Z73enrJ6NbnB8eBXoGq3kLg2gBf25sPfZgJQ=;
Message-ID: <170236c7-6410-42c2-acf3-8e8cc5b7086d@xen.org>
Date: Mon, 2 Oct 2023 09:45:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [for-4.18] Re: [XEN v2] xen: arm: procinfo.h: Fixed a typo
Content-Language: en-GB
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>,
 xen-devel@lists.xenproject.org, jgrall@amazon.com
Cc: sstabellini@kernel.org, stefano.stabellini@amd.com,
 bertrand.marquis@arm.com, Volodymyr_Babchuk@epam.com,
 Henry Wang <Henry.Wang@arm.com>
References: <20230928121243.2636484-1-ayan.kumar.halder@amd.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20230928121243.2636484-1-ayan.kumar.halder@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

Adding Henry to release ack the patch.

Cheers,

On 28/09/2023 13:12, Ayan Kumar Halder wrote:
> Change VPCU to vCPU.
> Also add a space before '*/'.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
> Acked-by: Julien Grall <jgrall@amazon.com>
> ---
> 
> Changes from -
> 
> v1 - 1. Change VCPU --> vCPU.
> 2. Add a space before '*/'.
> 
>   xen/arch/arm/include/asm/procinfo.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/include/asm/procinfo.h b/xen/arch/arm/include/asm/procinfo.h
> index 02be56e348..3a05f27784 100644
> --- a/xen/arch/arm/include/asm/procinfo.h
> +++ b/xen/arch/arm/include/asm/procinfo.h
> @@ -24,7 +24,7 @@
>   #include <xen/sched.h>
>   
>   struct processor {
> -    /* Initialize specific processor register for the new VPCU*/
> +    /* Initialize specific processor register for the new vCPU */
>       void (*vcpu_initialise)(struct vcpu *v);
>   };
>   

-- 
Julien Grall

