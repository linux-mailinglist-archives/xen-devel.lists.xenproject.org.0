Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 35AEA67BDBB
	for <lists+xen-devel@lfdr.de>; Wed, 25 Jan 2023 22:09:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.484567.751199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKn1a-0007ED-Tv; Wed, 25 Jan 2023 21:09:42 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 484567.751199; Wed, 25 Jan 2023 21:09:42 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pKn1a-0007BY-Qd; Wed, 25 Jan 2023 21:09:42 +0000
Received: by outflank-mailman (input) for mailman id 484567;
 Wed, 25 Jan 2023 21:09:41 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=a83O=5W=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1pKn1Z-0007BS-Af
 for xen-devel@lists.xenproject.org; Wed, 25 Jan 2023 21:09:41 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 93d27d8f-9cf4-11ed-b8d1-410ff93cb8f0;
 Wed, 25 Jan 2023 22:09:38 +0100 (CET)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EA3FB81BA4;
 Wed, 25 Jan 2023 21:09:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2680C433D2;
 Wed, 25 Jan 2023 21:09:35 +0000 (UTC)
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
X-Inumbo-ID: 93d27d8f-9cf4-11ed-b8d1-410ff93cb8f0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674680976;
	bh=eP9p7Owq6sX9WhkkEIrdPKlxpEYqi5HBwp29OQpgcpU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=E1neAMK1neHJjFK5rjSwLns75F6rA67sZnu8o9QsoNKBsbcwGWJaA9UoxdsEYScki
	 JL2vRPb7SO7nRflvIwK1FFmbqO4FCZqzc8qtRrfqeZTw2OBRdUbHizwXu/kIxfB+Xa
	 DenjYV3L4ekJ1xgCstNIx90j4uPZDC3X+B7P7NGj60EvhQImwtVLqRhgoy10PeomLs
	 E62l8oa6faeT9mT5sL19fPCaTdGL49WYUx4jyMjOKLigkbU1xncB1ovdmzJOhSHmKy
	 VF8rtlWSDkAW01pIaBtBfDYKBJ0RLSfzqgowB1m44at7iZih2lHrfLzwkuz92blLdv
	 yOWOcdKgIOEHg==
Date: Wed, 25 Jan 2023 13:09:34 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    stefano.stabellini@amd.com, julien@xen.org, Volodymyr_Babchuk@epam.com, 
    bertrand.marquis@arm.com
Subject: Re: [XEN v5] xen/arm: Use the correct format specifier
In-Reply-To: <20230125101943.1854-1-ayan.kumar.halder@amd.com>
Message-ID: <alpine.DEB.2.22.394.2301251309160.1978264@ubuntu-linux-20-04-desktop>
References: <20230125101943.1854-1-ayan.kumar.halder@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 25 Jan 2023, Ayan Kumar Halder wrote:
> 1. One should use 'PRIpaddr' to display 'paddr_t' variables. However,
> while creating nodes in fdt, the address (if present in the node name)
> should be represented using 'PRIx64'. This is to be in conformance
> with the following rule present in https://elinux.org/Device_Tree_Linux
> 
> . node names
> "unit-address does not have leading zeros"
> 
> As 'PRIpaddr' introduces leading zeros, we cannot use it.
> 
> So, we have introduced a wrapper ie domain_fdt_begin_node() which will
> represent physical address using 'PRIx64'.
> 
> 2. One should use 'PRIx64' to display 'u64' in hex format. The current
> use of 'PRIpaddr' for printing PTE is buggy as this is not a physical
> address.
> 
> Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>


Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

