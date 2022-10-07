Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CBF5F7F43
	for <lists+xen-devel@lfdr.de>; Fri,  7 Oct 2022 22:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.418341.663115 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oguIM-0006f1-Ag; Fri, 07 Oct 2022 20:50:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 418341.663115; Fri, 07 Oct 2022 20:50:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oguIM-0006by-7U; Fri, 07 Oct 2022 20:50:10 +0000
Received: by outflank-mailman (input) for mailman id 418341;
 Fri, 07 Oct 2022 20:50:08 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=FwH6=2I=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oguIK-0006bs-Jb
 for xen-devel@lists.xenproject.org; Fri, 07 Oct 2022 20:50:08 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org
 [2604:1380:4601:e00::1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9ffaa9b1-4681-11ed-9377-c1cf23e5d27e;
 Fri, 07 Oct 2022 22:50:07 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 191B8B8245F;
 Fri,  7 Oct 2022 20:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF73CC433D6;
 Fri,  7 Oct 2022 20:50:03 +0000 (UTC)
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
X-Inumbo-ID: 9ffaa9b1-4681-11ed-9377-c1cf23e5d27e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665175804;
	bh=0COepWKyJnS9dnJU4MRagprS9XKGb+mdMm+zs9Dr6HE=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=R/n6C/ZHW3VrvpAReWY3qdvA79riZ/1MusojdeFSgo0zXBaJuWF7/EsFlejjbdhbA
	 HfYNa/R/vjeOfG/cbXSRt/c/QWLPU3V9wvdIj+Wvl9FQq6g5Rm2k99ZyvUKGNKOS50
	 w2TSPMmU0MRzpxFZu/fxXw5XDLhjbB78YGRG8IOt+9TnWwAHBD6KJEItHTx8IENWFn
	 4TlrGPMGu2JRkkeI2o5Xdt0DmziV+Gb4TybLkj5whz0J+5Pniku6VSb3hsWPNtpGeT
	 zf/+7P5+ET0o/PlhsGhQzf9/LrhWMPJyBCcAgWVN6rw25vZiipnF+cWQsRxAWgENp5
	 VpRZ1Y7utai9A==
Date: Fri, 7 Oct 2022 13:50:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Colin Ian King <colin.i.king@gmail.com>
cc: Juergen Gross <jgross@suse.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org, kernel-janitors@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH] xen: Kconfig: Fix spelling mistake "Maxmium" ->
 "Maximum"
In-Reply-To: <20221007203500.2756787-1-colin.i.king@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2210071349510.3690179@ubuntu-linux-20-04-desktop>
References: <20221007203500.2756787-1-colin.i.king@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 7 Oct 2022, Colin Ian King wrote:
> There is a spelling mistake in a Kconfig description. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  drivers/xen/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/xen/Kconfig b/drivers/xen/Kconfig
> index a65bd92121a5..d5d7c402b651 100644
> --- a/drivers/xen/Kconfig
> +++ b/drivers/xen/Kconfig
> @@ -56,7 +56,7 @@ config XEN_MEMORY_HOTPLUG_LIMIT
>  	depends on XEN_HAVE_PVMMU
>  	depends on MEMORY_HOTPLUG
>  	help
> -	  Maxmium amount of memory (in GiB) that a PV guest can be
> +	  Maximum amount of memory (in GiB) that a PV guest can be
>  	  expanded to when using memory hotplug.
>  
>  	  A PV guest can have more memory than this limit if is
> -- 
> 2.37.3
> 

