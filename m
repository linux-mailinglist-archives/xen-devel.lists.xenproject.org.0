Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFCC6800F4
	for <lists+xen-devel@lfdr.de>; Sun, 29 Jan 2023 19:50:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.486411.753770 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMCkn-0001KL-22; Sun, 29 Jan 2023 18:50:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 486411.753770; Sun, 29 Jan 2023 18:50:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pMCkm-0001He-Uu; Sun, 29 Jan 2023 18:50:12 +0000
Received: by outflank-mailman (input) for mailman id 486411;
 Sun, 29 Jan 2023 18:50:11 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=As8j=52=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1pMCkl-00007Y-Jg
 for xen-devel@lists.xenproject.org; Sun, 29 Jan 2023 18:50:11 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c0103a7b-a005-11ed-b8d1-410ff93cb8f0;
 Sun, 29 Jan 2023 19:50:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 6C37B200FB;
 Sun, 29 Jan 2023 19:50:07 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5T9GIAFM5FCn; Sun, 29 Jan 2023 19:50:06 +0100 (CET)
Received: from begin (lfbn-bor-1-1163-184.w92-158.abo.wanadoo.fr
 [92.158.138.184])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 642D4200F9;
 Sun, 29 Jan 2023 19:50:06 +0100 (CET)
Received: from samy by begin with local (Exim 4.96)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1pMCkg-000G6l-38;
 Sun, 29 Jan 2023 19:50:06 +0100
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
X-Inumbo-ID: c0103a7b-a005-11ed-b8d1-410ff93cb8f0
Date: Sun, 29 Jan 2023 19:50:06 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] Mini-OS: remove stale subdirs from Makefile
Message-ID: <20230129185006.p44xmmrlppiaayru@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20230127073244.6883-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230127073244.6883-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le ven. 27 janv. 2023 08:32:44 +0100, a ecrit:
> The SUBDIRS make variable has some stale entries, remove them.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index f3acdd2f..747c7c01 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -34,7 +34,7 @@ EXTRA_OBJS =
>  TARGET := mini-os
>  
>  # Subdirectories common to mini-os
> -SUBDIRS := lib xenbus console
> +SUBDIRS := lib
>  
>  src-$(CONFIG_BLKFRONT) += blkfront.c
>  src-$(CONFIG_CONSFRONT) += consfront.c
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

