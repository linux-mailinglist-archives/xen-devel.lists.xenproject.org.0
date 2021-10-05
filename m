Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F464232CE
	for <lists+xen-devel@lfdr.de>; Tue,  5 Oct 2021 23:27:09 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.202497.357459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXrxg-00078S-4o; Tue, 05 Oct 2021 21:26:56 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 202497.357459; Tue, 05 Oct 2021 21:26:56 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mXrxg-000757-0m; Tue, 05 Oct 2021 21:26:56 +0000
Received: by outflank-mailman (input) for mailman id 202497;
 Tue, 05 Oct 2021 21:26:55 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Hd/I=OZ=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mXrxf-0006zz-6w
 for xen-devel@lists.xenproject.org; Tue, 05 Oct 2021 21:26:55 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id f3ca4b3a-2622-11ec-bf16-12813bfff9fa;
 Tue, 05 Oct 2021 21:26:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 037EA456;
 Tue,  5 Oct 2021 23:26:51 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4XB4179NegOe; Tue,  5 Oct 2021 23:26:50 +0200 (CEST)
Received: from begin.home (acaen-652-1-186-147.w86-215.abo.wanadoo.fr
 [86.215.106.147])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id B2B53243;
 Tue,  5 Oct 2021 23:26:49 +0200 (CEST)
Received: from samy by begin.home with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mXrxZ-00G25D-2x;
 Tue, 05 Oct 2021 23:26:49 +0200
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
X-Inumbo-ID: f3ca4b3a-2622-11ec-bf16-12813bfff9fa
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Tue, 5 Oct 2021 23:26:49 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org,
	wl@xen.org
Subject: Re: [PATCH 2/2] mini-os: add config options for xen libraries
Message-ID: <20211005212649.pqlwdgwd4amkzrv7@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, minios-devel@lists.xenproject.org,
	xen-devel@lists.xenproject.org, wl@xen.org
References: <20211004141924.7088-1-jgross@suse.com>
 <20211004141924.7088-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004141924.7088-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 037EA456
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 RCPT_COUNT_THREE(0.00)[4];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Juergen Gross, le lun. 04 oct. 2021 16:19:24 +0200, a ecrit:
> Today close hooks into libxenctrl, libxenevtchn and libxengnttab are
> under the CONFIG_XC umbrella. In order to support Mini-OS builds using
> stable Xen libraries only, add CONFIG_LIBXENCTRL, CONFIG_LIBXENEVTCHN
> and CONFIG_LIBXENGNTTAB config options.
> 
> In case CONFIG_XC was specified in the Mini-OS config explicitly, set
> the three new variables to the specified value.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

Thanks!

