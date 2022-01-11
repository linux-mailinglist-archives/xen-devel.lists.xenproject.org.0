Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FBD48B7A4
	for <lists+xen-devel@lfdr.de>; Tue, 11 Jan 2022 20:50:52 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.256033.439126 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NA5-0005p9-HJ; Tue, 11 Jan 2022 19:50:29 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 256033.439126; Tue, 11 Jan 2022 19:50:29 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n7NA5-0005mx-DF; Tue, 11 Jan 2022 19:50:29 +0000
Received: by outflank-mailman (input) for mailman id 256033;
 Tue, 11 Jan 2022 19:50:28 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=ZoZL=R3=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n7NA4-0005mm-2K
 for xen-devel@lists.xenproject.org; Tue, 11 Jan 2022 19:50:28 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [2a0c:e300::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b7f20f2f-7317-11ec-9ce5-af14b9085ebd;
 Tue, 11 Jan 2022 20:50:26 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 768B9678;
 Tue, 11 Jan 2022 20:50:24 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JUBhp6cf7x8j; Tue, 11 Jan 2022 20:50:23 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id C287F140;
 Tue, 11 Jan 2022 20:50:22 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n7N9x-00FF8O-Ru;
 Tue, 11 Jan 2022 20:50:21 +0100
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
X-Inumbo-ID: b7f20f2f-7317-11ec-9ce5-af14b9085ebd
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 11 Jan 2022 20:50:21 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH v2 01/12] mini-os: remove event channel specific struct
 file definitions
Message-ID: <20220111195021.zekcnopxvr4fb4r4@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220111151215.22955-1-jgross@suse.com>
 <20220111151215.22955-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111151215.22955-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 768B9678
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

Juergen Gross, le mar. 11 janv. 2022 16:12:04 +0100, a ecrit:
> The event channel specific union member in struct file is no longer
> needed, so remove it together with the associated structure
> definitions.
> 
> The event channel file type and its associated handling can be removed,
> too, as libxenevtchn is now supplying a struct file_ops via a call of
> alloc_file_type().
> 
> This removes all contents of CONFIG_LIBXENEVTCHN guarded sections, so
> this config option can be removed.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  Config.mk                     |  1 -
>  arch/x86/testbuild/all-no     |  1 -
>  arch/x86/testbuild/all-yes    |  1 -
>  arch/x86/testbuild/newxen-yes |  1 -
>  include/lib.h                 | 15 +--------------
>  lib/sys.c                     |  7 -------
>  6 files changed, 1 insertion(+), 25 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 1e08388..c244adc 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -197,7 +197,6 @@ CONFIG-n += CONFIG_PARAVIRT
>  endif
>  # Support legacy CONFIG_XC value
>  CONFIG_XC ?= $(libc)
> -CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
>  CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
>  
>  CONFIG-$(lwip) += CONFIG_LWIP
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index d6fc260..202c317 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -13,7 +13,6 @@ CONFIG_FBFRONT = n
>  CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
>  CONFIG_XENBUS = n
> -CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
>  CONFIG_BALLOON = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index 98bbfeb..eb495a4 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -16,6 +16,5 @@ CONFIG_XENBUS = y
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  # The following are special: they need support from outside
> -CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index 0603200..bf25ace 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -17,6 +17,5 @@ CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
>  # The following are special: they need support from outside
> -CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/include/lib.h b/include/lib.h
> index 4892320..df972ef 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -169,8 +169,7 @@ void sanity_check(void);
>  #define FTYPE_TPM_TIS   11
>  #define FTYPE_XENBUS    12
>  #define FTYPE_GNTMAP    13
> -#define FTYPE_EVTCHN    14
> -#define FTYPE_N         15
> +#define FTYPE_N         14
>  #define FTYPE_SPARE     16
>  
>  typedef int file_read_func(int fd, void *buf, size_t nbytes);
> @@ -199,15 +198,6 @@ off_t lseek_default(int fd, off_t offset, int whence);
>  bool select_yes(int fd);
>  bool select_read_flag(int fd);
>  
> -LIST_HEAD(evtchn_port_list, evtchn_port_info);
> -
> -struct evtchn_port_info {
> -        LIST_ENTRY(evtchn_port_info) list;
> -        evtchn_port_t port;
> -        unsigned long pending;
> -        int bound;
> -};
> -
>  struct file {
>      unsigned int type;
>      bool read;	/* maybe available for read */
> @@ -215,9 +205,6 @@ struct file {
>      union {
>          int fd; /* Any fd from an upper layer. */
>          void *dev;
> -	struct {
> -	    struct evtchn_port_list ports;
> -	} evtchn;
>  	struct gntmap gntmap;
>      };
>  };
> diff --git a/lib/sys.c b/lib/sys.c
> index 52876e0..8fa1fee 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -505,11 +505,6 @@ int close(int fd)
>  	    res = lwip_close(files[fd].fd);
>              break;
>  #endif
> -#ifdef CONFIG_LIBXENEVTCHN
> -	case FTYPE_EVTCHN:
> -	    minios_evtchn_close_fd(fd);
> -            break;
> -#endif
>  #ifdef CONFIG_LIBXENGNTTAB
>  	case FTYPE_GNTMAP:
>  	    minios_gnttab_close_fd(fd);
> @@ -723,7 +718,6 @@ static const char *file_types[] = {
>      [FTYPE_NONE]    = "none",
>      [FTYPE_CONSOLE] = "console",
>      [FTYPE_XENBUS]  = "xenbus",
> -    [FTYPE_EVTCHN]  = "evtchn",
>      [FTYPE_SOCKET]  = "socket",
>      [FTYPE_TAP]     = "net",
>      [FTYPE_BLK]     = "blk",
> @@ -915,7 +909,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>  	    FD_CLR(i, exceptfds);
>  	    break;
>  #endif
> -	case FTYPE_EVTCHN:
>  	case FTYPE_TAP:
>  	case FTYPE_BLK:
>  	case FTYPE_KBD:
> -- 
> 2.26.2
> 

-- 
Samuel
<h> t: bah c'est tendre le pattern pour se faire matcher, hein

