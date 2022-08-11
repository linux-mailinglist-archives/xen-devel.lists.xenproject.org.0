Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 12FAA590550
	for <lists+xen-devel@lfdr.de>; Thu, 11 Aug 2022 19:00:17 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.384974.620580 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXT-0003Ai-OF; Thu, 11 Aug 2022 17:00:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 384974.620580; Thu, 11 Aug 2022 17:00:07 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1oMBXS-0002k4-Nk; Thu, 11 Aug 2022 17:00:06 +0000
Received: by outflank-mailman (input) for mailman id 384974;
 Thu, 11 Aug 2022 17:00:02 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=jhQd=YP=citrix.com=prvs=21531f474=anthony.perard@srs-se1.protection.inumbo.net>)
 id 1oMBNF-0003Aq-4R
 for xen-devel@lists.xenproject.org; Thu, 11 Aug 2022 16:49:33 +0000
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com
 [216.71.145.142]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 91429361-1995-11ed-bd2e-47488cf2e6aa;
 Thu, 11 Aug 2022 18:49:31 +0200 (CEST)
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
X-Inumbo-ID: 91429361-1995-11ed-bd2e-47488cf2e6aa
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1660236570;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2Y09ZveeXsnK5zkGHgMts4gAI2d4WcooLONx/5eIfns=;
  b=SVSPGxRzA37g+Njw08565uIcJJb183hbNyIxTzMPadyNRxvbPkJB8mCH
   gbL4U0sYHy+8CTVZuzBC9TrcBqLG5+Cns93NY8ngZciLx3Dwzfsl4j5m1
   kd12tUZ9zIRi77wwLcpXxCxF8ydgQAZsfzKWE1XLJ+Mbrn4hTfMH4RxG+
   o=;
Authentication-Results: esa1.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 78334368
X-Ironport-Server: esa1.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:TPPWoKtcNkjam30gOlF4KI/VEefnVDxeMUV32f8akzHdYApBsoF/q
 tZmKW+FOPiDNmPxfNknbo228k4B68WDy4QxGVFvqig3EyxA+JbJXdiXEBz9bniYRiHhoOOLz
 Cm8hv3odp1coqr0/0/1WlTZhSAgk/vOHtIQMcacUghpXwhoVSw9vhxqnu89k+ZAjMOwRgiAo
 rsemeWGULOe82MyYzl8B56r8ks15qyi4WpA5DTSWNgQ1LPgvyhNZH4gDfnZw0vQGuF8AuO8T
 uDf+7C1lkuxE8AFU47Nfh7TKyXmc5aKVeS8oiM+t5uK23CukhcawKcjXMfwXG8M49m/c3Kd/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTGCFcpqHLWyKE/hlgMK05Fd0g38RwCEVOz
 NpbGAI1aQu8rMSH+r3uH4GAhux7RCXqFIYWu3UmxjDFF/c2B5vERs0m5/cBgm123JoXW6+DO
 YxJMlKDbzyZC/FLEl4RFJI5mvbunnTleidUgFmUubA28y7YywkZPL3Fb4qOIYDRG5U9ckCwt
 Hnj9UPQRSghHZ+Q7AKl/yKIiuSUgnauMG4VPOLhraM76LGJ/UQMDDUGWF39puO24ma6RtlWb
 UId/CEjqawv3EWxS5/2WBjQiG6JuFsQVsRdF8U+6RqR0ezE7gCBHG8GQzVdLts8u6cLqScCj
 wHT2YmzXHo27ePTGSn1GqqoQS2aaRAwD2gLQS89a0g10eHku74YqCP1QYM2eEKqteEZCQ0c0
 hjT8nZm3+RM1JdVv0mo1QuZ2mzx//AlWiZwv1yKBTz9s2uVcab/P+SVBU7nAeGsxWpzZn2Ip
 zA6lseX94ji5rndxXXWEI3h8FxEjstp0QEwYnY1RvHNDxz3pxaekXl4uVmS3ntBPMceYiPOa
 0TOow5X75I7FCL0M/cvPNroWpR3l/KI+THZuhf8MLJzjmVZLlfbrEmCm2bJt4wSrKTcuf5mY
 srKGSpdJX0bFb5m3FKLegvp6pdyn3hW7T6CGvjGI+GPi+X2iIi9FehYazNjr4kRsMu5neki2
 4oGa5fWlk4PDLSWj+u+2dd7EG3m5EMTXfjew/G7vMbZSua6MAnN08Ps/I4=
IronPort-HdrOrdr: A9a23:c//VTa2bW3gLUZkmrZ3jsgqjBIokLtp133Aq2lEZdPRUGvb3qy
 nIpoV86faUskdoZJhOo7C90cW7LU80sKQFhLX5Xo3SOzUO2lHYT72KhLGKq1aLdhEWtNQtsZ
 uIG5IOceEYZmIasS+V2maF+q4bsbu6zJw=
X-IronPort-AV: E=Sophos;i="5.93,230,1654574400"; 
   d="scan'208";a="78334368"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Luca Fancellu
	<luca.fancellu@arm.com>, Wei Liu <wl@xen.org>
Subject: [XEN PATCH v4 19/32] tools/console: Use $(xenlibs-ldlibs,)
Date: Thu, 11 Aug 2022 17:48:32 +0100
Message-ID: <20220811164845.38083-20-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220811164845.38083-1-anthony.perard@citrix.com>
References: <20220811164845.38083-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
Reviewed-by: Luca Fancellu <luca.fancellu@arm.com>
---
 tools/console/client/Makefile | 3 +--
 tools/console/daemon/Makefile | 6 +-----
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/console/client/Makefile b/tools/console/client/Makefile
index 44176c6d93..e2f2554f92 100644
--- a/tools/console/client/Makefile
+++ b/tools/console/client/Makefile
@@ -6,8 +6,7 @@ CFLAGS += $(CFLAGS_libxenctrl)
 CFLAGS += $(CFLAGS_libxenstore)
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-LDLIBS += $(LDLIBS_libxenctrl)
-LDLIBS += $(LDLIBS_libxenstore)
+LDLIBS += $(call xenlibs-ldlibs,ctrl store)
 LDLIBS += $(SOCKET_LIBS)
 
 OBJS-y := main.o
diff --git a/tools/console/daemon/Makefile b/tools/console/daemon/Makefile
index 0f004f0b14..99bb33b6a2 100644
--- a/tools/console/daemon/Makefile
+++ b/tools/console/daemon/Makefile
@@ -10,11 +10,7 @@ CFLAGS += $(CFLAGS_libxenforeignmemory)
 CFLAGS-$(CONFIG_ARM) += -DCONFIG_ARM
 CFLAGS += -include $(XEN_ROOT)/tools/config.h
 
-LDLIBS += $(LDLIBS_libxenctrl)
-LDLIBS += $(LDLIBS_libxenstore)
-LDLIBS += $(LDLIBS_libxenevtchn)
-LDLIBS += $(LDLIBS_libxengnttab)
-LDLIBS += $(LDLIBS_libxenforeignmemory)
+LDLIBS += $(call xenlibs-ldlibs,ctrl store evtchn gnttab foreignmemory)
 LDLIBS += $(SOCKET_LIBS)
 LDLIBS += $(UTIL_LIBS)
 LDLIBS += -lrt
-- 
Anthony PERARD


