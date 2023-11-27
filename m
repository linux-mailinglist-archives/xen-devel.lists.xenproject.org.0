Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F40E7FAB2D
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:18:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642642.1002274 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i3Q-0001RF-8q; Mon, 27 Nov 2023 20:18:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642642.1002274; Mon, 27 Nov 2023 20:18:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7i3Q-0001OU-5T; Mon, 27 Nov 2023 20:18:04 +0000
Received: by outflank-mailman (input) for mailman id 642642;
 Mon, 27 Nov 2023 20:18:03 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7ht6-0006dX-2h
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:07:24 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 92b62f72-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:07:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 32E5920103;
 Mon, 27 Nov 2023 21:07:21 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id T2XCEQ0lmnyH; Mon, 27 Nov 2023 21:07:21 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 1D13420101;
 Mon, 27 Nov 2023 21:07:21 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7ht2-00000005cuX-3g25; Mon, 27 Nov 2023 21:07:20 +0100
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
X-Inumbo-ID: 92b62f72-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:07:20 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 28/32] Mini-OS: add EXPORT_SYMBOL() instances to
 tpmback.c
Message-ID: <20231127200720.awclc4nsrea7hn7c@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-29-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-29-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:19 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to tpmback.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  tpmback.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/tpmback.c b/tpmback.c
> index 22adbd32..ab0df127 100644
> --- a/tpmback.c
> +++ b/tpmback.c
> @@ -804,6 +804,7 @@ void* tpmback_get_opaque(domid_t domid, unsigned int handle)
>  
>     return tpmif->opaque;
>  }
> +EXPORT_SYMBOL(tpmback_get_opaque);
>  
>  int tpmback_set_opaque(domid_t domid, unsigned int handle, void *opaque)
>  {
> @@ -816,6 +817,7 @@ int tpmback_set_opaque(domid_t domid, unsigned int handle, void *opaque)
>     tpmif->opaque = opaque;
>     return 0;
>  }
> +EXPORT_SYMBOL(tpmback_set_opaque);
>  
>  unsigned char* tpmback_get_uuid(domid_t domid, unsigned int handle)
>  {
> @@ -827,6 +829,7 @@ unsigned char* tpmback_get_uuid(domid_t domid, unsigned int handle)
>  
>     return tpmif->uuid;
>  }
> +EXPORT_SYMBOL(tpmback_get_uuid);
>  
>  int tpmback_get_peercontext(domid_t domid, unsigned int handle, void* buffer, int buflen)
>  {
> @@ -838,6 +841,7 @@ int tpmback_get_peercontext(domid_t domid, unsigned int handle, void* buffer, in
>  
>     return evtchn_get_peercontext(tpmif->evtchn, buffer, buflen);
>  }
> +EXPORT_SYMBOL(tpmback_get_peercontext);
>  
>  static void event_listener(void)
>  {
> @@ -903,6 +907,7 @@ void init_tpmback(void (*open_cb)(domid_t, unsigned int), void (*close_cb)(domid
>     eventthread = create_thread("tpmback-listener", event_thread, NULL);
>  
>  }
> +EXPORT_SYMBOL(init_tpmback);
>  
>  void shutdown_tpmback(void)
>  {
> @@ -923,6 +928,7 @@ void shutdown_tpmback(void)
>     wake_up(&waitq);
>     schedule();
>  }
> +EXPORT_SYMBOL(shutdown_tpmback);
>  
>  static void init_tpmcmd(tpmcmd_t* tpmcmd, domid_t domid, unsigned int handle, void *opaque)
>  {
> @@ -1061,6 +1067,7 @@ tpmcmd_t* tpmback_req_any(void)
>     TPMBACK_ERR("backend request ready flag was set but no interfaces were actually ready\n");
>     return NULL;
>  }
> +EXPORT_SYMBOL(tpmback_req_any);
>  
>  tpmcmd_t* tpmback_req(domid_t domid, unsigned int handle)
>  {
> @@ -1081,6 +1088,7 @@ tpmcmd_t* tpmback_req(domid_t domid, unsigned int handle)
>  
>     return get_request(tpmif);
>  }
> +EXPORT_SYMBOL(tpmback_req);
>  
>  void tpmback_resp(tpmcmd_t* tpmcmd)
>  {
> @@ -1108,6 +1116,7 @@ end:
>     free(tpmcmd);
>     return;
>  }
> +EXPORT_SYMBOL(tpmback_resp);
>  
>  int tpmback_wait_for_frontend_connect(domid_t *domid, unsigned int *handle)
>  {
> @@ -1125,8 +1134,10 @@ int tpmback_wait_for_frontend_connect(domid_t *domid, unsigned int *handle)
>  
>     return 0;
>  }
> +EXPORT_SYMBOL(tpmback_wait_for_frontend_connect);
>  
>  int tpmback_num_frontends(void)
>  {
>     return gtpmdev.num_tpms;
>  }
> +EXPORT_SYMBOL(tpmback_num_frontends);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

