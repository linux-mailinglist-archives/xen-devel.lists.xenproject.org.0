Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3AB7FAAF7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:24 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642533.1002098 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hs0-0007ii-7l; Mon, 27 Nov 2023 20:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642533.1002098; Mon, 27 Nov 2023 20:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hs0-0007fO-1v; Mon, 27 Nov 2023 20:06:16 +0000
Received: by outflank-mailman (input) for mailman id 642533;
 Mon, 27 Nov 2023 20:06:14 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hnH-0000uA-Gn
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:23 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id bb2d8ada-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:01:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 9137120103;
 Mon, 27 Nov 2023 21:01:19 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OKZg4NF0gxqH; Mon, 27 Nov 2023 21:01:19 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 7A1CB20101;
 Mon, 27 Nov 2023 21:01:19 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hnD-00000005cm1-12b9; Mon, 27 Nov 2023 21:01:19 +0100
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
X-Inumbo-ID: bb2d8ada-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:01:19 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 13/32] Mini-OS: add EXPORT_SYMBOL() instances to
 lib/xs.c
Message-ID: <20231127200119.n37jqabhpdvlgfy6@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-14-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-14-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:04 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lib/xs.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lib/xs.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/lib/xs.c b/lib/xs.c
> index 7fe9b03e..ff0768c1 100644
> --- a/lib/xs.c
> +++ b/lib/xs.c
> @@ -64,6 +64,7 @@ struct xs_handle *xs_daemon_open()
>      printk("xs_daemon_open -> %d, %p\n", fd, &file->dev);
>      return (void*)(intptr_t) fd;
>  }
> +EXPORT_SYMBOL(xs_daemon_open);
>  
>  void xs_daemon_close(struct xs_handle *h)
>  {
> @@ -74,6 +75,7 @@ int xs_fileno(struct xs_handle *h)
>  {
>      return _xs_fileno(h);
>  }
> +EXPORT_SYMBOL(xs_fileno);
>  
>  void *xs_read(struct xs_handle *h, xs_transaction_t t,
>  	     const char *path, unsigned int *len)
> @@ -92,6 +94,7 @@ void *xs_read(struct xs_handle *h, xs_transaction_t t,
>  	*len = strlen(value);
>      return value;
>  }
> +EXPORT_SYMBOL(xs_read);
>  
>  bool xs_write(struct xs_handle *h, xs_transaction_t t,
>  	      const char *path, const void *data, unsigned int len)
> @@ -110,6 +113,7 @@ bool xs_write(struct xs_handle *h, xs_transaction_t t,
>      }
>      return true;
>  }
> +EXPORT_SYMBOL(xs_write);
>  
>  static bool xs_bool(char *reply)
>  {
> @@ -123,6 +127,7 @@ bool xs_rm(struct xs_handle *h, xs_transaction_t t, const char *path)
>  {
>      return xs_bool(xenbus_rm(t, path));
>  }
> +EXPORT_SYMBOL(xs_rm);
>  
>  static void *xs_talkv(struct xs_handle *h, xs_transaction_t t,
>  		enum xsd_sockmsg_type type,
> @@ -163,6 +168,7 @@ char *xs_get_domain_path(struct xs_handle *h, unsigned int domid)
>  
>      return xs_single(h, XBT_NULL, XS_GET_DOMAIN_PATH, domid_str, NULL);
>  }
> +EXPORT_SYMBOL(xs_get_domain_path);
>  
>  char **xs_directory(struct xs_handle *h, xs_transaction_t t,
>  		    const char *path, unsigned int *num)
> @@ -199,6 +205,7 @@ char **xs_directory(struct xs_handle *h, xs_transaction_t t,
>      free(res);
>      return entries;
>  }
> +EXPORT_SYMBOL(xs_directory);
>  
>  bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>  {
> @@ -208,6 +215,7 @@ bool xs_watch(struct xs_handle *h, const char *path, const char *token)
>      return xs_bool(xenbus_watch_path_token(XBT_NULL, path, token,
>                                             (xenbus_event_queue *)&file->dev));
>  }
> +EXPORT_SYMBOL(xs_watch);
>  
>  char **xs_read_watch(struct xs_handle *h, unsigned int *num)
>  {
> @@ -220,10 +228,12 @@ char **xs_read_watch(struct xs_handle *h, unsigned int *num)
>      *num = 2;
>      return (char **) &event->path;
>  }
> +EXPORT_SYMBOL(xs_read_watch);
>  
>  bool xs_unwatch(struct xs_handle *h, const char *path, const char *token)
>  {
>      printk("xs_unwatch(%s, %s)\n", path, token);
>      return xs_bool(xenbus_unwatch_path_token(XBT_NULL, path, token));
>  }
> +EXPORT_SYMBOL(xs_unwatch);
>  #endif
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

