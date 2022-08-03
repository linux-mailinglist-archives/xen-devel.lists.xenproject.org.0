Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id E3634589405
	for <lists+xen-devel@lfdr.de>; Wed,  3 Aug 2022 23:23:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.380105.614083 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJLpA-000056-G5; Wed, 03 Aug 2022 21:22:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 380105.614083; Wed, 03 Aug 2022 21:22:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oJLpA-0008Uc-D8; Wed, 03 Aug 2022 21:22:40 +0000
Received: by outflank-mailman (input) for mailman id 380105;
 Wed, 03 Aug 2022 21:22:39 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=B7Vd=YH=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1oJLp9-0008UW-2K
 for xen-devel@lists.xenproject.org; Wed, 03 Aug 2022 21:22:39 +0000
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 65d6f895-1372-11ed-924f-1f966e50362f;
 Wed, 03 Aug 2022 23:22:37 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E29A1B8227F;
 Wed,  3 Aug 2022 21:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F690C433D6;
 Wed,  3 Aug 2022 21:22:35 +0000 (UTC)
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
X-Inumbo-ID: 65d6f895-1372-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659561755;
	bh=y7RIHItmEHgJ137CuGXgY/O3/XZTzNvmMY4b1GaIZeg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=tH53X3/y2lE0FtD11RQIoOLaSQO5pfZeMPynESRPBAB1Y0ajsCLBeypPupcuLNQVe
	 xQEdIMtQ+eMdWP0lrFgQo/5iR0PoiJjq2rnEpe7nhodzVucUYU4IVHGCCI7uFT5YLA
	 Wbedd9U9cHx7gCWaRU3rz4RAmq4piJ1wxc/LpPyeuh/t2kYeCx3Xp+zpMbgw3TeMan
	 ok97jEEtitncla0PMJc988tpOb146NbqYR0r/wFTSD26Dc6Ld3nfL9q47zvtICx3hF
	 CWoktePI2cISi+A3UQ/qMLzap2ggI/ui/XWrBb34f5UGqY84hjJuAiHmf8Q07+xbow
	 ihpgzVqwVzdfQ==
Date: Wed, 3 Aug 2022 14:22:34 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Xenia Ragiadakou <burzalodowa@gmail.com>
cc: xen-devel@lists.xenproject.org, 
    Stefano Stabellini <sstabellini@kernel.org>, Julien Grall <julien@xen.org>, 
    Bertrand Marquis <bertrand.marquis@arm.com>, 
    Volodymyr Babchuk <Volodymyr_Babchuk@epam.com>
Subject: Re: [PATCH] xen/char: mvebu-uart: Fix MISRA C 2012 Rule 20.7
 violation
In-Reply-To: <20220803070958.1752256-1-burzalodowa@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2208031422170.3147284@ubuntu-linux-20-04-desktop>
References: <20220803070958.1752256-1-burzalodowa@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 3 Aug 2022, Xenia Ragiadakou wrote:
> The macro parameters 'off' and 'uart' are used as expressions and it is
> good to be enclosed in parentheses to prevent against unintended expansion.
> 
> For the 'uart' case, in mvebu3700_write(), correct the second parentheses
> that seems to have been accidently misplaced.
> 
> Signed-off-by: Xenia Ragiadakou <burzalodowa@gmail.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  xen/drivers/char/mvebu-uart.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/drivers/char/mvebu-uart.c b/xen/drivers/char/mvebu-uart.c
> index 835d1ace3c..a00618b96f 100644
> --- a/xen/drivers/char/mvebu-uart.c
> +++ b/xen/drivers/char/mvebu-uart.c
> @@ -64,8 +64,8 @@ static struct mvebu3700_uart {
>      struct vuart_info vuart;
>  } mvebu3700_com = {0};
>  
> -#define mvebu3700_read(uart, off)           readl((uart)->regs + off)
> -#define mvebu3700_write(uart, off, val)     writel(val, (uart->regs) + off)
> +#define mvebu3700_read(uart, off)           readl((uart)->regs + (off))
> +#define mvebu3700_write(uart, off, val)     writel(val, (uart)->regs + (off))
>  
>  static void mvebu3700_uart_interrupt(int irq, void *data,
>                                       struct cpu_user_regs *regs)
> -- 
> 2.34.1
> 

