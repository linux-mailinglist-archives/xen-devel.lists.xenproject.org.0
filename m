Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3183E7FAB25
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:17:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642620.1002235 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i2W-0007oz-2i; Mon, 27 Nov 2023 20:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642620.1002235; Mon, 27 Nov 2023 20:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i2V-0007m2-Vc; Mon, 27 Nov 2023 20:17:07 +0000
Received: by outflank-mailman (input) for mailman id 642620;
 Mon, 27 Nov 2023 20:17:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hsJ-0006dX-PS
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:06:35 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 75f4531c-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:06:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id E971120103;
 Mon, 27 Nov 2023 21:06:32 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1tAhd2f_1Dq; Mon, 27 Nov 2023 21:06:32 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id D399720101;
 Mon, 27 Nov 2023 21:06:32 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hsG-00000005cta-2d7R; Mon, 27 Nov 2023 21:06:32 +0100
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
X-Inumbo-ID: 75f4531c-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:06:32 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 23/32] Mini-OS: add EXPORT_SYMBOL() instances to
 9pfront.c
Message-ID: <20231127200632.o3l5hsdymr2cf2t4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-24-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-24-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:14 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to 9pfront.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  9pfront.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/9pfront.c b/9pfront.c
> index 35c5552b..315089bc 100644
> --- a/9pfront.c
> +++ b/9pfront.c
> @@ -1243,6 +1243,7 @@ void *init_9pfront(unsigned int id, const char *mnt)
>      free(msg);
>      return NULL;
>  }
> +EXPORT_SYMBOL(init_9pfront);
>  
>  void shutdown_9pfront(void *dev)
>  {
> @@ -1286,6 +1287,7 @@ void shutdown_9pfront(void *dev)
>          printk("9pfsfront shutdown %u failed, %s\n", dev9p->id, reason);
>      free(msg);
>  }
> +EXPORT_SYMBOL(shutdown_9pfront);
>  
>  static const struct file_ops ops_9pfs = {
>      .name = "9pfs",
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

