Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 191A9405FCF
	for <lists+xen-devel@lfdr.de>; Fri, 10 Sep 2021 01:02:06 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.183689.331975 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOT3C-00006F-U8; Thu, 09 Sep 2021 23:01:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 183689.331975; Thu, 09 Sep 2021 23:01:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mOT3C-0008UZ-Pr; Thu, 09 Sep 2021 23:01:46 +0000
Received: by outflank-mailman (input) for mailman id 183689;
 Thu, 09 Sep 2021 23:01:45 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=+l3J=N7=ens-lyon.org=samuel.thibault@srs-us1.protection.inumbo.net>)
 id 1mOT3B-0008UT-Fu
 for xen-devel@lists.xenproject.org; Thu, 09 Sep 2021 23:01:45 +0000
Received: from hera.aquilenet.fr (unknown [185.233.100.1])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 01c31b27-78f3-4f5d-8e86-ff306f655648;
 Thu, 09 Sep 2021 23:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 4BBBC4CA;
 Fri, 10 Sep 2021 01:01:42 +0200 (CEST)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PB4PWQxBd3YX; Fri, 10 Sep 2021 01:01:38 +0200 (CEST)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 62B4C1BF;
 Fri, 10 Sep 2021 01:01:38 +0200 (CEST)
Received: from samy by begin with local (Exim 4.95-RC2)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mOT33-00Hagn-6V;
 Fri, 10 Sep 2021 01:01:37 +0200
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
X-Inumbo-ID: 01c31b27-78f3-4f5d-8e86-ff306f655648
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Fri, 10 Sep 2021 01:01:37 +0200
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Juergen Gross <jgross@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: Re: [PATCH v2 3/3] tools: disable building qemu-trad per default
Message-ID: <20210909230137.bl7rd64z42vfhtau@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org,
	Ian Jackson <iwj@xenproject.org>,
	Community Manager <community.manager@xenproject.org>,
	Wei Liu <wl@xen.org>
References: <20210909124924.1698-1-jgross@suse.com>
 <20210909124924.1698-4-jgross@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210909124924.1698-4-jgross@suse.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: --
