Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AACD27FAAC8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:01:00 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642479.1001974 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hmi-0001kx-HO; Mon, 27 Nov 2023 20:00:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642479.1001974; Mon, 27 Nov 2023 20:00:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hmi-0001hm-Cw; Mon, 27 Nov 2023 20:00:48 +0000
Received: by outflank-mailman (input) for mailman id 642479;
 Mon, 27 Nov 2023 20:00:47 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hmh-0001F2-Cj
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:00:47 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a74bea20-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:00:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 3D50720103;
 Mon, 27 Nov 2023 21:00:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ex_sFNYH70mL; Mon, 27 Nov 2023 21:00:46 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 2507D20101;
 Mon, 27 Nov 2023 21:00:46 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hmf-00000005cl5-3hAo; Mon, 27 Nov 2023 21:00:45 +0100
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
X-Inumbo-ID: a74bea20-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:00:45 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 09/32] Mini-OS: add EXPORT_SYMBOL() instances to
 lib/math.c
Message-ID: <20231127200045.l6afamiqx3l4z4hd@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-10-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-10-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:00 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lib/math.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lib/math.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/lib/math.c b/lib/math.c
> index b98cc1d2..9ee9fcdb 100644
> --- a/lib/math.c
> +++ b/lib/math.c
> @@ -338,6 +338,7 @@ __qdivrem(u_quad_t uq, u_quad_t vq, u_quad_t *arq)
>  	tmp.ul[L] = COMBINE(qspace[3], qspace[4]);
>  	return (tmp.q);
>  }
> +EXPORT_SYMBOL(__qdivrem);
>  
>  /*
>   * From
> @@ -365,6 +366,7 @@ __divdi3(quad_t a, quad_t b)
>  	uq = __qdivrem(ua, ub, (u_quad_t *)0);
>  	return (neg ? -uq : uq);
>  }
> +EXPORT_SYMBOL(__divdi3);
>  
>  /*
>   * From
> @@ -379,6 +381,7 @@ __udivdi3(u_quad_t a, u_quad_t b)
>  {
>  	return (__qdivrem(a, b, (u_quad_t *)0));
>  }
> +EXPORT_SYMBOL(__udivdi3);
>  
>  /*
>   * From
> @@ -396,6 +399,7 @@ __umoddi3(u_quad_t a, u_quad_t b)
>  	(void)__qdivrem(a, b, &r);
>  	return (r);
>  }
> +EXPORT_SYMBOL(__umoddi3);
>  
>  /*
>   * Returns the quotient and places remainder in r
> @@ -405,6 +409,7 @@ __udivmoddi4(u_quad_t a, u_quad_t b, u_quad_t *r)
>  {
>  	return __qdivrem(a, b, r);
>  }
> +EXPORT_SYMBOL(__udivmoddi4);
>  
>  /*
>   * From
> @@ -434,3 +439,4 @@ __moddi3(quad_t a, quad_t b)
>  	(void)__qdivrem(ua, ub, &ur);
>  	return (neg ? -ur : ur);
>  }
> +EXPORT_SYMBOL(__moddi3);
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

