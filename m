Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B67587C3DC
	for <lists+xen-devel@lfdr.de>; Thu, 14 Mar 2024 20:54:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.693480.1081593 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkr8r-0003fL-SB; Thu, 14 Mar 2024 19:53:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 693480.1081593; Thu, 14 Mar 2024 19:53:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rkr8r-0003dr-Ne; Thu, 14 Mar 2024 19:53:29 +0000
Received: by outflank-mailman (input) for mailman id 693480;
 Thu, 14 Mar 2024 19:53:28 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=69K2=KU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1rkr8q-0003dl-OV
 for xen-devel@lists.xenproject.org; Thu, 14 Mar 2024 19:53:28 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8487aaca-e23c-11ee-a1ee-f123f15fe8a2;
 Thu, 14 Mar 2024 20:53:26 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F1D9CE1E5D;
 Thu, 14 Mar 2024 19:53:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C16FC433F1;
 Thu, 14 Mar 2024 19:53:21 +0000 (UTC)
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
X-Inumbo-ID: 8487aaca-e23c-11ee-a1ee-f123f15fe8a2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710446002;
	bh=G3dubiycm6kBLZkZ4BwKaUn1NRVJSeofPZbgIHNH/kY=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=N8xXKJyAisgtUo2JMgxX/IEdDK/8J6ZTT0MquDS5NyuIxZMLj/qyGzvREX5Oy4VPO
	 6fe3FFH8E0+386P9oBHYyOug9UHTHkfO3suLt0eUVwfTQDNG6U1g+CJmdeJKfIAJew
	 t0CN+70Ao23FqmaxKtl1IYTsx0BlZdSMJFeBblqJFd6RMVEyxgUN6uAGh5AtDdfccq
	 LoDlaynHNGkwVYmTp/xmGXYnReICkOOuFMGNGxQuJXim0lq0P7C+U7uQ1jzB0zMrSa
	 0QGgyXirvLBX4pI6N69uK/xUYaLmLTjl1GoTDrNpl5Zm08YdGtNWNfttft00DluBxG
	 ///hMW/okPiPw==
Date: Thu, 14 Mar 2024 12:53:19 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] automation/eclair: allow parameter name "unused"
In-Reply-To: <f2666bff183d5497b4993fdc27f6a66141ec8d85.1710433895.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2403141253130.853156@ubuntu-linux-20-04-desktop>
References: <f2666bff183d5497b4993fdc27f6a66141ec8d85.1710433895.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 14 Mar 2024, Federico Serafini wrote:
> Update ECLAIR configuration of MISRA C:2012 Rule 8.3 to deviate
> violations involving parameter name "unused":
> it makes explicit the intention of not using the parameter within
> the function.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/deviations.rst                        | 5 +++++
>  2 files changed, 9 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 9ac3ee4dfd..7e913050d2 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -167,6 +167,10 @@ const-qualified."
>  -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_decompress_r8_3)))&&any_area(any_loc(file(^xen/include/xen/decompress\\.h$)))"}
>  -doc_end
>  
> +-doc_begin="Parameter name \"unused\" is deliberate and makes explicit the intention of not using the parameter within the function."
> +-config=MC3R1.R8.3,reports+={deliberate, "any_area(^.*parameter `unused'.*$)"}
> +-doc_end
> +
>  -doc_begin="The following file is imported from Linux: ignore for now."
>  -file_tag+={adopted_time_r8_3,"^xen/arch/x86/time\\.c$"}
>  -config=MC3R1.R8.3,reports+={deliberate,"any_area(any_loc(file(adopted_time_r8_3)))&&(any_area(any_loc(file(^xen/include/xen/time\\.h$)))||any_area(any_loc(file(^xen/arch/x86/include/asm/setup\\.h$))))"}
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index ce855ddae6..941da4c40b 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -157,6 +157,11 @@ Deviations related to MISRA C:2012 Rules:
>           - xen/common/unxz.c
>           - xen/common/unzstd.c
>  
> +   * - R8.3
> +     - Parameter name "unused" is deliberate and makes explicit the intention
> +       of not using the parameter within the function.
> +     - Tagged as `deliberate` for ECLAIR.
> +
>     * - R8.4
>       - The definitions present in the files 'asm-offsets.c' for any architecture
>         are used to generate definitions for asm modules, and are not called by
> -- 
> 2.34.1
> 

