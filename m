Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3084D7FAAB8
	for <lists+xen-devel@lfdr.de>; Mon, 27 Nov 2023 20:57:58 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.642450.1001904 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hjp-0006Vk-Ng; Mon, 27 Nov 2023 19:57:49 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 642450.1001904; Mon, 27 Nov 2023 19:57:49 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1r7hjp-0006Tb-Kq; Mon, 27 Nov 2023 19:57:49 +0000
Received: by outflank-mailman (input) for mailman id 642450;
 Mon, 27 Nov 2023 19:57:48 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=j0zc=HI=ens-lyon.org=samuel.thibault@bounce.ens-lyon.org>)
 id 1r7hjo-0006PP-Cc
 for xen-devel@lists.xenproject.org; Mon, 27 Nov 2023 19:57:48 +0000
Received: from sonata.ens-lyon.org (sonata.ens-lyon.org [140.77.166.138])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 3c231093-8d5f-11ee-98e2-6d05b1d4d9a1;
 Mon, 27 Nov 2023 20:57:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by sonata.ens-lyon.org (Postfix) with ESMTP id 7041020103;
 Mon, 27 Nov 2023 20:57:46 +0100 (CET)
Received: from sonata.ens-lyon.org ([127.0.0.1])
 by localhost (sonata.ens-lyon.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bVN015LGAd3r; Mon, 27 Nov 2023 20:57:46 +0100 (CET)
Received: from begin (aamiens-653-1-111-57.w83-192.abo.wanadoo.fr
 [83.192.234.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by sonata.ens-lyon.org (Postfix) with ESMTPSA id 579BE20101;
 Mon, 27 Nov 2023 20:57:46 +0100 (CET)
Received: from samy by begin with local (Exim 4.97)
 (envelope-from <samuel.thibault@ens-lyon.org>)
 id 1r7hjm-00000005cgV-0IDI; Mon, 27 Nov 2023 20:57:46 +0100
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
X-Inumbo-ID: 3c231093-8d5f-11ee-98e2-6d05b1d4d9a1
Date: Mon, 27 Nov 2023 20:57:46 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v3 02/32] Mini-OS: explicitly mark symbols to be visible
 for apps
Message-ID: <20231127195746.27mkak6honhb445h@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20231127102523.28003-1-jgross@suse.com>
 <20231127102523.28003-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231127102523.28003-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le lun. 27 nov. 2023 11:24:53 +0100, a ecrit:
> Add an EXPORT_SYMBOL() macro to explicitly mark a symbol to be visible
> for an app or library linked with Mini-OS. This prepares hiding all
> other symbols from external components, avoiding any problems with
> duplicate symbol names.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  .gitignore       |  1 +
>  Makefile         |  3 ++-
>  include/export.h | 10 ++++++++++
>  include/lib.h    |  1 +
>  4 files changed, 14 insertions(+), 1 deletion(-)
>  create mode 100644 include/export.h
> 
> diff --git a/.gitignore b/.gitignore
> index abef46b2..bacf787e 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -16,3 +16,4 @@ mini-os.gz
>  minios-config.mk
>  mini-os-debug
>  mini-os-debug.gz
> +syms
> diff --git a/Makefile b/Makefile
> index 85c6db75..588496cb 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -166,10 +166,11 @@ $(OBJ_DIR)/arch/x86/minios-x86%.lds:  arch/x86/minios-x86.lds.S
>  
>  $(OBJ_DIR)/$(TARGET)-kern.o: $(OBJS) arch_lib $(OBJ_DIR)/$(TARGET_ARCH_DIR)/minios-$(MINIOS_TARGET_ARCH).lds
>  	$(LD) -r $(LDFLAGS) $(HEAD_OBJ) $(OBJS) $(LDARCHLIB) -o $@
> +	$(OBJCOPY) --dump-section .export_symbol=$(OBJ_DIR)/syms $@
>  
>  $(OBJ_DIR)/$(TARGET): $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O)
>  	$(LD) -r $(LDFLAGS) $(OBJ_DIR)/$(TARGET)-kern.o $(APP_O) $(LDLIBS) -o $@.o
> -	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* -G _start $@.o $@.o
> +	$(OBJCOPY) -w -G $(GLOBAL_PREFIX)* -G _start --remove-section=.export_symbol $@.o $@.o
>  	$(LD) $(LDFLAGS) $(LDFLAGS_FINAL) $@.o $(EXTRA_OBJS) -o $@-debug
>  	strip -s $@-debug -o $@
>  	gzip -n -f -9 -c $@-debug >$@-debug.gz
> diff --git a/include/export.h b/include/export.h
> new file mode 100644
> index 00000000..7140ac68
> --- /dev/null
> +++ b/include/export.h
> @@ -0,0 +1,10 @@
> +#ifndef _EXPORT_H_
> +#define _EXPORT_H_
> +
> +/* Mark a symbol to be visible for apps and libs. */
> +#define EXPORT_SYMBOL(sym)          \
> +    asm(".section .export_symbol\n" \
> +        ".ascii \""#sym"\\n\"\n"    \
> +        ".previous\n")
> +
> +#endif /* _EXPORT_H_ */
> diff --git a/include/lib.h b/include/lib.h
> index dd68985a..abd4e9ab 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -53,6 +53,7 @@
>  #include <stddef.h>
>  #include <xen/xen.h>
>  #include <xen/event_channel.h>
> +#include <mini-os/export.h>
>  #include "gntmap.h"
>  
>  #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 6)
> -- 
> 2.35.3
> 

-- 
Samuel
---
Pour une évaluation indépendante, transparente et rigoureuse !
Je soutiens la Commission d'Évaluation de l'Inria.

