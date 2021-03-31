Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B94135013B
	for <lists+xen-devel@lfdr.de>; Wed, 31 Mar 2021 15:32:25 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.103934.198242 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRawa-0005GQ-CZ; Wed, 31 Mar 2021 13:31:36 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 103934.198242; Wed, 31 Mar 2021 13:31:36 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1lRawa-0005G1-93; Wed, 31 Mar 2021 13:31:36 +0000
Received: by outflank-mailman (input) for mailman id 103934;
 Wed, 31 Mar 2021 13:31:35 +0000
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=7d7x=I5=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1lRawZ-0005Fw-CA
 for xen-devel@lists.xenproject.org; Wed, 31 Mar 2021 13:31:35 +0000
Received: from esa5.hc3370-68.iphmx.com (unknown [216.71.155.168])
 by us1-amaz-eas2.inumbo.com (Halon) with ESMTPS
 id 3095be06-eed8-4026-91ac-995961179144;
 Wed, 31 Mar 2021 13:31:34 +0000 (UTC)
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
X-Inumbo-ID: 3095be06-eed8-4026-91ac-995961179144
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1617197494;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ot73H2SYgwn2CXG9cPZvDv1IaaQ5xrxU54n7naXPgr0=;
  b=P9iL5ocvp1wFzdVOPLktp9uUabmDpbl+9O3vxsd70G5RvivBnuJ6saqC
   iE73BFMjPZpJWmGhF6oeQ1nG18Z1PHA3YQXF2nhUx0uK4H6qNEXsoBLso
   X6SupsTJataOsPxtrInV+Rv35/3uCBzBEFLw8U2vg3nYcdLX7nRAstv3x
   0=;
Authentication-Results: esa5.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
IronPort-SDR: J4ijsB0nSleINzq/D3PSRBUORAKA4YgMG8kNvkGZoU7lW66Qk7HuuXtDccpSpufh87+EL4wuem
 72qqt7rN9wZKVDJ8CtgvCjvt5fijUEoJ5+GSRXiC1X/FcVGkHHeE1vNuBY0qbWjf/I09rU0PlQ
 WdSy4fMAfnVjONnbqQNK1VsdXtfIwmCkvWG3rKJkWTEXbZBZNirjPO8NtYTsaVu0RV2wae/1Zp
 rRsRMhYqyLh1vE+vVPk0K+JhD4LJhX6zBcc5uhLA5Sj+hi5fYkKGj9XjIxVzv4cSyz05C/OR7P
 3Ik=
X-SBRS: 5.1
X-MesageID: 40432767
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:Q9VhAakruDqz3bIrFSI6+vsCKALpDfLI3DAbvn1ZSRFFG/Gwve
 rGppom/DXzjyscX2xlpMuJP7OOTWiZ2Zl+54QQOrnKZniAhEKDKoZ+4Yz+hwDxAiGWzJ846Y
 5Me7VzYeeRMXFUlsD/iTPVL/8F4P2qtJ+lnv3fyXAFd3AOV4hF4x1iAgiWVm1aLTM2ZqYRL5
 aX6spZqzfIQx1+Ba7XOlA/U/XevNqOrZr6YHc9dngawTOThjCl4qOSKXml9yoZOgkh/Z4StU
 zMkwn0/cyYwpOG9iM=
X-IronPort-AV: E=Sophos;i="5.81,293,1610427600"; 
   d="scan'208";a="40432767"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] x86/hvm: Fix double free from vlapic_init() early error path
Date: Wed, 31 Mar 2021 14:31:25 +0100
Message-ID: <20210331133125.7072-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

vlapic_init()'s caller calls vlapic_destroy() on error.  Therefore, the error
path from __map_domain_page_global() failing would doubly free
vlapic->regs_page.

Rework vlapic_destroy() to be properly idempotent, introducing the necessary
UNMAP_DOMAIN_PAGE_GLOBAL() and FREE_DOMHEAP_PAGE() wrappers.

Rearrange vlapic_init() to group all trivial initialisation, and leave all
cleanup to the caller, in line with our longer term plans.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/arch/x86/hvm/vlapic.c     | 11 ++++-------
 xen/include/xen/domain_page.h |  5 +++++
 xen/include/xen/mm.h          |  6 ++++++
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/hvm/vlapic.c b/xen/arch/x86/hvm/vlapic.c
index 5e21fb4937..da030f41b5 100644
--- a/xen/arch/x86/hvm/vlapic.c
+++ b/xen/arch/x86/hvm/vlapic.c
@@ -1608,7 +1608,9 @@ int vlapic_init(struct vcpu *v)
         return 0;
     }
 
+    /* Trivial init. */
     vlapic->pt.source = PTSRC_lapic;
+    spin_lock_init(&vlapic->esr_lock);
 
     vlapic->regs_page = alloc_domheap_page(v->domain, MEMF_no_owner);
     if ( !vlapic->regs_page )
@@ -1616,17 +1618,12 @@ int vlapic_init(struct vcpu *v)
 
     vlapic->regs = __map_domain_page_global(vlapic->regs_page);
     if ( vlapic->regs == NULL )
-    {
-        free_domheap_page(vlapic->regs_page);
         return -ENOMEM;
-    }
 
     clear_page(vlapic->regs);
 
     vlapic_reset(vlapic);
 
-    spin_lock_init(&vlapic->esr_lock);
-
     tasklet_init(&vlapic->init_sipi.tasklet, vlapic_init_sipi_action, v);
 
     if ( v->vcpu_id == 0 )
@@ -1645,8 +1642,8 @@ void vlapic_destroy(struct vcpu *v)
     tasklet_kill(&vlapic->init_sipi.tasklet);
     TRACE_0D(TRC_HVM_EMUL_LAPIC_STOP_TIMER);
     destroy_periodic_time(&vlapic->pt);
-    unmap_domain_page_global(vlapic->regs);
-    free_domheap_page(vlapic->regs_page);
+    UNMAP_DOMAIN_PAGE_GLOBAL(vlapic->regs);
+    FREE_DOMHEAP_PAGE(vlapic->regs_page);
 }
 
 /*
diff --git a/xen/include/xen/domain_page.h b/xen/include/xen/domain_page.h
index a182d33b67..0cb7f2aad3 100644
--- a/xen/include/xen/domain_page.h
+++ b/xen/include/xen/domain_page.h
@@ -77,4 +77,9 @@ static inline void unmap_domain_page_global(const void *va) {};
     (p) = NULL;                     \
 } while ( false )
 
+#define UNMAP_DOMAIN_PAGE_GLOBAL(p) do {   \
+    unmap_domain_page_global(p);           \
+    (p) = NULL;                            \
+} while ( false )
+
 #endif /* __XEN_DOMAIN_PAGE_H__ */
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index 667f9dac83..c274e2eac4 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -85,6 +85,12 @@ bool scrub_free_pages(void);
 } while ( false )
 #define FREE_XENHEAP_PAGE(p) FREE_XENHEAP_PAGES(p, 0)
 
+#define FREE_DOMHEAP_PAGES(p, o) do { \
+    free_domheap_pages(p, o);         \
+    (p) = NULL;                       \
+} while ( false )
+#define FREE_DOMHEAP_PAGE(p) FREE_DOMHEAP_PAGES(p, 0)
+
 /* Map machine page range in Xen virtual address space. */
 int map_pages_to_xen(
     unsigned long virt,
-- 
2.11.0


