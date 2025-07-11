Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D8CB011C6
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 05:52:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040193.1411670 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nc-0004Oz-PP; Fri, 11 Jul 2025 03:51:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040193.1411670; Fri, 11 Jul 2025 03:51:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4nc-0004Ln-LD; Fri, 11 Jul 2025 03:51:48 +0000
Received: by outflank-mailman (input) for mailman id 1040193;
 Fri, 11 Jul 2025 03:51:46 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4na-0002Li-SY
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:51:46 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20628.outbound.protection.outlook.com
 [2a01:111:f403:2413::628])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 5c5737b7-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:51:45 +0200 (CEST)
Received: from MW4PR04CA0176.namprd04.prod.outlook.com (2603:10b6:303:85::31)
 by SJ2PR12MB9088.namprd12.prod.outlook.com (2603:10b6:a03:565::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Fri, 11 Jul
 2025 03:51:39 +0000
Received: from SJ1PEPF00001CEA.namprd03.prod.outlook.com
 (2603:10b6:303:85:cafe::33) by MW4PR04CA0176.outlook.office365.com
 (2603:10b6:303:85::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.22 via Frontend Transport; Fri,
 11 Jul 2025 03:51:39 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CEA.mail.protection.outlook.com (10.167.242.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:51:38 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:34 -0500
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
X-Inumbo-ID: 5c5737b7-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Djh4iqUFHWFlE5vybv7qaNy1Kpk/cClL+B6OfS2DRo7YAL6F5UCioeSx4v2cz+dDP1XPnz5S+GHkIEiamVaUEsfvxlDmM5hqaYgZmsPoacO2V4VhZZXsoqjXPiR/G+/s4BJWaz4JOSWzu/wVJOEvD+16p7ZGce1TIgcGRf+/8YcH7CYUmPxfJeot77pcxil4EkmUFCEhnvdgh6txOKy6b7F0fFV2XtvXrgyBOJ9i4VvGG5UUwkLFJKt3kz+a5dL6KuwH+aXLIhp1NnEmzu8ONcKGjE9Xfa1iEhKPD1gNqD2jgKVlIwgTj2aUcAVSfsYN2OL3rV8c6snAq1CSvcCnmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M6y0t8ISZfgQVKIS7ey3RVQglAxLcKZJF/Rjj3VczEo=;
 b=Bdv19xLXlSQit32XjM9+D2lfUlOAak6KoaIOV1Hyfjz7yfHZX9Wuo7vUNTGXqVYWYA8e7GSlTwMcu4graTRv2gKJak1vLo81oNLGh3c6DhLtbQ/Ffmed4vECsCyw7GlP6ul7Ps7lqk1oC2PJH+kXpfyzE5cus33JRkGBdg9cbS/7YOgIaB68cOOu7Q3G2gFPTMn17sqe8wtfNHNBBBRrtlGBz8S7MZq/tL8aaDvgmJrG/K9YQ+aDTBo7SgpWBVHx3V7Se98ywCYF7jkXYoLDUno1t/YXtmBwGvXJMixTWuUKyn4pK7X1MGqyXZYb/zNRlUOSVCxRIoI7p3erfWV5ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M6y0t8ISZfgQVKIS7ey3RVQglAxLcKZJF/Rjj3VczEo=;
 b=udKIzWeijncmlxkTNn6PBRfnJCT3fIu8oALCqCWHNTqBjwwaaoEXMjLD0LLTdp6dt+skZ8PQb1+UWsh3MEMZwfOyK37Gwma40ZkM8nW1scpbCQiXy5nXFx7XpHO2vuSd2kzYztnutwYb6AWP7Fgz0zjv4L3cES5OpBzQId4Vjrc=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Anthony PERARD
	<anthony.perard@vates.tech>, Juergen Gross <jgross@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, Michal Orzel <michal.orzel@amd.com>, Jan Beulich
	<jbeulich@suse.com>, Julien Grall <julien@xen.org>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>, "Stefano
 Stabellini" <sstabellini@kernel.org>
Subject: [PATCH v6 07/19] cpufreq: rename "xen_cppc_para" to "xen_get_cppc_para"
Date: Fri, 11 Jul 2025 11:50:54 +0800
Message-ID: <20250711035106.2540522-8-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250711035106.2540522-1-Penny.Zheng@amd.com>
References: <20250711035106.2540522-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CEA:EE_|SJ2PR12MB9088:EE_
X-MS-Office365-Filtering-Correlation-Id: b22d114d-a816-467a-ed24-08ddc02e3d2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?KLK5yUlgyTRDrkU+qhBxoncX/E403oeO3wvQrJ/qnMTanMaP6/ta7pg1J97Y?=
 =?us-ascii?Q?TJY7El9YWgGdUvy44esyQoZ3riJP6AxNeOyTp5c1GIjELelHodoNMJebVgZg?=
 =?us-ascii?Q?33rQIK9crSaUdynzF322Zz+Cu9mZeoKU0CMhwuFlvQwsCe/AG2es4achrYuC?=
 =?us-ascii?Q?6C7yvVxk2fjhHXQIT7QdxdBpSGrk/U6FXWmQRmrB1jOkCe5j0hptGgArGbcO?=
 =?us-ascii?Q?iWAuW36Mf+vd/E0sJsN6DMsozQHsfZ/W/dBCuKverCgeX6wWKEdop6f4xIbu?=
 =?us-ascii?Q?pskbSkdCt+T7326+V38yeeoIaHMLB7m6cx/Ky89DwwP1W336qkthvktfLclb?=
 =?us-ascii?Q?J8/08gukRplvFNZUvhXbTCI3/OL2/4nJPLWRIkjGtrU/xIwsYLikITCuz7RP?=
 =?us-ascii?Q?BqCOmByN/WDyw8q/4UlNPVnMSRll0R2lVBFAAvDHIffeMY5aTuI/nSDHPd/0?=
 =?us-ascii?Q?AwhPEJ8iw/Q9wWc4Qt6V1bbpb2Pmi1VC+q3B9zqrwHaBsgwNXzjJyhb6JpoI?=
 =?us-ascii?Q?lOKZTFZ3B+ohWwo4Xefkr+KRqYJ7NTgnqNTPKb9KYZH2KxmztE+8ebToNByd?=
 =?us-ascii?Q?lUSZOaQ3eseWt8I4+x74wAwn5LH1YIfV9AZVF9y1Ssdsla/aHP73Ql5R5Guj?=
 =?us-ascii?Q?8UVweYX9svjE045UFHd+mPrZJOP5V8Dcrha9jz7VFgnybmjEMlvHPmxCx+ll?=
 =?us-ascii?Q?/env3G9LeLjpOaCIjIb/ZbI2U6+lu0AZTgwopSWuakF4qiGGRKIoHDbWvxkT?=
 =?us-ascii?Q?eTz9zcOHjfGfdH0MTUajixQI2KVGkZAlMBk3unlo8AXxk1gZVyE8YjsrIBuv?=
 =?us-ascii?Q?hB6axSbROt7AQmBi3PpIRqB0PBJMiTZixot+GuHK4/lzGwLWjZ76n8SHCI/c?=
 =?us-ascii?Q?+bdasSRzPfb0nGlHbvC1xJ+TWMrx0Hx8zAnbSISSRlu4NsKOPFonI6WmTy+1?=
 =?us-ascii?Q?U+Qc7j8Esq55JuXE6M2JPJA73ARLmolQCcJgBuB4Z9thCFYiyN/1rHlDuTB0?=
 =?us-ascii?Q?qayCgkApF0qC0s25WJD6dR8B0viMiw9gjs2i0CY3O9qe676xagVPU5u6Ol5h?=
 =?us-ascii?Q?VafQU0ZpuRhh1n1hXZAeHKt6XO0CDQP3MEKnFVPjNE83G5dRGSblrMxbdI09?=
 =?us-ascii?Q?RnRm/We1uBQ44FeXVpmWysvjV11tvUjCIYrrOKOr50YtHwukXQOGhk1v8k/T?=
 =?us-ascii?Q?dfWqKoF7YjtIWbe02RrcJaseaQwPeigdGBw6PXK9jnQTwqRUMlJvhcUDCkGK?=
 =?us-ascii?Q?zWG3BNPNbr6kh8DXpjNpHqs/WDE568RoMCVjfdkORTxC2btIg5lCXkczfwRH?=
 =?us-ascii?Q?45tXD9vkhnSUrAOLydVNthFRu8kIm0cIliF4f1NP3OTEjap74k5kAZuMiG/V?=
 =?us-ascii?Q?UiMF9MrQcKuxy81pBtl5vgjGIa++D/x/METiejKYsbYlRuVfyjtqNdB77uE4?=
 =?us-ascii?Q?cNiGMRYRH/2dDVMiFWwWS40OzA4pUOCD8t3RVq6YpPY6BaqWzEeiwcWrOqfj?=
 =?us-ascii?Q?J58+pMHplf/1XTxvzycrN8whpP6upQQBAGF2?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:51:38.2707
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b22d114d-a816-467a-ed24-08ddc02e3d2f
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CEA.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9088

As we are going to add "struct xen_cppc_para" in "struct xen_sysctl_pm_op" as
a new xenpm sub-op later to specifically dealing with CPPC-info, we need to
follow the naming pattern, to change the struct name to "xen_get_cppc_para",
which is more suitable than "xen_cppc_para".

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v5 -> v6:
- new commit
---
 tools/include/xenctrl.h            | 2 +-
 xen/arch/x86/acpi/cpufreq/hwp.c    | 2 +-
 xen/include/acpi/cpufreq/cpufreq.h | 2 +-
 xen/include/public/sysctl.h        | 6 +++---
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 4955981231..965d3b585a 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1906,7 +1906,7 @@ int xc_smt_disable(xc_interface *xch);
  */
 typedef struct xen_userspace xc_userspace_t;
 typedef struct xen_ondemand xc_ondemand_t;
-typedef struct xen_cppc_para xc_cppc_para_t;
+typedef struct xen_get_cppc_para xc_cppc_para_t;
 
 struct xc_get_cpufreq_para {
     /* IN/OUT variable */
diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index e4c09244ab..7bf475ecb5 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -525,7 +525,7 @@ hwp_cpufreq_driver = {
 
 #ifdef CONFIG_PM_OP
 int get_hwp_para(unsigned int cpu,
-                 struct xen_cppc_para *cppc_para)
+                 struct xen_get_cppc_para *cppc_para)
 {
     const struct hwp_drv_data *data = per_cpu(hwp_drv_data, cpu);
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index 948530218a..7f26b5653a 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -267,7 +267,7 @@ static inline bool hwp_active(void) { return false; }
 #endif
 
 int get_hwp_para(unsigned int cpu,
-                 struct xen_cppc_para *cppc_para);
+                 struct xen_get_cppc_para *cppc_para);
 int set_hwp_para(struct cpufreq_policy *policy,
                  struct xen_set_cppc_para *set_cppc);
 
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index c9d96a06ff..86b6df30e7 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -336,7 +336,7 @@ struct xen_ondemand {
     uint32_t up_threshold;
 };
 
-struct xen_cppc_para {
+struct xen_get_cppc_para {
     /* OUT */
     /* activity_window supported if set */
 #define XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW  (1 << 0)
@@ -442,7 +442,7 @@ struct xen_set_cppc_para {
          XEN_SYSCTL_CPPC_SET_ACT_WINDOW  )
     /* IN/OUT */
     uint32_t set_params; /* bitflags for valid values */
-    /* See comments in struct xen_cppc_para. */
+    /* See comments in struct xen_get_cppc_para. */
     /* IN */
     uint32_t minimum;
     uint32_t maximum;
@@ -490,7 +490,7 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
-        struct xen_cppc_para cppc_para;
+        struct xen_get_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
-- 
2.34.1


