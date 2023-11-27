Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9C17FAB26
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:17:29 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642633.1002259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i2j-0000ID-Mb; Mon, 27 Nov 2023 20:17:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642633.1002259; Mon, 27 Nov 2023 20:17:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i2j-0000Fo-Ji; Mon, 27 Nov 2023 20:17:21 +0000
Received: by outflank-mailman (input) for mailman id 642633;
 Mon, 27 Nov 2023 20:17:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7htW-0006dX-Dr
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:07:50 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id a1c789d0-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:07:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7794F2010A;
 Mon, 27 Nov 2023 21:07:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 04JtsHMYQpdc; Mon, 27 Nov 2023 21:07:46 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 6181E20109;
 Mon, 27 Nov 2023 21:07:46 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7htS-00000005cv5-0epf; Mon, 27 Nov 2023 21:07:46 +0100
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
X-Inumbo-ID: a1c789d0-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:07:46 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 31/32] Mini-OS: add EXPORT_SYMBOL() instances to
 xenbus.c
Message-ID: <20231127200746.trsiimy3vkhun3u5@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-32-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-32-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:22 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to xenbus.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  xenbus.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/xenbus.c b/xenbus.c
> index 8bfd5bd4..eb9af055 100644
> --- a/xenbus.c
> +++ b/xenbus.c
> @@ -123,6 +123,7 @@ char **xenbus_wait_for_watch_return(xenbus_event_queue *queue)
>  
>      return &event->path;
>  }
> +EXPORT_SYMBOL(xenbus_wait_for_watch_return);
>  
>  void xenbus_wait_for_watch(xenbus_event_queue *queue)
>  {
> @@ -136,6 +137,7 @@ void xenbus_wait_for_watch(xenbus_event_queue *queue)
>      else
>          printk("unexpected path returned by watch\n");
>  }
> +EXPORT_SYMBOL(xenbus_wait_for_watch);
>  
>  void xenbus_release_wait_for_watch(xenbus_event_queue *queue)
>  {
> @@ -145,6 +147,7 @@ void xenbus_release_wait_for_watch(xenbus_event_queue *queue)
>      *queue = event;
>      wake_up(&xenbus_watch_queue);
>  }
> +EXPORT_SYMBOL(xenbus_release_wait_for_watch);
>  
>  char *xenbus_wait_for_value(const char *path, const char *value,
>                              xenbus_event_queue *queue)
> @@ -170,6 +173,7 @@ char *xenbus_wait_for_value(const char *path, const char *value,
>          xenbus_wait_for_watch(queue);
>      }
>  }
> +EXPORT_SYMBOL(xenbus_wait_for_value);
>  
>  char *xenbus_switch_state(xenbus_transaction_t xbt, const char *path,
>                            XenbusState state)
> @@ -220,6 +224,7 @@ exit:
>  
>      return msg;
>  }
> +EXPORT_SYMBOL(xenbus_switch_state);
>  
>  char *xenbus_wait_for_state_change(const char *path, XenbusState *state,
>                                     xenbus_event_queue *queue)
> @@ -249,6 +254,7 @@ char *xenbus_wait_for_state_change(const char *path, XenbusState *state,
>      }
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_wait_for_state_change);
>  
>  static void xenbus_read_data(char *buf, unsigned int len)
>  {
> @@ -602,6 +608,7 @@ struct xsd_sockmsg *xenbus_msg_reply(int type, xenbus_transaction_t trans,
>  
>      return rep;
>  }
> +EXPORT_SYMBOL(xenbus_msg_reply);
>  
>  static char *errmsg(struct xsd_sockmsg *rep)
>  {
> @@ -664,6 +671,7 @@ char *xenbus_ls(xenbus_transaction_t xbt, const char *pre, char ***contents)
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_ls);
>  
>  char *xenbus_read(xenbus_transaction_t xbt, const char *path, char **value)
>  {
> @@ -687,6 +695,7 @@ char *xenbus_read(xenbus_transaction_t xbt, const char *path, char **value)
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_read);
>  
>  char *xenbus_write(xenbus_transaction_t xbt, const char *path,
>                     const char *value)
> @@ -707,6 +716,7 @@ char *xenbus_write(xenbus_transaction_t xbt, const char *path,
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_write);
>  
>  char* xenbus_watch_path_token(xenbus_transaction_t xbt, const char *path,
>                                const char *token, xenbus_event_queue *events)
> @@ -738,6 +748,7 @@ char* xenbus_watch_path_token(xenbus_transaction_t xbt, const char *path,
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_watch_path_token);
>  
>  char* xenbus_unwatch_path_token(xenbus_transaction_t xbt, const char *path,
>                                  const char *token)
> @@ -771,6 +782,7 @@ char* xenbus_unwatch_path_token(xenbus_transaction_t xbt, const char *path,
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_unwatch_path_token);
>  
>  char *xenbus_rm(xenbus_transaction_t xbt, const char *path)
>  {
> @@ -787,6 +799,7 @@ char *xenbus_rm(xenbus_transaction_t xbt, const char *path)
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_rm);
>  
>  char *xenbus_get_perms(xenbus_transaction_t xbt, const char *path, char **value)
>  {
> @@ -810,6 +823,7 @@ char *xenbus_get_perms(xenbus_transaction_t xbt, const char *path, char **value)
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_get_perms);
>  
>  #define PERM_MAX_SIZE 32
>  char *xenbus_set_perms(xenbus_transaction_t xbt, const char *path, domid_t dom,
> @@ -834,6 +848,7 @@ char *xenbus_set_perms(xenbus_transaction_t xbt, const char *path, domid_t dom,
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_set_perms);
>  
>  char *xenbus_transaction_start(xenbus_transaction_t *xbt)
>  {
> @@ -855,6 +870,7 @@ char *xenbus_transaction_start(xenbus_transaction_t *xbt)
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_transaction_start);
>  
>  char *xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
>  {
> @@ -883,6 +899,7 @@ char *xenbus_transaction_end(xenbus_transaction_t t, int abort, int *retry)
>  
>      return NULL;
>  }
> +EXPORT_SYMBOL(xenbus_transaction_end);
>  
>  int xenbus_read_integer(const char *path)
>  {
> @@ -902,6 +919,7 @@ int xenbus_read_integer(const char *path)
>  
>      return t;
>  }
> +EXPORT_SYMBOL(xenbus_read_integer);
>  
>  int xenbus_read_uuid(const char *path, unsigned char uuid[16])
>  {
> @@ -935,6 +953,7 @@ int xenbus_read_uuid(const char *path, unsigned char uuid[16])
>  
>      return 1;
>  }
> +EXPORT_SYMBOL(xenbus_read_uuid);
>  
>  #define BUFFER_SIZE 256
>  static void xenbus_build_path(const char *dir, const char *node, char *res)
> @@ -957,6 +976,7 @@ char *xenbus_printf(xenbus_transaction_t xbt, const char* node,
>  
>      return xenbus_write(xbt,fullpath,val);
>  }
> +EXPORT_SYMBOL(xenbus_printf);
>  
>  domid_t xenbus_get_self_id(void)
>  {
> @@ -968,6 +988,7 @@ domid_t xenbus_get_self_id(void)
>  
>      return ret;
>  }
> +EXPORT_SYMBOL(xenbus_get_self_id);
>  
>  char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
>                           const char *node, char **value)
> @@ -978,6 +999,7 @@ char *xenbus_read_string(xenbus_transaction_t xbt, const char *dir,
>  
>      return xenbus_read(xbt, path, value);
>  }
> +EXPORT_SYMBOL(xenbus_read_string);
>  
>  char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
>                             const char *node, unsigned int *value)
> @@ -997,6 +1019,7 @@ char *xenbus_read_unsigned(xenbus_transaction_t xbt, const char *dir,
>  
>      return msg;
>  }
> +EXPORT_SYMBOL(xenbus_read_unsigned);
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

