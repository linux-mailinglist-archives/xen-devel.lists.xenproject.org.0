Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 04378509427
	for <lists+xen-devel@lfdr.de>; Thu, 21 Apr 2022 02:25:56 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.309707.526149 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKdm-0008Ju-5O; Thu, 21 Apr 2022 00:25:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 309707.526149; Thu, 21 Apr 2022 00:25:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1nhKdm-0008Hl-1j; Thu, 21 Apr 2022 00:25:46 +0000
Received: by outflank-mailman (input) for mailman id 309707;
 Thu, 21 Apr 2022 00:25:45 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=45zg=U7=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1nhKdl-0008HX-DI
 for xen-devel@lists.xenproject.org; Thu, 21 Apr 2022 00:25:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 94723bef-c109-11ec-8fbf-03012f2f19d4;
 Thu, 21 Apr 2022 02:25:44 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6CC0461B65;
 Thu, 21 Apr 2022 00:25:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D4D0C385A1;
 Thu, 21 Apr 2022 00:25:41 +0000 (UTC)
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
X-Inumbo-ID: 94723bef-c109-11ec-8fbf-03012f2f19d4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1650500741;
	bh=F5z1Sq5i0vA2eHARyKF/bte/6EWjDK59RP6Y9XTCLHI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=NUZlATHTgvt9jsYfKIL/fUeBncEPYaIQq9mneEBIkbvPog5rwjRtwOGkgK3xaLf8p
	 4m+8EVjWBTFFQQ64rPKKei4w/rQpbtN3Lc9axdcq5W07aBHbcAFnDieWR3MX0pkZJl
	 J9+SR1VAf+zL9UYlVY6Zv+95L1zAlaM0WeH4Y8m8ahjYaJuPwhJJQD2TVbKw9Botgy
	 W13SYXll4SXdlzU0o7f+k01AAD5v2JGMzWxXHqQXr3JWEUnFYsuDAI4XTnUp13NdJU
	 SGJHm157TGcLYgEMz/UKbF2W/607a35elbQXThqnrzk1PIa+GKl2fA1tnTN3pkfRV/
	 iOM3rDtu1VpQQ==
Date: Wed, 20 Apr 2022 17:25:41 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Wei Chen <wei.chen@arm.com>
cc: xen-devel@lists.xenproject.org, nd@arm.com, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH v2 03/10] xen/arm: add CONFIG_ARM_EFI to stub EFI API
In-Reply-To: <20220418090735.3940393-4-wei.chen@arm.com>
Message-ID: <alpine.DEB.2.22.394.2204201724430.915916@ubuntu-linux-20-04-desktop>
References: <20220418090735.3940393-1-wei.chen@arm.com> <20220418090735.3940393-4-wei.chen@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 18 Apr 2022, Wei Chen wrote:
> x86 is using compiler feature testing to decide EFI
> build enable or not. When EFI build is disabled, x86
> will use a efi/stub.c file to replace efi/runtime.c
> for build objects. Following this idea, we introduce
> a stub file for Arm, but use CONFIG_ARM_EFI to decide
> EFI build enable or not.
> 
> Signed-off-by: Wei Chen <wei.chen@arm.com>
> ---
> v1 -> v2:
> 1. Use CONFIG_ARM_EFI to replace CONFIG_EFI
> 2. Remove help text and make CONFIG_ARM_EFI invisible.
> 3. Merge one following patch:
>    xen/arm: introduce a stub file for non-EFI architectures
> 4. Use the common stub.c instead of creating new one.
> ---
>  xen/arch/arm/Kconfig      | 5 +++++
>  xen/arch/arm/Makefile     | 2 +-
>  xen/arch/arm/efi/Makefile | 5 +++++
>  3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
> index ecfa6822e4..5f1b0121b0 100644
> --- a/xen/arch/arm/Kconfig
> +++ b/xen/arch/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_64
>  	def_bool y
>  	depends on !ARM_32
>  	select 64BIT
> +	select ARM_EFI
>  	select HAS_FAST_MULTIPLY
>  
>  config ARM
> @@ -33,6 +34,10 @@ config ACPI
>  	  Advanced Configuration and Power Interface (ACPI) support for Xen is
>  	  an alternative to device tree on ARM64.
>  
> +config ARM_EFI
> +	bool
> +	depends on ARM_64

As ARM_EFI is selected by ARM_64 and it cannot be enable via a menu (it
is hidden) there is no need for the "depends" line here


>  config GICV3
>  	bool "GICv3 driver"
>  	depends on ARM_64 && !NEW_VGIC
> diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
> index 1d862351d1..bb7a6151c1 100644
> --- a/xen/arch/arm/Makefile
> +++ b/xen/arch/arm/Makefile
> @@ -1,6 +1,5 @@
>  obj-$(CONFIG_ARM_32) += arm32/
>  obj-$(CONFIG_ARM_64) += arm64/
> -obj-$(CONFIG_ARM_64) += efi/
>  obj-$(CONFIG_ACPI) += acpi/
>  obj-$(CONFIG_HAS_PCI) += pci/
>  ifneq ($(CONFIG_NO_PLAT),y)
> @@ -20,6 +19,7 @@ obj-y += domain.o
>  obj-y += domain_build.init.o
>  obj-y += domctl.o
>  obj-$(CONFIG_EARLY_PRINTK) += early_printk.o
> +obj-y += efi/
>  obj-y += gic.o
>  obj-y += gic-v2.o
>  obj-$(CONFIG_GICV3) += gic-v3.o
> diff --git a/xen/arch/arm/efi/Makefile b/xen/arch/arm/efi/Makefile
> index 4313c39066..75ef180233 100644
> --- a/xen/arch/arm/efi/Makefile
> +++ b/xen/arch/arm/efi/Makefile
> @@ -1,4 +1,9 @@
>  include $(srctree)/common/efi/efi-common.mk
>  
> +ifeq ($(CONFIG_ARM_EFI),y)
>  obj-y += $(EFIOBJ-y)
>  obj-$(CONFIG_ACPI) +=  efi-dom0.init.o
> +else
> +EFIOBJ-y += stub.o
> +obj-y += stub.o

The change to EFIOBJ-y is not needed here as EFIOBJ-y is not used.
Only obj-y += stub.o should be enough

> +endif
> -- 
> 2.25.1
> 

