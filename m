Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BA0A8119A
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:11:00 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942826.1341945 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXK-0000ND-Br; Tue, 08 Apr 2025 16:10:54 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942826.1341945; Tue, 08 Apr 2025 16:10:54 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BXK-0000KA-57; Tue, 08 Apr 2025 16:10:54 +0000
Received: by outflank-mailman (input) for mailman id 942826;
 Tue, 08 Apr 2025 16:10:52 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BW1-0002e3-3e
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:33 +0000
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on20602.outbound.protection.outlook.com
 [2a01:111:f403:2408::602])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d74ffb5b-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:26 +0200 (CEST)
Received: from BN9PR03CA0485.namprd03.prod.outlook.com (2603:10b6:408:130::10)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.21; Tue, 8 Apr
 2025 16:09:21 +0000
Received: from BL6PEPF00020E65.namprd04.prod.outlook.com
 (2603:10b6:408:130:cafe::69) by BN9PR03CA0485.outlook.office365.com
 (2603:10b6:408:130::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.28 via Frontend Transport; Tue,
 8 Apr 2025 16:09:21 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E65.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:21 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:19 -0500
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
X-Inumbo-ID: d74ffb5b-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhKWTPh5+j5ubY28Lc8y3jGM9Q0MXXLh54mpD5gHAMO0+i6MleGisXfDKlGgCf6AftSm9n1D4PCnTSAORjWATgLT1YV4XRTrNMYJ9ZjJPyaouGb1/xcx8PqIoGywNa2J4CKPk/mY5HFwaomZmqPZ+ofcmqTYrNhi3OtLZK1ek3XEwkSKOUbeOg5GyMzYfrVrtj0IP1hPvJ/A+iJs07VvXVChBJzDHjbQvjuduCY1dWLs3AY11GJJFM/afPON/oPPgt6j6SY12m4uoYWk3bRHeidmYeKYIgVq4irgsfrJdvfxsM0CVVqMoDG86fyoSmUUUS8FRdmAhnyGrifo52JDVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CdZjJno4ZP28T5tdzAN4JY6E44clyK3Mj7hHKvRrs5s=;
 b=lB7ZIj1ZIiXVAmchV7DjXZCmzB1VDTbIJhDqluy9kMKiRTdzvx5a/5KgQdE5XcYCskbzmADEP/+a8flGm6ArLBgOj6dPzyNwL6dDlO/co20ktRxkErKAeY0j6/PJrN0SOv+4QvfPl4xSzvKkYpR9iSd75eqCudLtHjMueX0UI7cFuTEWsuuXLGbtWKZK73u4ojRaDK4vI5w5TxloQhRdefhaGWACiHj0V8uRTcRHbO6p4GLCHMfbcnRY1a+bxpkb4JZDcsJ4qrOgLTdyTroFe99HxzKydwXnMBOUxzbKjBKuz8v6lsiWNkXhBztVw/q7Ze5lskQlse+zshZ4LiW1pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CdZjJno4ZP28T5tdzAN4JY6E44clyK3Mj7hHKvRrs5s=;
 b=dfwvcWzQDr/phsYUaUxulKPOYesaO0TXOMIIgcrA1B2aa952Ug7Dgjrvas5kVHoFEQ0qTVGlgwZi7IqmQMu0FAv6Odrjt7mXf3OeeU/8vgIoEK29M48iHn4DWQ/tztgoJSJUWZJ9Rot8lMv0INr5WoS5sfsEsiFUqV+eHS8nLuA=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Alejandro Vallejo <agarciav@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: "Daniel P. Smith" <dpsmith@apertussolutions.com>, Jason Andryuk
	<jason.andryuk@amd.com>, Xenia Ragiadakou <xenia.ragiadakou@amd.com>,
	"Stefano Stabellini" <sstabellini@kernel.org>, Michal Orzel
	<michal.orzel@amd.com>, "Jan Beulich" <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v3 16/16] x86/hyperlaunch: add capabilities to boot domain
