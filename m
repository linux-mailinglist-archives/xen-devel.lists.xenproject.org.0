Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14D40674672
	for <lists+xen-devel@lfdr.de>; Thu, 19 Jan 2023 23:55:41 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.481349.746170 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIdnf-0004FQ-1f; Thu, 19 Jan 2023 22:54:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 481349.746170; Thu, 19 Jan 2023 22:54:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pIdne-0004D2-Uz; Thu, 19 Jan 2023 22:54:26 +0000
Received: by outflank-mailman (input) for mailman id 481349;
 Thu, 19 Jan 2023 22:54:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=PYO0=5Q=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pIdnd-0004Cw-B3
 for xen-devel@lists.xenproject.org; Thu, 19 Jan 2023 22:54:25 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3679293e-984c-11ed-91b6-6bf2151ebd3b;
 Thu, 19 Jan 2023 23:54:23 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3838061D5F;
 Thu, 19 Jan 2023 22:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3DDC433F1;
 Thu, 19 Jan 2023 22:54:19 +0000 (UTC)
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
X-Inumbo-ID: 3679293e-984c-11ed-91b6-6bf2151ebd3b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674168860;
	bh=dC/jVX4XfevFCiywKrgTd2muNUX6G+Rw36Whx4b84Kk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s8XN97enMvkt05il3Xv1nHCiogvwlDN4i3GJdSvE8aVoNWu9290AWZ0kKxf1gHflH
	 u3KW5Y76fMkPhqPVQYMB9q8xZ9XqhWcXulKgMYntkI4GLMHIsXVmetMcWYU/kES2xE
	 caatkMhjCnDDZaOd1TGP4V6e3nXMkh4TCadhSvgf4GaMYuKqUBig1PF7iF47ilsTgn
	 LWjrhxemhxX7uFbjy8sp1G0vt94un9dwvF2tcsT3BMb7nmLxauHVAN3gpFbrJNuJST
	 r70JNKygJIgr/iD2I9HUUkcrwrflrla+I+1RCGuXAjjHLrYaAPB5hUlEleQGlA1Z6Q
	 zy/5KCM+PTHQw==
Date: Thu, 19 Jan 2023 14:54:14 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v2 02/11] xen/arm: Use the correct format specifier
In-Reply-To: <20230117174358.15344-3-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301191454080.731018@ubuntu-linux-20-04-desktop>
References: <20230117174358.15344-1-ayan.kumar.halder@amd.com> <20230117174358.15344-3-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 17 Jan 2023, Ayan Kumar Halder wrote:
> 1. One should use 'PRIpaddr' to display 'paddr_t' variables.
> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
> address.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> 
> Changes from -
> 
> v1 - 1. Moved the patch earlier.
> 2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
> into this patch.
> 
>  xen/arch/arm/domain_build.c | 10 +++++-----
>  xen/arch/arm/gic-v2.c       |  6 +++---
>  xen/arch/arm/mm.c           |  2 +-
>  3 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index 829cea8de8..33a5945a2d 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1315,7 +1315,7 @@ static int __init make_memory_node(const struct domain *d,
>      dt_dprintk("Create memory node\n");
>  
>      /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> +    snprintf(buf, sizeof(buf), "memory@%"PRIpaddr, mem->bank[i].start);
>      res = fdt_begin_node(fdt, buf);
>      if ( res )
>          return res;
> @@ -1383,7 +1383,7 @@ static int __init make_shm_memory_node(const struct domain *d,
>          __be32 *cells;
>          unsigned int len = (addrcells + sizecells) * sizeof(__be32);
>  
> -        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
> +        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIpaddr, mem->bank[i].start);
>          res = fdt_begin_node(fdt, buf);
>          if ( res )
>              return res;
> @@ -2719,7 +2719,7 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>      /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
>      char buf[38];
>  
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
>               vgic_dist_base(&d->arch.vgic));
>      res = fdt_begin_node(fdt, buf);
>      if ( res )
> @@ -2775,7 +2775,7 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>      char buf[38];
>      unsigned int i, len = 0;
>  
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> +    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIpaddr,
>               vgic_dist_base(&d->arch.vgic));
>  
>      res = fdt_begin_node(fdt, buf);
> @@ -2861,7 +2861,7 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>      /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
>      char buf[27];
>  
> -    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
> +    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIpaddr, d->arch.vpl011.base_addr);
>      res = fdt_begin_node(fdt, buf);
>      if ( res )
>          return res;
> diff --git a/xen/arch/arm/gic-v2.c b/xen/arch/arm/gic-v2.c
> index 61802839cb..5d4d298b86 100644
> --- a/xen/arch/arm/gic-v2.c
> +++ b/xen/arch/arm/gic-v2.c
> @@ -1049,7 +1049,7 @@ static void __init gicv2_dt_init(void)
>      if ( csize < SZ_8K )
>      {
>          printk(XENLOG_WARNING "GICv2: WARNING: "
> -               "The GICC size is too small: %#"PRIx64" expected %#x\n",
> +               "The GICC size is too small: %#"PRIpaddr" expected %#x\n",
>                 csize, SZ_8K);
>          if ( platform_has_quirk(PLATFORM_QUIRK_GIC_64K_STRIDE) )
>          {
> @@ -1280,11 +1280,11 @@ static int __init gicv2_init(void)
>          gicv2.map_cbase += aliased_offset;
>  
>          printk(XENLOG_WARNING
> -               "GICv2: Adjusting CPU interface base to %#"PRIx64"\n",
> +               "GICv2: Adjusting CPU interface base to %#"PRIpaddr"\n",
>                 cbase + aliased_offset);
>      } else if ( csize == SZ_128K )
>          printk(XENLOG_WARNING
> -               "GICv2: GICC size=%#"PRIx64" but not aliased\n",
> +               "GICv2: GICC size=%#"PRIpaddr" but not aliased\n",
>                 csize);
>  
>      gicv2.map_hbase = ioremap_nocache(hbase, PAGE_SIZE);
> diff --git a/xen/arch/arm/mm.c b/xen/arch/arm/mm.c
> index 0fc6f2992d..fab54618ab 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -249,7 +249,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
>  
>          pte = mapping[offsets[level]];
>  
> -        printk("%s[0x%03x] = 0x%"PRIpaddr"\n",
> +        printk("%s[0x%03x] = 0x%"PRIx64"\n",
>                 level_strs[level], offsets[level], pte.bits);
>  
>          if ( level == 3 || !pte.walk.valid || !pte.walk.table )
> -- 
> 2.17.1
> 

