Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9413690FAD3
	for <lists+xen-devel@lfdr.de>; Thu, 20 Jun 2024 03:20:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.744080.1151093 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6Sx-000494-U9; Thu, 20 Jun 2024 01:19:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 744080.1151093; Thu, 20 Jun 2024 01:19:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1sK6Sx-00047Z-RV; Thu, 20 Jun 2024 01:19:55 +0000
Received: by outflank-mailman (input) for mailman id 744080;
 Thu, 20 Jun 2024 01:19:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=QH02=NW=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1sK6Sw-00047T-Eh
 for xen-devel@lists.xenproject.org; Thu, 20 Jun 2024 01:19:54 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 2ff5f6a4-2ea3-11ef-b4bb-af5377834399;
 Thu, 20 Jun 2024 03:19:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 57355CE22D5;
 Thu, 20 Jun 2024 01:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A117C2BBFC;
 Thu, 20 Jun 2024 01:19:46 +0000 (UTC)
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
X-Inumbo-ID: 2ff5f6a4-2ea3-11ef-b4bb-af5377834399
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718846387;
	bh=EzZvJ9mPSUbsnyIM6nx3X6riwBwPu5AH2cnwOyP5G0c=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=THQ8gN0LXsxETcobc63ILcC7moNNSvYLCTqV6rtAqRLlIIxPU3g2Ps8nBWfG6OfCV
	 EU7pEqnkxZQ3ixa+x2Z09AIS8u8qO/pPWzZLuPbRS7rMarwBBKkKbxM0O/glSUAPxF
	 gUI4bq15IiIIKGXAls0W2vmqXrnb3bgobJ27VvsDJs6m1xuIXbG7I2mxbpu0luRmES
	 yrBLuPdHkkL8EQskg7j62m6RDOXPYcJ7itiH/MfNx/AFmMsjNXR0w22EPbfv/jmNGi
	 IEH3/4I/bmOVqa9xqduj8DsRiYsjT9/OLoFBLRL8UaPwxS83sous3jA3yiBJ/o/X2s
	 Sw/oLDUycvS1A==
Date: Wed, 19 Jun 2024 18:19:45 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Simone Ballarin <simone.ballarin@bugseng.com>, 
    Doug Goldstein <cardoe@cardoe.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>
Subject: Re: [XEN PATCH v3] automation/eclair: add deviation for MISRA C Rule
 17.7
In-Reply-To: <b571bd05955ab9967a44517c9947545a2a530f01.1718354974.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2406191819370.2572888@ubuntu-linux-20-04-desktop>
References: <b571bd05955ab9967a44517c9947545a2a530f01.1718354974.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 14 Jun 2024, Federico Serafini wrote:
> Update ECLAIR configuration to deviate some cases where not using
> the return value of a function is not dangerous.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes in v3:
> - removed unwanted underscores;
> - grammar fixed;
> - do not constraint to the first actual argument.
> Changes in v2:
> - do not deviate strlcpy and strlcat.
> ---
>  automation/eclair_analysis/ECLAIR/deviations.ecl | 4 ++++
>  docs/misra/deviations.rst                        | 9 +++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/automation/eclair_analysis/ECLAIR/deviations.ecl b/automation/eclair_analysis/ECLAIR/deviations.ecl
> index 447c1e6661..97281082a8 100644
> --- a/automation/eclair_analysis/ECLAIR/deviations.ecl
> +++ b/automation/eclair_analysis/ECLAIR/deviations.ecl
> @@ -413,6 +413,10 @@ explicit comment indicating the fallthrough intention is present."
>  -config=MC3R1.R17.1,macros+={hide , "^va_(arg|start|copy|end)$"}
>  -doc_end
>  
> +-doc_begin="Not using the return value of a function does not endanger safety if it coincides with an actual argument."
> +-config=MC3R1.R17.7,calls+={safe, "any()", "decl(name(__builtin_memcpy||__builtin_memmove||__builtin_memset||cpumask_check))"}
> +-doc_end
> +
>  #
>  # Series 18.
>  #
> diff --git a/docs/misra/deviations.rst b/docs/misra/deviations.rst
> index 36959aa44a..f3abe31eb5 100644
> --- a/docs/misra/deviations.rst
> +++ b/docs/misra/deviations.rst
> @@ -364,6 +364,15 @@ Deviations related to MISRA C:2012 Rules:
>         by `stdarg.h`.
>       - Tagged as `deliberate` for ECLAIR.
>  
> +   * - R17.7
> +     - Not using the return value of a function does not endanger safety if it
> +       coincides with an actual argument.
> +     - Tagged as `safe` for ECLAIR. Such functions are:
> +         - __builtin_memcpy()
> +         - __builtin_memmove()
> +         - __builtin_memset()
> +         - cpumask_check()
> +
>     * - R20.4
>       - The override of the keyword \"inline\" in xen/compiler.h is present so
>         that section contents checks pass when the compiler chooses not to
> -- 
> 2.34.1
> 

