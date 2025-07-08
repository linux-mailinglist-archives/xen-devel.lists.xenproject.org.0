Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4721FAFD61E
	for <lists+xen-devel@lfdr.de>; Tue,  8 Jul 2025 20:08:18 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1037033.1409738 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjg-0007Pa-2R; Tue, 08 Jul 2025 18:08:08 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1037033.1409738; Tue, 08 Jul 2025 18:08:08 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uZCjf-0007Mi-Sq; Tue, 08 Jul 2025 18:08:07 +0000
Received: by outflank-mailman (input) for mailman id 1037033;
 Tue, 08 Jul 2025 18:08:05 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=amj7=ZV=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1uZCjd-0005Uq-Gq
 for xen-devel@lists.xenproject.org; Tue, 08 Jul 2025 18:08:05 +0000
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2062e.outbound.protection.outlook.com
 [2a01:111:f403:2409::62e])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 7ccb23c4-5c26-11f0-b894-0df219b8e170;
 Tue, 08 Jul 2025 20:08:03 +0200 (CEST)
Received: from BYAPR06CA0021.namprd06.prod.outlook.com (2603:10b6:a03:d4::34)
 by SA1PR12MB8096.namprd12.prod.outlook.com (2603:10b6:806:326::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.24; Tue, 8 Jul
 2025 18:07:59 +0000
Received: from CY4PEPF0000FCC2.namprd03.prod.outlook.com
 (2603:10b6:a03:d4:cafe::e6) by BYAPR06CA0021.outlook.office365.com
 (2603:10b6:a03:d4::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.21 via Frontend Transport; Tue,
 8 Jul 2025 18:07:58 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000FCC2.mail.protection.outlook.com (10.167.242.104) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8901.15 via Frontend Transport; Tue, 8 Jul 2025 18:07:58 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Jul
 2025 13:07:56 -0500
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
X-Inumbo-ID: 7ccb23c4-5c26-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWT83pnUma0oEvHTRiHQt8/7z6nCIIKB8AW9xkXza4pGUOCgg0A8jhdnRiGn6LdcCJI+U4Pvl6d/3708U8Pc2b2qCbMrBr0tJEZ5ivUyA9AiTcoa13eJHGU9I6Ay5bIj+KW7PIhrcRwvOJZ69Rne92GR+5eHhP9K9rMyi0IYcY1vihtvK5Gx35VpNnV+pgs2SWgvFd26+seDWMbGwrSSNXfjZYvPBuJ/P1qa9x9eZBTyV9nUjRj3YS85V8yzBwbtRpPy94zAhY3WVY7WyRsLQTFcm51NDwweJCz3PwQYFc4kzBuqgmNMlorUOm+tnOEaTXsQOZW0ZSL3PoCOnuGUUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zZ1dNlPeQXMeWWw5Ikp+OY0masjOojVYp1eeKIwZvBE=;
 b=KSsueA4s1dl1OugPvFpdFm0o3gdZEEKdaRcGCUtVjXWjWW0NZRLa5A70VavtkKUWgFfFvnrig6XNQwz7YrTkeQ6oqD1/PNSUzFx1v6dlfDUt0A7tAk27OYH7icl7a+n4HYEsMrF/NErqQKBhEmeeuqAOEloQATWMps2IXAFx7ZGlScFxE27l/PNJb2VZVG9hCU1/OC00CaVXvMwyzDzYo35aJ8f+6Xvt2gQ8rA2RvF7cEjBgGQKRsDp3fleUgfs1xZRWBDYf7IzR0loUm9KAwmshor77QUmeX36+9m9MBtMWc/gVla8dLXW4EPVfNOGg/JHJX+V9tHhYzZkNRfqrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zZ1dNlPeQXMeWWw5Ikp+OY0masjOojVYp1eeKIwZvBE=;
 b=YowKJ46Bjog0ELEby9IcFoehw5Hr0oLFustChuPWT5CtK7iBXI2F3EEgulJyHAJqzQKU5G/BNrwwSC2bY24JwsWsecblTfq7Gr/YobRrMRsMpDUZarJwMEEPCO4MCUfiQNsp/Nh2xPut/GsDcq9ZZFRb8A8qgQaoYhgw8nteONE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Daniel P.
 Smith" <dpsmith@apertussolutions.com>
Subject: [PATCH v6 07/11] xen/dt: Rename bootfdt.c -> bootinfo-fdt.c
Date: Tue, 8 Jul 2025 20:07:16 +0200
Message-ID: <20250708180721.2338036-8-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
References: <20250708180721.2338036-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC2:EE_|SA1PR12MB8096:EE_
X-MS-Office365-Filtering-Correlation-Id: e73e57c1-b068-42a4-56d7-08ddbe4a5f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?I4wgPaZ/bWTmLO2a6IbsdF6U2PnyW7r9BiMYoae7e5LSyjw/fiHBO9m/Da+x?=
 =?us-ascii?Q?qaBqsF1ZwK0Yak/LNI3qxpNNBi5xHw9Sz8UBaHv/KaIxl54p6CvT4k7DHEqm?=
 =?us-ascii?Q?N/YO1m8lrus4Zj0G7kFOsa1OcyJd/o6TCVzcJ/AZpkPQL7d8IGlqaOWt2gQ6?=
 =?us-ascii?Q?dK2sftuBZvgljGVj8JaGOebPXp8LYf7SVy9XGfOzC4tCv3jjDgMYiaB5sBLV?=
 =?us-ascii?Q?wWnkDWQCqBhmfiwwRLNi7fVK+Za1B55xAodIaFwgrf8cHxuQcp4q+qPddxpy?=
 =?us-ascii?Q?e4lgyMiLp9gEcejztc7arjurDEX6ERC5TRSTZyUv27+X3vRIS0ah83phwTaQ?=
 =?us-ascii?Q?o2sgo29Qu/SwKotD0+avflr5y4/lyAZuBZ2ZWacFxzcsWRAgbFkzJ46RCplc?=
 =?us-ascii?Q?PoMzfZa2VG0MLMw2VPjRuIg0NQGGRKdjA/1CpvRhvc/k2x6sQDATqePB4xF5?=
 =?us-ascii?Q?r+shZj78hQ64ssHj+B/Hps4hc4f2k/Vw62NGI4eYd2t77l5nUPpR9VJpXsXK?=
 =?us-ascii?Q?IKptxph7qTrpDU+gLNoPPLJg1RiLlEPvFZCwoQYcgSZ5HDQifIsrj/7ETPrA?=
 =?us-ascii?Q?/BKtMV6lgvFD5uCR9n13xJx6OQXkGYF1vM2yYHGfudp/dmD8wINV/6+bYe3R?=
 =?us-ascii?Q?VUkUOLkUPHosn7Hj5+/GCOIkBFOEsDOZZNdaxteSwxI0SV8OHNMclUwMiznU?=
 =?us-ascii?Q?bmxzSbgqw49pgBt0uEpd5mkpFWxAcikAko57iHwfbx0njDchTLdcbraP8ii6?=
 =?us-ascii?Q?ygUchBzPv3ZOSK+rfR6k11DdAowGTAIQZx4MjUk1H6YRHtZpth7TPPtmPSqo?=
 =?us-ascii?Q?lX63TghKEe2hlsIFgLfg4Z5pDsgwdzP1zvUHydJNat1XLdyzgyvlV3p2+bAa?=
 =?us-ascii?Q?Fvt9FkrTO0HfQphgssP7vO9RF0ONEAy9h53s2D7nQag+JM2I8Gje85imxbvK?=
 =?us-ascii?Q?BpO7jAy9phMNN9dwfcxkS4E0vF19QbmKirRUR8786Q6+WNp57LQOCvUa+3gI?=
 =?us-ascii?Q?5r8xkA/yMB80ZOgJobykntmUTitGCp3zZNHWyNMujHrjvFEuTkCu3hhNGmlW?=
 =?us-ascii?Q?kHjMhyuqpntABKR79Dhg17jKlURTM/pMIx+lSjfHvS64qqjbK1QSRLNiBGjq?=
 =?us-ascii?Q?EbmCgHvRbqHZ8CSKTJplNWEAX05Zzj4fIMP07kgr1EIhP45K6hOOSuZ6eb7J?=
 =?us-ascii?Q?PQAgveHuqq1sSu+HRYl0MKjjsLjLPTyQm4PnmWukMJ1cLsiprQfi23FEfhYu?=
 =?us-ascii?Q?TPNnPwnKP94StAz1SXU5AvEhqwgj7cz6Hk9OC95o6C9Aqq0IiunLZ6y6/i+V?=
 =?us-ascii?Q?2TbwO6Viz/XOmhmFY1FRAFDl7K7MFflBVjOSleNBpb7sfIxGLX1YDTCwW7CZ?=
 =?us-ascii?Q?JZQ8MSGX+svPJXkVrmmDKZJQirX0C1sI3aoE49FpGuRmIiNmOue0pQgjapSH?=
 =?us-ascii?Q?S5GLMUD8znpWdthfSNmCSM4HdZOu65+c69M2xP/lcg+vf35tVgQrvHwqhljV?=
 =?us-ascii?Q?aV5ifm1KwzLJV/lfHtNb4FJ0o33PJmZRZTUt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 18:07:58.8220
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e73e57c1-b068-42a4-56d7-08ddbe4a5f1d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000FCC2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8096

From: Alejandro Vallejo <agarciav@amd.com>

This file will eventually contain bootfdt helpers that make heavy use of
bootinfo. To simplify git history do the rename here explicitly. A later
patch extracts bootinfo-independent helpers into bootfdt.c.

Doing so here would needlessly pollute the diffs.

Not a functional change.

Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
Reviewed-by: Stefano Stabellini <sstabellini@kernel.org>
---
 xen/common/device-tree/Makefile       |   1 +
 xen/common/device-tree/bootfdt.c      | 646 +-------------------------
 xen/common/device-tree/bootinfo-fdt.c | 597 ++++++++++++++++++++++++
 3 files changed, 619 insertions(+), 625 deletions(-)
 create mode 100644 xen/common/device-tree/bootinfo-fdt.c

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index 13127296cb..8abc069c4b 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -1,4 +1,5 @@
 obj-y += bootfdt.init.o
+obj-y += bootinfo-fdt.init.o
 obj-y += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
diff --git a/xen/common/device-tree/bootfdt.c b/xen/common/device-tree/bootfdt.c
index 1848478e82..0d8d9ea357 100644
--- a/xen/common/device-tree/bootfdt.c
+++ b/xen/common/device-tree/bootfdt.c
@@ -1,206 +1,8 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Early Device Tree
- *
- * Copyright (C) 2012-2014 Citrix Systems, Inc.
- */
-
-#include <xen/bootinfo.h>
-#include <xen/device_tree.h>
-#include <xen/efi.h>
-#include <xen/init.h>
-#include <xen/kernel.h>
+#include <xen/bootfdt.h>
+#include <xen/bug.h>
 #include <xen/lib.h>
-#include <xen/libfdt/libfdt-xen.h>
-#include <xen/sort.h>
-#include <xen/static-shmem.h>
-#include <xsm/xsm.h>
-#include <asm/setup.h>
-
-static void __init __maybe_unused build_assertions(void)
-{
-    /*
-     * Check that no padding is between struct membanks "bank" flexible array
-     * member and struct meminfo "bank" member
-     */
-    BUILD_BUG_ON((offsetof(struct membanks, bank) !=
-                 offsetof(struct meminfo, bank)));
-    /* Ensure "struct membanks" and "struct membank" are equally aligned */
-    BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));
-}
-
-static bool __init device_tree_node_is_available(const void *fdt, int node)
-{
-    const char *status;
-    int len;
-
-    status = fdt_getprop(fdt, node, "status", &len);
-    if ( !status )
-        return true;
-
-    if ( len > 0 )
-    {
-        if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
-            return true;
-    }
-
-    return false;
-}
-
-static bool __init device_tree_node_matches(const void *fdt, int node,
-                                            const char *match)
-{
-    const char *name;
-    size_t match_len;
-
-    name = fdt_get_name(fdt, node, NULL);
-    match_len = strlen(match);
-
-    /* Match both "match" and "match@..." patterns but not
-       "match-foo". */
-    return strncmp(name, match, match_len) == 0
-        && (name[match_len] == '@' || name[match_len] == '\0');
-}
-
-static bool __init device_tree_node_compatible(const void *fdt, int node,
-                                               const char *match)
-{
-    int len, l;
-    const void *prop;
-
-    prop = fdt_getprop(fdt, node, "compatible", &len);
-    if ( prop == NULL )
-        return false;
-
-    while ( len > 0 ) {
-        if ( !dt_compat_cmp(prop, match) )
-            return true;
-        l = strlen(prop) + 1;
-        prop += l;
-        len -= l;
-    }
-
-    return false;
-}
-
-/*
- * Check if a node is a proper /memory node according to Devicetree
- * Specification v0.4, chapter 3.4.
- */
-static bool __init device_tree_is_memory_node(const void *fdt, int node,
-                                              int depth)
-{
-    const char *type;
-    int len;
-
-    if ( depth != 1 )
-        return false;
-
-    if ( !device_tree_node_matches(fdt, node, "memory") )
-        return false;
-
-    type = fdt_getprop(fdt, node, "device_type", &len);
-    if ( !type )
-        return false;
-
-    if ( (len <= strlen("memory")) || strcmp(type, "memory") )
-        return false;
-
-    return true;
-}
-
-void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
-                                uint32_t size_cells, paddr_t *start,
-                                paddr_t *size)
-{
-    uint64_t dt_start, dt_size;
-
-    /*
-     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
-     * Thus, there is an implicit cast from uint64_t to paddr_t.
-     */
-    dt_start = dt_next_cell(address_cells, cell);
-    dt_size = dt_next_cell(size_cells, cell);
-
-    if ( dt_start != (paddr_t)dt_start )
-    {
-        printk("Physical address greater than max width supported\n");
-        WARN();
-    }
-
-    if ( dt_size != (paddr_t)dt_size )
-    {
-        printk("Physical size greater than max width supported\n");
-        WARN();
-    }
-
-    /*
-     * Xen will truncate the address/size if it is greater than the maximum
-     * supported width and it will give an appropriate warning.
-     */
-    *start = dt_start;
-    *size = dt_size;
-}
-
-static int __init device_tree_get_meminfo(const void *fdt, int node,
-                                          const char *prop_name,
-                                          u32 address_cells, u32 size_cells,
-                                          struct membanks *mem,
-                                          enum membank_type type)
-{
-    const struct fdt_property *prop;
-    unsigned int i, banks;
-    const __be32 *cell;
-    u32 reg_cells = address_cells + size_cells;
-    paddr_t start, size;
-
-    if ( !device_tree_node_is_available(fdt, node) )
-        return 0;
-
-    if ( address_cells < 1 || size_cells < 1 )
-    {
-        printk("fdt: property `%s': invalid #address-cells or #size-cells",
-               prop_name);
-        return -EINVAL;
-    }
-
-    prop = fdt_get_property(fdt, node, prop_name, NULL);
-    if ( !prop )
-        return -ENOENT;
-
-    cell = (const __be32 *)prop->data;
-    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
-
-    for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
-    {
-        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-        /*
-         * Some valid device trees, such as those generated by OpenPOWER
-         * skiboot firmware, expose all reserved memory regions in the
-         * FDT memory reservation block AND in the reserved-memory node which
-         * has already been parsed. Thus, any matching overlaps in the
-         * reserved_mem banks should be ignored.
-         */
-        if ( mem == bootinfo_get_reserved_mem() &&
-             check_reserved_regions_overlap(start, size, true) )
-            return -EINVAL;
-        /* Some DT may describe empty bank, ignore them */
-        if ( !size )
-            continue;
-        mem->bank[mem->nr_banks].start = start;
-        mem->bank[mem->nr_banks].size = size;
-        mem->bank[mem->nr_banks].type = type;
-        mem->nr_banks++;
-    }
-
-    if ( i < banks )
-    {
-        printk("Warning: Max number of supported memory regions reached.\n");
-        return -ENOSPC;
-    }
-
-    return 0;
-}
+#include <xen/libfdt/libfdt.h>
 
 u32 __init device_tree_get_u32(const void *fdt, int node,
                                const char *prop_name, u32 dflt)
