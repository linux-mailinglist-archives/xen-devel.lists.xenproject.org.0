Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6156B86B1CF
	for <lists+xen-devel@lfdr.de>; Wed, 28 Feb 2024 15:30:53 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.686667.1068952 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKx8-0004Kp-5Z; Wed, 28 Feb 2024 14:30:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 686667.1068952; Wed, 28 Feb 2024 14:30:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1rfKx8-0004Ix-2I; Wed, 28 Feb 2024 14:30:34 +0000
Received: by outflank-mailman (input) for mailman id 686667;
 Wed, 28 Feb 2024 14:30:32 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=LpFc=KF=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1rfKx6-0004IV-Od
 for xen-devel@lists.xenproject.org; Wed, 28 Feb 2024 14:30:32 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id eb2008fc-d645-11ee-a1ee-f123f15fe8a2;
 Wed, 28 Feb 2024 15:30:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 898A7A0337;
 Wed, 28 Feb 2024 15:30:27 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cN4d9Sti-1jD; Wed, 28 Feb 2024 15:30:27 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 3D3A4A032E;
 Wed, 28 Feb 2024 15:30:27 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1rfKx0-000000029w5-2xGp; Wed, 28 Feb 2024 15:30:26 +0100
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
X-Inumbo-ID: eb2008fc-d645-11ee-a1ee-f123f15fe8a2
Date: Wed, 28 Feb 2024 15:30:26 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH] Mini-OS: add symbol exports for xenstore stubdom
Message-ID: <20240228143026.sen3xzazvpqbmggp@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20240226083955.19350-1-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240226083955.19350-1-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 26 févr. 2024 09:39:55 +0100, a ecrit:
> Xenstore stubdom needs some more symbols exported.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  xenbus.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/xenbus.c b/xenbus.c
> index eb9af055..686428a4 100644
> --- a/xenbus.c
> +++ b/xenbus.c
> @@ -45,6 +45,7 @@
>  #endif
>  
>  struct xenstore_domain_interface *xenstore_buf;
> +EXPORT_SYMBOL(xenstore_buf);
>  static DECLARE_WAIT_QUEUE_HEAD(xb_waitq);
>  DECLARE_WAIT_QUEUE_HEAD(xenbus_watch_queue);
>  static __DECLARE_SEMAPHORE_GENERIC(xb_write_sem, 1);
> @@ -70,6 +71,7 @@ static struct xenbus_req_info req_info[NR_REQS];
>  static char *errmsg(struct xsd_sockmsg *rep);
>  
>  uint32_t xenbus_evtchn;
> +EXPORT_SYMBOL(xenbus_evtchn);
>  
>  #ifdef CONFIG_PARAVIRT
>  void get_xenbus(void *p)
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

