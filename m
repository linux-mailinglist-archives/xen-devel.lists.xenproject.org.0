Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 684C4A91CD5
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:40 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957517.1350669 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgJ-0006Mj-DT; Thu, 17 Apr 2025 12:49:27 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957517.1350669; Thu, 17 Apr 2025 12:49:27 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgJ-0006Gc-6r; Thu, 17 Apr 2025 12:49:27 +0000
Received: by outflank-mailman (input) for mailman id 957517;
 Thu, 17 Apr 2025 12:49:25 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgH-0004z9-2N
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:25 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20600.outbound.protection.outlook.com
 [2a01:111:f403:2414::600])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 62de663e-1b8a-11f0-9eb0-5ba50f476ded;
 Thu, 17 Apr 2025 14:49:24 +0200 (CEST)
Received: from CH2PR05CA0040.namprd05.prod.outlook.com (2603:10b6:610:38::17)
 by SA1PR12MB7174.namprd12.prod.outlook.com (2603:10b6:806:2b1::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.31; Thu, 17 Apr
 2025 12:49:19 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:38:cafe::73) by CH2PR05CA0040.outlook.office365.com
 (2603:10b6:610:38::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.12 via Frontend Transport; Thu,
 17 Apr 2025 12:49:19 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:18 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:17 -0500
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
X-Inumbo-ID: 62de663e-1b8a-11f0-9eb0-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZWnFNfdT1+KSaegWPA4BR98UyXmp7yQQ3XDi9QhcCaMpupXvkEnAzPtSat4P10cbL6EYfsZwGZd+qz6DmYZhERrk+GY2wBoO/ZD8FttzbuEFEY2cF5iXZIDtcBdNUeYM05LyejFKbPft8+LfGiWaQ+8cm2v2D97H1A+lGsacrwu0kJooh9MNMLdlOzuFTKoxWx02hk/MUaXDwzVR3wLh6JfriW8RiGgRLrv7w8FdBdmkwFZxd8RmKZ+lx/txHvQw7oo3J8RATu+O8Qf3YRolawDgejlPLyl9wvTgaRACJSJjb1ldTVGcSDw5NgZF8KR4wsTEMpTf/hg06pH+kImS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vfgmq0mrmtOhob94RrCghd2dAPQaF9U03DWaQIZKTC0=;
 b=SqBCNc6gdfdbAfhpOky+fqPQgZJEkssNiJUYIaXdQZNQ00qhvVj/KH8rRJELTa7jkp7aZtaOET7GfYJKa/pwAVpBRz/XgenotteMBjQ/3scheWt3+3R2YLwjPpJkJKskaVmu/25+EVPqqtNyUV2SRfAIjvmDLdBxzRGQPKrNYRb5nojGCZtzsrmtprJslQojVCqEVoWBxpDZ0DkBls44v0zgYj0aijtC8omFUmf1FDKuzED48XeKt8qYQz8I2IDlamlqL+eMz6eqUAz9rstrpEDp1TYAMLwVh3IJBOohb+gydKmEByF/ufZlZy2neleCQ+qOJ9B6uQv1J28CORzrzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vfgmq0mrmtOhob94RrCghd2dAPQaF9U03DWaQIZKTC0=;
 b=UCcEQrGUe5fXQGMbqOgYZ7CwqSNJ++WwWGFPQ2QrHrXzm8BQTB7T9brN/9jUb/LGc01Y/A+LkzTuwodJoEqVyw/79HGmBZnhHvoXZx2dRd7PhYVaggwUAIJttGkcfVaJ2DElYeTLeknrNjdGxUtnHjrT5mRAZC3dzBsN65jv1TY=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jan Beulich
	<jbeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Michal Orzel <michal.orzel@amd.com>, "Julien
 Grall" <julien@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, "Jason
 Andryuk" <jason.andryuk@amd.com>, Alejandro Vallejo <agarciav@amd.com>
Subject: [PATCH v4 06/13] x86/hyperlaunch: locate dom0 kernel with hyperlaunch
Date: Thu, 17 Apr 2025 13:48:28 +0100
Message-ID: <20250417124844.11143-7-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|SA1PR12MB7174:EE_
X-MS-Office365-Filtering-Correlation-Id: 7bc230de-9344-4fb0-8b7e-08dd7dae44e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?74uUej/9hen3CFr4c6NUSd96gybXUWMQtWIc9CVqtWKfysTMBAHrpbB2hVcc?=
 =?us-ascii?Q?1YWORLNVLr1W5LXdaNbaxK6lXetIngitKqHR/Ih3jeOV5cRmGFZMzAiXwq3x?=
 =?us-ascii?Q?nsNp10VGsjFQhm7XZw2jPybwUhMHyMuVXnZJ+l+hYiJE/F0uUw2kZU2VqVPs?=
 =?us-ascii?Q?p/h0i1avItZGBZZB/2kIOiedPFP7gjYVNBXu9lJchZJZEcTX8FR+r3wMhwQQ?=
 =?us-ascii?Q?lW9YZHZQT0QUbtXkSpnBQZr79QpQ49IuEfU6FNsrcqfeGyzMTDDMFOsFgDtq?=
 =?us-ascii?Q?64XVykwzPIIpMwL2f5r7xJKc36Yy845uNzu77qYsCgL8QXvAcPzK3UR7Atw4?=
 =?us-ascii?Q?IK37wmElEFrEBcVLmtp22FT8z+hDOJtNWFuQz14b8wDmH/hE6Bhmn2dUgUOr?=
 =?us-ascii?Q?T6VUOc4PaitIdHnFJyM57Ebuy6NuQ6Mp7B3sDeaEoHo5UHZgkpWOED5pN4tK?=
 =?us-ascii?Q?PnDpfhGJkC4192FFsqV+4yDupOwWE7ayoIZ9LdwNpbf4yDpHTVM4hIWJbSPK?=
 =?us-ascii?Q?c/f9VWeu+ZiuhLwMv1CdpWaz27o+PUZ9fk6df7gIaXYh7YFQsL8E66DRXCoW?=
 =?us-ascii?Q?NRxwgxDbg0wQ3yZQNRxlRv7OPrgyEHzjBKQw+x0tXrxcXSeakizZymmTlhjm?=
 =?us-ascii?Q?FOOdItFvM5DiDAdbTtXTCOSFEv+rBEAgpr/NdoIw/iWktatVw2vA4k5ECMqd?=
 =?us-ascii?Q?f3oOCNwPYpo2Xd2G5wmU1Inr9qv0sdrk7v/Fv/oRGAiFN1tl179QGjSJl3hA?=
 =?us-ascii?Q?a8esEnLZZUX4UJhJDw8Af6oNx5uRqABO5usYTO04CI60z8oeABhKlor7f7a0?=
 =?us-ascii?Q?FfqskpxzRzgt3homkYeHufMsq1G61qe6c/9MTzV3j+u4uD6XIeXkQM7OYgIL?=
 =?us-ascii?Q?MRGv7L3lGalmP0RYE5fLchXrb5UeSMOIRgC5I0Sna0BQME0y7DVnbNcvvGCv?=
 =?us-ascii?Q?sH/teV6Q0tKyv3gFN/wVlHupo/5BMnhapJ1+pnQDvUOys75qdDSqsfjfxnF3?=
 =?us-ascii?Q?WpfU5SO98Koe69+dHC4LSqJ8nTg+5OEqjoe7oWz6Kjqc090v7nZb6ez9UX3x?=
 =?us-ascii?Q?mJxw+eUBbJZWnvrtF6Eeb0r4t2XdI/ahUC0Qd6H9IV/SWQbek1mUMC1pQO9x?=
 =?us-ascii?Q?fZy1F0/tc24ven/bVQZGa2GwI0grGl90zWbuCi0xjaneI078/hTlNH+tEZ4A?=
 =?us-ascii?Q?wShFTAB1f6ki8MZoyS/NsOL7rIeWe3NmTZyKiMeHqfUBtr7Yhqv81dVjzRHO?=
 =?us-ascii?Q?dTcQhgp9b0hja/SPDcykvR4FwxcbfVzkc8mC9I8jRIq1wKzyPB4iPabqSCf7?=
 =?us-ascii?Q?HfK1gtEYfZi7Yl+dUxRlJFR9xbspwO9o0MYle6QPSRhXUi0ySAH/lUEXoB6k?=
 =?us-ascii?Q?TSrfNYHT87kwbfZ78ptHD9NUyLgwOJ2ym6BYaukbiYcpOnv3c4FeHb4ReN7G?=
 =?us-ascii?Q?EJRuCnObBXExzYM7YosSJlmSYCHEgz/XBz0yHKnwagqofab61fYyHVSt2NCR?=
 =?us-ascii?Q?NsiP9/Rd6GhxCEzbWlZ66wz7AA6Jvj3os7LL?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:18.9377
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc230de-9344-4fb0-8b7e-08dd7dae44e3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7174

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Look for a subnode of type `multiboot,kernel` within a domain node. If
found, locate it using the multiboot module helper to generically ensure
it lives in the module list. If the bootargs property is present and
there was not an MB1 string, then use the command line from the device
tree definition.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * Stop printing on the fallback path of builder_init().
    It's in fact the most common path and just adds noise.
  * Add missing XENLOG_X.
  * Simplified check to log error on nr_domains != 1.
  * s/XENLOG_ERR/XENLOG_WARNING/ on duplicate kernel.
  * Turned foo == 0 into !foo in the "multiboot,kernel" check
---
 xen/arch/x86/setup.c             |  5 ---
 xen/common/domain-builder/core.c |  9 +++++
 xen/common/domain-builder/fdt.c  | 64 ++++++++++++++++++++++++++++++--
 xen/include/xen/domain-builder.h |  3 --
 4 files changed, 70 insertions(+), 11 deletions(-)

diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index ccc57cc70a..4f669f3c60 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1285,11 +1285,6 @@ void asmlinkage __init noreturn __start_xen(void)
 
     builder_init(bi);
 
-    /* Find first unknown boot module to use as dom0 kernel */
-    i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
-    bi->mods[i].type = BOOTMOD_KERNEL;
-    bi->domains[0].kernel = &bi->mods[i];
-
     if ( pvh_boot )
     {
         /* pvh_init() already filled in e820_raw */
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index 3b062e85ec..924cb495a3 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -54,6 +54,15 @@ void __init builder_init(struct boot_info *bi)
 
         printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains);
     }