Date: Tue, 8 Apr 2025 17:07:38 +0100
Message-ID: <20250408160802.49870-17-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E65:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: 5767b228-3ba6-4589-58cb-08dd76b7b929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rSS4UDZQQUy8bV8VFukunITNWbb0gAtrNnAustEYq+J9v26STnFrAGFdEgd0?=
 =?us-ascii?Q?zbIfM9PmKWjmaYbkm9PNTMWQ+PxDAwY2QPtxOM/JaGWtM+bIKAJaIDJkMjsf?=
 =?us-ascii?Q?RoBj6bDC/jHksj2wqNoU0XavYUNZDCRrAxG/gr2GML2n4+lZd0cC+O4b9tlv?=
 =?us-ascii?Q?Z4XXckAkuq+vfF8mj0Jizwzz4sqiiH3E61YZm7QQcpvMd5uiY7VmRohC6vq1?=
 =?us-ascii?Q?mzfN1Ghk1pqhlYK2T7LPY2fs+T1+i67Zg5CwOfPGHCUkaaEbEx7Nm/gdXAIT?=
 =?us-ascii?Q?t+NhR2D02T5GHdvs8QP3wdJPQmPwQs0ZMGQ1MMbI9T6AwX28XEeUoNTiPCKd?=
 =?us-ascii?Q?+yJW1ziZa9whe6zdK3l5gHlG33VU7EjPJ25DgcUQyMGNRoBmEYGHCJWcjOHo?=
 =?us-ascii?Q?txqFbJx6GTqjJuKfMC9Gqnx0CHR4rn+nQwWq0qf7e86WDia9fr/FLrjvgX5k?=
 =?us-ascii?Q?Fw9vhOTUFSgCw4bN0J+s0luY5GalJS+Ya9h2/8Bw3O53Oaylnb01V6pULQLS?=
 =?us-ascii?Q?KH9ilVoHbwE1OYP/n0N94Wdmasi3gP9H7MZzd4VQaisoABqr/d2LcQ5p8/b8?=
 =?us-ascii?Q?Qgyyvp6Q5jUCQm3g+7UICjLJgRo3a+/PYsQvmso9XXGtIV5LTy6vD1QblXZA?=
 =?us-ascii?Q?2mbjcRycpYPG/XLbdFkYxp26n5jhyHeLRTiMaYyt2aQyyE7SwHSe3CSAk0hA?=
 =?us-ascii?Q?Hlh8Jm3Ycnu9NahYn+ScFctD+eav+6m3g/BuG+3CyPxAA8LHXyIcP6Xp5YZc?=
 =?us-ascii?Q?1tpmqdVhSfmyWW4GtU+LcgjlbsOMA2Y9dmqrgLtb4NUCOeHxjnfp+19FGP3T?=
 =?us-ascii?Q?nAhD8LxmaYivOtknmTCup8YtI5f1Keo59y+xAHDSUFt4A9X+ZSA+gqLgedsc?=
 =?us-ascii?Q?dgw3G8TZeC0O5kGA3wXajM42O5JdF2pkmVICI9KTcRTrhkEsbGNQpO0PAX67?=
 =?us-ascii?Q?ssh8fqs4ZlhMxBqx4VeXAzOzxxh/PbN5K2Ed3hd/GXaNoAITghoszhXt4dg6?=
 =?us-ascii?Q?L9bHRpOGTjm7Ecuy6pqen7ulwNm1+oPkRb8pDuHMCGY0qT5XDn8ciuilIZYg?=
 =?us-ascii?Q?hOvop/vLh4h36Xl4N+8aA2RFRcmcu/UT8gnv0ynj77BATEpXIWD0VIE9HLSV?=
 =?us-ascii?Q?ObhYRY7J9N+O2ibPynW1LHxjrD0lKelm1LadlwuWEe6/zdQh804/w4KwZ5rA?=
 =?us-ascii?Q?MKK7TUlYtRGBYHca6u3anbo+fMQfgiC92sVvxxEqpAmCZYfj9gdNnjZRm78I?=
 =?us-ascii?Q?OcMqQ64cbNV+YqRjBoO653bBCP6thWo8vOuysPFsEcg5ij8scofpmJN3HQVM?=
 =?us-ascii?Q?T8aDh7gpoMAF9WjRw8yY8qbexUxJRZipOC/VHdjj26kl2g/lokiWwADE5rMu?=
 =?us-ascii?Q?1prTCAjWkDvpOcxyPrpsBm2L5J14Um7zKYebIbn+m1p5fLgY+O5Rm7jw9iMO?=
 =?us-ascii?Q?ZtyO+SvRIREneOv26hRiD9KP9U1DJ4NoA8CxaCeqfhCuoXfXrTgGYA7rUXlF?=
 =?us-ascii?Q?awQsa+KU/YKzoSZd7Px+MRM1WEqoeamdAKxY?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:21.3752
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5767b228-3ba6-4589-58cb-08dd76b7b929
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E65.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Introduce the ability to assign capabilities to a domain via its definition in
device tree. The first capability enabled to select is the control domain
capability. The capability property is a bitfield in both the device tree and
`struct boot_domain`.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/domain-builder/core.c     |  1 +
 xen/arch/x86/domain-builder/fdt.c      | 12 ++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  4 ++++
 xen/arch/x86/setup.c                   |  6 +++++-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain-builder/core.c b/xen/arch/x86/domain-builder/core.c
