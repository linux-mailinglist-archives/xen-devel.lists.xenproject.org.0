Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E66E151D
	for <lists+xen-devel@lfdr.de>; Thu, 13 Apr 2023 21:22:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.520907.809029 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2WP-00014e-Np; Thu, 13 Apr 2023 19:22:17 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 520907.809029; Thu, 13 Apr 2023 19:22:17 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1pn2WP-000125-LD; Thu, 13 Apr 2023 19:22:17 +0000
Received: by outflank-mailman (input) for mailman id 520907;
 Thu, 13 Apr 2023 19:22:15 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=s9nQ=AE=citrix.com=prvs=46097603d=Andrew.Cooper3@srs-se1.protection.inumbo.net>)
 id 1pn2WN-00011z-G3
 for xen-devel@lists.xenproject.org; Thu, 13 Apr 2023 19:22:15 +0000
Received: from esa6.hc3370-68.iphmx.com (esa6.hc3370-68.iphmx.com
 [216.71.155.175]) by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ca232e4-da30-11ed-b21e-6b7b168915f2;
 Thu, 13 Apr 2023 21:22:12 +0200 (CEST)
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
X-Inumbo-ID: 7ca232e4-da30-11ed-b21e-6b7b168915f2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1681413732;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=krpY0wtoNjWcMka31rRBRO3yp3RjVetI0sS//BE8xhw=;
  b=KAzTi0p3iFpFj1hL1O/KOpNMnir565ZlNUb/NvKUj2oBbsZr+YBWkBT6
   pTab9fmbds9y3+T3hLIgm4w8j4fuaFxn+9G0VBxA+d7oT3lgrAUvuPMku
   NrzFoPXJhp8YsmG3JZlKi0LLjv8jmgs5OTSoYZTwCW7ssuyQhhBFP8pyj
   w=;
Authentication-Results: esa6.hc3370-68.iphmx.com; dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 104783135
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:+eEsY6rynIfM5cg0R6oLAwQ8vT1eBmJjZRIvgKrLsJaIsI4StFCzt
 garIBnUbvuINjTyKYp+bYi08xhTsMCDnIMxHQA//iA1ECNDpZuZCYyVIHmrMnLJJKUvbq7FA
 +Y2MYCccZ9uHhcwgj/3b9ANeFEljfngqoLUUbKCYWYpA1c/Ek/NsDo788YhmIlknNOlNA2Ev
 NL2sqX3NUSsnjV5KQr40YrawP9UlKm06WJwUmAWP6gR5weCziJNV/rzGInqR5fGatgMdgKFb
 76rIIGRpgvx4xorA9W5pbf3GmVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0MC+7vw6hjdFpo
 OihgLTrIesf0g8gr8xGO/VQO3kW0aSrY9YrK1Dn2SCY5xWun3cBX5yCpaz5VGEV0r8fPI1Ay
 RAXABU/SS2GjbLo++qQZ/J1tNQscdLzMqpK7xmMzRmBZRonaZXKQqGM7t5ExjYgwMtJGJ4yZ
 eJAN2ApNk6ZJUQSZBFOUslWcOSA3xETdxVxrl6PqLVxyG/U1AFri5DmMcbPe8zMTsJQ9qqdj
 jueozupWUhBabRzzxKJwlaIrL7exR+kc6BVTZaVqsQ2jnaqkzl75Bo+CgLg/KjRZlSFc81bA
 1wZ/Gwpt6da3FymSJzxUgO1pFaAvwUAQJxAHusi8gaPx6HIpQGDCQAsbBRMddgnv88eXiEx2
 xmCmNaBONB0mOTLEzTHrO7S9G7sf3FPdgfueBPoUyMg0f7epYtj0CmXZft4CZylgYDuAT/Zl
 mXiQDcFu1kDsSIa//zlrQmb223y/Mihoh0dvVuOAD/8hu9tTMv8PtHztwCGhRpVBNzBJmRtq
 kTojCR3AAomKZiW3BKAT+wWdF1Cz6bUaWaM6bKD8nRIythMx5JAVdoKiN2GDB01WvvogBewC
 KMphStf5YVIIFyhZrJtboS6BqwClPawTIi8DqCENYYWOfCdkTNrGwk3PCatM53FyhBwwcnTx
 7/AGSpTMZrqIfs+l2fnLwvs+bQq2jo/1QvueHwP9Dz+ieD2TCfMEd8taQLeBt3VGYvZ+W05B
 f4EbJDUo/ieOcWjChTqHXk7fA9aciNkVcutwyGVH8baSjdb9KgaI6e56dscl0ZNxMy5Ss+gE
 qmBZ3Jl
IronPort-HdrOrdr: A9a23:USoH2a/v/kMMr7SNbgFuk+DWI+orL9Y04lQ7vn2ZKCY4TiX8ra
 uTdZsguiMc5Ax+ZJhDo7C90di7IE80nKQdieN9AV7IZniEhILHFvAG0aLShxHmBi3i5qp8+M
 5bAsxD4QTLfDpHsfo=
X-Talos-CUID: =?us-ascii?q?9a23=3A4DpzJGugqkSH6A0bDW8SeoDo6IsAQFrgyX2AfXT?=
 =?us-ascii?q?gIktyUY+FRgKL4K1Nxp8=3D?=
X-Talos-MUID: 9a23:MFKmwAX3nEn3pvvq/DPcoBVIZdYw3/uFKgdUurhagZWKHhUlbg==
X-IronPort-AV: E=Sophos;i="5.99,194,1677560400"; 
   d="scan'208";a="104783135"
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: Xen-devel <xen-devel@lists.xenproject.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich
	<JBeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Wei Liu <wl@xen.org>
Subject: [PATCH] xen: Fold exit paths in find_text_region()
Date: Thu, 13 Apr 2023 20:22:01 +0100
Message-ID: <20230413192201.3255984-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Despite rcu_read_unlock() being fully inlineable, the optimiser cannot fold
these exit paths, because of the various compiler barriers providing RCU
safety.  Help the compiler out.

This compiles to marginally better code in all cases.  No functional change.

Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Jan Beulich <JBeulich@suse.com>
CC: Roger Pau Monné <roger.pau@citrix.com>
CC: Wei Liu <wl@xen.org>
---
 xen/common/virtual_region.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/xen/common/virtual_region.c b/xen/common/virtual_region.c
index 30b0b4ab9c85..5ecdba9c08ed 100644
--- a/xen/common/virtual_region.c
+++ b/xen/common/virtual_region.c
@@ -40,20 +40,20 @@ static DEFINE_RCU_READ_LOCK(rcu_virtual_region_lock);
 
 const struct virtual_region *find_text_region(unsigned long addr)
 {
-    const struct virtual_region *region;
+    const struct virtual_region *iter, *region = NULL;
 
     rcu_read_lock(&rcu_virtual_region_lock);
-    list_for_each_entry_rcu( region, &virtual_region_list, list )
+    list_for_each_entry_rcu ( iter, &virtual_region_list, list )
     {
-        if ( (void *)addr >= region->start && (void *)addr < region->end )
+        if ( (void *)addr >= iter->start && (void *)addr < iter->end )
         {
-            rcu_read_unlock(&rcu_virtual_region_lock);
-            return region;
+            region = iter;
+            break;
         }
     }
     rcu_read_unlock(&rcu_virtual_region_lock);
 
-    return NULL;
+    return region;
 }
 
 void register_virtual_region(struct virtual_region *r)
-- 
2.30.2


