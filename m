Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F181D3A4699
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jun 2021 18:37:27 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.140553.259701 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9W-0001KL-Km; Fri, 11 Jun 2021 16:37:02 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 140553.259701; Fri, 11 Jun 2021 16:37:02 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lrk9W-0001Hm-FP; Fri, 11 Jun 2021 16:37:02 +0000
Received: by outflank-mailman (input) for mailman id 140553;
 Fri, 11 Jun 2021 16:37:01 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Pdcj=LF=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lrk9V-0008Of-68
 for xen-devel@lists.xenproject.org; Fri, 11 Jun 2021 16:37:01 +0000
Received: from esa3.hc3370-68.iphmx.com (unknown [216.71.145.155])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id eddaf960-55c5-49ef-860c-5891f8024d07;
 Fri, 11 Jun 2021 16:36:42 +0000 (UTC)
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
X-Inumbo-ID: eddaf960-55c5-49ef-860c-5891f8024d07
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1623429402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ljXhb6YM4lTDZym7VtQuZUsyYm1RmolfquSRiw5dDh4=;
  b=BBpRcOBE4g+G58uI34dDPbF1I0s3Ecdtle9mxDs2b07fSUzsidCDLHgg
   DShL05T6rCoBhygMsvbcFK9E80fc3mV3uZN4YrF1xCs1PIZClccmz6MAv
   qMbwHRfuCmXp8T9T/R+Sk1OGGxmTSH6toh+/vLcHpc82LThAuqniin1C2
   Y=;
Authentication-Results: esa3.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: cVXV/GDTpGt05FzP2P3Fqd/JusJOCA8XM38W8JEcf8HkKiLsH7OynA+T6mUeldooGDkaMe/bhw
 rmIb1ZtSXBKW625S4pxahD9g3/vLYrhLRUcmiDXlmNaeY0l584g3oGUkEcck91OpqZd72d62ku
 3AQxpkkjABtQ9A3CxuOEUEpyfIp8/qSy1UctNqoNhMDnCwDz2uVzuatKUDNKRc86HVV27Y29YR
 VcxOfMybBZmQDihTdsuwheX5O66gbUXfg9zvGxtUpe6KV/JGkCwuQIU9HvfvafdZBJ1iix+It0
 L5w=
X-SBRS: 5.1
X-MesageID: 45958359
X-Ironport-Server: esa3.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:OGHUaqtjHh3KJMz4Abfz2WR77skDTNV00zEX/kB9WHVpmszxra
 GTdZMgpGfJYVcqKQgdcL+7Scq9qB/nmqKdpLNhWYtKPzOW3ldATrsSj7cKqgeIc0aVm4JgPO
 VbAs9D4bXLfCNHZK3BgDVQfexP/DD+ytHMudvj
X-IronPort-AV: E=Sophos;i="5.83,265,1616472000"; 
   d="scan'208";a="45958359"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Igor Druzhinin <igor.druzhinin@citrix.com>, Edwin Torok
	<edvin.torok@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "Jan
 Beulich" <JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH 4/5] libs/guest: Move struct xc_cpu_policy into xg_private.h
Date: Fri, 11 Jun 2021 17:36:26 +0100
Message-ID: <20210611163627.4878-5-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210611163627.4878-1-andrew.cooper3@citrix.com>
References: <20210611163627.4878-1-andrew.cooper3@citrix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

... so tests can peek at the internals, without the structure being generally
available to users of the library.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 tools/libs/guest/xg_cpuid_x86.c | 11 +----------
 tools/libs/guest/xg_private.h   |  9 +++++++++
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/tools/libs/guest/xg_cpuid_x86.c b/tools/libs/guest/xg_cpuid_x86.c
index ec5a47fde4..e01d657e03 100644
--- a/tools/libs/guest/xg_cpuid_x86.c
+++ b/tools/libs/guest/xg_cpuid_x86.c
@@ -22,7 +22,7 @@
 #include <stdlib.h>
 #include <stdbool.h>
 #include <limits.h>
-#include "xc_private.h"
+#include "xg_private.h"
 #include "xc_bitops.h"
 #include <xen/hvm/params.h>
 #include <xen-tools/libs.h>
@@ -34,18 +34,9 @@ enum {
 
 #include <xen/asm/x86-vendors.h>
 
-#include <xen/lib/x86/cpu-policy.h>
-
 #define bitmaskof(idx)      (1u << ((idx) & 31))
 #define featureword_of(idx) ((idx) >> 5)
 
-struct xc_cpu_policy {
-    struct cpuid_policy cpuid;
-    struct msr_policy msr;
-    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
-    xen_msr_entry_t entries[MSR_MAX_SERIALISED_ENTRIES];
-};
-
 int xc_get_cpu_levelling_caps(xc_interface *xch, uint32_t *caps)
 {
     DECLARE_SYSCTL;
diff --git a/tools/libs/guest/xg_private.h b/tools/libs/guest/xg_private.h
index 03d765da21..59909d2a2c 100644
--- a/tools/libs/guest/xg_private.h
+++ b/tools/libs/guest/xg_private.h
@@ -33,6 +33,8 @@
 #include <xen/elfnote.h>
 #include <xen/libelf/libelf.h>
 
+#include <xen/lib/x86/cpu-policy.h>
+
 #ifndef ELFSIZE
 #include <limits.h>
 #if UINT_MAX == ULONG_MAX
@@ -168,4 +170,11 @@ int pin_table(xc_interface *xch, unsigned int type, unsigned long mfn,
 #define M2P_SIZE(_m)    ROUNDUP(((_m) * sizeof(xen_pfn_t)), M2P_SHIFT)
 #define M2P_CHUNKS(_m)  (M2P_SIZE((_m)) >> M2P_SHIFT)
 
+struct xc_cpu_policy {
+    struct cpuid_policy cpuid;
+    struct msr_policy msr;
+    xen_cpuid_leaf_t leaves[CPUID_MAX_SERIALISED_LEAVES];
+    xen_msr_entry_t entries[MSR_MAX_SERIALISED_ENTRIES];
+};
+
 #endif /* XG_PRIVATE_H */
-- 
2.11.0


