Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B5698B072
	for <lists+xen-devel@lfdr.de>; Tue,  1 Oct 2024 00:48:44 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.807657.1219239 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svPBs-0006qK-Pk; Mon, 30 Sep 2024 22:48:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 807657.1219239; Mon, 30 Sep 2024 22:48:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1svPBs-0006nf-Mw; Mon, 30 Sep 2024 22:48:28 +0000
Received: by outflank-mailman (input) for mailman id 807657;
 Mon, 30 Sep 2024 22:48:27 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yJxO=Q4=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1svPBr-0006nZ-I6
 for xen-devel@lists.xenproject.org; Mon, 30 Sep 2024 22:48:27 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1a47263f-7f7e-11ef-a0ba-8be0dac302b0;
 Tue, 01 Oct 2024 00:48:26 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id ABCCE5C4973;
 Mon, 30 Sep 2024 22:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C53C1C4CEC7;
 Mon, 30 Sep 2024 22:48:21 +0000 (UTC)
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
X-Inumbo-ID: 1a47263f-7f7e-11ef-a0ba-8be0dac302b0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727736502;
	bh=zhfz0OV36+vUQwEpU+99jVDGrFF9w7/1kGmCTA8hHvw=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=XXOVfb7yslfQvH5T7Q5jUX2k7Pucnik9GovUvguBKcBHHTFrq+E7zXoIXMYdMI73g
	 wMJI4QpBuZcZphtPM7px/2jYLoai9K74LZ27/v6gC9DqNSAqoMP8kKvWeuhBhczgFo
	 SceS9jjUXPwBlGPCdSYxkM55uXB++B7CvRFuBP7l+DXnlWc7Cy6AzTUk31IejNUNQF
	 iqBRKrP/WUMbTTUVrd93jBz94em2qjD9n70JedWPtdv2ttJeMM/cJ2DYAp0mLzrXxE
	 N2/k57lOeg9WbVb+VuFqFgaEmT2Bv2h5pFSI2/2JuS0cI/Ap2W84PquS6cZac4kLsL
	 lkMfCPT8/GCRA==
Date: Mon, 30 Sep 2024 15:48:21 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Andrei Cherechesu (OSS)" <andrei.cherechesu@oss.nxp.com>
cc: xen-devel@lists.xenproject.org, S32@nxp.com, 
    Andrei Cherechesu <andrei.cherechesu@nxp.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH v2 8/8] MAINTAINERS: Add myself as maintainer for NXP
 S32CC
In-Reply-To: <20240930114715.642978-9-andrei.cherechesu@oss.nxp.com>
Message-ID: <alpine.DEB.2.22.394.2409301546380.451631@ubuntu-linux-20-04-desktop>
References: <20240930114715.642978-1-andrei.cherechesu@oss.nxp.com> <20240930114715.642978-9-andrei.cherechesu@oss.nxp.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 30 Sep 2024, Andrei Cherechesu (OSS) wrote:
> From: Andrei Cherechesu <andrei.cherechesu@nxp.com>
> 
> Add myself as maintainer for NXP S32CC SoCs Family,
> and the S32 Linux Team as relevant reviewers list.
> 
> Also add the linflex-uart.c driver to the list of other
> UART drivers in the ARM section.
> 
> Signed-off-by: Andrei Cherechesu <andrei.cherechesu@nxp.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  MAINTAINERS | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fb0ebf0939..2e273a5c78 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -249,6 +249,7 @@ F:	xen/drivers/char/arm-uart.c
>  F:	xen/drivers/char/cadence-uart.c
>  F:	xen/drivers/char/exynos4210-uart.c
>  F:	xen/drivers/char/imx-lpuart.c
> +F:	xen/drivers/char/linflex-uart.c

I would be also happy if you left this out from here and only have it
below under "NXP S32CC FAMILY SUPPORT"



>  F:	xen/drivers/char/meson-uart.c
>  F:	xen/drivers/char/mvebu-uart.c
>  F:	xen/drivers/char/omap-uart.c
> @@ -428,6 +429,13 @@ L:	minios-devel@lists.xenproject.org
>  T:	git https://xenbits.xenproject.org/git-http/mini-os.git
>  F:	config/MiniOS.mk
>  
> +NXP S32CC FAMILY SUPPORT
> +M:	Andrei Cherechesu <andrei.cherechesu@oss.nxp.com>
> +L:	NXP S32 Linux Team <s32@nxp.com>
> +F:	xen/arch/arm/include/asm/linflex-uart.h
> +F:	xen/arch/arm/platforms/s32cc.c
> +F:	xen/drivers/char/linflex-uart.c
> +
>  OCAML TOOLS
>  M:	Christian Lindig <christian.lindig@citrix.com>
>  M:	David Scott <dave@recoil.org>
> -- 
> 2.45.2
> 