index 510a74a675..6ab4e6fe53 100644
--- a/xen/arch/x86/domain-builder/core.c
+++ b/xen/arch/x86/domain-builder/core.c
@@ -96,6 +96,7 @@ void __init builder_init(struct boot_info *bi)
         i = first_boot_module_index(bi, BOOTMOD_UNKNOWN);
         bi->mods[i].type = BOOTMOD_KERNEL;
         bi->domains[0].kernel = &bi->mods[i];
+        bi->domains[0].capabilities |= BUILD_CAPS_CONTROL;
         bi->nr_domains = 1;
     }
 }
diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 5fcb767bdd..dbfbcffb0a 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -257,6 +257,18 @@ static int __init process_domain_node(
             bd->max_vcpus = val;
             printk("  max vcpus: %d\n", bd->max_vcpus);
         }
+        else if ( strncmp(prop_name, "capabilities", name_len) == 0 )
+        {
+            if ( fdt_prop_as_u32(prop, &bd->capabilities) != 0 )
+            {
+                printk("  failed processing domain id for domain %s\n", name);
+                return -EINVAL;
+            }
+            printk("  caps: ");
+            if ( bd->capabilities & BUILD_CAPS_CONTROL )
+                printk("c");
+            printk("\n");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index 969c02a6ea..29a7d806de 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,10 @@
 struct boot_domain {
     domid_t domid;
 
+#define BUILD_CAPS_NONE          (0)
+#define BUILD_CAPS_CONTROL       (1 << 0)
+    uint32_t capabilities;
+
                                           /* On     | Off    */
 #define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
 #define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index 4127a0105d..7e1a26b4d2 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1006,6 +1006,7 @@ static struct domain *__init create_dom0(struct boot_info *bi)
 {
     char *cmdline = NULL;
     size_t cmdline_size;
+    unsigned int create_flags = 0;
     struct xen_domctl_createdomain dom0_cfg = {
         .flags = IS_ENABLED(CONFIG_TBOOT) ? XEN_DOMCTL_CDF_s3_integrity : 0,
         .max_evtchn_port = -1,
@@ -1037,7 +1038,10 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     if ( bd->domid == DOMID_INVALID )
         /* Create initial domain.  Not d0 for pvshim. */
         bd->domid = get_initial_domain_id();
-    d = domain_create(bd->domid, &dom0_cfg, pv_shim ? 0 : CDF_privileged);
+    if ( bd->capabilities & BUILD_CAPS_CONTROL )
+        create_flags |= CDF_privileged;
+    d = domain_create(bd->domid, &dom0_cfg,
+                      pv_shim ? 0 : create_flags);
     if ( IS_ERR(d) )
         panic("Error creating d%u: %ld\n", bd->domid, PTR_ERR(d));
 
-- 
2.43.0


