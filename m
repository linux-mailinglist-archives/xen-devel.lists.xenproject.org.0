Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE48A5D4FF
	for <lists+xen-devel@lfdr.de>; Wed, 12 Mar 2025 05:10:48 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.909738.1316683 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQT-000519-Ln; Wed, 12 Mar 2025 04:10:37 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 909738.1316683; Wed, 12 Mar 2025 04:10:37 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tsDQT-0004uK-FO; Wed, 12 Mar 2025 04:10:37 +0000
Received: by outflank-mailman (input) for mailman id 909738;
 Wed, 12 Mar 2025 04:10:35 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=cozV=V7=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tsDNi-0006o2-VO
 for xen-devel@lists.xenproject.org; Wed, 12 Mar 2025 04:07:46 +0000
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2061c.outbound.protection.outlook.com
 [2a01:111:f403:2415::61c])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 8d423667-fef7-11ef-9898-31a8f345e629;
 Wed, 12 Mar 2025 05:07:45 +0100 (CET)
Received: from BN9PR03CA0516.namprd03.prod.outlook.com (2603:10b6:408:131::11)
 by DM4PR12MB6157.namprd12.prod.outlook.com (2603:10b6:8:ac::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.27; Wed, 12 Mar
 2025 04:07:41 +0000
Received: from BN1PEPF00005FFF.namprd05.prod.outlook.com
 (2603:10b6:408:131:cafe::bb) by BN9PR03CA0516.outlook.office365.com
 (2603:10b6:408:131::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.21 via Frontend Transport; Wed,
 12 Mar 2025 04:07:40 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFF.mail.protection.outlook.com (10.167.243.231) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Wed, 12 Mar 2025 04:07:40 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 11 Mar 2025 23:07:35 -0500
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
X-Inumbo-ID: 8d423667-fef7-11ef-9898-31a8f345e629
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8OuYIsazYfIEe+j3NINNJ8Idkml1iFXEH6Q6HwXu8FG2OW4czgLIuDbVtio1p+3KSipa/OGG4BRO0kvB01EKAk/jb5Qe+/rswQn7l+1N4hBoPIIEsJZ/fQKQYUVM5moUk/tqq8m6JQaE24vlpKP9Of2SJhGf8x/OuvXsmhXShwNbRoHQTgOBDmObandCvx4oeT2hiqrWLUwlmIMOTyOcsahH6sWWPILpU6sdhxgAvPVxkXMnyyyDSbWscjdLKBBWd1GRXaRMxWdhN7/I9IZheznKr08h1vzmY8Lj/bcl6OmsX8tJLyk4iufzw+GWcfLWzUm8yjvlUa8LjtBv2wAaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ozeJEycapjvZKrcQkyhn4SVuw83QMUCRxt1yd+qjAcc=;
 b=jQvskxi4E5yKmJloexAYz4xmtmve7QSTzfjeTaQc9ceAD6QLpAhPhpa2kSSyhxXRVb3stOjwXIYKftraCe4jez5fJfBIkCOdkMzIKgbV09/otNY2GHI2P5hgAcSI7v2KqR5sVIa+sUJWQt8Ett2dfyqjvluuUadWGIu+VI5MzOHRoLywQ2Uy8Q5yLCSvu58v6/SnUoDARHco8tnnpblCHQI/aToQ1CGH0FxrcPR17KexyMKqxC1YA00hJRkb/QokcxPEks1pnWNvtWrqF/7jBLhdWpLKMCdcQgPtoqjoTsRoSeLpeDAArpdJ+P4yagCC7Z2L9hBchB2Ckq/uwy6O4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ozeJEycapjvZKrcQkyhn4SVuw83QMUCRxt1yd+qjAcc=;
 b=4hTZKX6l6Cwt0OU0rWIZ8Mt9HP6yd1ajs/7QudHyudY174Q2leuv6Q8c0TyCJjabC1TnAvIdPn/gduJe8JVfXb3ZTzWBEzD0gP3Pcz+OxUWboRQX478ZxtIJ7BGosAYHTRuHLVkAqSjJxPUgfaq85rZ4mloCyC+fToBFpM6jTx8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Alistair Francis <alistair.francis@wdc.com>, "Bob
 Eshleman" <bobbyeshleman@gmail.com>, Connor Davis <connojdavis@gmail.com>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [PATCH v1 15/19] xen/sysctl: wrap around XEN_SYSCTL_physinfo
Date: Wed, 12 Mar 2025 12:06:28 +0800
Message-ID: <20250312040632.2853485-16-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312040632.2853485-1-Penny.Zheng@amd.com>
References: <20250312040632.2853485-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFF:EE_|DM4PR12MB6157:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b7a6ead-dccb-4093-4f57-08dd611b6e93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+qEiyGRss8IVV/5ghOO3jRKQmK20TFyfVZDedb2U8Ox1Q00eRwWlhMEoX3Q5?=
 =?us-ascii?Q?/4gKUOh2osCbMFw9iW8fuASYG6PkLb05NB6exPgtrna8kMiGdCPEBFHHyKXn?=
 =?us-ascii?Q?ILMevTmo5XEgf0QbdFB0EySpNVTagtCasS00c10M1UvjlwXt9hZJZKV+Hn6W?=
 =?us-ascii?Q?I/xAjCUcQjnzV5csYrtWSgD1FwNKtduuytT0y+kZwTkHHrWTnTgSKwVJRUAr?=
 =?us-ascii?Q?L0SO+14P0twzx8iIYgS0DfxMtVld5DMAmJLCMkLz1xLGTzdp0c/6sUhTLRr7?=
 =?us-ascii?Q?Z8CZ8WD2gc7LxdhBVEwpDPjNXR3C5U8a0SDTQMsS5Z4HAUGCZvVjCvgNgBCH?=
 =?us-ascii?Q?na8M2WWKyZtqKyAtNq/j4QSdcWZrum0bjwR85gHp3GdDuP+SXIjt+DqqKSyR?=
 =?us-ascii?Q?zco8nBDgp7dqCTzkU8mNNWvcn98GCqCeBSfg0nNIgty4gqcTELVF7oaeS2H8?=
 =?us-ascii?Q?dkO8YqZ59nP+7R669pSbS8/awJaY19xIc8gKwsb6DTBgo3hIM7Je+D6iiIHq?=
 =?us-ascii?Q?DDTBmd3cqfT399PpIkANBTWHy3Eqmb5jyCZs99Y3MCR550otcwy5XrbhMiJs?=
 =?us-ascii?Q?WV3xQMN2iEeyH69hQX+0+bsa1Iq4boKkIrM02TkLohaR3OKiUGpg+Twz/XwB?=
 =?us-ascii?Q?NqJ2c1B3Kw26TAaqzRWQQFv8N6LL7zXn2kbJLzpsDKCOekkS78jF2DaSjMaA?=
 =?us-ascii?Q?3pVX6mTbTqluw823oWsDqwwM1r9kWopN0gjyAu7DRaMmc1WxJCGUXMc9XtoI?=
 =?us-ascii?Q?ddA4g+58Y5Dr1NxaQehzXKwj9a+bcHKasEKqTPggP2884oJA1WSpL5NWaB2C?=
 =?us-ascii?Q?UoVdn/oaJfu+Mbghstm3diTLa0SzwsDZdiWI/JWwLaUcAUYx+aoyEnl15Bvj?=
 =?us-ascii?Q?DVCoLAF1Shvcjl92d/AxLxe2AuO/H/o/rIjlabNxa90IBGAcNGuNCqIbWiuj?=
 =?us-ascii?Q?dRgM2puJ5cR20+p0h/kvtpF5R/P0fFWb5aYJbaKKrjWQJYYK4/5CesN/ktN3?=
 =?us-ascii?Q?FpUCKDV6ZOQ3VSLFhbxAnncreoKwFXw5AhbZi6xXECSNsbComFKPAS5d1PjL?=
 =?us-ascii?Q?84w4ljxuJAbCmWI1+/LiUXRXPl6cuDC0Bc05YXJdxTFOVV8B52X6br2v61BT?=
 =?us-ascii?Q?Ey4uCpd/rkLva/vuWzLZGLGoW1aETeXEyr6DadHBBuAYvexSBNSSAl5au8fv?=
 =?us-ascii?Q?KgG0o+VYnoGNbG3HrztL17FII90BV2J8D+oSIcHk/mVIeoE0PVM/cuRgF6D2?=
 =?us-ascii?Q?M4c892esi7lLQVg8dEB6hVSjH1n5odpA+ryb67vd65c1A/8GNK0/uW9v8wA3?=
 =?us-ascii?Q?GheQ7t0S+W8h2MBZDPLovor52kgTFdaOLsApPbGRcQNbFt+yzre+8mbpewEQ?=
 =?us-ascii?Q?9K7PUWLk3teE+Xlnx9nYu+P9oCZ1oVcEPax5xlgrQDpprNPj0BiFmE3e7L3f?=
 =?us-ascii?Q?g0DSo+7yLP8zzDCWXiXoEBEk9GsY3dChHuXYkuyH/FJTIRiq/9Oihakw/FnA?=
 =?us-ascii?Q?nUDZL7WjgqeXXgI=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 04:07:40.3012
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b7a6ead-dccb-4093-4f57-08dd611b6e93
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6157

The following functions are only used to deal with XEN_SYSCTL_physinfo,
then they shall be wrapped:
- arch_do_physinfo
- get_outstanding_claims

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/arch/arm/sysctl.c   | 2 ++
 xen/arch/riscv/stubs.c  | 2 ++
 xen/arch/x86/sysctl.c   | 2 ++
 xen/common/page_alloc.c | 5 +++++
 xen/include/xen/mm.h    | 5 +++++
 xen/include/xen/sched.h | 4 ++++
 6 files changed, 20 insertions(+)

diff --git a/xen/arch/arm/sysctl.c b/xen/arch/arm/sysctl.c
index 32cab4feff..2d350b700a 100644
--- a/xen/arch/arm/sysctl.c
+++ b/xen/arch/arm/sysctl.c
@@ -15,6 +15,7 @@
 #include <asm/arm64/sve.h>
 #include <public/sysctl.h>
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     pi->capabilities |= XEN_SYSCTL_PHYSCAP_hvm | XEN_SYSCTL_PHYSCAP_hap;
@@ -22,6 +23,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     pi->arch_capabilities |= MASK_INSR(sve_encode_vl(get_sys_vl_len()),
                                        XEN_SYSCTL_PHYSCAP_ARM_SVE_MASK);
 }
+#endif
 
 long arch_do_sysctl(struct xen_sysctl *sysctl,
                     XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/arch/riscv/stubs.c b/xen/arch/riscv/stubs.c
index 5951b0ce91..0321ad57f0 100644
--- a/xen/arch/riscv/stubs.c
+++ b/xen/arch/riscv/stubs.c
@@ -328,10 +328,12 @@ long arch_do_sysctl(struct xen_sysctl *sysctl,
     BUG_ON("unimplemented");
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     BUG_ON("unimplemented");
 }
+#endif
 
 /* p2m.c */
 
diff --git a/xen/arch/x86/sysctl.c b/xen/arch/x86/sysctl.c
index 1b04947516..d7da476379 100644
--- a/xen/arch/x86/sysctl.c
+++ b/xen/arch/x86/sysctl.c
@@ -91,6 +91,7 @@ static long cf_check smt_up_down_helper(void *data)
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
 {
     memcpy(pi->hw_cap, boot_cpu_data.x86_capability,
@@ -104,6 +105,7 @@ void arch_do_physinfo(struct xen_sysctl_physinfo *pi)
     if ( IS_ENABLED(CONFIG_SHADOW_PAGING) )
         pi->capabilities |= XEN_SYSCTL_PHYSCAP_shadow;
 }
+#endif
 
 long arch_do_sysctl(
     struct xen_sysctl *sysctl, XEN_GUEST_HANDLE_PARAM(xen_sysctl_t) u_sysctl)
diff --git a/xen/common/page_alloc.c b/xen/common/page_alloc.c
index 5e710cc9a1..d1c4db57a5 100644
--- a/xen/common/page_alloc.c
+++ b/xen/common/page_alloc.c
@@ -581,6 +581,8 @@ out:
     return ret;
 }
 
+#ifdef CONFIG_SYSCTL
+static unsigned long avail_domheap_pages(void);
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
 {
     spin_lock(&heap_lock);
@@ -588,6 +590,7 @@ void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages)
     *free_pages =  avail_domheap_pages();
     spin_unlock(&heap_lock);
 }
+#endif
 
 static bool __read_mostly first_node_initialised;
 #ifndef CONFIG_SEPARATE_XENHEAP
@@ -2796,12 +2799,14 @@ unsigned long avail_domheap_pages_region(
     return avail_heap_pages(zone_lo, zone_hi, node);
 }
 
+#ifdef CONFIG_SYSCTL
 static unsigned long avail_domheap_pages(void)
 {
     return avail_heap_pages(MEMZONE_XEN + 1,
                             NR_ZONES - 1,
                             -1);
 }
+#endif
 
 unsigned long avail_node_heap_pages(unsigned int nodeid)
 {
diff --git a/xen/include/xen/mm.h b/xen/include/xen/mm.h
index cbb9f2dfdb..a63e063a46 100644
--- a/xen/include/xen/mm.h
+++ b/xen/include/xen/mm.h
@@ -131,7 +131,12 @@ int populate_pt_range(unsigned long virt, unsigned long nr_mfns);
 unsigned long __must_check domain_adjust_tot_pages(struct domain *d,
     long pages);
 int domain_set_outstanding_pages(struct domain *d, unsigned long pages);
+#ifdef CONFIG_SYSCTL
 void get_outstanding_claims(uint64_t *free_pages, uint64_t *outstanding_pages);
+#else
+static inline void get_outstanding_claims(uint64_t *free_pages,
+                                          uint64_t *outstanding_pages) {}
+#endif /* CONFIG_SYSCTL */
 
 /* Domain suballocator. These functions are *not* interrupt-safe.*/
 void init_domheap_pages(paddr_t ps, paddr_t pe);
diff --git a/xen/include/xen/sched.h b/xen/include/xen/sched.h
index 5a065b3624..df39c0465a 100644
--- a/xen/include/xen/sched.h
+++ b/xen/include/xen/sched.h
@@ -1291,7 +1291,11 @@ struct cpupool *cpupool_create_pool(unsigned int pool_id, int sched_id);
 
 extern void cf_check dump_runq(unsigned char key);
 
+#ifdef CONFIG_SYSCTL
 void arch_do_physinfo(struct xen_sysctl_physinfo *pi);
+#else
+static inline void arch_do_physinfo(struct xen_sysctl_physinfo *pi) {};
+#endif /* CONFIG_SYSCTL */
 
 #ifdef CONFIG_BOOT_TIME_CPUPOOLS
 void btcpupools_allocate_pools(void);
-- 
2.34.1


