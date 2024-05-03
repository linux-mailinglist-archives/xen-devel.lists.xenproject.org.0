Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 164908BB844
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 01:30:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716708.1118892 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s32M8-0002jA-KO; Fri, 03 May 2024 23:30:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716708.1118892; Fri, 03 May 2024 23:30:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s32M8-0002gr-Hb; Fri, 03 May 2024 23:30:20 +0000
Received: by outflank-mailman (input) for mailman id 716708;
 Fri, 03 May 2024 23:30:18 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s32M6-0002gS-8R
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 23:30:18 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1733652c-09a5-11ef-b4bb-af5377834399;
 Sat, 04 May 2024 01:30:15 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4492ACE19F4;
 Fri,  3 May 2024 23:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 186DFC116B1;
 Fri,  3 May 2024 23:30:06 +0000 (UTC)
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
X-Inumbo-ID: 1733652c-09a5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714779008;
	bh=hpr3Bz1TvKG5VL7nQWHdkpSRBjm1bkfiDw1Na63ZTtg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lhbaFcZhzHXu7ZQh6dyIlcTKloI6sLeKeL74JlHbzz9Me2HhjIE88IiG+P3OSXiHi
	 iqCSZde/56rxckcWwMMXWVP/7+If1qke1tdkitzUCtAUYM78xglyofb4MaIvpGqlx9
	 jRCmnWjLv+grjx7TjmbxYkpohgBKjlJwhtez8bcV4KqinbwVOD5tnV3rvbecJUoTwk
	 fcETO8gSH6Ae3xxZ0mDaq8pmcnMdYCGsy/huN36Inoo2rJMtJPwZlFYtzvjH8YQ7Og
	 7UOCUk4fMqTx44IHfWu48kVbzCsMtArBXVblR1N95TzCECjd9tylwHj+eY4+eehHpn
	 ShXF6B9/TB78Q==
Date: Fri, 3 May 2024 16:30:05 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 2/9] xen/arm64: smc: Add missing code symbol
 annotations
In-Reply-To: <20240501035448.964625-3-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405031629450.1151289@ubuntu-linux-20-04-desktop>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com> <20240501035448.964625-3-edgar.iglesias@gmail.com>
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

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/arch/arm/arm64/smc.S | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/smc.S b/xen/arch/arm/arm64/smc.S
> index fc6b676e2e..68b05e8ddd 100644
> --- a/xen/arch/arm/arm64/smc.S
> +++ b/xen/arch/arm/arm64/smc.S
> @@ -19,7 +19,7 @@
>   *                          register_t a6, register_t a7,
>   *                          struct arm_smccc_res *res)
>   */
> -ENTRY(__arm_smccc_1_0_smc)
> +FUNC(__arm_smccc_1_0_smc)
>          smc     #0
>          ldr     x4, [sp]
>          cbz     x4, 1f          /* No need to store the result */
> @@ -27,12 +27,13 @@ ENTRY(__arm_smccc_1_0_smc)
>          stp     x2, x3, [x4, #SMCCC_RES_a2]
>  1:
>          ret
> +END(__arm_smccc_1_0_smc)
>  
>  /*
>   * void arm_smccc_1_2_smc(const struct arm_smccc_1_2_regs *args,
>   *                        struct arm_smccc_1_2_regs *res)
>   */
> -ENTRY(arm_smccc_1_2_smc)
> +FUNC(arm_smccc_1_2_smc)
>      /* Save `res` and free a GPR that won't be clobbered by SMC call */
>      stp     x1, x19, [sp, #-16]!
>  
> @@ -69,3 +70,4 @@ ENTRY(arm_smccc_1_2_smc)
>      /* Restore original x19 */
>      ldp     xzr, x19, [sp], #16
>      ret
> +END(arm_smccc_1_2_smc)
> -- 
> 2.40.1
> 