Authentication-Results: hera.aquilenet.fr
X-Rspamd-Server: hera
X-Rspamd-Queue-Id: 4BBBC4CA
X-Spamd-Result: default: False [-2.50 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 RCVD_NO_TLS_LAST(0.10)[];
	 FROM_EQ_ENVFROM(0.00)[];
	 MID_RHS_NOT_FQDN(0.50)[];
	 BAYES_HAM(-3.00)[100.00%]

Juergen Gross, le jeu. 09 sept. 2021 14:49:24 +0200, a ecrit:
> Using qemu-traditional as device model is deprecated for some time now.
> 
> So change the default for building it to "disable". This will affect
> ioemu-stubdom, too, as there is a direct dependency between the two.
> 
> Today it is possible to use a PVH/HVM Linux-based stubdom as device
> model. Additionally using ioemu-stubdom isn't really helping for
> security, as it requires to run a very old and potentially buggy qemu
> version in a PV domain. This is adding probably more security problems
> than it is removing by using a stubdom.
> 
> Signed-off-by: Juergen Gross <jgross@suse.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
> V2:
> - new patch
> ---
>  CHANGELOG.md         |  3 +++
>  stubdom/configure    |  8 --------
>  stubdom/configure.ac |  8 +-------
>  tools/configure      | 17 ++---------------
>  tools/configure.ac   | 13 +------------
>  5 files changed, 7 insertions(+), 42 deletions(-)
> 
> diff --git a/CHANGELOG.md b/CHANGELOG.md
> index e7107ac3de..e5ab49e779 100644
> --- a/CHANGELOG.md
> +++ b/CHANGELOG.md
> @@ -18,6 +18,9 @@ The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
>     or by passing "iommu=quarantine=scratch-page" on the hypervisor command line.
>   - pv-grub stubdoms will no longer be built per default. In order to be able to use pv-grub
>     configure needs to be called with "--enable-pv-grub" as parameter.
> + - qemu-traditional based device models (both, qemu-traditional and ioemu-stubdom) will
> +   no longer be built per default. In order to be able to use those, configure needs to
> +   be called with "--enable-qemu-traditional" as parameter.
>  
>  ## [4.15.0 UNRELEASED](https://xenbits.xen.org/gitweb/?p=xen.git;a=shortlog;h=RELEASE-4.15.0) - TBD
>  
> diff --git a/stubdom/configure b/stubdom/configure
> index df31532abb..07b709f998 100755
> --- a/stubdom/configure
> +++ b/stubdom/configure
> @@ -2286,14 +2286,6 @@ fi
>  # Check whether --enable-qemu-traditional was given.
>  if test "${enable_qemu_traditional+set}" = set; then :
>    enableval=$enable_qemu_traditional;
> -else
> -
> -    case "$host_cpu" in
> -        i[3456]86|x86_64)
> -           enable_qemu_traditional="yes";;
> -        *) enable_qemu_traditional="no";;
> -    esac
> -
>  fi
>  
>  if test "x$enable_qemu_traditional" = "xyes"; then :
> diff --git a/stubdom/configure.ac b/stubdom/configure.ac
> index a07a1edae5..e20d99edac 100644
> --- a/stubdom/configure.ac
> +++ b/stubdom/configure.ac
> @@ -27,13 +27,7 @@ AX_STUBDOM_DEFAULT_ENABLE([xenstorepvh-stubdom], [xenstorepvh])
>  AX_STUBDOM_CONDITIONAL([vtpm-stubdom], [vtpm])
>  AX_STUBDOM_CONDITIONAL([vtpmmgr-stubdom], [vtpmmgr])
>  
> -AC_ARG_ENABLE([qemu-traditional],,,[
> -    case "$host_cpu" in
> -        i[[3456]]86|x86_64)
> -           enable_qemu_traditional="yes";;
> -        *) enable_qemu_traditional="no";;
> -    esac
> -])
> +AC_ARG_ENABLE([qemu-traditional])
>  AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
>      qemu_traditional=y],[
>      qemu_traditional=n
> diff --git a/tools/configure b/tools/configure
> index 33814b24b3..8bf8fe75b8 100755
> --- a/tools/configure
> +++ b/tools/configure
> @@ -1502,8 +1502,8 @@ Optional Features:
>    --disable-seabios       Disable SeaBIOS (default is ENABLED)
>    --disable-golang        Disable Go tools (default is ENABLED)
>    --enable-qemu-traditional
> -                          Enable qemu traditional device model, (DEFAULT is on
> -                          for Linux or NetBSD x86, otherwise off)
> +                          Enable qemu traditional device model, (DEFAULT is
> +                          off)
>    --enable-rombios        Enable ROMBIOS, (DEFAULT is on if qemu-traditional
>                            is enabled, otherwise off)
>    --disable-ipxe          Enable in-tree IPXE, (DEFAULT is on if rombios is
> @@ -4287,19 +4287,6 @@ LINUX_BACKEND_MODULES="`eval echo $LINUX_BACKEND_MODULES`"
>  # Check whether --enable-qemu-traditional was given.
>  if test "${enable_qemu_traditional+set}" = set; then :
>    enableval=$enable_qemu_traditional;
> -else
> -
> -    case "$host_cpu" in
> -        i[3456]86|x86_64)
> -           enable_qemu_traditional="yes";;
> -        *) enable_qemu_traditional="no";;
> -    esac
> -    case "$host_os" in
> -        freebsd*)
> -           enable_qemu_traditional="no";;
> -    esac
> -
> -
>  fi
>  
>  if test "x$enable_qemu_traditional" = "xyes"; then :
> diff --git a/tools/configure.ac b/tools/configure.ac
> index 6414fcbb44..a713fd34d6 100644
> --- a/tools/configure.ac
> +++ b/tools/configure.ac
> @@ -120,18 +120,7 @@ AC_SUBST(LINUX_BACKEND_MODULES)
>  
>  AC_ARG_ENABLE([qemu-traditional],
>      AS_HELP_STRING([--enable-qemu-traditional],
> -                   [Enable qemu traditional device model, (DEFAULT is on for Linux or NetBSD x86, otherwise off)]),,[
> -    case "$host_cpu" in
> -        i[[3456]]86|x86_64)
> -           enable_qemu_traditional="yes";;
> -        *) enable_qemu_traditional="no";;
> -    esac
> -    case "$host_os" in
> -        freebsd*)
> -           enable_qemu_traditional="no";;
> -    esac
> -
> -])
> +                   [Enable qemu traditional device model, (DEFAULT is off)]))
>  AS_IF([test "x$enable_qemu_traditional" = "xyes"], [
>  AC_DEFINE([HAVE_QEMU_TRADITIONAL], [1], [Qemu traditional enabled])
>      qemu_traditional=y],[
> -- 
> 2.26.2
> 

-- 
Samuel
<A>  mr  -  remove the home of correct users who accidentally enter mr
<A>        instead of rm

