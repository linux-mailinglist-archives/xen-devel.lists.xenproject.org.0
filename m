Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C4C7FAACA
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:01:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642493.1001997 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hn9-00030m-7x; Mon, 27 Nov 2023 20:01:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642493.1001997; Mon, 27 Nov 2023 20:01:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hn9-0002xO-4T; Mon, 27 Nov 2023 20:01:15 +0000
Received: by outflank-mailman (input) for mailman id 642493;
 Mon, 27 Nov 2023 20:01:13 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hn7-0000uA-As
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:13 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b5c39b73-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:01:10 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7C91120103;
 Mon, 27 Nov 2023 21:01:10 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id K-OKW63BGZvO; Mon, 27 Nov 2023 21:01:10 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 655EC20101;
 Mon, 27 Nov 2023 21:01:10 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hn4-00000005cln-0hZf; Mon, 27 Nov 2023 21:01:10 +0100
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
X-Inumbo-ID: b5c39b73-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:01:10 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 12/32] Mini-OS: add EXPORT_SYMBOL() instances to
 lib/xmalloc.c
Message-ID: <20231127200110.qrz4jbdupe6hn7os@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-13-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-13-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:03 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lib/xmalloc.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lib/xmalloc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/lib/xmalloc.c b/lib/xmalloc.c
> index e16f161a..cc5db11e 100644
> --- a/lib/xmalloc.c
> +++ b/lib/xmalloc.c
> @@ -271,6 +271,7 @@ void *malloc(size_t size)
>  {
>      return _xmalloc(size, DEFAULT_ALIGN);
>  }
> +EXPORT_SYMBOL(malloc);
>  
>  void *realloc(void *ptr, size_t size)
>  {
> @@ -301,11 +302,13 @@ void *realloc(void *ptr, size_t size)
>  
>      return new;
>  }
> +EXPORT_SYMBOL(realloc);
>  
>  void free(void *ptr)
>  {
>      xfree(ptr);
>  }
> +EXPORT_SYMBOL(free);
>  #endif
>  
>  /*
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

