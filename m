Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 050528C6F4C
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:50:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722694.1126906 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ONf-0001H6-1w; Wed, 15 May 2024 23:49:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722694.1126906; Wed, 15 May 2024 23:49:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7ONe-0001EB-V8; Wed, 15 May 2024 23:49:54 +0000
Received: by outflank-mailman (input) for mailman id 722694;
 Wed, 15 May 2024 23:49:53 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7ONd-0001Cu-4t
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:49:53 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d11c8945-1315-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 01:49:50 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4680761629;
 Wed, 15 May 2024 23:49:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FDB0C32782;
 Wed, 15 May 2024 23:49:47 +0000 (UTC)
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
X-Inumbo-ID: d11c8945-1315-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715816989;
	bh=pgqYyDEf+Hogp85BIs4KiLUDR2b7ViWBJweZVMzx4KQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=s0+aqCk544LbrAxr/jeV+Svrr383ZD0bpQ4KchGUGnfjpw2xsiFz4PQMtvS4rYmuS
	 Nu4rFsSTG1hu7Cx4zpdjPWfMHUoSss8AAuw/yXTFR5BqJp2gghq70k3ASjbp/dlYnX
	 WgVcsZBD43Jfe5IfqRFRLhoC+VHV4pm1n9V70v77YSZ3Kw6ig3Mgi3g00/uQ+iZEjk
	 q8M/u4sR8cRZvIpLPX43UUWzy7v+qSsLcbp8k4o17RHQKJeQz4UbUZv235EeOxm8RK
	 NkcuEi9R4uu3D3bC/2HpnvonCrhLcym0ToqXECb+Rqgt9eNgeA5epNwHKZb54CzjU+
	 62z8RlAbhdlFA==
Date: Wed, 15 May 2024 16:49:46 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v4 7/9] xen/arm64: mmu/head: Add missing code symbol
 annotations
In-Reply-To: <20240504115514.1063509-8-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405151649210.2544314@ubuntu-linux-20-04-desktop>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com> <20240504115514.1063509-8-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Sat, 4 May 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Use the generic xen/linkage.h macros to annotate code symbols
> and add missing annotations.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/mmu/head.S | 29 +++++++++++++++--------------
>  1 file changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index fa40b696dd..665a51a337 100644
> --- a/xen/arch/arm/arm64/mmu/head.S
> +++ b/xen/arch/arm/arm64/mmu/head.S
> @@ -138,7 +138,7 @@
>   *
>   * Clobbers x0 - x4
>   */
> -create_page_tables:
> +FUNC_LOCAL(create_page_tables)
>          /* Prepare the page-tables for mapping Xen */
>          ldr   x0, =XEN_VIRT_START
>          create_table_entry boot_pgtable, boot_first, x0, 0, x1, x2, x3
> @@ -260,7 +260,7 @@ virtphys_clash:
>          /* Identity map clashes with boot_third, which we cannot handle yet */
>          PRINT("- Unable to build boot page tables - virt and phys addresses clash. -\r\n")
>          b     fail
> -ENDPROC(create_page_tables)
> +END(create_page_tables)
>  
>  /*
>   * Turn on the Data Cache and the MMU. The function will return on the 1:1
> @@ -273,7 +273,7 @@ ENDPROC(create_page_tables)
>   *
>   * Clobbers x0 - x5
>   */
> -enable_mmu:
> +FUNC_LOCAL(enable_mmu)
>          mov   x4, x0
>          mov   x5, x1
>          PRINT_ID("- Turning on paging -\r\n")
> @@ -304,7 +304,7 @@ enable_mmu:
>          PRINT_ID("- Paging turned on -\r\n")
>  
>          ret
> -ENDPROC(enable_mmu)
> +END(enable_mmu)
>  
>  /*
>   * Enable mm (turn on the data cache and the MMU) for secondary CPUs.
> @@ -316,7 +316,7 @@ ENDPROC(enable_mmu)
>   *
>   * Clobbers x0 - x6
>   */
> -ENTRY(enable_secondary_cpu_mm)
> +FUNC(enable_secondary_cpu_mm)
>          mov   x6, lr
>  
>          load_paddr x0, init_ttbr
> @@ -328,7 +328,7 @@ ENTRY(enable_secondary_cpu_mm)
>  
>          /* Return to the virtual address requested by the caller. */
>          ret
> -ENDPROC(enable_secondary_cpu_mm)
> +END(enable_secondary_cpu_mm)
>  
>  /*
>   * Enable mm (turn on the data cache and the MMU) for the boot CPU.
> @@ -340,7 +340,7 @@ ENDPROC(enable_secondary_cpu_mm)
>   *
>   * Clobbers x0 - x6
>   */
> -ENTRY(enable_boot_cpu_mm)
> +FUNC(enable_boot_cpu_mm)
>          mov   x6, lr
>  
>          bl    create_page_tables
> @@ -365,7 +365,7 @@ ENTRY(enable_boot_cpu_mm)
>           * by the caller.
>           */
>          b     remove_identity_mapping
> -ENDPROC(enable_boot_cpu_mm)
> +END(enable_boot_cpu_mm)
>  
>  /*
>   * Remove the 1:1 map from the page-tables. It is not easy to keep track
> @@ -377,7 +377,7 @@ ENDPROC(enable_boot_cpu_mm)
>   *
>   * Clobbers x0 - x1
>   */
> -remove_identity_mapping:
> +FUNC_LOCAL(remove_identity_mapping)
>          /*
>           * Find the zeroeth slot used. Remove the entry from zeroeth
>           * table if the slot is not XEN_ZEROETH_SLOT.
> @@ -419,20 +419,21 @@ identity_mapping_removed:
>          flush_xen_tlb_local
>  
>          ret
> -ENDPROC(remove_identity_mapping)
> +END(remove_identity_mapping)
>  
>  /* Fail-stop */
> -fail:   PRINT("- Boot failed -\r\n")
> +FUNC_LOCAL(fail)
> +        PRINT("- Boot failed -\r\n")
>  1:      wfe
>          b     1b
> -ENDPROC(fail)
> +END(fail)
>  
>  /*
>   * Switch TTBR
>   *
>   * x0    ttbr
>   */
> -ENTRY(switch_ttbr_id)
> +FUNC(switch_ttbr_id)
>          /* 1) Ensure any previous read/write have completed */
>          dsb    ish
>          isb
> @@ -464,7 +465,7 @@ ENTRY(switch_ttbr_id)
>          isb
>  
>          ret
> -ENDPROC(switch_ttbr_id)
> +END(switch_ttbr_id)
>  
>  /*
>   * Local variables:
> -- 
> 2.40.1
> 

