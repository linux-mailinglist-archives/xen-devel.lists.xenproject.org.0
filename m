Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 137A4A81194
	for <lists+xen-devel@lfdr.de>; Tue,  8 Apr 2025 18:10:46 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.942790.1341916 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BX4-00074s-5y; Tue, 08 Apr 2025 16:10:38 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 942790.1341916; Tue, 08 Apr 2025 16:10:38 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u2BX4-00072D-1R; Tue, 08 Apr 2025 16:10:38 +0000
Received: by outflank-mailman (input) for mailman id 942790;
 Tue, 08 Apr 2025 16:10:36 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2sbj=W2=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u2BVv-0002e3-35
 for xen-devel@lists.xenproject.org; Tue, 08 Apr 2025 16:09:27 +0000
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2060f.outbound.protection.outlook.com
 [2a01:111:f403:240a::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id d3aba9fb-1493-11f0-9ffb-bf95429c2676;
 Tue, 08 Apr 2025 18:09:20 +0200 (CEST)
Received: from BN9PR03CA0530.namprd03.prod.outlook.com (2603:10b6:408:131::25)
 by DS0PR12MB7803.namprd12.prod.outlook.com (2603:10b6:8:144::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.32; Tue, 8 Apr
 2025 16:09:17 +0000
Received: from BL6PEPF00020E66.namprd04.prod.outlook.com
 (2603:10b6:408:131:cafe::3a) by BN9PR03CA0530.outlook.office365.com
 (2603:10b6:408:131::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8606.35 via Frontend Transport; Tue,
 8 Apr 2025 16:09:16 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BL6PEPF00020E66.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8606.22 via Frontend Transport; Tue, 8 Apr 2025 16:09:16 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 8 Apr
 2025 11:09:15 -0500
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
X-Inumbo-ID: d3aba9fb-1493-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdCaeadaga/CoZqVYEn2x44Nm2wo/heEarKxYfLnGBTe4PrBB6wh81fP9+N44+AIWW9Q3cvAwugTA+lQ3c69js0Rfy6QdnNj5baQY984UzZE9kl4lb0i5e7X8kdo8G5j1MTnNEoMAAFOYnSFRITXVc2FroA4Hk24jnzga685MmjXFX61q9EWOhiTAaz3yrqZRiG4k8BqAhasrehjyiwO/Er/grvy97ypeP0sOerVqnj8h2w567l26Yj/M9dJeLkmJx97evtn1CYSEXWO3iL8ryKB7utk8hWiUXTuwmLiS5Ywv+yHE4U6TyeeZJzvg8QDPppFL5XirnkDPJnZgTJ1ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YUHvqkyFXiMT58qSmIkpj+5p58vEJmweFPsH29sLZII=;
 b=kvewH/UVjnHvrIc3xwGpQSYltAWVIASMD0gSutvusu/PygvN41zAmnQ4mVbVYLN4L6AK2Wnfef6jU7YUlv4NzBX6zEGo14RC41jZdInSl1VacdAlEpBPzyRR5ONMArQpDcZ8mCIjko3eQy3qVG8bVbkR+lHEVs7z0Qtqzru9QdXfgLAcb3pWJkJfnzkQm3b+JZMz/Il0o20/8URWP7qSkymEEKnf51cFGwgTiQsQDcJIV1I52yrZEtF6dhLB/uJib87XKpLW6xsCKB+gJ5HqYmWI7SJF5k1kRJ5hPItvfJX3xTh8+VDFZpYtRw8Neu+TvFZrgInshTXQ1SUp3sqvCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YUHvqkyFXiMT58qSmIkpj+5p58vEJmweFPsH29sLZII=;
 b=CJFCpZEe3tpyhi8zcIzC/HIal2qpTN7srcYFkxcHAlJqQ3rn48oxZFjrYyHPxPBpLT9v7iW4Sofbfkng3ZzS4R/w4mbMEy8ftqQZ/AGRpPsthAURmJ0+22vws7GyC8EdAJFGn4ZB/4C3HBJXCCyIqIvgsFyuUr5YV4lo5aYc/VI=
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
Subject: [PATCH v3 13/16] x86/hyperlaunch: specify dom0 mode with device tree
Date: Tue, 8 Apr 2025 17:07:35 +0100
Message-ID: <20250408160802.49870-14-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E66:EE_|DS0PR12MB7803:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad9f13a-63f9-4287-67a9-08dd76b7b677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7VAA3jQoTbS6bbrurXBzprDBoFkXAxuDClcJM95BAJUpp9g3goJ2YIbZzptt?=
 =?us-ascii?Q?Ofqdz69gUoejsyDZtTXVemgNDrR1zbTvK0xFHDBkO5dkWs0DcoUVueojFyBo?=
 =?us-ascii?Q?bYRmc021SRZYDgMYMHx+xEqKWY4Eb9vyUvMeGWU+WluP2uRVH+fjv+PMlFOF?=
 =?us-ascii?Q?UpOphzTZ6Qj6paAnRO96KMtvii1IfKe534IB+agZPY6Qx9AN5YHqw7LcEc/5?=
 =?us-ascii?Q?gpnAi428H6XkUnPUJkDb1bgUBsdo1w3jOCGLXyCTiPKkwxQwwtEF77EW5XKk?=
 =?us-ascii?Q?5Kdilue5YXApL1TTeOlHCvpTfp2SAPHRSPO7cOHTLEI9O4xPXKmIC2RcyrWA?=
 =?us-ascii?Q?nwA8u2E8q8FPKI599BlTQGE37lBa4Z8FIRzedzvt1XNYbUGyEQfwBGYXYpOU?=
 =?us-ascii?Q?7t6J3+FEGGinKIzuIIK+B9lTUs0pXNDsYsMZpvgvgg/pFo/tSXigt5GUzT6J?=
 =?us-ascii?Q?V9+M1Aq8qFXgJkJjdxrW4+HnMnVPo7Fxnhx0ZsN+ZJq9HsjRt110IVuGN0Xw?=
 =?us-ascii?Q?DahuFe/vHA/nvDN1P63nkjXBv1yluDJWMi40yWwgKb30AL0NTyVsO8GdBSn6?=
 =?us-ascii?Q?upVHb1Fo0Y7jnBw3pamYhBKp8VhaJ46rt0etntpEis8C9/ey7NR1Ve8Fwuaf?=
 =?us-ascii?Q?MjqaznTByLJdL8ks1yK37/lDxiWK/GRkU4sVaUinXqE4GEFd2L/31GvEqc9V?=
 =?us-ascii?Q?gqCuLBR1n9pd2eNoJITeqQJhb5ZQ4TyAaYLoqbgVRWY011F5fhxRFM7HoA1W?=
 =?us-ascii?Q?WRDZjAyd++jr1E/MLfFkwIs3zTxG9yR4pLbzxsn4pl93XqIy2MTbgabb2rgE?=
 =?us-ascii?Q?soh9TPjoA/Fe/yA0l6JCWek0NQLW6fAiph7XAOqluBLfrcsNEOI8gEeclG7e?=
 =?us-ascii?Q?78T8sH+gLZMUmXgKP+/21H9W37JWviir89mgj5AYT+6rNeJ2MtNmZdMjoLeD?=
 =?us-ascii?Q?OC868sUODXcRl9wp5sIIwGbI5fXNKFjaBXg2M2cwxHB3Qte/ZfR+qcFIVIAh?=
 =?us-ascii?Q?uI/n4qTaxQ5FMTdiBrs+HQZyQgwMbgNi/cNEwJ7yUWTcyWvOdnrx1RtP8jjc?=
 =?us-ascii?Q?MzKp3/HL3ybcqrMTN+wOzf9zD/nL34xTGHafWpnojweDq4Ml2Ngyinv1sKZD?=
 =?us-ascii?Q?1auZIV4xpz8CMJYf6zYUQgQopBk2mkfmT59iGXzjO2pIPjn2Kg+oZ86z80Uf?=
 =?us-ascii?Q?wwGxA2FRm/0QJoknQPVwTNg8mneFw0OWOCxiW1n/ia99mvuc1I406HZKsphT?=
 =?us-ascii?Q?j7VhdwV2iwVuvTsMMQS8YRWLmc4jAtXfT5zrHLAVE2DcULAG7Klq5NbWcmS9?=
 =?us-ascii?Q?waKNhWJCeHQ/trv9v4k5FNYQpy9y/TpgpRN4l6Oyc2ERV+89LyKjKOB9oKaB?=
 =?us-ascii?Q?WbfK1/vkg0rnHLv9YhSrXar2r4uqd9FkTztXPiXG0b2uCwhFOtktGR+e+l+2?=
 =?us-ascii?Q?5UuERzFjI1ER9G3U34GP8s3dZ438JNjRgCKEQi1IOonI+m2HPSrRK66LA5ov?=
 =?us-ascii?Q?H757wISI2+6ALTw=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 16:09:16.8537
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad9f13a-63f9-4287-67a9-08dd76b7b677
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL6PEPF00020E66.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7803

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Enable selecting the mode in which the domain will be built and ran. This
includes:

- whether it will be either a 32/64 bit domain
- if it will be run as a PV or HVM domain
- and if it will require a device model (not applicable for dom0)

In the device tree, this will be represented as a bit map that will be carried
through into struct boot_domain.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Reviewed-by: Jason Andryuk <jason.andryuk@amd.com>
---
 xen/arch/x86/domain-builder/fdt.c      | 19 +++++++++++++++++++
 xen/arch/x86/include/asm/boot-domain.h |  5 +++++
 xen/arch/x86/setup.c                   |  3 ++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/xen/arch/x86/domain-builder/fdt.c b/xen/arch/x86/domain-builder/fdt.c
index 4c6aafe195..da65f6a5a0 100644
--- a/xen/arch/x86/domain-builder/fdt.c
+++ b/xen/arch/x86/domain-builder/fdt.c
@@ -193,6 +193,25 @@ static int __init process_domain_node(
             bd->domid = (domid_t)val;
             printk("  domid: %d\n", bd->domid);
         }
+        else if ( strncmp(prop_name, "mode", name_len) == 0 )
+        {
+            if ( fdt_prop_as_u32(prop, &bd->mode) != 0 )
+            {
+                printk("  failed processing mode for domain %s\n", name);
+                return -EINVAL;
+            }
+
+            printk("  mode: ");
+            if ( !(bd->mode & BUILD_MODE_PARAVIRT) )
+            {
+                if ( bd->mode & BUILD_MODE_ENABLE_DM )
+                    printk("HVM\n");
+                else
+                    printk("PVH\n");
+            }
+            else
+                printk("PV\n");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
diff --git a/xen/arch/x86/include/asm/boot-domain.h b/xen/arch/x86/include/asm/boot-domain.h
index d7c6042e25..e316d4bcde 100644
--- a/xen/arch/x86/include/asm/boot-domain.h
+++ b/xen/arch/x86/include/asm/boot-domain.h
@@ -13,6 +13,11 @@
 struct boot_domain {
     domid_t domid;
 
+                                          /* On     | Off    */
+#define BUILD_MODE_PARAVIRT      (1 << 0) /* PV     | PVH/HVM */
+#define BUILD_MODE_ENABLE_DM     (1 << 1) /* HVM    | PVH     */
+    uint32_t mode;
+
     struct boot_module *kernel;
     struct boot_module *module;
     const char *cmdline;
diff --git a/xen/arch/x86/setup.c b/xen/arch/x86/setup.c
index db7280225e..4127a0105d 100644
--- a/xen/arch/x86/setup.c
+++ b/xen/arch/x86/setup.c
@@ -1020,7 +1020,8 @@ static struct domain *__init create_dom0(struct boot_info *bi)
     struct boot_domain *bd = &bi->domains[0];
     struct domain *d;
 
-    if ( opt_dom0_pvh )
+    if ( opt_dom0_pvh ||
+         (bi->hyperlaunch_enabled && !(bd->mode & BUILD_MODE_PARAVIRT)) )
     {
         dom0_cfg.flags |= (XEN_DOMCTL_CDF_hvm |
                            ((hvm_hap_supported() && !opt_dom0_shadow) ?
-- 
2.43.0


