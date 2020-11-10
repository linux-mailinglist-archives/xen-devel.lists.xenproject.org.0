Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 632542ADD69
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 18:52:11 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23567.50403 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoD-0002vv-6Z; Tue, 10 Nov 2020 17:51:57 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23567.50403; Tue, 10 Nov 2020 17:51:57 +0000
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
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXoC-0002uz-VU; Tue, 10 Nov 2020 17:51:56 +0000
Received: by outflank-mailman (input) for mailman id 23567;
 Tue, 10 Nov 2020 17:51:55 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXoB-0002u0-Qj
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:55 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cff68d35-046c-4438-a355-f7501af07ffe;
 Tue, 10 Nov 2020 17:51:55 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoA-0006Yw-7p; Tue, 10 Nov 2020 17:51:54 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoA-0007RC-03; Tue, 10 Nov 2020 17:51:54 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXoB-0002u0-Qj
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 17:51:55 +0000
X-Inumbo-ID: cff68d35-046c-4438-a355-f7501af07ffe
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cff68d35-046c-4438-a355-f7501af07ffe;
	Tue, 10 Nov 2020 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=+1oww7hSWyiptMhSf735m1JHsetRhBPwidp8laVrHmc=; b=Uf+xfIOpQIQsHhNkRVt5EZ0XL9
	xspdGWmlw7UT+NBg2EHeQ7rU67YGMWuOCh8xAcoFz/N/IvV/zyW0jt9AaZzZpPsfzFiBBGUyPwj7O
	l/5i92qUtOn2F02DC0yWp/j4kxPsbyHAQFz60vfWJeO4PtIp1oTDppXJOHzLhIB7s2z8=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoA-0006Yw-7p; Tue, 10 Nov 2020 17:51:54 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoA-0007RC-03; Tue, 10 Nov 2020 17:51:54 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 04/24] libxl: s/detatched/detached in libxl_pci.c
Date: Tue, 10 Nov 2020 17:51:27 +0000
Message-Id: <20201110175147.7067-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Simply spelling correction. Purely cosmetic fix.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 515e74fe5aae..52feac651c70 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1861,7 +1861,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     libxl__ev_qmp *qmp, const libxl__json_object *response, int rc);
 static void pci_remove_timeout(libxl__egc *egc,
     libxl__ev_time *ev, const struct timeval *requested_abs, int rc);
-static void pci_remove_detatched(libxl__egc *egc,
+static void pci_remove_detached(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 static void pci_remove_stubdom_done(libxl__egc *egc,
     libxl__ao_device *aodev);
@@ -1975,7 +1975,7 @@ skip1:
 skip_irq:
     rc = 0;
 out_fail:
-    pci_remove_detatched(egc, prs, rc); /* must be last */
+    pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
 static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
@@ -1999,7 +1999,7 @@ static void pci_remove_qemu_trad_watch_state_cb(libxl__egc *egc,
     rc = qemu_pci_remove_xenstore(gc, domid, pci, prs->force);
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_device_del(libxl__egc *egc,
@@ -2025,7 +2025,7 @@ static void pci_remove_qmp_device_del(libxl__egc *egc,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
@@ -2048,7 +2048,7 @@ static void pci_remove_qmp_device_del_cb(libxl__egc *egc,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
@@ -2064,7 +2064,7 @@ static void pci_remove_qmp_retry_timer_cb(libxl__egc *egc, libxl__ev_time *ev,
     return;
 
 out:
-    pci_remove_detatched(egc, prs, rc);
+    pci_remove_detached(egc, prs, rc);
 }
 
 static void pci_remove_qmp_query_cb(libxl__egc *egc,
@@ -2124,7 +2124,7 @@ static void pci_remove_qmp_query_cb(libxl__egc *egc,
     }
 
 out:
-    pci_remove_detatched(egc, prs, rc); /* must be last */
+    pci_remove_detached(egc, prs, rc); /* must be last */
 }
 
 static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
@@ -2143,12 +2143,12 @@ static void pci_remove_timeout(libxl__egc *egc, libxl__ev_time *ev,
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


