Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KCfDPYadGnS2AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 02:05:58 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BF7D27BDEF
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 02:05:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212684.1523706 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjS5q-0008CM-3L; Sat, 24 Jan 2026 01:05:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212684.1523706; Sat, 24 Jan 2026 01:05:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjS5q-00089W-0M; Sat, 24 Jan 2026 01:05:38 +0000
Received: by outflank-mailman (input) for mailman id 1212684;
 Sat, 24 Jan 2026 01:05:36 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjS5o-00089Q-IH
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 01:05:36 +0000
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id c89f5311-f8c0-11f0-b15f-2bf370ae4941;
 Sat, 24 Jan 2026 02:05:34 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 61AAB40286;
 Sat, 24 Jan 2026 01:05:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CDC4C4CEF1;
 Sat, 24 Jan 2026 01:05:30 +0000 (UTC)
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
X-Inumbo-ID: c89f5311-f8c0-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769216732;
	bh=yBhWOVTLNDqeuWNFpAhlfjEN4+02e6Kfi69pNVEw5OQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=Ep5gOZe1/w4FDhhmm/1kC0qQmP5kgCjXyGr6DqXj5FpapsU3VUUt0HfCy2YlwLR1C
	 LhsvI0X0dmkaKlFr5U5oPdQ57eU4fmVJPdIwHxoazIB3l0VZEuDiBY9/1tkAEzKIuo
	 pJ1uO9h2O2ok7K9G+3CI5cqqKXBXagGiblyVeCZ7k2fDJOjBcXrvwd0urI2opkCEBI
	 VSpIROnKHGBxMMe02NOMxj8CZIwPqN9dRI15gbvQlDQ84wGll8ElJuHj3uWnE3xKnK
	 DvXkaoGvSwkaCNLhN1Rr3pWmDFUqQALu6nKysgxtexLQVEV3tHw0qV6aJqweMSZhQk
	 N3NHh/npLFOKg==
