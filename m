Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D8836404785
	for <lists+xen-devel@lfdr.de>; Thu,  9 Sep 2021 11:04:43 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.182821.330613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFys-0002El-PQ; Thu, 09 Sep 2021 09:04:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 182821.330613; Thu, 09 Sep 2021 09:04:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOFys-0002CL-Kd; Thu, 09 Sep 2021 09:04:26 +0000
Received: by outflank-mailman (input) for mailman id 182821;
 Thu, 09 Sep 2021 09:04:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+l3J=N7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mOFyr-0002CD-My
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 09:04:25 +0000
Received: from mail3-relais-sop.national.inria.fr (unknown [192.134.164.104])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 656a4802-07c2-424d-b89c-cc84c02c5f78;
 Thu, 09 Sep 2021 09:04:23 +0000 (UTC)
Received: from unknown (HELO begin) ([193.50.111.40])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Sep 2021 11:04:22 +0200
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mOFyn-00FcqY-VV;
 Thu, 09 Sep 2021 11:04:22 +0200
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
X-Inumbo-ID: 656a4802-07c2-424d-b89c-cc84c02c5f78
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AArLU5K5mlMIo9WYeCAPXwOHXdLJyesId70hD?=
 =?us-ascii?q?6qm+c3Nom+ij5qSTdZUgpHrJYVkqMk3I9ersBEDEewK6yXcX2/hyAZ6HVAni/E?=
 =?us-ascii?q?SvKYRl85f6hwDnchefygc+78ZdmnhFebvN5DFB5K6Q3OD7KadC/DDtys6VbInl?=
 =?us-ascii?q?o0uFATsaEp1d0w=3D=3D?=
X-IronPort-AV: E=Sophos;i="5.84,326,1620684000"; 
   d="scan'208";a="392481966"
Date: Thu, 9 Sep 2021 11:04:21 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH 2/2] stubdom: disable building pv-grub
Message-ID: <20210909090421.yn222xbmci425box@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20210909082705.9434-1-jgross@suse.com>
 <20210909082705.9434-3-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909082705.9434-3-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)

Juergen Gross, le jeu. 09 sept. 2021 10:27:05 +0200, a ecrit:
> The stubdom based pv-grub is using a very outdated version of grub
> (0.97) and should not be used any longer. Mainline grub has support for
> PV guests for a long time now, so that should be used as a boot loader
> of a PV domain.
> 
> So disable building pv-grub per default. In case someone really wants
> to continue using it he/she can still use a pv-grub binary from an older
> Xen version or manually enable building it via:
> 
>   configure --enable-pv-grub
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/configure    | 8 ++------
>  stubdom/configure.ac | 2 +-
>  2 files changed, 3 insertions(+), 7 deletions(-)
> 
> diff --git a/stubdom/configure b/stubdom/configure
> index aa48df986d..df31532abb 100755
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -1342,7 +1342,7 @@ Optional Features:
>    --enable-ioemu-stubdom  Build and install ioemu-stubdom
>    --enable-c-stubdom      Build and install c-stubdom (default is DISABLED)
>    --enable-caml-stubdom   Build and install caml-stubdom (default is DISABLED)
> -  --disable-pv-grub       Build and install pv-grub (default is ENABLED)
> +  --enable-pv-grub        Build and install pv-grub (default is DISABLED)
>    --disable-xenstore-stubdom
>                            Build and install xenstore-stubdom (default is
>                            ENABLED)
> @@ -2129,11 +2129,7 @@ fi
>  else
>  
>  
> -grub=y
> -STUBDOM_TARGETS="$STUBDOM_TARGETS grub"
> -STUBDOM_BUILD="$STUBDOM_BUILD pv-grub"
> -STUBDOM_INSTALL="$STUBDOM_INSTALL install-grub"
> -STUBDOM_UNINSTALL="$STUBDOM_UNINSTALL install-grub"
> +grub=n
>  
>  
>  fi
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index bd6f765929..a07a1edae5 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -21,7 +21,7 @@ m4_include([../m4/fetcher.m4])
>  AX_STUBDOM_CONDITIONAL([ioemu-stubdom], [ioemu])
>  AX_STUBDOM_DEFAULT_DISABLE([c-stubdom], [c])
>  AX_STUBDOM_DEFAULT_DISABLE([caml-stubdom], [caml])
> -AX_STUBDOM_DEFAULT_ENABLE([pv-grub], [grub])
> +AX_STUBDOM_DEFAULT_DISABLE([pv-grub], [grub])
>  AX_STUBDOM_DEFAULT_ENABLE([xenstore-stubdom], [xenstore])
>  AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
>  AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
> -- 
> 2.26.2
> 

-- 
Samuel
<Raize> can you guys see what I type?
<vecna> no, raize
<Raize> How do I set it up so you can see it?

