Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2687FAAC9
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 21:01:09 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642490.1001988 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hmw-0002RE-RY; Mon, 27 Nov 2023 20:01:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642490.1001988; Mon, 27 Nov 2023 20:01:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hmw-0002OU-NX; Mon, 27 Nov 2023 20:01:02 +0000
Received: by outflank-mailman (input) for mailman id 642490;
 Mon, 27 Nov 2023 20:01:01 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hmu-0000uA-VS
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 20:01:00 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id adbfbbd9-8d5f-11ee-9b0e-b553b5be7939;
 Mon, 27 Nov 2023 21:00:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 10D4620103;
 Mon, 27 Nov 2023 21:00:57 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VL0c6YHIXZ3W; Mon, 27 Nov 2023 21:00:56 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id EC88D20101;
 Mon, 27 Nov 2023 21:00:56 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hmq-00000005clL-2z0A; Mon, 27 Nov 2023 21:00:56 +0100
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
X-Inumbo-ID: adbfbbd9-8d5f-11ee-9b0e-b553b5be7939
Date: Mon, 27 Nov 2023 21:00:56 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 10/32] Mini-OS: add EXPORT_SYMBOL() instances to
 lib/printf.c
Message-ID: <20231127200056.ycn6epvt376zj3cp@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-11-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-11-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:25:01 +0100, a ecrit:
> Add the needed instances of EXPORT_SYMBOL() to lib/printf.c.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  lib/printf.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/lib/printf.c b/lib/printf.c
> index f9e9d682..0e054957 100644
> --- a/lib/printf.c
> +++ b/lib/printf.c
> @@ -150,6 +150,7 @@ strtoul(const char *nptr, char **endptr, int base)
>                  *endptr = __DECONST(char *, any ? s - 1 : nptr);
>          return (acc);
>  }
> +EXPORT_SYMBOL(strtoul);
>  
>  /*
>   * Convert a string to a quad integer.
> @@ -241,6 +242,7 @@ strtoq(const char *nptr, char **endptr, int base)
>                  *endptr = __DECONST(char *, any ? s - 1 : nptr);
>          return (acc);
>  }
> +EXPORT_SYMBOL(strtoq);
>  
>  /*
>   * Convert a string to an unsigned quad integer.
> @@ -309,6 +311,7 @@ strtouq(const char *nptr, char **endptr, int base)
>                  *endptr = __DECONST(char *, any ? s - 1 : nptr);
>          return (acc);
>  }
> +EXPORT_SYMBOL(strtouq);
>  
>  /*
>   * Scaled down version of printf(3).
> @@ -585,6 +588,7 @@ number:
>          }
>  #undef PCHAR
>  }
> +EXPORT_SYMBOL(vsnprintf);
>  
>  /**
>   * snprintf - Format a string and place it in a buffer
> @@ -603,6 +607,7 @@ int snprintf(char * buf, size_t size, const char *fmt, ...)
>      va_end(args);
>      return i;
>  }
> +EXPORT_SYMBOL(snprintf);
>  
>  /**
>   * vsprintf - Format a string and place it in a buffer
> @@ -617,7 +622,7 @@ int vsprintf(char *buf, const char *fmt, va_list args)
>  {
>      return vsnprintf(buf, 0xFFFFFFFFUL, fmt, args);
>  }
> -
> +EXPORT_SYMBOL(vsprintf);
>  
>  /**
>   * sprintf - Format a string and place it in a buffer
> @@ -635,6 +640,7 @@ int sprintf(char * buf, const char *fmt, ...)
>      va_end(args);
>      return i;
>  }
> +EXPORT_SYMBOL(sprintf);
>  
>  /*
>   * Fill in the given table from the scanset at the given format
> @@ -1214,6 +1220,7 @@ input_failure:
>  match_failure:
>          return (nassigned);
>  }
> +EXPORT_SYMBOL(vsscanf);
>  
>  /**
>   * sscanf - Unformat a buffer into a list of arguments
> @@ -1231,5 +1238,6 @@ int sscanf(const char * buf, const char * fmt, ...)
>  	va_end(args);
>  	return i;
>  }
> +EXPORT_SYMBOL(sscanf);
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

