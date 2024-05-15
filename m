Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 950C18C6F25
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:25:15 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722676.1126876 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NzX-0003pE-Lr; Wed, 15 May 2024 23:24:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722676.1126876; Wed, 15 May 2024 23:24:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7NzX-0003n8-JH; Wed, 15 May 2024 23:24:59 +0000
Received: by outflank-mailman (input) for mailman id 722676;
 Wed, 15 May 2024 23:24:58 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7NzW-0003n2-Ri
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:24:58 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 566791af-1312-11ef-909d-e314d9c70b13;
 Thu, 16 May 2024 01:24:57 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id D648BCE1371;
 Wed, 15 May 2024 23:24:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C044C116B1;
 Wed, 15 May 2024 23:24:51 +0000 (UTC)
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
X-Inumbo-ID: 566791af-1312-11ef-909d-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815493;
	bh=cOy32dOQ9cyam8WQ2lP2EYDTH/jxSOlJ+JgnjXKKEWY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=W+CJdMRzJ6GT76WYxSUbl+zeiWK5yN2pBAB/ouYmlZ8EQZ7hexYAt6kyqJ71uE8Nn
	 toopXoF0yeJBPoLQmTCALfzA7S7BXFl070TXQkUIW6O+OoSlSSczIGCtXVrEi7p9bM
	 sf30ifJe6fGDAZqTp2yY7UyEGIM2Wqk6vvVekmmkkHaFEqdQEkQQS2kP/OeIye61x5
	 64ZlYMnHIWKQuQVxQp1nO6L5fK+WX7kAG989UGbdhgolp6s/zUQDuKVyiDzHxEzQMv
	 uR/HDkXDSc6QDcWpJQtfUfX7LIB/weO2JAUjAIPMf12jOZLS9SfAhLxLkUxCaSSx9o
	 zhiM7LcX+kWCg==
Date: Wed, 15 May 2024 16:24:50 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v4 4/9] xen/arm64: head: Add missing code symbol
 annotations
