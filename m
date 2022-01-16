Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4955E48FEE5
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:53:23 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257960.443659 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CWT-0002uB-3Y; Sun, 16 Jan 2022 20:53:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257960.443659; Sun, 16 Jan 2022 20:53:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CWS-0002rP-V5; Sun, 16 Jan 2022 20:53:08 +0000
Received: by outflank-mailman (input) for mailman id 257960;
 Sun, 16 Jan 2022 20:53:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CWR-0002oK-A5
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:53:07 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 4d464ca7-770e-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:53:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id F2829427;
 Sun, 16 Jan 2022 21:53:04 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxKhzwWjZS1b; Sun, 16 Jan 2022 21:53:04 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id D766E18A;
 Sun, 16 Jan 2022 21:53:03 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CWM-005udx-Qy;
 Sun, 16 Jan 2022 21:53:02 +0100
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
X-Inumbo-ID: 4d464ca7-770e-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:53:02 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 01/12] remove event channel specific struct
 file definitions
Message-ID: <20220116205302.bp3j62v47rvo6zci@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116083328.26524-1-jgross@suse.com>
 <20220116083328.26524-2-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116083328.26524-2-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: F2829427
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

Juergen Gross, le dim. 16 janv. 2022 09:33:17 +0100, a ecrit:
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
> Add an extern declaration for event_queue as it is used by
> libxenevtchn.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - add extern declaration for event_queue (Andrew Cooper)
> ---
>  Config.mk                     |  1 -
>  arch/x86/testbuild/all-no     |  1 -
>  arch/x86/testbuild/all-yes    |  1 -
>  arch/x86/testbuild/newxen-yes |  1 -
>  include/lib.h                 | 17 +++--------------
>  lib/sys.c                     |  7 -------
>  6 files changed, 3 insertions(+), 25 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 03023033..52eb26d8 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -200,7 +200,6 @@ CONFIG-n += CONFIG_PARAVIRT
>  endif
>  # Support legacy CONFIG_XC value
>  CONFIG_XC ?= $(libc)
> -CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
>  CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
>  
>  CONFIG-$(lwip) += CONFIG_LWIP
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index 46f974de..15c954ff 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -14,7 +14,6 @@ CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
>  CONFIG_XENBUS = n
>  CONFIG_LIBXS = n
> -CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
>  CONFIG_BALLOON = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index 3ead12f1..9964d42f 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -17,6 +17,5 @@ CONFIG_LIBXS = y
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  # The following are special: they need support from outside
> -CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index 5c0b3c80..c2519938 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -18,6 +18,5 @@ CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
>  # The following are special: they need support from outside
> -CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/include/lib.h b/include/lib.h
> index 44696806..5f24be5d 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -155,6 +155,8 @@ do {                                                           \
>  void sanity_check(void);
>  
>  #ifdef HAVE_LIBC
> +extern struct wait_queue_head event_queue;
> +
>  #define FTYPE_NONE       0
>  #define FTYPE_CONSOLE    1
>  #define FTYPE_FILE       2
> @@ -169,19 +171,9 @@ void sanity_check(void);
>  #define FTYPE_TPM_TIS   11
>  #define FTYPE_XENBUS    12
>  #define FTYPE_GNTMAP    13
> -#define FTYPE_EVTCHN    14
> -#define FTYPE_N         15
> +#define FTYPE_N         14
>  #define FTYPE_SPARE     16
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
> @@ -189,9 +181,6 @@ struct file {
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
> index e0ac5099..34f0193d 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -533,11 +533,6 @@ int close(int fd)
>              res = lwip_close(files[fd].fd);
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
> @@ -770,7 +765,6 @@ static const char *const file_types[] = {
>      [FTYPE_NONE]    = "none",
>      [FTYPE_CONSOLE] = "console",
>      [FTYPE_XENBUS]  = "xenbus",
> -    [FTYPE_EVTCHN]  = "evtchn",
>      [FTYPE_SOCKET]  = "socket",
>      [FTYPE_TAP]     = "net",
>      [FTYPE_BLK]     = "blk",
> @@ -970,7 +964,6 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
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
 tohi.cybercable.fr (212.198.0.3) si une personne se reconnait derriere
 cette adresse que ce soit un pirate ou une victime qu'il se manifeste,
 cette personne pourrait bien etre un petit malin
 -+- Fred in NPC : Mamaaaaan, y a le routeur qui veut me hacker -+-

