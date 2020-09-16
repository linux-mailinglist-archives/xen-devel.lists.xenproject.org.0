Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF1F26C585
	for <lists+xen-devel@lfdr.de>; Wed, 16 Sep 2020 19:02:50 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kIapE-0000MN-84; Wed, 16 Sep 2020 17:02:32 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=nCdG=CZ=xen.org=julien@srs-us1.protection.inumbo.net>)
 id 1kIapC-0000MI-Do
 for xen-devel@lists.xenproject.org; Wed, 16 Sep 2020 17:02:30 +0000
X-Inumbo-ID: 9fc0aa90-f9b0-4ea7-9c15-04c8472049bc
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 9fc0aa90-f9b0-4ea7-9c15-04c8472049bc;
 Wed, 16 Sep 2020 17:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
 s=20200302mail; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
 bh=oanXCsST7SHyyYVqQMFpPN0gGsmbhwJZyYCfu2C5Fqg=; b=alx5m0uukgB3UIfWkooWg7n04J
 RMu0Pjdap1SLoGzvEDEwFcBfRYm+/Gb7E7U9K1XY9H2DpufAr5sYlbLxXGavb3mP1FA9jmWiMnOhf
 zZ3nlZrvlxXpwygjYWx/F8OGxV4JDawOA8GUWgMXL6e/PtnmYpww5I6EDdg/ExIgixB4=;
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kIap6-0003n5-Jv; Wed, 16 Sep 2020 17:02:24 +0000
Received: from [54.239.6.185] (helo=a483e7b01a66.ant.amazon.com)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <julien@xen.org>)
 id 1kIap6-0001dZ-9b; Wed, 16 Sep 2020 17:02:24 +0000
Subject: Re: [PATCH] SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported
To: Oleksandr Tyshchenko <olekstysh@gmail.com>, xen-devel@lists.xenproject.org
Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>,
 Jan Beulich <jbeulich@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>, Wei Liu <wl@xen.org>,
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, Paul Durrant <paul@xen.org>
References: <1600112240-31726-1-git-send-email-olekstysh@gmail.com>
From: Julien Grall <julien@xen.org>
Message-ID: <6c16083d-27c2-b325-99eb-1e8ff326ac03@xen.org>
Date: Wed, 16 Sep 2020 18:02:21 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600112240-31726-1-git-send-email-olekstysh@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

Hi Oleksandr,

On 14/09/2020 20:37, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> And remove dependencies on CONFIG_EXPERT.

In order to help to make the decision, can you provide the following 
information:
    - Is it functionally complete?
    - Can it work on all known platforms with IPMMU VMSA?
    - Is there any plan to smoke (manually or automatically) test the 
driver?

> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> ---
>   SUPPORT.md                      | 2 +-
>   xen/arch/arm/platforms/Kconfig  | 2 +-
>   xen/drivers/passthrough/Kconfig | 2 +-
>   3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 1479055..5a96a12 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -64,7 +64,7 @@ supported in this document.
>       Status, Intel VT-d: Supported
>       Status, ARM SMMUv1: Supported
>       Status, ARM SMMUv2: Supported
> -    Status, Renesas IPMMU-VMSA: Tech Preview
> +    Status, Renesas IPMMU-VMSA: Supported

Not entirely directed to the IPMMU-VMSA. Passthrough is not security 
supported on Arm today, so it is a bit odd to make the IOMMU drivers 
security supported.

I am thinking to downgrade the ARM SMMUv{1, 2} to "supported, not 
security supported" to avoid any confusion if a potential security issue 
arise.

Stefano, what do you think?

>   
>   ### ARM/GICv3 ITS
>   
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 4bb7319..c93a6b2 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -25,7 +25,7 @@ config RCAR3
>   	bool "Renesas RCar3 support"
>   	depends on ARM_64
>   	select HAS_SCIF
> -	select IPMMU_VMSA if EXPERT
> +	select IPMMU_VMSA
>   	---help---
>   	Enable all the required drivers for Renesas RCar3
>   
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 73f4ad8..0036007 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -14,7 +14,7 @@ config ARM_SMMU
>   	  ARM SMMU architecture.
>   
>   config IPMMU_VMSA
> -	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs" if EXPERT
> +	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
>   	depends on ARM_64
>   	---help---
>   	  Support for implementations of the Renesas IPMMU-VMSA found
> 

Cheers,

-- 
Julien Grall

