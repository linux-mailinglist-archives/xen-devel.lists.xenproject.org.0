Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id AE01AA9B381
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:22 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966536.1356750 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAG-0002rx-QV; Thu, 24 Apr 2025 16:11:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966536.1356750; Thu, 24 Apr 2025 16:11:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAG-0002pd-Nc; Thu, 24 Apr 2025 16:11:04 +0000
Received: by outflank-mailman (input) for mailman id 966536;
 Thu, 24 Apr 2025 16:11:03 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zAF-0001nH-6O
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:11:03 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20611.outbound.protection.outlook.com
 [2a01:111:f403:2414::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b6db28d1-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:11:02 +0200 (CEST)
Received: from MW4PR04CA0288.namprd04.prod.outlook.com (2603:10b6:303:89::23)
 by CY5PR12MB6646.namprd12.prod.outlook.com (2603:10b6:930:41::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 24 Apr
 2025 16:10:56 +0000
Received: from SJ5PEPF000001CA.namprd05.prod.outlook.com
 (2603:10b6:303:89:cafe::18) by MW4PR04CA0288.outlook.office365.com
 (2603:10b6:303:89::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Thu,
 24 Apr 2025 16:10:56 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CA.mail.protection.outlook.com (10.167.242.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:10:55 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:51 -0500
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
X-Inumbo-ID: b6db28d1-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dGosHt2CFxHBFfWpNP8jkwY136aVgbSq1IIois23/hgxcebmBH0IFi1+ELyAdTll0se7vis+rktfp28Y4WXcqArIgthENAFOgJF90JFc9JoNsjdRx3S4GpFSYj1pi3pChauEZ5fik3dtR5BxelM0Oj0K2LRdLSgEA5X1LKFUCQnh3gh2Hc6WXGWlDLUEBqqAkm1zE+nDzs2iAxH9vidARBZlWHcYzp0e2EnDLgqd2tXkp+VKgxNKurtqicb2WwwwZyOaSHkM/3HzRJ1d11DD250rsdSiYLGyzLQR7BgC0yNktb3Suh/oJ1Ywl8uJMYMMPN5k0cQvH/wdzWsgdBOC/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k4m5Lm4bLEjm3x5leIA7OliYWnqb6/R0IRdoszlI3xs=;
 b=kiEm/25Xpvhg9x1/eBzy9VaGy61ATIk4+YH6nxWM94hr8ovAFuJlzyHc4Znp87WUE73bAjPu3ShTr5Rsdk0RqNSazBbjSS1jlnuCjkBFPEbtkG2Zu1aIyh9AvZ9qJTJfNtv9nqpK2yTyG2cI8y5CNNuhRC3vRXKBicUrL6VxjciI59E7TgC9O7JkQpZid9qmyn+uD16yfCNP6EsvunsApf5nL5g9otqxEQ/qYHDmHp84pkPvNhU/UlKVm8V2EDF5TjdxGKgwSZUhSdG/PgxbyMd8ykp0jCb+oeRGiDY5MomWD2E/LlGhe6VVfgS+Wi4fughItQXBUo3IH56uDFcx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k4m5Lm4bLEjm3x5leIA7OliYWnqb6/R0IRdoszlI3xs=;
 b=nkgzwOeICgG/kQTpYnli+Gma1npClb/ZoXvPjP6edW9zVtXyO326KaGr7Bs/QWWnyA3k5fpzQ/pz0mITq/0W9lX7aOCZKKvDp4UFktq602tE35WWLNsm/RZsw/IW0dAeJm7Lt3rIS0+iKyeswYQ+JDe6gYINrG6V3up5GSEABQE=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: Alejandro Vallejo <agarciav@amd.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>, Jan Beulich <jbeulich@suse.com>, "Julien
 Grall" <julien@xen.org>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>
Subject: [PATCH v5 04/12] x86/hyperlaunch: Add helpers to locate multiboot modules
Date: Thu, 24 Apr 2025 17:10:14 +0100
Message-ID: <20250424161027.92942-5-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424161027.92942-1-agarciav@amd.com>
References: <20250424161027.92942-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CA:EE_|CY5PR12MB6646:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d6050a7-7f0b-43a7-5912-08dd834a97d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rhahiVDzqwVxK+CAXN7Hb/urEu9bZuUIC9+hchGF+/N4kNiSRj7WMqajQEJP?=
 =?us-ascii?Q?vCNT7oC47uaJNDc1aM2ceLQ2pzqdbg5KGOBprmdweryarJQOS7tpsUmJwjoz?=
 =?us-ascii?Q?nSb0nceElNIAb8bNF3wuWaMjp/I9sfBCuwBueRswIRZMaDCVYhhHeYHkJAZJ?=
 =?us-ascii?Q?+UFTV4ORta1d7kjJrTJLiLrJM980456cG1IuoZElphwAoUMzi6t6CzHr940q?=
 =?us-ascii?Q?YuOx/W7/iwEO4CZAqzdU3W6OxBfXER/lI7d5JDJ/WXV8lGjG0lMPg0ikBWrJ?=
 =?us-ascii?Q?4CQj5UKdz9ss7xs+YuDl4cMvgg39seXOv2+fcfDsZqkOtVWmYOXOB65iF4Zu?=
 =?us-ascii?Q?RuB51D4u985fudAWIZNFsWIMrvWi2ixsQjW64UG7IpuIDuUU6MGY8MTUdW9L?=
 =?us-ascii?Q?waTe2kpGUD1N8cShTjLNlGwRbcy1FEDf0pmz4bgUcbkViLX3Vfxh2nVMr0FX?=
 =?us-ascii?Q?36IuXLw0L1IJFCXGJDS7NxvcdlfE2p12G7v6reXChk6apXBNRuXlis9qslG9?=
 =?us-ascii?Q?h78o1Kq29XEmVDSxStwvWv4IleVMnM7zNLC23PxTOV5JQ2FLTDEJ472BMWGm?=
 =?us-ascii?Q?y6TPwMnYD6m9vsdcVawr1nw3uN8aLeUdDJDzECq6SeSbvGuYUtJIzEcuTAWH?=
 =?us-ascii?Q?RaoP7/fvCQnlkiUBcFqeNOwnt7BEibsrPVRTKgJ/mCBIevVVzxJFwrzsg1cY?=
 =?us-ascii?Q?u7E3PJ8ezBdpNooYFlmG8RQiCoOLf+9q6AyKX2ak7WpK5RhR2IznEAwB//4z?=
 =?us-ascii?Q?qmaHv/YiVyG4UgIQ0eb6DyeYq4xIwlZrHMT4fdNr185okHQM9VI7P/qCj+gD?=
 =?us-ascii?Q?cgQTB7YaRBrThTusJgo6UP79MxmfzgxryHeWzQLKPNNwi464zB/jcIdtiQ/c?=
 =?us-ascii?Q?P7HxrSdgYkHtL145nihN3KdBY1QRSOJj/TidzLg87fUtdkdpJa7D2kSkSsws?=
 =?us-ascii?Q?nSj/tLSSilKEfnMQzOcmE47dtbmbjiXPIQSuJgHWKHOmEsIyT3+LM3Dm9a4S?=
 =?us-ascii?Q?RH7xr9iT0QK+OkRhTBBMeUFbdmHNqWflD/hsvDiqDkd/ignlvJowL0BcDPOG?=
 =?us-ascii?Q?w3Hapsyav/HanNLBf6D18jRlgEGjQROpQXOcax2DSEr8cU4GVitaZlLhGnZT?=
 =?us-ascii?Q?KWa9vNyXRFuLlBOiGZa1S4R8xk63Yn1iPCIj5Ek8uVAFHQtuI2kYqG/vAZMn?=
 =?us-ascii?Q?pnBgcmVDdAEC+72P/cfcuADECjxjnPYXvAd/EFm6qQr+HEw1Ww1UJb4PVSKx?=
 =?us-ascii?Q?iZCDKFqJ/7Eh1Sf1qgWaGVUPolHskdZipHGxgHI4Q4qXkC2xgA2NrI71QI5d?=
 =?us-ascii?Q?EZI3KB7i3JI1u/U3/jd81NHuFxlMtxRoMRRTfoyXWlNaCt5CwIukstZZ6p+J?=
 =?us-ascii?Q?JJg8BS/5Z1IhzKh23FzXIWAz/dmWRZ6sJd+ON7AOZCPFgxAkIutnpg6nJea1?=
 =?us-ascii?Q?d15A287ds+DBd8gww5pK1eYcLncpRvdgyVFNI+yQ38xS80Pq39LH+nJ39XKJ?=
 =?us-ascii?Q?X+EVkKIouXhfeRHpnn/HVMXD/1cmxbrGFFJm?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:10:55.3101
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d6050a7-7f0b-43a7-5912-08dd834a97d3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6646

Hyperlaunch mandates either a reg or module-index DT prop on nodes that
contain `multiboot,module" under their "compatible" prop. This patch
introduces a helper to generically find such index, appending the module
to the list of modules if it wasn't already (i.e: because it's given via
the "reg" prop).

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * s/read_fdt_prop_as_reg/fdt_prop_as_reg/
  * Move the _u32() prop helper to fdt.c
---
 xen/common/domain-builder/fdt.c  | 172 +++++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h  |   1 +
 xen/include/xen/domain-builder.h |   4 +
 3 files changed, 177 insertions(+)

diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index c1ccba39a2..11f0436e85 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -13,6 +13,178 @@
 
 #include "fdt.h"
 
+static int __init fdt_prop_as_u32(const struct fdt_property *prop,
+                                  uint32_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
+        return -EINVAL;
+
+    *val = fdt32_to_cpu(*(const fdt32_t *)prop->data);
+    return 0;
+}
+
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
+static int __init fdt_prop_as_reg(const struct fdt_property *prop,
+                                  int address_cells, int size_cells,
+                                  uint64_t *p_addr, uint64_t *p_size)
+{
+    const fdt32_t *cell = (const fdt32_t *)prop->data;
+    uint64_t addr, size;
+
+    if ( fdt32_to_cpu(prop->len) !=
+         (address_cells + size_cells) * sizeof(*cell) )
+    {
+        printk(XENLOG_ERR "  cannot read reg %lu+%lu from prop len %u\n",
+            address_cells * sizeof(*cell), size_cells * sizeof(*cell),
+            fdt32_to_cpu(prop->len));
+        return -EINVAL;
+    }
+
+    switch ( address_cells )
+    {
+    case 1:
+        addr = fdt32_to_cpu(*cell);
+        break;
+    case 2:
+        addr = fdt64_to_cpu(*(const fdt64_t *)cell);
+        break;
+    default:
+        printk(XENLOG_ERR "  unsupported address_cells=%d\n", address_cells);
+        return -EINVAL;
+    }
+
+    cell += address_cells;
+    switch ( size_cells )
+    {
+    case 1:
+        size = fdt32_to_cpu(*cell);
+        break;
+    case 2:
+        size = fdt64_to_cpu(*(const fdt64_t *)cell);
+        break;
+    default:
+        printk(XENLOG_ERR "  unsupported size_cells=%d\n", size_cells);
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
+    uint32_t idx;
+
+    if ( fdt_node_check_compatible(fdt, node, "multiboot,module") )
+    {
+        printk(XENLOG_ERR "  bad module. multiboot,module not found");
+        return -ENODATA;
+    }
+
+    /* Location given as a `module-index` property. */
+    if ( (prop = fdt_get_property(fdt, node, "module-index", NULL)) )
+    {
+        if ( fdt_get_property(fdt, node, "reg", NULL) )
+        {
+            printk(XENLOG_ERR "  found both reg and module-index for module\n");
+            return -EINVAL;
+        }
+        if ( (ret = fdt_prop_as_u32(prop, &idx)) )
+        {
+            printk(XENLOG_ERR "  bad module-index prop\n");
+            return ret;
+        }
+        if ( idx >= MAX_NR_BOOTMODS )
+        {
+            printk(XENLOG_ERR "  module-index overflow. %s=%u\n",
+                   STR(MAX_NR_BOOTMODS), MAX_NR_BOOTMODS);
+            return -EINVAL;
+        }
+
+        return idx;
+    }
+
+    /* Otherwise location given as a `reg` property. */
+    if ( !(prop = fdt_get_property(fdt, node, "reg", NULL)) )
+    {
+        printk(XENLOG_ERR "  no location for multiboot,module\n");
+        return -EINVAL;
+    }
+    if ( fdt_get_property(fdt, node, "module-index", NULL) )
+    {
+        printk(XENLOG_ERR "  found both reg and module-index for module\n");
+        return -EINVAL;
+    }
+
+    ret = fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
+    if ( ret < 0 )
+    {
+        printk(XENLOG_ERR "  failed reading reg for multiboot,module\n");
+        return -EINVAL;
+    }
+
+    idx = bi->nr_modules;
+    if ( idx > MAX_NR_BOOTMODS )
+    {
+        /*
+         * MAX_NR_BOOTMODS must fit in 31 bits so it's representable in the
+         * positive side of an int; for the return value.
+         */
+        BUILD_BUG_ON(MAX_NR_BOOTMODS > (uint64_t)INT_MAX);
+        printk(XENLOG_ERR "  idx=%u exceeds len=%u\n", idx, MAX_NR_BOOTMODS);
+        return -EINVAL;
+    }
+
+    /*
+     * Append new module to the existing list
+     *
+     * Note that bi->nr_modules points to Xen itself, so we must shift it first
+     */
+    bi->nr_modules++;
+    bi->mods[bi->nr_modules] = bi->mods[idx];
+    bi->mods[idx] = (struct boot_module){
+        .start = addr,
+        .size = size,
+    };
+
+    printk(XENLOG_INFO "  module[%u]: addr %lx size %lx\n", idx, addr, size);
+
+    return idx;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
index 826c0f01e5..f48456acd2 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -3,6 +3,7 @@
 #define __XEN_DOMAIN_BUILDER_FDT_H__
 
 #include <xen/domain-builder.h>
+#include <xen/libfdt/libfdt-xen.h>
 
 struct boot_info;
 
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index cbb3cbea7c..3ac3a0ab84 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -28,4 +28,8 @@ static inline enum fdt_kind builder_init(struct boot_info *bi)
 }
 #endif /* !IS_ENABLED(CONFIG_DOMAIN_BUILDER) */
 
+int fdt_read_multiboot_module(const void *fdt, int node,
+                              int address_cells, int size_cells,
+                              struct boot_info *bi)
+
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.43.0


