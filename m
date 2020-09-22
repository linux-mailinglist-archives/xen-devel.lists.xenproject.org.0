Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 67109273732
	for <lists+xen-devel@lfdr.de>; Tue, 22 Sep 2020 02:12:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kKVuO-0005CG-IE; Tue, 22 Sep 2020 00:11:48 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MP++=C7=kernel.org=sstabellini@srs-us1.protection.inumbo.net>)
 id 1kKVuN-0005CB-T9
 for xen-devel@lists.xenproject.org; Tue, 22 Sep 2020 00:11:47 +0000
X-Inumbo-ID: ecc50384-6c87-4604-b763-d1b6bc85847a
Received: from mail.kernel.org (unknown [198.145.29.99])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id ecc50384-6c87-4604-b763-d1b6bc85847a;
 Tue, 22 Sep 2020 00:11:47 +0000 (UTC)
Received: from localhost (c-67-164-102-47.hsd1.ca.comcast.net [67.164.102.47])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5E9C20888;
 Tue, 22 Sep 2020 00:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600733506;
 bh=R9Z0o1Pl/eHcxP3hRcvAZAH9Fy+NtJFMELWI/Ktb4w4=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=EWlJWPtYblW7Y/hcNOOKHRF2m2JdTYvX/O8dJHb83w1hXKgW0sbb7wD/SsXA2IGKX
 SHH+5ezoTC3PaWdA7MViLkKFeCmqk6HZtJfhlqgBXme1H/ys5tYAd+V3L2X9qfhOVp
 mX+S/fgAFXEpTkz9ik8qOhmE4czGuqNOsadUTdBU=
Date: Mon, 21 Sep 2020 17:11:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Oleksandr Tyshchenko <olekstysh@gmail.com>
cc: xen-devel@lists.xenproject.org, 
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
 Andrew Cooper <andrew.cooper3@citrix.com>, 
 George Dunlap <george.dunlap@citrix.com>, Ian Jackson <iwj@xenproject.org>, 
 Jan Beulich <jbeulich@suse.com>, Julien Grall <julien@xen.org>, 
 Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
 Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
 Paul Durrant <paul@xen.org>
Subject: Re: [PATCH V2] SUPPORT.md: Update status of Renesas IPMMU-VMSA (Arm)
In-Reply-To: <1600536082-24112-1-git-send-email-olekstysh@gmail.com>
Message-ID: <alpine.DEB.2.21.2009211711270.1495@sstabellini-ThinkPad-T480s>
References: <1600536082-24112-1-git-send-email-olekstysh@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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

On Sat, 19 Sep 2020, Oleksandr Tyshchenko wrote:
> From: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> 
> Mark Renesas IPMMU-VMSA as "Supported, not security supported"
> and remove dependencies on CONFIG_EXPERT.
> 
> We can't treat the IOMMU driver as "Supported" since the device
> passthrough feature is not security supported on Arm today.
> 
> Signed-off-by: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Was "SUPPORT.md: Mark Renesas IPMMU-VMSA (Arm) as supported"
> https://lists.xenproject.org/archives/html/xen-devel/2020-09/msg00967.html
>     
> Changes V1 -> V2:
>    - Update patch subject/description
>    - Use "Supported, not security supported"
>     
> ---
>  SUPPORT.md                      | 2 +-
>  xen/arch/arm/platforms/Kconfig  | 2 +-
>  xen/drivers/passthrough/Kconfig | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/SUPPORT.md b/SUPPORT.md
> index 1479055..25987ec 100644
> --- a/SUPPORT.md
> +++ b/SUPPORT.md
> @@ -64,7 +64,7 @@ supported in this document.
>      Status, Intel VT-d: Supported
>      Status, ARM SMMUv1: Supported
>      Status, ARM SMMUv2: Supported
> -    Status, Renesas IPMMU-VMSA: Tech Preview
> +    Status, Renesas IPMMU-VMSA: Supported, not security supported
>  
>  ### ARM/GICv3 ITS
>  
> diff --git a/xen/arch/arm/platforms/Kconfig b/xen/arch/arm/platforms/Kconfig
> index 4bb7319..c93a6b2 100644
> --- a/xen/arch/arm/platforms/Kconfig
> +++ b/xen/arch/arm/platforms/Kconfig
> @@ -25,7 +25,7 @@ config RCAR3
>  	bool "Renesas RCar3 support"
>  	depends on ARM_64
>  	select HAS_SCIF
> -	select IPMMU_VMSA if EXPERT
> +	select IPMMU_VMSA
>  	---help---
>  	Enable all the required drivers for Renesas RCar3
>  
> diff --git a/xen/drivers/passthrough/Kconfig b/xen/drivers/passthrough/Kconfig
> index 73f4ad8..0036007 100644
> --- a/xen/drivers/passthrough/Kconfig
> +++ b/xen/drivers/passthrough/Kconfig
> @@ -14,7 +14,7 @@ config ARM_SMMU
>  	  ARM SMMU architecture.
>  
>  config IPMMU_VMSA
> -	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs" if EXPERT
> +	bool "Renesas IPMMU-VMSA found in R-Car Gen3 SoCs"
>  	depends on ARM_64
>  	---help---
>  	  Support for implementations of the Renesas IPMMU-VMSA found
> -- 
> 2.7.4
> 

