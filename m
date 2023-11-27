Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6439A7FAAD4
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:02:13 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642502.1002030 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hnw-0004Mc-T8; Mon, 27 Nov 2023 20:02:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642502.1002030; Mon, 27 Nov 2023 20:02:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hnw-0004KN-Pa; Mon, 27 Nov 2023 20:02:04 +0000
Received: by outflank-mailman (input) for mailman id 642502;
 Mon, 27 Nov 2023 20:02:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hnv-0003w3-9r
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:02:03 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d418af3f-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:02:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 53C8F20103;
 Mon, 27 Nov 2023 21:02:01 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GuFf9kTSR_fs; Mon, 27 Nov 2023 21:02:01 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 385D420101;
 Mon, 27 Nov 2023 21:02:01 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hns-00000005cnJ-3lGx; Mon, 27 Nov 2023 21:02:00 +0100
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
X-Inumbo-ID: d418af3f-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:02:00 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 18/32] Mini-OS: add EXPORT_SYMBOL() instances to
 gnttab.c
Message-ID: <20231127200200.342i3nlihewlgkcr@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-19-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-19-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:09 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to gnttab.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  gnttab.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/gnttab.c b/gnttab.c
> index 6978a9bc..8168ed5d 100644
> --- a/gnttab.c
> +++ b/gnttab.c
> @@ -80,6 +80,7 @@ gnttab_grant_access(domid_t domid, unsigned long frame, int readonly)
>  
>      return ref;
>  }
> +EXPORT_SYMBOL(gnttab_grant_access);
>  
>  grant_ref_t
>  gnttab_grant_transfer(domid_t domid, unsigned long pfn)
> @@ -94,6 +95,7 @@ gnttab_grant_transfer(domid_t domid, unsigned long pfn)
>  
>      return ref;
>  }
> +EXPORT_SYMBOL(gnttab_grant_transfer);
>  
>  int
>  gnttab_end_access(grant_ref_t ref)
> @@ -114,6 +116,7 @@ gnttab_end_access(grant_ref_t ref)
>      put_free_entry(ref);
>      return 1;
>  }
> +EXPORT_SYMBOL(gnttab_end_access);
>  
>  unsigned long
>  gnttab_end_transfer(grant_ref_t ref)
> @@ -144,6 +147,7 @@ gnttab_end_transfer(grant_ref_t ref)
>  
>      return frame;
>  }
> +EXPORT_SYMBOL(gnttab_end_transfer);
>  
>  grant_ref_t
>  gnttab_alloc_and_grant(void **map)
> @@ -156,6 +160,7 @@ gnttab_alloc_and_grant(void **map)
>      gref = gnttab_grant_access(0, mfn, 0);
>      return gref;
>  }
> +EXPORT_SYMBOL(gnttab_alloc_and_grant);
>  
>  static const char * const gnttabop_error_msgs[] = GNTTABOP_error_msgs;
>  
> @@ -168,6 +173,7 @@ gnttabop_error(int16_t status)
>      else
>          return gnttabop_error_msgs[status];
>  }
> +EXPORT_SYMBOL(gnttabop_error);
>  
>  void
>  init_gnttab(void)
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

