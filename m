Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB458BB845
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 01:30:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716709.1118901 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s32MH-0002zS-RL; Fri, 03 May 2024 23:30:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716709.1118901; Fri, 03 May 2024 23:30:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s32MH-0002xO-Nr; Fri, 03 May 2024 23:30:29 +0000
Received: by outflank-mailman (input) for mailman id 716709;
 Fri, 03 May 2024 23:30:29 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s32MG-0002gS-Uy
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 23:30:28 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 1edf8d9d-09a5-11ef-b4bb-af5377834399;
 Sat, 04 May 2024 01:30:27 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9AA2E61DA8;
 Fri,  3 May 2024 23:30:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60E79C116B1;
 Fri,  3 May 2024 23:30:23 +0000 (UTC)
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
X-Inumbo-ID: 1edf8d9d-09a5-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714779025;
	bh=NcJXG97k3QRabzf6wKMUDp4/I8OXrPcxTtEtDPyCHDI=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=bPqUxNT8/2OrA3N6EtKkwZEXqfhNElyg4YlEGfMNnv72uHlbf+A2fXDPSyUcLuHhj
	 YARSSOoffL7NzszgXDcMnwDnR2NcvcPlqndnenpVvwmvdF4esxxsMAU3Jy0T64hEtV
	 6Jf8qSnH1SlV99LknZlssYlQKaws7rU5PGvuAByqeXhOxfyvSk8ut7M7x0Klg1cglS
	 yLQ7dR4DhHdwnYx4Mb23ieQg+uTm5LFzftga7lylR3SgCbgMLYpkbDd3Oq0EjC7FHQ
	 d55sxCmV/8rZTMzl2kZDjMeii+OL4W6X8dhNlRh042WdiU4dKntyiWG6UXA0zx3313
	 UD3hIuIHWO0vg==
Date: Fri, 3 May 2024 16:30:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 3/9] xen/arm64: sve: Add missing code symbol
 annotations
In-Reply-To: <20240501035448.964625-4-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405031630120.1151289@ubuntu-linux-20-04-desktop>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com> <20240501035448.964625-4-edgar.iglesias@gmail.com>
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
>  xen/arch/arm/arm64/sve-asm.S | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/sve-asm.S b/xen/arch/arm/arm64/sve-asm.S
> index 59dbefbbb2..2d8b895f07 100644
> --- a/xen/arch/arm/arm64/sve-asm.S
> +++ b/xen/arch/arm/arm64/sve-asm.S
> @@ -161,9 +161,10 @@
>  .endm
>  
>  /* Gets the current vector register size in bytes */
> -GLOBAL(sve_get_hw_vl)
> +FUNC(sve_get_hw_vl)
>      _sve_rdvl 0, 1
>      ret
> +END(sve_get_hw_vl)
>  
>  /*
>   * Save the SVE context
> @@ -172,9 +173,10 @@ GLOBAL(sve_get_hw_vl)
>   * x1 - pointer to buffer for P0-15
>   * x2 - Save FFR if non-zero
>   */
> -GLOBAL(sve_save_ctx)
> +FUNC(sve_save_ctx)
>      sve_save 0, 1, x2
>      ret
> +END(sve_save_ctx)
>  
>  /*
>   * Load the SVE context
> @@ -183,9 +185,10 @@ GLOBAL(sve_save_ctx)
>   * x1 - pointer to buffer for P0-15
>   * x2 - Restore FFR if non-zero
>   */
> -GLOBAL(sve_load_ctx)
> +FUNC(sve_load_ctx)
>      sve_load 0, 1, x2
>      ret
> +END(sve_load_ctx)
>  
>  /*
>   * Local variables:
> -- 
> 2.40.1
> 

