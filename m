Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E1595776A59
	for <lists+xen-devel@lfdr.de>; Wed,  9 Aug 2023 22:38:33 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.581338.909993 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpwi-0007QK-St; Wed, 09 Aug 2023 20:38:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 581338.909993; Wed, 09 Aug 2023 20:38:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qTpwi-0007Np-Po; Wed, 09 Aug 2023 20:38:20 +0000
Received: by outflank-mailman (input) for mailman id 581338;
 Wed, 09 Aug 2023 20:38:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JRC9=D2=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qTpwh-0007Nj-Do
 for xen-devel@lists.xenproject.org; Wed, 09 Aug 2023 20:38:19 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id aaf98a46-36f4-11ee-8613-37d641c3527e;
 Wed, 09 Aug 2023 22:38:17 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1448D64882;
 Wed,  9 Aug 2023 20:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8DDDC433C8;
 Wed,  9 Aug 2023 20:38:14 +0000 (UTC)
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
X-Inumbo-ID: aaf98a46-36f4-11ee-8613-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691613495;
	bh=lbkZflBp5itVPUsoazTbfLX47M0+8ic4rZjA+np+dKM=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=mHodPuq8Er/sBgHvQTuaHzFQ+13imLk4e1L34YKKkRyeuLCoY0Kc1qHypPI27Vrzg
	 jzL/oxWqFOYWNurydkWD5vdmdaLGz1uJKyoDiykTAcSbhCiJOV4v3av9kxVy+AQraI
	 LrymAVerXFHKM/HdbEX9JW0JQX4H/cuH62Qwhc2lfXfGe9UwL633uAmEuG6N0FOmje
	 C5YvENi4Lzx8/66cELXJFyjXuUqMQPdWtq1dELvy3uRkd7D7BeCuftM9JJwrbeI6Pu
	 Dv/T7lQ8Vc5sJDoQp6IyzzKRu2tyvuWBrdLhmqTaNrPryFq/fzPfZIZz0cVmuX6KD2
	 B2G0zcXUbw9+A==
Date: Wed, 9 Aug 2023 13:38:13 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Simone Ballarin <simone.ballarin@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [XEN PATCH 3/3] automation/eclair: update analyzed builds
In-Reply-To: <a615d13b57eb126df9f8d7acc656bc054e376caf.1691568344.git.simone.ballarin@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308091337120.2127516@ubuntu-linux-20-04-desktop>
References: <cover.1691568344.git.simone.ballarin@bugseng.com> <a615d13b57eb126df9f8d7acc656bc054e376caf.1691568344.git.simone.ballarin@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 9 Aug 2023, Simone Ballarin wrote:
> The xen build for ARM64 now has new configuration options which
> require to be defined: this patch defines them.
> 
> In both configuration files some no longer true comments have been removed.
> 
> Signed-off-by: Simone Ballarin <simone.ballarin@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>

(By the way, there is a way to start a Xen default kconfig from a seed
config so that we don't necessarely need to specify all the options. The
missing options are filled with default values.)


> ---
>  automation/eclair_analysis/xen_arm_config | 14 ++++----------
>  automation/eclair_analysis/xen_x86_config |  9 ---------
>  2 files changed, 4 insertions(+), 19 deletions(-)
> 
> diff --git a/automation/eclair_analysis/xen_arm_config b/automation/eclair_analysis/xen_arm_config
> index 26f5fcca41..ef140ceb73 100644
> --- a/automation/eclair_analysis/xen_arm_config
> +++ b/automation/eclair_analysis/xen_arm_config
> @@ -1,12 +1,3 @@
> -# File provided in
> -# Re: Xen MISRA C: Source files in scope and out of scope
> -# from:	Stefano Stabellini <stefano.stabellini@amd.com>
> -# date:	6 giu 2023, 02:53
> -
> -#
> -# Automatically generated file; DO NOT EDIT.
> -# Xen/arm 4.18-unstable Configuration
> -#
>  CONFIG_CC_IS_GCC=y
>  CONFIG_GCC_VERSION=90400
>  CONFIG_CLANG_VERSION=0
> @@ -34,7 +25,9 @@ CONFIG_HVM=y
>  CONFIG_SBSA_VUART_CONSOLE=y
>  CONFIG_ARM_SSBD=y
>  CONFIG_HARDEN_BRANCH_PREDICTOR=y
> -# CONFIG_TEE is not set
> +CONFIG_TEE=n
> +CONFIG_OPTEE=n
> +CONFIG_FFA=n
>  # CONFIG_STATIC_SHM is not set
>  # end of Architecture Features
>  
> @@ -47,6 +40,7 @@ CONFIG_ARM64_ERRATUM_819472=y
>  CONFIG_ARM64_ERRATUM_843419=y
>  CONFIG_ARM64_ERRATUM_832075=y
>  CONFIG_ARM64_ERRATUM_834220=y
> +CONFIG_ARM64_ERRATUM_1508412=y
>  CONFIG_ARM_ERRATUM_858921=y
>  CONFIG_ARM64_WORKAROUND_REPEAT_TLBI=y
>  CONFIG_ARM64_ERRATUM_1286807=y
> diff --git a/automation/eclair_analysis/xen_x86_config b/automation/eclair_analysis/xen_x86_config
> index d497814e01..abc44d43e1 100644
> --- a/automation/eclair_analysis/xen_x86_config
> +++ b/automation/eclair_analysis/xen_x86_config
> @@ -1,12 +1,3 @@
> -# File provided in
> -# Re: Xen MISRA C: Source files in scope and out of scope
> -# from:	Stefano Stabellini <stefano.stabellini@amd.com> 
> -# date:	6 giu 2023, 02:53
> -
> -#
> -# Automatically generated file; DO NOT EDIT.
> -# Xen/x86 4.18-unstable Configuration
> -#
>  CONFIG_CC_IS_GCC=y
>  CONFIG_GCC_VERSION=90400
>  CONFIG_CLANG_VERSION=0
> -- 
> 2.34.1
> 

