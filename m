Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 635E77FAB1D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:16:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642598.1002203 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i1U-00062X-C7; Mon, 27 Nov 2023 20:16:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642598.1002203; Mon, 27 Nov 2023 20:16:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i1U-0005zA-9V; Mon, 27 Nov 2023 20:16:04 +0000
Received: by outflank-mailman (input) for mailman id 642598;
 Mon, 27 Nov 2023 20:16:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7htD-0006fp-HV
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:07:31 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 97bec579-8d60-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:07:30 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9F95A20103;
 Mon, 27 Nov 2023 21:07:29 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IHb5svvfoN6u; Mon, 27 Nov 2023 21:07:29 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 89B4820101;
 Mon, 27 Nov 2023 21:07:29 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7htB-00000005cuo-1Lze; Mon, 27 Nov 2023 21:07:29 +0100
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
X-Inumbo-ID: 97bec579-8d60-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:07:29 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 29/32] Mini-OS: add EXPORT_SYMBOL() instances to
 tpmfront.c
Message-ID: <20231127200729.liceixtya5s4mixh@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-30-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-30-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:20 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to tpmfront.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  tpmfront.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tpmfront.c b/tpmfront.c
> index f4864d61..83768d07 100644
> --- a/tpmfront.c
> +++ b/tpmfront.c
> @@ -338,6 +338,8 @@ error:
>     shutdown_tpmfront(dev);
>     return NULL;
>  }
> +EXPORT_SYMBOL(init_tpmfront);
> +
>  void shutdown_tpmfront(struct tpmfront_dev* dev)
>  {
>     char* err;
> @@ -402,6 +404,7 @@ void shutdown_tpmfront(struct tpmfront_dev* dev)
>     }
>     free(dev);
>  }
> +EXPORT_SYMBOL(shutdown_tpmfront);
>  
>  int tpmfront_send(struct tpmfront_dev* dev, const uint8_t* msg, size_t length)
>  {
> @@ -528,6 +531,7 @@ int tpmfront_cmd(struct tpmfront_dev* dev, uint8_t* req, size_t reqlen, uint8_t*
>  
>     return 0;
>  }
> +EXPORT_SYMBOL(tpmfront_cmd);
>  
>  int tpmfront_set_locality(struct tpmfront_dev* dev, int locality)
>  {
> @@ -536,6 +540,7 @@ int tpmfront_set_locality(struct tpmfront_dev* dev, int locality)
>     dev->page->locality = locality;
>     return 0;
>  }
> +EXPORT_SYMBOL(tpmfront_set_locality);
>  
>  #ifdef HAVE_LIBC
>  #include <errno.h>
> @@ -663,5 +668,6 @@ int tpmfront_open(struct tpmfront_dev *dev)
>  
>      return dev->fd;
>  }
> +EXPORT_SYMBOL(tpmfront_open);
>  
>  #endif
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

