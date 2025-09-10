Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2B7B50FA7
	for <lists+xen-devel@lfdr.de>; Wed, 10 Sep 2025 09:39:48 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1117581.1463674 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQO-0006qt-Gf; Wed, 10 Sep 2025 07:39:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1117581.1463674; Wed, 10 Sep 2025 07:39:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uwFQO-0006kU-CO; Wed, 10 Sep 2025 07:39:28 +0000
Received: by outflank-mailman (input) for mailman id 1117581;
 Wed, 10 Sep 2025 07:39:26 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=T+uy=3V=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uwFQM-0005yt-Pg
 for xen-devel@lists.xenproject.org; Wed, 10 Sep 2025 07:39:26 +0000
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on20602.outbound.protection.outlook.com
 [2a01:111:f403:200a::602])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 4607fd1a-8e19-11f0-9d13-b5c5bf9af7f9;
 Wed, 10 Sep 2025 09:39:26 +0200 (CEST)
Received: from BYAPR11CA0071.namprd11.prod.outlook.com (2603:10b6:a03:80::48)
 by CH3PR12MB7572.namprd12.prod.outlook.com (2603:10b6:610:144::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 07:39:20 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:a03:80:cafe::74) by BYAPR11CA0071.outlook.office365.com
 (2603:10b6:a03:80::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.15 via Frontend Transport; Wed,
 10 Sep 2025 07:39:20 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Wed, 10 Sep 2025 07:39:20 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 satlexmb07.amd.com (10.181.42.216) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 00:39:06 -0700
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
X-Inumbo-ID: 4607fd1a-8e19-11f0-9d13-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mjakr2j0FrYplPnrulqwzwuXuvkjlkBExnLjCcW4ccRE4Ql/L3oFKgBjeokP21Zqib8mTHfbfbWmlSpK9IRjAv8Dq+XfiyB8kkztBg7wGxD1cKfJQIlo3+ZbbHd0XlILD/PIyWsEIxOdKdKbgC3I0kVBv2apBwO5C52c2RRioU18BD8Q7vxHzUczyaSECOgvvF1XjusldkpSJBs6qrmAo0qa+PNu9mQ3kd3ogmLSCKxmq/HPzaqIVT6Wo6oTYz22Y9AYzkKxXClqFkJwAHgmcYP5D7IvMMRtkJkxfYtOWzsMBugtjlF6ZgaHQ2Wlu7hC28MAgCW2UVfbBI06Q3mUrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=laR1vIy8iDHUWom8KybMGHOL/51jt2m++lMgJI0rWmk=;
 b=Flo1PdL1k0Zr8Re+0tukVLpCsWjdCUKek4UhJ+yVpX4JigoA0aNxBSNd0LZH33U0IOKFdEejix1QUxHPpp7h1pQuctgk17LzOO5wC7kUuHAbK8kbNjvkVu6PP2DF2zn/fNSnX8YuNYYUN+XJDg8+Z/fv6ncqzOL9eikOfBvC+Td6NYzKmAMaRTdiGqhIbCzbFj3Ki5HxpxXlSjljzaBrzvLE6ESwFpziF+0nOMtn4FoSwNpKBkTB2F4m8BcOVmKVnaRd1kMzA0KK+06TA3n5Czphf8zAyR0BZCdqs/jsQySxHLr8P8yoJjox/WWzJneIIUaqfr21VUL00ic9RLqFZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=laR1vIy8iDHUWom8KybMGHOL/51jt2m++lMgJI0rWmk=;
 b=bW+yGkmDU+O44/PVx9RF5wfQueUWOIOjO0NHU6oF1QCvLu3aZlvOhBiAOVz4fkKoi639KImjZ/Ss4ZhnWw81ssaCCxg9wYopmpR9NPiUAQj1FBvxCtwGCgB5HeZf/depPEc08SeR2IB9xmTptwt5yh35cKZB+kkSJkAUUAoG35E=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v2 03/26] xen/x86: consolidate vram tracking support
