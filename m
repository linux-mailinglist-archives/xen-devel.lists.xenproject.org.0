Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BFCBA2ADDA4
	for <lists+xen-devel@lfdr.de>; Tue, 10 Nov 2020 19:01:16 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.23665.50648 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kcXx9-0005u3-98; Tue, 10 Nov 2020 18:01:11 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 23665.50648; Tue, 10 Nov 2020 18:01:11 +0000
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
	id 1kcXx8-0005sI-QR; Tue, 10 Nov 2020 18:01:10 +0000
Received: by outflank-mailman (input) for mailman id 23665;
 Tue, 10 Nov 2020 18:01:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kcXx7-00059I-Hx
 for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:01:09 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id 98f21cd0-723e-4b31-82e5-fc74da31e0ed;
 Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXwh-0006rB-P1; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kcXoI-0007RC-Gp; Tue, 10 Nov 2020 17:52:02 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=l7/2=EQ=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kcXx7-00059I-Hx
	for xen-devel@lists.xenproject.org; Tue, 10 Nov 2020 18:01:09 +0000
X-Inumbo-ID: 98f21cd0-723e-4b31-82e5-fc74da31e0ed
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id 98f21cd0-723e-4b31-82e5-fc74da31e0ed;
	Tue, 10 Nov 2020 18:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=QafHuUbOEu8fc/Otpqr5mCK9z+T4MUpc57SIzfCCCl0=; b=EVSCFrioLg9TBeLVH7XPvnV3eU
	97GDeyezdb60SiFHiscWZcaA8dLy5krSbH19LGTbsAZEn1wUokUy8U9TdWOnH9diEjAxOQLV8S46x
	ypQtDU2pGN0SEmWZDYWOW6zUNT9E4uxy0T37nknwQvNySw6s9Yq858nFvwgzRERe2GKA=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXwh-0006rB-P1; Tue, 10 Nov 2020 18:00:43 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kcXoI-0007RC-Gp; Tue, 10 Nov 2020 17:52:02 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>
Subject: [PATCH v2 13/24] libxl: add/recover 'rdm_policy' to/from PCI backend in xenstore
Date: Tue, 10 Nov 2020 17:51:36 +0000
Message-Id: <20201110175147.7067-14-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110175147.7067-1-paul@xen.org>
References: <20201110175147.7067-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Other parameters, such as 'msitranslate' and 'permissive' are dealt with
but 'rdm_policy' appears to be have been completely missed.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
---
 tools/libs/light/libxl_pci.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tools/libs/light/libxl_pci.c b/tools/libs/light/libxl_pci.c
index 278ebd9f561b..06fdc50ce10c 100644
--- a/tools/libs/light/libxl_pci.c
+++ b/tools/libs/light/libxl_pci.c
@@ -61,9 +61,9 @@ static void libxl_create_pci_backend_device(libxl__gc *gc,
         flexarray_append_pair(back, GCSPRINTF("vdevfn-%d", num), GCSPRINTF("%x", pci->vdevfn));
     flexarray_append(back, GCSPRINTF("opts-%d", num));
     flexarray_append(back,
-              GCSPRINTF("msitranslate=%d,power_mgmt=%d,permissive=%d",
-                             pci->msitranslate, pci->power_mgmt,
-                             pci->permissive));
+              GCSPRINTF("msitranslate=%d,power_mgmt=%d,permissive=%d,rdm_policy=%s",
+                        pci->msitranslate, pci->power_mgmt,
+                        pci->permissive, libxl_rdm_reserve_policy_to_string(pci->rdm_policy)));
     flexarray_append_pair(back, GCSPRINTF("state-%d", num), GCSPRINTF("%d", XenbusStateInitialising));
 }
 
@@ -2313,6 +2313,9 @@ static int libxl__device_pci_from_xs_be(libxl__gc *gc,
             } else if (!strcmp(p, "permissive")) {
                 p = strtok_r(NULL, ",=", &saveptr);
                 pci->permissive = atoi(p);
+            } else if (!strcmp(p, "rdm_policy")) {
+                p = strtok_r(NULL, ",=", &saveptr);
+                libxl_rdm_reserve_policy_from_string(p, &pci->rdm_policy);
             }
         } while ((p = strtok_r(NULL, ",=", &saveptr)) != NULL);
     }
-- 
2.20.1


