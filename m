Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 60575779B0C
	for <lists+xen-devel@lfdr.de>; Sat, 12 Aug 2023 01:10:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.582730.912633 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUbGD-0003ry-5j; Fri, 11 Aug 2023 23:09:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 582730.912633; Fri, 11 Aug 2023 23:09:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qUbGD-0003px-2v; Fri, 11 Aug 2023 23:09:37 +0000
Received: by outflank-mailman (input) for mailman id 582730;
 Fri, 11 Aug 2023 23:09:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=01QD=D4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qUbGB-0003pr-Pt
 for xen-devel@lists.xenproject.org; Fri, 11 Aug 2023 23:09:35 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 21674790-389c-11ee-8613-37d641c3527e;
 Sat, 12 Aug 2023 01:09:33 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7D35167B73;
 Fri, 11 Aug 2023 23:09:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8FF7C433C8;
 Fri, 11 Aug 2023 23:09:29 +0000 (UTC)
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
X-Inumbo-ID: 21674790-389c-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691795370;
	bh=z2011711AMPRnF6YX7ylWEkL2djZCNqe/f2nnnReMMs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=jGd2itPuUFBVq9576nu+lHpPebCezIeUnaEdsun+1YTueZjeXKVaWYu1PEideS8Le
	 i73umClzb0TkVkJf3CnEhwAsZtqtGt30lxfq5qY7GnTFLF82hh5Hk0W/Qvbb3UlEt3
	 qTbbdf0ivqijJg5KEBMSRwfme83qfagZU9ykabCTqeObQlqujQfmA0oU2Yr1L8/cQM
	 KuimioUmSIGK7yzMA1NX80zkwG9fJZheXEmtEBvbazJZIWMAO+Y2ve6BZc8QlgLQoR
	 ausf04fyq8xG/3ro6+J8nXK8EZiNxkt0f4mAPka88AYs3ikRIVGrmKxXEfvi95yr6w
	 ADO9MyZ5c55Lg==
Date: Fri, 11 Aug 2023 16:09:28 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com
Subject: Re: [XEN PATCH 6/6] drivers/video: make declarations of defined
 functions available
In-Reply-To: <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308111609160.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691676251.git.nicola.vetrini@bugseng.com> <a50cc0f60c536554591834da660c540fcb77faf8.1691676251.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 11 Aug 2023, Nicola Vetrini wrote:
> The declarations for 'vesa_{init,early_init,endboot}' needed by
> 'xen/drivers/video/vesa.c' and 'fill_console_start_info' in 'vga.c'
> are now available by moving the relative code inside 'vga.h' and
> including "<xen/console.h>" respectively.
> This also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> Fixes: ebb26b509f1a ("xen/x86: make VGA support selectable")
> Fixes: 6d9199bd0f22 ("x86-64: enable hypervisor output on VESA frame buffer")

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/x86/include/asm/setup.h |  6 ------
>  xen/drivers/video/vga.c          |  9 +--------
>  xen/include/xen/vga.h            | 14 ++++++++++++++
>  3 files changed, 15 insertions(+), 14 deletions(-)
> 
> diff --git a/xen/arch/x86/include/asm/setup.h b/xen/arch/x86/include/asm/setup.h
> index b0e6a39e2365..dfdd9e555149 100644
> --- a/xen/arch/x86/include/asm/setup.h
> +++ b/xen/arch/x86/include/asm/setup.h
> @@ -25,12 +25,6 @@ void subarch_init_memory(void);
>  
>  void init_IRQ(void);
>  
> -#ifdef CONFIG_VIDEO
> -void vesa_init(void);
> -#else
> -static inline void vesa_init(void) {};
> -#endif
> -
>  int construct_dom0(
>      struct domain *d,
>      const module_t *image, unsigned long image_headroom,
> diff --git a/xen/drivers/video/vga.c b/xen/drivers/video/vga.c
> index 0a03508bee60..b62a47e000e7 100644
> --- a/xen/drivers/video/vga.c
> +++ b/xen/drivers/video/vga.c
> @@ -9,6 +9,7 @@
>  #include <xen/mm.h>
>  #include <xen/param.h>
>  #include <xen/vga.h>
> +#include <xen/console.h>
>  #include <xen/pci.h>
>  #include <asm/io.h>
>  
> @@ -54,14 +55,6 @@ string_param("vga", opt_vga);
>  static unsigned int columns, lines;
>  #define ATTRIBUTE   7
>  
> -#ifdef CONFIG_X86
> -void vesa_early_init(void);
> -void vesa_endboot(bool_t keep);
> -#else
> -#define vesa_early_init() ((void)0)
> -#define vesa_endboot(x)   ((void)0)
> -#endif
> -
>  void __init video_init(void)
>  {
>      char *p;
> diff --git a/xen/include/xen/vga.h b/xen/include/xen/vga.h
> index f72b63d446b1..ffd73c9db135 100644
> --- a/xen/include/xen/vga.h
> +++ b/xen/include/xen/vga.h
> @@ -15,4 +15,18 @@
>  extern struct xen_vga_console_info vga_console_info;
>  #endif
>  
> +#ifdef CONFIG_X86
> +void vesa_early_init(void);
> +void vesa_endboot(bool_t keep);
> +#else
> +#define vesa_early_init() ((void)0)
> +#define vesa_endboot(x)   ((void)0)
> +#endif
> +
> +#ifdef CONFIG_VIDEO
> +void vesa_init(void);
> +#else
> +static inline void vesa_init(void) {};
> +#endif
> +
>  #endif /* _XEN_VGA_H */
> -- 
> 2.34.1
> 

