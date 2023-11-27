Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5987FAAF9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:36 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642542.1002129 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hsC-0000Ss-1y; Mon, 27 Nov 2023 20:06:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642542.1002129; Mon, 27 Nov 2023 20:06:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hsB-0000PQ-Uz; Mon, 27 Nov 2023 20:06:27 +0000
Received: by outflank-mailman (input) for mailman id 642542;
 Mon, 27 Nov 2023 20:06:26 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hsA-0006dX-7H
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:06:26 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6fe9810d-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:06:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id C839420103;
 Mon, 27 Nov 2023 21:06:22 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7P6LZC_9QCJv; Mon, 27 Nov 2023 21:06:22 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id B18F620101;
 Mon, 27 Nov 2023 21:06:22 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hs6-00000005ctK-21XC; Mon, 27 Nov 2023 21:06:22 +0100
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
X-Inumbo-ID: 6fe9810d-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:06:22 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 21/32] Mini-OS: add EXPORT_SYMBOL() instances to time.c
Message-ID: <20231127200622.uv7mf7kygucn2xbo@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-22-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-22-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:12 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to time.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  arch/arm/time.c | 1 +
>  arch/x86/time.c | 2 +-
>  2 files changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/time.c b/arch/arm/time.c
> index a088981e..3483511a 100644
> --- a/arch/arm/time.c
> +++ b/arch/arm/time.c
> @@ -83,6 +83,7 @@ int gettimeofday(struct timeval *tv, void *tz)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(gettimeofday);
>  
>  /* Set the timer and mask. */
>  void write_timer_ctl(uint32_t value) {
> diff --git a/arch/x86/time.c b/arch/x86/time.c
> index 8077c80c..332c0260 100644
> --- a/arch/x86/time.c
> +++ b/arch/x86/time.c
> @@ -204,7 +204,7 @@ int gettimeofday(struct timeval *tv, void *tz)
>  
>      return 0;
>  }
> -
> +EXPORT_SYMBOL(gettimeofday);
>  
>  void block_domain(s_time_t until)
>  {
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