> ---
>  Config.mk                     | 7 ++++++-
>  arch/x86/testbuild/all-no     | 4 +++-
>  arch/x86/testbuild/all-yes    | 9 +++++----
>  arch/x86/testbuild/newxen-yes | 9 +++++----
>  lib/sys.c                     | 8 ++++++--
>  5 files changed, 25 insertions(+), 12 deletions(-)
> 
> diff --git a/Config.mk b/Config.mk
> index 8f4cea9..5e66089 100644
> --- a/Config.mk
> +++ b/Config.mk
> @@ -195,7 +195,12 @@ CONFIG-y += CONFIG_PARAVIRT
>  else
>  CONFIG-n += CONFIG_PARAVIRT
>  endif
> -CONFIG-$(libc) += CONFIG_XC
> +# Support legacy CONFIG_XC value
> +CONFIG_XC ?= $(libc)
> +CONFIG-$(CONFIG_XC) += CONFIG_LIBXENCTRL
> +CONFIG-$(CONFIG_XC) += CONFIG_LIBXENEVTCHN
> +CONFIG-$(CONFIG_XC) += CONFIG_LIBXENGNTTAB
> +
>  CONFIG-$(lwip) += CONFIG_LWIP
>  
>  $(foreach i,$(CONFIG-y),$(eval $(i) ?= y))
> diff --git a/arch/x86/testbuild/all-no b/arch/x86/testbuild/all-no
> index 1c50bba..7972ecd 100644
> --- a/arch/x86/testbuild/all-no
> +++ b/arch/x86/testbuild/all-no
> @@ -13,7 +13,9 @@ CONFIG_FBFRONT = n
>  CONFIG_KBDFRONT = n
>  CONFIG_CONSFRONT = n
>  CONFIG_XENBUS = n
> -CONFIG_XC = n
> +CONFIG_LIBXENCTRL = n
> +CONFIG_LIBXENEVTCHN = n
> +CONFIG_LIBXENGNTTAB = n
>  CONFIG_LWIP = n
>  CONFIG_BALLOON = n
>  CONFIG_USE_XEN_CONSOLE = n
> diff --git a/arch/x86/testbuild/all-yes b/arch/x86/testbuild/all-yes
> index 5464342..bc8eea5 100644
> --- a/arch/x86/testbuild/all-yes
> +++ b/arch/x86/testbuild/all-yes
> @@ -13,9 +13,10 @@ CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
>  CONFIG_XENBUS = y
> -# XC is special: it needs support from outside
> -CONFIG_XC = n
> -# LWIP is special: it needs support from outside
> -CONFIG_LWIP = n
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
> +# The following are special: they need support from outside
> +CONFIG_LIBXENCTRL = n
> +CONFIG_LIBXENEVTCHN = n
> +CONFIG_LIBXENGNTTAB = n
> +CONFIG_LWIP = n
> diff --git a/arch/x86/testbuild/newxen-yes b/arch/x86/testbuild/newxen-yes
> index 2a3ed2e..f72123b 100644
> --- a/arch/x86/testbuild/newxen-yes
> +++ b/arch/x86/testbuild/newxen-yes
> @@ -13,10 +13,11 @@ CONFIG_FBFRONT = y
>  CONFIG_KBDFRONT = y
>  CONFIG_CONSFRONT = y
>  CONFIG_XENBUS = y
> -# XC is special: it needs support from outside
> -CONFIG_XC = n
> -# LWIP is special: it needs support from outside
> -CONFIG_LWIP = n
>  CONFIG_BALLOON = y
>  CONFIG_USE_XEN_CONSOLE = y
>  XEN_INTERFACE_VERSION=__XEN_LATEST_INTERFACE_VERSION__
> +# The following are special: they need support from outside
> +CONFIG_LIBXENCTRL = n
> +CONFIG_LIBXENEVTCHN = n
> +CONFIG_LIBXENGNTTAB = n
> +CONFIG_LWIP = n
> diff --git a/lib/sys.c b/lib/sys.c
> index c6a7b9f..e8d5eb2 100644
> --- a/lib/sys.c
> +++ b/lib/sys.c
> @@ -437,13 +437,17 @@ int close(int fd)
>  	    return res;
>  	}
>  #endif
> -#ifdef CONFIG_XC
> +#ifdef CONFIG_LIBXENCTRL
>  	case FTYPE_XC:
>  	    minios_interface_close_fd(fd);
>  	    return 0;
> +#endif
> +#ifdef CONFIG_LIBXENEVTCHN
>  	case FTYPE_EVTCHN:
>  	    minios_evtchn_close_fd(fd);
>              return 0;
> +#endif
> +#ifdef CONFIG_LIBXENGNTTAB
>  	case FTYPE_GNTMAP:
>  	    minios_gnttab_close_fd(fd);
>  	    return 0;
> @@ -1373,7 +1377,7 @@ void *mmap(void *start, size_t length, int prot, int flags, int fd, off_t offset
>  
>      if (fd == -1)
>          return map_zero(n, 1);
> -#ifdef CONFIG_XC
> +#ifdef CONFIG_LIBXENCTRL
>      else if (files[fd].type == FTYPE_XC) {
>          unsigned long zero = 0;
>          return map_frames_ex(&zero, n, 0, 0, 1, DOMID_SELF, NULL, 0);
> -- 
> 2.26.2
> 

-- 
Samuel
<y> update-menus: relocation error: update-menus: symbol _ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E, version GLIBCPP_3.2 not defined in file libstdc++.so.5 with link time reference
<y> quoi que ça peut bien vouloir dire ?
<D> N a eu la meme merde
<y> c ça que ça veut dire ? wow, c'est bien crypté :)
 -+- #ens-mim s'entraide -+-

