Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DA36C76DD5E
	for <lists+xen-devel@lfdr.de>; Thu,  3 Aug 2023 03:41:03 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.575925.901476 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNJa-0001Cf-AM; Thu, 03 Aug 2023 01:39:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 575925.901476; Thu, 03 Aug 2023 01:39:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1qRNJa-0001B2-3z; Thu, 03 Aug 2023 01:39:46 +0000
Received: by outflank-mailman (input) for mailman id 575925;
 Thu, 03 Aug 2023 01:39:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=hVX3=DU=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1qRNJZ-0001As-Ck
 for xen-devel@lists.xenproject.org; Thu, 03 Aug 2023 01:39:45 +0000
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 9e32b50d-319e-11ee-b267-6b7b168915f2;
 Thu, 03 Aug 2023 03:39:43 +0200 (CEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CA4B261B71;
 Thu,  3 Aug 2023 01:39:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C845C433C8;
 Thu,  3 Aug 2023 01:39:39 +0000 (UTC)
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
X-Inumbo-ID: 9e32b50d-319e-11ee-b267-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691026781;
	bh=cq+sPioqIkCaTlixIBx1YmCuR88cVtypYWRXHYlNyCg=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Z+44jwIYxeN6zdEdjp9Wuhq57+o7Qw3p748gm4IePJx2LjxsH0f+/OiVERDXfz1sU
	 74/AR8Kli9TeMGz0fZhuGNmiUAjNpMXMz2idT/NOgOzkzUu4M0rcSmKkP2wHQSwz9i
	 d1SaIRu9xBV/PSL3JBoJAYWxVfoLMlugkwTYyGvfv/LwRxYoZxwDq5nwWs3fK5F38n
	 DJuAcbwqYroKYp1t37nk4XKkw4BqJfs816YAZgae94pLUzaSG283+E5870hbTzOEhs
	 iIAc1w6gJoAe4PTCdSkd5Ge4c88nz1nGnkfHAI2N7TEOwTvhO3S8zbgDIxGAaZaS+m
	 Wkwno2khz43Nw==
Date: Wed, 2 Aug 2023 18:39:38 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Federico Serafini <federico.serafini@bugseng.com>
cc: xen-devel@lists.xenproject.org, consulting@bugseng.com, 
    Andrew Cooper <andrew.cooper3@citrix.com>, 
    George Dunlap <george.dunlap@citrix.com>, Jan Beulich <jbeulich@suse.com>, 
    Julien Grall <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, 
    Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH] xen/string: add missing parameter names
In-Reply-To: <e771afd1e1f6906a440883f4e6ee94847cbc7f7e.1690961143.git.federico.serafini@bugseng.com>
Message-ID: <alpine.DEB.2.22.394.2308021838280.2127516@ubuntu-linux-20-04-desktop>
References: <e771afd1e1f6906a440883f4e6ee94847cbc7f7e.1690961143.git.federico.serafini@bugseng.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 2 Aug 2023, Federico Serafini wrote:
> Add missing parameter names to address violations of MISRA C:2012
> Rule 8.2 ("Function types shall be in prototype form with named
> parameters").
> 
> No functional changes.
> 
> Signed-off-by: Federico Serafini <federico.serafini@bugseng.com>
> ---
>  xen/include/xen/string.h | 42 ++++++++++++++++++++--------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
> 
> diff --git a/xen/include/xen/string.h b/xen/include/xen/string.h
> index b4d2217a96..805947d82b 100644
> --- a/xen/include/xen/string.h
> +++ b/xen/include/xen/string.h
> @@ -12,27 +12,27 @@
>  #define strncpy __xen_has_no_strncpy__
>  #define strncat __xen_has_no_strncat__
>  
> -size_t strlcpy(char *, const char *, size_t);
> -size_t strlcat(char *, const char *, size_t);
> -int strcmp(const char *, const char *);
> -int strncmp(const char *, const char *, size_t);
> -int strcasecmp(const char *, const char *);
> -int strncasecmp(const char *, const char *, size_t);
> -char *strchr(const char *, int);
> -char *strrchr(const char *, int);
> -char *strstr(const char *, const char *);
> -size_t strlen(const char *);
> -size_t strnlen(const char *, size_t);
> -char *strpbrk(const char *, const char *);
> -char *strsep(char **, const char *);
> -size_t strspn(const char *, const char *);
> -
> -void *memset(void *, int, size_t);
> -void *memcpy(void *, const void *, size_t);
> -void *memmove(void *, const void *, size_t);
> -int memcmp(const void *, const void *, size_t);
> -void *memchr(const void *, int, size_t);
> -void *memchr_inv(const void *, int, size_t);
> +size_t strlcpy(char *dest, const char *src, size_t size);
> +size_t strlcat(char *dest, const char *src, size_t size);
> +int strcmp(const char *cs, const char *ct);
> +int strncmp(const char *cs, const char *ct, size_t count);
> +int strcasecmp(const char *s1, const char *s2);
> +int strncasecmp(const char *s1, const char *s2, size_t len);
> +char *strchr(const char *s, int c);
> +char *strrchr(const char *s, int c);
> +char *strstr(const char *s1, const char *s2);
> +size_t strlen(const char *s);
> +size_t strnlen(const char *s, size_t count);
> +char *strpbrk(const char *cs, const char *ct);
> +char *strsep(char **s, const char *ct);
> +size_t strspn(const char *s, const char *accept);
> +
> +void *memset(void *s, int c, size_t n);

This should be

void *memset(void *s, int c, size_t count);


> +void *memcpy(void *dest, const void *src, size_t count);
> +void *memmove(void *dest, const void *src, size_t count);
> +int memcmp(const void *cs, const void *ct, size_t count);
> +void *memchr(const void *s, int c, size_t n);
> +void *memchr_inv(const void *s, int c, size_t n);
>  
>  #include <asm/string.h>
>  
> -- 
> 2.34.1
> 

