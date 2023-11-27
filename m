Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 925557FAAF5
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:18 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642526.1002084 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hrv-00077O-S6; Mon, 27 Nov 2023 20:06:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642526.1002084; Mon, 27 Nov 2023 20:06:11 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hrv-0006yc-Lt; Mon, 27 Nov 2023 20:06:11 +0000
Received: by outflank-mailman (input) for mailman id 642526;
 Mon, 27 Nov 2023 20:06:10 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hnf-0000uA-2F
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:47 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id c9c5dac0-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:01:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 140A620103;
 Mon, 27 Nov 2023 21:01:44 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0wHMu2_Vb9p8; Mon, 27 Nov 2023 21:01:43 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EDB6920101;
 Mon, 27 Nov 2023 21:01:43 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hnb-00000005cmo-33Zw; Mon, 27 Nov 2023 21:01:43 +0100
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
X-Inumbo-ID: c9c5dac0-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:01:43 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 16/32] Mini-OS: add EXPORT_SYMBOL() instances to
 events.c
Message-ID: <20231127200143.yo5jbprsnyhbeurt@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-17-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-17-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:07 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to events.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  events.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/events.c b/events.c
> index 4683e8e1..9f3dbf05 100644
> --- a/events.c
> +++ b/events.c
> @@ -119,6 +119,7 @@ void unbind_evtchn(evtchn_port_t port )
>      if ( rc )
>          printk("WARN: close_port %d failed rc=%d. ignored\n", port, rc);
>  }
> +EXPORT_SYMBOL(unbind_evtchn);
>  
>  evtchn_port_t bind_virq(uint32_t virq, evtchn_handler_t handler, void *data)
>  {
> @@ -138,6 +139,7 @@ evtchn_port_t bind_virq(uint32_t virq, evtchn_handler_t handler, void *data)
>      bind_evtchn(op.port, handler, data);
>  	return op.port;
>  }
> +EXPORT_SYMBOL(bind_virq);
>  
>  evtchn_port_t bind_pirq(uint32_t pirq, int will_share,
>                          evtchn_handler_t handler, void *data)
> @@ -157,6 +159,7 @@ evtchn_port_t bind_pirq(uint32_t pirq, int will_share,
>  	bind_evtchn(op.port, handler, data);
>  	return op.port;
>  }
> +EXPORT_SYMBOL(bind_pirq);
>  
>  /*
>   * Initially all events are without a handler and disabled
> @@ -217,6 +220,7 @@ int evtchn_alloc_unbound(domid_t pal, evtchn_handler_t handler,
>      *port = bind_evtchn(op.port, handler, data);
>      return rc;
>  }
> +EXPORT_SYMBOL(evtchn_alloc_unbound);
>  
>  /* Connect to a port so as to allow the exchange of notifications with
>     the pal. Returns the result of the hypervisor call. */
> @@ -240,6 +244,7 @@ int evtchn_bind_interdomain(domid_t pal, evtchn_port_t remote_port,
>      *local_port = bind_evtchn(port, handler, data);
>      return rc;
>  }
> +EXPORT_SYMBOL(evtchn_bind_interdomain);
>  
>  int evtchn_get_peercontext(evtchn_port_t local_port, char *ctx, int size)
>  {
> @@ -260,6 +265,7 @@ int evtchn_get_peercontext(evtchn_port_t local_port, char *ctx, int size)
>      rc = HYPERVISOR_xsm_op(&op);
>      return rc;
>  }
> +EXPORT_SYMBOL(evtchn_get_peercontext);
>  
>  /* Replace below when a hypercall is available to get the domid. */
>  domid_t get_domid(void)
> @@ -294,6 +300,7 @@ domid_t get_domid(void)
>  
>      return domid;
>  }
> +EXPORT_SYMBOL(get_domid);
>  
>  /*
>   * Local variables:
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

