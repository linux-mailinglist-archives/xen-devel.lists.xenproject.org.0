Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B9623CABC
	for <lists+xen-devel@lfdr.de>; Wed,  5 Aug 2020 14:52:01 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1k3Itg-0003Lo-DO; Wed, 05 Aug 2020 12:51:56 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=iBnt=BP=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1k3Ite-0003Lc-VC
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2020 12:51:54 +0000
X-Inumbo-ID: c0ce91e3-776a-4307-9d4e-17039861a371
Received: from esa4.hc3370-68.iphmx.com (unknown [216.71.155.144])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id c0ce91e3-776a-4307-9d4e-17039861a371;
 Wed, 05 Aug 2020 12:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1596631913;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rRFT9u3/O3zvV8jxX2uNkA4cBsg0DH2hVxBAe+fvmPE=;
 b=HiTX2IOepLYkTi2o/oX+dTL42qv9b9uk6ILjEECIuVPNG+v4/+mjjmZ1
 dWpfPzYZFo6sV8aJRqZUxI3nyMb/9W5zW7luImr37b0TKr/3MpgmVyd93
 CZjhGBQtf3B+W++3CDQcvy29gWIdvtvK0cAPNXNwLTw40NRh+5HADt0VQ o=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: ohW9JmQu13lbrqMX3sYNIaH378KG3zbGQbpGh5NLpG4SXOlJm58gvC1FP0EN7C3lPO61nRNsqq
 8o9nRuZrqezEWldAMWarq/9chwQYNLQEs2355qDCkXScVcrkG/Obah3o8V1mkp7Y+rKqxiDrbo
 jphMATrqV1EGja5YYJjVYEZsNKuENymEoVvU6y5pihkBJwDjlreG6bB5z3yy8dsyzOn4eCOPlQ
 oWlRUJHe8ZTMCbITrTCTjb7OWIwUSbOqa1Mj9/9uaqrYNJ3aPa7CV8pKZJLaJ8fXNOBAt7tE9+
 Cn8=
X-SBRS: 3.7
X-MesageID: 24813330
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
X-IronPort-AV: E=Sophos;i="5.75,436,1589256000"; d="scan'208";a="24813330"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
Subject: [PATCH] x86/ioapic: Fix style in io_apic.h
Date: Wed, 5 Aug 2020 13:51:24 +0100
Message-ID: <20200805125124.7763-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-BeenThere: xen-devel@lists.xenproject.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wl@xen.org>,
 Jan Beulich <JBeulich@suse.com>,
 =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>

This file is a mix of Xen and Linux styles.  Switch it fully to Xen style.

No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Wei Liu <wl@xen.org>
CC: Roger Pau Monné <roger.pau@citrix.com>
---
 xen/include/asm-x86/io_apic.h | 48 +++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 24 deletions(-)

diff --git a/xen/include/asm-x86/io_apic.h b/xen/include/asm-x86/io_apic.h
index e006b2b8dd..daf17d4c3d 100644
--- a/xen/include/asm-x86/io_apic.h
+++ b/xen/include/asm-x86/io_apic.h
@@ -13,9 +13,9 @@
  * Copyright (C) 1997, 1998, 1999, 2000 Ingo Molnar
  */
 
-#define IO_APIC_BASE(idx) \
-		((volatile int *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + idx) \
-		+ (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
+#define IO_APIC_BASE(idx)                                               \
+    ((volatile int *)(__fix_to_virt(FIX_IO_APIC_BASE_0 + idx)           \
+                      + (mp_ioapics[idx].mpc_apicaddr & ~PAGE_MASK)))
 
 #define IO_APIC_ID(idx) (mp_ioapics[idx].mpc_apicid)
 
@@ -78,14 +78,14 @@ extern int nr_ioapics;
 extern int nr_ioapic_entries[MAX_IO_APICS];
 
 enum ioapic_irq_destination_types {
-	dest_Fixed = 0,
-	dest_LowestPrio = 1,
-	dest_SMI = 2,
-	dest__reserved_1 = 3,
-	dest_NMI = 4,
-	dest_INIT = 5,
-	dest__reserved_2 = 6,
-	dest_ExtINT = 7
+    dest_Fixed = 0,
+    dest_LowestPrio = 1,
+    dest_SMI = 2,
+    dest__reserved_1 = 3,
+    dest_NMI = 4,
+    dest_INIT = 5,
+    dest__reserved_2 = 6,
+    dest_ExtINT = 7
 };
 
 struct IO_APIC_route_entry {
@@ -135,28 +135,28 @@ unsigned int io_apic_gsi_base(unsigned int apic);
 
 static inline unsigned int __io_apic_read(unsigned int apic, unsigned int reg)
 {
-	*IO_APIC_BASE(apic) = reg;
-	return *(IO_APIC_BASE(apic)+4);
+    *IO_APIC_BASE(apic) = reg;
+    return *(IO_APIC_BASE(apic)+4);
 }
 
 static inline unsigned int io_apic_read(unsigned int apic, unsigned int reg)
 {
-	if (ioapic_reg_remapped(reg))
-		return iommu_read_apic_from_ire(apic, reg);
-	return __io_apic_read(apic, reg);
+    if ( ioapic_reg_remapped(reg) )
+        return iommu_read_apic_from_ire(apic, reg);
+    return __io_apic_read(apic, reg);
 }
 
 static inline void __io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
 {
-	*IO_APIC_BASE(apic) = reg;
-	*(IO_APIC_BASE(apic)+4) = value;
+    *IO_APIC_BASE(apic) = reg;
+    *(IO_APIC_BASE(apic)+4) = value;
 }
 
 static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned int value)
 {
-	if (ioapic_reg_remapped(reg))
-		return iommu_update_ire_from_apic(apic, reg, value);
-	__io_apic_write(apic, reg, value);
+    if ( ioapic_reg_remapped(reg) )
+        return iommu_update_ire_from_apic(apic, reg, value);
+    __io_apic_write(apic, reg, value);
 }
 
 /*
@@ -165,9 +165,9 @@ static inline void io_apic_write(unsigned int apic, unsigned int reg, unsigned i
  */
 static inline void io_apic_modify(unsigned int apic, unsigned int reg, unsigned int value)
 {
-	if (ioapic_reg_remapped(reg))
-		return iommu_update_ire_from_apic(apic, reg, value);
-	*(IO_APIC_BASE(apic)+4) = value;
+    if ( ioapic_reg_remapped(reg) )
+        return iommu_update_ire_from_apic(apic, reg, value);
+    *(IO_APIC_BASE(apic)+4) = value;
 }
 
 /* 1 if "noapic" boot option passed */
-- 
2.11.0


