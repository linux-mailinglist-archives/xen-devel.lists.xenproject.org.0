Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A96B283399
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2947.8439 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7O-0000dH-2k; Mon, 05 Oct 2020 09:49:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2947.8439; Mon, 05 Oct 2020 09:49:18 +0000
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
	id 1kPN7N-0000cj-Vk; Mon, 05 Oct 2020 09:49:17 +0000
Received: by outflank-mailman (input) for mailman id 2947;
 Mon, 05 Oct 2020 09:49:17 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPN7N-0000a2-4g
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:17 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id cc291b9a-82d7-464d-b8ff-200c3d85c9aa;
 Mon, 05 Oct 2020 09:49:13 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7J-00018j-D5; Mon, 05 Oct 2020 09:49:13 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7J-0007gW-5k; Mon, 05 Oct 2020 09:49:13 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPN7N-0000a2-4g
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:17 +0000
X-Inumbo-ID: cc291b9a-82d7-464d-b8ff-200c3d85c9aa
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id cc291b9a-82d7-464d-b8ff-200c3d85c9aa;
	Mon, 05 Oct 2020 09:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=0/TvnggoZgnvE3hOxtGaw8lHv49nlACtJLzfHJVFPDg=; b=daBGQ6wW7PKyicNrzxKeGW/4xr
	JsNo/tu6Lto8STSfVzRNs3wrlqCf6RgM9URkBR0sk+ytSsYT7z+u38waeP6sT0LGWMON6encXeLRU
	sTbJgN48uiUrZaprjjzECD/WIaQpuNxGHpPGeWuDoOTBF5Ag+iDqmhSfdz0HjcRaLMys=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7J-00018j-D5; Mon, 05 Oct 2020 09:49:13 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7J-0007gW-5k; Mon, 05 Oct 2020 09:49:13 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Jan Beulich <jbeulich@suse.com>
Subject: [PATCH 4/5] iommu: set 'hap_pt_share' and 'need_sync' flags earlier in iommu_domain_init()
Date: Mon,  5 Oct 2020 10:49:04 +0100
Message-Id: <20201005094905.2929-5-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005094905.2929-1-paul@xen.org>
References: <20201005094905.2929-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

Set these flags prior to the calls to arch_iommu_domain_init() and the
implementation init() method. There is no reason to hide this information from
those functions and the value of 'hap_pt_share' will be needed by a
modification to arch_iommu_domain_init() made in a subsequent patch.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Jan Beulich <jbeulich@suse.com>
---
 xen/drivers/passthrough/iommu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/xen/drivers/passthrough/iommu.c b/xen/drivers/passthrough/iommu.c
index 642d5c8331..fd9705b3a9 100644
--- a/xen/drivers/passthrough/iommu.c
+++ b/xen/drivers/passthrough/iommu.c
@@ -174,15 +174,6 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
     hd->node = NUMA_NO_NODE;
 #endif
 
-    ret = arch_iommu_domain_init(d);
-    if ( ret )
-        return ret;
-
-    hd->platform_ops = iommu_get_ops();
-    ret = hd->platform_ops->init(d);
-    if ( ret || is_system_domain(d) )
-        return ret;
-
     /*
      * Use shared page tables for HAP and IOMMU if the global option
      * is enabled (from which we can infer the h/w is capable) and
@@ -202,7 +193,12 @@ int iommu_domain_init(struct domain *d, unsigned int opts)
 
     ASSERT(!(hd->need_sync && hd->hap_pt_share));
 
-    return 0;
+    ret = arch_iommu_domain_init(d);
+    if ( ret )
+        return ret;
+
+    hd->platform_ops = iommu_get_ops();
+    return hd->platform_ops->init(d);
 }
 
 void __hwdom_init iommu_hwdom_init(struct domain *d)
-- 
2.20.1


