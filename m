Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 287958C6F28
	for <lists+xen-devel@lfdr.de>; Thu, 16 May 2024 01:26:59 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.722681.1126887 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7O1K-0004Mu-0y; Wed, 15 May 2024 23:26:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 722681.1126887; Wed, 15 May 2024 23:26:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s7O1J-0004LJ-UI; Wed, 15 May 2024 23:26:49 +0000
Received: by outflank-mailman (input) for mailman id 722681;
 Wed, 15 May 2024 23:26:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=kF2M=MS=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s7O1I-0004L9-PV
 for xen-devel@lists.xenproject.org; Wed, 15 May 2024 23:26:48 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 984a72b2-1312-11ef-b4bb-af5377834399;
 Thu, 16 May 2024 01:26:46 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 2C0FF615F9;
 Wed, 15 May 2024 23:26:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97CC3C116B1;
 Wed, 15 May 2024 23:26:43 +0000 (UTC)
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
X-Inumbo-ID: 984a72b2-1312-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715815604;
	bh=LzNTcPEq45Y5y113TkBRtB7OYJJfblhfpm5W8bOZ0Gg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ftKBI6wmFh7MyRmXyCDk/Y3FORTCFVwJIFvp5c/wbDFh+VJnh/a499XbvbHkjiZUm
	 B7wfwmpQQlkbH0614Cpjv+X7BwVieNIq53Lq/4NBcVLKFwVAw3lPnEZuNeQp8oollQ
	 AiyZmwjOgRm72oGx+zBBZiZHIWM0hLOO86yDdPoLIrkyjSFLtrdEwrnsZmsRlYCYPO
	 evUj5gnhgppL9ie4nZvpD3MUIJokq44Cy++M+5o3sso9jduh7FHSraUtpCGZ/ISOW0
	 s0QYkkKdAbFKksa9Hsg3BKwRX1cDHzz2SeIAIbr2BVtwyrVXsRUfHcHyzyteg/B3jh
	 wLIArug6bpB+g==
Date: Wed, 15 May 2024 16:26:42 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v4 6/9] xen/arm64: bpi: Add missing code symbol
 annotations
In-Reply-To: <20240504115514.1063509-7-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405151625140.2544314@ubuntu-linux-20-04-desktop>
References: <20240504115514.1063509-1-edgar.iglesias@gmail.com> <20240504115514.1063509-7-edgar.iglesias@gmail.com>
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
>  xen/arch/arm/arm64/bpi.S | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/bpi.S b/xen/arch/arm/arm64/bpi.S
> index 4e63825220..d6b8defb80 100644
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
> +LABEL(__bp_harden_hyp_vecs_end)
> +END(__bp_harden_hyp_vecs_start)
>  
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
> +LABEL(__mitigate_spectre_bhb_loop_end_\count)
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
> +LABEL(__smccc_workaround_smc_end_\num)
> +END(__smccc_workaround_smc_start_\num)
>  .endm
>  
> -ENTRY(__mitigate_spectre_bhb_clear_insn_start)
> +FUNC(__mitigate_spectre_bhb_clear_insn_start)
>      clearbhb
>      isb
> -ENTRY(__mitigate_spectre_bhb_clear_insn_end)
> +LABEL(__mitigate_spectre_bhb_clear_insn_end)
> +END(__mitigate_spectre_bhb_clear_insn_start)
>  
>  mitigate_spectre_bhb_loop 8
>  mitigate_spectre_bhb_loop 24
> -- 
> 2.40.1
> 

