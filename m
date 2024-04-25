Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D10E18B2D7A
	for <lists+xen-devel@lfdr.de>; Fri, 26 Apr 2024 01:14:34 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.712319.1112935 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s08I6-0006Fo-EM; Thu, 25 Apr 2024 23:14:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 712319.1112935; Thu, 25 Apr 2024 23:14:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s08I6-0006D3-Bg; Thu, 25 Apr 2024 23:14:10 +0000
Received: by outflank-mailman (input) for mailman id 712319;
 Thu, 25 Apr 2024 23:14:09 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=N29f=L6=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s08I5-0006Cv-LO
 for xen-devel@lists.xenproject.org; Thu, 25 Apr 2024 23:14:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 82d928b5-0359-11ef-909a-e314d9c70b13;
 Fri, 26 Apr 2024 01:14:07 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 0A4DBCE1B3C;
 Thu, 25 Apr 2024 23:14:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C020CC113CC;
 Thu, 25 Apr 2024 23:14:00 +0000 (UTC)
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
X-Inumbo-ID: 82d928b5-0359-11ef-909a-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714086842;
	bh=XauHxKmJlWNxKokHnGQ59tJ320O+DAmmbivWUa96nc0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=S/RX8YNvVuQEt1gFg43/k1sNXXd9/FKq60BhRt9gGA4BGfYul0L1xd3TvLEDbQXL3
	 DGvRTM3ADiZTVI4AXK59PQwBF9pbjENxWcXhH2qywFw9BO+cxKOZ+HlSX/Iqv88o1T
	 ccwnPEqyH5guBFPBNNqlz5GWDRtRSi5XP93v5Hx+TN+Ef7W/vlJL/1wKxmbKKZHS4l
	 zN7ltOch/5CUvkltuyjmVq0+bzaV+fYnX5AQ3XTcRNbcH6aGq3VEfQTnP2r19ionm8
	 0xr/TkJJJrQn4xMI96smmPGE2bEKwbF3adKoA83R5eM602ya6EWuatu5tCOBcsMwZH
	 kZp6JKhco92aw==
Date: Thu, 25 Apr 2024 16:13:59 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v2 1/1] xen/arm64: entry: Add missing code symbol
 annotations
In-Reply-To: <20240415231541.4140052-2-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2404251608320.3940@ubuntu-linux-20-04-desktop>
References: <20240415231541.4140052-1-edgar.iglesias@gmail.com> <20240415231541.4140052-2-edgar.iglesias@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Apr 2024, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>
> 
> Use the generic xen/linkage.h macros when and add missing
                                        ^ when what?

> code symbol annotations.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>

I am looking at the implementation of FUNC and as far as I can tell
there is no change compared to ENTRY. So from that point of view we are
good. I wonder if we should keep using "ENTRY" because it is nice to
mark explicitely the entry points as such but at the same time I am also
OK with this. I'll let the other ARM maintainers decide.

On the other hand, FUNC_LOCAL does introduce a change: it adds a .align
everywhere. Should not be harmful?

