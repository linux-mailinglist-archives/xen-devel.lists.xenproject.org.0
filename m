Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EB0A9B386
	for <lists+xen-devel@lfdr.de>; Thu, 24 Apr 2025 18:11:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.966532.1356726 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAB-0002Iz-3K; Thu, 24 Apr 2025 16:10:59 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 966532.1356726; Thu, 24 Apr 2025 16:10:59 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u7zAB-0002Gv-0f; Thu, 24 Apr 2025 16:10:59 +0000
Received: by outflank-mailman (input) for mailman id 966532;
 Thu, 24 Apr 2025 16:10:57 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=/3PA=XK=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u7zA9-0001nH-Ii
 for xen-devel@lists.xenproject.org; Thu, 24 Apr 2025 16:10:57 +0000
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2062a.outbound.protection.outlook.com
 [2a01:111:f403:2417::62a])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id b3ace76d-2126-11f0-9eb2-5ba50f476ded;
 Thu, 24 Apr 2025 18:10:56 +0200 (CEST)
Received: from SJ0PR13CA0239.namprd13.prod.outlook.com (2603:10b6:a03:2c1::34)
 by PH8PR12MB7133.namprd12.prod.outlook.com (2603:10b6:510:22e::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Thu, 24 Apr
 2025 16:10:52 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::3f) by SJ0PR13CA0239.outlook.office365.com
 (2603:10b6:a03:2c1::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.33 via Frontend Transport; Thu,
 24 Apr 2025 16:10:52 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 24 Apr 2025 16:10:51 +0000
Received: from xcbagarciav01.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 24 Apr
 2025 11:10:47 -0500
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
X-Inumbo-ID: b3ace76d-2126-11f0-9eb2-5ba50f476ded
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAwTUgh8cqkJYCwTqs0TcV5G1Xvq75KDsYXLO8l7GIE5RcnMABNDPJ6xei4IcJZ6m/vGH6jXvM4KoKvDubyGzW/YV21ieLLKKViPSwQEaMB7qUIG87dLnK4Zv3Zczwu6hC9ke247h6t2CeNPB56rBrCe6OxP+2FYa0FIPTJm4dTZnDRT++voPXkShQqMbEh8OTZwMwk/sFElfy8UBp0M0N56cPzivyTwr1cdEX2d10Ud6H8rX3YK+WEOvoFyAeIiAN59f4vElt7cDrQMOT1dX4472JMj/4MqnnMmlTHGMLfJEyGjcCv9sjz8C7DmGJxmsHLrrXWIQiVt3ZjbbdvOew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fi5PfVfOlydABatnEURfMmEIY6UIrLm7/1zu+vrcS98=;
 b=ydlzvqI9mDSKZQidqBgt94aC07g+RnJmcBD//I9lcPh0z6XU3lofSMq3KEoKktdoF0bW3Gmp7ZowT2Jf97PKJHgz9CnjJoY0eDJPITgyRcgLyN9oS2EIq/mblU+Hp+I2wybYruQhcuqo8Z/ps+kt6AgXNwSllBl7ePUwQZ/Eg6Ae/Ldh+wNVbiio+W+taEtfq8XoNQ+pbHZcLnXZD+gymatj2shduF/mE3uTP7BF6NrMrNa/FEzBO7iRMyNu6Nlb1vjrcZcZdnv/1PGtpKJj4n6H71l6CTTjK0nnBmmmHx6fz4rL3Zrk5SnjFRdvNEGh5ouyyk1p6Dj7h5TPkLmwJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Fi5PfVfOlydABatnEURfMmEIY6UIrLm7/1zu+vrcS98=;
 b=FNGqZMDgjVLdXeG9QDfcaH/HO/C8hD2ZqTDAopWiMcTKAM7RvjRIvEjWGTDAjpt2hif0aN8WEICEwgsIITdkD2yhpLGwM//4i+oLMgy1qrph8ks2EcqNCJjV+7p2bmBaoMF7eC4jRSj6vErcZM+zlzsTiJPTQEA3D9QFG6kye8o=
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
Subject: [PATCH v5 03/12] x86/hyperlaunch: initial support for hyperlaunch device tree
Date: Thu, 24 Apr 2025 17:10:13 +0100
Message-ID: <20250424161027.92942-4-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|PH8PR12MB7133:EE_
X-MS-Office365-Filtering-Correlation-Id: de64220a-11a8-4fac-513f-08dd834a958a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?V8EX+/6EOWWtWhkPISv9G6VfAAWB/eC0URukXRx1XPWZq4YC8w2l2JU13uxK?=
 =?us-ascii?Q?R2suU4BWAV6Mc7/hdOcktFTXrQAMeqS932N20eyKEU53Rg3/n6+esrcsFM8c?=
 =?us-ascii?Q?7rHddRnCVyp5iv47Pub1OTLvlprVREzq1CUl2V7mKmfZrQp0eVoUkQxs9O5E?=
 =?us-ascii?Q?gbk1LqfosxbmeKyYH5snUeod0PAyFfbB2OL2xUlTv3gkBIo5kcuZr8ogmhcf?=
 =?us-ascii?Q?s0eEe4nGOYRQOOfyEutGVZSiZgqQxs/W0DooJnARZJ8xrR8J8nIcYdnQNSRH?=
 =?us-ascii?Q?nDSg9NGnqJfXd6ioEWx+WEnKy944JxVJNJpzsbCVbETnphkUrFGiPM7ACDJq?=
 =?us-ascii?Q?1uiNpwNiAtjnQZjmdqFqCuGR3PEX88pvJzqiEHrBqMPN9M63DmOf/dlX7wB7?=
 =?us-ascii?Q?TGIiMdVJvc3wKhzUx2IX3apFpD+4+RVsT5QZLP73OesbgO5nWab3PSIGiyQp?=
 =?us-ascii?Q?kpaGh9aZXbtYf2BmY4XVhCc8gbg/gj5BGhIgM0FjDciUQDm0FpSm7tNFk/Rr?=
 =?us-ascii?Q?IK1Bh/JcktXv53vwd6xmEEmbmutgiHNfqIds3ocgUF5F7mg1W6CeY0hL/IfQ?=
 =?us-ascii?Q?JGPix8VrV0pKlNR4IP29swdf0BFw8e3htsbbil6rz16tijBDlsRVFqc3CPEu?=
 =?us-ascii?Q?DuuSxZAv5YCcVkngBjQ12hQUKeWWCUS7FAKYi4e7DVylXvsyk7WRiNud8sMl?=
 =?us-ascii?Q?QnpDNbdb7oyMOyEC81/toukQu38yUlP7GlG7eW1RK9JouxjvgWX4oPpqOJhW?=
 =?us-ascii?Q?WTPwEgR1rSBJZ9jlQYY65J/GiL/aDOgtwL3o4omDGXYBqHuw2JSUJT6Y46rN?=
 =?us-ascii?Q?SXlmnHNqCKCytxD5r9Ys3uDClXmt2ycpiPdkZMvQhtI7oRrE/oavgC2tLu9S?=
 =?us-ascii?Q?dEpO2foXLEhqMYRajz8dF3zfCEK1QMfa836PE02Ge9fRUl7J/cq8iJ1g+xU7?=
 =?us-ascii?Q?0ITWf8wzzTioc8dT7sTcZqsFZDnD8b4D1iCcWdjK3PTPsZuwmizH2Lw0D3oz?=
 =?us-ascii?Q?gDjTx+OvnDaGcvXXr5H3JuCjQ64fBybmwq4bQS5Abhaj/UTRcGzC7DIBrCYX?=
 =?us-ascii?Q?dOpR0ab69J/gp0YN6rNXqRYwUIz0NJ7QVREkmlqgUhnUdhLPEbsDW6SeWs7t?=
 =?us-ascii?Q?uSmfys3obnarphW0d9hUbipdvIOGgsCzgfXSc+Q/zmUocUUnrjL+p0hcCTdU?=
 =?us-ascii?Q?7oAO4NZB4MdPr/bB0QXWI3UEeOw5x76xTZnFNEWmoUxUnQGtot9/62LjPC6m?=
 =?us-ascii?Q?XYMWzKUGRNB6kl5YXb4782o4ji8Ex5VRcMPcbCAgK3WXDmRSU8v3fQIA4IXp?=
 =?us-ascii?Q?ZbOZbisS5LEJH9s2Oo0rWuXlNYtKKZ++zrj/ORB5aCbW0Pa81Yhm3LhqBEk7?=
 =?us-ascii?Q?u4zXPP+tIpQ9TkDfPAaGlAQ5GC+q0B1eHXaluUzdEqNBT9xLx7LlOuzgj1Vi?=
 =?us-ascii?Q?33aY4Ze1OEaJ2Yvs3hRzMbZgkLov92FIlYKfwZUkR045D84Pvdjr/XoqDwea?=
 =?us-ascii?Q?9ADWmP2J30EKQwuM6r/Q0lzVksKQ71qUwGjP?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 16:10:51.4760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: de64220a-11a8-4fac-513f-08dd834a958a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7133

From: "Daniel P. Smith" <dpsmith@apertussolutions.com>

Add the ability to detect both a formal hyperlaunch device tree or a dom0less
device tree. If the hyperlaunch device tree is found, then count the number of
domain entries, reporting an error if more than one is found.

Signed-off-by: Daniel P. Smith <dpsmith@apertussolutions.com>
Signed-off-by: Jason Andryuk <jason.andryuk@amd.com>
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v5:
  * Turned !fdt check into a BUG_ON(). It's checked ahead of time.
---
 xen/arch/x86/include/asm/bootinfo.h |  1 +
 xen/common/domain-builder/core.c    | 15 +++++++
 xen/common/domain-builder/fdt.c     | 62 +++++++++++++++++++++++++++++
 xen/common/domain-builder/fdt.h     |  1 +
 xen/include/xen/domain-builder.h    |  2 +
 5 files changed, 81 insertions(+)

diff --git a/xen/arch/x86/include/asm/bootinfo.h b/xen/arch/x86/include/asm/bootinfo.h
index 82c2650fcf..1e3d582e45 100644
--- a/xen/arch/x86/include/asm/bootinfo.h
+++ b/xen/arch/x86/include/asm/bootinfo.h
@@ -84,6 +84,7 @@ struct boot_info {
     bool hyperlaunch_enabled;
 
     unsigned int nr_modules;
+    unsigned int nr_domains;
     struct boot_module mods[MAX_NR_BOOTMODS + 1];
     struct boot_domain domains[MAX_NR_BOOTDOMS];
 };
diff --git a/xen/common/domain-builder/core.c b/xen/common/domain-builder/core.c
index fdc13aee40..0955558977 100644
--- a/xen/common/domain-builder/core.c
+++ b/xen/common/domain-builder/core.c
@@ -16,10 +16,17 @@
 enum fdt_kind __init builder_init(struct boot_info *bi)
 {
     enum fdt_kind kind;
+    int ret;
 
     bi->hyperlaunch_enabled = false;
     switch ( (kind = detect_fdt_kind(bi)) )
     {
+    case FDT_KIND_HYPERLAUNCH:
+        printk(XENLOG_DEBUG "DT found: hyperlaunch\n");
+        bi->hyperlaunch_enabled = true;
+        bi->mods[0].type = BOOTMOD_FDT;
+        break;
+
     case FDT_KIND_NONE:
         /* No DT found */
         return kind;
@@ -32,6 +39,14 @@ enum fdt_kind __init builder_init(struct boot_info *bi)
     default:
         BUG();
     }
+
+    printk(XENLOG_INFO "Hyperlaunch configuration:\n");
+    if ( (ret = walk_hyperlaunch_fdt(bi)) < 0 )
+        panic("Walk of device tree failed (%d)\n", ret);
+
+    printk(XENLOG_INFO "  number of domains: %u\n", bi->nr_domains);
+
+    return FDT_KIND_HYPERLAUNCH;
 }
 
 /*
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 708dcfcbe8..c1ccba39a2 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -13,6 +13,36 @@
 
 #include "fdt.h"
 
+static int __init find_hyperlaunch_node(const void *fdt)
+{
+    int hv_node = fdt_path_offset(fdt, "/chosen/hypervisor");
+
+    if ( hv_node >= 0 )
+    {
+        /* Anything other than zero indicates no match */
+        if ( fdt_node_check_compatible(fdt, hv_node, "hypervisor,xen") )
+            return -ENODATA;
+
+        return hv_node;
+    }
+    else
+    {
+        /* Look for dom0less config */
+        int node, chosen_node = fdt_path_offset(fdt, "/chosen");
+
+        if ( chosen_node < 0 )
+            return -ENOENT;
+
+        fdt_for_each_subnode(node, fdt, chosen_node)
+        {
+            if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+                return chosen_node;
+        }
+    }
+
+    return -ENODATA;
+}
+
 enum fdt_kind __init detect_fdt_kind(const struct boot_info *bi)
 {
     enum fdt_kind kind;
@@ -20,6 +50,8 @@ enum fdt_kind __init detect_fdt_kind(const struct boot_info *bi)
 
     if ( !fdt || fdt_check_header(fdt) < 0 )
         kind = FDT_KIND_NONE;
+    else if ( find_hyperlaunch_node(fdt) >= 0 )
+        kind = FDT_KIND_HYPERLAUNCH;
     else
         kind = FDT_KIND_UNKNOWN;
 
@@ -28,6 +60,36 @@ enum fdt_kind __init detect_fdt_kind(const struct boot_info *bi)
     return kind;
 }
 
