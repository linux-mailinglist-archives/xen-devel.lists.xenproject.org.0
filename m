Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB4C8BB8A3
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 02:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716727.1118942 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s333o-0003PF-Mk; Sat, 04 May 2024 00:15:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716727.1118942; Sat, 04 May 2024 00:15:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s333o-0003Ma-JZ; Sat, 04 May 2024 00:15:28 +0000
Received: by outflank-mailman (input) for mailman id 716727;
 Sat, 04 May 2024 00:15:27 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=498C=MH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s333n-0002yM-6D
 for xen-devel@lists.xenproject.org; Sat, 04 May 2024 00:15:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 670cf9d5-09ab-11ef-b4bb-af5377834399;
 Sat, 04 May 2024 02:15:25 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BEB9C60A70;
 Sat,  4 May 2024 00:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C25CAC116B1;
 Sat,  4 May 2024 00:15:21 +0000 (UTC)
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
X-Inumbo-ID: 670cf9d5-09ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714781723;
	bh=guBLwYmp0JPu0oz5oTLIWtqx2/I45mwLYCHyDSqcxjc=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=BnJz/5VShPDrTQso7btV6ytg8hEGi9V+cS+bifxyD655jjgUETmfDbIXgdJDGyyGd
	 4tUAVyEprwBmU3PJjKQktP+prnY6qWHkakqgLb8yxhz1FJuCSfqK1hiPSfGPWXZGTw
	 5/i/kznuQNQi7R1kzCJ6myWce1G1kveqDWMaVp7XbjLYs5X1zGXtWAbhDh2Swbt4KD
	 U7SEWqoJuAGkA+M+oDxO1Lv3fM//PBp25aAzKKUQA47ytz43F8Vz7Dun5nPiC9ZW2T
	 UztKGBAcfO0ifcoETix6gihF4etCSFSrOlKdqrXqevHfUnH3H4V0vEUeCH4wLr1e1d
	 ZYZrZrEQrHaLg==
Date: Fri, 3 May 2024 17:15:20 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 7/9] xen/arm64: mmu/head: Add missing code symbol
 annotations
In-Reply-To: <20240501035448.964625-8-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405031715090.1151289@ubuntu-linux-20-04-desktop>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com> <20240501035448.964625-8-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 1 May 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Use the generic xen/linkage.h macros to annotate code symbols
> and add missing annotations.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
> ---
>  xen/arch/arm/arm64/mmu/head.S | 28 ++++++++++++++--------------
>  1 file changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/mmu/head.S b/xen/arch/arm/arm64/mmu/head.S
> index fa40b696dd..7788bb95e5 100644
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
> @@ -419,20 +419,20 @@ identity_mapping_removed:
>          flush_xen_tlb_local
>  
>          ret
> -ENDPROC(remove_identity_mapping)
> +END(remove_identity_mapping)
>  
>  /* Fail-stop */
> -fail:   PRINT("- Boot failed -\r\n")
> +FUNC_LOCAL(fail)   PRINT("- Boot failed -\r\n")

move PRINT to newline


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
> @@ -464,7 +464,7 @@ ENTRY(switch_ttbr_id)
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

