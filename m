Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 45A8E3F5CA1
	for <lists+xen-devel@lfdr.de>; Tue, 24 Aug 2021 13:01:50 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.170975.312137 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBR-0005ML-Co; Tue, 24 Aug 2021 11:01:33 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 170975.312137; Tue, 24 Aug 2021 11:01:33 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1mIUBQ-0005GM-HW; Tue, 24 Aug 2021 11:01:32 +0000
Received: by outflank-mailman (input) for mailman id 170975;
 Tue, 24 Aug 2021 11:01:30 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=MxNM=NP=citrix.com=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1mIU1x-0001EC-9V
 for xen-devel@lists.xenproject.org; Tue, 24 Aug 2021 10:51:45 +0000
Received: from esa2.hc3370-68.iphmx.com (unknown [216.71.145.153])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c425c8f3-66b6-4f5d-a715-381d512cfa24;
 Tue, 24 Aug 2021 10:51:08 +0000 (UTC)
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
X-Inumbo-ID: c425c8f3-66b6-4f5d-a715-381d512cfa24
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1629802268;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fDJGU3FkNLcK/b6b+O2MvcAjqOVoHCERsz8l937Wo3Y=;
  b=gJQ4E4xqPbpeCd7bVUdlEJhMg04N7JjFdlJ4qFKlV65jMEzbSyQTqq8x
   fh94BXFUPb6dSfZF/D2AQVsKD1ZGlz+lZVT0yzUtTpqSmb2NFjTv89E17
   pGzG24Y3wJ4DGH8ws1gC7Dv91s62UB+TWxxk9KMjzirc7zVkPAjIoJ5us
   A=;
Authentication-Results: esa2.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: o4GYAJKiEqeohc1zWN8L7hnKNGzoj4T0925gua+IWeEGOBw84hGr/N0oyoyJl4AcSpqfCMDPz7
 uNyDoe2/qcD5QBn6HQerPN0woY9bdV5/PfeAtHa4JzPfJOYHHexfhFLtq4zE1QrhmUxjdjuVQS
 y/rWCh7DsW5iw2VkBoVqZQ53V+8ZdODIzx96bGtZwmjN6qN8QYTB9TGz4MWQ910vXQKVA8eZ6I
 py5Q3VAb8dMUv6CklQvdmyEw8W/0mvZQBRsp1DLjek45MIbBRMnpp5i9eSxi9IebtGjF5h1608
 ah9uH3+7EKOk6+iZk0qgswAP
X-SBRS: 5.1
X-MesageID: 51130726
X-Ironport-Server: esa2.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:SfC356yGMaLhi5qMcGgXKrPxnuskLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9IYgBapTiBUJPwIk80hqQFm7X5XI3SEDUO3VHFEGgM1/qE/9SNIUzDH6tmpN
 9dmstFeZLN5DpB/KDHCWCDer5OruVvsprY/Ns2pE0dLz2CHpsQizuRfTzrd3GeKjMnObMJUL
 6nouZXrTupfnoaKu6hAGMeYuTFr9rX0Lr7fB8vHXccmUizpALtzIS/PwmT3x8YXT8K66wl63
 L5nwvw4bjmm+2nyyXby3TY4/1t6ZvcI5p4dY+xY/ouW3DRYzWTFcBcsnq5zXcISdSUmRQXeR
 /30lEd1opImirslyqO0GbQMkHboUoTAjnZuBGlaDLY0LPEbSN/BMxbiY1DdBzFr0ImodFnya
 pOm3mUrpxNEHr77WzADnfzJmJXf2eP0AwfeNQo/jViuEolGc1shJ1a+FkQHIYLHSr85oxiGO
 5yDNvE7PITdV+BdXjWsmRm3dTpBx0Ib127a1lHvtbQ3yldnXh/wUddzMsDnm0Y/JZ4T5Vf/e
 zLPqlhibkLRM4LaqB2AvsHXKKMeyfwaAOJNHjXLUXsFakBNX6Io5nr4K8t7OXvY5AMxItaou
 W3bLqZjx9HR6vKM7zC4HRmyGG9fIyNZ0WZ9igF3ekGhlTVfsuaDRG+
