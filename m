Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 501099C3F61
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 14:12:40 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.833742.1249031 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDN-0002Gx-QZ; Mon, 11 Nov 2024 13:12:21 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 833742.1249031; Mon, 11 Nov 2024 13:12:21 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAUDN-0002CX-GC; Mon, 11 Nov 2024 13:12:21 +0000
Received: by outflank-mailman (input) for mailman id 833742;
 Mon, 11 Nov 2024 13:12:19 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=//j0=SG=amazon.co.uk=prvs=038d26d0c=eliasely@srs-se1.protection.inumbo.net>)
 id 1tAUDL-0007pD-HN
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 13:12:19 +0000
Received: from smtp-fw-33001.amazon.com (smtp-fw-33001.amazon.com
 [207.171.190.10]) by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 9288da4e-a02e-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 14:12:16 +0100 (CET)
Received: from pdx4-co-svc-p1-lb2-vlan2.amazon.com (HELO
 smtpout.prod.us-east-1.prod.farcaster.email.amazon.dev) ([10.25.36.210])
 by smtp-border-fw-33001.sea14.amazon.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2024 13:12:15 +0000
Received: from EX19MTAUEA002.ant.amazon.com [10.0.29.78:36658]
 by smtpin.naws.us-east-1.prod.farcaster.email.amazon.dev [10.0.2.104:2525]
 with esmtp (Farcaster)
 id 175b2100-e97e-462f-a456-f6bcc4ede293; Mon, 11 Nov 2024 13:12:14 +0000 (UTC)
Received: from EX19D008UEA004.ant.amazon.com (10.252.134.191) by
 EX19MTAUEA002.ant.amazon.com (10.252.134.9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:09 +0000
Received: from EX19MTAUEC001.ant.amazon.com (10.252.135.222) by
 EX19D008UEA004.ant.amazon.com (10.252.134.191) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Mon, 11 Nov 2024 13:12:09 +0000
Received: from email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com
 (10.124.125.6) by mail-relay.amazon.com (10.252.135.200) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Mon, 11 Nov 2024 13:12:09 +0000
Received: from dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com
 (dev-dsk-eliasely-1a-fd74790f.eu-west-1.amazon.com [10.253.91.118])
 by email-imr-corp-prod-pdx-all-2b-5ec155c2.us-west-2.amazon.com (Postfix) with
 ESMTPS id 0F33642135; Mon, 11 Nov 2024 13:12:07 +0000 (UTC)
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
X-Inumbo-ID: 9288da4e-a02e-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjIwNy4xNzEuMTkwLjEwIiwiaGVsbyI6InNtdHAtZnctMzMwMDEuYW1hem9uLmNvbSJ9
X-Custom-Transaction: eyJpZCI6IjkyODhkYTRlLWEwMmUtMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzMwNzM2LjU4MzE5Mywic2VuZGVyIjoicHJ2cz0wMzhkMjZkMGM9ZWxpYXNlbHlAYW1hem9uLmNvLnVrIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1731330736; x=1762866736;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=W0GanGvpA+3jTX9LxsfCUWpnROXG+vaTFolekFzAvck=;
  b=rPFgZDyOcO4DgzkQmMQ2VmrrXobUC6r48N+kWpfpOLPKBxDKa9iE4Wju
   r6FilQTS3QPZTZHTezii9AhfXozx9tuqYobIw/6K7zkdWMl9O9dOh+3zY
   mz5+Tq8GiKvOvOn2vELQsq+QF6mIlDYFaRNgupGO4xxH22KNhzmDIW/mi
   g=;
X-IronPort-AV: E=Sophos;i="6.12,145,1728950400"; 
   d="scan'208";a="384186415"
X-Farcaster-Flow-ID: 175b2100-e97e-462f-a456-f6bcc4ede293
From: Elias El Yandouzi <eliasely@amazon.com>
To: <xen-devel@lists.xenproject.org>
CC: <julien@xen.org>, <pdurrant@amazon.com>, <dwmw@amazon.com>, Hongyan Xia
	<hongyxia@amazon.com>, Julien Grall <jgrall@amazon.com>, Elias El Yandouzi
	<eliasely@amazon.com>
Subject: [PATCH V4 10/15] xen/page_alloc: vmap heap nodes when they are outside the direct map
Date: Mon, 11 Nov 2024 13:11:43 +0000
Message-ID: <20241111131148.52568-11-eliasely@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241111131148.52568-1-eliasely@amazon.com>
References: <20241111131148.52568-1-eliasely@amazon.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Hongyan Xia <hongyxia@amazon.com>

When we do not have a direct map, archs_mfn_in_direct_map() will always
return false, thus init_node_heap() will allocate xenheap pages from an
existing node for the metadata of a new node. This means that the
metadata of a new node is in a different node, slowing down heap
allocation.

Since we now have early vmap, vmap the metadata locally in the new node.

Signed-off-by: Hongyan Xia <hongyxia@amazon.com>
Signed-off-by: Julien Grall <jgrall@amazon.com>
Signed-off-by: Elias El Yandouzi <eliasely@amazon.com>

----

    Changes in v4:
        * Change type of the parameters to paddr_t
        * Use clear_domain_page() instead of open-coding it

    Changes in v2:
        * vmap_contig_pages() was renamed to vmap_contig()
        * Fix indentation and coding style

    Changes from Hongyan's version:
        * arch_mfn_in_direct_map() was renamed to
          arch_mfns_in_direct_map()
        * Use vmap_contig_pages() rather than __vmap(...).
        * Add missing include (xen/vmap.h) so it compiles on Arm

diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 2cef521ad85a..62cdeb5013a3 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -137,6 +137,7 @@
 #include <xen/sections.h>
 #include <xen/softirq.h>
 #include <xen/spinlock.h>
+#include <xen/vmap.h>
 
 #include <asm/flushtlb.h>
 #include <asm/page.h>
@@ -606,22 +607,32 @@ static unsigned long init_node_heap(int node, unsigned long mfn,
         needed = 0;
     }
     else if ( *use_tail && nr >= needed &&
-              arch_mfns_in_directmap(mfn + nr - needed, needed) &&
               (!xenheap_bits ||
                !((mfn + nr - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn + nr - needed);
-        avail[node] = mfn_to_virt(mfn + nr - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
+            _heap[node] = mfn_to_virt(mfn + nr - needed);
+        else
+            _heap[node] = vmap_contig(_mfn(mfn + nr - needed), needed);
+
+        BUG_ON(!_heap[node]);
+        avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                        sizeof(**avail) * NR_ZONES;
+
     }
     else if ( nr >= needed &&
-              arch_mfns_in_directmap(mfn, needed) &&
               (!xenheap_bits ||
-               !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
+              !((mfn + needed - 1) >> (xenheap_bits - PAGE_SHIFT))) )
     {
-        _heap[node] = mfn_to_virt(mfn);
-        avail[node] = mfn_to_virt(mfn + needed - 1) +
-                      PAGE_SIZE - sizeof(**avail) * NR_ZONES;
+        if ( arch_mfns_in_directmap(mfn + nr - needed, needed) )
+            _heap[node] = mfn_to_virt(mfn + nr - needed);
+        else
+            _heap[node] = vmap_contig(_mfn(mfn + nr - needed), needed);
+
+        BUG_ON(!_heap[node]);
+        avail[node] = (void *)(_heap[node]) + (needed << PAGE_SHIFT) -
+                        sizeof(**avail) * NR_ZONES;
+
         *use_tail = false;
     }
     else if ( get_order_from_bytes(sizeof(**_heap)) ==
-- 
2.40.1


