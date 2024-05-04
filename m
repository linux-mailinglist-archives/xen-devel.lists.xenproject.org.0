Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3498BB8A4
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 02:15:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716726.1118932 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s333Q-00031W-EJ; Sat, 04 May 2024 00:15:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716726.1118932; Sat, 04 May 2024 00:15:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s333Q-0002yS-Bb; Sat, 04 May 2024 00:15:04 +0000
Received: by outflank-mailman (input) for mailman id 716726;
 Sat, 04 May 2024 00:15:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=498C=MH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s333O-0002yM-Bg
 for xen-devel@lists.xenproject.org; Sat, 04 May 2024 00:15:02 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 56a8bd51-09ab-11ef-b4bb-af5377834399;
 Sat, 04 May 2024 02:14:59 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id CE3E1CE18D3;
 Sat,  4 May 2024 00:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CCDBC4AF14;
 Sat,  4 May 2024 00:14:53 +0000 (UTC)
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
X-Inumbo-ID: 56a8bd51-09ab-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714781695;
	bh=var572hoqFKe+f0Pqve4/c5c3qNtJLQh9coE/PP5jKU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Pumx1jMAzj8Ec6z7JrZw+thO2ivMdEYTHK3sFamcmFM0Ie5cQUNbXOnOeec//SOdI
	 yCWcaXRAabQNm+D3YnICYybDU18hVjarufI9KifATbtW7k/wpvbZsesEwTFK9PYsSj
	 7clNhCo/lNzC/PPbmNFQD3npB6aHXKczgDu9laDsh7sBdtxhi+LQt+4pfsLlGr20zW
	 dcpBbQVzLcMKkojvPsJaEVWpoy7LILjPg/L7mq8ueJWgN1CrBD/aAdtD0IH6xzFvq/
	 VfLgbVF5koCH+mfliNTzRoLwT8rfJFG0/OJWenWNUMbEJalhxRmu+p3ixZzeWM++T0
	 P+JtvTj/sLp1A==
Date: Fri, 3 May 2024 17:14:53 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 6/9] xen/arm64: bpi: Add missing code symbol
 annotations
In-Reply-To: <20240501035448.964625-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405031656490.1151289@ubuntu-linux-20-04-desktop>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com> <20240501035448.964625-7-edgar.iglesias@gmail.com>
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
>  xen/arch/arm/arm64/bpi.S | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
> index 4e63825220..b16e4d1e29 100644
> --- a/xen/arch/arm/arm64/bpi.S
> +++ b/xen/arch/arm/arm64/bpi.S
> @@ -52,14 +52,15 @@
>   * micro-architectures in a system.
>   */
>      .align	11
> -ENTRY(__bp_harden_hyp_vecs_start)
> +FUNC(__bp_harden_hyp_vecs_start)
>      .rept 4
>      vectors hyp_traps_vector
>      .endr
> -ENTRY(__bp_harden_hyp_vecs_end)
> +GLOBAL(__bp_harden_hyp_vecs_end)
> +END(__bp_harden_hyp_vecs_start)

Shouldn't GLOBAL be changed to FUNC as well?


>  .macro mitigate_spectre_bhb_loop count
> -ENTRY(__mitigate_spectre_bhb_loop_start_\count)
> +FUNC(__mitigate_spectre_bhb_loop_start_\count)
>      stp     x0, x1, [sp, #-16]!
>      mov     x0, \count
>  .Lspectre_bhb_loop\@:
> @@ -68,11 +69,12 @@ ENTRY(__mitigate_spectre_bhb_loop_start_\count)
>      b.ne    .Lspectre_bhb_loop\@
>      sb
>      ldp     x0, x1, [sp], #16
> -ENTRY(__mitigate_spectre_bhb_loop_end_\count)
> +GLOBAL(__mitigate_spectre_bhb_loop_end_\count)

Also here?


> +END(__mitigate_spectre_bhb_loop_start_\count)
>  .endm
>  
>  .macro smccc_workaround num smcc_id
> -ENTRY(__smccc_workaround_smc_start_\num)
> +FUNC(__smccc_workaround_smc_start_\num)
>      sub     sp, sp, #(8 * 4)
>      stp     x0, x1, [sp, #(8 * 2)]
>      stp     x2, x3, [sp, #(8 * 0)]
> @@ -81,13 +83,15 @@ ENTRY(__smccc_workaround_smc_start_\num)
>      ldp     x2, x3, [sp, #(8 * 0)]
>      ldp     x0, x1, [sp, #(8 * 2)]
>      add     sp, sp, #(8 * 4)
> -ENTRY(__smccc_workaround_smc_end_\num)
> +GLOBAL(__smccc_workaround_smc_end_\num)

And here?


> +END(__smccc_workaround_smc_start_\num)
>  .endm
>  
> -ENTRY(__mitigate_spectre_bhb_clear_insn_start)
> +FUNC(__mitigate_spectre_bhb_clear_insn_start)
>      clearbhb
>      isb
> -ENTRY(__mitigate_spectre_bhb_clear_insn_end)
> +GLOBAL(__mitigate_spectre_bhb_clear_insn_end)

and here?


> +END(__mitigate_spectre_bhb_clear_insn_start)
>  
>  mitigate_spectre_bhb_loop 8
>  mitigate_spectre_bhb_loop 24
> -- 
> 2.40.1
> 

