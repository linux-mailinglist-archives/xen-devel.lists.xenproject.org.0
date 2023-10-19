Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A46047D0390
	for <lists+xen-devel@lfdr.de>; Thu, 19 Oct 2023 23:15:11 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.619576.964884 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtaL8-0008LH-U2; Thu, 19 Oct 2023 21:13:58 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 619576.964884; Thu, 19 Oct 2023 21:13:58 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qtaL8-0008Hw-RE; Thu, 19 Oct 2023 21:13:58 +0000
Received: by outflank-mailman (input) for mailman id 619576;
 Thu, 19 Oct 2023 21:13:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=IZCy=GB=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qtaL7-0008Hq-G4
 for xen-devel@lists.xenproject.org; Thu, 19 Oct 2023 21:13:57 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 68944695-6ec4-11ee-98d5-6d05b1d4d9a1;
 Thu, 19 Oct 2023 23:13:55 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7A6FE61D60;
 Thu, 19 Oct 2023 21:13:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55457C433C7;
 Thu, 19 Oct 2023 21:13:51 +0000 (UTC)
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
X-Inumbo-ID: 68944695-6ec4-11ee-98d5-6d05b1d4d9a1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697750033;
	bh=ZA2j2DnRDwbTQbyadeP/e+wV7+BqIgxPr69VCFYC0a8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=J7JJot02fyJ/5OvbkOO+SpXOBh+bgs3lG8GDfIlVrw9ImZBXSwXpS+TZP1UMUqi6R
	 DlDLNznO3RqGm37hMvH3Tm9vY0/sCIMYn6PyovVBTACI1CkHlK4b75yamwhpPG0y4I
	 Lr5Ksi47h/7KIZdeYDjZz/herq7/L/WceRI2WotwknWQtLCXFAKIgSPY6DYWfR55Ch
	 xmHR+Ems6uvM88h8gA9oXMyvLZa1bzx75Mp5Kghs0oIQXnjsGIt+vRJj23o1KwMuZ1
	 dGZE7/CmFCGcXTR7le5hTrAiFnjSqp6XmbkRqk0qS5k241cUb8IyMzXWgTrtgUZ7Pg
	 w3owBxyqtjvCQ==
Date: Thu, 19 Oct 2023 14:13:49 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Nicola Vetrini <nicola.vetrini@bugseng.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, 
    michal.orzel@amd.com, xenia.ragiadakou@amd.com, ayan.kumar.halder@amd.com, 
    consulting@bugseng.com, jbeulich@suse.com, andrew.cooper3@citrix.com, 
    roger.pau@citrix.com, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>, 
    George Dunlap <george.dunlap@citrix.com>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH][for-4.19 v3 1/8] xen: add declarations for variables
 where needed
