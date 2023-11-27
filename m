Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A89677FAAD3
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:02:07 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642500.1002016 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hnp-00041R-Kl; Mon, 27 Nov 2023 20:01:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642500.1002016; Mon, 27 Nov 2023 20:01:57 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hnp-0003yD-HN; Mon, 27 Nov 2023 20:01:57 +0000
Received: by outflank-mailman (input) for mailman id 642500;
 Mon, 27 Nov 2023 20:01:56 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hno-0003w3-95
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:56 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id cfafaa4f-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:01:54 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 0203A20103;
 Mon, 27 Nov 2023 21:01:54 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3Hz5THvXQPeR; Mon, 27 Nov 2023 21:01:53 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id D9B5420101;
 Mon, 27 Nov 2023 21:01:53 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hnl-00000005cn2-2MpD; Mon, 27 Nov 2023 21:01:53 +0100
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
X-Inumbo-ID: cfafaa4f-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:01:53 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 17/32] Mini-OS: add EXPORT_SYMBOL() instances to
 gntmap.c
Message-ID: <20231127200153.pd4igzv4npr7zwvd@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-18-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-18-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:08 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to gntmap.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  gntmap.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/gntmap.c b/gntmap.c
> index 3422ab23..5f57d6b3 100644
> --- a/gntmap.c
> +++ b/gntmap.c
> @@ -106,6 +106,7 @@ gntmap_set_max_grants(struct gntmap *map, int count)
>      map->nentries = count;
>      return 0;
>  }
> +EXPORT_SYMBOL(gntmap_set_max_grants);
>  
>  static int
>  _gntmap_unmap_grant_ref(struct gntmap *map, int idx)
> @@ -209,6 +210,7 @@ gntmap_munmap(struct gntmap *map, unsigned long start_address, int count)
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(gntmap_munmap);
>  
>  void*
>  gntmap_map_grant_refs(struct gntmap *map, 
> @@ -251,6 +253,7 @@ gntmap_map_grant_refs(struct gntmap *map,
>  
>      return (void*) addr;
>  }
> +EXPORT_SYMBOL(gntmap_map_grant_refs);
>  
>  void
>  gntmap_init(struct gntmap *map)
> @@ -259,6 +262,7 @@ gntmap_init(struct gntmap *map)
>      map->nentries = 0;
>      map->entries = NULL;
>  }
> +EXPORT_SYMBOL(gntmap_init);
>  
>  void
>  gntmap_fini(struct gntmap *map)
> @@ -281,3 +285,4 @@ gntmap_fini(struct gntmap *map)
>      map->entries = NULL;
>      map->nentries = 0;
>  }
> +EXPORT_SYMBOL(gntmap_fini);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

