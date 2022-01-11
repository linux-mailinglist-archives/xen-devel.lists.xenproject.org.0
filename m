Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D24948B7AF
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 20:55:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256038.439145 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NEx-0006Zu-6r; Tue, 11 Jan 2022 19:55:31 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256038.439145; Tue, 11 Jan 2022 19:55:31 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NEx-0006XH-33; Tue, 11 Jan 2022 19:55:31 +0000
Received: by outflank-mailman (input) for mailman id 256038;
 Tue, 11 Jan 2022 19:55:30 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7NEw-0006VC-1V
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 19:55:30 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 6c88fe59-7318-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 20:55:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 5A1B8678;
 Tue, 11 Jan 2022 20:55:27 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DRJwrHkXCUFE; Tue, 11 Jan 2022 20:55:26 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id DFBEC261;
 Tue, 11 Jan 2022 20:55:25 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7NEr-00FFHq-4g;
 Tue, 11 Jan 2022 20:55:25 +0100
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
X-Inumbo-ID: 6c88fe59-7318-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 20:55:25 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 02/12] mini-os: remove gnttab specific member from
 struct file
Message-ID: <20220111195525.qnn2kixvrsb3fjqa@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220111151215.22955-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 5A1B8678
X-Spamd-Result: default: False [0.40 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[]

Juergen Gross, le mar. 11 janv. 2022 16:12:05 +0100, a ecrit:
> The event channel specific union member in struct file is no longer
> needed, so remove it.
> 
> The gnttab file type and its associated handling can be removed, too,
> as libxengnttab is now supplying a struct file_ops via a call of
> alloc_file_type().
> 
> This removes all contents of CONFIG_LIBXENGNTTAB guarded sections, so
> this config option can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  Config.mk                     | 1 -
>  arch/x86/testbuild/all-no     | 1 -
>  arch/x86/testbuild/all-yes    | 1 -
>  arch/x86/testbuild/newxen-yes | 1 -
>  gntmap.c                      | 2 +-
>  include/lib.h                 | 4 +---
>  lib/sys.c                     | 5 -----
>  7 files changed, 2 insertions(+), 13 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index c244adc..eb84515 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -197,7 +197,6 @@ CONFIG-n += CONFIG_PARAVIRT
>  endif
>  # Support legacy CONFIG_XC value
>  CONFIG_XC ?= $(libc)
> -CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
>  
>  CONFIG-$(lwip) += CONFIG_LWIP
>  
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index 202c317..c429354 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -13,7 +13,6 @@ CONFIG_FBFRONT = n
>  CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
>  CONFIG_XENBUS = n
> -CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
>  CONFIG_BALLOON = n
>  CONFIG_USE_XEN_CONSOLE = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index eb495a4..6c6096b 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -16,5 +16,4 @@ CONFIG_XENBUS = y
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  # The following are special: they need support from outside
> -CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index bf25ace..88094fc 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -17,5 +17,4 @@ CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
>  # The following are special: they need support from outside
> -CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/gntmap.c b/gntmap.c
> index 6fa1dac..3422ab2 100644
> --- a/gntmap.c
> +++ b/gntmap.c
> @@ -3,7 +3,7 @@
>   *
>   * Diego Ongaro <diego.ongaro@citrix.com>, July 2008
>   *
> - * Files of type FTYPE_GNTMAP contain a gntmap, which is an array of
> + * Files of libxengnttab contain a gntmap, which is an array of
>   * (host address, grant handle) pairs. Grant handles come from a hypervisor map
>   * operation and are needed for the corresponding unmap.
>   *
> diff --git a/include/lib.h b/include/lib.h
> index df972ef..283abb8 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -168,8 +168,7 @@ void sanity_check(void);
>  #define FTYPE_TPMFRONT  10
>  #define FTYPE_TPM_TIS   11
>  #define FTYPE_XENBUS    12
> -#define FTYPE_GNTMAP    13
> -#define FTYPE_N         14
> +#define FTYPE_N         13
>  #define FTYPE_SPARE     16
>  
>  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> @@ -205,7 +204,6 @@ struct file {
>      union {
>          int fd; /* Any fd from an upper layer. */
>          void *dev;
> -	struct gntmap gntmap;
>      };
>  };
>  
> diff --git a/lib/sys.c b/lib/sys.c
> index 8fa1fee..9540410 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -505,11 +505,6 @@ int close(int fd)
>  	    res = lwip_close(files[fd].fd);
>              break;
>  #endif
> -#ifdef CONFIG_LIBXENGNTTAB
> -	case FTYPE_GNTMAP:
> -	    minios_gnttab_close_fd(fd);
> -            break;
> -#endif
>  #ifdef CONFIG_NETFRONT
>  	case FTYPE_TAP:
>  	    shutdown_netfront(files[fd].dev);
> -- 
> 2.26.2
> 

-- 
Samuel
Tu as lu les docs. Tu es devenu un informaticien. Que tu le veuilles
ou non. Lire la doc, c'est le Premier et Unique Commandement de
l'informaticien.
-+- TP in: Guide du Linuxien pervers - "L'évangile selon St Thomas"

