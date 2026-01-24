Return-Path: <xen-devel-bounces@lists.xenproject.org>
Delivered-To: lists+xen-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id vNJWO8YbdGn82AAAu9opvQ
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 02:09:26 +0100
X-Original-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 54ABE7BE08
	for <lists+xen-devel@lfdr.de>; Sat, 24 Jan 2026 02:09:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1212695.1523717 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjS9L-0000QG-Ik; Sat, 24 Jan 2026 01:09:15 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1212695.1523717; Sat, 24 Jan 2026 01:09:15 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vjS9L-0000Nb-FV; Sat, 24 Jan 2026 01:09:15 +0000
Received: by outflank-mailman (input) for mailman id 1212695;
 Sat, 24 Jan 2026 01:09:14 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=S/rR=75=kernel.org=sstabellini@srs-se1.protection.inumbo.net>)
 id 1vjS9J-0000NV-8a
 for xen-devel@lists.xenproject.org; Sat, 24 Jan 2026 01:09:14 +0000
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 498f7523-f8c1-11f0-b15f-2bf370ae4941;
 Sat, 24 Jan 2026 02:09:10 +0100 (CET)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B31F060053;
 Sat, 24 Jan 2026 01:09:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4536C4CEF1;
 Sat, 24 Jan 2026 01:09:06 +0000 (UTC)
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
X-Inumbo-ID: 498f7523-f8c1-11f0-b15f-2bf370ae4941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769216948;
	bh=+3fi8RZctfjG3VqR4sC5cK3NwbwuhFLgun6TZwKtuKs=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=G9vX85SBbJpgY34xqSS5KEp4DIW7/8bXtDv4BYoaPIulSoxYe6YnwhNhbfgavyzkJ
	 AdjVbAQ8EzwtxuwX7VjL90QbDrXVbj3wZYFxwpCbwHKSixPpFh+/gkmFRqL9HsUdQ4
	 P2fReKJC2qwdYeOdttn5f2lvnZvagx4NC73PVvceaFOVMj5PecKvc4iSeyCgO8Lzmc
	 gJHVpt+8HfMEoyKHvLk2l9TTXRPGeMxu5mHeVEAMb1nJlQNC0mwx36t7QptstYhQHU
	 RXbfzJg6rj0Rf/LJjqtBu/WQjtu0VNF9ItWZGFGSzVEhWLT5sDrzvde6g9qcqw8ZLY
	 OKhXeuh+BOmaA==
Date: Fri, 23 Jan 2026 17:09:05 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: dmukhin@xen.org
cc: xen-devel@lists.xenproject.org, andrew.cooper3@citrix.com, 
    anthony.perard@vates.tech, jbeulich@suse.com, julien@xen.org, 
    michal.orzel@amd.com, roger.pau@citrix.com, sstabellini@kernel.org, 
    dmukhin@ford.com
Subject: Re: [PATCH v2 3/4] tests: use unit test fragment in PDX test
In-Reply-To: <20260111041145.553673-4-dmukhin@ford.com>
Message-ID: <alpine.DEB.2.22.394.2601231708190.7192@ubuntu-linux-20-04-desktop>
References: <20260111041145.553673-1-dmukhin@ford.com> <20260111041145.553673-4-dmukhin@ford.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.69 / 15.00];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+a:lists.xenproject.org:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.18)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,lists.xenproject.org:helo,lists.xenproject.org:rdns,ford.com:email];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:dmukhin@xen.org,m:xen-devel@lists.xenproject.org,m:andrew.cooper3@citrix.com,m:anthony.perard@vates.tech,m:jbeulich@suse.com,m:julien@xen.org,m:michal.orzel@amd.com,m:roger.pau@citrix.com,m:sstabellini@kernel.org,m:dmukhin@ford.com,s:lists@lfdr.de];
	FORWARDED(0.00)[mailman];
	FORGED_SENDER(0.00)[sstabellini@kernel.org,xen-devel-bounces@lists.xenproject.org];
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
X-Rspamd-Queue-Id: 54ABE7BE08
X-Rspamd-Action: no action

