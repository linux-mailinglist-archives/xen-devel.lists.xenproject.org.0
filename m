Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE2F7FAB1C
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:16:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642594.1002186 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i1G-0005Vw-18; Mon, 27 Nov 2023 20:15:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642594.1002186; Mon, 27 Nov 2023 20:15:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i1F-0005TQ-To; Mon, 27 Nov 2023 20:15:49 +0000
Received: by outflank-mailman (input) for mailman id 642594;
 Mon, 27 Nov 2023 20:15:48 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hsi-0006dX-U4
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:07:00 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8453dcf6-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:06:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 1279C20103;
 Mon, 27 Nov 2023 21:06:57 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SK12of8wNoGG; Mon, 27 Nov 2023 21:06:56 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id F034C20101;
 Mon, 27 Nov 2023 21:06:56 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hse-00000005cu5-36Er; Mon, 27 Nov 2023 21:06:56 +0100
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
X-Inumbo-ID: 8453dcf6-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:06:56 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 25/32] Mini-OS: add EXPORT_SYMBOL() instances to
 fbfront.c
Message-ID: <20231127200656.2ovyubjpfyhwy5ht@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-26-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-26-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:16 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to fbfront.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  fbfront.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/fbfront.c b/fbfront.c
> index 1b67f527..d4e28d0c 100644
> --- a/fbfront.c
> +++ b/fbfront.c
> @@ -201,6 +201,7 @@ error:
>      free_kbdfront(dev);
>      return NULL;
>  }
> +EXPORT_SYMBOL(init_kbdfront);
>  
>  int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n)
>  {
> @@ -239,7 +240,7 @@ int kbdfront_receive(struct kbdfront_dev *dev, union xenkbd_in_event *buf, int n
>  
>      return i;
>  }
> -
> +EXPORT_SYMBOL(kbdfront_receive);
>  
>  void shutdown_kbdfront(struct kbdfront_dev *dev)
>  {
> @@ -301,6 +302,7 @@ close_kbdfront:
>      if (!err)
>          free_kbdfront(dev);
>  }
> +EXPORT_SYMBOL(shutdown_kbdfront);
>  
>  #ifdef HAVE_LIBC
>  static int kbd_read(struct file *file, void *buf, size_t nbytes)
> @@ -351,6 +353,7 @@ int kbdfront_open(struct kbdfront_dev *dev)
>  
>      return dev->fd;
>  }
> +EXPORT_SYMBOL(kbdfront_open);
>  #endif
>  
>  
> @@ -451,6 +454,7 @@ int fbfront_receive(struct fbfront_dev *dev, union xenfb_in_event *buf, int n)
>  
>      return i;
>  }
> +EXPORT_SYMBOL(fbfront_receive);
>  
>  struct fbfront_dev *init_fbfront(char *_nodename, unsigned long *mfns, int width, int height, int depth, int stride, int n)
>  {
> @@ -617,6 +621,7 @@ error:
>      free_fbfront(dev);
>      return NULL;
>  }
> +EXPORT_SYMBOL(init_fbfront);
>  
>  static void fbfront_out_event(struct fbfront_dev *dev, union xenfb_out_event *event)
>  {
> @@ -668,6 +673,7 @@ void fbfront_update(struct fbfront_dev *dev, int x, int y, int width, int height
>      update.height = height;
>      fbfront_out_event(dev, (union xenfb_out_event *) &update);
>  }
> +EXPORT_SYMBOL(fbfront_update);
>  
>  void fbfront_resize(struct fbfront_dev *dev, int width, int height, int stride, int depth, int offset)
>  {
> @@ -681,6 +687,7 @@ void fbfront_resize(struct fbfront_dev *dev, int width, int height, int stride,
>      dev->offset = resize.offset = offset;
>      fbfront_out_event(dev, (union xenfb_out_event *) &resize);
>  }
> +EXPORT_SYMBOL(fbfront_resize);
>  
>  void shutdown_fbfront(struct fbfront_dev *dev)
>  {
> @@ -745,6 +752,7 @@ close_fbfront:
>      if (!err)
>          free_fbfront(dev);
>  }
> +EXPORT_SYMBOL(shutdown_fbfront);
>  
>  #ifdef HAVE_LIBC
>  static int fbfront_read(struct file *file, void *buf, size_t nbytes)
> @@ -794,5 +802,6 @@ int fbfront_open(struct fbfront_dev *dev)
>      file->dev = dev;
>      return dev->fd;
>  }
> +EXPORT_SYMBOL(fbfront_open);
>  #endif
>  
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

