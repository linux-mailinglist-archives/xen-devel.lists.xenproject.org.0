Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF6648FED9
	for <lists+xen-devel@lfdr.de>; Sun, 16 Jan 2022 21:41:08 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.257935.443570 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CKc-00064k-1n; Sun, 16 Jan 2022 20:40:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 257935.443570; Sun, 16 Jan 2022 20:40:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1n9CKb-00061d-UX; Sun, 16 Jan 2022 20:40:53 +0000
Received: by outflank-mailman (input) for mailman id 257935;
 Sun, 16 Jan 2022 20:40:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=g2po=SA=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1n9CKa-00061S-4g
 for xen-devel@lists.xenproject.org; Sun, 16 Jan 2022 20:40:52 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 97629077-770c-11ec-a115-11989b9578b4;
 Sun, 16 Jan 2022 21:40:51 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 4CFA235D;
 Sun, 16 Jan 2022 21:40:50 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9PwE0IZnYp5n; Sun, 16 Jan 2022 21:40:49 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 192978B;
 Sun, 16 Jan 2022 21:40:49 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1n9CKW-005uTY-FK;
 Sun, 16 Jan 2022 21:40:48 +0100
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
X-Inumbo-ID: 97629077-770c-11ec-a115-11989b9578b4
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 16 Jan 2022 21:40:48 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [MINIOS PATCH v3 5/5] add CONFIG_LIBXS item
Message-ID: <20220116204048.ameywemmjyy6dtkm@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20220116064527.23519-1-jgross@suse.com>
 <20220116064527.23519-6-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220116064527.23519-6-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: /
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 4CFA235D
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

Juergen Gross, le dim. 16 janv. 2022 07:45:27 +0100, a ecrit:
> Mini-OS contains a stripped down version of libxenstore in lib/xs.c.
> Today it is being built always if CONFIG_XENBUS is set and libc
> support is enabled.
> 
> In order to allow a Mini-OS specific build of libxenstore to be used
> instead add a new CONFIG_LIBXS item which per default will have the
> same setting as CONFIG_XENBUS. A user wanting to replace lib/xs.c
> with libxenstore would just need to set CONFIG_XENBUS=y and
> CONFIG_LIBXS=n.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V3:
> - new patch
> ---
>  Config.mk                     | 10 ++++++++--
>  Makefile                      |  2 +-
>  arch/x86/testbuild/all-no     |  1 +
>  arch/x86/testbuild/all-yes    |  1 +
>  arch/x86/testbuild/newxen-yes |  1 +
>  lib/sys.c                     |  4 ++--
>  6 files changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 1e083881..03023033 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -171,7 +171,10 @@ endif
>  # arch/*/testbuild/*-yes and arch/*/testbuild/*-no should set ALL possible
>  # CONFIG_ variables.
>  
> -# Configuration defaults
> +# Configuration defaults:
> +# CONFIG-y contains all items defaulting to "y"
> +# CONFIG-n contains all items defaulting to "n"
> +# CONFIG-x contains all items being calculated if not set explicitly
>  CONFIG-y += CONFIG_START_NETWORK
>  CONFIG-y += CONFIG_SPARSE_BSS
>  CONFIG-y += CONFIG_BLKFRONT
> @@ -205,7 +208,10 @@ CONFIG-$(lwip) += CONFIG_LWIP
>  $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
>  $(foreach i,$(CONFIG-n),$(eval $(i) ?= n))
>  
> -CONFIG-all := $(CONFIG-y) $(CONFIG-n)
> +CONFIG-x += CONFIG_LIBXS
> +CONFIG_LIBXS ?= $(CONFIG_XENBUS)
> +
> +CONFIG-all := $(CONFIG-y) $(CONFIG-n) $(CONFIG-x)
>  
>  # Export config items as compiler directives
>  $(foreach i,$(CONFIG-all),$(eval DEFINES-$($(i)) += -D$(i)))
> diff --git a/Makefile b/Makefile
> index 06b60fc7..9f95d197 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -65,7 +65,7 @@ src-y += lib/stack_chk_fail.c
>  src-y += lib/string.c
>  src-y += lib/sys.c
>  src-y += lib/xmalloc.c
> -src-$(CONFIG_XENBUS) += lib/xs.c
> +src-$(CONFIG_LIBXS) += lib/xs.c
>  
>  src-$(CONFIG_XENBUS) += xenbus/xenbus.c
>  
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index d6fc2608..46f974de 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -13,6 +13,7 @@ CONFIG_FBFRONT = n
>  CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
>  CONFIG_XENBUS = n
> +CONFIG_LIBXS = n
>  CONFIG_LIBXENEVTCHN = n
>  CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index 98bbfebf..3ead12f1 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -13,6 +13,7 @@ CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
>  CONFIG_XENBUS = y
> +CONFIG_LIBXS = y
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  # The following are special: they need support from outside
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index 06032004..5c0b3c80 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -13,6 +13,7 @@ CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
>  CONFIG_XENBUS = y
> +CONFIG_LIBXS = y
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
> diff --git a/lib/sys.c b/lib/sys.c
> index 7be01fd3..e0ac5099 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -523,7 +523,7 @@ int close(int fd)
>      switch (file->type) {
>          default:
>              break;
> -#ifdef CONFIG_XENBUS
> +#ifdef CONFIG_LIBXS
>  	case FTYPE_XENBUS:
>              xs_daemon_close((void*)(intptr_t) fd);
>              break;
> @@ -958,7 +958,7 @@ static int select_poll(int nfds, fd_set *readfds, fd_set *writefds, fd_set *exce
>                  n++;
>  	    FD_CLR(i, exceptfds);
>  	    break;
> -#ifdef CONFIG_XENBUS
> +#ifdef CONFIG_LIBXS
>  	case FTYPE_XENBUS:
>  	    if (FD_ISSET(i, readfds)) {
>                  if (files[i].dev)
> -- 
> 2.26.2
> 

-- 
Samuel
<s> bah, j'aime bien les feux d'artifices, mais j'ai peur de me prendre un boeing sur le coin de la gueule si je vais sur le pont de brooklyn
 -+- #ens-mim - 11 septembre forever -+-

