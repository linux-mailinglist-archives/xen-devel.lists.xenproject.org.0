Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF28AC98A7
	for <lists+xen-devel@lfdr.de>; Sat, 31 May 2025 02:42:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1001718.1381845 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAIp-0005JB-51; Sat, 31 May 2025 00:42:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1001718.1381845; Sat, 31 May 2025 00:42:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uLAIp-0005HZ-2N; Sat, 31 May 2025 00:42:23 +0000
Received: by outflank-mailman (input) for mailman id 1001718;
 Sat, 31 May 2025 00:42:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Ffab=YP=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1uLAIn-0005HM-SV
 for xen-devel@lists.xenproject.org; Sat, 31 May 2025 00:42:21 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 1bacf479-3db8-11f0-a300-13f23c93f187;
 Sat, 31 May 2025 02:42:20 +0200 (CEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 457975C633A;
 Sat, 31 May 2025 00:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFDB3C4CEE9;
 Sat, 31 May 2025 00:42:16 +0000 (UTC)
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
X-Inumbo-ID: 1bacf479-3db8-11f0-a300-13f23c93f187
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748652137;
	bh=LRTXElYsQwjLTolW/oDfxCUppOOmBuJy7qxIUajToc0=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=U15Fcmxmxhz84cdQXFtjFJo+IabyWBDXfH9nWeBqFhM0r162gU81FwpTosAz1uXzh
	 Y/pE1ZE7jNq0vqBWnSQxwTAgKME8bWI6gmDEu7nOtTI0ZQGLfsZdDMWrTLC5yQ6EPo
	 hDeeLTO4e0sJOZmZQZfItgE1s6UXqvEFMQGG1wYa6qIQeDLhuauqvE1V/rdhBrzD8K
	 TQwBRl4/UWN8Pi3ojENdYyVtGnXSz0glMq7AROHd55kNDkMa5jdsGYThPR9NMf+GUU
	 LSQvAVBh74tC9yDlPBxjrjCdKcMAWsZZoCY7MKio55YhVvV2anRYtoPS9py8ohP2Zc
	 LPlqQVrx4awtg==
Date: Fri, 30 May 2025 17:42:12 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Alejandro Vallejo <agarciav@amd.com>
cc: xen-devel@lists.xenproject.org, Jan Beulich <jbeulich@suse.com>, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    "Daniel P. Smith" <dpsmith@apertussolutions.com>
Subject: Re: [PATCH 02/19] x86: Add missing pci_dev forward declaration in
 asm/pci.h
In-Reply-To: <20250530120242.39398-3-agarciav@amd.com>
Message-ID: <alpine.DEB.2.22.394.2505301741490.1147082@ubuntu-linux-20-04-desktop>
References: <DA1WWRUQLCAG.ZTVR1HXJ85V0@amd.com> <20250530120242.39398-1-agarciav@amd.com> <20250530120242.39398-3-agarciav@amd.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 May 2025, Alejandro Vallejo wrote:
> Not a functional change.
> 
> Signed-off-by: Alejandro Vallejo <agarciav@amd.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>

> ---
>  xen/arch/x86/include/asm/pci.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xen/arch/x86/include/asm/pci.h b/xen/arch/x86/include/asm/pci.h
> index bed99437cc..2e67cba8b9 100644
> --- a/xen/arch/x86/include/asm/pci.h
> +++ b/xen/arch/x86/include/asm/pci.h
> @@ -13,6 +13,8 @@
>                          || (id) == 0x01128086 || (id) == 0x01228086 \
>                          || (id) == 0x010A8086 )
>  
> +struct pci_dev;
> +
>  struct arch_pci_dev {
>      vmask_t used_vectors;
>      /*
> -- 
> 2.43.0
> 
> 