In-Reply-To: <20240504115514.1063509-5-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405151624120.2544314@ubuntu-linux-20-04-desktop>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com> <20240504115514.1063509-5-edgar.iglesias@gmail.com>
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
>  xen/arch/arm/arm64/head.S | 51 +++++++++++++++++++++------------------
>  1 file changed, 27 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/head.S b/xen/arch/arm/arm64/head.S
> index fb297e9eb5..2fa07dc3a0 100644
> --- a/xen/arch/arm/arm64/head.S
> +++ b/xen/arch/arm/arm64/head.S
> @@ -90,7 +90,7 @@
>   * 4K-aligned address.
>   */
>  
> -GLOBAL(start)
> +FUNC(start)
>          /*
>           * DO NOT MODIFY. Image header expected by Linux boot-loaders.
>           */
> @@ -102,6 +102,7 @@ efi_head:
>           */
>          add     x13, x18, #0x16
>          b       real_start           /* branch to kernel start */
> +END(start)
>          .quad   0                    /* Image load offset from start of RAM */
>          .quad   _end - start         /* Effective size of kernel image, little-endian */
>          .quad   __HEAD_FLAGS         /* Informative flags, little-endian */
> @@ -223,7 +224,7 @@ section_table:
>          .align  5
>  #endif /* CONFIG_ARM_EFI */
>  
> -real_start:
> +FUNC_LOCAL(real_start)
>          /* BSS should be zeroed when booting without EFI */
>          mov   x26, #0                /* x26 := skip_zero_bss */
>  
> @@ -263,9 +264,9 @@ primary_switched:
>          mov   x1, x21                /* x1 := paddr(FDT) */
>          ldr   x2, =start_xen
>          b     launch
> -ENDPROC(real_start)
> +END(real_start)
>  
> -GLOBAL(init_secondary)
> +FUNC(init_secondary)
>          msr   DAIFSet, 0xf           /* Disable all interrupts */
>  
>          /* Find out where we are */
> @@ -304,7 +305,7 @@ secondary_switched:
>          /* Jump to C world */
>          ldr   x2, =start_secondary
>          b     launch
> -ENDPROC(init_secondary)
> +END(init_secondary)
>  
>  /*
>   * Check if the CPU has been booted in Hypervisor mode.
> @@ -313,7 +314,7 @@ ENDPROC(init_secondary)
>   *
>   * Clobbers x0 - x5
>   */
> -check_cpu_mode:
> +FUNC_LOCAL(check_cpu_mode)
>          PRINT_ID("- Current EL ")
>          mrs   x5, CurrentEL
>          print_reg x5
> @@ -329,7 +330,7 @@ check_cpu_mode:
>          PRINT_ID("- Xen must be entered in NS EL2 mode -\r\n")
>          PRINT_ID("- Please update the bootloader -\r\n")
>          b fail
> -ENDPROC(check_cpu_mode)
> +END(check_cpu_mode)
>  
>  /*
>   * Zero BSS
> @@ -339,7 +340,7 @@ ENDPROC(check_cpu_mode)
>   *
>   * Clobbers x0 - x3
>   */
> -zero_bss:
> +FUNC_LOCAL(zero_bss)
>          /* Zero BSS only when requested */
>          cbnz  x26, skip_bss
>  
> @@ -353,14 +354,14 @@ zero_bss:
>  
>  skip_bss:
>          ret
> -ENDPROC(zero_bss)
> +END(zero_bss)
>  
>  /*
>   * Initialize the processor for turning the MMU on.
>   *
>   * Clobbers x0 - x3
>   */
> -cpu_init:
> +FUNC_LOCAL(cpu_init)
>          PRINT_ID("- Initialize CPU -\r\n")
>  
>          /* Set up memory attribute type tables */
> @@ -399,7 +400,7 @@ cpu_init:
>           */
>          msr spsel, #1
>          ret
> -ENDPROC(cpu_init)
> +END(cpu_init)
>  
>  /*
>   * Setup the initial stack and jump to the C world
> @@ -411,7 +412,7 @@ ENDPROC(cpu_init)
>   *
>   * Clobbers x3
>   */
> -launch:
> +FUNC_LOCAL(launch)
>          ldr   x3, =init_data
>          add   x3, x3, #INITINFO_stack /* Find the boot-time stack */
>          ldr   x3, [x3]
> @@ -421,13 +422,14 @@ launch:
>  
>          /* Jump to C world */
>          br    x2
> -ENDPROC(launch)
> +END(launch)
>  
>  /* Fail-stop */
> -fail:   PRINT_ID("- Boot failed -\r\n")
> +FUNC_LOCAL(fail)
> +        PRINT_ID("- Boot failed -\r\n")
>  1:      wfe
>          b     1b
> -ENDPROC(fail)
> +END(fail)
>  
>  #ifdef CONFIG_EARLY_PRINTK
>  /*
> @@ -438,14 +440,14 @@ ENDPROC(fail)
>   *
>   * Clobbers x0 - x1
>   */
> -init_uart:
> +FUNC_LOCAL(init_uart)
>          ldr   x23, =CONFIG_EARLY_UART_BASE_ADDRESS
>  #ifdef CONFIG_EARLY_UART_INIT
>          early_uart_init x23, 0
>  #endif
>          PRINT("- UART enabled -\r\n")
>          ret
> -ENDPROC(init_uart)
> +END(init_uart)
>  
>  /*
>   * Print early debug messages.
> @@ -454,7 +456,7 @@ ENDPROC(init_uart)
>   * x23: Early UART base address
>   * Clobbers x0-x1
>   */
> -ENTRY(asm_puts)
> +FUNC(asm_puts)
>          early_uart_ready x23, 1
>          ldrb  w1, [x0], #1           /* Load next char */
>          cbz   w1, 1f                 /* Exit on nul */
> @@ -462,7 +464,7 @@ ENTRY(asm_puts)
>          b     asm_puts
>  1:
>          ret
> -ENDPROC(asm_puts)
> +END(asm_puts)
>  
>  /*
>   * Print a 64-bit number in hex.
> @@ -471,7 +473,7 @@ ENDPROC(asm_puts)
>   * x23: Early UART base address
>   * Clobbers x0-x3
>   */
> -ENTRY(asm_putn)
> +FUNC(asm_putn)
>          adr_l x1, hex
>          mov   x3, #16
>  1:
> @@ -484,7 +486,7 @@ ENTRY(asm_putn)
>          subs  x3, x3, #1
>          b.ne  1b
>          ret
> -ENDPROC(asm_putn)
> +END(asm_putn)
>  
>  RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef")
>  
> @@ -493,16 +495,17 @@ RODATA_SECT(.rodata.idmap, hex, "0123456789abcdef")
>  /* This provides a C-API version of __lookup_processor_type
>   * TODO: For now, the implementation return NULL every time
>   */
> -ENTRY(lookup_processor_type)
> +FUNC(lookup_processor_type)
>          mov  x0, #0
>          ret
> +END(lookup_processor_type)
>  
>  #ifdef CONFIG_ARM_EFI
>  /*
>   *  Function to transition from EFI loader in C, to Xen entry point.
>   *  void noreturn efi_xen_start(void *fdt_ptr, uint32_t fdt_size);
>   */
> -ENTRY(efi_xen_start)
> +FUNC(efi_xen_start)
>          /*
>           * Preserve x0 (fdt pointer) across call to __flush_dcache_area,
>           * restore for entry into Xen.
> @@ -554,7 +557,7 @@ ENTRY(efi_xen_start)
>          mov   x26, #1               /* x26 := skip_zero_bss */
>  
>          b     real_start_efi
> -ENDPROC(efi_xen_start)
> +END(efi_xen_start)
>  
>  #endif /* CONFIG_ARM_EFI */
>  
> -- 
> 2.40.1
> 

