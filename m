Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB5C7FAABB
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 20:58:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642457.1001918 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hkL-000763-37; Mon, 27 Nov 2023 19:58:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642457.1001918; Mon, 27 Nov 2023 19:58:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hkL-00073R-04; Mon, 27 Nov 2023 19:58:21 +0000
Received: by outflank-mailman (input) for mailman id 642457;
 Mon, 27 Nov 2023 19:58:20 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hkJ-0006PP-VB
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:58:19 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4efefe7e-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 20:58:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 191F720103;
 Mon, 27 Nov 2023 20:58:18 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bgg2Glo3Jjei; Mon, 27 Nov 2023 20:58:18 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 02D8D20101;
 Mon, 27 Nov 2023 20:58:18 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hkH-00000005cin-38tg; Mon, 27 Nov 2023 20:58:17 +0100
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
X-Inumbo-ID: 4efefe7e-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 20:58:17 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 04/32] Mini-OS: add EXPORT_SYMBOL() instances to
 hypervisor.c
Message-ID: <20231127195817.gtuzpl7nu2zq24vj@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-5-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-5-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:24:55 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to hypervisor.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  hypervisor.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/hypervisor.c b/hypervisor.c
> index d3857e70..f2cbbc1c 100644
> --- a/hypervisor.c
> +++ b/hypervisor.c
> @@ -31,6 +31,8 @@
>  #include <mini-os/events.h>
>  #include <xen/memory.h>
>  
> +EXPORT_SYMBOL(hypercall_page);
> +
>  #define active_evtchns(cpu,sh,idx)              \
>      ((sh)->evtchn_pending[idx] &                \
>       ~(sh)->evtchn_mask[idx])
> @@ -157,6 +159,7 @@ inline void mask_evtchn(uint32_t port)
>      shared_info_t *s = HYPERVISOR_shared_info;
>      synch_set_bit(port, &s->evtchn_mask[0]);
>  }
> +EXPORT_SYMBOL(mask_evtchn);
>  
>  inline void unmask_evtchn(uint32_t port)
>  {
> @@ -180,9 +183,11 @@ inline void unmask_evtchn(uint32_t port)
>              force_evtchn_callback();
>      }
>  }
> +EXPORT_SYMBOL(unmask_evtchn);
>  
>  inline void clear_evtchn(uint32_t port)
>  {
>      shared_info_t *s = HYPERVISOR_shared_info;
>      synch_clear_bit(port, &s->evtchn_pending[0]);
>  }
> +EXPORT_SYMBOL(clear_evtchn);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