Date: Wed, 10 Sep 2025 15:38:04 +0800
Message-ID: <20250910073827.3622177-4-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250910073827.3622177-1-Penny.Zheng@amd.com>
References: <20250910073827.3622177-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|CH3PR12MB7572:EE_
X-MS-Office365-Filtering-Correlation-Id: ff49e5f5-b7b2-46d7-6364-08ddf03d277d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?24L5FvqOUUmcNC8p/i5aoWorGvWEoI2twO/8NTJci6MDVqgfnzN33kW1eqIA?=
 =?us-ascii?Q?efby8b1mQ1Rhm5rD4mf/u4Nm7DXPKSMdTm4UbEzaukS67+a0VpebhjStsLPA?=
 =?us-ascii?Q?N7VqVI8qrPsyRApSylJyx2zcQOxKQa2w7cQ88VKT+7UajKrqiYNqY7+OvTy7?=
 =?us-ascii?Q?+kCAMAH6HdEEq8TWXXcdBLyyP581G79rgm9YvCCa73TfY+c2B+mkwUFAhmtG?=
 =?us-ascii?Q?L98ure7P/aJAVqzdPYDhjCyq4Fk4kGWGbZTapFymPb/2iEaYpERgx4mRpjyY?=
 =?us-ascii?Q?QxufXPQYbVhNePjx3ELpzY7CvHZ2u0qzw9XhQ6v/pZWKEV3luswreUkpoFaf?=
 =?us-ascii?Q?Ic5zX9bdElt08Oe5kmKT1bgfy+2UXxo1BayBa524FlQq0SsA4g6akPwLdTC2?=
 =?us-ascii?Q?KLlLvRbYbGyPL+qsWChFp1lGOW009Xn/73Gq1sw8u3LSkhG+41z/Q4k0WbUx?=
 =?us-ascii?Q?EC6ItBT5VVJPNdJ4DK8WtZzlXmLBM/iXwhz+0kpFNrzvkYfKCgjvhDXw/wh1?=
 =?us-ascii?Q?QBhtNNq3dpoJFaUtmyDrUlZhPWkG2oHZTVBOkeZPG9hmF+i6teLGuHKJc/sP?=
 =?us-ascii?Q?fKX5YefpMJPEiXkV0WsF9KAW4iUT0fYyMOBzrQNdcsq8bnb/xaGZY9QOUd0B?=
 =?us-ascii?Q?DV208k4+KEHQuJ3McKCfQqil4sh3It9ovZbhQPeHy0iGE0m8KvTekujBH3Qx?=
 =?us-ascii?Q?RRueYCAVRqdtacua4eaMVRPsuL9oo02AiC05YQX3SVnwTo1w6rWTlqArOveA?=
 =?us-ascii?Q?PtDX+s4fcs+48Kbn0MP/6LTb5LQBzPe3PVxNXUSn4WhzgrYlp+k6QJdK7Aow?=
 =?us-ascii?Q?imw6+vy8mba7Zle9RKrfNEaYND5v9U8CLlvTqAr76mkyhOe8f7NIgAIYBFwf?=
 =?us-ascii?Q?leg/m7QPzHomfb/Hh/v+agyjYL2DEwxqfjbzH+gpku0982ZKSMOWYZNzPe2I?=
 =?us-ascii?Q?NixQFiUBW7fYRy6qZ+bZcCrwkqgbD24pinlO0d3P2nurR0aeyCbo7QYxSWCZ?=
 =?us-ascii?Q?hXS8bMHKJF0IXCm3gHpMTe9iGGboQWfidZQlBKFHmAXCaqft7aS4hpyAo2oB?=
 =?us-ascii?Q?YZEaWH6rkUwbAc2EzMbzClgT7/eU3mVMXnUrU3mBjzx/dYkuAxaEopbOaDUj?=
 =?us-ascii?Q?S+n2wDgXOD7AvNa2DqSxVL+aN5W8LCxWlfLnps2R33TgCb07mY0aLlr4Kj//?=
 =?us-ascii?Q?+CPVGO5NBqyfUmmH6JTUIczlnO7yv1qeUqAl4lkDQbGeKglGfyBPTdEKhUVJ?=
 =?us-ascii?Q?JJsZhwnjwvJsyY6TMnG/bwbq5fc/jGQcBq1wGadPx5x9WtAElEL+bSNNiJFP?=
 =?us-ascii?Q?++riAV1bKIfRTZDusJbaNuAzlVILmEOoKEAO8qtt2qQfNmJ1TwoFICkMW55Z?=
 =?us-ascii?Q?hh7OOtON9wxVxQ8bBYaYbfajGRvlh40+NUFpZKIGMaRMjPjW/H9c8gV3R0mJ?=
 =?us-ascii?Q?VPJZ9XYEE0tKqrYzrVzMMAG/CdkWBDy7mqiwDvTqmBmGbDOGzAtM8w3jY+wV?=
 =?us-ascii?Q?MOu/KJXBYKQiHIXrIP8WxyLoDQXvqDiQGSS6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 07:39:20.2003
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff49e5f5-b7b2-46d7-6364-08ddf03d277d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7572