+    else
+    {
+        /* Find first unknown boot module to use as dom0 kernel */
+        unsigned int i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
+
+        bi->mods[i].type = BOOTMOD_KERNEL;
+        bi->domains[0].kernel = &bi->mods[i];
+        bi->nr_domains = 1;
+    }
 }
 
 /*
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index d73536fed6..1fae6add3b 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -89,9 +89,9 @@ static int __init read_fdt_prop_as_reg(const struct fdt_property *prop,
  * @return              -EINVAL on malformed nodes, otherwise
  *                      index inside `bi->mods`
  */
-int __init fdt_read_multiboot_module(const void *fdt, int node,
-                                     int address_cells, int size_cells,
-                                     struct boot_info *bi)
+static int __init fdt_read_multiboot_module(const void *fdt, int node,
+                                            int address_cells, int size_cells,
+                                            struct boot_info *bi)
 {
     const struct fdt_property *prop;
     uint64_t addr, size;
@@ -175,6 +175,52 @@ int __init fdt_read_multiboot_module(const void *fdt, int node,
     return idx;
 }
 
+static int __init process_domain_node(
+    struct boot_info *bi, const void *fdt, int dom_node)
+{
+    int node;
+    struct boot_domain *bd = &bi->domains[bi->nr_domains];
+    const char *name = fdt_get_name(fdt, dom_node, NULL) ?: "unknown";
+    int address_cells = fdt_address_cells(fdt, dom_node);
+    int size_cells = fdt_size_cells(fdt, dom_node);
+
+    fdt_for_each_subnode(node, fdt, dom_node)
+    {
+        if ( !fdt_node_check_compatible(fdt, node, "multiboot,kernel") )
+        {
+            int idx;
+
+            if ( bd->kernel )
+            {
+                printk(XENLOG_WARNING
+                       "  duplicate kernel for domain %s\n", name);
+                continue;
+            }
+
+            idx = fdt_read_multiboot_module(fdt, node, address_cells,
+                                            size_cells, bi);
+            if ( idx < 0 )
+            {
+                printk(XENLOG_ERR
+                       "  failed processing kernel for domain %s\n", name);
+                return idx;
+            }
+
+            printk(XENLOG_INFO "  kernel: multiboot-index=%d\n", idx);
+            bi->mods[idx].type = BOOTMOD_KERNEL;
+            bd->kernel = &bi->mods[idx];
+        }
+    }
+
+    if ( !bd->kernel )
+    {
+        printk(XENLOG_ERR "error: no kernel assigned to domain\n");
+        return -ENODATA;
+    }
+
+    return 0;
+}
+
 static int __init find_hyperlaunch_node(const void *fdt)
 {
     int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
@@ -237,8 +283,20 @@ int __init walk_hyperlaunch_fdt(struct boot_info *bi)
 
     fdt_for_each_subnode(node, fdt, hv_node)
     {
+        if ( bi->nr_domains >= MAX_NR_BOOTDOMS )
+        {
+            printk(XENLOG_WARNING "warning: only creating first %u domains\n",
+                   MAX_NR_BOOTDOMS);
+            break;
+        }
+
         if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+        {
+            if ( (ret = process_domain_node(bi, fdt, node)) < 0 )
+                break;
+
             bi->nr_domains++;
+        }
     }
 
     /* Until multi-domain construction is added, throw an error */
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index ace6b6875b..ac2b84775d 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -5,8 +5,5 @@
 struct boot_info;
 
 void builder_init(struct boot_info *bi);
-int fdt_read_multiboot_module(const void *fdt, int node,
-                              int address_cells, int size_cells,
-                              struct boot_info *bi)
 
 #endif /* __XEN_DOMAIN_BUILDER_H__ */
-- 
2.43.0


