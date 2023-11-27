Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3642C7FAAF8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:06:25 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642534.1002105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hs0-0007qN-LS; Mon, 27 Nov 2023 20:06:16 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642534.1002105; Mon, 27 Nov 2023 20:06:16 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hs0-0007iZ-G4; Mon, 27 Nov 2023 20:06:16 +0000
Received: by outflank-mailman (input) for mailman id 642534;
 Mon, 27 Nov 2023 20:06:15 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hrz-0006dX-1G
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:06:15 +0000
Received: from sonata.ens-lyon.org (domu-toccata.ens-lyon.fr [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6980603f-8d60-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:06:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 0713720103;
 Mon, 27 Nov 2023 21:06:12 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNbRNVguOyXE; Mon, 27 Nov 2023 21:06:11 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id E153920101;
 Mon, 27 Nov 2023 21:06:11 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hrv-00000005ct6-2Zh6; Mon, 27 Nov 2023 21:06:11 +0100
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
X-Inumbo-ID: 6980603f-8d60-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:06:11 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 20/32] Mini-OS: add EXPORT_SYMBOL() instances to lock.c
Message-ID: <20231127200611.hfwgkwgol7lbl5fo@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-21-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-21-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:11 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lock.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lock.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/lock.c b/lock.c
> index 61194e5d..8f58344f 100644
> --- a/lock.c
> +++ b/lock.c
> @@ -17,6 +17,7 @@ int ___lock_init(_LOCK_T *lock)
>      init_waitqueue_head(&lock->wait);
>      return 0;
>  }
> +EXPORT_SYMBOL(___lock_init);
>  
>  int ___lock_acquire(_LOCK_T *lock)
>  {
> @@ -32,6 +33,7 @@ int ___lock_acquire(_LOCK_T *lock)
>      local_irq_restore(flags);
>      return 0;
>  }
> +EXPORT_SYMBOL(___lock_acquire);
>  
>  int ___lock_try_acquire(_LOCK_T *lock)
>  {
> @@ -45,6 +47,7 @@ int ___lock_try_acquire(_LOCK_T *lock)
>      local_irq_restore(flags);
>      return ret;
>  }
> +EXPORT_SYMBOL(___lock_try_acquire);
>  
>  int ___lock_release(_LOCK_T *lock)
>  {
> @@ -55,7 +58,7 @@ int ___lock_release(_LOCK_T *lock)
>      local_irq_restore(flags);
>      return 0;
>  }
> -
> +EXPORT_SYMBOL(___lock_release);
>  
>  int ___lock_init_recursive(_LOCK_RECURSIVE_T *lock)
>  {
> @@ -63,6 +66,7 @@ int ___lock_init_recursive(_LOCK_RECURSIVE_T *lock)
>      init_waitqueue_head(&lock->wait);
>      return 0;
>  }
> +EXPORT_SYMBOL(___lock_init_recursive);
>  
>  int ___lock_acquire_recursive(_LOCK_RECURSIVE_T *lock)
>  {
> @@ -81,6 +85,7 @@ int ___lock_acquire_recursive(_LOCK_RECURSIVE_T *lock)
>      lock->count++;
>      return 0;
>  }
> +EXPORT_SYMBOL(___lock_acquire_recursive);
>  
>  int ___lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock)
>  {
> @@ -95,6 +100,7 @@ int ___lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock)
>      local_irq_restore(flags);
>      return ret;
>  }
> +EXPORT_SYMBOL(___lock_try_acquire_recursive);
>  
>  int ___lock_release_recursive(_LOCK_RECURSIVE_T *lock)
>  {
> @@ -108,5 +114,6 @@ int ___lock_release_recursive(_LOCK_RECURSIVE_T *lock)
>      local_irq_restore(flags);
>      return 0;
>  }
> +EXPORT_SYMBOL(___lock_release_recursive);
>  
>  #endif
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

