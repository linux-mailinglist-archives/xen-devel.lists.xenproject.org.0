Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5836F283398
	for <lists+xen-devel@lfdr.de>; Mon,  5 Oct 2020 11:49:36 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.2945.8416 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1kPN7K-0000ab-Gh; Mon, 05 Oct 2020 09:49:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 2945.8416; Mon, 05 Oct 2020 09:49:14 +0000
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
	id 1kPN7K-0000aC-DN; Mon, 05 Oct 2020 09:49:14 +0000
Received: by outflank-mailman (input) for mailman id 2945;
 Mon, 05 Oct 2020 09:49:12 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
 id 1kPN7I-0000a2-9z
 for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:12 +0000
Received: from mail.xenproject.org (unknown [104.130.215.37])
 by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
 id d5ee281d-a4a4-454e-8da2-b8c551704b45;
 Mon, 05 Oct 2020 09:49:11 +0000 (UTC)
Received: from xenbits.xenproject.org ([104.239.192.120])
 by mail.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7F-00018R-FE; Mon, 05 Oct 2020 09:49:09 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com
 ([109.146.187.185] helo=u2f063a87eabd5f.home)
 by xenbits.xenproject.org with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <paul@xen.org>)
 id 1kPN7F-0007gW-5T; Mon, 05 Oct 2020 09:49:09 +0000
Received: from us1-rack-iad1.inumbo.com ([172.99.69.81])
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <SRS0=GPX8=DM=xen.org=paul@srs-us1.protection.inumbo.net>)
	id 1kPN7I-0000a2-9z
	for xen-devel@lists.xenproject.org; Mon, 05 Oct 2020 09:49:12 +0000
X-Inumbo-ID: d5ee281d-a4a4-454e-8da2-b8c551704b45
Received: from mail.xenproject.org (unknown [104.130.215.37])
	by us1-rack-iad1.inumbo.com (Halon) with ESMTPS
	id d5ee281d-a4a4-454e-8da2-b8c551704b45;
	Mon, 05 Oct 2020 09:49:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=xen.org;
	s=20200302mail; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=JndE2IT1FR1VzwIIZT6xeGdSTmev8bp7YBG/Bt30IPQ=; b=LHvT0/yKr0tJ+uY0azfHrBacfx
	T6bE7maz3Yo3mUsnUWLpLBpdZo8zOS9ZHmdAHl7kQsCRCxn5DAr60IRnS339n+uMzBKrN6ejqkkpV
	4TTPt5FCqCuCR8jUHZ9c5gkaiwd0rQj4rNdkacPLNpoDo33IF77b2PeMVCChiWcHd71c=;
Received: from xenbits.xenproject.org ([104.239.192.120])
	by mail.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7F-00018R-FE; Mon, 05 Oct 2020 09:49:09 +0000
Received: from host109-146-187-185.range109-146.btcentralplus.com ([109.146.187.185] helo=u2f063a87eabd5f.home)
	by xenbits.xenproject.org with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <paul@xen.org>)
	id 1kPN7F-0007gW-5T; Mon, 05 Oct 2020 09:49:09 +0000
From: Paul Durrant <paul@xen.org>
To: xen-devel@lists.xenproject.org
Cc: Paul Durrant <pdurrant@amazon.com>,
	Ian Jackson <iwj@xenproject.org>,
	Wei Liu <wl@xen.org>,
	Anthony PERARD <anthony.perard@citrix.com>
Subject: [PATCH 1/5] libxl: remove separate calculation of IOMMU memory overhead
Date: Mon,  5 Oct 2020 10:49:01 +0100
Message-Id: <20201005094905.2929-2-paul@xen.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201005094905.2929-1-paul@xen.org>
References: <20201005094905.2929-1-paul@xen.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Paul Durrant <pdurrant@amazon.com>

When using 'shared_pt' mode the IOMMU is using the EPT PTEs. In 'sync_pt'
mode these PTEs are instead replicated for the IOMMU to use. Hence, it is
fairly clear that the memory overhead in this mode is essentially another
copy of the P2M.

This patch removes the independent calculation done in
libxl__get_required_iommu_memory() and instead simply uses 'shadow_memkb'
as the value of the IOMMU overhead since this is the estimated size of
the P2M.

Signed-off-by: Paul Durrant <pdurrant@amazon.com>
---
Cc: Ian Jackson <iwj@xenproject.org>
Cc: Wei Liu <wl@xen.org>
Cc: Anthony PERARD <anthony.perard@citrix.com>
---
 tools/libs/light/libxl_create.c | 22 +++++-----------------
 1 file changed, 5 insertions(+), 17 deletions(-)

diff --git a/tools/libs/light/libxl_create.c b/tools/libs/light/libxl_create.c
index 9a6e92b3a5..f07ba84850 100644
--- a/tools/libs/light/libxl_create.c
+++ b/tools/libs/light/libxl_create.c
@@ -1001,21 +1001,6 @@ static bool ok_to_default_memkb_in_create(libxl__gc *gc)
      */
 }
 
-static unsigned long libxl__get_required_iommu_memory(unsigned long maxmem_kb)
-{
-    unsigned long iommu_pages = 0, mem_pages = maxmem_kb / 4;
-    unsigned int level;
-
-    /* Assume a 4 level page table with 512 entries per level */
-    for (level = 0; level < 4; level++)
-    {
-        mem_pages = DIV_ROUNDUP(mem_pages, 512);
-        iommu_pages += mem_pages;
-    }
-
-    return iommu_pages * 4;
-}
-
 int libxl__domain_config_setdefault(libxl__gc *gc,
                                     libxl_domain_config *d_config,
                                     uint32_t domid /* for logging, only */)
@@ -1168,12 +1153,15 @@ int libxl__domain_config_setdefault(libxl__gc *gc,
             libxl_get_required_shadow_memory(d_config->b_info.max_memkb,
                                              d_config->b_info.max_vcpus);
 
-    /* No IOMMU reservation is needed if passthrough mode is not 'sync_pt' */
+    /* No IOMMU reservation is needed if passthrough mode is not 'sync_pt'
+     * otherwise we need a reservation sufficient to accommodate a copy of
+     * the P2M.
+     */
     if (d_config->b_info.iommu_memkb == LIBXL_MEMKB_DEFAULT
         && ok_to_default_memkb_in_create(gc))
         d_config->b_info.iommu_memkb =
             (d_config->c_info.passthrough == LIBXL_PASSTHROUGH_SYNC_PT)
-            ? libxl__get_required_iommu_memory(d_config->b_info.max_memkb)
+            ? d_config->b_info.shadow_memkb
             : 0;
 
     ret = libxl__domain_build_info_setdefault(gc, &d_config->b_info);
-- 
2.20.1


