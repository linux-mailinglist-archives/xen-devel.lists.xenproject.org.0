Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBD6A81196
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:10:53 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942803.1341931 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXD-0007qz-3F; Tue, 08 Apr 2025 16:10:47 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942803.1341931; Tue, 08 Apr 2025 16:10:47 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXC-0007kx-RZ; Tue, 08 Apr 2025 16:10:46 +0000
Received: by outflank-mailman (input) for mailman id 942803;
 Tue, 08 Apr 2025 16:10:45 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVl-0000a6-NA
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:17 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20619.outbound.protection.outlook.com
 [2a01:111:f403:2009::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id d18f198b-1493-11f0-9eaa-5ba50f476ded;
 Tue, 08 Apr 2025 18:09:15 +0200 (CEST)
Received: from MN2PR19CA0071.namprd19.prod.outlook.com (2603:10b6:208:19b::48)
 by IA1PR12MB7519.namprd12.prod.outlook.com (2603:10b6:208:418::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 16:09:10 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:19b:cafe::b5) by MN2PR19CA0071.outlook.office365.com
 (2603:10b6:208:19b::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.31 via Frontend Transport; Tue,
 8 Apr 2025 16:09:10 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:10 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:07 -0500
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
X-Inumbo-ID: d18f198b-1493-11f0-9eaa-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YTTlj3+45Pb8UqfujkGECq3peB1bsGS7aVzM+kJaDweVl5iqinCPtwILl6zj7VhGYYsUFBdzZNH9oF5ImnfMUfQhFLiLTElk8cuvIRC+0HKkejuNAfIr01SY1hzneC1qDfgXQcmNMr8AgxsHCZRIvDsHDU+YEMwK08EgbhANCIKDFp+kbNKeiGkURis04FuqUny5MDPCMIi6mQMGnv1oAAUMbrgB1oEcfUTMw780bi8v0MMufTzmrrcbPmKRpPYBEg4BUvioq+GApL8dhIPC89O3jMYouijcix9/qfhmplm731KuDbmI4+XYD6bbSJtXIghr4OxZzPbqtnjFMjt8jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wb1RbJ/A2HZQ4CDL4kSnK/cd53lOCjG7RRR6aRmIDv8=;
 b=g+ZEibhEY85r/1ZFS0Lrngy3JXrM1sNBwdVL33tVpnANTbeeaNCJ6uOvYdwQ9pNX+ymvxKZEoeFw2BOlDsirxLSjwbcU6l4KZhD0UMQFf1vNyalBGWlsGR9QB6sAue049ogPPN0vfm8Udb1lyLoTjfmqlaqIG/8kwYI6k/lx9OEWXIalboebn/TbBJQ1/5wcu8YRgOr8JDLafayOB46x7Sy6AhSCv3CnmcXwwewEdzMtS+lyY668VzNACxMRxbUsphjrBUhSbWooYYq3j2w1jroTOCUv2P2+KXkbWXvTyUXGItOGoIL7Zf+CloWNdCqtxilTBjvQMZ03YupQ78W1pA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wb1RbJ/A2HZQ4CDL4kSnK/cd53lOCjG7RRR6aRmIDv8=;
 b=clOW0deNOJXpVcoG8LROfwvL7j89FUIhN5jHLGRAmMUz6QMYHc0CeBNwTbefsCUNyhGYyZs+M8JGaikEBBxKoOAH6scps0VNsOHUv0odWmtzqRDSQr0xrq7wE8Sat2ecPRtcHn6HtLdFi8uqc8dgFuEJMX0Qqt40SIIvvvZIOuo=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Julien Grall <julien@xen.org>, Bertrand Marquis
	<bertrand.marquis@arm.com>
Subject: [PATCH v3 08/16] x86/hyperlaunch: Add helpers to locate multiboot modules
Date: Tue, 8 Apr 2025 17:07:30 +0100
Message-ID: <20250408160802.49870-9-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408160802.49870-1-agarciav@amd.com>
References: <20250408160802.49870-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|IA1PR12MB7519:EE_
X-MS-Office365-Filtering-Correlation-Id: 7710856c-f113-438c-15c5-08dd76b7b26d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?lRS/MJfbxThgBCfrh9sB6htGmo+nylnZs0PHtP98YJ2DnDuqPqca8vd9gkl3?=
 =?us-ascii?Q?rnmMFsbLd0Y1ZcLBiVeZ3Su4QCtZ4iuZw3hAfPJ92tPZLxmTecblm7AuN71E?=
 =?us-ascii?Q?jEV6ZH7HruxjtmmUT2SsX0XnOopVnwOdj1KXvHJJUYVHQ/Pzo6Vw0FunKz9y?=
 =?us-ascii?Q?T6Zqt8Mege/ZjkjN507h16+ApNH5iqIAK6W91Nz7I481PykxE7IrSdFCtJtV?=
 =?us-ascii?Q?w1hfPOTfn3Ls78242z/4I2TnaL1z+p5rnc+w4/vM2nmJf38Oa51aimSliFNH?=
 =?us-ascii?Q?HV99+cntY83i9LKUbIl4Nn8iOBhgXr+V09WICIQnmWjIOzuZsjQbJ16ak+Pv?=
 =?us-ascii?Q?cm1EveiG3TcuCot0jKPM7ngy2hcMwAE6/J0EMZWMCfqn5oQ7LUM7Wgcd4//Q?=
 =?us-ascii?Q?J3wMAMmNCiE/jrlAb54NFsu4w9G26iG+ZV0P5z1kyaR7gZfKU6zXiecALfyO?=
 =?us-ascii?Q?B9Njn9xHwKwTQPZsqL6VoDR2g97bmD4MfZpE39gOqfhTWJ9/wMxuQe2ihVyi?=
 =?us-ascii?Q?+GjUtIt5fgqtp94rJjGUbFamrmQlyEimOUy1W0mNEqP4005VfVNkrFQdOZre?=
 =?us-ascii?Q?feKmblI13FBfEEbIXGc3udr3u+Sjn1fHMS1YBl7CFm0UQTt4nd/6bdplfA8y?=
 =?us-ascii?Q?E6gHC9cI+B5COTQLitbgmkkU0Z2gqczOQ3ULWT8kguEq45wLSYaVYZM6Ozep?=
 =?us-ascii?Q?ixepmPG+5q+uezKKVXoO1Uiah1mYxAGTXkCW5guqLolsNGqFLi0xCiOaQxon?=
 =?us-ascii?Q?kUlRPS8fStvPaHaTD5PeEOSEtEPJzGXah8MPDxSdSGuC41vUU2aAWeyLCVJ5?=
 =?us-ascii?Q?XxAiDqmxvciIhInzO3PcvfchWj6YJzwfk6xv2KwH77QH+x6kWDboFbRNOlzR?=
 =?us-ascii?Q?f2M8HubsXNtYaK+CERL1nwx0VQAhfP+4lZcTMl7Irl9LqLLBhTLDGO+gFvnv?=
 =?us-ascii?Q?0SmPu7rAHuPm9Qy1A/UjD07qS8M9XUK6T7KtgZFYNbGz1fE2/ZBZATnHYZJa?=
 =?us-ascii?Q?MkEp1ubfQVsE0DtnRIHLypaC6LfLdrdLUU1nK9TXFWPF/hLhWtFEaoKFRCT9?=
 =?us-ascii?Q?4Ip5YFMx6dGmyuzDiV8z+HA998/hUaYNVMLGNnQNc2NEEStDu//7gXxRLj0i?=
 =?us-ascii?Q?lq4RaV7cEGW/KDlyk9ZctsxLCGCo1nroOxTz2ycchxzgxj2lCsMWWy/RRAiH?=
 =?us-ascii?Q?C6rEWOKneP1HA0bhPCUdkTTv/yl4MmdP6Me+a1/67RiNTdsnEh9ndZmd1Htd?=
 =?us-ascii?Q?bp5+LaI+gNp+N8OD5etocURkz5+jxES+d6hR15GP5QzNX64J+8puXR71wlCu?=
 =?us-ascii?Q?gRwP6118+VSi3gtQWUI1IMLaxdLZYlPb/9Tn9Tutx2l2BrUluUiFaj+QwrXM?=
 =?us-ascii?Q?5tJG1RlQNm9ENIX+tS75hhdrZKNDapkmOjya38N6/++fBgBa21Xuoy6Bm621?=
 =?us-ascii?Q?6m0UcKXBCqtU54YLJ1DEZnUhgpH+b4zDdCVwqQtrYILhtW+8a2RI2Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:10.0597
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7710856c-f113-438c-15c5-08dd76b7b26d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7519

Hyperlaunch mandates either a reg or module-index DT prop on nodes that
contain `multiboot,module" under their "compatible" prop. This patch
introduces a helper to generically find such index, appending the module
to the list of modules if it wasn't already (i.e: because it's given via
the "reg" prop).

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v3:
    * New on v3.
    * Subsumes much of the dup code between kernel/initrd patches.
    * Changes previous behaviour in v2 to look into "reg" and
      "module-index" props, rather than just index.
    * Use addr_cells/size_cells rather than size_size
---
 xen/arch/x86/domain-builder/fdt.c   | 142 ++++++++++++++++++++++++++++
 xen/arch/x86/domain-builder/fdt.h   |   2 +
 xen/include/xen/libfdt/libfdt-xen.h |  57 +++++++++++
 3 files changed, 201 insertions(+)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 4c5b7747f5..9ebc8fd0e4 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -13,6 +13,148 @@
 
 #include "fdt.h"
 
+/*
+ * Unpacks a "reg" property into its address and size constituents.
+ *
+ * @param prop          Pointer to an FDT "reg" property.
+ * @param address_cells Number of 4-octet cells that make up an "address".
+ * @param size_cells    Number of 4-octet cells that make up a "size".
+ * @param p_addr[out]   Address encoded in the property.
+ * @param p_size[out]   Size encoded in the property.
+ * @returns             -EINVAL on malformed property, 0 otherwise.
+ */
+static int __init read_fdt_prop_as_reg(const struct fdt_property *prop,
+                                       int address_cells, int size_cells,
+                                       uint64_t *p_addr, uint64_t *p_size)
+{
+    const fdt32_t *cell = (const fdt32_t *)prop->data;
+    uint64_t addr, size;
+
+    if ( fdt32_to_cpu(prop->len) !=
+         (address_cells + size_cells) * sizeof(*cell) )
+    {
+        printk("  Cannot read reg %lu+%lu from prop len %u\n",
+            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
+            fdt32_to_cpu(prop->len));
+        return -EINVAL;
+    }
+
+    switch ( address_cells ) {
+    case 1:
+        addr = fdt32_to_cpu(*cell);
+        break;
+    case 2:
+        addr = fdt64_to_cpu(*(const fdt64_t *)cell);
+        break;
+    default:
+        printk("  unsupported sized address_cells\n");
+        return -EINVAL;
+    }
+
+    cell += address_cells;
+    switch ( size_cells ) {
+    case 1:
+        size = fdt32_to_cpu(*cell);
+        break;
+    case 2:
+        size = fdt64_to_cpu(*(const fdt64_t *)cell);
+        break;
+    default:
+        printk("  unsupported sized size_cells\n");
+        return -EINVAL;
+    }
+
+    *p_addr = addr;
+    *p_size = size;
+
+    return 0;
+}
+
+/*
+ * Locate a multiboot module given its node offset in the FDT.
+ *
+ * The module location may be given via either FDT property:
+ *     * reg = <address, size>
+ *         * Mutates `bi` to append the module.
+ *     * module-index = <idx>
+ *         * Leaves `bi` unchanged.
+ *
+ * @param fdt           Pointer to the full FDT.
+ * @param node          Offset for the module node.
+ * @param address_cells Number of 4-octet cells that make up an "address".
+ * @param size_cells    Number of 4-octet cells that make up a "size".
+ * @param bi[inout]     Xen's representation of the boot parameters.
+ * @return              -EINVAL on malformed nodes, otherwise
+ *                      index inside `bi->mods`
+ */
+int __init fdt_read_multiboot_module(const void *fdt, int node,
+                                     int address_cells, int size_cells,
+                                     struct boot_info *bi)
+{
+    const struct fdt_property *prop;
+    uint64_t addr, size;
+    int ret;
+    int idx;
+
+    ASSERT(!fdt_node_check_compatible(fdt, node, "multiboot,module"));
+
+    /* Location given as a `module-index` property. */
+    prop = fdt_get_property(fdt, node, "module-index", NULL);
+
+    if ( prop )
+    {
+        if ( fdt_get_property(fdt, node, "reg", NULL) )
+        {
+            printk("  Location of multiboot,module defined multiple times\n");
+            return -EINVAL;
+        }
+        return fdt_cell_as_u32((const fdt32_t *)prop->data);
+    }
+
+    /* Otherwise location given as a `reg` property. */
+    prop = fdt_get_property(fdt, node, "reg", NULL);
+
+    if ( !prop )
+    {
+        printk("  No location for multiboot,module\n");
+        return -EINVAL;
+    }
+    if ( fdt_get_property(fdt, node, "module-index", NULL) )
+    {
+        printk("  Location of multiboot,module defined multiple times\n");
+        return -EINVAL;
+    }
+
+    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
+
+    if ( ret < 0 )
+    {
+        printk("  Failed reading reg for multiboot,module\n");
+        return -EINVAL;
+    }
+
+    idx = bi->nr_modules + 1;
+    if ( idx > MAX_NR_BOOTMODS )
+    {
+        /*
+         * MAX_NR_BOOTMODS cannot exceed the max for MB1, represented by 32bits,
+         * thus the cast down to a u32 will be safe due to the prior check.
+         */
+        BUILD_BUG_ON(MAX_NR_BOOTMODS >= (uint64_t)UINT32_MAX);
+        printk("  idx %d exceeds maximum boot modules\n", idx);
+        return -EINVAL;
+    }
+
+    /* Append new module to the existing list */
+
+    bi->nr_modules = idx;
+    bi->mods[idx].start = addr;
+    bi->mods[idx].size = size;
+    printk("  module[%d]: addr %lx size %lx\n", idx, addr, size);
+
+    return idx;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
diff --git a/xen/arch/x86/domain-builder/fdt.h b/xen/arch/x86/domain-builder/fdt.h
index 1849656571..e8769dc51c 100644
--- a/xen/arch/x86/domain-builder/fdt.h
+++ b/xen/arch/x86/domain-builder/fdt.h
@@ -3,6 +3,8 @@
 #define __XEN_X86_FDT_H__
 
 #include <xen/init.h>
+#include <xen/libfdt/libfdt.h>
+#include <xen/libfdt/libfdt-xen.h>
 
 struct boot_info;
 
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index a5340bc9f4..2259c09a6a 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -13,6 +13,63 @@
 
 #include <xen/libfdt/libfdt.h>
 
+static inline int __init fdt_cell_as_u32(const fdt32_t *cell)
+{
+    return fdt32_to_cpu(*cell);
+}
+
+static inline uint64_t  __init fdt_cell_as_u64(const fdt32_t *cell)
+{
+    return ((uint64_t)fdt32_to_cpu(cell[0]) << 32) | fdt32_to_cpu(cell[1]);
+}
+
+/*
+ * Property: reg
+ *
+ * Defined in Section 2.3.6 of the Device Tree Specification is the "reg"
+ * standard property. The property is a prop-encoded-array that is encoded as
+ * an arbitrary number of (address, size) pairs.  We only extract a single
+ * pair since that is what is used in practice.
+ */
+static inline int __init fdt_get_reg_prop(
+    const void *fdt, int node, unsigned int addr_cells, unsigned int size_cells,
+    uint64_t *addr, uint64_t *size)
+{
+    int ret;
+    const struct fdt_property *prop;
+    fdt32_t *cell;
+
+    /* FDT spec max size is 4 (128bit int), but largest arch int size is 64 */
+    if ( size_cells > 2 || addr_cells > 2 )
+        return -EINVAL;
+
+    prop = fdt_get_property(fdt, node, "reg", &ret);
+    if ( !prop || ret < sizeof(u32) )
+        return ret < 0 ? ret : -EINVAL;
+
+    if ( fdt32_to_cpu(prop->len) !=
+	 ((size_cells + addr_cells) * sizeof(*cell)) )
+        return -EINVAL;
+
+    cell = (fdt32_t *)prop->data;
+
+    /* read address field */
+    if ( addr_cells == 1 )
+        *addr = fdt_cell_as_u32(cell);
+    else
+        *addr = fdt_cell_as_u64(cell);
+
+    cell += addr_cells;
+
+    /* read size field */
+    if ( size_cells == 1 )
+        *size = fdt_cell_as_u32(cell);
+    else
+        *size = fdt_cell_as_u64(cell);
+
+    return 0;
+}
+
 static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
                                         paddr_t *address,
                                         paddr_t *size)
-- 
2.43.0