+int __init walk_hyperlaunch_fdt(struct boot_info *bi)
+{
+    int ret = 0, hv_node, node;
+    const void *fdt = bootstrap_map_bm(&bi->mods[HYPERLAUNCH_MODULE_IDX]);
+
+    BUG_ON(!fdt);
+
+    hv_node = find_hyperlaunch_node(fdt);
+    if ( hv_node < 0 )
+    {
+        ret = hv_node;
+        goto err_out;
+    }
+
+    fdt_for_each_subnode(node, fdt, hv_node)
+    {
+        if ( !fdt_node_check_compatible(fdt, node, "xen,domain") )
+            bi->nr_domains++;
+    }
+
+    /* Until multi-domain construction is added, throw an error */
+    if ( bi->nr_domains != 1 )
+        printk(XENLOG_ERR "hyperlaunch only supports dom0 construction\n");
+
+ err_out:
+    bootstrap_unmap();
+
+    return ret;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/common/domain-builder/fdt.h b/xen/common/domain-builder/fdt.h
index ed9c62631c..826c0f01e5 100644
--- a/xen/common/domain-builder/fdt.h
+++ b/xen/common/domain-builder/fdt.h
@@ -10,5 +10,6 @@ struct boot_info;
 #define HYPERLAUNCH_MODULE_IDX 0
 
 enum fdt_kind detect_fdt_kind(const struct boot_info *bi);
+int walk_hyperlaunch_fdt(struct boot_info *bi);
 
 #endif /* __XEN_DOMAIN_BUILDER_FDT_H__ */
diff --git a/xen/include/xen/domain-builder.h b/xen/include/xen/domain-builder.h
index b9702db735..cbb3cbea7c 100644
--- a/xen/include/xen/domain-builder.h
+++ b/xen/include/xen/domain-builder.h
@@ -9,6 +9,8 @@ enum fdt_kind
 {
     /* FDT not found. Skipped builder. */
     FDT_KIND_NONE,
+    /* Found Hyperlaunch FDT */
+    FDT_KIND_HYPERLAUNCH,
     /* Found an FDT that wasn't hyperlaunch. */
     FDT_KIND_UNKNOWN,
 };
-- 
2.43.0


