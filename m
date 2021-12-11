Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 47772471751
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 00:47:54 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245473.423520 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwC5O-00041b-LU; Sat, 11 Dec 2021 23:47:26 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245473.423520; Sat, 11 Dec 2021 23:47:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwC5O-0003yf-IF; Sat, 11 Dec 2021 23:47:26 +0000
Received: by outflank-mailman (input) for mailman id 245473;
 Sat, 11 Dec 2021 23:47:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1IHf=Q4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwC5N-0003yZ-Em
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 23:47:25 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id af4ea804-5adc-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 00:47:24 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 7AA033A1;
 Sun, 12 Dec 2021 00:47:21 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pp0w69gDddZJ; Sun, 12 Dec 2021 00:47:20 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 6EF4A33A;
 Sun, 12 Dec 2021 00:47:20 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwC5G-001qGp-DP;
 Sun, 12 Dec 2021 00:47:18 +0100
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
X-Inumbo-ID: af4ea804-5adc-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 00:47:18 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 52/57] stubdom: only build libxen*.a from tools/libs/
Message-ID: <20211211234718.kk4djhy4blhqpdt2@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-53-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206170241.13165-53-anthony.perard@citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Queue-Id: 7AA033A1
X-Spamd-Result: default: False [1.90 / 15.00];
	 ARC_NA(0.00)[];
	 RCVD_VIA_SMTP_AUTH(0.00)[];
	 FROM_HAS_DN(0.00)[];
	 TO_DN_SOME(0.00)[];
	 FREEMAIL_ENVRCPT(0.00)[gmail.com];
	 TO_MATCH_ENVRCPT_ALL(0.00)[];
	 TAGGED_RCPT(0.00)[];
	 MIME_GOOD(-0.10)[text/plain];
	 RCPT_COUNT_FIVE(0.00)[5];
	 HAS_ORG_HEADER(0.00)[];
	 RCVD_COUNT_THREE(0.00)[3];
	 FROM_EQ_ENVFROM(0.00)[];
	 MIME_TRACE(0.00)[0:+];
	 RCVD_TLS_LAST(0.00)[];
	 FREEMAIL_CC(0.00)[lists.xenproject.org,gmail.com,xenproject.org,xen.org];
	 MID_RHS_NOT_FQDN(0.50)[];
	 SUSPICIOUS_RECIPS(1.50)[]

Anthony PERARD, le lun. 06 déc. 2021 17:02:35 +0000, a ecrit:
> Avoid generating *.map files or running headers.chk when all we need
> is the libxen*.a.
> 
> Also, allow force make to check again if libxen*.a needs rebuilt by
> adding a '.PHONY' prerequisite.
> 
> Also, remove DESTDIR= as we don't do installation in this target, so
> the value of DESTDIR doesn't matter.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index ccfcf5b75f..5fb5dbc341 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -354,8 +354,8 @@ define BUILD_lib
>   .PHONY: libxen$(1) clean-libxen$(1)
>   libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
>   libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
> - libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE)
> -	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) DESTDIR= CONFIG_LIBXC_MINIOS=y -C libs-$$(XEN_TARGET_ARCH)/$(1)
> + libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
> +	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -C $$(@D) $$(@F)
>  
>   clean-libxen$(1):
>  	[ ! -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ] || $$(MAKE) DESTDIR= -C libs-$$(XEN_TARGET_ARCH)/$(1) clean
> -- 
> Anthony PERARD
> 

