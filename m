Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 835139B48A1
	for <lists+xen-devel@lfdr.de>; Tue, 29 Oct 2024 12:50:39 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.827298.1241880 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kjv-0001wO-Hy; Tue, 29 Oct 2024 11:50:23 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 827298.1241880; Tue, 29 Oct 2024 11:50:23 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1t5kjv-0001ue-Eg; Tue, 29 Oct 2024 11:50:23 +0000
Received: by outflank-mailman (input) for mailman id 827298;
 Tue, 29 Oct 2024 11:50:21 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yWqW=RZ=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1t5kjt-0001sc-Lw
 for xen-devel@lists.xenproject.org; Tue, 29 Oct 2024 11:50:21 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id f5f0dbea-95eb-11ef-a0c3-8be0dac302b0;
 Tue, 29 Oct 2024 12:50:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 92DB8A1A05;
 Tue, 29 Oct 2024 12:50:14 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fKjYY_kBv5fl; Tue, 29 Oct 2024 12:50:14 +0100 (CET)
Received: from begin (nat-inria-interne-52-gw-01-bso.bordeaux.inria.fr
 [194.199.1.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 329A4A19D3;
 Tue, 29 Oct 2024 12:50:14 +0100 (CET)
Received: from samy by begin with local (Exim 4.98)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1t5kjl-0000000AdLX-3Res; Tue, 29 Oct 2024 12:50:13 +0100
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
X-Inumbo-ID: f5f0dbea-95eb-11ef-a0c3-8be0dac302b0
X-Custom-Connection: eyJyZW1vdGVpcCI6IjE0MC43Ny4xNjYuMTM4IiwiaGVsbyI6InNvbmF0YS5lbnMtbHlvbi5vcmcifQ==
X-Custom-Transaction: eyJpZCI6ImY1ZjBkYmVhLTk1ZWItMTFlZi1hMGMzLThiZTBkYWMzMDJiMCIsInRzIjoxNzMwMjAyNjE4Ljc5MzQ4Niwic2VuZGVyIjoic3JzMD15d3F3PXJ6PWVucy1seW9uLm9yZz1zYW11ZWwudGhpYmF1bHRAYm91bmNlLmVucy1seW9uLm9yZyIsInJlY2lwaWVudCI6Inhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZyJ9
Date: Tue, 29 Oct 2024 12:50:13 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	Natanael Copa <ncopa@alpinelinux.org>
Subject: Re: [Mini-OS PATCH] Add missing symbol exports for grub-pv
Message-ID: <ZyDL9fGtcouw9bar@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org,
	Natanael Copa <ncopa@alpinelinux.org>
References: <20241029114158.17231-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241029114158.17231-1-jgross@suse.com>
Organization: I am not organized

Juergen Gross, le mar. 29 oct. 2024 12:41:58 +0100, a ecrit:
> Grub-pv needs start_info_union and phys_to_machine_mapping to be
> accessible. Export both symbols.
> 
> Fixes: 33411a11f848 ("Mini-OS: hide all symbols not exported via EXPORT_SYMBOLS()")
> Reported-by: Natanael Copa <ncopa@alpinelinux.org>
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  arch/x86/mm.c    | 1 +
>  arch/x86/setup.c | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/x86/mm.c b/arch/x86/mm.c
> index 572e762e..3ba6d917 100644
> --- a/arch/x86/mm.c
> +++ b/arch/x86/mm.c
> @@ -55,6 +55,7 @@
>  #endif
>  
>  unsigned long *phys_to_machine_mapping;
> +EXPORT_SYMBOL(phys_to_machine_mapping);
>  unsigned long mfn_zero;
>  pgentry_t *pt_base;
>  EXPORT_SYMBOL(pt_base);
> diff --git a/arch/x86/setup.c b/arch/x86/setup.c
> index b27bbed7..b613083b 100644
> --- a/arch/x86/setup.c
> +++ b/arch/x86/setup.c
> @@ -41,6 +41,7 @@
>   * address of the shared_info structure, and things like that.
>   */
>  union start_info_union start_info_union;
> +EXPORT_SYMBOL(start_info_union);
>  #endif
>  
>  /*
> -- 
> 2.43.0