@@ -214,18 +16,6 @@ u32 __init device_tree_get_u32(const void *fdt, int node,
     return fdt32_to_cpu(*(uint32_t*)prop->data);
 }
 
-/**
- * device_tree_for_each_node - iterate over all device tree sub-nodes
- * @fdt: flat device tree.
- * @node: parent node to start the search from
- * @func: function to call for each sub-node.
- * @data: data to pass to @func.
- *
- * Any nodes nested at DEVICE_TREE_MAX_DEPTH or deeper are ignored.
- *
- * Returns 0 if all nodes were iterated over successfully.  If @func
- * returns a value different from 0, that value is returned immediately.
- */
 int __init device_tree_for_each_node(const void *fdt, int node,
                                      device_tree_node_func func,
                                      void *data)
@@ -273,429 +63,35 @@ int __init device_tree_for_each_node(const void *fdt, int node,
     return 0;
 }
 
-static int __init process_memory_node(const void *fdt, int node,
-                                      const char *name, int depth,
-                                      u32 address_cells, u32 size_cells,
-                                      struct membanks *mem)
-{
-    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
-                                   mem, MEMBANK_DEFAULT);
-}
-
-static int __init process_reserved_memory_node(const void *fdt, int node,
-                                               const char *name, int depth,
-                                               u32 address_cells,
-                                               u32 size_cells,
-                                               void *data)
-{
-    int rc = process_memory_node(fdt, node, name, depth, address_cells,
-                                 size_cells, data);
-
-    if ( rc == -ENOSPC )
-        panic("Max number of supported reserved-memory regions reached.\n");
-    else if ( rc != -ENOENT )
-        return rc;
-    return 0;
-}
-
-static int __init process_reserved_memory(const void *fdt, int node,
-                                          const char *name, int depth,
-                                          u32 address_cells, u32 size_cells)
-{
-    return device_tree_for_each_node(fdt, node,
-                                     process_reserved_memory_node,
-                                     bootinfo_get_reserved_mem());
-}
-
-static void __init process_multiboot_node(const void *fdt, int node,
-                                          const char *name,
-                                          u32 address_cells, u32 size_cells)
-{
-    static int __initdata kind_guess = 0;
-    const struct fdt_property *prop;
-    const __be32 *cell;
-    boot_module_kind kind;
-    paddr_t start, size;
-    int len;
-    /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
-    char path[92];
-    int parent_node, ret;
-    bool domU;
-
-    parent_node = fdt_parent_offset(fdt, node);
-    ASSERT(parent_node >= 0);
-
-    /* Check that the node is under "/chosen" (first 7 chars of path) */
-    ret = fdt_get_path(fdt, node, path, sizeof (path));
-    if ( ret != 0 || strncmp(path, "/chosen", 7) )
-        return;
-
-    prop = fdt_get_property(fdt, node, "reg", &len);
-    if ( !prop )
-        panic("node %s missing `reg' property\n", name);
-
-    if ( len < dt_cells_to_size(address_cells + size_cells) )
-        panic("fdt: node `%s': `reg` property length is too short\n",
-                    name);
-
-    cell = (const __be32 *)prop->data;
-    device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
-
-    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
-         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
-        kind = BOOTMOD_KERNEL;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
-              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
-        kind = BOOTMOD_RAMDISK;
-    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
-        kind = BOOTMOD_XSM;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
-        kind = BOOTMOD_GUEST_DTB;
-    else if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
-        kind = BOOTMOD_MICROCODE;
-    else
-        kind = BOOTMOD_UNKNOWN;
-
-    /**
-     * Guess the kind of these first two unknowns respectively:
-     * (1) The first unknown must be kernel.
-     * (2) Detect the XSM Magic from the 2nd unknown:
-     *     a. If it's XSM, set the kind as XSM, and that also means we
-     *     won't load ramdisk;
-     *     b. if it's not XSM, set the kind as ramdisk.
-     *     So if user want to load ramdisk, it must be the 2nd unknown.
-     * We also detect the XSM Magic for the following unknowns,
-     * then set its kind according to the return value of has_xsm_magic.
-     */
-    if ( kind == BOOTMOD_UNKNOWN )
-    {
-        switch ( kind_guess++ )
-        {
-        case 0: kind = BOOTMOD_KERNEL; break;
-        case 1: kind = BOOTMOD_RAMDISK; break;
-        default: break;
-        }
-        if ( kind_guess > 1 && has_xsm_magic(start) )
-            kind = BOOTMOD_XSM;
-    }
-
-    domU = fdt_node_check_compatible(fdt, parent_node, "xen,domain") == 0;
-    add_boot_module(kind, start, size, domU);
-
-    prop = fdt_get_property(fdt, node, "bootargs", &len);
-    if ( !prop )
-        return;
-    add_boot_cmdline(fdt_get_name(fdt, parent_node, &len), prop->data,
-                     kind, start, domU);
-}
-
-static int __init process_chosen_node(const void *fdt, int node,
-                                      const char *name,
-                                      u32 address_cells, u32 size_cells)
-{
-    const struct fdt_property *prop;
-    paddr_t start, end;
-    int len;
-
-    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
-    {
-        int rc;
-
-        printk("Checking for static heap in /chosen\n");
-
-        rc = device_tree_get_meminfo(fdt, node, "xen,static-heap",
-                                     address_cells, size_cells,
-                                     bootinfo_get_reserved_mem(),
-                                     MEMBANK_STATIC_HEAP);
-        if ( rc )
-            return rc;
-
-        using_static_heap = true;
-    }
-
-    printk("Checking for initrd in /chosen\n");
-
-    prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
-    if ( !prop )
-        /* No initrd present. */
-        return 0;
-    if ( len != sizeof(u32) && len != sizeof(u64) )
-    {
-        printk("linux,initrd-start property has invalid length %d\n", len);
-        return -EINVAL;
-    }
-    start = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
-
-    prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
-    if ( !prop )
-    {
-        printk("linux,initrd-end not present but -start was\n");
-        return -EINVAL;
-    }
-    if ( len != sizeof(u32) && len != sizeof(u64) )
-    {
-        printk("linux,initrd-end property has invalid length %d\n", len);
-        return -EINVAL;
-    }
-    end = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
-
-    if ( start >= end )
-    {
-        printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
-                  start, end);
-        return -EINVAL;
-    }
-
-    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end - 1);
-
-    add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
-
-    return 0;
-}
-
-static int __init process_domain_node(const void *fdt, int node,
-                                      const char *name,
-                                      u32 address_cells, u32 size_cells)
-{
-    const struct fdt_property *prop;
-
-    printk("Checking for \"xen,static-mem\" in domain node\n");
-
-    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
-    if ( !prop )
-        /* No "xen,static-mem" present. */
-        return 0;
-
-    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
-                                   size_cells, bootinfo_get_reserved_mem(),
-                                   MEMBANK_STATIC_DOMAIN);
-}
-
-#ifndef CONFIG_STATIC_SHM
-static inline int process_shm_node(const void *fdt, int node,
-                                   uint32_t address_cells, uint32_t size_cells)
-{
-    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared"
-            " memory nodes\n");
-    return -EINVAL;
-}
-#endif
-
-static int __init early_scan_node(const void *fdt,
-                                  int node, const char *name, int depth,
-                                  u32 address_cells, u32 size_cells,
-                                  void *data)
+void __init device_tree_get_reg(const __be32 **cell, uint32_t address_cells,
+                                uint32_t size_cells, paddr_t *start,
+                                paddr_t *size)
 {
-    int rc = 0;
+    uint64_t dt_start, dt_size;
 
     /*
-     * If Xen has been booted via UEFI, the memory banks are
-     * populated. So we should skip the parsing.
+     * dt_next_cell will return uint64_t whereas paddr_t may not be 64-bit.
+     * Thus, there is an implicit cast from uint64_t to paddr_t.
      */
-    if ( !efi_enabled(EFI_BOOT) &&
-         device_tree_is_memory_node(fdt, node, depth) )
-        rc = process_memory_node(fdt, node, name, depth,
-                                 address_cells, size_cells, bootinfo_get_mem());
-    else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
-        rc = process_reserved_memory(fdt, node, name, depth,
-                                     address_cells, size_cells);
-    else if ( depth <= 3 && (device_tree_node_compatible(fdt, node, "xen,multiboot-module" ) ||
-              device_tree_node_compatible(fdt, node, "multiboot,module" )))
-        process_multiboot_node(fdt, node, name, address_cells, size_cells);
-    else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
-        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
-    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
-        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
-    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
-        rc = process_shm_node(fdt, node, address_cells, size_cells);
-
-    if ( rc < 0 )
-        printk("fdt: node `%s': parsing failed\n", name);
-    return rc;
-}
-
-static void __init early_print_info(void)
-{
-    const struct membanks *mi = bootinfo_get_mem();
-    const struct membanks *mem_resv = bootinfo_get_reserved_mem();
-    struct boot_modules *mods = &bootinfo.modules;
-    struct bootcmdlines *cmds = &bootinfo.cmdlines;
-    unsigned int i;
-
-    for ( i = 0; i < mi->nr_banks; i++ )
-        printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
-                mi->bank[i].start,
-                mi->bank[i].start + mi->bank[i].size - 1);
-    printk("\n");
-    for ( i = 0 ; i < mods->nr_mods; i++ )
-        printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
-                i,
-                mods->module[i].start,
-                mods->module[i].start + mods->module[i].size - 1,
-                boot_module_kind_as_string(mods->module[i].kind));
-
-    for ( i = 0; i < mem_resv->nr_banks; i++ )
-    {
-        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
-               mem_resv->bank[i].start,
-               mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
-    }
-#ifdef CONFIG_STATIC_SHM
-    early_print_info_shmem();
-#endif
-    printk("\n");
-    for ( i = 0 ; i < cmds->nr_mods; i++ )
-        printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
-               cmds->cmdline[i].dt_name,
-               &cmds->cmdline[i].cmdline[0]);
-    printk("\n");
-}
-
-/* This function assumes that memory regions are not overlapped */
-static int __init cmp_memory_node(const void *key, const void *elem)
-{
-    const struct membank *handler0 = key;
-    const struct membank *handler1 = elem;
-
-    if ( handler0->start < handler1->start )
-        return -1;
-
-    if ( handler0->start >= (handler1->start + handler1->size) )
-        return 1;
-
-    return 0;
-}
-
-static void __init swap_memory_node(void *_a, void *_b, size_t size)
-{
-    struct membank *a = _a, *b = _b;
-
-    SWAP(*a, *b);
-}
-
-/**
- * boot_fdt_info - initialize bootinfo from a DTB
- * @fdt: flattened device tree binary
- *
- * Returns the size of the DTB.
- */
-size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
-{
-    struct membanks *reserved_mem = bootinfo_get_reserved_mem();
-    struct membanks *mem = bootinfo_get_mem();
-    unsigned int i;
-    int nr_rsvd;
-    int ret;
-
-    ret = fdt_check_header(fdt);
-    if ( ret < 0 )
-        panic("No valid device tree\n");
-
-    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
-
-    nr_rsvd = fdt_num_mem_rsv(fdt);
-    if ( nr_rsvd < 0 )
-        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
+    dt_start = dt_next_cell(address_cells, cell);
+    dt_size = dt_next_cell(size_cells, cell);
 
-    for ( i = 0; i < nr_rsvd; i++ )
+    if ( dt_start != (paddr_t)dt_start )
     {
-        struct membank *bank;
-        paddr_t s, sz;
-
-        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
-            continue;
-
-        if ( reserved_mem->nr_banks < reserved_mem->max_banks )
-        {
-            bank = &reserved_mem->bank[reserved_mem->nr_banks];
-            bank->start = s;
-            bank->size = sz;
-            bank->type = MEMBANK_FDT_RESVMEM;
-            reserved_mem->nr_banks++;
-        }
-        else
-            panic("Cannot allocate reserved memory bank\n");
+        printk("Physical address greater than max width supported\n");
+        WARN();
     }
 
-    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
-    if ( ret )
-        panic("Early FDT parsing failed (%d)\n", ret);
-
-    /*
-     * On Arm64 setup_directmap_mappings() expects to be called with the lowest
-     * bank in memory first. There is no requirement that the DT will provide
-     * the banks sorted in ascending order. So sort them through.
-     */
-    sort(mem->bank, mem->nr_banks, sizeof(struct membank),
-         cmp_memory_node, swap_memory_node);
-
-    early_print_info();
-
-    return fdt_totalsize(fdt);
-}
-
-const __init char *boot_fdt_cmdline(const void *fdt)
-{
-    int node;
-    const struct fdt_property *prop;
-
-    node = fdt_path_offset(fdt, "/chosen");
-    if ( node < 0 )
-        return NULL;
-
-    prop = fdt_get_property(fdt, node, "xen,xen-bootargs", NULL);
-    if ( prop == NULL )
+    if ( dt_size != (paddr_t)dt_size )
     {
-        struct bootcmdline *dom0_cmdline =
-            boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
-
-        if (fdt_get_property(fdt, node, "xen,dom0-bootargs", NULL) ||
-            ( dom0_cmdline && dom0_cmdline->cmdline[0] ) )
-            prop = fdt_get_property(fdt, node, "bootargs", NULL);
+        printk("Physical size greater than max width supported\n");
+        WARN();
     }
-    if ( prop == NULL )
-        return NULL;
-
-    return prop->data;
-}
 
