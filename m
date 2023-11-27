Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAC97FAB24
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:17:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642621.1002243 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i2W-0007va-DP; Mon, 27 Nov 2023 20:17:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642621.1002243; Mon, 27 Nov 2023 20:17:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i2W-0007p7-8Z; Mon, 27 Nov 2023 20:17:08 +0000
Received: by outflank-mailman (input) for mailman id 642621;
 Mon, 27 Nov 2023 20:17:06 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hsU-0006fp-Hy
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:06:46 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7cd1bef8-8d60-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:06:44 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7637E20103;
 Mon, 27 Nov 2023 21:06:44 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkMg1i8jO4OK; Mon, 27 Nov 2023 21:06:44 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 57E8020101;
 Mon, 27 Nov 2023 21:06:44 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hsS-00000005ctq-0JVc; Mon, 27 Nov 2023 21:06:44 +0100
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
X-Inumbo-ID: 7cd1bef8-8d60-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:06:44 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 24/32] Mini-OS: add EXPORT_SYMBOL() instances to
 blkfront.c
Message-ID: <20231127200644.owkleq4md4yu4d3g@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-25-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-25-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:15 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to blkfront.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  blkfront.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/blkfront.c b/blkfront.c
> index 8f140896..b0fc80d1 100644
> --- a/blkfront.c
> +++ b/blkfront.c
> @@ -23,9 +23,7 @@
>  /* Note: we really suppose non-preemptive threads.  */
>  
>  DECLARE_WAIT_QUEUE_HEAD(blkfront_queue);
> -
> -
> -
> +EXPORT_SYMBOL(blkfront_queue);
>  
>  #define BLK_RING_SIZE __RING_SIZE((struct blkif_sring *)0, PAGE_SIZE)
>  #define GRANT_INVALID_REF 0
> @@ -243,6 +241,7 @@ error:
>      free_blkfront(dev);
>      return NULL;
>  }
> +EXPORT_SYMBOL(init_blkfront);
>  
>  void shutdown_blkfront(struct blkfront_dev *dev)
>  {
> @@ -304,6 +303,7 @@ close:
>      if (!err)
>          free_blkfront(dev);
>  }
> +EXPORT_SYMBOL(shutdown_blkfront);
>  
>  static void blkfront_wait_slot(struct blkfront_dev *dev)
>  {
> @@ -386,6 +386,7 @@ void blkfront_aio(struct blkfront_aiocb *aiocbp, int write)
>  
>      if(notify) notify_remote_via_evtchn(dev->evtchn);
>  }
> +EXPORT_SYMBOL(blkfront_aio);
>  
>  static void blkfront_aio_cb(struct blkfront_aiocb *aiocbp, int ret)
>  {
> @@ -417,6 +418,7 @@ void blkfront_io(struct blkfront_aiocb *aiocbp, int write)
>      remove_waiter(w, blkfront_queue);
>      local_irq_restore(flags);
>  }
> +EXPORT_SYMBOL(blkfront_io);
>  
>  static void blkfront_push_operation(struct blkfront_dev *dev, uint8_t op, uint64_t id)
>  {
> @@ -444,6 +446,7 @@ void blkfront_aio_push_operation(struct blkfront_aiocb *aiocbp, uint8_t op)
>      struct blkfront_dev *dev = aiocbp->aio_dev;
>      blkfront_push_operation(dev, op, (uintptr_t) aiocbp);
>  }
> +EXPORT_SYMBOL(blkfront_aio_push_operation);
>  
>  void blkfront_sync(struct blkfront_dev *dev)
>  {
> @@ -473,6 +476,7 @@ void blkfront_sync(struct blkfront_dev *dev)
>      remove_waiter(w, blkfront_queue);
>      local_irq_restore(flags);
>  }
> +EXPORT_SYMBOL(blkfront_sync);
>  
>  int blkfront_aio_poll(struct blkfront_dev *dev)
>  {
> @@ -557,6 +561,7 @@ moretodo:
>  
>      return nr_consumed;
>  }
> +EXPORT_SYMBOL(blkfront_aio_poll);
>  
>  #ifdef HAVE_LIBC
>  static int blkfront_posix_rwop(struct file *file, uint8_t *buf, size_t count,
> @@ -773,4 +778,5 @@ int blkfront_open(struct blkfront_dev *dev)
>  
>      return dev->fd;
>  }
> +EXPORT_SYMBOL(blkfront_open);
>  #endif
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

