Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 14DBA48FED3
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:34:32 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257929.443540 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CEG-0003oP-SC; Sun, 16 Jan 2022 20:34:20 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257929.443540; Sun, 16 Jan 2022 20:34:20 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CEG-0003mW-Ol; Sun, 16 Jan 2022 20:34:20 +0000
Received: by outflank-mailman (input) for mailman id 257929;
 Sun, 16 Jan 2022 20:34:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CEF-0003mQ-QI
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:34:19 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id ad8dce45-770b-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:34:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 0858635D;
 Sun, 16 Jan 2022 21:34:18 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4JUQfpPpOgIr; Sun, 16 Jan 2022 21:34:17 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 3E1178B;
 Sun, 16 Jan 2022 21:34:17 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CEC-005uRN-Hh;
 Sun, 16 Jan 2022 21:34:16 +0100
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
X-Inumbo-ID: ad8dce45-770b-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:34:16 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 3/5] remove file type FTYPE_XC
Message-ID: <20220116203416.qvna3buvtn52fjan@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116064527.23519-1-jgross@suse.com>
 <20220116064527.23519-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116064527.23519-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 0858635D
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

Juergen Gross, le dim. 16 janv. 2022 07:45:25 +0100, a ecrit:
> The only reason for the file type FTYPE_XC has been gone long time
> ago: it was needed for xc_map_foreign_bulk(), which has been switched
> to use libxenforeignmemory and doesn't need this special file any
> more.
> 
> So remove everything related to FTYPE_XC.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - new patch
> V3:
> - moved patch in series (Andrew Cooper)
> ---
>  Config.mk                     |  1 -
>  arch/x86/testbuild/all-no     |  1 -
>  arch/x86/testbuild/all-yes    |  1 -
>  arch/x86/testbuild/newxen-yes |  1 -
>  include/lib.h                 |  1 -
>  lib/sys.c                     | 13 -------------
>  6 files changed, 18 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 5e660891..1e083881 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -197,7 +197,6 @@ CONFIG-n += CONFIG_PARAVIRT
>  endif
>  # Support legacy CONFIG_XC value
>  CONFIG_XC ?= $(libc)
> -CONFIG-$(CONFIG_XC) += CONFIG_LIBXENCTRL
>  CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
>  CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
>  
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index 7972ecd5..d6fc2608 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -13,7 +13,6 @@ CONFIG_FBFRONT = n
>  CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
>  CONFIG_XENBUS = n
> -CONFIG_LIBXENCTRL = n
>  CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index bc8eea57..98bbfebf 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -16,7 +16,6 @@ CONFIG_XENBUS = y
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  # The following are special: they need support from outside
> -CONFIG_LIBXENCTRL = n
>  CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index f72123b5..06032004 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -17,7 +17,6 @@ CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
>  # The following are special: they need support from outside
> -CONFIG_LIBXENCTRL = n
>  CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/include/lib.h b/include/lib.h
> index 7a0546bd..7ca90768 100644
> --- a/include/lib.h
> +++ b/include/lib.h
> @@ -159,7 +159,6 @@ enum fd_type {
>      FTYPE_CONSOLE,
>      FTYPE_FILE,
>      FTYPE_XENBUS,
> -    FTYPE_XC,
>      FTYPE_EVTCHN,
>      FTYPE_GNTMAP,
>      FTYPE_SOCKET,
> diff --git a/lib/sys.c b/lib/sys.c
> index 7df77cc6..a24687b7 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -87,7 +87,6 @@
>      }
>  
>  #define NOFILE 32
> -extern void minios_interface_close_fd(int fd);
>  extern void minios_evtchn_close_fd(int fd);
>  extern void minios_gnttab_close_fd(int fd);
>  
> @@ -443,11 +442,6 @@ int close(int fd)
>              res = lwip_close(files[fd].fd);
>              break;
>  #endif
> -#ifdef CONFIG_LIBXENCTRL
> -	case FTYPE_XC:
> -	    minios_interface_close_fd(fd);
> -            break;
> -#endif
>  #ifdef CONFIG_LIBXENEVTCHN
>  	case FTYPE_EVTCHN:
>  	    minios_evtchn_close_fd(fd);
> @@ -651,7 +645,6 @@ static const char file_types[] = {
>      [FTYPE_NONE]	= 'N',
>      [FTYPE_CONSOLE]	= 'C',
>      [FTYPE_XENBUS]	= 'S',
> -    [FTYPE_XC]		= 'X',
>      [FTYPE_EVTCHN]	= 'E',
>      [FTYPE_SOCKET]	= 's',
>      [FTYPE_TAP]		= 'T',
> @@ -1383,12 +1376,6 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
>  
>      if (fd == -1)
>          return map_zero(n, 1);
> -#ifdef CONFIG_LIBXENCTRL
> -    else if (files[fd].type == FTYPE_XC) {
> -        unsigned long zero = 0;
> -        return map_frames_ex(&zero, n, 0, 0, 1, DOMID_SELF, NULL, 0);
> -    }
> -#endif
>      else if (files[fd].type == FTYPE_MEM) {
>          unsigned long first_mfn = offset >> PAGE_SHIFT;
>          return map_frames_ex(&first_mfn, n, 0, 1, 1, DOMID_IO, NULL, _PAGE_PRESENT|_PAGE_RW);
> -- 
> 2.26.2
> 

-- 
Samuel
$ du temp.iso 
2,0T    temp.iso
$ ls temp.iso -l
-r-xr-xr-x    1 samy     thibault      16E 2003-03-22 14:44 temp.iso*
 -+- je vous dirai pas la marque de mon disque dur, na :p -+- 

