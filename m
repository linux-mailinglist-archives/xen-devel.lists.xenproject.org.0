Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D01C136C207
	for <lists+xen-devel@lfdr.de>; Tue, 27 Apr 2021 11:48:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.118228.224279 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKKF-0000hC-Mk; Tue, 27 Apr 2021 09:48:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 118228.224279; Tue, 27 Apr 2021 09:48:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lbKKF-0000gm-Jh; Tue, 27 Apr 2021 09:48:15 +0000
Received: by outflank-mailman (input) for mailman id 118228;
 Tue, 27 Apr 2021 09:48:14 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1lbKKE-0000gg-5M
 for xen-devel@lists.xenproject.org; Tue, 27 Apr 2021 09:48:14 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKKD-00048R-7o; Tue, 27 Apr 2021 09:48:13 +0000
Received: from 54-240-197-235.amazon.com ([54.240.197.235]
 helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1lbKKD-0003gS-1r; Tue, 27 Apr 2021 09:48:13 +0000
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
	bh=6/A3FWeGHyi1UdmHrUcy7Ko+RZp+UBzwXwvpzv22Ot0=; b=LUPzlqlWXK7PxeuXEFDIlrtayi
	k9sgyzNlR7Q0bPsRqf+A3vZyBVDU8GNEtukxuVoUvvWsD9PcfAGpj9xV8i3oDsucscLIQk4JDl8IV
	1oAtNxj+Og4F5KQHPfmsHM6CBX5EQkGPF5qfFRqVjLICAXEqC25KqR9/RDAjq1SNBmSw=;
Subject: Re: [PATCH v2 04/10] arm/gic: Remove member hcr of structure gic_v3
To: Michal Orzel <michal.orzel@arm.com>, xen-devel@lists.xenproject.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, bertrand.marquis@arm.com
References: <20210427093546.30703-1-michal.orzel@arm.com>
 <20210427093546.30703-5-michal.orzel@arm.com>
From: Julien Grall <julien@xen.org>
Message-ID: <7b2bde96-cd69-980c-59c5-4c787bc54a55@xen.org>
Date: Tue, 27 Apr 2021 10:48:11 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210427093546.30703-5-michal.orzel@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Hi Michal,

On 27/04/2021 10:35, Michal Orzel wrote:
> ... as it is never used even in the patch introducing it.
> 
> Signed-off-by: Michal Orzel <michal.orzel@arm.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
>   xen/include/asm-arm/gic.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/include/asm-arm/gic.h b/xen/include/asm-arm/gic.h
> index ad0f7452d0..5069ab4aac 100644
> --- a/xen/include/asm-arm/gic.h
> +++ b/xen/include/asm-arm/gic.h
> @@ -171,7 +171,7 @@
>    * GICv3 registers that needs to be saved/restored
>    */
>   struct gic_v3 {
> -    uint32_t hcr, vmcr, sre_el1;
> +    uint32_t vmcr, sre_el1;
>       uint32_t apr0[4];
>       uint32_t apr1[4];
>       uint64_t lr[16];
> 

-- 
Julien Grall

