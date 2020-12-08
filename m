Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 7136F2D32B5
	for <lists+xen-devel@lfdr.de>; Tue,  8 Dec 2020 20:31:05 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.47689.84453 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihG-0000wC-IF; Tue, 08 Dec 2020 19:30:50 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 47689.84453; Tue, 08 Dec 2020 19:30:50 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kmihG-0000tz-4R; Tue, 08 Dec 2020 19:30:50 +0000
Received: by outflank-mailman (input) for mailman id 47689;
 Tue, 08 Dec 2020 19:30:47 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1kmihC-0000kU-Sx
 for xen-devel@lists.xenproject.org; Tue, 08 Dec 2020 19:30:46 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihC-0007Lh-74; Tue, 08 Dec 2020 19:30:46 +0000
Received: from host86-183-162-145.range86-183.btcentralplus.com
 ([86.183.162.145] helo=desktop.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kmihB-0001p0-Uy; Tue, 08 Dec 2020 19:30:46 +0000
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
	bh=YuOQecAixX1DjK13kmE19J965kCqYu/hcSuqKjMtAqY=; b=ZjepG28HskRGPgNyU9ReEbUrfH
	bsBGI58ATPqvc8xl3v4h4TBileodAWIsoOAcZ+E/ok1yAu2a7EPJSLlPnmnngAxPnInSpgYPLdORs
	51aY7EIk6ZzBp19zzylYrYCo5Jk10/omKgEAun7EOs9RR8rOHKOJ64Mb36/znbhyOV7c=;
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
	Wei Liu <wl@xen.org>,
	Ian Jackson <iwj@xenproject.org>
Subject: [PATCH v6 06/25] libxl: s/detatched/detached in libxl_pci.c
Date: Tue,  8 Dec 2020 19:30:14 +0000
Message-Id: <20201208193033.11306-7-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201208193033.11306-1-paul@xen.org>
References: <20201208193033.11306-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Simply spelling correction. Purely cosmetic fix.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
Reviewed-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
Acked-by: Wei Liu <wl@xen.org>
---
Cc: Ian Jackson <iwj@xenproject.org>
---
 tools/libs/light/libxl_pci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 2a5a4db976e1..b6d3bd29b718 100644
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