(I checked that Ayan also addressed Julien's latest comments.)


> ---
> Changes from -
> 
> v1 - 1. Moved the patch earlier.
> 2. Moved a part of change from "[XEN v1 8/9] xen/arm: Other adaptations required to support 32bit paddr"
> into this patch.
> 
> v2 - 1. Use PRIx64 for appending addresses to fdt node names. This fixes the CI failure.
> 
> v3 - 1. Added a comment on top of domain_fdt_begin_node().
> 2. Check for the return of snprintf() in domain_fdt_begin_node().
> 
> v4 - 1. Grammatical error fixes.
> 
>  xen/arch/arm/domain_build.c | 64 +++++++++++++++++++++++--------------
>  xen/arch/arm/gic-v2.c       |  6 ++--
>  xen/arch/arm/mm.c           |  2 +-
>  3 files changed, 44 insertions(+), 28 deletions(-)
> 
> diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
> index c2b97fa21e..a798e0b256 100644
> --- a/xen/arch/arm/domain_build.c
> +++ b/xen/arch/arm/domain_build.c
> @@ -1288,6 +1288,39 @@ static int __init fdt_property_interrupts(const struct kernel_info *kinfo,
>      return res;
>  }
>  
> +/*
> + * Wrapper to convert physical address from paddr_t to uint64_t and
> + * invoke fdt_begin_node(). This is required as the physical address
> + * provided as part of node name should not contain any leading
> + * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
> + * unit (which contains the physical address) with name to generate a
> + * node name.
> + */
> +static int __init domain_fdt_begin_node(void *fdt, const char *name,
> +                                        uint64_t unit)
> +{
> +    /*
> +     * The size of the buffer to hold the longest possible string (i.e.
> +     * interrupt-controller@ + a 64-bit number + \0).
> +     */
> +    char buf[38];
> +    int ret;
> +
> +    /* ePAPR 3.4 */
> +    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
> +
> +    if ( ret >= sizeof(buf) )
> +    {
> +        printk(XENLOG_ERR
> +               "Insufficient buffer. Minimum size required is %d\n",
> +               (ret + 1));
> +
> +        return -FDT_ERR_TRUNCATED;
> +    }
> +
> +    return fdt_begin_node(fdt, buf);
> +}
> +
>  static int __init make_memory_node(const struct domain *d,
>                                     void *fdt,
>                                     int addrcells, int sizecells,
> @@ -1296,8 +1329,6 @@ static int __init make_memory_node(const struct domain *d,
>      unsigned int i;
>      int res, reg_size = addrcells + sizecells;
>      int nr_cells = 0;
> -    /* Placeholder for memory@ + a 64-bit number + \0 */
> -    char buf[24];
>      __be32 reg[NR_MEM_BANKS * 4 /* Worst case addrcells + sizecells */];
>      __be32 *cells;
>  
> @@ -1314,9 +1345,7 @@ static int __init make_memory_node(const struct domain *d,
>  
>      dt_dprintk("Create memory node\n");
>  
> -    /* ePAPR 3.4 */
> -    snprintf(buf, sizeof(buf), "memory@%"PRIx64, mem->bank[i].start);
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "memory", mem->bank[i].start);
>      if ( res )
>          return res;
>  
> @@ -1375,16 +1404,13 @@ static int __init make_shm_memory_node(const struct domain *d,
>      {
>          uint64_t start = mem->bank[i].start;
>          uint64_t size = mem->bank[i].size;
> -        /* Placeholder for xen-shmem@ + a 64-bit number + \0 */
> -        char buf[27];
>          const char compat[] = "xen,shared-memory-v1";
>          /* Worst case addrcells + sizecells */
>          __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>          __be32 *cells;
>          unsigned int len = (addrcells + sizecells) * sizeof(__be32);
>  
> -        snprintf(buf, sizeof(buf), "xen-shmem@%"PRIx64, mem->bank[i].start);
> -        res = fdt_begin_node(fdt, buf);
> +        res = domain_fdt_begin_node(fdt, "xen-shmem", mem->bank[i].start);
>          if ( res )
>              return res;
>  
> @@ -2716,12 +2742,9 @@ static int __init make_gicv2_domU_node(struct kernel_info *kinfo)
>      __be32 reg[(GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS) * 2];
>      __be32 *cells;
>      const struct domain *d = kinfo->d;
> -    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
> -    char buf[38];
>  
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> -             vgic_dist_base(&d->arch.vgic));
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "interrupt-controller",
> +                                vgic_dist_base(&d->arch.vgic));
>      if ( res )
>          return res;
>  
> @@ -2771,14 +2794,10 @@ static int __init make_gicv3_domU_node(struct kernel_info *kinfo)
>      int res = 0;
>      __be32 *reg, *cells;
>      const struct domain *d = kinfo->d;
> -    /* Placeholder for interrupt-controller@ + a 64-bit number + \0 */
> -    char buf[38];
>      unsigned int i, len = 0;
>  
> -    snprintf(buf, sizeof(buf), "interrupt-controller@%"PRIx64,
> -             vgic_dist_base(&d->arch.vgic));
> -
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "interrupt-controller",
> +                                vgic_dist_base(&d->arch.vgic));
>      if ( res )
>          return res;
>  
> @@ -2858,11 +2877,8 @@ static int __init make_vpl011_uart_node(struct kernel_info *kinfo)
>      __be32 reg[GUEST_ROOT_ADDRESS_CELLS + GUEST_ROOT_SIZE_CELLS];
>      __be32 *cells;
>      struct domain *d = kinfo->d;
> -    /* Placeholder for sbsa-uart@ + a 64-bit number + \0 */
> -    char buf[27];
>  
> -    snprintf(buf, sizeof(buf), "sbsa-uart@%"PRIx64, d->arch.vpl011.base_addr);
> -    res = fdt_begin_node(fdt, buf);
> +    res = domain_fdt_begin_node(fdt, "sbsa-uart", d->arch.vpl011.base_addr);
>      if ( res )
>          return res;
>  
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
> index f758cad545..b99806af99 100644
> --- a/xen/arch/arm/mm.c
> +++ b/xen/arch/arm/mm.c
> @@ -263,7 +263,7 @@ void dump_pt_walk(paddr_t ttbr, paddr_t addr,
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

