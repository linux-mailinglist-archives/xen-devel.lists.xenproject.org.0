Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC07B9C6781
	for <lists+xen-devel@lfdr.de>; Wed, 13 Nov 2024 04:00:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.835022.1250842 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3b2-0004BO-EA; Wed, 13 Nov 2024 02:59:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 835022.1250842; Wed, 13 Nov 2024 02:59:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tB3b2-00049O-BV; Wed, 13 Nov 2024 02:59:08 +0000
Received: by outflank-mailman (input) for mailman id 835022;
 Wed, 13 Nov 2024 02:59:07 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=4ZXe=SI=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1tB3b0-00049I-Sj
 for xen-devel@lists.xenproject.org; Wed, 13 Nov 2024 02:59:06 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c7397d5-a16b-11ef-a0c7-8be0dac302b0;
 Wed, 13 Nov 2024 03:59:03 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id EB4035C5A9D;
 Wed, 13 Nov 2024 02:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B16C4CED4;
 Wed, 13 Nov 2024 02:59:00 +0000 (UTC)
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
X-Inumbo-ID: 3c7397d5-a16b-11ef-a0c7-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjEzOS4xNzguODQuMjE3IiwiaGVsbyI6ImRmdy5zb3VyY2Uua2VybmVsLm9yZyJ9
X-Custom-Transaction: eyJpZCI6IjNjNzM5N2Q1LWExNmItMTFlZi1hMGM3LThiZTBkYWMzMDJiMCIsInRzIjoxNzMxNDY2NzQzLjIzNDMxOSwic2VuZGVyIjoic3N0YWJlbGxpbmlAa2VybmVsLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731466741;
	bh=a+FPuQHxz4c4cKLt+ho1fHHy42wtwgSopYNNfni4ORQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=eYpJufNVVeiOjZDEVAqGxQH5LWuOWP/RDhHMN71qiqp/1ULZCVgdDYuVSSK7N3S9n
	 cELPRkwZ7wiZLP+NZpyUCVafu8jSSH5T+53hQGofoFqcBIxGI0PAYpjkghxhFRUmii
	 42qW31UECXx4IzUZlHrw1NwhlLC69Z4dZHrjWIbzuIX4FxzLqThBzZLpx+pwz/g1XZ
	 tG4q0TSLa5wu5KXexgksqLNFVQYLc5l8ljA0rLdKjvIiz4RUfgKW70+QCTJZzR6FoJ
	 QYQPHESGUR1/d7c36BjzcRQML1zAMxo5Oo/0d3ZcQyI+FXCiFcV/MWNREfgY3RR0+o
	 u2snm+bBZqw4g==
Date: Tue, 12 Nov 2024 18:58:56 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Andrew Cooper <andrew.cooper3@citrix.com>
cc: Xen-devel <xen-devel@lists.xenproject.org>, 
    Jan Beulich <JBeulich@suse.com>, 
    =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>, 
    Stefano Stabellini <sstabellini@kernel.org>, 
    "consulting @ bugseng . com" <consulting@bugseng.com>
Subject: Re: [PATCH] x86/apic: Include genapic.h in delivery.c
In-Reply-To: <20241112215132.1482848-1-andrew.cooper3@citrix.com>
Message-ID: <alpine.DEB.2.22.394.2411121858360.222505@ubuntu-linux-20-04-desktop>
References: <20241112215132.1482848-1-andrew.cooper3@citrix.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-3431377-1731466741=:222505"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-3431377-1731466741=:222505
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Tue, 11 Nov 2024, Andrew Cooper wrote:
> This resolves 4 Misra violations of Rule 8.4 caused by the function
> definitions not being able to see their declarations.
> 
> Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> CC: Jan Beulich <JBeulich@suse.com>
> CC: Roger Pau Monné <roger.pau@citrix.com>
> CC: Stefano Stabellini <sstabellini@kernel.org>
> CC: consulting@bugseng.com <consulting@bugseng.com>
> ---
>  xen/arch/x86/genapic/delivery.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/xen/arch/x86/genapic/delivery.c b/xen/arch/x86/genapic/delivery.c
> index 7bb7bd658650..15100439be05 100644
> --- a/xen/arch/x86/genapic/delivery.c
> +++ b/xen/arch/x86/genapic/delivery.c
> @@ -3,8 +3,9 @@
>  
>  #include <asm/apic.h>
>  #include <asm/current.h>
> -#include <asm/smp.h>
> +#include <asm/genapic.h>
>  #include <asm/hardirq.h>
> +#include <asm/smp.h>
>  
>  /*
>   * LOGICAL FLAT DELIVERY MODE (multicast via bitmask to <= 8 logical APIC IDs).
> 
> base-commit: 38febce5b35a7a4391906499b2046f01ec0129ca
> -- 
> 2.39.5
> 
--8323329-3431377-1731466741=:222505--