Date: Fri, 23 Jan 2026 17:05:29 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 2/4] tests: introduce common fragment for unit tests
In-Reply-To: <20260111041145.553673-3-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231705120.7192@ubuntu-linux-20-04-desktop>
References: <20260111041145.553673-1-dmukhin@ford.com> <20260111041145.553673-3-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xen.org:email,ford.com:email,lists.xenproject.org:helo,lists.xenproject.org:rdns];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:19994, ipnet:192.237.128.0/18, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[xen-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: BF7D27BDEF
X-Rspamd-Action: no action

On Sat, 10 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Move test harness generation into a new shared make fragment so that
> it can be reused by other unit tests.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>

Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>


> ---
> Changes from v1:
> - moved fragment to tools/tests/
> ---
>  tools/tests/Rules.mk       | 91 ++++++++++++++++++++++++++++++++++++++
>  tools/tests/domid/Makefile | 85 +----------------------------------
>  2 files changed, 92 insertions(+), 84 deletions(-)
>  create mode 100644 tools/tests/Rules.mk
> 
> diff --git a/tools/tests/Rules.mk b/tools/tests/Rules.mk
> new file mode 100644
> index 000000000000..daa9e69301e4
> --- /dev/null
> +++ b/tools/tests/Rules.mk
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Common unit test fragment.
> +#
> +# Copyright 2025 Ford Motor Company
> +
> +include $(XEN_ROOT)/tools/Rules.mk
> +
> +define list-c-headers
> +$(shell sed -n \
> +    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
> +endef
> +
> +# Generate mock environment by replicating header file hierarchy;
> +# each header file will point to a harness header.
> +#
> +# $1 target
> +# $2 list of test harnesses
> +define emit-harness-nested-rule
> +$(1): $(2)
> +	set -e; \
> +	mkdir -p $$(@D); \
> +	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
> +
> +endef
> +
> +# Helper function to emit mocked hypervisor code dependencies.
> +#
> +# $1 Harness file name.
> +# $2 Mocked hypervisor file name.
> +# $3 List of dependencies to mock.
> +define emit-harness-rules
> +$(foreach x,$(3),$(call emit-harness-nested-rule,\
> +                        $(CURDIR)/generated/$(x),\
> +                        $(addprefix $(CURDIR)/,$(1))))
> +$(2:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
> +endef
> +
> +define emit-harness-deps
> +$(if $(strip $(3)),$(call emit-harness-rules,$1,$2,$3),)
> +endef
> +
> +# Emit dependencies for mocked hypervisor code.
> +#
> +# $1 Hypervisor file name.
> +# $2 Hypervisor source path.
> +# $3 Harness header file name (optional).
> +define vpath-with-harness-deps
> +vpath $(1) $(2)
> +$(call emit-harness-deps,$(or $(strip $(3)),harness.h),\
> +                         $(1),\
> +                         $(call list-c-headers,$(2)$(1)))
> +endef
> +
> +.PHONY: all
> +all: $(TESTS)
> +
> +.PHONY: run
> +run: $(TESTS)
> +ifeq ($(CC),$(HOSTCC))
> +	set -e; $(foreach t,$(TESTS),./$(t);)
> +else
> +	$(warning HOSTCC != CC, will not run test)
> +endif
> +
> +.PHONY: clean
> +clean:
> +	$(RM) -r generated
> +	$(RM) -- *.o $(TESTS) $(DEPS_RM)
> +
> +.PHONY: distclean
> +distclean: clean
> +	$(RM) -- *~
> +
> +.PHONY: install
> +install: all
> +	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> +	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
> +
> +.PHONY: uninstall
> +uninstall:
> +	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
> +
> +CFLAGS += -D__XEN_TOOLS__
> +# Honor mocked hypervisor header over tools/include/xen symlinks
> +CFLAGS += -I$(CURDIR)/generated/
> +CFLAGS += $(CFLAGS_xeninclude)
> +
> +ifeq ($(filter clean distclean,$(MAKECMDGOALS)),)
> +-include $(DEPS_INCLUDE)
> +endif
> diff --git a/tools/tests/domid/Makefile b/tools/tests/domid/Makefile
> index dd22a25b038a..2f8cc5380462 100644
> --- a/tools/tests/domid/Makefile
> +++ b/tools/tests/domid/Makefile
> @@ -7,84 +7,7 @@
>  TESTS := test-domid
>  
>  XEN_ROOT = $(CURDIR)/../../..
> -include $(XEN_ROOT)/tools/Rules.mk
> -
> -define list-c-headers
> -$(shell sed -n \
> -    's/^[ \t]*# *include[ \t]*[<"]\([^">]*\)[">].*/\1/p' $(1) 2>/dev/null)
> -endef
> -
> -# Generate mock environment by replicating header file hierarchy;
> -# each header file will point to a harness header.
> -#
> -# $1 target
> -# $2 list of test harnesses
> -define emit-harness-nested-rule
> -$(1): $(2)
> -	set -e; \
> -	mkdir -p $$(@D); \
> -	for i in $(2); do [ -e $$@ ] || ln -s $$$$i $$@; done
> -
> -endef
> -
> -# Helper function to emit mocked hypervisor code dependencies.
> -#
> -# $1 Harness file name.
> -# $2 Mocked hypervisor file name.
> -# $3 List of dependencies to mock.
> -define emit-harness-rules
> -$(foreach x,$(3),$(call emit-harness-nested-rule,\
> -                        $(CURDIR)/generated/$(x),\
> -                        $(addprefix $(CURDIR)/,$(1))))
> -$(2:.c=.o): $(addprefix $(CURDIR)/generated/,$(3))
> -endef
> -
> -define emit-harness-deps
> -$(if $(strip $(3)),$(call emit-harness-rules,$1,$2,$3),)
> -endef
> -
> -# Emit dependencies for mocked hypervisor code.
> -#
> -# $1 Hypervisor file name.
> -# $2 Hypervisor source path.
> -# $3 Harness header file name (optional).
> -define vpath-with-harness-deps
> -vpath $(1) $(2)
> -$(call emit-harness-deps,$(or $(strip $(3)),harness.h),\
> -                         $(1),\
> -                         $(call list-c-headers,$(2)$(1)))
> -endef
> -
> -.PHONY: all
> -all: $(TESTS)
> -
> -.PHONY: run
> -run: $(TESTS)
> -ifeq ($(CC),$(HOSTCC))
> -	set -e; $(foreach t,$(TESTS),./$(t);)
> -else
> -	$(warning HOSTCC != CC, will not run test)
> -endif
> -
> -.PHONY: clean
> -clean:
> -	$(RM) -r generated
> -	$(RM) -- *.o $(TESTS) $(DEPS_RM)
> -
> -.PHONY: distclean
> -distclean: clean
> -	$(RM) -- *~
> -
> -.PHONY: install
> -install: all
> -	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> -	set -e; $(foreach t,$(TESTS),$(INSTALL_PROG) $t $(DESTDIR)$(LIBEXEC)/tests;)
> -
> -.PHONY: uninstall
> -uninstall:
> -	set -e; $(foreach t,$(TESTS),$(RM) -- $(DESTDIR)$(LIBEXEC)/tests/$t;)
> -
> -CFLAGS += -D__XEN_TOOLS__
> +include $(XEN_ROOT)/tools/tests/Rules.mk
>  
>  # find-next-bit.c
>  CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
> @@ -96,10 +19,6 @@ CFLAGS-find-next-bit.c += '-DEXPORT_SYMBOL(x)=' \
>  
>  find-next-bit.o: CFLAGS += $(CFLAGS-find-next-bit.c)
>  
> -# Honor mocked hypervisor header over tools/include/xen symlinks
> -CFLAGS += -I$(CURDIR)/generated/
> -CFLAGS += $(CFLAGS_xeninclude)
> -
>  vpath find-next-bit.c $(XEN_ROOT)/xen/lib/
>  
>  # Point to the hypervisor code and generate test harness dependencies
> @@ -109,5 +28,3 @@ $(eval $(call vpath-with-harness-deps,domid.c,$(XEN_ROOT)/xen/common/))
>  
>  test-domid: domid.o find-next-bit.o test-domid.o
>  	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
> -
> --include $(DEPS_INCLUDE)
> -- 
> 2.52.0
> 

