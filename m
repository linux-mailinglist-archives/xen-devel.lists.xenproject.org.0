Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCAA9E1585
	for <lists+xen-devel@lfdr.de>; Tue,  3 Dec 2024 09:22:26 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.847304.1262459 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAc-0000uF-RO; Tue, 03 Dec 2024 08:22:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 847304.1262459; Tue, 03 Dec 2024 08:22:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tIOAc-0000eR-BX; Tue, 03 Dec 2024 08:22:10 +0000
Received: by outflank-mailman (input) for mailman id 847304;
 Tue, 03 Dec 2024 08:20:06 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=x39C=S4=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tIO8b-0007Zo-Vp
 for xen-devel@lists.xenproject.org; Tue, 03 Dec 2024 08:20:05 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20629.outbound.protection.outlook.com
 [2a01:111:f403:2009::629])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 64d2524b-b14f-11ef-99a3-01e77a169b0f;
 Tue, 03 Dec 2024 09:20:03 +0100 (CET)
Received: from SJ0PR13CA0172.namprd13.prod.outlook.com (2603:10b6:a03:2c7::27)
 by IA1PR12MB6410.namprd12.prod.outlook.com (2603:10b6:208:38a::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Tue, 3 Dec
 2024 08:19:57 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::d3) by SJ0PR13CA0172.outlook.office365.com
 (2603:10b6:a03:2c7::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.9 via Frontend Transport; Tue, 3
 Dec 2024 08:19:57 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Tue, 3 Dec 2024 08:19:56 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 3 Dec 2024 02:17:49 -0600
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
X-Inumbo-ID: 64d2524b-b14f-11ef-99a3-01e77a169b0f
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQXvPqpVS1eu5eOyVus+74kxKYVsawh3Ul15YgJ4U8pgzzy666/FEfI8WWSwh/MFTD4vZL5iQcDv/75TYK1zBdz2TahQVgrrAchvDobjtmSHOyl75EhN+h4ndJbWDf3f3b+R9agdei04WLqmb4YZd7plNj4X8U4rwNHI9xB64t3njPiEig723eSVPt6nTZnVDQ4TgaTTPnrEd30RRVO+G6KluQLHfC8IRLpCIPIRGVA/M890aG2P4BOgPZ6/cKoaDkvGitt7ThU1N1cm+Epnp5ZPyMgTsRPTPh3bYZgl/KHYNmAU/LCB2I0HLo6J6D2TNoauFOYfiaYaoSpzl359Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l+yjn6tY8kv6aWZsbjG/GS2xunJRw06lAQvR1V0lj7o=;
 b=PMmVmgrgHmCuuc/6I9vCJwPCQxSVIdb9bTfrA10/mbiK5unGKd9CAa/DSV/sDIS2OAhlzTyrHwbyToYrnY0b+RU1R6P1vQ+X/i6yb45PNLNT6qVtYWbjc+70cm0FoLpYRxl4PcWCy94w+GMrYYJxnqt+aCr2ArPE9OJkh+/WnpsmOLiW8WS3Rl2HT8O8Y7ni0bQKcB1EGnvaGs6JFCPyZneNopC9Z6kj1wLsqD3geUWFn3Qh2exnhhYVw7OWr8i2XwBXTiufbyT6JtvVA03gfnF4WRzYvknpGdYxJvWfqVJRwDI3FzyCBLhBGuS3jt5E3qQh2xMlyB7W6z92oGa7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l+yjn6tY8kv6aWZsbjG/GS2xunJRw06lAQvR1V0lj7o=;
 b=1KR6qmdXMS/SSkrOOzwWtYveiAIQ/2zBJLUcJ2ZTMT8ugqvMbFzUVVYa4GGanhkGQ/ldijDnu2doW1amto3+tkxfZ4dCHof63qJiSFRRE5DV5Gvod0YT7ZqdDdiqUQBEKRA+gJIexTKW0SWEOvj7sEfQCzQdV71ySYpA+Wz4G00=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <stefano.stabellini@amd.com>, <Ray.Huang@amd.com>,
	<Xenia.Ragiadakou@amd.com>, <Jason.Andryuk@amd.com>, <penny.zheng@amd.com>,
	Jan Beulich <jbeulich@suse.com>, Penny Zheng <Penny.Zheng@amd.com>
Subject: [PATCH v1 06/11] xen/cpufreq: introduce policy type when cpufreq_driver->setpolicy exists
Date: Tue, 3 Dec 2024 16:11:06 +0800
Message-ID: <20241203081111.463400-7-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241203081111.463400-1-Penny.Zheng@amd.com>
References: <20241203081111.463400-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|IA1PR12MB6410:EE_
X-MS-Office365-Filtering-Correlation-Id: d34d4d1c-b349-44be-137f-08dd137345a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?gfKf1U5PHlbKSL4sKieGBvNsemCb0Y7SC+emdaFiFTxYoXrLOw67x3vze5DP?=
 =?us-ascii?Q?+7MHaU7BBOXMAPF1aPmsjVPczUe+Hxs525KUABqOVSlHs19JCrRewl1r1Kjl?=
 =?us-ascii?Q?RGQb5WzLHfkkEWhG8GIuaDOQtFDEb7a6LfROyJpfT3z3o66ebgCXt8FVBYeB?=
 =?us-ascii?Q?R7wfXZzvYS/9E7JAzYci2wZdLDKQ9KtfWINQPTG39wOIEeaEsY39TbUuStsd?=
 =?us-ascii?Q?+ISKAQd+8GS8NTFhzTBR2Bojei9JqrSHD+Wjgy8ugMmyLFz/Tt6vsj+WIhrS?=
 =?us-ascii?Q?cLciiezmGywSTnEbsYlBFhcGPsXrtkRVeROcCM/r0VgSxTxXbeCvb9113ESl?=
 =?us-ascii?Q?hRfRmfEBw5hV2PcRSzWw6oxhaKj5X/yqgbZgWBiDL/z5QIYK8iJ47cT7i6G+?=
 =?us-ascii?Q?HNiVZ0Er8CVmoD+NNkIUj7DACt/zzZiHI7GgwN1tzPzdTdqt11kkO53Px4s3?=
 =?us-ascii?Q?l9lxTzpoTwWSdOFf7gD1+jkziQvstrhQIJ8AYuFTl0Gu5k4P+WRaCNyZnggA?=
 =?us-ascii?Q?W79HQm6C71Jd7yArHXLXIhsFqsCv9m3U1ZRPVw1lpxe5Xum82g7FxQ6R50PS?=
 =?us-ascii?Q?PPIMS9jSCWgcv3RuJodAyQe99G0xeJtPzutA0XEV4phN1LqJajCEO0l3Cy9Q?=
 =?us-ascii?Q?Kug9jRmrx5KDbcce2TyJUy/x2efVUm+5yxg7y7hXfSwR1/xGrCSRBOzf9SJ6?=
 =?us-ascii?Q?cQMXkJa/YJrxEiaTmcY/pR7Zya/vRMuDsxdBBrkd1wj4KDtqyYS3erBlfaYa?=
 =?us-ascii?Q?3MM2kcComhTU4jGxuDLJmcMJQbXpFrl6TSK7KB1kI80vXojYF/gNJqbv7e5G?=
 =?us-ascii?Q?TJt9vKK+5A98sjapB/m+/gHNMWxG7DfvF+meSj81j4yurxAlg1dJG2S+5TsJ?=
 =?us-ascii?Q?eMCUOhdLLlH9krdD3vSJghLSU0mZO7+yFvEDnF4AwSLredTpb6vPMtkLEf7q?=
 =?us-ascii?Q?30FpQ5f5cvwEY0EXyfS/wzj4H9aQOXTNCvHuOw23zNQDS55aW5/rppRUn+KP?=
 =?us-ascii?Q?XN8Sn5F628Sza+I+Kj80K9WXak9P64Ki5OQFNTuLR+C2lm3fFtj0X1ZdG75b?=
 =?us-ascii?Q?t/RV6UzITbNWbUZHNqNRnHRqMjGLeC00gHa2oQ63XVFK4/ELKCAvy4wuVf4d?=
 =?us-ascii?Q?XoXfnsEjJM2mw1LXHDUn7mPYXZaJgd8RV4S8enbFiZORnDcb7i9vtG1wnVYw?=
 =?us-ascii?Q?PFtrcuobPkkNpJYirJLflTk3JElQViLIQb2xnr+rz9iBt5ai1aMCFmJm94nk?=
 =?us-ascii?Q?YFAT8Y9i2uQnlPV7sRkGYbOP79ZkQdwhB3l2E/GdQyXeCElx1XnifLItxp6d?=
 =?us-ascii?Q?sCabrBsvNMxXveb+XTOOu5d0owlXTtd6WlxKQfv5G+1RQ9bdfaSAEJCagIQX?=
 =?us-ascii?Q?nFzbKiUZG7TRV38fKme4Hfz0guBcPFuKUzkpvhJ1ektC3Ud4xV97ZOic3cSi?=
 =?us-ascii?Q?DInw31QeTqr0uYrfeI1SrlZErvO9r+Lt?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2024 08:19:56.6154
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d34d4d1c-b349-44be-137f-08dd137345a5
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6410

From: Penny Zheng <penny.zheng@amd.com>

If cpufreq_driver->target exists, the ->governor decides what frequency
within the limits is used. But when cpufreq_driver->setpolicy exists,
the CPUFreq scaling driver bypasses the governor layer and implement
their own performance scaling algorithms. And we introduce the following
two generic policies CPUFREQ_POLICY_POWERSAVE and CPUFREQ_POLICY_PERFORMANCE,
to have 1:1 map with governor info, to still benefit from cpufreq_opt_governor
cmdline.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
 xen/drivers/cpufreq/utility.c      | 11 +++++++++++
 xen/include/acpi/cpufreq/cpufreq.h | 11 +++++++++++
 2 files changed, 22 insertions(+)

diff --git a/xen/drivers/cpufreq/utility.c b/xen/drivers/cpufreq/utility.c
index e690a484f1..2503ce6243 100644
--- a/xen/drivers/cpufreq/utility.c
+++ b/xen/drivers/cpufreq/utility.c
@@ -484,3 +484,14 @@ int __cpufreq_set_policy(struct cpufreq_policy *data,
 
     return __cpufreq_governor(data, CPUFREQ_GOV_LIMITS);
 }
+
+unsigned int cpufreq_parse_policy(struct cpufreq_governor *gov)
+{
+    if ( !strncasecmp(gov->name, "performance", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_PERFORMANCE;
+
+    if ( !strncasecmp(gov->name, "powersave", CPUFREQ_NAME_LEN) )
+        return CPUFREQ_POLICY_POWERSAVE;
+
+    return CPUFREQ_POLICY_UNKNOWN;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index acf133430b..cad27f6811 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -133,6 +133,17 @@ extern int cpufreq_register_governor(struct cpufreq_governor *governor);
 extern struct cpufreq_governor *__find_governor(const char *governor);
 #define CPUFREQ_DEFAULT_GOVERNOR &cpufreq_gov_dbs
 
+#define CPUFREQ_POLICY_UNKNOWN      0
+/*
+ * If cpufreq_driver->target() exists, the ->governor decides what frequency
+ * within the limits is used. If cpufreq_driver->setpolicy() exists, these
+ * two generic policies are available:
+ */
+#define CPUFREQ_POLICY_POWERSAVE    1
+#define CPUFREQ_POLICY_PERFORMANCE  2
+
+unsigned int cpufreq_parse_policy(struct cpufreq_governor *gov);
+
 /* pass a target to the cpufreq driver */
 extern int __cpufreq_driver_target(struct cpufreq_policy *policy,
                                    unsigned int target_freq,
-- 
2.34.1


