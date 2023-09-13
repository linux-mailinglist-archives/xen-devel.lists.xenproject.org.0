Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6F479F553
	for <lists+xen-devel@lfdr.de>; Thu, 14 Sep 2023 01:07:20 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.601687.937789 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgYwx-0000w7-MG; Wed, 13 Sep 2023 23:07:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 601687.937789; Wed, 13 Sep 2023 23:07:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qgYwx-0000t6-Ig; Wed, 13 Sep 2023 23:07:11 +0000
Received: by outflank-mailman (input) for mailman id 601687;
 Wed, 13 Sep 2023 23:07:10 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=VxlT=E5=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qgYwv-0000sx-Vv
 for xen-devel@lists.xenproject.org; Wed, 13 Sep 2023 23:07:09 +0000
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 429cdaef-528a-11ee-8787-cb3800f73035;
 Thu, 14 Sep 2023 01:07:09 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 695A7CE25B1;
 Wed, 13 Sep 2023 23:07:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F26D2C433C7;
 Wed, 13 Sep 2023 23:07:03 +0000 (UTC)
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
X-Inumbo-ID: 429cdaef-528a-11ee-8787-cb3800f73035
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694646424;
	bh=ff4Xglxtnbq7pMTBdXo/zVGkPU3zPuCRWBB6q8+lHzQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ro3uh6ilWqg62WQdB59QKFPdBxd9k5F9ZvjGq9dmM++9OsZJBn8IDIV/KSIzTNYWt
	 jo0VWNH50+2+vTCvsrxad6rGpp+BDrZGVrr2XhLHpL4/5/D7NAd+vsypFnvV1KyOzQ
	 /OPFMGnuApBQqNp/UNo2U1MloPOzrE/7smTfoQWaFP6m49jE35lust8QTw2wIvIgnr
	 kTN3cVHzDRLzQwBPsMMBc3gTPAOaQ0e8wPtrGvRUzuWMgVBkXqoajEGd4CfZepBISJ
	 PTzDDWYctZMwpG5vY7YXYw+QbHmMH1t7//Gwm03ZbWj2ES5HqFmebnOpdTwXVzqI0x
	 /2JS6TWueCfbg==
Date: Wed, 13 Sep 2023 16:07:01 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Juergen Gross <jgross@suse.com>
cc: linux-kernel@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, 
    Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, 
    xen-devel@lists.xenproject.org
Subject: Re: [PATCH 1/3] arm/xen: remove lazy mode related definitions
In-Reply-To: <20230913113828.18421-2-jgross@suse.com>
Message-ID: <alpine.DEB.2.22.394.2309131606560.2295162@ubuntu-linux-20-04-desktop>
References: <20230913113828.18421-1-jgross@suse.com> <20230913113828.18421-2-jgross@suse.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 13 Sep 2023, Juergen Gross wrote:
> include/xen/arm/hypervisor.h contains definitions related to paravirt
> lazy mode, which are used nowhere in the code.
> 
> All paravirt lazy mode related users are in x86 code, so remove the
> definitions on Arm side.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Acked-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
>  include/xen/arm/hypervisor.h | 12 ------------
>  1 file changed, 12 deletions(-)
> 
> diff --git a/include/xen/arm/hypervisor.h b/include/xen/arm/hypervisor.h
> index 43ef24dd030e..9995695204f5 100644
> --- a/include/xen/arm/hypervisor.h
> +++ b/include/xen/arm/hypervisor.h
> @@ -7,18 +7,6 @@
>  extern struct shared_info *HYPERVISOR_shared_info;
>  extern struct start_info *xen_start_info;
>  
> -/* Lazy mode for batching updates / context switch */
> -enum paravirt_lazy_mode {
> -	PARAVIRT_LAZY_NONE,
> -	PARAVIRT_LAZY_MMU,
> -	PARAVIRT_LAZY_CPU,
> -};
> -
> -static inline enum paravirt_lazy_mode paravirt_get_lazy_mode(void)
> -{
> -	return PARAVIRT_LAZY_NONE;
> -}
> -
>  #ifdef CONFIG_XEN
>  void __init xen_early_init(void);
>  #else
> -- 
> 2.35.3
> 