X-IronPort-AV: E=Sophos;i="5.84,347,1620705600"; 
   d="scan'208";a="51130726"
From: Anthony PERARD <anthony.perard@citrix.com>
To: <xen-devel@lists.xenproject.org>
CC: Anthony PERARD <anthony.perard@citrix.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Volodymyr Babchuk
	<Volodymyr_Babchuk@epam.com>
Subject: [XEN PATCH v7 12/51] build: avoid building arm/arm/*/head.o twice
Date: Tue, 24 Aug 2021 11:49:59 +0100
Message-ID: <20210824105038.1257926-13-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210824105038.1257926-1-anthony.perard@citrix.com>
References: <20210824105038.1257926-1-anthony.perard@citrix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

head.o is been built twice, once because it is in $(ALL_OBJS) and a
second time because it is in $(extra-y) and thus it is rebuilt when
building "arch/arm/built_in.o".

Fix this by adding a dependency of "head.o" on the directory
"arch/arm/".

Also, we should avoid building object that are in subdirectories, so
move the declaration in there. This doesn't change anything as
"arch/arm/built_in.o" depends on "arch/arm/$subarch/built_in.o" which
depends on $(extra-y), so we still need to depend on
"arch/arm/built_in.o".

Signed-off-by: Anthony PERARD <anthony.perard@citrix.com>
---
 xen/arch/arm/Makefile       | 7 ++++++-
 xen/arch/arm/arm32/Makefile | 1 +
 xen/arch/arm/arm64/Makefile | 2 ++
 3 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/xen/arch/arm/Makefile b/xen/arch/arm/Makefile
index 3d0af8ebc93c..cc90d9796e6e 100644
--- a/xen/arch/arm/Makefile
+++ b/xen/arch/arm/Makefile
@@ -64,7 +64,6 @@ obj-$(CONFIG_SBSA_VUART_CONSOLE) += vpl011.o
 obj-y += vsmc.o
 obj-y += vpsci.o
 obj-y += vuart.o
-extra-y += $(TARGET_SUBARCH)/head.o
 
 extra-y += xen.lds
 
@@ -76,6 +75,12 @@ endif
 
 ALL_OBJS := $(TARGET_SUBARCH)/head.o $(ALL_OBJS)
 
+# head.o is built by descending into the sub-directory, depends on the part of
+# $(ALL_OBJS) that will eventually recurse into $(TARGET_SUBARCH)/ and build
+# head.o
+$(TARGET_SUBARCH)/head.o: $(BASEDIR)/arch/arm/built_in.o
+$(TARGET_SUBARCH)/head.o: ;
+
 ifdef CONFIG_LIVEPATCH
 all_symbols = --all-symbols
 ifdef CONFIG_FAST_SYMBOL_LOOKUP
diff --git a/xen/arch/arm/arm32/Makefile b/xen/arch/arm/arm32/Makefile
index 96105d238307..3040eabce3ad 100644
--- a/xen/arch/arm/arm32/Makefile
+++ b/xen/arch/arm/arm32/Makefile
@@ -11,3 +11,4 @@ obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
 
+extra-y += head.o
diff --git a/xen/arch/arm/arm64/Makefile b/xen/arch/arm/arm64/Makefile
index 40642ff57494..0bb284dedab2 100644
--- a/xen/arch/arm/arm64/Makefile
+++ b/xen/arch/arm/arm64/Makefile
@@ -13,3 +13,5 @@ obj-y += smpboot.o
 obj-y += traps.o
 obj-y += vfp.o
 obj-y += vsysreg.o
+
+extra-y += head.o
-- 
Anthony PERARD