Flag PG_log_dirty is for paging log dirty support, not vram tracking support.
However data structure sh_dirty_vram{} and function paging_log_dirty_range()
designed for vram tracking support, are guarded with PG_log_dirty.
We release both from PG_log_dirty, and also move paging_log_dirty_range(),
remamed with p2m_log_dirty_range(), into p2m.c, where it logically belongs.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- rename paging_log_dirty_range() into p2m_log_dirty_range(), and move it
to p2m.c, where it logically belongs
- remove #ifdef / #endif
- change int to unsigned int
---
 xen/arch/x86/include/asm/p2m.h    |  4 ++++
 xen/arch/x86/include/asm/paging.h | 32 +++++++++++++------------------
 xen/arch/x86/mm/hap/hap.c         |  4 ++--
 xen/arch/x86/mm/p2m.c             | 28 +++++++++++++++++++++++++++
 xen/arch/x86/mm/paging.c          | 32 -------------------------------
 5 files changed, 47 insertions(+), 53 deletions(-)

diff --git a/xen/arch/x86/include/asm/p2m.h b/xen/arch/x86/include/asm/p2m.h
index 3b860e30c3..1856cc396c 100644
--- a/xen/arch/x86/include/asm/p2m.h
+++ b/xen/arch/x86/include/asm/p2m.h
@@ -1110,6 +1110,10 @@ static inline int p2m_entry_modify(struct p2m_domain *p2m, p2m_type_t nt,
 
 #endif /* CONFIG_HVM */
 
+/* get the dirty bitmap for a specific range of pfns */
+void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
+                         unsigned long nr, uint8_t *dirty_bitmap);
+
 #endif /* _XEN_ASM_X86_P2M_H */
 
 /*
diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 768b077ebd..1b0694bb36 100644
--- a/xen/arch/x86/include/asm/paging.h
+++ b/xen/arch/x86/include/asm/paging.h
@@ -133,13 +133,20 @@ struct paging_mode {
     (DIV_ROUND_UP(PADDR_BITS - PAGE_SHIFT - (PAGE_SHIFT + 3), \
                   PAGE_SHIFT - ilog2(sizeof(mfn_t))) + 1)
 
-#if PG_log_dirty
+#ifdef CONFIG_HVM
+/* VRAM dirty tracking support */
+struct sh_dirty_vram {
+    unsigned long begin_pfn;
+    unsigned long end_pfn;
+#ifdef CONFIG_SHADOW_PAGING
+    paddr_t *sl1ma;
+    uint8_t *dirty_bitmap;
+    s_time_t last_dirty;
+#endif
+};
+#endif
 
-/* get the dirty bitmap for a specific range of pfns */
-void paging_log_dirty_range(struct domain *d,
-                            unsigned long begin_pfn,
-                            unsigned long nr,
-                            uint8_t *dirty_bitmap);
+#if PG_log_dirty
 
 /* log dirty initialization */
 void paging_log_dirty_init(struct domain *d, const struct log_dirty_ops *ops);
@@ -171,19 +178,6 @@ bool paging_mfn_is_dirty(const struct domain *d, mfn_t gmfn);
 #define L4_LOGDIRTY_IDX(pfn) ((pfn_x(pfn) >> (PAGE_SHIFT + 3 + PAGETABLE_ORDER * 2)) & \
                               (LOGDIRTY_NODE_ENTRIES-1))
 
