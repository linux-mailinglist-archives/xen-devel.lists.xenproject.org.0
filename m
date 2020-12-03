Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 284C02CD905
	for <lists+xen-devel@lfdr.de>; Thu,  3 Dec 2020 15:25:59 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.43535.78259 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpYG-0000aj-3H; Thu, 03 Dec 2020 14:25:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 43535.78259; Thu, 03 Dec 2020 14:25:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kkpYF-0000ZD-Lz; Thu, 03 Dec 2020 14:25:43 +0000
Received: by outflank-mailman (input) for mailman id 43535;
 Thu, 03 Dec 2020 14:25:42 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kkpYE-0000WJ-3Q
 for xen-devel@lists.xenproject.org; Thu, 03 Dec 2020 14:25:42 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYD-0006Lv-9H; Thu, 03 Dec 2020 14:25:41 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kkpYD-00015c-1G; Thu, 03 Dec 2020 14:25:41 +0000
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
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=0AyOqDJsHZVempffCeuXOX5SYYaKuAxFB7OmnpHONLE=; b=yJbt2LN08Ynu0/wKnSQK3Ftfh3
	8604GMya913fAaxc8KMWVelVSCCfXefVUYr7wVz5ngT8bK0j3+lpA+uTBd1YRq5ECyRmOxu3lRFM+
	rDBaqWrHnXk2PKkOwmtv6LE/BQC9hufMCIV+QEHu34SZMqjLRMP5Ch5l5qhce2VvLOVw=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v5 05/23] libxl: s/detatched/detached in libxl_pci.c
Date: Thu,  3 Dec 2020 14:25:16 +0000
Message-Id: <20201203142534.4017-6-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201203142534.4017-1-paul@xen.org>
References: <20201203142534.4017-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Simply spelling correction. Purely cosmetic fix.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index a06c88076519..35ee810d5df3 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1864,7 +1864,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
 static void pci_remove_timeout(libxl__egc *egc,
     libxl__ev_time *ev, const struct timeval *requested_abs, int rc);
-static void pci_remove_detatched(libxl__egc *egc,
+static void pci_remove_detached(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 static void pci_remove_stubdom_done(libxl__egc *egc,
     libxl__ao_device *aodev);
@@ -1978,7 +1978,7 @@ skip1:
 skip_irq:
     rc = 0;
 out_fail:
-    pci_remove_detatched(egc, prs, rc); /* must be last */
+    pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
 static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -2002,7 +2002,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
     rc = qemu_pci_remove_xenstore(gc, domid, pci, prs->force);
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_device_del(libxl__egc *egc,
@@ -2028,7 +2028,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
@@ -2051,7 +2051,7 @@ static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
@@ -2067,7 +2067,7 @@ static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_query_cb(libxl__egc *egc,
@@ -2127,7 +2127,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     }
 
 out:
-    pci_remove_detatched(egc, prs, rc); /* must be last */
+    pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
 static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
@@ -2146,12 +2146,12 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
     /* If we timed out, we might still want to keep destroying the device
      * (when force==true), so let the next function decide what to do on
      * error */
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
-static void pci_remove_detatched(libxl__egc *egc,
-                                 pci_remove_state *prs,
-                                 int rc)
+static void pci_remove_detached(libxl__egc *egc,
+                                pci_remove_state *prs,
+                                int rc)
 {
     STATE_AO_GC(prs->aodev->ao);
     int stubdomid = 0;
-- 
2.20.1


