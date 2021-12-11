Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDBC471754
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 00:51:34 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245481.423542 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwC9B-00067r-Dy; Sat, 11 Dec 2021 23:51:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245481.423542; Sat, 11 Dec 2021 23:51:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwC9B-00065H-AD; Sat, 11 Dec 2021 23:51:21 +0000
Received: by outflank-mailman (input) for mailman id 245481;
 Sat, 11 Dec 2021 23:51:20 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1IHf=Q4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwC9A-00065A-7P
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 23:51:20 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3c5a295c-5add-11ec-bf02-3911bdbc85ab;
 Sun, 12 Dec 2021 00:51:19 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 70F91273;
 Sun, 12 Dec 2021 00:51:18 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w0dPIWoGwiQj; Sun, 12 Dec 2021 00:51:17 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 68E65181;
 Sun, 12 Dec 2021 00:51:17 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwC96-001qHb-Gr;
 Sun, 12 Dec 2021 00:51:16 +0100
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
X-Inumbo-ID: 3c5a295c-5add-11ec-bf02-3911bdbc85ab
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 00:51:16 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 56/57] stubdom: build xenstore*-stubdom using new
 Makefile.common
Message-ID: <20211211235116.fzyjg2hcpzdzzr5n@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-57-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206170241.13165-57-anthony.perard@citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Queue-Id: 70F91273
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

Anthony PERARD, le lun. 06 déc. 2021 17:02:39 +0000, a ecrit:
> Makefile.common have everything needed by stubdom, when used with
> xenlibs.mk, so we don't need "Makefile" anymore.
> 
> Also, remove DESTDIR for "xenstore" related targets, "xenlibs.mk"
> doesn't use DESTDIR so its value doesn't matter.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/Makefile | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 6b804824ba..1fa075b9ad 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -346,8 +346,7 @@ define do_links
>    cd $(dir $@); \
>    ln -sf $(dir $<)include/*.h include/; \
>    ln -sf $(dir $<)*.[ch] .; \
> -  [ -e $(dir $<)Makefile.common ] && ln -sf $(dir $<)Makefile.common . ||:; \
> -  ln -sf $(dir $<)Makefile .
> +  ln -sf $(dir $<)Makefile.common .
>    touch $@
>  endef
>  
> @@ -356,13 +355,11 @@ define BUILD_lib
>   libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
>   libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
>   libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
> -	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y $$(if $$(wildcard $$(@D)/Makefile.common),-f $(CURDIR)/xenlibs.mk) -C $$(@D) $$(@F)
> +	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -f $(CURDIR)/xenlibs.mk -C $$(@D) $$(@F)
>  
>   clean-libxen$(1):
>  	if [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile.common ]; then \
>  	    $$(MAKE) -f $(CURDIR)/xenlibs.mk -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
> -	elif [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ]; then \
> -	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
>  	fi
>  
>   libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile.common
> @@ -494,7 +491,7 @@ xenstore-minios-config.mk: $(CURDIR)/xenstore-minios.cfg
>  
>  .PHONY: xenstore
>  xenstore: $(CROSS_ROOT) xenstore-minios-config.mk
> -	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
> +	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstore-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -f $(CURDIR)/xenlibs.mk -C $@ xenstored.a CONFIG_STUBDOM=y
>  
>  #############
>  # xenstorepvh
> @@ -505,7 +502,7 @@ xenstorepvh-minios-config.mk: $(CURDIR)/xenstorepvh-minios.cfg
>  
>  .PHONY: xenstorepvh
>  xenstorepvh: $(CROSS_ROOT) xenstorepvh-minios-config.mk
> -	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) DESTDIR= -C $@ xenstored.a CONFIG_STUBDOM=y
> +	CPPFLAGS="$(TARGET_CPPFLAGS) $(shell cat xenstorepvh-minios-config.mk)" CFLAGS="$(TARGET_CFLAGS)" $(MAKE) -f $(CURDIR)/xenlibs.mk -C $@ xenstored.a CONFIG_STUBDOM=y
>  
>  ########
>  # minios
> @@ -657,8 +654,8 @@ clean:
>  	rm -f *-minios-config.mk
>  	rm -fr pkg-config
>  	-[ ! -d ioemu ] || $(MAKE) DESTDIR= -C ioemu clean
> -	-[ ! -d xenstore ] || $(MAKE) DESTDIR= -C xenstore clean
> -	-[ ! -d xenstorepvh ] || $(MAKE) DESTDIR= -C xenstorepvh clean
> +	-[ ! -d xenstore ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstore clean
> +	-[ ! -d xenstorepvh ] || $(MAKE) -f $(CURDIR)/xenlibs.mk -C xenstorepvh clean
>  
>  # clean the cross-compilation result
>  .PHONY: crossclean
> -- 
> Anthony PERARD
> 

-- 
Samuel
Now I know someone out there is going to claim, "Well then, UNIX is intuitive,
because you only need to learn 5000 commands, and then everything else follows
from that! Har har har!"
(Andy Bates in comp.os.linux.misc, on "intuitive interfaces", slightly
defending Macs.)