In-Reply-To: <4d419cbffc84e0f9934794d105705ac64094a54a.1697722648.git.nicola.vetrini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2310191413310.2099202@ubuntu-linux-20-04-desktop>
References: <cover.1697722648.git.nicola.vetrini@bugseng.com> <4d419cbffc84e0f9934794d105705ac64094a54a.1697722648.git.nicola.vetrini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 19 Oct 2023, Nicola Vetrini wrote:
> Some variables with external linkage used in C code do not have
> a visible declaration where they are defined. Providing such
> declaration also resolves violations of MISRA C:2012 Rule 8.4.
> 
> Signed-off-by: Nicola Vetrini <nicola.vetrini@bugseng.com>
> ---
> Changes in v2:
> - make xenpf_lock static on ARM
> Changes in v3:
> - moved back code from symbols.h to symbols.c
> - dropped two declarations, now deviated
> ---
>  xen/arch/arm/include/asm/setup.h  | 3 +++
>  xen/arch/arm/include/asm/smp.h    | 3 +++
>  xen/arch/arm/platform_hypercall.c | 2 +-
>  xen/arch/x86/cpu/mcheck/mce.c     | 6 +++---
>  xen/arch/x86/irq.c                | 2 +-
>  xen/include/xen/symbols.h         | 1 +
>  6 files changed, 12 insertions(+), 5 deletions(-)
> 
> diff --git a/xen/arch/arm/include/asm/setup.h b/xen/arch/arm/include/asm/setup.h
> index 98af6f55f5a0..2a2d6114f2eb 100644
> --- a/xen/arch/arm/include/asm/setup.h
> +++ b/xen/arch/arm/include/asm/setup.h
> @@ -184,9 +184,12 @@ int map_range_to_domain(const struct dt_device_node *dev,
>  extern lpae_t boot_pgtable[XEN_PT_LPAE_ENTRIES];
>  
>  #ifdef CONFIG_ARM_64
> +extern lpae_t boot_first[XEN_PT_LPAE_ENTRIES];
>  extern lpae_t boot_first_id[XEN_PT_LPAE_ENTRIES];
>  #endif
> +extern lpae_t boot_second[XEN_PT_LPAE_ENTRIES];
>  extern lpae_t boot_second_id[XEN_PT_LPAE_ENTRIES];
> +extern lpae_t boot_third[XEN_PT_LPAE_ENTRIES * XEN_NR_ENTRIES(2)];
>  extern lpae_t boot_third_id[XEN_PT_LPAE_ENTRIES];
>  
>  /* Find where Xen will be residing at runtime and return a PT entry */
> diff --git a/xen/arch/arm/include/asm/smp.h b/xen/arch/arm/include/asm/smp.h
> index 4fabdf5310d8..28bf24a01d95 100644
> --- a/xen/arch/arm/include/asm/smp.h
> +++ b/xen/arch/arm/include/asm/smp.h
> @@ -6,6 +6,9 @@
>  #include <asm/current.h>
>  #endif
>  
> +extern struct init_info init_data;
> +extern unsigned long smp_up_cpu;
> +
>  DECLARE_PER_CPU(cpumask_var_t, cpu_sibling_mask);
>  DECLARE_PER_CPU(cpumask_var_t, cpu_core_mask);
>  
> diff --git a/xen/arch/arm/platform_hypercall.c b/xen/arch/arm/platform_hypercall.c
> index 743687a30390..fde4bc3e5809 100644
> --- a/xen/arch/arm/platform_hypercall.c
> +++ b/xen/arch/arm/platform_hypercall.c
> @@ -17,7 +17,7 @@
>  #include <asm/current.h>
>  #include <asm/event.h>
>  
> -DEFINE_SPINLOCK(xenpf_lock);
> +static DEFINE_SPINLOCK(xenpf_lock);
>  
>  long do_platform_op(XEN_GUEST_HANDLE_PARAM(xen_platform_op_t) u_xenpf_op)
>  {
> diff --git a/xen/arch/x86/cpu/mcheck/mce.c b/xen/arch/x86/cpu/mcheck/mce.c
> index 6141b7eb9cf1..e855f958030d 100644
> --- a/xen/arch/x86/cpu/mcheck/mce.c
> +++ b/xen/arch/x86/cpu/mcheck/mce.c
> @@ -1682,13 +1682,13 @@ long do_mca(XEN_GUEST_HANDLE_PARAM(xen_mc_t) u_xen_mc)
>      return ret;
>  }
>  
> -int mcinfo_dumpped;
> +static int mcinfo_dumped;
>  static int cf_check x86_mcinfo_dump_panic(mctelem_cookie_t mctc)
>  {
>      struct mc_info *mcip = mctelem_dataptr(mctc);
>  
>      x86_mcinfo_dump(mcip);
> -    mcinfo_dumpped++;
> +    mcinfo_dumped++;
>  
>      return 0;
>  }
> @@ -1702,7 +1702,7 @@ static void mc_panic_dump(void)
>      for_each_online_cpu(cpu)
>          mctelem_process_deferred(cpu, x86_mcinfo_dump_panic,
>                                   mctelem_has_deferred_lmce(cpu));
> -    dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumpped);
> +    dprintk(XENLOG_ERR, "End dump mc_info, %x mcinfo dumped\n", mcinfo_dumped);
>  }
>  
>  void mc_panic(const char *s)
> diff --git a/xen/arch/x86/irq.c b/xen/arch/x86/irq.c
> index 6abfd8162120..604dba94b052 100644
> --- a/xen/arch/x86/irq.c
> +++ b/xen/arch/x86/irq.c
> @@ -43,7 +43,7 @@ int __read_mostly opt_irq_vector_map = OPT_IRQ_VECTOR_MAP_DEFAULT;
>  static unsigned char __read_mostly irq_max_guests;
>  integer_param("irq-max-guests", irq_max_guests);
>  
> -vmask_t global_used_vector_map;
> +static vmask_t global_used_vector_map;
>  
>  struct irq_desc __read_mostly *irq_desc = NULL;
>  
> diff --git a/xen/include/xen/symbols.h b/xen/include/xen/symbols.h
> index 20bbb28ef226..1b2863663aa0 100644
> --- a/xen/include/xen/symbols.h
> +++ b/xen/include/xen/symbols.h
> @@ -33,4 +33,5 @@ struct symbol_offset {
>      uint32_t stream; /* .. in the compressed stream.*/
>      uint32_t addr;   /* .. and in the fixed size address array. */
>  };
> +
>  #endif /*_XEN_SYMBOLS_H*/

Spurious change.

Aside from this:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

