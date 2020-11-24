Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id EEF162C1F50
	for <lists+xen-devel@lfdr.de>; Tue, 24 Nov 2020 09:02:37 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.35431.67007 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1khTH5-0008D3-Jq; Tue, 24 Nov 2020 08:02:07 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 35431.67007; Tue, 24 Nov 2020 08:02:07 +0000
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
	id 1khTH5-0008CA-AK; Tue, 24 Nov 2020 08:02:07 +0000
Received: by outflank-mailman (input) for mailman id 35431;
 Tue, 24 Nov 2020 08:02:04 +0000
Received: from mail.xenproject.org ([104.130.215.37])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>) id 1khTH2-00088A-F4
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH1-00060N-S0; Tue, 24 Nov 2020 08:02:03 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208]
 helo=ip-10-0-29-170.ec2.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1khTH1-0001hp-Oq; Tue, 24 Nov 2020 08:02:03 +0000
Received: from mail.xenproject.org ([104.130.215.37])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH2-00088A-F4
	for xen-devel@lists.xenproject.org; Tue, 24 Nov 2020 08:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=woMUqgZMx7At7jFsiX2KySgK2cVzSMaxkSnE1C583H4=; b=XdCotyRlljb+RCHrL8k/Wh4Ea
	HCoYI2SoK8XKRQWm16JBdGydzmG9EE/O1aCfA1GXo33WqpfZ/74STwfh8bKVpZVNXHh5aE0qVxLNq
	jKdVSTmlYITgic9W3Y1Rr2fwJ0stZl01CKMYiEo1hCpo2sZ684SmuCJZa5hIzEBk+bNIM=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH1-00060N-S0; Tue, 24 Nov 2020 08:02:03 +0000
Received: from ec2-54-145-241-208.compute-1.amazonaws.com ([54.145.241.208] helo=ip-10-0-29-170.ec2.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1khTH1-0001hp-Oq; Tue, 24 Nov 2020 08:02:03 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v4 05/23] libxl: s/detatched/detached in libxl_pci.c
Date: Tue, 24 Nov 2020 08:01:41 +0000
Message-Id: <20201124080159.11912-6-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201124080159.11912-1-paul@xen.org>
References: <20201124080159.11912-1-paul@xen.org>

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
index 50c96cbfa6..de617e95eb 100644
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
2.11.0


