Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182897248F
	for <lists+xen-devel@lfdr.de>; Mon,  9 Sep 2024 23:32:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.794892.1203915 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snlyr-0000q0-UA; Mon, 09 Sep 2024 21:31:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 794892.1203915; Mon, 09 Sep 2024 21:31:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1snlyr-0000nI-RE; Mon, 09 Sep 2024 21:31:29 +0000
Received: by outflank-mailman (input) for mailman id 794892;
 Mon, 09 Sep 2024 21:31:28 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>) id 1snlyq-0000nC-6C
 for xen-devel@lists.xenproject.org; Mon, 09 Sep 2024 21:31:28 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snlyp-0007rI-MI; Mon, 09 Sep 2024 21:31:27 +0000
Received: from gw1.octic.net ([88.97.20.152] helo=[10.0.1.244])
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1snlyp-0005g0-Et; Mon, 09 Sep 2024 21:31:27 +0000
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
	bh=hehrwPVu4Er9hDy6ECW4L5PRnA/nSCs+8Bnr/22FqZU=; b=5MZ94iEo+EsX5ifpipuSrPpQBv
	OfF8Vib1mefTG+NZ55DRi8uL1uL+B1B/QxX1X6edhDabixopj2ke34rdbHK2fiKkZSZDX+lQL0ZZD
	M7nl7HysrXtIHlJOq9+3orkdg5jZVANexdnrhVoNpHJo0rLNqUAfqchEO4h6QWyADOds=;
Message-ID: <ebd2de8a-c7e9-4d8c-938c-d6f2851907fc@xen.org>
Date: Mon, 9 Sep 2024 22:31:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] ARM/cache: Drop legacy __read_mostly/__ro_after_init
 definitions
Content-Language: en-GB
To: Andrew Cooper <andrew.cooper3@citrix.com>,
 Xen-devel <xen-devel@lists.xenproject.org>
Cc: Jan Beulich <JBeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=C3=A9?=
 <roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 Michal Orzel <michal.orzel@amd.com>
References: <20240905220806.141300-1-andrew.cooper3@citrix.com>
 <20240905220806.141300-6-andrew.cooper3@citrix.com>
From: Julien Grall <julien@xen.org>
In-Reply-To: <20240905220806.141300-6-andrew.cooper3@citrix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Andrew,

On 05/09/2024 23:08, Andrew Cooper wrote:
> These are no longer needed.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Acked-by: Julien Grall <jgrall@amazon.com>

Cheers,

> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: Julien Grall <julien@xen.org>
> CC: Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
> CC: Bertrand Marquis <bertrand.marquis@arm.com>
> CC: Michal Orzel <michal.orzel@amd.com>
> ---
>   xen/arch/arm/include/asm/cache.h | 3 ---
>   xen/include/xen/cache.h          | 5 -----
>   2 files changed, 8 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/cache.h b/xen/arch/arm/include/asm/cache.h
> index 029b2896fb3e..b75c970b6806 100644
> --- a/xen/arch/arm/include/asm/cache.h
> +++ b/xen/arch/arm/include/asm/cache.h
> @@ -6,9 +6,6 @@
>   #define L1_CACHE_SHIFT  (CONFIG_ARM_L1_CACHE_SHIFT)
>   #define L1_CACHE_BYTES  (1 << L1_CACHE_SHIFT)
>   
> -/* TODO: Phase out the use of this via cache.h */
> -#define __read_mostly __section(".data.read_mostly")
> -
>   #endif
>   /*
>    * Local variables:
> diff --git a/xen/include/xen/cache.h b/xen/include/xen/cache.h
> index 90816ba05b1a..6ee174efa439 100644
> --- a/xen/include/xen/cache.h
> +++ b/xen/include/xen/cache.h
> @@ -15,9 +15,4 @@
>   #define __cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
>   #endif
>   
> -#if defined(CONFIG_ARM)
> -/* TODO: Phase out the use of this via cache.h */
> -#define __ro_after_init __section(".data.ro_after_init")
> -#endif
> -
>   #endif /* __LINUX_CACHE_H */

-- 
Julien Grall

