Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 93B07C52FB9
	for <lists+xen-devel@lfdr.de>; Wed, 12 Nov 2025 16:23:27 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.1160027.1488283 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCgc-0004nq-7V; Wed, 12 Nov 2025 15:23:06 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1160027.1488283; Wed, 12 Nov 2025 15:23:06 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1vJCgc-0004lE-3w; Wed, 12 Nov 2025 15:23:06 +0000
Received: by outflank-mailman (input) for mailman id 1160027;
 Wed, 12 Nov 2025 15:23:05 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=Vb/2=5U=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1vJCgb-0004kl-6M
 for xen-devel@lists.xenproject.org; Wed, 12 Nov 2025 15:23:05 +0000
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazlp170100001.outbound.protection.outlook.com
 [2a01:111:f403:c105::1])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 7ae86ff6-bfdb-11f0-9d18-b5c5bf9af7f9;
 Wed, 12 Nov 2025 16:23:03 +0100 (CET)
Received: from SJ0PR03CA0365.namprd03.prod.outlook.com (2603:10b6:a03:3a1::10)
 by DS4PR12MB9683.namprd12.prod.outlook.com (2603:10b6:8:280::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Wed, 12 Nov
 2025 15:22:59 +0000
Received: from SJ1PEPF000026C4.namprd04.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::8b) by SJ0PR03CA0365.outlook.office365.com
 (2603:10b6:a03:3a1::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9298.16 via Frontend Transport; Wed,
 12 Nov 2025 15:22:57 +0000
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000026C4.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Wed, 12 Nov 2025 15:22:56 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 12 Nov
 2025 07:22:53 -0800
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
X-Inumbo-ID: 7ae86ff6-bfdb-11f0-9d18-b5c5bf9af7f9
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mDWf6E5ssYzP5urjrqp/F4+TSWg+UL4rvEk+RsbGzcpwCMf5AF3BonkDYVArwe3UU6J+PohbsEfORF+ALNeXzRYR3mC8SfeuuNY83MZKNjImLi5ugNYs7Ba1gwHzfQeCXSVppzPoqu1Ya7Tl8FfTaWO/bXwD6vwda/6/2za/oGdAM1DOcenAEhT1ivbY9vI4AFPqVK34JTl4u58wnmd2X9LI0OzZDuCXGqoU3TgD15KTbHSRCNlPQ2vDqPLA2KAfWwwBvzBpz+suri85NKnqyysaMQwI19T+PbO9BVBoj/E9FqkZYPXijoFhWLZRbhKbiQ21VICvXOsccEEHI7188w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aAc/ZghjNNJf/U8+nHmCJOTDYsRUBccDQGmMHB8S8v4=;
 b=OV6sX4fdmNHZO6GQE4v72BtCskiELP5kqmIHwlBzbdSgRtpTFSC17t9SiX5rWwxGV82iOS+RTPIemmQA+v9chsBNVjvPZ/snO+2YM054grGJJDgfKLtRESoO7JzuKVNRK8Xv+uF56/gOHKhMwRajIfI1bLaB9rmvBCGUNBJXo5Y8IijJjbVB4b5ZrLUCoWi4f4ukgcS3CdP0r3HFaoATzgOMQJ/dOOVqCAZcHxhdKcLvlJ2faPuOE3AiX3ZHzSL6KNqJZmarEZmA67K9lzHY37hG0ErColGE/ONQTWWoje+FM6xH2/8s1P5YFPWW7yM+laq+WyQ1xYBjWAYLbHXL4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aAc/ZghjNNJf/U8+nHmCJOTDYsRUBccDQGmMHB8S8v4=;
 b=laDFqQgLO22S3vNVIdsPZQPl5DYkUmT3ftOWgWjV1JVohXns4VvNpI5hY3y1WFcDWBdKUyyCrBisRWnXjCLJhE27GwLwwTQPUNLp+GvwfQiy8Dq688ocOIsFrP/cyaDBZrFEUQw3yuvDT9DfZNuPx7dzaeNlp55+FvZLVHcZCGM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
Subject: [PATCH 2/2] x86: Remove stubs from asm/pv/domain.h
Date: Wed, 12 Nov 2025 16:22:31 +0100
Message-ID: <20251112152235.224001-3-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
References: <20251112152235.224001-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C4:EE_|DS4PR12MB9683:EE_
X-MS-Office365-Filtering-Correlation-Id: 82ac522a-79f0-4572-4a85-08de21ff5ba0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yDE2wzW0qYCnzFwtlaprpF8oQIFZxhQoOlolvtKLRKGUkJjInDYfqTJ1C/OM?=
 =?us-ascii?Q?r0yMctYYidC/8jw+XGkvaE5MIe2No49Ba3ZqbK/qjb0K+iQPLSMb8kwDf43N?=
 =?us-ascii?Q?06x+MRhptf7FW8+FtNvHS1w/UI/SVxXS1Edu9SWPeDcHiSeqG73AFPOB+JzB?=
 =?us-ascii?Q?raWo2lveXPdy/rRgHgrv7r2K/dYtmgK+YCzLNK8EiTAlfdES/uD1wii3Vhd2?=
 =?us-ascii?Q?HnKhlqJiRKNS/HGLhLnIFJUr+6d4QeetLBw173F7oVLkG2fWHd273wZlJnSh?=
 =?us-ascii?Q?SnqpI6loP0zP9DJVtXYv1xj8uTdTWe/VeD6kwIcPNjnO0vYf4HA/Dn/MU+uR?=
 =?us-ascii?Q?CPhdYzIaUnsVnqI2tNGWvvXdlccIj97kglQQ0HswFoG6DuTNo3FF6AwSlZs6?=
 =?us-ascii?Q?/mnmWWkupNG1N33da2Qko8faNaTpukvDHqaRMJS+GhXg5e3bki+mdR/NWP7L?=
 =?us-ascii?Q?qzxl6ugIqH+CoRUBG50vO+6/Itd8pdQRFwdh5B2BqeDkauJzReGWer8gMW7l?=
 =?us-ascii?Q?61EgNOzRziRo2sIORxaUPFp+FMWMYgJuh2hBy4nwNNCGhHpnY5OtDK5gOhGJ?=
 =?us-ascii?Q?/roiqdQThax9gGN6hZVvma4qVHKh3W/LiJnh2LhqU4wu3K0cjC69UL4Jdfkx?=
 =?us-ascii?Q?X98RBXMMlLSrRDpjyvXsJQgBa/7tGa9FNghOvtJlXDxc6puI4gtnRIMUONNE?=
 =?us-ascii?Q?1dN2YBrr/30/57zFcIrwW7KRXP5kvXTEWkYBxeCRtIJ8VL3nCB/dc/cz4tOp?=
 =?us-ascii?Q?5Cyk38jU9WCgJQ8UfiofEkz2OUDw+ktwyuiqoTT0yY540OG601cfTJ1qxyBJ?=
 =?us-ascii?Q?OlXsgpQ/KFL9FXdYLGRLkXEsojUEhXyDVR8B5WV0LeOZu7pC7Va2sOI9bqdk?=
 =?us-ascii?Q?eNvTyajpgFVV0CVURMKjejpUolzLAqQLncyx1mLB9BF4wSOCc9Vil6eKnQNL?=
 =?us-ascii?Q?LPu9t8kXAmxZ5r73ILLlldHc5dcbI3jNDODAWpyEWIGoVKB9zmfUowIpBhI/?=
 =?us-ascii?Q?94Z/5Lj6pD7dQK6Od3qqB1/FUEy89F1zrzBvTuYfA2Eh+TkQvE0CFwllxm18?=
 =?us-ascii?Q?viTmH7SaDYiErtEA3xAQg9XcUhB6/qmUQaH/r/3yE4SktVNJ1T8Y6S74xXDz?=
 =?us-ascii?Q?xpWaY925Ykyg4+3wWz6JbXBUojFZJnx8P0FS2jAeZy2NzEQPOxrdBAShClDw?=
 =?us-ascii?Q?oQppmVJp3CUzv7B7boNZsAaiAGrnPEU+ziKJSw1SnzeUntTKImnZCusIV91R?=
 =?us-ascii?Q?JBwfoq39TsrX6rH0WzSSHKyQzhwFYUpM73j0PCxKNMUn1PRZ+cyW3aJvEEMh?=
 =?us-ascii?Q?tc13WGYRkkKFVUbi1mdQ/l3HljpbvzYn0ykX3xL7KZFgio2S8bP7EaKSgRhl?=
 =?us-ascii?Q?U/WiIdblA32zJ4lD+KeLu8QjzJvh8HkTmqk+V/2mIexA+LbRmJwWySXB1Ip9?=
 =?us-ascii?Q?wiRlIJnKAEtbqIKorIp+pwclMuTMhvBrja0LcKWo1W9PIzxvDqoPgfOpcOPV?=
 =?us-ascii?Q?Y0e8wQZTqufA7TEERPgA5pOfzqH009rHL65JJaH0iX+fGHRaV4NyEhbZdZ9O?=
 =?us-ascii?Q?1x42f+rQiVSPdp/I25k=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 15:22:56.9465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 82ac522a-79f0-4572-4a85-08de21ff5ba0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C4.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PR12MB9683

They are unnecessary. The only two cases with link-time failures are
fallback else branches that can just as well be adjusted with explicit
IS_ENABLED(CONFIG_PV). HVM has no equivalent stubs and there's no reason
to keep the asymmetry.

No functional change.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
---
I'd rather remove the "rc = -EOPNOTSUPP" branch altogether, or replace
it with ASSERT_UNREACHABLE(), but I kept it here to preserve prior behaviour.

Thoughts?

---
 xen/arch/x86/domain.c                | 10 ++++++----
 xen/arch/x86/include/asm/pv/domain.h | 25 -------------------------
 2 files changed, 6 insertions(+), 29 deletions(-)

diff --git a/xen/arch/x86/domain.c b/xen/arch/x86/domain.c
index 19fd86ce88..0977d9323d 100644
--- a/xen/arch/x86/domain.c
+++ b/xen/arch/x86/domain.c
@@ -571,15 +571,17 @@ int arch_vcpu_create(struct vcpu *v)
 
     if ( is_hvm_domain(d) )
         rc = hvm_vcpu_initialise(v);
-    else if ( !is_idle_domain(d) )
-        rc = pv_vcpu_initialise(v);
-    else
+    else if ( is_idle_domain(d) )
     {
         /* Idle domain */
         v->arch.cr3 = __pa(idle_pg_table);
         rc = 0;
         v->arch.msrs = ZERO_BLOCK_PTR; /* Catch stray misuses */
     }
+    else if ( IS_ENABLED(CONFIG_PV) )
+        rc = pv_vcpu_initialise(v);
+    else
+        rc = -EOPNOTSUPP;
 
     if ( rc )
         goto fail;
@@ -614,7 +616,7 @@ void arch_vcpu_destroy(struct vcpu *v)
 
     if ( is_hvm_vcpu(v) )
         hvm_vcpu_destroy(v);
-    else
+    else if ( IS_ENABLED(CONFIG_PV) )
         pv_vcpu_destroy(v);
 }
 
