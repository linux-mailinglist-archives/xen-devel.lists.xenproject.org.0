Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A00B0471753
	for <lists+xen-devel@lfdr.de>; Sun, 12 Dec 2021 00:49:47 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.245477.423530 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwC7S-0004lb-1K; Sat, 11 Dec 2021 23:49:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 245477.423530; Sat, 11 Dec 2021 23:49:34 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mwC7R-0004jK-UW; Sat, 11 Dec 2021 23:49:33 +0000
Received: by outflank-mailman (input) for mailman id 245477;
 Sat, 11 Dec 2021 23:49:32 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=1IHf=Q4=ens-lyon.org=samuel.thibault@srs-se1.protection.inumbo.net>)
 id 1mwC7Q-0004jC-PX
 for xen-devel@lists.xenproject.org; Sat, 11 Dec 2021 23:49:32 +0000
Received: from hera.aquilenet.fr (hera.aquilenet.fr [185.233.100.1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fc65bc67-5adc-11ec-a74f-db008197e53d;
 Sun, 12 Dec 2021 00:49:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by hera.aquilenet.fr (Postfix) with ESMTP id 3B34D33A;
 Sun, 12 Dec 2021 00:49:31 +0100 (CET)
Received: from hera.aquilenet.fr ([127.0.0.1])
 by localhost (hera.aquilenet.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVQQKpSoptPQ; Sun, 12 Dec 2021 00:49:30 +0100 (CET)
Received: from begin (unknown [IPv6:2a01:cb19:956:1b00:de41:a9ff:fe47:ec49])
 by hera.aquilenet.fr (Postfix) with ESMTPSA id 04583273;
 Sun, 12 Dec 2021 00:49:29 +0100 (CET)
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@ens-lyon.org>) id 1mwC7N-001qHE-3f;
 Sun, 12 Dec 2021 00:49:29 +0100
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
X-Inumbo-ID: fc65bc67-5adc-11ec-a74f-db008197e53d
X-Virus-Scanned: Debian amavisd-new at aquilenet.fr
Date: Sun, 12 Dec 2021 00:49:29 +0100
From: Samuel Thibault <samuel.thibault@ens-lyon.org>
To: Anthony PERARD <anthony.perard@citrix.com>
Cc: xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
Subject: Re: [XEN PATCH 53/57] stubdom: introduce xenlibs.mk
Message-ID: <20211211234929.3vah2ko7rsk2etk6@begin>
Mail-Followup-To: Samuel Thibault <samuel.thibault@ens-lyon.org>,
	Anthony PERARD <anthony.perard@citrix.com>,
	xen-devel@lists.xenproject.org,
	Anthony PERARD <anthony.perard@gmail.com>,
	Ian Jackson <iwj@xenproject.org>, Wei Liu <wl@xen.org>
References: <20211206170241.13165-1-anthony.perard@citrix.com>
 <20211206170241.13165-54-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211206170241.13165-54-anthony.perard@citrix.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-Spamd-Bar: +
X-Spam-Level: *
X-Rspamd-Server: hera
Authentication-Results: hera.aquilenet.fr;
	none
X-Rspamd-Queue-Id: 3B34D33A
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

Anthony PERARD, le lun. 06 déc. 2021 17:02:36 +0000, a ecrit:
> This new makefile will be used to build libraries that provides
> "Makefile.common".
> 
> At some point, we will be converting Makefile in tools/ to "subdirmk"
> and stubdom build will not be able to use those new makefiles, so we
> will put the necessary information for stubdom to build the xen
> libraries into a new Makefile.common and xenlibs.mk will use it.
> We only need to build static libraries and don't need anything else.
> 
> The check for the presence of "Makefile.common" will go aways once
> there is one for all libraries used by stubdom build.
> 
> Also remove DESTDIR= from "clean" targets, we don't do installation in
> this recipe so the value of DESTDIR doesn't matter.
> 
> Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>

Reviewed-by: Samuel Thibault <samuel.thibault@ens-lyon.org>

> ---
>  stubdom/xenlibs.mk | 13 +++++++++++++
>  stubdom/Makefile   |  9 +++++++--
>  2 files changed, 20 insertions(+), 2 deletions(-)
>  create mode 100644 stubdom/xenlibs.mk
> 
> diff --git a/stubdom/xenlibs.mk b/stubdom/xenlibs.mk
> new file mode 100644
> index 0000000000..5c8742ccf9
> --- /dev/null
> +++ b/stubdom/xenlibs.mk
> @@ -0,0 +1,13 @@
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +include Makefile.common
> +
> +LIBNAME := $(notdir $(CURDIR))
> +FILENAME_$(LIBNAME) ?= xen$(LIBNAME)
> +LIB_FILE_NAME = $(FILENAME_$(LIBNAME))
> +
> +lib$(LIB_FILE_NAME).a: $(OBJS-y)
> +	$(AR) rc $@ $^
> +
> +clean::
> +	rm -f $(OBJS-y) lib$(LIB_FILE_NAME).a
> diff --git a/stubdom/Makefile b/stubdom/Makefile
> index 5fb5dbc341..fba4c977ef 100644
> --- a/stubdom/Makefile
> +++ b/stubdom/Makefile
> @@ -346,6 +346,7 @@ define do_links
>    cd $(dir $@); \
>    ln -sf $(dir $<)include/*.h include/; \
>    ln -sf $(dir $<)*.[ch] .; \
> +  [ -e $(dir $<)Makefile.common ] && ln -sf $(dir $<)Makefile.common . ||:; \
>    ln -sf $(dir $<)Makefile .
>    touch $@
>  endef
> @@ -355,10 +356,14 @@ define BUILD_lib
>   libxen$(1): libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a
>   libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: $$(LIBDEPS_$(1)) $$(LIBDEP_$(1))
>   libs-$$(XEN_TARGET_ARCH)/$(1)/libxen$(1).a: mk-headers-$$(XEN_TARGET_ARCH) $$(NEWLIB_STAMPFILE) .phony
> -	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y -C $$(@D) $$(@F)
> +	CPPFLAGS="$$(TARGET_CPPFLAGS)" CFLAGS="$$(TARGET_CFLAGS)" $$(MAKE) CONFIG_LIBXC_MINIOS=y $$(if $$(wildcard $$(@D)/Makefile.common),-f $(CURDIR)/xenlibs.mk) -C $$(@D) $$(@F)
>  
>   clean-libxen$(1):
> -	[ ! -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ] || $$(MAKE) DESTDIR= -C libs-$$(XEN_TARGET_ARCH)/$(1) clean
> +	if [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile.common ]; then \
> +	    $$(MAKE) -f $(CURDIR)/xenlibs.mk -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
> +	elif [ -e libs-$$(XEN_TARGET_ARCH)/$(1)/Makefile ]; then \
> +	    $$(MAKE) -C libs-$$(XEN_TARGET_ARCH)/$(1) clean; \
> +	fi
>  
>   libs-$$(XEN_TARGET_ARCH)/$(1)/stamp: $$(XEN_ROOT)/tools/libs/$(1)/Makefile
>  	$$(do_links)
> -- 
> Anthony PERARD
> 

-- 
Samuel
<y> update-menus: relocation error: update-menus: symbol _ZNSt9basic_iosIcSt11char_traitsIcEE4initEPSt15basic_streambufIcS1_E, version GLIBCPP_3.2 not defined in file libstdc++.so.5 with link time reference
<y> quoi que ça peut bien vouloir dire ?
<D> N a eu la meme merde
<y> c ça que ça veut dire ? wow, c'est bien crypté :)
 -+- #ens-mim s'entraide -+-

