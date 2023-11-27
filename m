Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 194837FAB2E
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:18:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642643.1002284 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i3R-0001gI-FY; Mon, 27 Nov 2023 20:18:05 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642643.1002284; Mon, 27 Nov 2023 20:18:05 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i3R-0001dz-Br; Mon, 27 Nov 2023 20:18:05 +0000
Received: by outflank-mailman (input) for mailman id 642643;
 Mon, 27 Nov 2023 20:18:04 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hsu-0006fp-C3
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:07:12 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 8c23004f-8d60-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:07:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 2430120103;
 Mon, 27 Nov 2023 21:07:10 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gw9mB0mH72ey; Mon, 27 Nov 2023 21:07:10 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 09E8420101;
 Mon, 27 Nov 2023 21:07:10 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hsr-00000005cuJ-3ALl; Mon, 27 Nov 2023 21:07:09 +0100
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
X-Inumbo-ID: 8c23004f-8d60-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:07:09 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 27/32] Mini-OS: add EXPORT_SYMBOL() instances to
 pcifront.c
Message-ID: <20231127200709.3ssmsvuurjbdd37w@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-28-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-28-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:18 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to pcifront.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  pcifront.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/pcifront.c b/pcifront.c
> index 56423562..f1d69396 100644
> --- a/pcifront.c
> +++ b/pcifront.c
> @@ -278,6 +278,7 @@ error:
>      free_pcifront(dev);
>      return NULL;
>  }
> +EXPORT_SYMBOL(init_pcifront);
>  
>  void pcifront_scan(struct pcifront_dev *dev, void (*func)(unsigned int domain, unsigned int bus, unsigned slot, unsigned int fun))
>  {
> @@ -319,6 +320,7 @@ void pcifront_scan(struct pcifront_dev *dev, void (*func)(unsigned int domain, u
>      }
>      free(path);
>  }
> +EXPORT_SYMBOL(pcifront_scan);
>  
>  void shutdown_pcifront(struct pcifront_dev *dev)
>  {
> @@ -377,6 +379,7 @@ close_pcifront:
>      if (!err)
>          free_pcifront(dev);
>  }
> +EXPORT_SYMBOL(shutdown_pcifront);
>  
>  int pcifront_physical_to_virtual (struct pcifront_dev *dev,
>                                    unsigned int *dom,
> @@ -451,6 +454,7 @@ void pcifront_op(struct pcifront_dev *dev, struct xen_pci_op *op)
>      rmb();
>      *op = dev->info->op;
>  }
> +EXPORT_SYMBOL(pcifront_op);
>  
>  int pcifront_conf_read(struct pcifront_dev *dev,
>                         unsigned int dom,
> @@ -481,6 +485,7 @@ int pcifront_conf_read(struct pcifront_dev *dev,
>  
>      return 0;
>  }
> +EXPORT_SYMBOL(pcifront_conf_read);
>  
>  int pcifront_conf_write(struct pcifront_dev *dev,
>                          unsigned int dom,
> @@ -508,6 +513,7 @@ int pcifront_conf_write(struct pcifront_dev *dev,
>  
>      return op.err;
>  }
> +EXPORT_SYMBOL(pcifront_conf_write);
>  
>  int pcifront_enable_msi(struct pcifront_dev *dev,
>                          unsigned int dom,
> @@ -533,6 +539,7 @@ int pcifront_enable_msi(struct pcifront_dev *dev,
>      else
>          return op.value;
>  }
> +EXPORT_SYMBOL(pcifront_enable_msi);
>  
>  int pcifront_disable_msi(struct pcifront_dev *dev,
>                           unsigned int dom,
> @@ -555,6 +562,7 @@ int pcifront_disable_msi(struct pcifront_dev *dev,
>      
>      return op.err;
>  }
> +EXPORT_SYMBOL(pcifront_disable_msi);
>  
>  int pcifront_enable_msix(struct pcifront_dev *dev,
>                           unsigned int dom,
> @@ -589,7 +597,7 @@ int pcifront_enable_msix(struct pcifront_dev *dev,
>  
>      return 0;
>  }
> -
> +EXPORT_SYMBOL(pcifront_enable_msix);
>  
>  int pcifront_disable_msix(struct pcifront_dev *dev,
>                            unsigned int dom,
> @@ -612,3 +620,4 @@ int pcifront_disable_msix(struct pcifront_dev *dev,
>      
>      return op.err;
>  }
> +EXPORT_SYMBOL(pcifront_disable_msix);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

