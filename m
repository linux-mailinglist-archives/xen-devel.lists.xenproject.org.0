Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCCB0D8C6
	for <lists+xen-devel@lfdr.de>; Tue, 22 Jul 2025 14:00:51 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1052399.1421136 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfl-0006NM-Ro; Tue, 22 Jul 2025 12:00:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1052399.1421136; Tue, 22 Jul 2025 12:00:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ueBfl-0006I9-Kv; Tue, 22 Jul 2025 12:00:41 +0000
Received: by outflank-mailman (input) for mailman id 1052399;
 Tue, 22 Jul 2025 12:00:40 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=sKN0=2D=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1ueBfj-0003BS-Qv
 for xen-devel@lists.xenproject.org; Tue, 22 Jul 2025 12:00:39 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 791095b3-66f3-11f0-b894-0df219b8e170;
 Tue, 22 Jul 2025 14:00:35 +0200 (CEST)
Received: from SJ0PR03CA0221.namprd03.prod.outlook.com (2603:10b6:a03:39f::16)
 by CH8PR12MB9816.namprd12.prod.outlook.com (2603:10b6:610:262::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 12:00:32 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::61) by SJ0PR03CA0221.outlook.office365.com
 (2603:10b6:a03:39f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 12:00:32 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 12:00:31 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 07:00:28 -0500
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
X-Inumbo-ID: 791095b3-66f3-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jayVvbwDBZ33+//EvEXft8co3UBw9Z+WBEMBT79jJn5yqLJSwcLNS1zgXmd3rnkMcUWf9N4kgYAlnnF+1l7B9n8XgIYxjYGzupvE343ERenR21pdptoyo2kmpPdFqJbr6s4rc3tBuFTOz0NnJ+RNOgzt9TZN19OY8r3gMtA5bHI/V0DyDN2IyoZzgjkz8TNKztyP5pgIAy6NT8BIpRDzYsxqk2C8qxtkf0Kd4553+NtXoIhv+wDQ4FCingThsxqPb5AR55vV5+eQ8zUgh48892cKwIWTSnxx+uNBs3fpg/D5fSRX7hVxJbMKTNW8++4TCbnwD2I92S4m7OSmuq0sZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=meYE8nSJW/ySHGWWMoOsgEqrWGpdRxhMBzju4iKCy/I=;
 b=Vdxzifkr92zpBI5RT6LUG47I8n3QDa8HK9mOCha8MKkdIzPKIXxezAdERW+tRG8CXnoikbA6XSI36KPwXPgtOs0G67ho3snmxsjMbH3pkjqaI/G2Ovtoo/tThDd/Z678aiHAFVTOvCCBZ+OyVQMUI3wN0bht+Es2DMu9rE1k9Zt3Rtq9yjG9er2eZ9SQz9IVyfxDUSC40lU6oFzNapJQXRDvilkGhhb6yzf/be6rT2a0gWhjPxD4+cw6RxyGfT1HwSwSnz6WeQrqiRLizGVDK1JufZ6NZqWGHWKT1QWa9faBGtdcmGjsvFHblx/EiYOthS97OxRpCswticaX+l1LEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=meYE8nSJW/ySHGWWMoOsgEqrWGpdRxhMBzju4iKCy/I=;
 b=klnRfzKBfTSGJGlR3PmwGMGJOtdk2I4jjl1xJ7Y8gJxeyOzkll04l7YCFosC2fWfYATJUwnEfeG6qGYE7PSwOgLkBLpspSHS88nwKIGBa/xEVBArnPYoVoMis69/SjkRGsX7RmYksVZEs7nqYPmgLkGnNSaXBFhbTAlATY2IGYo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <alejandro.garciavallejo@amd.com>, "Daniel P. Smith"
	<dpsmith@apertussolutions.com>, Stefano Stabellini <sstabellini@kernel.org>,
	Julien Grall <julien@xen.org>, Bertrand Marquis <bertrand.marquis@arm.com>,
	Michal Orzel <michal.orzel@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>, "Jan
 Beulich" <jbeulich@suse.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
	Jason Andryuk <jason.andryuk@amd.com>
Subject: [PATCH 10/10] dom0less: Parse dom0less bindings into createdomain input args
Date: Tue, 22 Jul 2025 13:59:50 +0200
Message-ID: <20250722115955.57167-11-alejandro.garciavallejo@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
References: <20250722115955.57167-1-alejandro.garciavallejo@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|CH8PR12MB9816:EE_
X-MS-Office365-Filtering-Correlation-Id: b6df322b-a3fd-474c-a71c-08ddc9175bbf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Le4g7T3gzz3fWF2DmZ1M8OiSjtFyLqPt54isu8mncZWIY2ESFA8y+vzsbYf9?=
 =?us-ascii?Q?8N9dbZX5NXCX1MtpwKSTJG+Ce9PeEksyMzB9HXH01L8Z3Y6JTNOSsOzSugIS?=
 =?us-ascii?Q?wBK/NCqEadqIrAOhlykvCzVNbJ4ehQrMQdLkoK8ITN031s4X8nZ7352kdmbU?=
 =?us-ascii?Q?Gyn+uT8rPQIjHo11PljLTxsZNbSixwjL1kF0Rey0JIXv3tp4MwiU7+v6tFsv?=
 =?us-ascii?Q?pF73YyF/oEN/oKRAHAvILr1pRYzNfLtZFh8USi592IIXPBybb1pNuoHxekZ9?=
 =?us-ascii?Q?aADUng5F7HgTV3dP3n0hBvu83qoIRZR42lakY+In7+1hk4ggGdrZnmZTKY7B?=
 =?us-ascii?Q?PgCT+E9a2crOihyxUWVxYGIp7fmjzx3ZRTUzjqXmI+GXrbXso1sJu0Bqk+lL?=
 =?us-ascii?Q?SwXTPKyTIaSJ7UyRRTcJipAxTfh0pYGrio5QSodWfW/aK11pO7Q/HO9ANgOL?=
 =?us-ascii?Q?GOpDbihGcGk2NgO1hdnLxv79GKA6VsR6gu171xkktnY1ZulaU35b/BhXMM25?=
 =?us-ascii?Q?YUBM+R7gD5SjFbVmxP1seDw9BPKJAXdSriwz1rMusz2mj07QzYkthInZg98y?=
 =?us-ascii?Q?3hkuPAyUDgy1k2De5wuTHTQ1xsI/Fy2XSmQm5qQ2sWRdRPsq0COTLsnR/tJe?=
 =?us-ascii?Q?Pzuu9R3LLUQjlpuABBZqdOMk1BjDH4UtbdblTlEuOVynq12mEhJV+hoMSr4t?=
 =?us-ascii?Q?yLU/KuYhvA8KL9C0GU3EP779H9fdOq3qrDYlvQgFJtnQB+OMd3+20MOjYXK5?=
 =?us-ascii?Q?aimyDaPqCX4dEJQsEke81LeqloAPsmlbv8758Kwc1yVt8UW1A4H4/5IkScfI?=
 =?us-ascii?Q?gcI8xIw4jbZ1V09pV28Azl1J6HhsZwn9Woir8aahIn4Nknmh6QFmo06g5pNv?=
 =?us-ascii?Q?MgAJCraTC9XJINQgEx2+W9c+aHnuVQ8vzW5fEAn2FVNU4E4Nu0WTWfZ7tjSV?=
 =?us-ascii?Q?30WcEmmKgTxCEQaehAyu9i9FDApSdJmZkB18fHZmP7dfxd6aH5CwynH4sk3C?=
 =?us-ascii?Q?4jKugFNZyCeOkFgMTCOLQ+bMr719FnxM3yr7JsyauI3QgD0g0eE78uSLVOch?=
 =?us-ascii?Q?tu6WmBEEuZ6zEU/J8PdVjYcIu9uXEJVfxHhUS48DXYns/A6CcUf6bTb5miN7?=
 =?us-ascii?Q?6ofMGFOo4XxAMql5uln8Yy8SFMP7Gk9Vw6mzeOy4/LqOif/nuhZ6Tx+LLLy2?=
 =?us-ascii?Q?lM4/I3RInp/RBwB/XBTrvE5u/Zw/v0plmh9owozWON/0eJPwHnjpfpKLq2kf?=
 =?us-ascii?Q?TGgg8GRP3z14Gy0jnqhUGf4w5TReTEnoDbxhCZvC6eH3h6CHb/7aVqihqW2I?=
 =?us-ascii?Q?GlkwXEPAzVRnrsCil0GQJuDmMFYRmMzxiwqOVcZJUgKOr1ClKxflPfwfDPQ6?=
 =?us-ascii?Q?MvlfQCJPeox7rruexyI4Di8AigdIQKr9mhJMZUBi2QnL3ZML4vh/QNfVQ0xW?=
 =?us-ascii?Q?0u4EEyu0mPtIEa+PlNqv4dVr01q25QZ9MHYie+6KflFIv7XiTk7UuaHfK0Hs?=
 =?us-ascii?Q?lvtxdh9YwenKQuurKTirE8EE1fg2vJ5Vi+hp?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 12:00:31.5776
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b6df322b-a3fd-474c-a71c-08ddc9175bbf
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9816

The builder in common code already does this, but it's not callable
independently from a separate location. Create a function x86 can
call to use its own domain builder, using createdomain arguments
as the parsed data.

The bindings are moved on the next patch so it's strict code motion.

Signed-off-by: Alejandro Vallejo <alejandro.garciavallejo@amd.com>
Reviewed-by: Stefano Stabellini <stefano.stabellini@amd.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/common/device-tree/Makefile            |   3 +-
 xen/common/device-tree/dom0less-bindings.c | 145 +++++++++++++++++++++
 xen/common/device-tree/dom0less-build.c    | 129 +-----------------
 xen/include/xen/dom0less-build.h           |   3 +
 4 files changed, 154 insertions(+), 126 deletions(-)
 create mode 100644 xen/common/device-tree/dom0less-bindings.c

diff --git a/xen/common/device-tree/Makefile b/xen/common/device-tree/Makefile
index e399242cdf..9036e455d6 100644
--- a/xen/common/device-tree/Makefile
+++ b/xen/common/device-tree/Makefile
@@ -3,7 +3,8 @@ obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo-fdt.init.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += bootinfo.init.o
 obj-y += device-tree.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += domain-build.init.o
-obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-build.init.o
+obj-$(filter $(CONFIG_DOM0LESS_BOOT),$(CONFIG_HAS_DEVICE_TREE_DISCOVERY)) += dom0less-build.init.o
+obj-$(CONFIG_DOM0LESS_BOOT) += dom0less-bindings.init.o
 obj-$(CONFIG_OVERLAY_DTB) += dt-overlay.o
 obj-$(CONFIG_HAS_DEVICE_TREE_DISCOVERY) += intc.o
 obj-$(CONFIG_DOMAIN_BUILD_HELPERS) += kernel.o
diff --git a/xen/common/device-tree/dom0less-bindings.c b/xen/common/device-tree/dom0less-bindings.c
new file mode 100644
index 0000000000..41d72d0d58
--- /dev/null
+++ b/xen/common/device-tree/dom0less-bindings.c
@@ -0,0 +1,145 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/bootfdt.h>
+#include <xen/device_tree.h>
+#include <xen/dom0less-build.h>
+#include <xen/domain.h>
+#include <xen/grant_table.h>
+#include <xen/llc-coloring.h>
+#include <xen/sched.h>
+
+#include <public/bootfdt.h>
+#include <public/domctl.h>
+
+int __init parse_dom0less_node(struct dt_device_node *node,
+                               struct boot_domain *bd)
+{
+    struct xen_domctl_createdomain *d_cfg = &bd->create_cfg;
+    unsigned int *flags = &bd->create_flags;
+    struct dt_device_node *cpupool_node;
+    uint32_t val;
+    bool has_dtb = false;
+    bool iommu = false;
+    const char *dom0less_iommu = NULL;
+
+    if ( !dt_device_is_compatible(node, "xen,domain") )
+        return -ENOENT;
+
+    *flags = 0;
+    *d_cfg = (struct xen_domctl_createdomain){
+        .max_evtchn_port = 1023,
+        .max_grant_frames = -1,
+        .max_maptrack_frames = -1,
+        .grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version),
+    };
+
+    if ( dt_property_read_u32(node, "capabilities", &val) )
+    {
+        if ( val & ~DOMAIN_CAPS_MASK )
+            panic("Invalid capabilities (%"PRIx32")\n", val);
+
+        if ( val & DOMAIN_CAPS_CONTROL )
+            *flags |= CDF_privileged;
+
+        if ( val & DOMAIN_CAPS_HARDWARE )
+        {
+            if ( hardware_domain )
+                panic("Only 1 hardware domain can be specified! (%pd)\n",
+                        hardware_domain);
+
+#ifdef CONFIG_GRANT_TABLE
+            d_cfg->max_grant_frames = gnttab_dom0_frames();
+#endif
+            d_cfg->max_evtchn_port = -1;
+            *flags |= CDF_hardware;
+            iommu = true;
+        }
+
+        if ( val & DOMAIN_CAPS_XENSTORE )
+        {
+            d_cfg->flags |= XEN_DOMCTL_CDF_xs_domain;
+            d_cfg->max_evtchn_port = -1;
+        }
+    }
+
+    if ( dt_find_property(node, "xen,static-mem", NULL) )
+    {
+        if ( llc_coloring_enabled )
+            panic("LLC coloring and static memory are incompatible\n");
+
+        *flags |= CDF_staticmem;
+    }
+
+    if ( dt_property_read_bool(node, "direct-map") )
+    {
+        if ( !(*flags & CDF_staticmem) )
+            panic("direct-map is not valid for domain %s without static allocation.\n",
+                  dt_node_name(node));
+
+        *flags |= CDF_directmap;
+    }
+
+    if ( !dt_property_read_u32(node, "cpus", &d_cfg->max_vcpus) )
+        panic("Missing property 'cpus' for domain %s\n",
+              dt_node_name(node));
+
+    if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
+    {
+        if ( *flags & CDF_hardware )
+            panic("Don't specify passthrough for hardware domain\n");
+
+        if ( !strcmp(dom0less_iommu, "enabled") )
+            iommu = true;
+    }
+
+    if ( (*flags & CDF_hardware) && !(*flags & CDF_directmap) &&
+         !iommu_enabled )
+        panic("non-direct mapped hardware domain requires iommu\n");
+
+    if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
+    {
+        if ( *flags & CDF_hardware )
+            panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
+
+        has_dtb = true;
+    }
+
+    if ( iommu_enabled && (iommu || has_dtb) )
+        d_cfg->flags |= XEN_DOMCTL_CDF_iommu;
+
+    /* Get the optional property domain-cpupool */
+    cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
+    if ( cpupool_node )
+    {
+        int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
+        if ( pool_id < 0 )
+            panic("Error getting cpupool id from domain-cpupool (%d)\n",
+                  pool_id);
+        d_cfg->cpupool_id = pool_id;
+    }
+
+    if ( dt_property_read_u32(node, "max_grant_version", &val) )
+        d_cfg->grant_opts = XEN_DOMCTL_GRANT_version(val);
+
+    if ( dt_property_read_u32(node, "max_grant_frames", &val) )
+    {
+        if ( val > INT32_MAX )
+            panic("max_grant_frames (%"PRIu32") overflow\n", val);
+        d_cfg->max_grant_frames = val;
+    }
+
+    if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
+    {
+        if ( val > INT32_MAX )
+            panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
+        d_cfg->max_maptrack_frames = val;
+    }
+
+#ifdef CONFIG_HAS_LLC_COLORING
+    dt_property_read_string(node, "llc-colors", &bd->llc_colors_str);
+    if ( !llc_coloring_enabled && bd->llc_colors_str )
+        panic("'llc-colors' found, but LLC coloring is disabled\n");
+#endif
+
+    return arch_parse_dom0less_node(node, bd);
+}
diff --git a/xen/common/device-tree/dom0less-build.c b/xen/common/device-tree/dom0less-build.c
index 676a3317cf..6bb038111d 100644
--- a/xen/common/device-tree/dom0less-build.c
+++ b/xen/common/device-tree/dom0less-build.c
@@ -831,138 +831,17 @@ void __init create_domUs(void)
     BUG_ON(chosen == NULL);
     dt_for_each_child_node(chosen, node)
     {
-        const char *dom0less_iommu;
-        bool iommu = false;
-        const struct dt_device_node *cpupool_node;
         struct kernel_info ki = KERNEL_INFO_INIT;
-        struct xen_domctl_createdomain *d_cfg = &ki.bd.create_cfg;
-        unsigned int *flags = &ki.bd.create_flags;
-        bool has_dtb = false;
-        uint32_t val;
-        int rc;
+        int rc = parse_dom0less_node(node, &ki.bd);
 
-        if ( !dt_device_is_compatible(node, "xen,domain") )
+        if ( rc == -ENOENT )
             continue;
+        if ( rc )
+            panic("Malformed DTB: Invalid domain %s\n", dt_node_name(node));
 
         if ( (max_init_domid + 1) >= DOMID_FIRST_RESERVED )
             panic("No more domain IDs available\n");
 
-        d_cfg->max_evtchn_port = 1023;
-        d_cfg->max_grant_frames = -1;
-        d_cfg->max_maptrack_frames = -1;
-        d_cfg->grant_opts = XEN_DOMCTL_GRANT_version(opt_gnttab_max_version);
-
-        if ( dt_property_read_u32(node, "capabilities", &val) )
-        {
-            if ( val & ~DOMAIN_CAPS_MASK )
-                panic("Invalid capabilities (%"PRIx32")\n", val);
-
-            if ( val & DOMAIN_CAPS_CONTROL )
-                *flags |= CDF_privileged;
-
-            if ( val & DOMAIN_CAPS_HARDWARE )
-            {
-                if ( hardware_domain )
-                    panic("Only 1 hardware domain can be specified! (%pd)\n",
-                            hardware_domain);
-
-#ifdef CONFIG_GRANT_TABLE
-                d_cfg->max_grant_frames = gnttab_dom0_frames();
-#endif
-                d_cfg->max_evtchn_port = -1;
-                *flags |= CDF_hardware;
-                iommu = true;
-            }
-
-            if ( val & DOMAIN_CAPS_XENSTORE )
-            {
-                d_cfg->flags |= XEN_DOMCTL_CDF_xs_domain;
-                d_cfg->max_evtchn_port = -1;
-            }
-        }
-
-        if ( dt_find_property(node, "xen,static-mem", NULL) )
-        {
-            if ( llc_coloring_enabled )
-                panic("LLC coloring and static memory are incompatible\n");
-
-            *flags |= CDF_staticmem;
-        }
-
-        if ( dt_property_read_bool(node, "direct-map") )
-        {
-            if ( !(*flags & CDF_staticmem) )
-                panic("direct-map is not valid for domain %s without static allocation.\n",
-                      dt_node_name(node));
-
-            *flags |= CDF_directmap;
-        }
-
-        if ( !dt_property_read_u32(node, "cpus", &d_cfg->max_vcpus) )
-            panic("Missing property 'cpus' for domain %s\n",
-                  dt_node_name(node));
-
-        if ( !dt_property_read_string(node, "passthrough", &dom0less_iommu) )
-        {
-            if ( *flags & CDF_hardware )
-                panic("Don't specify passthrough for hardware domain\n");
-
-            if ( !strcmp(dom0less_iommu, "enabled") )
-                iommu = true;
-        }
-
-        if ( (*flags & CDF_hardware) && !(*flags & CDF_directmap) &&
-             !iommu_enabled )
-            panic("non-direct mapped hardware domain requires iommu\n");
-
-        if ( dt_find_compatible_node(node, NULL, "multiboot,device-tree") )
-        {
-            if ( *flags & CDF_hardware )
-                panic("\"multiboot,device-tree\" incompatible with hardware domain\n");
-
-            has_dtb = true;
-        }
-
-        if ( iommu_enabled && (iommu || has_dtb) )
-            d_cfg->flags |= XEN_DOMCTL_CDF_iommu;
-
-        /* Get the optional property domain-cpupool */
-        cpupool_node = dt_parse_phandle(node, "domain-cpupool", 0);
-        if ( cpupool_node )
-        {
-            int pool_id = btcpupools_get_domain_pool_id(cpupool_node);
-            if ( pool_id < 0 )
-                panic("Error getting cpupool id from domain-cpupool (%d)\n",
-                      pool_id);
-            d_cfg->cpupool_id = pool_id;
-        }
-
-        if ( dt_property_read_u32(node, "max_grant_version", &val) )
-            d_cfg->grant_opts = XEN_DOMCTL_GRANT_version(val);
-
-        if ( dt_property_read_u32(node, "max_grant_frames", &val) )
-        {
-            if ( val > INT32_MAX )
-                panic("max_grant_frames (%"PRIu32") overflow\n", val);
-            d_cfg->max_grant_frames = val;
-        }
-
-        if ( dt_property_read_u32(node, "max_maptrack_frames", &val) )
-        {
-            if ( val > INT32_MAX )
-                panic("max_maptrack_frames (%"PRIu32") overflow\n", val);
-            d_cfg->max_maptrack_frames = val;
-        }
-
-#ifdef CONFIG_HAS_LLC_COLORING
-        dt_property_read_string(node, "llc-colors", &ki.bd.llc_colors_str);
-        if ( !llc_coloring_enabled && ki.bd.llc_colors_str )
-            panic("'llc-colors' found, but LLC coloring is disabled\n");
-#endif
-
-        if ( (rc = arch_parse_dom0less_node(node, &ki.bd)) )
-            panic("error parsing arch-specific dom0less props (rc=%d)", rc);
-
         /*
          * The variable max_init_domid is initialized with zero, so here it's
          * very important to use the pre-increment operator to call
diff --git a/xen/include/xen/dom0less-build.h b/xen/include/xen/dom0less-build.h
index 72ca8f5e6d..408859e325 100644
--- a/xen/include/xen/dom0less-build.h
+++ b/xen/include/xen/dom0less-build.h
@@ -45,6 +45,9 @@ void create_domUs(void);
 bool is_dom0less_mode(void);
 void set_xs_domain(struct domain *d);
 
+int parse_dom0less_node(struct dt_device_node *node,
+                        struct boot_domain *bd);
+
 int arch_parse_dom0less_node(struct dt_device_node *node,
                              struct boot_domain *bd);
 
-- 
2.43.0


