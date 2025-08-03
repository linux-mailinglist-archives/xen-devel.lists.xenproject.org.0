Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 903EAB1933D
	for <lists+xen-devel@lfdr.de>; Sun,  3 Aug 2025 11:48:32 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1068339.1432319 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKE-0005ay-Gd; Sun, 03 Aug 2025 09:48:18 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1068339.1432319; Sun, 03 Aug 2025 09:48:18 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uiVKE-0005YT-DB; Sun, 03 Aug 2025 09:48:18 +0000
Received: by outflank-mailman (input) for mailman id 1068339;
 Sun, 03 Aug 2025 09:48:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=f/pN=2P=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uiVKC-0005K3-VN
 for xen-devel@lists.xenproject.org; Sun, 03 Aug 2025 09:48:16 +0000
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20624.outbound.protection.outlook.com
 [2a01:111:f403:2407::624])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id fa7685a1-704e-11f0-a321-13f23c93f187;
 Sun, 03 Aug 2025 11:48:16 +0200 (CEST)
Received: from SJ0PR03CA0258.namprd03.prod.outlook.com (2603:10b6:a03:3a0::23)
 by DS2PR12MB9823.namprd12.prod.outlook.com (2603:10b6:8:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.18; Sun, 3 Aug
 2025 09:48:12 +0000
Received: from SJ1PEPF0000231C.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::6) by SJ0PR03CA0258.outlook.office365.com
 (2603:10b6:a03:3a0::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8989.20 via Frontend Transport; Sun,
 3 Aug 2025 09:48:12 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF0000231C.mail.protection.outlook.com (10.167.242.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9009.8 via Frontend Transport; Sun, 3 Aug 2025 09:48:11 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Sun, 3 Aug 2025 04:48:04 -0500
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
X-Inumbo-ID: fa7685a1-704e-11f0-a321-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c0m/qG1tmFSkKg8cBXdBedElg+l6UQ0Qq6i2XutMu98toKzdvRzV8KG0HkrW3gewcZ51xz9rUW0veRzw0cw4SRRfF5JegNAj1k58fXmusQfEhdPOdNcEf4sbE9XeSAHu5UalEh+BVgntwLESNCrIT8Ug2Wd1J8y1SM0wTqcO58DgE7RFsma5xCrkbOJ8yEPdDk5JP4j11xeMOGU2Ra8F+R/d9kJ3OSLobrWwB1zv5tGNdYBMC/oq9gdBdmqRFM/863a7r4p7r7kQe5kSL137V7NwIvUM+FPguOQFeXh+rkYBZ0LgzM5sOag9daVMLPI/YqUR3xTrhqWGxfPruNcjKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wMenH/9InGy31gRbO7Zt6kQeOlelkssdQv5WC1YzgYM=;
 b=jy6LBqOL7AGjs6rMqyOqNvXOePVWb9Fyf36Dot5cj9LriZw7w4vCwHDx7wRiyAoZzagACfcH9x+DeLMmOnkG528ueMXP4Z4HsBi9qX3rRJhWygJKUIiRP6TYvHQpPCYVL+fjJeKwQw2kaZKXLv+Q8fhGxro0lNa3iSvV8o5XlPgA1P8evq5un3h2vyAjfRZ4hYH25rvBY2EtCZjXN3IOVqnODimiIX1CqLzC294rGxJ7O5JM6RbZsSSIJFIwfyypHRfVl47X4YE7AcgNg6LqD62HczUIObzuII3iIEBVkYcblT9NHSTH4i1ktvCnEchzdxwWbW0vxleMRie02lwqgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wMenH/9InGy31gRbO7Zt6kQeOlelkssdQv5WC1YzgYM=;
 b=29ddRivhTTAezUFe85aYMqQGxww+teKFngczXQ0ehnR/V7MOUJTIQXDkPDvXMJdV7SOWuh2bPm2kjDTyjrQPCHPF4puSKbAHV4+dCQXMDs5f050W/cu31+PQYn3SCWoner2P/72ZVX2CzahUKKcTLithPionVgErWiw7/ajbto4=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH v1 02/25] xen/x86: consolidate vram tracking support
Date: Sun, 3 Aug 2025 17:47:15 +0800
Message-ID: <20250803094738.3625269-3-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250803094738.3625269-1-Penny.Zheng@amd.com>
References: <20250803094738.3625269-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF0000231C:EE_|DS2PR12MB9823:EE_
X-MS-Office365-Filtering-Correlation-Id: e91c1bc7-7004-4748-fd97-08ddd272dbe2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?O3aToYzGtR3S1RoZDociDoTttKhSZ6hGS4l5daEiouiP97c85Vy2UBZ/q20l?=
 =?us-ascii?Q?OVlJysAVCyvJfwP0JekUi4+Tb1f7tGSima7ciztu1l817aIpQolf6yoWEcEZ?=
 =?us-ascii?Q?B+CQOg9dm02K4socorcong6n2VxBb7zDMZn+9+mC9FT4opbuUQBLPjzJlhbt?=
 =?us-ascii?Q?ntH4Bl8DF2rREZNXsjtXvZY+T+6C8lPqRPZYlHlr1mgB6qli5ktlwJroM4tQ?=
 =?us-ascii?Q?xBq1IdBY0toc6gL/Fy9ipIDFUpb0j8QSYKRmxfQolXuTT+OyG9aWasKic41+?=
 =?us-ascii?Q?XpiAuSRBlFOWxnntw5FxymlC3MihfrjmZpMqXfcyIrqK2CSHf5OSa1NkO5EI?=
 =?us-ascii?Q?ZeCiWIjVk0ka/aVTz1tILViMMFWOvAjDEJ8G5gPi1wI2oK9v0g7Dn9dEek7p?=
 =?us-ascii?Q?R8z6OjHYr32pmqVKBHuzKSM6mQR4WyDwPdtGfGjYv9pLxleZe686j+SlxT81?=
 =?us-ascii?Q?9p4CZgQShom2UdEZhxdmPFyTGi5zHegqYdPPwIjx9guyBxABn0fhA2LuUH7h?=
 =?us-ascii?Q?XPnbk9omrRroV4LHqSXwej2HMvSqIHm8962o4a8d4YbUubQ5XD9dvrQ8ACsB?=
 =?us-ascii?Q?vCRXfL5w2gxs4t5XW6r2s93y040WrLdcRn8xg+qnImDi1zWP94zMK44tBofH?=
 =?us-ascii?Q?PTE3NAv7nXPipqCn5u5eYs7gyXpUZ9ahO4CaA75h1c50ZVwEy5Xtz9F3tQfm?=
 =?us-ascii?Q?Ca1W938RAkyz5SusThxFIv9I1OUc821JzxCe8Ci2vXPP5ZfbYVk71pscot/y?=
 =?us-ascii?Q?onkd1ohUIxX2SD4HP0aaRt6dZlmxRQtkuppvVxDe9VejnCvWc02hzp3LLp3x?=
 =?us-ascii?Q?lULjDYXUWz+D+t90wpnnKdlkI1s+1jRmHM2Sf6IpoC3WT4cJnPxi3UZkgcRx?=
 =?us-ascii?Q?s8ahsgWe2lP9+ATE6Gl9ezJ1OlSB1v6rv5YhCyk0kLzwU+fb/kycaSaKUmEb?=
 =?us-ascii?Q?Q9NLzxEDl/6xaDBXWVI0SoGrEpebStI//Cj0R0HrdGdaVkkZ+toFib6XpcXD?=
 =?us-ascii?Q?DfpFqZX4rd9AK1QJYlBgASJu63uraXZGtshD8nGypkqIcyl0H9acnCCF4LqX?=
 =?us-ascii?Q?fiJpL6bF0QCz0xO9OqqxYbcoivLh/rCZ/ApWPSMxaNhj9J0pV6nq8geGccg3?=
 =?us-ascii?Q?vZr22f+gXhOjIznprijUnPX7dWbRGR0f7BZq6mG8TPMYCz5+PLaPMqdzpc4q?=
 =?us-ascii?Q?c6pD9nzL9TEwAyhSJWh7hvtWyInhpgGsCInjknhXx7fdO7rS5pXMnArHRoPH?=
 =?us-ascii?Q?qtMp0cN5DTyxzO90rAzUTy31dz1CABi0Yr2xJBeQL6CONzIUDMA0qrYYUhJc?=
 =?us-ascii?Q?AtNyIXYyNgaTzMGKYhJzgiliRETt42b0o8u3iLlVMsDbWzPbM0FNwDrHNbLq?=
 =?us-ascii?Q?YaxDISYKQ0j6D85tTAjjOp4358D556kEoeB3Mij04/Zd15sodZuCdWAGwbUT?=
 =?us-ascii?Q?Dzj9KF/+ziblR7+4mesM+RjlvZyHhRz+5C+UAP6DuGH3P7PcQx+ewiF1mJnU?=
 =?us-ascii?Q?71K2qADh30ZbOrMeh3uM26RDDiVW6UDSHDrD?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2025 09:48:11.2327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e91c1bc7-7004-4748-fd97-08ddd272dbe2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF0000231C.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9823

Flag PG_log_dirty is for paging log dirty support, not vram tracking support.
However data structure sh_dirty_vram{} and function paging_log_dirty_range()
designed for vram tracking support, are guarded with PG_log_dirty.
We release both from PG_log_dirty, and also move paging_log_dirty_range() into
hap.c, to make it static.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/x86/include/asm/paging.h | 32 +++++++++++++------------------
 xen/arch/x86/mm/hap/hap.c         | 32 +++++++++++++++++++++++++++++++
 xen/arch/x86/mm/paging.c          | 32 -------------------------------
 3 files changed, 45 insertions(+), 51 deletions(-)

diff --git a/xen/arch/x86/include/asm/paging.h b/xen/arch/x86/include/asm/paging.h
index 8a2a0af408..173a569610 100644
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
index ec5043a8aa..668a233923 100644
--- a/xen/arch/x86/mm/hap/hap.c
+++ b/xen/arch/x86/mm/hap/hap.c
@@ -36,6 +36,38 @@
 /*          HAP VRAM TRACKING SUPPORT           */
 /************************************************/
 
+#ifdef CONFIG_HVM
+static void paging_log_dirty_range(struct domain *d,
+                                   unsigned long begin_pfn,
+                                   unsigned long nr,
+                                   uint8_t *dirty_bitmap)
+{
+    struct p2m_domain *p2m = p2m_get_hostp2m(d);
+    int i;
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
+#endif /* CONFIG_HVM */
+
 /*
  * hap_track_dirty_vram()
  * Create the domain's dv_dirty_vram struct on demand.
diff --git a/xen/arch/x86/mm/paging.c b/xen/arch/x86/mm/paging.c
index c77f4c1dac..1216a181c3 100644
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


