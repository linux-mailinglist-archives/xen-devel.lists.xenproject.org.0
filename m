Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DEF760322
	for <lists+xen-devel@lfdr.de>; Tue, 25 Jul 2023 01:28:57 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.569269.889693 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4ys-0001oA-4s; Mon, 24 Jul 2023 23:28:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 569269.889693; Mon, 24 Jul 2023 23:28:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qO4ys-0001lX-17; Mon, 24 Jul 2023 23:28:46 +0000
Received: by outflank-mailman (input) for mailman id 569269;
 Mon, 24 Jul 2023 23:28:44 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=AJiQ=DK=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qO4yq-0001lP-Ga
 for xen-devel@lists.xenproject.org; Mon, 24 Jul 2023 23:28:44 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d18323f2-2a79-11ee-8612-37d641c3527e;
 Tue, 25 Jul 2023 01:28:39 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E0B7E61463;
 Mon, 24 Jul 2023 23:28:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B1CC433C7;
 Mon, 24 Jul 2023 23:28:38 +0000 (UTC)
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
X-Inumbo-ID: d18323f2-2a79-11ee-8612-37d641c3527e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690241320;
	bh=pJjCkS+RQ4jPSTKfXNZzI4LTvCdmA6xACWtWfciPIYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=YdvpVA/Iazd72NkvgXRFk5VnAp3RVdhaBwG81Y0Ov2VI73I8U3LM5WXyUNK817TNJ
	 wkqUUpx5samrTMSx/mu5ADg8y3bDiGeAOow1na/bkOtFksP/yXMESdb8/HJXWMtndW
	 ABB5XkhcYocTuDLMG2oY/7UpkmrZMFdnTE/pgT1Z5cwPZIcof2UhHD3HP6icV5UACY
	 Ig6oU7Z1lN7Wicqq9qlyw/6sLXLUV3k8S9FJHu2yaLe+Y9IQBR4MmrnIyPRaU4TrRM
	 d36cT99Rd4S5OJtSUsk6qZxU2PMEkCuYz5PrINtxnNFh1qDpvGuqaJK6c3RVkLaXRx
	 b1kWbQsAfeeow==
Date: Mon, 24 Jul 2023 16:28:37 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Leo Yan <leo.yan@linaro.org>
cc: xen-devel@lists.xenproject.org, Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Julien Grall <julien@xen.org>, 
    Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wl@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] docs: Correct name for xen-command-line.pandoc
In-Reply-To: <20230724085211.1383703-1-leo.yan@linaro.org>
Message-ID: <alpine.DEB.2.22.394.2307241628300.3118466@ubuntu-linux-20-04-desktop>
References: <20230724085211.1383703-1-leo.yan@linaro.org>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 24 Jul 2023, Leo Yan wrote:
> In the commit d661611d08 ("docs/markdown: Switch to using pandoc, and
> fix underscore escaping"), the documentation suffix was changed from
> ".markdown" to ".pandoc"; however, the reference was missed to update.
> 
> This patch updates the documentation name to xen-command-line.pandoc.
> 
> Fixes: d661611d08 ("docs/markdown: Switch to using pandoc, and fix underscore escaping")
> Signed-off-by: Leo Yan <leo.yan@linaro.org>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  docs/features/sched_credit2.pandoc | 2 +-
>  docs/misc/arm/big.LITTLE.txt       | 2 +-
>  xen/common/Kconfig                 | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/docs/features/sched_credit2.pandoc b/docs/features/sched_credit2.pandoc
> index 436ff9f8f6..ef07e463cb 100644
> --- a/docs/features/sched_credit2.pandoc
> +++ b/docs/features/sched_credit2.pandoc
> @@ -27,7 +27,7 @@ different than `credit2`) parameter is passed to Xen via the
>  bootloader.
>  
>  Other parameters are available for tuning the behavior of Credit2
> -(see `docs/misc/xen-command-line.markdown` for a complete list and
> +(see `docs/misc/xen-command-line.pandoc` for a complete list and
>  for their meaning).
>  
>  Once the system is live, for creating a cpupool with Credit2 as
> diff --git a/docs/misc/arm/big.LITTLE.txt b/docs/misc/arm/big.LITTLE.txt
> index b6ea1c9d61..1d11058444 100644
> --- a/docs/misc/arm/big.LITTLE.txt
> +++ b/docs/misc/arm/big.LITTLE.txt
> @@ -42,5 +42,5 @@ The following option runs one domain vcpu as big and one as LITTLE:
>    cpus = ["0-3", "4-7"]
>  
>  
> -[1] docs/misc/xen-command-line.markdown
> +[1] docs/misc/xen-command-line.pandoc
>  [2] docs/man/xl.cfg.pod.5
> diff --git a/xen/common/Kconfig b/xen/common/Kconfig
> index dd8d7c3f1c..0d248ab941 100644
> --- a/xen/common/Kconfig
> +++ b/xen/common/Kconfig
> @@ -440,7 +440,7 @@ config DOM0_MEM
>  	  The specified string will be used for the dom0_mem parameter in
>  	  case it was not specified on the command line.
>  
> -	  See docs/misc/xen-command-line.markdown for the supported syntax.
> +	  See docs/misc/xen-command-line.pandoc for the supported syntax.
>  
>  	  Leave empty if you are not sure what to specify.
>  
> -- 
> 2.39.2
> 