With the commit message fixed:

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/entry.S | 72 +++++++++++++++++++++++++-------------
>  1 file changed, 48 insertions(+), 24 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/entry.S b/xen/arch/arm/arm64/entry.S
> index f963c923bb..af9a592cae 100644
> --- a/xen/arch/arm/arm64/entry.S
> +++ b/xen/arch/arm/arm64/entry.S
> @@ -289,21 +289,25 @@
>          b       do_bad_mode
>          .endm
>  
> -hyp_sync_invalid:
> +FUNC_LOCAL(hyp_sync_invalid)
>          entry   hyp=1
>          invalid BAD_SYNC
> +END(hyp_sync_invalid)
>  
> -hyp_irq_invalid:
> +FUNC_LOCAL(hyp_irq_invalid)
>          entry   hyp=1
>          invalid BAD_IRQ
> +END(hyp_irq_invalid)
>  
> -hyp_fiq_invalid:
> +FUNC_LOCAL(hyp_fiq_invalid)
>          entry   hyp=1
>          invalid BAD_FIQ
> +END(hyp_fiq_invalid)
>  
> -hyp_error_invalid:
> +FUNC_LOCAL(hyp_error_invalid)
>          entry   hyp=1
>          invalid BAD_ERROR
> +END(hyp_error_invalid)
>  
>  /*
>   * SError received while running in the hypervisor mode.
> @@ -313,11 +317,12 @@ hyp_error_invalid:
>   * simplicity, as SError should be rare and potentially fatal,
>   * all interrupts are kept masked.
>   */
> -hyp_error:
> +FUNC_LOCAL(hyp_error)
>          entry   hyp=1
>          mov     x0, sp
>          bl      do_trap_hyp_serror
>          exit    hyp=1
> +END(hyp_error)
>  
>  /*
>   * Synchronous exception received while running in the hypervisor mode.
> @@ -327,7 +332,7 @@ hyp_error:
>   * some of them. So we want to inherit the state from the interrupted
>   * context.
>   */
> -hyp_sync:
> +FUNC_LOCAL(hyp_sync)
>          entry   hyp=1
>  
>          /* Inherit interrupts */
> @@ -338,6 +343,7 @@ hyp_sync:
>          mov     x0, sp
>          bl      do_trap_hyp_sync
>          exit    hyp=1
> +END(hyp_sync)
>  
>  /*
>   * IRQ received while running in the hypervisor mode.
> @@ -352,7 +358,7 @@ hyp_sync:
>   * would require some rework in some paths (e.g. panic, livepatch) to
>   * ensure the ordering is enforced everywhere.
>   */
> -hyp_irq:
> +FUNC_LOCAL(hyp_irq)
>          entry   hyp=1
>  
>          /* Inherit D, A, F interrupts and keep I masked */
> @@ -365,8 +371,9 @@ hyp_irq:
>          mov     x0, sp
>          bl      do_trap_irq
>          exit    hyp=1
> +END(hyp_irq)
>  
> -guest_sync:
> +FUNC_LOCAL(guest_sync)
>          /*
>           * Save x0, x1 in advance
>           */
> @@ -413,8 +420,9 @@ fastpath_out_workaround:
>          mov     x1, xzr
>          eret
>          sb
> +END(guest_sync)
>  
> -wa2_ssbd:
> +FUNC_LOCAL(wa2_ssbd)
>  #ifdef CONFIG_ARM_SSBD
>  alternative_cb arm_enable_wa2_handling
>          b       wa2_end
> @@ -450,42 +458,55 @@ wa2_end:
>          mov     x0, xzr
>          eret
>          sb
> -guest_sync_slowpath:
> +END(wa2_ssbd)
> +
> +FUNC_LOCAL(guest_sync_slowpath)
>          /*
>           * x0/x1 may have been scratch by the fast path above, so avoid
>           * to save them.
>           */
>          guest_vector compat=0, iflags=IFLAGS__AI_, trap=guest_sync, save_x0_x1=0
> +END(guest_sync_slowpath)
>  
> -guest_irq:
> +FUNC_LOCAL(guest_irq)
>          guest_vector compat=0, iflags=IFLAGS__A__, trap=irq
> +END(guest_irq)
>  
> -guest_fiq_invalid:
> +FUNC_LOCAL(guest_fiq_invalid)
>          entry   hyp=0, compat=0
>          invalid BAD_FIQ
> +END(guest_fiq_invalid)
>  
> -guest_error:
> +FUNC_LOCAL(guest_error)
>          guest_vector compat=0, iflags=IFLAGS__AI_, trap=guest_serror
> +END(guest_error)
>  
> -guest_sync_compat:
> +FUNC_LOCAL(guest_sync_compat)
>          guest_vector compat=1, iflags=IFLAGS__AI_, trap=guest_sync
> +END(guest_sync_compat)
>  
> -guest_irq_compat:
> +FUNC_LOCAL(guest_irq_compat)
>          guest_vector compat=1, iflags=IFLAGS__A__, trap=irq
> +END(guest_irq_compat)
>  
> -guest_fiq_invalid_compat:
> +FUNC_LOCAL(guest_fiq_invalid_compat)
>          entry   hyp=0, compat=1
>          invalid BAD_FIQ
> +END(guest_fiq_invalid_compat)
>  
> -guest_error_compat:
> +FUNC_LOCAL(guest_error_compat)
>          guest_vector compat=1, iflags=IFLAGS__AI_, trap=guest_serror
> +END(guest_error_compat)
>  
> -ENTRY(return_to_new_vcpu32)
> +FUNC(return_to_new_vcpu32)
>          exit    hyp=0, compat=1
> -ENTRY(return_to_new_vcpu64)
> +END(return_to_new_vcpu32)
> +
> +FUNC(return_to_new_vcpu64)
>          exit    hyp=0, compat=0
> +END(return_to_new_vcpu64)
>  
> -return_from_trap:
> +FUNC_LOCAL(return_from_trap)
>          msr     daifset, #IFLAGS___I_ /* Mask interrupts */
>  
>          ldr     x21, [sp, #UREGS_PC]            /* load ELR */
> @@ -524,6 +545,7 @@ return_from_trap:
>  
>          eret
>          sb
> +END(return_from_trap)
>  
>  /*
>   * Consume pending SError generated by the guest if any.
> @@ -536,7 +558,7 @@ return_from_trap:
>   * it. So the function will unmask SError exception for a small window and
>   * then mask it again.
>   */
> -check_pending_guest_serror:
> +FUNC_LOCAL(check_pending_guest_serror)
>          /*
>           * Save elr_el2 to check whether the pending SError exception takes
>           * place while we are doing this sync exception.
> @@ -586,7 +608,7 @@ abort_guest_exit_end:
>          cset    x19, ne
>  
>          ret
> -ENDPROC(check_pending_guest_serror)
> +END(check_pending_guest_serror)
>  
>  /*
>   * Exception vectors.
> @@ -597,7 +619,7 @@ ENDPROC(check_pending_guest_serror)
>          .endm
>  
>          .align  11
> -ENTRY(hyp_traps_vector)
> +FUNC(hyp_traps_vector)
>          ventry  hyp_sync_invalid            /* Synchronous EL2t */
>          ventry  hyp_irq_invalid             /* IRQ EL2t */
>          ventry  hyp_fiq_invalid             /* FIQ EL2t */
> @@ -617,6 +639,7 @@ ENTRY(hyp_traps_vector)
>          ventry  guest_irq_compat            /* IRQ 32-bit EL0/EL1 */
>          ventry  guest_fiq_invalid_compat    /* FIQ 32-bit EL0/EL1 */
>          ventry  guest_error_compat          /* Error 32-bit EL0/EL1 */
> +END(hyp_traps_vector)
>  
>  /*
>   * struct vcpu *__context_switch(struct vcpu *prev, struct vcpu *next)
> @@ -626,7 +649,7 @@ ENTRY(hyp_traps_vector)
>   *
>   * Returns prev in x0
>   */
> -ENTRY(__context_switch)
> +FUNC(__context_switch)
>          add     x8, x0, #VCPU_arch_saved_context
>          mov     x9, sp
>          stp     x19, x20, [x8], #16         /* store callee-saved registers */
> @@ -647,6 +670,7 @@ ENTRY(__context_switch)
>          ldr     lr, [x8]
>          mov     sp, x9
>          ret
> +END(__context_switch)
>  
>  /*
>   * Local variables:
> -- 
> 2.40.1
> 

