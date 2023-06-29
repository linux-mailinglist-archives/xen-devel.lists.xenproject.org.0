Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8DC67430D4
	for <lists+xen-devel@lfdr.de>; Fri, 30 Jun 2023 01:03:28 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.557211.870361 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0fV-0002k1-Dx; Thu, 29 Jun 2023 23:03:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 557211.870361; Thu, 29 Jun 2023 23:03:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qF0fV-0002hp-8W; Thu, 29 Jun 2023 23:03:17 +0000
Received: by outflank-mailman (input) for mailman id 557211;
 Thu, 29 Jun 2023 23:03:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=XWGL=CR=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qF0fT-0002hj-Ry
 for xen-devel@lists.xenproject.org; Thu, 29 Jun 2023 23:03:15 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1f5020c2-16d1-11ee-8611-37d641c3527e;
 Fri, 30 Jun 2023 01:03:13 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DD00061635;
 Thu, 29 Jun 2023 23:03:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62378C433C0;
 Thu, 29 Jun 2023 23:03:10 +0000 (UTC)
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
X-Inumbo-ID: 1f5020c2-16d1-11ee-8611-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1688079791;
	bh=7kJ2H8hhfmIt4v0p5Dt7LXPajHpuCt+iJnYbZNQYHQo=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=dyvEw4QKppmRQufunL6f6ympU2Fd8mpuxOwHWtG5um/dstJiVX3FuhpHisbH0P23T
	 EshykUUEXidlirCGPOdApTi7xlQC8lJMG3lXV+oLYjc6vhZXqVTTbbcjRvTAbpuAvD
	 yVdzA7XcoHX+jdcRFTSNI4LSZtTjZ/rCU9L3pPHbMtXQdjDitzmPHkiux+t2cvWDBO
	 7a6WFB5vRn80P0ubmpQ7AeCmrRGiGSr9+wrAfhU/YQfpMFhmjvgXWD7y015JgNwvsx
	 N9igUgHv+4993Ib43rKxRJ9rQvQzXNsHRkh3XgD/F030zyob1VapBPQRdbUCVSzh3q
	 NiIyYVoHa9VyA==
Date: Thu, 29 Jun 2023 16:03:09 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Henry Wang <Henry.Wang@arm.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, Wei Chen <wei.chen@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/arm: vgic: Add missing 'U' in VGIC_ICFG_MASK for
 shifted constant
In-Reply-To: <20230629221800.1478182-1-Henry.Wang@arm.com>
Message-ID: <alpine.DEB.2.22.394.2306291603010.3936094@ubuntu-linux-20-04-desktop>
References: <20230629221800.1478182-1-Henry.Wang@arm.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Jun 2023, Henry Wang wrote:
> With UBSAN on some arm64 platforms, e.g. FVP_Base_RevC-2xAEMvA, the
> following splat will be printed while Dom0 is booting:
> ```
> (XEN) ==================================================================
> (XEN) UBSAN: Undefined behaviour in arch/arm/vgic.c:372:15
> (XEN) left shift of 1 by 31 places cannot be represented in type 'int'
> (XEN) Xen WARN at common/ubsan/ubsan.c:172
> (XEN) ----[ Xen-4.18-unstable  arm64  debug=y ubsan=y  Not tainted ]----
> ```
> 
> This is because there is a device node in the device tree with 0xf
> as the interrupts property. Example of the device tree node is shown
> below:
> ```
> ethernet@202000000 {
>     compatible = "smsc,lan91c111";
>     reg = <0x2 0x2000000 0x10000>;
>     interrupts = <0xf>;
> };
> ```
> and this value is passed to vgic_get_virq_type() as "index" then "intr"
> in VGIC_ICFG_MASK.
> 
> Add the missing 'U' in VGIC_ICFG_MASK as a fix, and this should also
> addressing MISRA Rule 7.2:
> 
>     A "u" or "U" suffix shall be applied to all integer constants that
>     are represented in an unsigned type
> 
> Signed-off-by: Henry Wang <Henry.Wang@arm.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> This patch should be based on top of Julien's series
> "xen/arm: Enable UBSAN support" to test.
> ---
>  xen/arch/arm/vgic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/xen/arch/arm/vgic.c b/xen/arch/arm/vgic.c
> index c61c68870c..97d6f61066 100644
> --- a/xen/arch/arm/vgic.c
> +++ b/xen/arch/arm/vgic.c
> @@ -358,7 +358,7 @@ void vgic_disable_irqs(struct vcpu *v, uint32_t r, int n)
>      }
>  }
>  
> -#define VGIC_ICFG_MASK(intr) (1 << ((2 * ((intr) % 16)) + 1))
> +#define VGIC_ICFG_MASK(intr) (1U << ((2 * ((intr) % 16)) + 1))
>  
>  /* The function should be called with the rank lock taken */
>  static inline unsigned int vgic_get_virq_type(struct vcpu *v, int n, int index)
> -- 
> 2.25.1
> 