-#ifdef CONFIG_HVM
-/* VRAM dirty tracking support */
-struct sh_dirty_vram {
-    unsigned long begin_pfn;
-    unsigned long end_pfn;
-#ifdef CONFIG_SHADOW_PAGING
-    paddr_t *sl1ma;
-    uint8_t *dirty_bitmap;
-    s_time_t last_dirty;
-#endif
-};
-#endif
-
 #else /* !PG_log_dirty */
 
 static inline void paging_log_dirty_init(struct domain *d,
diff --git a/xen/arch/x86/mm/hap/hap.c b/xen/arch/x86/mm/hap/hap.c
index 4aec98109d..2f69ff9c7b 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -42,7 +42,7 @@
  * Create a dirty vram range on demand when some [begin_pfn:begin_pfn+nr] is
  * first encountered.
  * Collect the guest_dirty bitmask, a bit mask of the dirty vram pages, by
- * calling paging_log_dirty_range(), which interrogates each vram
+ * calling p2m_log_dirty_range(), which interrogates each vram
  * page's p2m type looking for pages that have been made writable.
  */
 
@@ -119,7 +119,7 @@ int hap_track_dirty_vram(struct domain *d,
             p2m_flush_hardware_cached_dirty(d);
 
             /* get the bitmap */
-            paging_log_dirty_range(d, begin_pfn, nr_frames, dirty_bitmap);
+            p2m_log_dirty_range(d, begin_pfn, nr_frames, dirty_bitmap);
 
             domain_unpause(d);
         }
diff --git a/xen/arch/x86/mm/p2m.c b/xen/arch/x86/mm/p2m.c
index e802f2e4e6..e2a00a0efd 100644
--- a/xen/arch/x86/mm/p2m.c
+++ b/xen/arch/x86/mm/p2m.c
@@ -2161,6 +2161,34 @@ int relinquish_p2m_mapping(struct domain *d)
     return rc;
 }
 
+void p2m_log_dirty_range(struct domain *d, unsigned long begin_pfn,
+                         unsigned long nr, uint8_t *dirty_bitmap)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    unsigned int i;
+    unsigned long pfn;
+
+    /*
+     * Set l1e entries of P2M table to be read-only.
+     *
+     * On first write, it page faults, its entry is changed to read-write,
+     * and on retry the write succeeds.
+     *
+     * We populate dirty_bitmap by looking for entries that have been
+     * switched to read-write.
+     */
+
+    p2m_lock(p2m);
+
+    for ( i = 0, pfn = begin_pfn; pfn < begin_pfn + nr; i++, pfn++ )
+        if ( !p2m_change_type_one(d, pfn, p2m_ram_rw, p2m_ram_logdirty) )
+            dirty_bitmap[i >> 3] |= (1 << (i & 7));
+
+    p2m_unlock(p2m);
+
+    guest_flush_tlb_mask(d, d->dirty_cpumask);
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index 3aafb0990b..65455a6867 100644
--- a/xen/arch/x86/mm/paging.c
+++ b/xen/arch/x86/mm/paging.c
@@ -583,38 +583,6 @@ static int paging_log_dirty_op(struct domain *d,
     return rv;
 }
 
-#ifdef CONFIG_HVM
-void paging_log_dirty_range(struct domain *d,
-                           unsigned long begin_pfn,
-                           unsigned long nr,
-                           uint8_t *dirty_bitmap)
-{
-    struct p2m_domain *p2m = p2m_get_hostp2m(d);
-    int i;
-    unsigned long pfn;
-
-    /*
-     * Set l1e entries of P2M table to be read-only.
-     *
-     * On first write, it page faults, its entry is changed to read-write,
-     * and on retry the write succeeds.
-     *
-     * We populate dirty_bitmap by looking for entries that have been
-     * switched to read-write.
-     */
-
-    p2m_lock(p2m);
-
-    for ( i = 0, pfn = begin_pfn; pfn < begin_pfn + nr; i++, pfn++ )
-        if ( !p2m_change_type_one(d, pfn, p2m_ram_rw, p2m_ram_logdirty) )
-            dirty_bitmap[i >> 3] |= (1 << (i & 7));
-
-    p2m_unlock(p2m);
-
-    guest_flush_tlb_mask(d, d->dirty_cpumask);
-}
-#endif
-
 /*
  * Callers must supply log_dirty_ops for the log dirty code to call. This
  * function usually is invoked when paging is enabled. Check shadow_enable()
-- 
2.34.1