-/*
- * Wrapper to convert physical address from paddr_t to uint64_t and
- * invoke fdt_begin_node(). This is required as the physical address
- * provided as part of node name should not contain any leading
- * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
- * unit (which contains the physical address) with name to generate a
- * node name.
- */
-int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
-{
     /*
-     * The size of the buffer to hold the longest possible string (i.e.
-     * interrupt-controller@ + a 64-bit number + \0).
+     * Xen will truncate the address/size if it is greater than the maximum
+     * supported width and it will give an appropriate warning.
      */
-    char buf[38];
-    int ret;
-
-    /* ePAPR 3.4 */
-    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
-
-    if ( ret >= sizeof(buf) )
-    {
-        printk(XENLOG_ERR
-               "Insufficient buffer. Minimum size required is %d\n",
-               (ret + 1));
-
-        return -FDT_ERR_TRUNCATED;
-    }
-
-    return fdt_begin_node(fdt, buf);
+    *start = dt_start;
+    *size = dt_size;
 }
-
-/*
- * Local variables:
- * mode: C
- * c-file-style: "BSD"
- * c-basic-offset: 4
- * indent-tabs-mode: nil
- * End:
- */
diff --git a/xen/common/device-tree/bootinfo-fdt.c b/xen/common/device-tree/bootinfo-fdt.c
new file mode 100644
index 0000000000..16036472f3
--- /dev/null
+++ b/xen/common/device-tree/bootinfo-fdt.c
@@ -0,0 +1,597 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Early Device Tree with bootinfo hooks
+ *
+ * Copyright (C) 2012-2014 Citrix Systems, Inc.
+ */
+
+#include <xen/bootinfo.h>
+#include <xen/device_tree.h>
+#include <xen/efi.h>
+#include <xen/init.h>
+#include <xen/kernel.h>
+#include <xen/lib.h>
+#include <xen/libfdt/libfdt-xen.h>
+#include <xen/sort.h>
+#include <xen/static-shmem.h>
+#include <xsm/xsm.h>
+#include <asm/setup.h>
+
+static void __init __maybe_unused build_assertions(void)
+{
+    /*
+     * Check that no padding is between struct membanks "bank" flexible array
+     * member and struct meminfo "bank" member
+     */
+    BUILD_BUG_ON((offsetof(struct membanks, bank) !=
+                 offsetof(struct meminfo, bank)));
+    /* Ensure "struct membanks" and "struct membank" are equally aligned */
+    BUILD_BUG_ON(alignof(struct membanks) != alignof(struct membank));
+}
+
+static bool __init device_tree_node_is_available(const void *fdt, int node)
+{
+    const char *status;
+    int len;
+
+    status = fdt_getprop(fdt, node, "status", &len);
+    if ( !status )
+        return true;
+
+    if ( len > 0 )
+    {
+        if ( !strcmp(status, "ok") || !strcmp(status, "okay") )
+            return true;
+    }
+
+    return false;
+}
+
+static bool __init device_tree_node_matches(const void *fdt, int node,
+                                            const char *match)
+{
+    const char *name;
+    size_t match_len;
+
+    name = fdt_get_name(fdt, node, NULL);
+    match_len = strlen(match);
+
+    /* Match both "match" and "match@..." patterns but not
+       "match-foo". */
+    return strncmp(name, match, match_len) == 0
+        && (name[match_len] == '@' || name[match_len] == '\0');
+}
+
+static bool __init device_tree_node_compatible(const void *fdt, int node,
+                                               const char *match)
+{
+    int len, l;
+    const void *prop;
+
+    prop = fdt_getprop(fdt, node, "compatible", &len);
+    if ( prop == NULL )
+        return false;
+
+    while ( len > 0 ) {
+        if ( !dt_compat_cmp(prop, match) )
+            return true;
+        l = strlen(prop) + 1;
+        prop += l;
+        len -= l;
+    }
+
+    return false;
+}
+
+/*
+ * Check if a node is a proper /memory node according to Devicetree
+ * Specification v0.4, chapter 3.4.
+ */
+static bool __init device_tree_is_memory_node(const void *fdt, int node,
+                                              int depth)
+{
+    const char *type;
+    int len;
+
+    if ( depth != 1 )
+        return false;
+
+    if ( !device_tree_node_matches(fdt, node, "memory") )
+        return false;
+
+    type = fdt_getprop(fdt, node, "device_type", &len);
+    if ( !type )
+        return false;
+
+    if ( (len <= strlen("memory")) || strcmp(type, "memory") )
+        return false;
+
+    return true;
+}
+
+static int __init device_tree_get_meminfo(const void *fdt, int node,
+                                          const char *prop_name,
+                                          u32 address_cells, u32 size_cells,
+                                          struct membanks *mem,
+                                          enum membank_type type)
+{
+    const struct fdt_property *prop;
+    unsigned int i, banks;
+    const __be32 *cell;
+    u32 reg_cells = address_cells + size_cells;
+    paddr_t start, size;
+
+    if ( !device_tree_node_is_available(fdt, node) )
+        return 0;
+
+    if ( address_cells < 1 || size_cells < 1 )
+    {
+        printk("fdt: property `%s': invalid #address-cells or #size-cells",
+               prop_name);
+        return -EINVAL;
+    }
+
+    prop = fdt_get_property(fdt, node, prop_name, NULL);
+    if ( !prop )
+        return -ENOENT;
+
+    cell = (const __be32 *)prop->data;
+    banks = fdt32_to_cpu(prop->len) / (reg_cells * sizeof (u32));
+
+    for ( i = 0; i < banks && mem->nr_banks < mem->max_banks; i++ )
+    {
+        device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+        /*
+         * Some valid device trees, such as those generated by OpenPOWER
+         * skiboot firmware, expose all reserved memory regions in the
+         * FDT memory reservation block AND in the reserved-memory node which
+         * has already been parsed. Thus, any matching overlaps in the
+         * reserved_mem banks should be ignored.
+         */
+        if ( mem == bootinfo_get_reserved_mem() &&
+             check_reserved_regions_overlap(start, size, true) )
+            return -EINVAL;
+        /* Some DT may describe empty bank, ignore them */
+        if ( !size )
+            continue;
+        mem->bank[mem->nr_banks].start = start;
+        mem->bank[mem->nr_banks].size = size;
+        mem->bank[mem->nr_banks].type = type;
+        mem->nr_banks++;
+    }
+
+    if ( i < banks )
+    {
+        printk("Warning: Max number of supported memory regions reached.\n");
+        return -ENOSPC;
+    }
+
+    return 0;
+}
+
+static int __init process_memory_node(const void *fdt, int node,
+                                      const char *name, int depth,
+                                      u32 address_cells, u32 size_cells,
+                                      struct membanks *mem)
+{
+    return device_tree_get_meminfo(fdt, node, "reg", address_cells, size_cells,
+                                   mem, MEMBANK_DEFAULT);
+}
+
+static int __init process_reserved_memory_node(const void *fdt, int node,
+                                               const char *name, int depth,
+                                               u32 address_cells,
+                                               u32 size_cells,
+                                               void *data)
+{
+    int rc = process_memory_node(fdt, node, name, depth, address_cells,
+                                 size_cells, data);
+
+    if ( rc == -ENOSPC )
+        panic("Max number of supported reserved-memory regions reached.\n");
+    else if ( rc != -ENOENT )
+        return rc;
+    return 0;
+}
+
+static int __init process_reserved_memory(const void *fdt, int node,
+                                          const char *name, int depth,
+                                          u32 address_cells, u32 size_cells)
+{
+    return device_tree_for_each_node(fdt, node,
+                                     process_reserved_memory_node,
+                                     bootinfo_get_reserved_mem());
+}
+
+static void __init process_multiboot_node(const void *fdt, int node,
+                                          const char *name,
+                                          u32 address_cells, u32 size_cells)
+{
+    static int __initdata kind_guess = 0;
+    const struct fdt_property *prop;
+    const __be32 *cell;
+    boot_module_kind kind;
+    paddr_t start, size;
+    int len;
+    /* sizeof("/chosen/") + DT_MAX_NAME + '/' + DT_MAX_NAME + '/0' => 92 */
+    char path[92];
+    int parent_node, ret;
+    bool domU;
+
+    parent_node = fdt_parent_offset(fdt, node);
+    ASSERT(parent_node >= 0);
+
+    /* Check that the node is under "/chosen" (first 7 chars of path) */
+    ret = fdt_get_path(fdt, node, path, sizeof (path));
+    if ( ret != 0 || strncmp(path, "/chosen", 7) )
+        return;
+
+    prop = fdt_get_property(fdt, node, "reg", &len);
+    if ( !prop )
+        panic("node %s missing `reg' property\n", name);
+
+    if ( len < dt_cells_to_size(address_cells + size_cells) )
+        panic("fdt: node `%s': `reg` property length is too short\n",
+                    name);
+
+    cell = (const __be32 *)prop->data;
+    device_tree_get_reg(&cell, address_cells, size_cells, &start, &size);
+
+    if ( fdt_node_check_compatible(fdt, node, "xen,linux-zimage") == 0 ||
+         fdt_node_check_compatible(fdt, node, "multiboot,kernel") == 0 )
+        kind = BOOTMOD_KERNEL;
+    else if ( fdt_node_check_compatible(fdt, node, "xen,linux-initrd") == 0 ||
+              fdt_node_check_compatible(fdt, node, "multiboot,ramdisk") == 0 )
+        kind = BOOTMOD_RAMDISK;
+    else if ( fdt_node_check_compatible(fdt, node, "xen,xsm-policy") == 0 )
+        kind = BOOTMOD_XSM;
+    else if ( fdt_node_check_compatible(fdt, node, "multiboot,device-tree") == 0 )
+        kind = BOOTMOD_GUEST_DTB;
+    else if ( fdt_node_check_compatible(fdt, node, "multiboot,microcode") == 0 )
+        kind = BOOTMOD_MICROCODE;
+    else
+        kind = BOOTMOD_UNKNOWN;
+
+    /**
+     * Guess the kind of these first two unknowns respectively:
+     * (1) The first unknown must be kernel.
+     * (2) Detect the XSM Magic from the 2nd unknown:
+     *     a. If it's XSM, set the kind as XSM, and that also means we
+     *     won't load ramdisk;
+     *     b. if it's not XSM, set the kind as ramdisk.
+     *     So if user want to load ramdisk, it must be the 2nd unknown.
+     * We also detect the XSM Magic for the following unknowns,
+     * then set its kind according to the return value of has_xsm_magic.
+     */
+    if ( kind == BOOTMOD_UNKNOWN )
+    {
+        switch ( kind_guess++ )
+        {
+        case 0: kind = BOOTMOD_KERNEL; break;
+        case 1: kind = BOOTMOD_RAMDISK; break;
+        default: break;
+        }
+        if ( kind_guess > 1 && has_xsm_magic(start) )
+            kind = BOOTMOD_XSM;
+    }
+
+    domU = fdt_node_check_compatible(fdt, parent_node, "xen,domain") == 0;
+    add_boot_module(kind, start, size, domU);
+
+    prop = fdt_get_property(fdt, node, "bootargs", &len);
+    if ( !prop )
+        return;
+    add_boot_cmdline(fdt_get_name(fdt, parent_node, &len), prop->data,
+                     kind, start, domU);
+}
+
+static int __init process_chosen_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+    paddr_t start, end;
+    int len;
+
+    if ( fdt_get_property(fdt, node, "xen,static-heap", NULL) )
+    {
+        int rc;
+
+        printk("Checking for static heap in /chosen\n");
+
+        rc = device_tree_get_meminfo(fdt, node, "xen,static-heap",
+                                     address_cells, size_cells,
+                                     bootinfo_get_reserved_mem(),
+                                     MEMBANK_STATIC_HEAP);
+        if ( rc )
+            return rc;
+
+        using_static_heap = true;
+    }
+
+    printk("Checking for initrd in /chosen\n");
+
+    prop = fdt_get_property(fdt, node, "linux,initrd-start", &len);
+    if ( !prop )
+        /* No initrd present. */
+        return 0;
+    if ( len != sizeof(u32) && len != sizeof(u64) )
+    {
+        printk("linux,initrd-start property has invalid length %d\n", len);
+        return -EINVAL;
+    }
+    start = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
+
+    prop = fdt_get_property(fdt, node, "linux,initrd-end", &len);
+    if ( !prop )
+    {
+        printk("linux,initrd-end not present but -start was\n");
+        return -EINVAL;
+    }
+    if ( len != sizeof(u32) && len != sizeof(u64) )
+    {
+        printk("linux,initrd-end property has invalid length %d\n", len);
+        return -EINVAL;
+    }
+    end = dt_read_paddr((const void *)&prop->data, dt_size_to_cells(len));
+
+    if ( start >= end )
+    {
+        printk("linux,initrd limits invalid: %"PRIpaddr" >= %"PRIpaddr"\n",
+                  start, end);
+        return -EINVAL;
+    }
+
+    printk("Initrd %"PRIpaddr"-%"PRIpaddr"\n", start, end - 1);
+
+    add_boot_module(BOOTMOD_RAMDISK, start, end-start, false);
+
+    return 0;
+}
+
+static int __init process_domain_node(const void *fdt, int node,
+                                      const char *name,
+                                      u32 address_cells, u32 size_cells)
+{
+    const struct fdt_property *prop;
+
+    printk("Checking for \"xen,static-mem\" in domain node\n");
+
+    prop = fdt_get_property(fdt, node, "xen,static-mem", NULL);
+    if ( !prop )
+        /* No "xen,static-mem" present. */
+        return 0;
+
+    return device_tree_get_meminfo(fdt, node, "xen,static-mem", address_cells,
+                                   size_cells, bootinfo_get_reserved_mem(),
+                                   MEMBANK_STATIC_DOMAIN);
+}
+
+#ifndef CONFIG_STATIC_SHM
+static inline int process_shm_node(const void *fdt, int node,
+                                   uint32_t address_cells, uint32_t size_cells)
+{
+    printk("CONFIG_STATIC_SHM must be enabled for parsing static shared"
+            " memory nodes\n");
+    return -EINVAL;
+}
+#endif
+
+static int __init early_scan_node(const void *fdt,
+                                  int node, const char *name, int depth,
+                                  u32 address_cells, u32 size_cells,
+                                  void *data)
+{
+    int rc = 0;
+
+    /*
+     * If Xen has been booted via UEFI, the memory banks are
+     * populated. So we should skip the parsing.
+     */
+    if ( !efi_enabled(EFI_BOOT) &&
+         device_tree_is_memory_node(fdt, node, depth) )
+        rc = process_memory_node(fdt, node, name, depth,
+                                 address_cells, size_cells, bootinfo_get_mem());
+    else if ( depth == 1 && !dt_node_cmp(name, "reserved-memory") )
+        rc = process_reserved_memory(fdt, node, name, depth,
+                                     address_cells, size_cells);
+    else if ( depth <= 3 && (device_tree_node_compatible(fdt, node, "xen,multiboot-module" ) ||
+              device_tree_node_compatible(fdt, node, "multiboot,module" )))
+        process_multiboot_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 1 && device_tree_node_matches(fdt, node, "chosen") )
+        rc = process_chosen_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth == 2 && device_tree_node_compatible(fdt, node, "xen,domain") )
+        rc = process_domain_node(fdt, node, name, address_cells, size_cells);
+    else if ( depth <= 3 && device_tree_node_compatible(fdt, node, "xen,domain-shared-memory-v1") )
+        rc = process_shm_node(fdt, node, address_cells, size_cells);
+
+    if ( rc < 0 )
+        printk("fdt: node `%s': parsing failed\n", name);
+    return rc;
+}
+
+static void __init early_print_info(void)
+{
+    const struct membanks *mi = bootinfo_get_mem();
+    const struct membanks *mem_resv = bootinfo_get_reserved_mem();
+    struct boot_modules *mods = &bootinfo.modules;
+    struct bootcmdlines *cmds = &bootinfo.cmdlines;
+    unsigned int i;
+
+    for ( i = 0; i < mi->nr_banks; i++ )
+        printk("RAM: %"PRIpaddr" - %"PRIpaddr"\n",
+                mi->bank[i].start,
+                mi->bank[i].start + mi->bank[i].size - 1);
+    printk("\n");
+    for ( i = 0 ; i < mods->nr_mods; i++ )
+        printk("MODULE[%d]: %"PRIpaddr" - %"PRIpaddr" %-12s\n",
+                i,
+                mods->module[i].start,
+                mods->module[i].start + mods->module[i].size - 1,
+                boot_module_kind_as_string(mods->module[i].kind));
+
+    for ( i = 0; i < mem_resv->nr_banks; i++ )
+    {
+        printk(" RESVD[%u]: %"PRIpaddr" - %"PRIpaddr"\n", i,
+               mem_resv->bank[i].start,
+               mem_resv->bank[i].start + mem_resv->bank[i].size - 1);
+    }
+#ifdef CONFIG_STATIC_SHM
+    early_print_info_shmem();
+#endif
+    printk("\n");
+    for ( i = 0 ; i < cmds->nr_mods; i++ )
+        printk("CMDLINE[%"PRIpaddr"]:%s %s\n", cmds->cmdline[i].start,
+               cmds->cmdline[i].dt_name,
+               &cmds->cmdline[i].cmdline[0]);
+    printk("\n");
+}
+
+/* This function assumes that memory regions are not overlapped */
+static int __init cmp_memory_node(const void *key, const void *elem)
+{
+    const struct membank *handler0 = key;
+    const struct membank *handler1 = elem;
+
+    if ( handler0->start < handler1->start )
+        return -1;
+
+    if ( handler0->start >= (handler1->start + handler1->size) )
+        return 1;
+
+    return 0;
+}
+
+static void __init swap_memory_node(void *_a, void *_b, size_t size)
+{
+    struct membank *a = _a, *b = _b;
+
+    SWAP(*a, *b);
+}
+
+/**
+ * boot_fdt_info - initialize bootinfo from a DTB
+ * @fdt: flattened device tree binary
+ *
+ * Returns the size of the DTB.
+ */
+size_t __init boot_fdt_info(const void *fdt, paddr_t paddr)
+{
+    struct membanks *reserved_mem = bootinfo_get_reserved_mem();
+    struct membanks *mem = bootinfo_get_mem();
+    unsigned int i;
+    int nr_rsvd;
+    int ret;
+
+    ret = fdt_check_header(fdt);
+    if ( ret < 0 )
+        panic("No valid device tree\n");
+
+    add_boot_module(BOOTMOD_FDT, paddr, fdt_totalsize(fdt), false);
+
+    nr_rsvd = fdt_num_mem_rsv(fdt);
+    if ( nr_rsvd < 0 )
+        panic("Parsing FDT memory reserve map failed (%d)\n", nr_rsvd);
+
+    for ( i = 0; i < nr_rsvd; i++ )
+    {
+        struct membank *bank;
+        paddr_t s, sz;
+
+        if ( fdt_get_mem_rsv_paddr(device_tree_flattened, i, &s, &sz) < 0 )
+            continue;
+
+        if ( reserved_mem->nr_banks < reserved_mem->max_banks )
+        {
+            bank = &reserved_mem->bank[reserved_mem->nr_banks];
+            bank->start = s;
+            bank->size = sz;
+            bank->type = MEMBANK_FDT_RESVMEM;
+            reserved_mem->nr_banks++;
+        }
+        else
+            panic("Cannot allocate reserved memory bank\n");
+    }
+
+    ret = device_tree_for_each_node(fdt, 0, early_scan_node, NULL);
+    if ( ret )
+        panic("Early FDT parsing failed (%d)\n", ret);
+
+    /*
+     * On Arm64 setup_directmap_mappings() expects to be called with the lowest
+     * bank in memory first. There is no requirement that the DT will provide
+     * the banks sorted in ascending order. So sort them through.
+     */
+    sort(mem->bank, mem->nr_banks, sizeof(struct membank),
+         cmp_memory_node, swap_memory_node);
+
+    early_print_info();
+
+    return fdt_totalsize(fdt);
+}
+
+const __init char *boot_fdt_cmdline(const void *fdt)
+{
+    int node;
+    const struct fdt_property *prop;
+
+    node = fdt_path_offset(fdt, "/chosen");
+    if ( node < 0 )
+        return NULL;
+
+    prop = fdt_get_property(fdt, node, "xen,xen-bootargs", NULL);
+    if ( prop == NULL )
+    {
+        struct bootcmdline *dom0_cmdline =
+            boot_cmdline_find_by_kind(BOOTMOD_KERNEL);
+
+        if (fdt_get_property(fdt, node, "xen,dom0-bootargs", NULL) ||
+            ( dom0_cmdline && dom0_cmdline->cmdline[0] ) )
+            prop = fdt_get_property(fdt, node, "bootargs", NULL);
+    }
+    if ( prop == NULL )
+        return NULL;
+
+    return prop->data;
+}
+
+/*
+ * Wrapper to convert physical address from paddr_t to uint64_t and
+ * invoke fdt_begin_node(). This is required as the physical address
+ * provided as part of node name should not contain any leading
+ * zeroes. Thus, one should use PRIx64 (instead of PRIpaddr) to append
+ * unit (which contains the physical address) with name to generate a
+ * node name.
+ */
+int __init domain_fdt_begin_node(void *fdt, const char *name, uint64_t unit)
+{
+    /*
+     * The size of the buffer to hold the longest possible string (i.e.
+     * interrupt-controller@ + a 64-bit number + \0).
+     */
+    char buf[38];
+    int ret;
+
+    /* ePAPR 3.4 */
+    ret = snprintf(buf, sizeof(buf), "%s@%"PRIx64, name, unit);
+
+    if ( ret >= sizeof(buf) )
+    {
+        printk(XENLOG_ERR
+               "Insufficient buffer. Minimum size required is %d\n",
+               (ret + 1));
+
+        return -FDT_ERR_TRUNCATED;
+    }
+
+    return fdt_begin_node(fdt, buf);
+}
+
+/*
+ * Local variables:
+ * mode: C
+ * c-file-style: "BSD"
+ * c-basic-offset: 4
+ * indent-tabs-mode: nil
+ * End:
+ */
-- 
2.43.0