diff --git a/xen/arch/x86/include/asm/pv/domain.h b/xen/arch/x86/include/asm/pv/domain.h
index 75a6b9e5c7..582d004051 100644
--- a/xen/arch/x86/include/asm/pv/domain.h
+++ b/xen/arch/x86/include/asm/pv/domain.h
@@ -54,8 +54,6 @@ static inline unsigned long get_pcid_bits(const struct vcpu *v, bool is_xpti)
 #endif
 }
 
-#ifdef CONFIG_PV
-
 void pv_vcpu_destroy(struct vcpu *v);
 int pv_vcpu_initialise(struct vcpu *v);
 void pv_domain_destroy(struct domain *d);
@@ -84,29 +82,6 @@ void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val);
 
 bool xpti_pcid_enabled(void);
 
-#else  /* !CONFIG_PV */
-
-#include <xen/errno.h>
-
-static inline void pv_vcpu_destroy(struct vcpu *v) {}
-static inline int pv_vcpu_initialise(struct vcpu *v) { return -EOPNOTSUPP; }
-static inline void pv_domain_destroy(struct domain *d) {}
-static inline int pv_domain_initialise(struct domain *d) { return -EOPNOTSUPP; }
-
-static inline unsigned long pv_make_cr4(const struct vcpu *v) { return ~0UL; }
-
-static inline uint64_t pv_get_reg(struct vcpu *v, unsigned int reg)
-{
-    ASSERT_UNREACHABLE();
-    return 0;
-}
-static inline void pv_set_reg(struct vcpu *v, unsigned int reg, uint64_t val)
-{
-    ASSERT_UNREACHABLE();
-}
-
-#endif	/* CONFIG_PV */
-
 void cf_check paravirt_ctxt_switch_from(struct vcpu *v);
 void cf_check paravirt_ctxt_switch_to(struct vcpu *v);
 
-- 
2.43.0


