Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id DD80EA72A9A
	for <lists+xen-devel@lfdr.de>; Thu, 27 Mar 2025 08:33:57 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.928503.1331199 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhjr-0000P7-1p; Thu, 27 Mar 2025 07:33:19 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 928503.1331199; Thu, 27 Mar 2025 07:33:19 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1txhjq-0000LL-V6; Thu, 27 Mar 2025 07:33:18 +0000
Received: by outflank-mailman (input) for mailman id 928503;
 Thu, 27 Mar 2025 07:33:17 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=yP17=WO=amd.com=Jiqian.Chen@srs-se1.protection.inumbo.net>)
 id 1txhjp-0000Fj-BR
 for xen-devel@lists.xenproject.org; Thu, 27 Mar 2025 07:33:17 +0000
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on20604.outbound.protection.outlook.com
 [2a01:111:f403:2416::604])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id be1d85cd-0add-11f0-9ea3-5ba50f476ded;
 Thu, 27 Mar 2025 08:33:15 +0100 (CET)
Received: from MN2PR01CA0033.prod.exchangelabs.com (2603:10b6:208:10c::46) by
 CH2PR12MB9458.namprd12.prod.outlook.com (2603:10b6:610:280::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 07:33:09 +0000
Received: from BN1PEPF0000468D.namprd05.prod.outlook.com
 (2603:10b6:208:10c:cafe::65) by MN2PR01CA0033.outlook.office365.com
 (2603:10b6:208:10c::46) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.44 via Frontend Transport; Thu,
 27 Mar 2025 07:33:09 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF0000468D.mail.protection.outlook.com (10.167.243.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Thu, 27 Mar 2025 07:33:09 +0000
Received: from cjq-desktop.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 27 Mar
 2025 02:33:06 -0500
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
X-Inumbo-ID: be1d85cd-0add-11f0-9ea3-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PrkZ5rtaQYPOkXazyOx7HVqYP7AHFA22RxrVIQ4l7/xbPVh5mrEScGU9GuB+dUohEMwoz1QqVuxcG8nc4uHwVaoc0WSSTGqjdhukHaj5m0uWjFjeLiyfXHCxgy3YmrnVANUrkHCKXHhr1Naf8XZAM6Vo0NWXwE5GcX7yRiKSarZBWLurKcN+w9wIl5JCz+VD4+mwF2qsS8JcHmQtOp2A0K2S7ufDBZjgHvkKek7t6Um0SpuzJT9LtN4LGC4cxWXhgphQC/b4+lnwqOaFRsMMzpeKCm4f1L/19GX9Y9MyyNdSKo2AMxXeCJdxIV8K3ooW7EhRtb9y+tu2qqmwWEkFMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2cAiSPXd5IpHe1VtFA4KM/bCR2mfqDwXwqIn1xoTx/k=;
 b=nDtLKm01L4lqUdOhU9ughgMYrTIedJ4/ZL5PaqXmaNDTfk3QTiaQHdS+xLGBJGnR6ElkqmQXybfIN8eqV6G0SCtj0vK7g78kZ7mBIvIN/Ym3+bX7NNjyAS7N1GNIjCmhJO8rLRXSHoRxIGHBHmBMK7LGo9+1odxdeRsfwpjb6mjCXcSbT04iN9M6HqqlYs9NOxLgrQqyg4KwmwWLDhe3HxUBy/lphJO7iVTFPQSEXxha5MRMZ1UG2xwrRsBya52YuhBEnGNtt5e44OLo3OPSdCd0szPXMAH6WL0dUWpZ9BxeyE2IMBmekNgH20Mt/R9andw0itlU8UL6D/n9vxwTqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2cAiSPXd5IpHe1VtFA4KM/bCR2mfqDwXwqIn1xoTx/k=;
 b=yfh5g6wSfWZtUkKus46YMOO75bKDIcyv8pBvhF5Ut+/2V6Xr0az7S+EWrRLazjgN8sZKfxN1thDtrPPwc3tBycEqYfryfjw0X5LgzQZqx/sALQwDSHBbkj6oTXZ6G5XCHOU3VwvRYAZCUEABieOJFGUQaP3pMyraJJm8/K9jA+M=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Jiqian Chen <Jiqian.Chen@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, Huang Rui
	<ray.huang@amd.com>, Jiqian Chen <Jiqian.Chen@amd.com>
Subject: [PATCH v1 2/3] vpci/rebar: Remove registers when init_rebar() fails
Date: Thu, 27 Mar 2025 15:32:13 +0800
Message-ID: <20250327073214.158210-2-Jiqian.Chen@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327073214.158210-1-Jiqian.Chen@amd.com>
References: <20250327073214.158210-1-Jiqian.Chen@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF0000468D:EE_|CH2PR12MB9458:EE_
X-MS-Office365-Filtering-Correlation-Id: 81015b23-9dec-479c-a2f8-08dd6d019f90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FU0YmON7BM0IpiQoghMKL9ySxL93wS6Oi65SHPz/QVx93SN1eukjyb0ysY6B?=
 =?us-ascii?Q?nqPrZzkY92X+BCefF8LwDZJmx2vIfCMAvbOPVpQxLyYmhjtsqkbn6EWbgiSS?=
 =?us-ascii?Q?SXC3YCQMxoC8NFsY9bNcj+Sh34o5RMRwUSEZ+2pkx/9uZ/hB+ix0ts15AUPl?=
 =?us-ascii?Q?JScObFOZYf7bFm50RnqTXU8dtzVCAA4J+sVpYUgYcMNdB8omLUUi1Y5ygel0?=
 =?us-ascii?Q?uR5VfaFY3E7LrvS3pbK8oMiXKRuMRVporLvCo/MTrhd7rIdQyKd5yLx9F6Rj?=
 =?us-ascii?Q?2wjIdPsC3TOqF+WaMt1/n2qt1gjHIoi4alEkK7FByxiATe91okEBRozhdP2M?=
 =?us-ascii?Q?9sZEqMm5LMOoeTmOAt9Dq6KbOGODPWf4nTgVXWS6pbrZFmPVXE5inlYksUsm?=
 =?us-ascii?Q?4hEKux7G//EYnOPAwZxaS4mUlh6rIRagWTdb3mMHqj6/S8Mo0dXwhclLdqfA?=
 =?us-ascii?Q?XThFGnHaU7uywJy0DieU3CUV+KiuZ5XtJ3Tj/OhIUVGom6zx7+PxEFfVoGLc?=
 =?us-ascii?Q?+xCweM1nH+GbbmOXtn7z/+c/pWt5vbBk600AY+rJNQHh5z9qaAi3w5SVDpZd?=
 =?us-ascii?Q?LmEKvDIh8xcmL61c/RU+qNTnmX/KK1i64q0Knrtv5C9jBcHUUa87EEr9g6uR?=
 =?us-ascii?Q?Yib/EQw6qg+wvbiBZrstASK9YY02qVyrCpTccLxZ+ujEc1aBjorjbfTSGQB9?=
 =?us-ascii?Q?E7t2YQI3ZNA23rxoCGWveMHvlkoHaN6IkpfRD9ufVWxQj5O7l3UXb3jCnVV1?=
 =?us-ascii?Q?cjc38PQUYPDamrjiMzpuBvwUmFYZ49BkpRPSCyQpDivtmOt4JIihAKF8MIDn?=
 =?us-ascii?Q?yc1xTs98HUJvlRM2OaGVdgKEoK7zkFotZaCrsYyILJWPNGs9mIqQwvBbVYxi?=
 =?us-ascii?Q?YwJdepC+Rg49QbqBbH/bU4Wh4T1KlaZpWldM3dm0hTiaATzfRyj6P3Nc6mn7?=
 =?us-ascii?Q?988zKSnN51QZsarPcpK/6WPC+AsSjJDy2UvLtuYGls+H160IHyueMOT52D9Q?=
 =?us-ascii?Q?OmlAWH3CDPuwjVdoMCf/FArw1cpepr7SoH9raAbqPhj29imQckxrTT8Vh/O2?=
 =?us-ascii?Q?OZXC0iGnEzi/TnlzS/u/WWDz5t8hy/nY4W1tHDNhpqkPNkSvYueAoktrWngJ?=
 =?us-ascii?Q?/8jLKuOx/1poofyI/XTf0SjXASLoGrZlzNIKbjhb79nr1rjL9OpJMoOJ19fj?=
 =?us-ascii?Q?AhyeSdHzKIJP8+0GDb2tiiizVtcIG03j+GeBgDABExPr71sfsalEYNDUvigp?=
 =?us-ascii?Q?oSdgc2rJOfdeqQnNd9YsFcu8fjm+Az7VgKAr5iEnaYTHU5pghLW3I2fHfU9u?=
 =?us-ascii?Q?QkiJhYJg38KuT7A5VSE2XZnskwunNT9VFaYEUQmecTQCP40YaTPX5MCXp3Np?=
 =?us-ascii?Q?MaDGHTkI6nLB1AG3WcI46KDkEok9gECTAR4leIEWCezK9Q1/tqx9PuoLU/L3?=
 =?us-ascii?Q?6mmrJoBizR8WlHoHuuUeFZUph+9Jo329ugsqDIpVFqU9Y3EK3d+SEQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 07:33:09.5502
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81015b23-9dec-479c-a2f8-08dd6d019f90
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF0000468D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9458

When init_rebar() fails, the new codes will try to hide Rebar
capability, so it can't rely on vpci_deassign_device() to remove
all Rebar related registers anymore, those registers must be
cleaned up in failure path of init_rebar.

To do that, use a vpci_register array to record all Rebar registers
and call vpci_remove_register() to remove registers.

Signed-off-by: Jiqian Chen <Jiqian.Chen@amd.com>
---
 xen/drivers/vpci/rebar.c | 33 ++++++++++++++++++++-------------
 xen/drivers/vpci/vpci.c  | 14 --------------
 xen/include/xen/vpci.h   | 15 +++++++++++++++
 3 files changed, 35 insertions(+), 27 deletions(-)

diff --git a/xen/drivers/vpci/rebar.c b/xen/drivers/vpci/rebar.c
index 7c53ee031887..5f2f9978feb9 100644
--- a/xen/drivers/vpci/rebar.c
+++ b/xen/drivers/vpci/rebar.c
@@ -51,8 +51,11 @@ static void cf_check rebar_ctrl_write(const struct pci_dev *pdev,
 
 static int cf_check init_rebar(struct pci_dev *pdev)
 {
+    int rc = 0;
     uint32_t ctrl;
     unsigned int nbars;
+    unsigned int reg_index = 0;
+    struct vpci_register registers[VPCI_CAP_MAX_REGISTER];
     unsigned int rebar_offset = pci_find_ext_capability(pdev->sbdf,
                                                         PCI_EXT_CAP_ID_REBAR);
 
@@ -70,17 +73,17 @@ static int cf_check init_rebar(struct pci_dev *pdev)
     nbars = MASK_EXTR(ctrl, PCI_REBAR_CTRL_NBAR_MASK);
     for ( unsigned int i = 0; i < nbars; i++ )
     {
-        int rc;
+        const unsigned int offset = rebar_offset + PCI_REBAR_CTRL(i);
         struct vpci_bar *bar;
         unsigned int index;
 
-        ctrl = pci_conf_read32(pdev->sbdf, rebar_offset + PCI_REBAR_CTRL(i));
+        ctrl = pci_conf_read32(pdev->sbdf, offset);
         index = ctrl & PCI_REBAR_CTRL_BAR_IDX;
         if ( index >= PCI_HEADER_NORMAL_NR_BARS )
         {
             printk(XENLOG_ERR "%pd %pp: too big BAR number %u in REBAR_CTRL\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            goto fail;
         }
 
         bar = &pdev->vpci->header.bars[index];
@@ -88,24 +91,19 @@ static int cf_check init_rebar(struct pci_dev *pdev)
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u is not in memory space\n",
                    pdev->domain, &pdev->sbdf, index);
-            continue;
+            goto fail;
         }
 
         rc = vpci_add_register(pdev->vpci, vpci_hw_read32, rebar_ctrl_write,
-                               rebar_offset + PCI_REBAR_CTRL(i), 4, bar);
+                               offset, 4, bar);
         if ( rc )
         {
             printk(XENLOG_ERR "%pd %pp: BAR%u fail to add reg of REBAR_CTRL rc=%d\n",
                    pdev->domain, &pdev->sbdf, index, rc);
-            /*
-             * Ideally we would hide the ReBar capability on error, but code
-             * for doing so still needs to be written. Use continue instead
-             * to keep any already setup register hooks, as returning an
-             * error will cause the hardware domain to get unmediated access
-             * to all device registers.
-             */
-            continue;
+            goto fail;
         }
+        registers[reg_index].offset = offset;
+        registers[reg_index++].size = 4;
 
         bar->resizable_sizes =
             MASK_EXTR(pci_conf_read32(pdev->sbdf,
@@ -117,6 +115,15 @@ static int cf_check init_rebar(struct pci_dev *pdev)
     }
 
     return 0;
+
+ fail:
+    for ( unsigned int i = 0; i < reg_index; i++ )
+        if ( vpci_remove_register(pdev->vpci,
+                                  registers[i].offset,
+                                  registers[i].size) )
+            continue;
+
+    return rc;
 }
 REGISTER_VPCI_EXTEND_CAP(PCI_EXT_CAP_ID_REBAR, init_rebar, VPCI_PRIORITY_LOW);
 
diff --git a/xen/drivers/vpci/vpci.c b/xen/drivers/vpci/vpci.c
index a8362e46e097..ea81d8cc9604 100644
--- a/xen/drivers/vpci/vpci.c
+++ b/xen/drivers/vpci/vpci.c
@@ -21,20 +21,6 @@
 #include <xen/vpci.h>
 #include <xen/vmap.h>
 
-/* Internal struct to store the emulated PCI registers. */
-struct vpci_register {
-    vpci_read_t *read;
-    vpci_write_t *write;
-    unsigned int size;
-    unsigned int offset;
-    void *private;
-    struct list_head node;
-    uint32_t ro_mask;
-    uint32_t rw1c_mask;
-    uint32_t rsvdp_mask;
-    uint32_t rsvdz_mask;
-};
-
 #ifdef __XEN__
 extern vpci_capability_t *const __start_vpci_array[];
 extern vpci_capability_t *const __end_vpci_array[];
diff --git a/xen/include/xen/vpci.h b/xen/include/xen/vpci.h
index fa13397ae409..19a036c22165 100644
--- a/xen/include/xen/vpci.h
+++ b/xen/include/xen/vpci.h
@@ -214,6 +214,21 @@ struct vpci_vcpu {
     bool rom_only : 1;
 };
 
+#define VPCI_CAP_MAX_REGISTER 10
+
+struct vpci_register {
+    vpci_read_t *read;
+    vpci_write_t *write;
+    unsigned int size;
+    unsigned int offset;
+    void *private;
+    struct list_head node;
+    uint32_t ro_mask;
+    uint32_t rw1c_mask;
+    uint32_t rsvdp_mask;
+    uint32_t rsvdz_mask;
+};
+
 #ifdef __XEN__
 void vpci_dump_msi(void);
 
-- 
2.34.1


