Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F4099C4487
	for <lists+xen-devel@lfdr.de>; Mon, 11 Nov 2024 19:07:51 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.834071.1249562 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYoR-0004m1-Lo; Mon, 11 Nov 2024 18:06:55 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 834071.1249562; Mon, 11 Nov 2024 18:06:55 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tAYoR-0004kJ-JG; Mon, 11 Nov 2024 18:06:55 +0000
Received: by outflank-mailman (input) for mailman id 834071;
 Mon, 11 Nov 2024 18:06:54 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=eHe6=SG=amd.com=ayan.kumar.halder@srs-se1.protection.inumbo.net>)
 id 1tAYoQ-0004kD-7I
 for xen-devel@lists.xenproject.org; Mon, 11 Nov 2024 18:06:54 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2061f.outbound.protection.outlook.com
 [2a01:111:f403:2417::61f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id b6e6d901-a057-11ef-99a3-01e77a169b0f;
 Mon, 11 Nov 2024 19:06:46 +0100 (CET)
Received: from BN1PR14CA0022.namprd14.prod.outlook.com (2603:10b6:408:e3::27)
 by SJ0PR12MB5663.namprd12.prod.outlook.com (2603:10b6:a03:42a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 18:06:42 +0000
Received: from BN1PEPF00004685.namprd03.prod.outlook.com
 (2603:10b6:408:e3:cafe::9f) by BN1PR14CA0022.outlook.office365.com
 (2603:10b6:408:e3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28 via Frontend
 Transport; Mon, 11 Nov 2024 18:06:42 +0000
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN1PEPF00004685.mail.protection.outlook.com (10.167.243.86) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8158.14 via Frontend Transport; Mon, 11 Nov 2024 18:06:41 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:06:41 -0600
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 11 Nov
 2024 12:06:41 -0600
Received: from xcbayankuma40.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via
 Frontend Transport; Mon, 11 Nov 2024 12:06:40 -0600
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
X-Inumbo-ID: b6e6d901-a057-11ef-99a3-01e77a169b0f
X-Custom-Connection: eyJyZW1vdGVpcCI6IjJhMDE6MTExOmY0MDM6MjQxNzo6NjFmIiwiaGVsbyI6Ik5BTTEyLURNNi1vYmUub3V0Ym91bmQucHJvdGVjdGlvbi5vdXRsb29rLmNvbSJ9
X-Custom-Transaction: eyJpZCI6ImI2ZTZkOTAxLWEwNTctMTFlZi05OWEzLTAxZTc3YTE2OWIwZiIsInRzIjoxNzMxMzQ4NDA2LjU2NTg0LCJzZW5kZXIiOiJheWFuLmt1bWFyLmhhbGRlckBhbWQuY29tIiwicmVjaXBpZW50IjoieGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnIn0=
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJZtfNNd1UdyKs1z9y8NawyD7rgVVnMK4vrS9HO24cJYsMKUr7B4aFkcugoWcXjVbk00ax9bBsPbfNwCDpwF9RTd4KWFxtuf6MWq7KnJ9U4XwOsr8wSE5vRWo7kFJIzHD08rfMCY/h/j2NdRmxgB47m1MVhm/ONLPt49jZCt350U30zdsORUH201GVD0UeOLhfsJdvXO3YBPNlqnaxduJyMdejwxivMnFXMQ+Dzunhqqv4NgoXlK1rHDDTozwHn4ekPgCnkxsgKoEpgf1K+UQk/xfea7ygMYkVnrTMAOfARcxKoj1mbiY0uXwao/A2qjS4P3DsTFnglUZTwXYjOYaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qw5Z636sXSB0JNWwb70Y7ZD3Tbbt5SfmO3r88nV8ySE=;
 b=fiNNSFruNIBVnAFwTTmTPoXHlqL0MqoJLFewsa66nKjNZiNWykPKHsPQutkxwoUGD3m3i68cMhp77wjmJ94j79sACWkXOkj9q0JSgpMZpO57DiMpnDYKU6W8xo0kp6ehhpoyDn+FijtgN/ZGYy9iDRq/k9tW4EQSZKWQTiFNPIjb6m7/36Ek4kNJcNSD+LQ8En8YjM4ihCytKpy6Y9QfljQZOHKgi1Vbl6poEJE+YErsc0FS/BP2djiZiPz4bliHZYexHi4hZU8AgHUIIgjiJDDsOBYTI1b5p7CznecMo5Yvb4LjbRmIEMi7jRtbub+/OAdjERdQOnbSp3nghCEc2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qw5Z636sXSB0JNWwb70Y7ZD3Tbbt5SfmO3r88nV8ySE=;
 b=rxhDh/sMb2zBk8v1o0VUG+39slznOF0ntTXNLM/sho2Bq7MeTIrlvdEqXlCO0t1d8F7CXL8234WAZ/eX5N0DDYgSrXWxvjyZYa9GjXGhBYXvuEpwA4hbF3y/V1YupvbcAwgie03RVmgnCB6jYRxk9rSczRe99H5JjFfsfQ30UGE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
From: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Ayan Kumar Halder <ayan.kumar.halder@amd.com>, Stefano Stabellini
	<sstabellini@kernel.org>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>, Michal Orzel <michal.orzel@amd.com>, "Volodymyr
 Babchuk" <Volodymyr_Babchuk@epam.com>
Subject: [PATCH] xen/arm: Enclose all iommu related access within CONFIG_HAS_PASSTHROUGH
Date: Mon, 11 Nov 2024 18:06:35 +0000
Message-ID: <20241111180635.1198552-1-ayan.kumar.halder@amd.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: None (SATLEXMB05.amd.com: ayan.kumar.halder@amd.com does not
 designate permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004685:EE_|SJ0PR12MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 3aa392ef-8467-43c6-25e3-08dd027b9889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?2BDWjN9I7A/SldcriSSxtQfMaKglFL7RumHGM0XnyYqn9IGMvJG34JcZIP1V?=
 =?us-ascii?Q?11o/DehZwV/qy2LVj9Vj5Io8E+JkM9xN5gozM/XwYSb9ZHR5JPEuY/PQjG84?=
 =?us-ascii?Q?PlBlnuCbIPWlKXmvC6vH4MUt4mWEJa4wHaDJcNUanUTzTu+AuzIj5azBsWIs?=
 =?us-ascii?Q?ptGTg3SEKMVbnFtU0qZX78BHwnOtN6NPo3vkBIgmnI89XKQxHp0sK3DhM4w4?=
 =?us-ascii?Q?AoLIaonF2gNEpRMTfo96KafjK+H9HoW/p/Kgo9oXMicMdqoPrnwc90GgQb6w?=
 =?us-ascii?Q?wUL8eJuEPQAdY9kuVGVADE0EZrEHdN5QY8iT61iOl+GYLu+xGQn7R9dt8HsG?=
 =?us-ascii?Q?jpAXJAFD3NWkI0CJMiUtLzpRvuCC2It6UO3Bt0bz1vopnLmC/ymqK1lxkmNI?=
 =?us-ascii?Q?z346+Ph58B0HovcWvb1lvpW3zTDZn9wNN5IIyZXxIhe7IoqiXPki3buIWpiQ?=
 =?us-ascii?Q?/6C9EF6ry9rbQ1Qg/uuvn6WlP/rxRNnvlmf5EdE5RD1RdtO40y0EW+Fs1qV9?=
 =?us-ascii?Q?Q6o5ca2U1WD3D/Q9hveX8kwlxNAw44JJDXlhgn2Mh/KDa3iPcA9ZZLzMM2QZ?=
 =?us-ascii?Q?6lROim4GsmCe8LvtKw0fgq9JxnwB5HZTjTojB64LvnKXU7aRi+yzpRDu0j2+?=
 =?us-ascii?Q?gBANV9B2vZhzMAnl9JhfL+IoIsjKXP1wUcyp1noMR5CPpsT5GV4rrSbA56qd?=
 =?us-ascii?Q?zILhSgXSsvICZUzvBCDVGc1Y4pvColuyG0yf+Id1k1mbvoqF6ptENRrfsnN/?=
 =?us-ascii?Q?I4FKeg23q5ZxNdk9sPXfLIGrqrU3kZXGkAVShA3WDte0f8McV2HwFhLDrdZE?=
 =?us-ascii?Q?TPMnxVhypZXklhYK8Zbbrtd/942cH5+aV4eXNNEGs1rswAItgTYSTh7y2iw2?=
 =?us-ascii?Q?m+OUNcNIDg2hCyHmKeXxw4xXzjCQrmrVlmOLF5blEb9FVEWaK6HJlMNaT2bq?=
 =?us-ascii?Q?LNTz8bk+49q7LaULnrieksnbaCGzwUrPzX1jkGXCLhZuB3i3l/SqRrqI2/Dx?=
 =?us-ascii?Q?SP65TGnb5zAgqVSjpMEl+5NchlRp2CxMowpk7Fe2w03kWj1Hld9bQUhxpGwK?=
 =?us-ascii?Q?MJCZKJQiLUQU0/vjkQdygg+RdQLeHH48ZOPcQ1wOKutoLLlcGSMqCxMSKcQy?=
 =?us-ascii?Q?06bBvNIBk4eajDaY4s5eVYoAPrszasXdiaB7E7QdEuZ1DBzMOnMS2xcTUFS/?=
 =?us-ascii?Q?8DC5R3Dg9Q0/K+XvczJecmSr0UP8xt9mJEOiXCGBX16jCIpzJlvI7cL7die/?=
 =?us-ascii?Q?cZ6NpnVIixZBtiQNHtNvRmV4ybaXNP/4G9fXGojNy4xCy3fKxkktEPAnjPxL?=
 =?us-ascii?Q?1fKcRqeLUqZD3GbS2P2J5vpdFwqq6NRFaafL6TA0Kt/mEIsMBY4vmc0of76X?=
 =?us-ascii?Q?igU33qCz+HXWAk5c2zSvZTjJCqbz0ejUVEYCAPrsBzR4YpKSpw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 18:06:41.9055
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3aa392ef-8467-43c6-25e3-08dd027b9889
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004685.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5663

As CONFIG_HAS_PASSTHROUGH is enabled only for MMU, thus any common code
accessing iommu needs to be enclosed within CONFIG_HAS_PASSTHROUGH.

Signed-off-by: Ayan Kumar Halder <ayan.kumar.halder@amd.com>
---
 xen/arch/arm/Kconfig          | 4 ++--
 xen/arch/arm/device.c         | 2 ++
 xen/arch/arm/dom0less-build.c | 6 ++++++
 xen/arch/arm/domain.c         | 6 ++++++
 xen/arch/arm/domain_build.c   | 2 ++
 xen/arch/arm/p2m.c            | 2 ++
 xen/arch/arm/setup.c          | 2 ++
 7 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/xen/arch/arm/Kconfig b/xen/arch/arm/Kconfig
index 701b2aa76b..4833f12d2a 100644
--- a/xen/arch/arm/Kconfig
+++ b/xen/arch/arm/Kconfig
@@ -14,9 +14,7 @@ config ARM
 	select FUNCTION_ALIGNMENT_4B
 	select HAS_ALTERNATIVE if HAS_VMAP
 	select HAS_DEVICE_TREE
-	select HAS_PASSTHROUGH
 	select HAS_UBSAN
-	select IOMMU_FORCE_PT_SHARE if MMU
 
 config ARCH_DEFCONFIG
 	string
@@ -77,8 +75,10 @@ choice
 config MMU
 	bool "MMU"
 	select HAS_PAGING_MEMPOOL
+	select HAS_PASSTHROUGH
 	select HAS_PMAP
 	select HAS_VMAP
+	select IOMMU_FORCE_PT_SHARE
 	help
 	  Select it if you plan to run Xen on A-profile Armv7+
 
diff --git a/xen/arch/arm/device.c b/xen/arch/arm/device.c
index 5610cddcba..9805bc7742 100644
--- a/xen/arch/arm/device.c
+++ b/xen/arch/arm/device.c
@@ -279,6 +279,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
     dt_dprintk("%s passthrough = %d naddr = %u\n",
                dt_node_full_name(dev), own_device, naddr);
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     if ( own_device )
     {
         dt_dprintk("Check if %s is behind the IOMMU and add it\n",
@@ -304,6 +305,7 @@ int handle_device(struct domain *d, struct dt_device_node *dev, p2m_type_t p2mt,
             }
         }
     }
+#endif
 
     res = map_device_irqs_to_domain(d, dev, own_device, irq_ranges);
     if ( res < 0 )
diff --git a/xen/arch/arm/dom0less-build.c b/xen/arch/arm/dom0less-build.c
index 9575769b25..ecf81f5748 100644
--- a/xen/arch/arm/dom0less-build.c
+++ b/xen/arch/arm/dom0less-build.c
@@ -368,15 +368,21 @@ static int __init handle_passthrough_prop(struct kernel_info *kinfo,
     if ( res < 0 )
         return res;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     res = iommu_add_dt_device(node);
     if ( res < 0 )
         return res;
+#endif
 
     /* If xen_force, we allow assignment of devices without IOMMU protection. */
     if ( xen_force && !dt_device_is_protected(node) )
         return 0;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     return iommu_assign_dt_device(kinfo->d, node);
+#else
+    return res;
+#endif
 }
 
 static int __init handle_prop_pfdt(struct kernel_info *kinfo,
diff --git a/xen/arch/arm/domain.c b/xen/arch/arm/domain.c
index 3ba959f866..2da8eaed01 100644
--- a/xen/arch/arm/domain.c
+++ b/xen/arch/arm/domain.c
@@ -710,9 +710,11 @@ int arch_domain_create(struct domain *d,
     ioreq_domain_init(d);
 #endif
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     /* p2m_init relies on some value initialized by the IOMMU subsystem */
     if ( (rc = iommu_domain_init(d, config->iommu_opts)) != 0 )
         goto fail;
+#endif
 
     if ( (rc = p2m_init(d)) != 0 )
         goto fail;
@@ -841,7 +843,9 @@ void arch_domain_destroy(struct domain *d)
     /* IOMMU page table is shared with P2M, always call
      * iommu_domain_destroy() before p2m_final_teardown().
      */
+#ifdef CONFIG_HAS_PASSTHROUGH
     iommu_domain_destroy(d);
+#endif
     p2m_final_teardown(d);
     domain_vgic_free(d);
     domain_vuart_free(d);
@@ -1059,9 +1063,11 @@ int domain_relinquish_resources(struct domain *d)
     switch ( d->arch.rel_priv )
     {
     case 0:
+#ifdef CONFIG_HAS_PASSTHROUGH
         ret = iommu_release_dt_devices(d);
         if ( ret )
             return ret;
+#endif
 
         /*
          * Release the resources allocated for vpl011 which were
diff --git a/xen/arch/arm/domain_build.c b/xen/arch/arm/domain_build.c
index 2c30792de8..2b41a3c926 100644
--- a/xen/arch/arm/domain_build.c
+++ b/xen/arch/arm/domain_build.c
@@ -2137,7 +2137,9 @@ static int __init construct_dom0(struct domain *d)
         dom0_mem = MB(512);
     }
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     iommu_hwdom_init(d);
+#endif
 
     d->max_pages = dom0_mem >> PAGE_SHIFT;
 
diff --git a/xen/arch/arm/p2m.c b/xen/arch/arm/p2m.c
index 65b70955e3..343d5b857c 100644
--- a/xen/arch/arm/p2m.c
+++ b/xen/arch/arm/p2m.c
@@ -434,6 +434,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
     /* This function can only work with the current vCPU. */
     ASSERT(v == current);
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     if ( iommu_use_hap_pt(current->domain) )
     {
         gprintk(XENLOG_ERR,
@@ -441,6 +442,7 @@ void p2m_set_way_flush(struct vcpu *v, struct cpu_user_regs *regs,
         inject_undef_exception(regs, hsr);
         return;
     }
+#endif
 
     if ( !(v->arch.hcr_el2 & HCR_TVM) )
     {
diff --git a/xen/arch/arm/setup.c b/xen/arch/arm/setup.c
index 4b52fc314a..bdc0d810ee 100644
--- a/xen/arch/arm/setup.c
+++ b/xen/arch/arm/setup.c
@@ -419,6 +419,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     /* This should be done in a vpmu driver but we do not have one yet. */
     vpmu_is_available = cpu_has_pmu;
 
+#ifdef CONFIG_HAS_PASSTHROUGH
     /*
      * The IOMMU subsystem must be initialized before P2M as we need
      * to gather requirements regarding the maximum IPA bits supported by
@@ -427,6 +428,7 @@ void asmlinkage __init start_xen(unsigned long fdt_paddr)
     rc = iommu_setup();
     if ( !iommu_enabled && rc != -ENODEV )
         panic("Couldn't configure correctly all the IOMMUs.\n");
+#endif
 
     setup_virt_paging();
 
-- 
2.25.1