On Sat, 10 Jan 2026, dmukhin@xen.org wrote:
> From: Denis Mukhin <dmukhin@ford.com> 
> 
> Use the new make fragment to generate test harness code for the PDX unit test.
> 
> Move <xen/bitops.h> earlier in xen/common/pdx.c to ensure harness.h is
> included before triggering the #ifndef MAX_PFN_RANGES check when building a
> unit test.
> 
> Additionally, use real <xen/pdx.h> in harness.h instead of a locally
> copied version.
> 
> Update .gitignore to exclude generated test build-time dependencies.
> 
> Not a functional change.
> 
> Signed-off-by: Denis Mukhin <dmukhin@ford.com>
> ---
> Changes since v1:
> - new patch
> ---
>  tools/tests/pdx/.gitignore |  2 +-
>  tools/tests/pdx/Makefile   | 55 +++++++++-----------------------------
>  tools/tests/pdx/harness.h  |  2 +-
>  tools/tests/pdx/test-pdx.c |  2 --
>  xen/common/pdx.c           |  3 ++-
>  5 files changed, 16 insertions(+), 48 deletions(-)
> 
> diff --git a/tools/tests/pdx/.gitignore b/tools/tests/pdx/.gitignore
> index 1202a531a7fd..1bf9c05985c4 100644
> --- a/tools/tests/pdx/.gitignore
> +++ b/tools/tests/pdx/.gitignore
> @@ -1,3 +1,3 @@
> -/pdx.h
> +/generated
>  /test-pdx-mask
>  /test-pdx-offset
> diff --git a/tools/tests/pdx/Makefile b/tools/tests/pdx/Makefile
> index 3c431d7c7822..178b451cb611 100644
> --- a/tools/tests/pdx/Makefile
> +++ b/tools/tests/pdx/Makefile
> @@ -1,50 +1,19 @@
> -XEN_ROOT=$(CURDIR)/../../..
> -include $(XEN_ROOT)/tools/Rules.mk
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Unit tests for PDX (Page inDeX).
> +#
>  
> -TARGETS := test-pdx-mask test-pdx-offset
> +TESTS := test-pdx-mask test-pdx-offset
>  
> -.PHONY: all
> -all: $(TARGETS)
> +XEN_ROOT = $(CURDIR)/../../..
>  
> -.PHONY: run
> -run: $(TARGETS)
> -ifeq ($(CC),$(HOSTCC))
> -	set -e;             \
> -	for test in $? ; do \
> -		./$$test ;  \
> -	done
> -else
> -	$(warning HOSTCC != CC, will not run test)
> -endif
> +CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
>  
> -.PHONY: clean
> -clean:
> -	$(RM) -- *.o $(TARGETS) $(DEPS_RM) pdx.h
> +include $(XEN_ROOT)/tools/tests/Rules.mk
>  
> -.PHONY: distclean
> -distclean: clean
> -	$(RM) -- *~
> +CFLAGS += -I $(XEN_ROOT)/xen/include/
>  
> -.PHONY: install
> -install: all
> -	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC)/tests
> -	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC)/tests
> +$(eval $(call vpath-with-harness-deps,pdx.c,$(XEN_ROOT)/xen/common/))
>  
> -.PHONY: uninstall
> -uninstall:
> -	$(RM) -- $(patsubst %,$(DESTDIR)$(LIBEXEC)/tests/%,$(TARGETS))
> -
> -pdx.h: $(XEN_ROOT)/xen/include/xen/pdx.h
> -	sed -e '/^#[[:space:]]*include/d' <$< >$@
> -
> -CFLAGS += -D__XEN_TOOLS__
> -CFLAGS += $(APPEND_CFLAGS)
> -CFLAGS += $(CFLAGS_xeninclude)
> -
> -test-pdx-mask: CFLAGS += -DCONFIG_PDX_MASK_COMPRESSION
> -test-pdx-offset: CFLAGS += -DCONFIG_PDX_OFFSET_COMPRESSION

The test with -DCONFIG_PDX_OFFSET_COMPRESSION is lost?


> -test-pdx-%: test-pdx.c pdx.h
> -	$(CC) $(CPPFLAGS) $(CFLAGS) $(CFLAGS_$*.o) -o $@ $< $(APPEND_CFLAGS)
> -
> --include $(DEPS_INCLUDE)
> +test-pdx-%: test-pdx.o pdx.o
> +	$(CC) $(CFLAGS) $(LDFLAGS) -o $@ $^
> diff --git a/tools/tests/pdx/harness.h b/tools/tests/pdx/harness.h
> index e49d6bcf92c2..4cdda931feb2 100644
> --- a/tools/tests/pdx/harness.h
> +++ b/tools/tests/pdx/harness.h
> @@ -84,7 +84,7 @@ typedef uint64_t paddr_t;
>      qsort(elem, nr, size, cmp);                                         \
>  })
>  
> -#include "pdx.h"
> +#include <xen/pdx.h>
>  
>  #endif
>  
> diff --git a/tools/tests/pdx/test-pdx.c b/tools/tests/pdx/test-pdx.c
> index eefd54c76815..3633c231abaa 100644
> --- a/tools/tests/pdx/test-pdx.c
> +++ b/tools/tests/pdx/test-pdx.c
> @@ -7,8 +7,6 @@
>  
>  #include "harness.h"
>  
> -#include "../../xen/common/pdx.c"
> -
>  struct range {
>      /* Ranges are defined as [start, end). */
>      unsigned long start, end;
> diff --git a/xen/common/pdx.c b/xen/common/pdx.c
> index 7e070ff962e8..068a2098b41b 100644
> --- a/xen/common/pdx.c
> +++ b/xen/common/pdx.c
> @@ -15,11 +15,12 @@
>   * along with this program; If not, see <http://www.gnu.org/licenses/>.
>   */
>  
> +#include <xen/bitops.h>
> +
>  /* Trim content when built for the test harness. */
>  #ifdef __XEN__
>  #include <xen/init.h>
>  #include <xen/mm.h>
> -#include <xen/bitops.h>
>  #include <xen/nospec.h>
>  #include <xen/param.h>
>  #include <xen/pfn.h>
> -- 
> 2.52.0
> 

