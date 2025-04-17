Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id A2C15A91CD6
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957516.1350664 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgI-0006Fu-WF; Thu, 17 Apr 2025 12:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957516.1350664; Thu, 17 Apr 2025 12:49:26 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgI-0006D5-Oo; Thu, 17 Apr 2025 12:49:26 +0000
Received: by outflank-mailman (input) for mailman id 957516;
 Thu, 17 Apr 2025 12:49:24 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgG-0004z9-O0
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:24 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20611.outbound.protection.outlook.com
 [2a01:111:f403:2009::611])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 630b4218-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:23 +0200 (CEST)
Received: from CH5P223CA0009.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:1f3::7)
 by LV3PR12MB9142.namprd12.prod.outlook.com (2603:10b6:408:198::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.34; Thu, 17 Apr
 2025 12:49:18 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1f3:cafe::eb) by CH5P223CA0009.outlook.office365.com
 (2603:10b6:610:1f3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.23 via Frontend Transport; Thu,
 17 Apr 2025 12:49:17 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:17 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:15 -0500
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
X-Inumbo-ID: 630b4218-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wILlPMYn870rliEbR/1i3RklnYKGNmYaYX/reZ7FESSksWE4J4v+wNes2pvY2L9eNt2n94kEPCJ81urwcC64+G3/mmN8Lt+v9H5WcnPsXDPWa+z5ISTIeoLTYf0tjxzgYOzMTH0RMY54jyOKudinETy7K9hUp8FuUdWxEGT+LHwoL7kOAG2Fwh2TrNVlEud+X9H8sUOxEzMIJixk92RTowumVVKH55F5Ak1A1r6rxVP/ktPyq3JR3QF4cEzLZp+kOREWXvilhyTqAeH79AZde0kGLLJodp6AktkwiVXSluCg0tHmPOditgqu4bOmblXGwkTkxIsgExvsMIsOEVxgbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t7xiK6PeKs5xPBbhZTz8eNtT12S/o7Uwx5Un9Jm+bck=;
 b=JIsucPzgWm80VIpoSGKRnejFGOl3jP/lRgfTX0W42ZcxpCllE1lN8sz00NbE/fT1MER6bOsY6+pQ0usbEKG1c+whF3zeDxG3AJmfNZogXEublqbICBmLeA1d7cn7q9KY2qiyCvofmmQmUxme8VY2Al6SXDy2ybzlzaQP4rVnm8kRrgsOcMjdOXLsH3YGHSS+Hhk3YHS2yBcr9AnvhozTtJ98U2q5+6lb2Pzn2EGg48oaVdpkdQ4El3xPWkoCQ9gY47eSsU5P4CMzjMnKyFkeQVdPjvm7xLKcDgaHvPcnz+USiGCu5+do3n82xXV1lVVA8MpH/DTIJ8fsZsAshaqFuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t7xiK6PeKs5xPBbhZTz8eNtT12S/o7Uwx5Un9Jm+bck=;
 b=YvBnkFGuhlFDt7MD4WBBQDkYnNgvjrXnwOh/5oXmhVA50ErJqk8OW3qBMgnILJiWvYEMWLL6k7m/8sF1RaItISTebMhg38enAQEyuUpbjME27M8KrB5HDCvAGFEfLv1XrUFbeGJrZPRcJbqItuzUsjBz5PeE6KnlzEnTA5fFNgs=
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
	<roger.pau@citrix.com>, Stefano Stabellini <sstabellini@kernel.org>,
	"Bertrand Marquis" <bertrand.marquis@arm.com>, Jason Andryuk
	<jason.andryuk@amd.com>
Subject: [PATCH v4 05/13] x86/hyperlaunch: Add helpers to locate multiboot modules
Date: Thu, 17 Apr 2025 13:48:27 +0100
Message-ID: <20250417124844.11143-6-agarciav@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417124844.11143-1-agarciav@amd.com>
References: <20250417124844.11143-1-agarciav@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|LV3PR12MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: 238d86d0-85ed-4b63-deab-08dd7dae43fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700013|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TPWym8tWghJNn7u5VrAlE7czRNecaZSZxbjFfHDz/6FkdwsP6/xmIJStJ7HS?=
 =?us-ascii?Q?numC5JFQjPZH7LaS4QW+U6pETcGU+qm86T1ZDLqqYVy4xxOLXisEPO+wTOap?=
 =?us-ascii?Q?BYiZ1VdCVAB7RD2xYWj3b/y5Covq3fGkdXhDzZZiDX7vkSCODIDgXsniV3ho?=
 =?us-ascii?Q?znx5HI/h9gCvp7GS0gKkX864tvy5J7AeHEUUVQai+8OOBmUagmqbYuruyJA3?=
 =?us-ascii?Q?ReX5E0ZJLY+Y965ztUYh1ozlXJer5CFJIqmaHqZRpELVh8XwmZKg6RWngnlj?=
 =?us-ascii?Q?vWMi1z3oWDi/rIVDVdwHEAF7xsUU40LaHuHWwiNaiSx0m8lioIeiF6u5b4T3?=
 =?us-ascii?Q?eGNQCy5HhsmWuz2UOg9+AnXh9Yjbtl996oyx5hQTOc2jfXQnpMyQBbzEKWph?=
 =?us-ascii?Q?xI4XOYw7xady0VjsOB2lRtfWHTNwT6E8KeiW275qcdxPRmR/FTj+vj5oPkv0?=
 =?us-ascii?Q?6in1gL/eeeN6HiGyAJI72CTzETSIhB2ERjT1DIDf+HldfeRHfHukdXVzuaAL?=
 =?us-ascii?Q?WfXXoTx8SeuEMn/FjMm5cK1ESCeS9RyyP/UkbonLhkxozr10QR2kUBPqIaiV?=
 =?us-ascii?Q?EJOxH99kQGsZCCJS5P5HZovjWSkPLRUbvTKl0KWnznr8q7yVFv4auooxg72X?=
 =?us-ascii?Q?BN5gfBzEyjb6bCfXvpddia4mHGuiyqjcV18FvmSjcp+nB5528uG9f2Aa+eaA?=
 =?us-ascii?Q?hywyfTwYOaVqI0JTpaelPq6ulNtEV4E6vT5IMUB+UJAaIabPzuG1Toc0Qf6C?=
 =?us-ascii?Q?yBhIhqyD1zz1rml1CFjydHRvicxTbBCz3TuHklLXh1Kqamnn6UBzqwgbeBHn?=
 =?us-ascii?Q?8obLiUkIZ3336f5+MzsGiSOqz7L4elhdKf3Ot2lxBeNg15C6ICNI75VPUJoy?=
 =?us-ascii?Q?wIzMpj1zBmerVlC6OWzKwNSK52qlSj3c/09l3e/UvYkPlrQb3Zc4YZo6VG4P?=
 =?us-ascii?Q?NRwyp9S5Kwu1FeD3/PpiL32HyvWY6uwPQVwq37j6gd9Nx8rWEGObkK2AkTDl?=
 =?us-ascii?Q?FwIHQ6nHj11Mr/pZ1smpOssN/XeKLGaNB9e03C7Ynl8kHsLrCIMBCBQ4GWxc?=
 =?us-ascii?Q?k2kf0a5DOr6rmSmme+X12SUdnwg1SAayWjDrhMU9mTEA7ES6lOqhBIqQoBGA?=
 =?us-ascii?Q?nDyIC+jTsncj4zv0Ea/jCWnK+TlnD4GntwNJu1svjQ468brJ7KdwBE/y8LbF?=
 =?us-ascii?Q?vwiPeKDL0Phd/Q0QCz7jVnMbgwfnlKIULQBLjaZJ4o+oWUexou1db47Fe2KK?=
 =?us-ascii?Q?WXY+bchy67t7h5ZsHcOpgAsAog+rn2/Fj5iCJ4DPRKXAJ0hMgC8IQHYIKGfZ?=
 =?us-ascii?Q?f9HHh/M2zPm2sy15g10Qn8ucStTINtLcmRzgxhvyP3plpzLMlmy792FykT+Y?=
 =?us-ascii?Q?kj2x6Ms9ObpOAg4EW7y4SFXbDhPbAAIR0dmhPHaQJSI0tw9UOOkqVtF4L+6t?=
 =?us-ascii?Q?nEF1rEfTLVemYDr3rM1YFLv8RqST2MIhBo0hdztlyqyh8s7bT4qA649a+az+?=
 =?us-ascii?Q?Y/wy+S3p5ZYOHd7iNbhJw6xpfwAKjeHQoow6?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(1800799024)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:17.4206
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 238d86d0-85ed-4b63-deab-08dd7dae43fd
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9142

Hyperlaunch mandates either a reg or module-index DT prop on nodes that
contain `multiboot,module" under their "compatible" prop. This patch
introduces a helper to generically find such index, appending the module
to the list of modules if it wasn't already (i.e: because it's given via
the "reg" prop).

Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Remove stray reg prop parser in libfdt-xen.h.
  * Remove fdt32_as_uX accessors.
  * Brough fdt_prop_as_u32() accesor from later patches.
    * So it can be used in place of a hardcoded fdt32_as_u32().
  * Limited MAX_NR_BOOTMODS to INT_MAX.
  * Preserved BOOTMOD_XEN on module append logic.
  * Add missing bounds check to module-index parsed in multiboot module helper.
  * Converted idx variable to uint32_t for better bounds checking.
  * Braces from switch statement to conform to coding style.
  * Added missing XENLOG_X.
  * Print address_cells and size_cells on error parsing reg properties.
  * Added (transient) missing declaration for extern helper.
    * becomes static on the next patch.
---
 xen/common/domain-builder/fdt.c     | 162 ++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h     |   2 +
 xen/include/xen/domain-builder.h    |   3 +
 xen/include/xen/libfdt/libfdt-xen.h |  11 ++
 4 files changed, 178 insertions(+)

diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index b5ff8220da..d73536fed6 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -13,6 +13,168 @@
 
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
+    ret = read_fdt_prop_as_reg(prop, address_cells, size_cells, &addr, &size);
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
index 955aead497..8c98a256eb 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -2,6 +2,8 @@
 #ifndef __XEN_DOMAIN_BUILDER_FDT_H__
 #define __XEN_DOMAIN_BUILDER_FDT_H__
 
+#include <xen/libfdt/libfdt-xen.h>
+
 struct boot_info;
 
 /* hyperlaunch fdt is required to be module 0 */
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index ac2b84775d..ace6b6875b 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -5,5 +5,8 @@
 struct boot_info;
 
 void builder_init(struct boot_info *bi);
+int fdt_read_multiboot_module(const void *fdt, int node,
+                              int address_cells, int size_cells,
+                              struct boot_info *bi)
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
diff --git a/xen/include/xen/libfdt/libfdt-xen.h b/xen/include/xen/libfdt/libfdt-xen.h
index a5340bc9f4..deafb25d98 100644
--- a/xen/include/xen/libfdt/libfdt-xen.h
+++ b/xen/include/xen/libfdt/libfdt-xen.h
@@ -12,6 +12,17 @@
 #define LIBFDT_XEN_H
 
 #include <xen/libfdt/libfdt.h>
+#include <xen/errno.h>
+
+static inline int __init fdt_prop_as_u32(
+    const struct fdt_property *prop, uint32_t *val)
+{
+    if ( !prop || fdt32_to_cpu(prop->len) < sizeof(u32) )
+        return -EINVAL;
+
+    *val = fdt32_to_cpu(*(const fdt32_t *)prop->data);
+    return 0;
+}
 
 static inline int fdt_get_mem_rsv_paddr(const void *fdt, int n,
                                         paddr_t *address,
-- 
2.43.0


