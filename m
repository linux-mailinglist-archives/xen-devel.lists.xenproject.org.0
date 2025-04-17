Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E53FA91CD8
	for <lists+xen-devel@lfdr.de>; Thu, 17 Apr 2025 14:49:42 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.957526.1350713 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgR-0007ss-99; Thu, 17 Apr 2025 12:49:35 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 957526.1350713; Thu, 17 Apr 2025 12:49:35 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1u5OgR-0007oe-04; Thu, 17 Apr 2025 12:49:35 +0000
Received: by outflank-mailman (input) for mailman id 957526;
 Thu, 17 Apr 2025 12:49:33 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=m2wG=XD=amd.com=Alejandro.GarciaVallejo@srs-se1.protection.inumbo.net>)
 id 1u5OgO-00057t-VK
 for xen-devel@lists.xenproject.org; Thu, 17 Apr 2025 12:49:32 +0000
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20622.outbound.protection.outlook.com
 [2a01:111:f403:2406::622])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 66556f52-1b8a-11f0-9ffb-bf95429c2676;
 Thu, 17 Apr 2025 14:49:29 +0200 (CEST)
Received: from CH2PR16CA0008.namprd16.prod.outlook.com (2603:10b6:610:50::18)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Thu, 17 Apr
 2025 12:49:25 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::8f) by CH2PR16CA0008.outlook.office365.com
 (2603:10b6:610:50::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.22 via Frontend Transport; Thu,
 17 Apr 2025 12:49:25 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8655.12 via Frontend Transport; Thu, 17 Apr 2025 12:49:25 +0000
Received: from xcbagarciav01.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 17 Apr
 2025 07:49:23 -0500
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
X-Inumbo-ID: 66556f52-1b8a-11f0-9ffb-bf95429c2676
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jwIJTLD9OVqEwMP8KxtzqZbOV7xRIokhNngxR04Eeh1wbe2A+w8ymVYhSJ26J7TQ6l5iVAedTNDbh+Ln641Sa8OWi5e9URcyxqmdnHr2XHkc9FmJvGgIbuLHY1HcI5rXWxV0aFkr6L4czX7RAg8YajXDbIHuanh8qSKMmZAWdTGS3umDdsqvZVsFGxzRUMyje05N4XzH7T3QhsteMkHrphvB2pq9DVwOTbWQ7ZPkZ1cfyq3PmL94u3A3dLYskgf2hzmsq9eBBRaeu+349r8cGvLp/IpCMXaFCBfNUD3LhTKjkzU+0f4J+3mbKSBD3x/Vxw7JKfJfjGvDDKrmbVyG5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dG4dgkHyQpoSbEGo8ogLcSTekb2wVBJTPCULMiDnJuo=;
 b=KxBulFUNwwS2TXNlIRgBfUsvpX+2IWI3gJHeowuOiQz9Cdhjtu4tHAaC+JjUsFF0nMLP0IBter7sbM4G9GyU8h7CS8470Tba6azjYuaz58wl/hmYSx06QTnS6bdLcE8PlCrJ2AqDqfoElA9BOVkESC3qx8mD3QxcTIPfaPW89NVRvxPekuZZglXfjaeq4DYB/RKRc8KgGSarNeLFcf3t7NBKWT3DfoddGfuEbAxoW93ksvVgFpEuGIshp80pF0BbztIqgKwW2BCkuhuioZ1JaH8avdpe8wmD8iyuQOeEr1TkohTdm5hsW9cn7G+9pVytZlTrZ0EH8q5KpVYK4qS/yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dG4dgkHyQpoSbEGo8ogLcSTekb2wVBJTPCULMiDnJuo=;
 b=RvXc52CvSOhwDin8/ii7BvV2cQBfD3ApmjdrIVBaPWrXB8Sd950AILLr8pS3SizOyq4s3inW2llm6c1N4mj/wvuO6Uw1s2x6gYPr2QyHSHJ+M/4R4iNl28lya7NNKgZgGRjb8BfgTET5Y+wVYpzKGPzbLjeD/RECVu2H2OoBwwY=
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
Subject: [PATCH v4 10/13] x86/hyperlaunch: specify dom0 mode with device tree
Date: Thu, 17 Apr 2025 13:48:32 +0100
Message-ID: <20250417124844.11143-11-agarciav@amd.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: b0414358-6b72-439b-dfdf-08dd7dae489e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?mcn6xeLl6irSjACIL8eBxZy5Tacmh1o8mM2n4iE8niSWdZkcIGxjvHHCnt5c?=
 =?us-ascii?Q?ppANWuchVn2AD1At1ZZL+Ex9FOXFg3AhHg1SZQAqn2X4Sq5TKzh22K8VxiUz?=
 =?us-ascii?Q?xVS0/EYwMWtZNVfcU+R2xNd9AZHaLscInTtnoHM6l8Xjd9WDci3ptoslwoto?=
 =?us-ascii?Q?yF3r5T92CU+KbLCQM7KwsbhGd7vi6wtn8z2qQZ/yEKROYUgUIQ/ZSuknOre0?=
 =?us-ascii?Q?bunMjpasdM2C/oo2QymPrjmfs1MnVeFugENw340dDVIVlq+MwAgo5zndKIqF?=
 =?us-ascii?Q?hA0DTpq9x3WB1Pj+CVErqzZ5CSL9RYKJVhejJfjnyEorUUAGTp46DSyrs/xD?=
 =?us-ascii?Q?JhqMpaNQwiTOHzlGVuXKXI+vzbnjOmKbTrrxiePiH4zSRWwN1y08wqvYaWZ6?=
 =?us-ascii?Q?KOU7aO5ugLxUo2o6T4lGOqAYalDpcnNlD43aYc8ZMzFnPMY7hPA/6xaqwelm?=
 =?us-ascii?Q?Xnd19I2KE2qLdSvlpFx1I1JeKsTnGZ60Gw9BLfl7BfCujfnpLaiYpGQCU2PC?=
 =?us-ascii?Q?RFiDb9xP67/2AKNTnty2kKEI3hE1WV67xLqTlFkxSpUmQVjNhEo9zqE87HVB?=
 =?us-ascii?Q?TeH5zndmmg5fj/rjG6zM7MRHihjMRNNN2IH6br9MKCUx7t9TEIoxDNlYQ0Kn?=
 =?us-ascii?Q?43dMv6Zde4zUP4ZMEAITKfdtXLn+pactxEYhOJNC5AWIrf4iUWyWqARUqAiq?=
 =?us-ascii?Q?+Pr1AwECGRbRHmuw3Pru59MDx/gm11GX3gOE3ikw7fwpdhX9hZqSvvV9L/D9?=
 =?us-ascii?Q?3Un7mp/EnOf6ug23cxYmGTkMlwAOCrqlsDB0ARw3maf95quLiyj1YDxY9voj?=
 =?us-ascii?Q?PHL8AHqZZu0gz9MZ3pqY0nnOp4iG+l3Vw5saNOKkBLI4S/LCPoyFbfxhKvej?=
 =?us-ascii?Q?YtPr5a7tKQBnn0YJlyUdmM77+aLzw2TahF7vpN9TdLtshY0MXGGi32NB/yHq?=
 =?us-ascii?Q?KIC8o2T8qIWiDNZiUcZlY2h0fsIsI2g6kHCGbRoGvx4JQ5cnNooo9mx1p4JW?=
 =?us-ascii?Q?oFN0JNEbaTlVZH+VryqyZBTiZjvgE+BX6g8WZleuS9ShZeEtLHIduWXYqK37?=
 =?us-ascii?Q?pW4OlGP0DtLs8k15raVF9y4AKqOopjmZGhoL2rubYXMW+BELov4zWXBe+Rdz?=
 =?us-ascii?Q?Pm2ISAVv0SuzT2J+7R9SOuou7S9RaeGUsv3Cuv0NsD2dZRXFfjgA0lyIR1Rj?=
 =?us-ascii?Q?Df9iBCmOnqaKvGXpLEJyclrNA83z4cJ4GIv+HAzj985BujS0OMCIEHVKu4cb?=
 =?us-ascii?Q?/ERkzQYdnMG9JRRqjfOKpM6paxyBKEQPhX4/9JbyMrthaCo1Q3LDPK+xbclA?=
 =?us-ascii?Q?iEfdauwHNe8MD5nOlJ54CGSdot33lzDW+R8mKq6ENklNzJnTgrk0CQqWY565?=
 =?us-ascii?Q?c9Q8r4JnR4JXx6iOuYAeKuwg+UjIIsbYrXVtqgLxcnO5AmbPS9qqv7aNE1Ch?=
 =?us-ascii?Q?+pk1Zv3UZClfaAWIozXYeqq5EDjPF9CNrFa1KUYhj8nyjFnD4ZeMoJMdGR56?=
 =?us-ascii?Q?sbid/Ma+dnsec3CHnRqfbtO33XBaY6a9uiK8?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2025 12:49:25.1984
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b0414358-6b72-439b-dfdf-08dd7dae489e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476

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
Signed-off-by: Alejandro Vallejo <agarciav@amd.com>
---
v4:
  * printk adjustments
  * reject nodes with conflicting mode settings
---
 xen/arch/x86/include/asm/boot-domain.h |  5 +++++
 xen/arch/x86/setup.c                   |  3 ++-
 xen/common/domain-builder/fdt.c        | 21 +++++++++++++++++++++
 3 files changed, 28 insertions(+), 1 deletion(-)

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
index 04ad2d0937..05e3d2cf2a 100644
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
diff --git a/xen/common/domain-builder/fdt.c b/xen/common/domain-builder/fdt.c
index 0d3c713041..6809c7f917 100644
--- a/xen/common/domain-builder/fdt.c
+++ b/xen/common/domain-builder/fdt.c
@@ -225,6 +225,27 @@ static int __init process_domain_node(
             bd->domid = val;
             printk(XENLOG_INFO "  domid: %d\n", bd->domid);
         }
+        else if ( !strncmp(prop_name, "mode", name_len) )
+        {
+            if ( (rc = fdt_prop_as_u32(prop, &bd->mode)) )
+            {
+                printk(XENLOG_ERR
+                       "  failed processing mode for domain %s\n", name);
+                return rc;
+            }
+
+            if ( (bd->mode & BUILD_MODE_PARAVIRT)  &&
+                 (bd->mode & BUILD_MODE_ENABLE_DM) )
+            {
+                printk(XENLOG_ERR "  mode: invalid (pv+hvm)\n");
+                return -EINVAL;
+            }
+
+            printk(XENLOG_INFO "  mode: %s\n",
+                   (bd->mode & BUILD_MODE_PARAVIRT)  ? "pv"  :
+                   (bd->mode & BUILD_MODE_ENABLE_DM) ? "hvm" :
+                                                       "pvh");
+        }
     }
 
     fdt_for_each_subnode(node, fdt, dom_node)
-- 
2.43.0


