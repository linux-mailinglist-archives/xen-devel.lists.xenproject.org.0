Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CEDE590514
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 18:49:37 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384788.620299 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMr-0004eA-A6; Thu, 11 Aug 2022 16:49:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384788.620299; Thu, 11 Aug 2022 16:49:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBMr-0004Wp-1Q; Thu, 11 Aug 2022 16:49:09 +0000
Received: by outflank-mailman (input) for mailman id 384788;
 Thu, 11 Aug 2022 16:49:07 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBMp-0003s9-7m
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:07 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 81a2f48f-1995-11ed-924f-1f966e50362f;
 Thu, 11 Aug 2022 18:49:04 +0200 (CEST)
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
X-Inumbo-ID: 81a2f48f-1995-11ed-924f-1f966e50362f
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236544;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gjxG4UugGwSCb9wRzYZyec8iEMLX7UmigAqba15IK2A=;
  b=Ca8vguqhH9MiMHrB7qfh8teFLkmdKyGAwRsa0A+ChJ3nM2Lgc2xmJ06n
   rfQgRBhdmvy4lwyG79EQOH3q0Bf4QghjR8jFDlS4EkyhgfGvQF9tkemk/
   kWqMsOxGxK6A51mWYnbeJLgdv3Ir38fQvqlTslUrp1UhBZ4yWDO1DUvM9
   I=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78334312
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:/4cj/6vLQyM2aWAMgFf/zfiXw+fnVDxeMUV32f8akzHdYApBsoF/q
 tZmKTqAP/zZazT8e9pxOtiwpB9X6JOGx95rQVBt/ng3RioT+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4WpA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05FY0YysZ8P0sJz
 MIdJBEkZU661ry38JvuH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3Fb4qOIYDRHJ89ckCwu
 lLh3XTHWB4mKtWAymqo8lme2bGTpHauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24ma6RtlWb
 UId/CEjqawv3EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aOSglDWQ8T2g9cw4JwvDo/rhi0BP/Z4M2eEKqteEZCQ0c0
 hjT8nZm3+RM1JdVv0mo1QuZ2mzx//AlWiZwv1yKBTz9s2uVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwYnY1RvHNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0M/cvPNroWpR3l/KI+THZuhf8MLJzjmVZLlfbrEmCm2bJt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLegvp6pdyn3hW7T6CGvjGI+GPi+X2iIi9FehYazNjr4kRsMu5neki2
 4oGa5fWlk4PDLSWj+u+2dd7EG3m5EMTXfjew/G7vMbSSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:qc3dzajltrtv8yiecBQELNVcw3BQXuIji2hC6mlwRA09TySZ//
 rBoB19726TtN9xYgBZpTnuAsm9qB/nmaKdpLNhWItKPzOW31dATrsSjrcKqgeIc0aVm9K1l5
 0QF5SWYOeAdGSS5vya3ODXKbkdKaG8gcKVuds=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="78334312"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 06/32] tools/xenpaging: Rework makefile
Date: Thu, 11 Aug 2022 17:48:19 +0100
Message-ID: <20220811164845.38083-7-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

- Rename $(SRCS) to $(OBJS-y), we don't need to collect sources.
- Rename $(IBINS) to $(TARGETS)
- Stop cleaning "xen" and non-set variable $(LIB).

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/xenpaging/Makefile | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/xenpaging/Makefile b/tools/xenpaging/Makefile
index 04743b335c..e2ed9eaa3f 100644
--- a/tools/xenpaging/Makefile
+++ b/tools/xenpaging/Makefile
@@ -5,33 +5,33 @@ CFLAGS += $(CFLAGS_libxentoollog) $(CFLAGS_libxenevtchn) $(CFLAGS_libxenctrl) $(
 LDLIBS += $(LDLIBS_libxentoollog) $(LDLIBS_libxenevtchn) $(LDLIBS_libxenctrl) $(LDLIBS_libxenstore) $(PTHREAD_LIBS)
 LDFLAGS += $(PTHREAD_LDFLAGS)
 
-POLICY    = default
+POLICY   := default
 
-SRC      :=
-SRCS     += file_ops.c xenpaging.c policy_$(POLICY).c
-SRCS     += pagein.c
+OBJS-y   := file_ops.o
+OBJS-y   += xenpaging.o
+OBJS-y   += policy_$(POLICY).o
+OBJS-y   += pagein.o
 
 CFLAGS   += -Werror
 CFLAGS   += -Wno-unused
 
-OBJS     = $(SRCS:.c=.o)
-IBINS    = xenpaging
+TARGETS := xenpaging
 
-all: $(IBINS)
+all: $(TARGETS)
 
-xenpaging: $(OBJS)
+xenpaging: $(OBJS-y)
 	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS) $(APPEND_LDFLAGS)
 
 install: all
 	$(INSTALL_DIR) -m 0700 $(DESTDIR)$(XEN_PAGING_DIR)
 	$(INSTALL_DIR) $(DESTDIR)$(LIBEXEC_BIN)
-	$(INSTALL_PROG) $(IBINS) $(DESTDIR)$(LIBEXEC_BIN)
+	$(INSTALL_PROG) $(TARGETS) $(DESTDIR)$(LIBEXEC_BIN)
 
 uninstall:
-	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(IBINS))
+	rm -f $(addprefix $(DESTDIR)$(LIBEXEC_BIN)/, $(TARGETS))
 
 clean:
-	rm -f *.o *~ $(DEPS_RM) xen TAGS $(IBINS) $(LIB)
+	rm -f *.o *~ $(DEPS_RM) TAGS $(TARGETS)
 
 distclean: clean
 
@@ -39,6 +39,6 @@ distclean: clean
 
 .PHONY: TAGS
 TAGS:
-	etags -t $(SRCS) *.h
+	etags -t *.c *.h
 
 -include $(DEPS_INCLUDE)
-- 
Anthony PERARD


