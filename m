Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFE9297380
	for <lists+xen-devel@lfdr.de>; Fri, 23 Oct 2020 18:23:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.11162.29613 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kVzqo-0008Dw-Lz; Fri, 23 Oct 2020 16:23:34 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 11162.29613; Fri, 23 Oct 2020 16:23:34 +0000
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
	id 1kVzqo-0008D4-Gv; Fri, 23 Oct 2020 16:23:34 +0000
Received: by outflank-mailman (input) for mailman id 11162;
 Fri, 23 Oct 2020 16:23:32 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kVzqm-00081e-C8
 for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:32 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 5d74bd44-e25a-4dd0-a026-178d0dc88266;
 Fri, 23 Oct 2020 16:23:26 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqf-0008JU-6J; Fri, 23 Oct 2020 16:23:25 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com
 ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kVzqe-000376-V3; Fri, 23 Oct 2020 16:23:25 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=X6LH=D6=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kVzqm-00081e-C8
	for xen-devel@lists.xenproject.org; Fri, 23 Oct 2020 16:23:32 +0000
X-Inumbo-ID: 5d74bd44-e25a-4dd0-a026-178d0dc88266
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 5d74bd44-e25a-4dd0-a026-178d0dc88266;
	Fri, 23 Oct 2020 16:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	 bh=d5hhK/pKE8zCFXVC7B3RNGDmz0Oe2e31kzCzkBdDeBM=; b=BR9viEbkG0CJzaf6Fobq/85Yi
	QIo8B/2Mvcg7lWD+3Jf4532XLAir3N9SagRDNWRaDo3lk8vgmbIPuIJGS40SmeKVCSnR6wAtn7+1s
	gf7mAs1QW3Xo31BOFQVI1QatbHKmbicpV67Ws6KA4Ad6SuZQijq0hsPJ2C7FdYXl6x8mQ=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqf-0008JU-6J; Fri, 23 Oct 2020 16:23:25 +0000
Received: from ec2-18-200-132-236.eu-west-1.compute.amazonaws.com ([18.200.132.236] helo=ip-10-0-185-232.eu-west-1.compute.internal)
	by xenbits.xenproject.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kVzqe-000376-V3; Fri, 23 Oct 2020 16:23:25 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH 06/25] libxl: remove extraneous arguments to do_pci_remove() in libxl_pci.c
Date: Fri, 23 Oct 2020 16:22:55 +0000
Message-Id: <20201023162314.2235-7-paul@xen.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201023162314.2235-1-paul@xen.org>
References: <20201023162314.2235-1-paul@xen.org>

From: Paul Durrant <pdurrant@amazon.com>

Both 'domid' and 'pci' are available in 'pci_remove_state' so there is no
need to also pass them as separate arguments.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 3936d60a14..97889fda49 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -1867,14 +1867,14 @@ static void pci_remove_stubdom_done(libxl__egc *egc,
 static void pci_remove_done(libxl__egc *egc,
     pci_remove_state *prs, int rc);
 
-static void do_pci_remove(libxl__egc *egc, uint32_t domid,
-                          libxl_device_pci *pci, int force,
-                          pci_remove_state *prs)
+static void do_pci_remove(libxl__egc *egc, pci_remove_state *prs)
 {
     STATE_AO_GC(prs->aodev->ao);
     libxl_ctx *ctx = libxl__gc_owner(gc);
     libxl_device_pci *assigned;
+    uint32_t domid = prs->domid;
     libxl_domain_type type = libxl__domain_type(gc, domid);
+    libxl_device_pci *pci = prs->pci;
     int rc, num;
 
     assigned = libxl_device_pci_list(ctx, domid, &num);
@@ -2269,7 +2269,6 @@ static void device_pci_remove_common_next(libxl__egc *egc,
     EGC_GC;
 
     /* Convenience aliases */
-    libxl_domid domid = prs->domid;
     libxl_device_pci *const pci = prs->pci;
     libxl__ao_device *const aodev = prs->aodev;
     const unsigned int pfunc_mask = prs->pfunc_mask;
@@ -2287,7 +2286,7 @@ static void device_pci_remove_common_next(libxl__egc *egc,
             } else {
                 pci->vdevfn = orig_vdev;
             }
-            do_pci_remove(egc, domid, pci, prs->force, prs);
+            do_pci_remove(egc, prs);
             return;
         }
     }
-- 
2.11.0


