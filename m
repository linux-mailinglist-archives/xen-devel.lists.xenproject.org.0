Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE957FAAC7
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:00:46 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642474.1001956 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hma-0001IF-5j; Mon, 27 Nov 2023 20:00:40 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642474.1001956; Mon, 27 Nov 2023 20:00:40 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hma-0001GQ-1j; Mon, 27 Nov 2023 20:00:40 +0000
Received: by outflank-mailman (input) for mailman id 642474;
 Mon, 27 Nov 2023 20:00:38 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hmY-0001F2-Mv
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:00:38 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id a236a44c-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 21:00:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id AF9B520103;
 Mon, 27 Nov 2023 21:00:37 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gz6bX0nBahxl; Mon, 27 Nov 2023 21:00:37 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 9856220101;
 Mon, 27 Nov 2023 21:00:37 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hmX-00000005ckq-1a3W; Mon, 27 Nov 2023 21:00:37 +0100
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
X-Inumbo-ID: a236a44c-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 21:00:37 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 08/32] Mini-OS: add EXPORT_SYMBOL() instances to
 lib/string.c
Message-ID: <20231127200037.zt563kttl2eltws3@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-9-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-9-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:24:59 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lib/string.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lib/string.c | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/lib/string.c b/lib/string.c
> index 8b241464..b0b628c6 100644
> --- a/lib/string.c
> +++ b/lib/string.c
> @@ -19,6 +19,7 @@
>   */
>  
>  #include <strings.h>
> +#include <mini-os/export.h>
>  
>  /* newlib defines ffs but not ffsll or ffsl */
>  int __ffsti2 (long long int lli)
> @@ -49,11 +50,13 @@ int ffsl (long int li)
>  {
>      return __ffsti2 ((long long int) li);
>  }
> +EXPORT_SYMBOL(ffsl);
>  
>  int ffsll (long long int lli)
>  {
>      return __ffsti2 (lli);
>  }
> +EXPORT_SYMBOL(ffsll);
>  
>  #if !defined HAVE_LIBC
>  
> @@ -72,6 +75,7 @@ int memcmp(const void * cs,const void * ct,size_t count)
>  			break;
>  	return res;
>  }
> +EXPORT_SYMBOL(memcmp);
>  
>  void * memcpy(void * dest,const void *src,size_t count)
>  {
> @@ -83,6 +87,7 @@ void * memcpy(void * dest,const void *src,size_t count)
>  
>  	return dest;
>  }
> +EXPORT_SYMBOL(memcpy);
>  
>  int strncmp(const char * cs,const char * ct,size_t count)
>  {
> @@ -96,6 +101,7 @@ int strncmp(const char * cs,const char * ct,size_t count)
>  
>  	return __res;
>  }
> +EXPORT_SYMBOL(strncmp);
>  
>  int strcmp(const char * cs,const char * ct)
>  {
> @@ -108,6 +114,7 @@ int strcmp(const char * cs,const char * ct)
>  
>          return __res;
>  }
> +EXPORT_SYMBOL(strcmp);
>  
>  char * strcpy(char * dest,const char *src)
>  {
> @@ -117,6 +124,7 @@ char * strcpy(char * dest,const char *src)
>                  /* nothing */;
>          return tmp;
>  }
> +EXPORT_SYMBOL(strcpy);
>  
>  char * strncpy(char * dest,const char *src,size_t count)
>  {
> @@ -127,6 +135,7 @@ char * strncpy(char * dest,const char *src,size_t count)
>  
>          return tmp;
>  }
> +EXPORT_SYMBOL(strncpy);
>  
>  void * memset(void * s,int c,size_t count)
>  {
> @@ -137,6 +146,7 @@ void * memset(void * s,int c,size_t count)
>  
>          return s;
>  }
> +EXPORT_SYMBOL(memset);
>  
>  size_t strnlen(const char * s, size_t count)
>  {
> @@ -146,6 +156,7 @@ size_t strnlen(const char * s, size_t count)
>                  /* nothing */;
>          return sc - s;
>  }
> +EXPORT_SYMBOL(strnlen);
>  
>  
>  char * strcat(char * dest, const char * src)
> @@ -159,6 +170,7 @@ char * strcat(char * dest, const char * src)
>      
>      return tmp;
>  }
> +EXPORT_SYMBOL(strcat);
>  
>  size_t strlen(const char * s)
>  {
> @@ -168,6 +180,7 @@ size_t strlen(const char * s)
>  		/* nothing */;
>  	return sc - s;
>  }
> +EXPORT_SYMBOL(strlen);
>  
>  char * strchr(const char * s, int c)
>  {
> @@ -176,6 +189,7 @@ char * strchr(const char * s, int c)
>                          return NULL;
>          return (char *)s;
>  }
> +EXPORT_SYMBOL(strchr);
>  
>  char * strrchr(const char * s, int c)
>  {
> @@ -185,6 +199,7 @@ char * strrchr(const char * s, int c)
>                          res = s;
>          return (char *)res;
>  }
> +EXPORT_SYMBOL(strrchr);
>  
>  char * strstr(const char * s1,const char * s2)
>  {
> @@ -202,6 +217,7 @@ char * strstr(const char * s1,const char * s2)
>          }
>          return NULL;
>  }
> +EXPORT_SYMBOL(strstr);
>  
>  char *strdup(const char *x)
>  {
> @@ -211,6 +227,7 @@ char *strdup(const char *x)
>      memcpy(res, x, l + 1);
>      return res;
>  }
> +EXPORT_SYMBOL(strdup);
>  
>  int ffs(int i)
>  {
> @@ -224,5 +241,6 @@ int ffs(int i)
>     } while (i);
>     return 0;
>  }
> +EXPORT_SYMBOL(ffs);
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

