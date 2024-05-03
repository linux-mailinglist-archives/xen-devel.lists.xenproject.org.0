Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 734978BB88F
	for <lists+xen-devel@lfdr.de>; Sat,  4 May 2024 01:57:04 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.716720.1118923 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s32lp-0007Vf-6p; Fri, 03 May 2024 23:56:53 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 716720.1118923; Fri, 03 May 2024 23:56:53 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1s32lp-0007SK-3E; Fri, 03 May 2024 23:56:53 +0000
Received: by outflank-mailman (input) for mailman id 716720;
 Fri, 03 May 2024 23:56:52 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=tvfX=MG=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1s32lo-0006vL-1O
 for xen-devel@lists.xenproject.org; Fri, 03 May 2024 23:56:52 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id ce212e4f-09a8-11ef-909c-e314d9c70b13;
 Sat, 04 May 2024 01:56:51 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 28531CE1A16;
 Fri,  3 May 2024 23:56:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0287C116B1;
 Fri,  3 May 2024 23:56:43 +0000 (UTC)
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
X-Inumbo-ID: ce212e4f-09a8-11ef-909c-e314d9c70b13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714780605;
	bh=KC/SiMnjEbTCWCvbhfalffU+KxKur83OHaxBl2yilo8=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=JeZBjTr2uIL4cAj8QYFyxFkKQXaa63FfJr4OlzLjTR/tYP2Gu2dQnDL1u7GTcYWvM
	 AZhfReu7BncolOMFoVZhNlJP2u7FIlJuiSfgyagOqatSdo+jeWt85pmCpQ1V19Lg/P
	 hrAliurp8xlir/tbHhOAHNDBRaXKTqZ5m83/+Mhjj3HhFnG8+xCsQ02QRcHZPSavSB
	 On4dtNgzh1tFBkvABp91KOC8eU6OlUe4a0+Q6C5xiKdScn9Swwi7bjeWa4HIWiK1ot
	 +HZmyBeK4+ib7k7Tsqm2zkAanSmpy6hjDGrWzDNwR4bNyWRyueBvF8s4Z8Uj7Hg4io
	 Kx8/UWG3WDtcQ==
Date: Fri, 3 May 2024 16:56:43 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, julien@xen.org, 
    bertrand.marquis@arm.com, michal.orzel@amd.com, Volodymyr_Babchuk@epam.com, 
    jbeulich@suse.com, andrew.cooper3@citrix.com, edgar.iglesias@amd.com
Subject: Re: [PATCH v3 5/9] xen/arm64: debug: Add missing code symbol
 annotations
In-Reply-To: <20240501035448.964625-6-edgar.iglesias@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2405031656340.1151289@ubuntu-linux-20-04-desktop>
References: <20240501035448.964625-1-edgar.iglesias@gmail.com> <20240501035448.964625-6-edgar.iglesias@gmail.com>
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
>  xen/arch/arm/arm64/debug.S | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/xen/arch/arm/arm64/debug.S b/xen/arch/arm/arm64/debug.S
> index 71cad9d762..c3d02c33d7 100644
> --- a/xen/arch/arm/arm64/debug.S
> +++ b/xen/arch/arm/arm64/debug.S
> @@ -27,17 +27,19 @@
>   * Print a character on the UART - this function is called by C
>   * x0: character to print
>   */
> -GLOBAL(early_putch)
> +FUNC(early_putch)
>          ldr   x15, =EARLY_UART_VIRTUAL_ADDRESS
>          early_uart_ready x15, 1
>          early_uart_transmit x15, w0
>          ret
> +END(early_putch)
>  
>  /* Flush the UART - this function is called by C */
> -GLOBAL(early_flush)
> +FUNC(early_flush)
>          ldr   x15, =EARLY_UART_VIRTUAL_ADDRESS  /* x15 := VA UART base address */
>          early_uart_ready x15, 1
>          ret
> +END(early_flush)
>  
>  /*
>   * Local variables:
> -- 
> 2.40.1
> 

