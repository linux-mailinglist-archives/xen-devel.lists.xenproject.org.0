Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id ECB27A2A337
	for <lists+xen-devel@lfdr.de>; Thu,  6 Feb 2025 09:33:50 +0100 (CET)
Received: from list by lists.xenproject.org with outflank-mailman.882566.1292747 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKS-00038f-5j; Thu, 06 Feb 2025 08:33:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 882566.1292747; Thu, 06 Feb 2025 08:33:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1tfxKR-0002zQ-UX; Thu, 06 Feb 2025 08:33:43 +0000
Received: by outflank-mailman (input) for mailman id 882566;
 Thu, 06 Feb 2025 08:33:42 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=2Xgo=U5=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1tfxKQ-0001Q7-F8
 for xen-devel@lists.xenproject.org; Thu, 06 Feb 2025 08:33:42 +0000
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on20614.outbound.protection.outlook.com
 [2a01:111:f403:2414::614])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 116d43c5-e465-11ef-a073-877d107080fb;
 Thu, 06 Feb 2025 09:33:41 +0100 (CET)
Received: from BN9P221CA0025.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::22)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8422.11; Thu, 6 Feb 2025 08:33:38 +0000
Received: from BN1PEPF00004687.namprd05.prod.outlook.com
 (2603:10b6:408:10a:cafe::29) by BN9P221CA0025.outlook.office365.com
 (2603:10b6:408:10a::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8398.24 via Frontend Transport; Thu,
 6 Feb 2025 08:33:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00004687.mail.protection.outlook.com (10.167.243.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8398.14 via Frontend Transport; Thu, 6 Feb 2025 08:33:38 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 6 Feb 2025 02:33:35 -0600
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
X-Inumbo-ID: 116d43c5-e465-11ef-a073-877d107080fb
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n1ez91pGkos8yYzLwqs4jA5VbIMQl4FZDcfsLmEOoSLRIW3DvVmBiwT5WEU/eUbJhaM5bgOJwUkMxDKzaS+J6jJZqZGFGVfWsrswP/BFA48VJp+7sh8CDnAEJ8C/RfM3Qjl5klJRgyENfG/Qr4eRYe1UN1DiiJZp1N2eb51yojJeGcPTO0pzdB2/889Vz4apM49PESvgekuH3mvSYrwBKCE+2UAhpUg8DwrQ3XpnNF8wx8e3rtzhwa2r5bXj+HHYpS584wv0Im4Xw+bW6voEIzD1kA8lPFsZKwldLbyQBQjWe6Gc5mOF5UMvaAMm+lRL5GAQgofqKVY/vuqze75I/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sRXoA5AODo751Xk4CER50cRQWcmXCgPQd5LQXTpxxkU=;
 b=OirQU9qjvv57bkcuNET4UR1hSlqKoCY/MFMySbMTh/8oCphQiOIYSaGTpSjxp2Fq3Nf+p96kOv9/L+kpL66dLXhYyaf8zlXsy28WuX4jRxWcyMLhEWZRe4YhUGxSEYI8PaAPEbymBZ5HG3pjyBwMqqQtZDyrK5XgDIK4Ppm5f5q0YxR/yaWKBJB4YftabRimA1sXfHqct6CP3p4sTWEYUXw9zipnoGlrpbZXlUcsrU6uR+/1VOQUuA0Yw1+gyQAevYDB7Dvivi6jS2kdLpvxfo7ZWeVbzmr4tf8t88SqBJssNQFUof7KEidwyY1ZO4mtjTRwc2GRgMTEW6kk9Z2LSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sRXoA5AODo751Xk4CER50cRQWcmXCgPQd5LQXTpxxkU=;
 b=GNwKJC/Jde0Mk4JRXSQuq8CLh8GFBDAnuZ6tiVk69BhRHocsAkBz6zTLXoA1vHHKsX1Q5FKVKU8pBn7/giiB0v7iwb6NZSE0oo+ZkmH4XmvfpELRqGOzkiEg/EI40WpCSX23iShJf+d8gAWBu4svIBnSp4SfxPPog2TDv733JV8=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <Ray.Huang@amd.com>, <Jason.Andryuk@amd.com>, Penny Zheng
	<Penny.Zheng@amd.com>, Jan Beulich <jbeulich@suse.com>, Andrew Cooper
	<andrew.cooper3@citrix.com>, =?UTF-8?q?Roger=20Pau=20Monn=C3=A9?=
	<roger.pau@citrix.com>
Subject: [PATCH v2 08/11] xen/cpufreq: abstract Energy Performance Preference value
Date: Thu, 6 Feb 2025 16:32:52 +0800
Message-ID: <20250206083255.1296363-9-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206083255.1296363-1-Penny.Zheng@amd.com>
References: <20250206083255.1296363-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004687:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: 6859ada4-6a23-4e6b-9a95-08dd4688f439
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PD43RoFGri4zOHNo6lVvPN5LDGpAlVGSLpE8e4WKzulaZa7NMBwdQg4xPl7I?=
 =?us-ascii?Q?oQy2qHbGTnjWpf3We5OKKK6aYJcbPU4h030BrlfuhZGIcCsyMnHwp57Rf9LQ?=
 =?us-ascii?Q?wnpNQWeOhuAZ9lpFqJRu6z7KHToOQr5se7MXcSBEZlzpkQbp0PwyVJwTQOGC?=
 =?us-ascii?Q?2x55YVhgSmmbMSqPg1SoL5wI2FODQri2tQTG3IISlgkKmx/HLY2F3qgcWKU8?=
 =?us-ascii?Q?A9Q4yaGFH7aKKX/louyv4V0j5GKxA2kLLDjpgv4HBL9MJ/rTJTUg5GomWwD1?=
 =?us-ascii?Q?7z2v7Zq8q639JOur3fdnYLUhdI4qTwTj+5XR+i6LNf8AzXyavzB4854w9ZYI?=
 =?us-ascii?Q?YYWqDS1S3gXZRGrWzTYpXfuDOTD/qSGkiwyFtsRI/nj8cm0IFw6MQe+sU3ga?=
 =?us-ascii?Q?2WhbrlwjJKkMtGmKeCS031kYSnrnrv8paJZ5TyqL08EYMjP52BvybYdlw+ym?=
 =?us-ascii?Q?feNQ/SCOspU06hR6AgFw779fSZnXfA6ywBZcWHZtGgeAaxu7cu0S3r6LQpR/?=
 =?us-ascii?Q?CIsYWCWlS0y+B/QiCkD82OB5J5dYeqg7cg7qzd+Y0VbDhAIfe9PQq2NJ9GuE?=
 =?us-ascii?Q?HMXkMtuXgB3TlEJQ4bq09BEmld5iNVjlrPT1f7rO+uVRbhPEPC76TYHODBi+?=
 =?us-ascii?Q?i4UyKAt8V33eYZxenx8hVEJgMBW1Ky6bZWTOavtZP4i5pjZcYjVzgArcTW8g?=
 =?us-ascii?Q?Qhp1GQgdc4gnnEGMIjj1r41C9KO/ZotVtQVUyCc14+fvIQh1BcTPM6tYOBiH?=
 =?us-ascii?Q?gq0vIOhp1WL//12tDLaKiD8PUbU9O7K/u0b+GDXtM1MzvjDwArKiE+YqjbCf?=
 =?us-ascii?Q?qHSkYyXWJkCqI7UDKN3w1TNJIy8qe35lOdnyR0y8MtT+dN4E/Jn5hddnN+KF?=
 =?us-ascii?Q?6pWHRbB5rWsWJdDwS5EPnEe7rRz2Fo+7XnJLnml/SpP2pJFkEESEiDnA6Dwx?=
 =?us-ascii?Q?dtXVsUFCVm+tIQpX73fqCEWVi/P4u97dXv6VQ37JCogmJa72ArY7Dr3ko7GY?=
 =?us-ascii?Q?0sR5EpQDo5vTAGH+eUkNjtpyjHnhWRUVbLi2ZIR+WdM+169h0jxGRUKzXA0t?=
 =?us-ascii?Q?JW1g8+OGCzP5+vKxkNGyDKgksi8HVUP9f+TBoMoh3sfIwBLblSE3FdPmcRMs?=
 =?us-ascii?Q?x16xq7HQoeunQ0bw8BOq/OhMg6z3b1Vn3WHuFFdpRyDl+jeqkLhOzbpASo/Z?=
 =?us-ascii?Q?BoqrWUXHHTtOWRrWN7zE8m7yZ9OPLMJIKVzG0nWb6iz2UVwp+3UZ/vQ9jguz?=
 =?us-ascii?Q?nqpSFdnBqWj1nU/A/BPnQMKSRYFLQ2Wc55t3asaKe5JseD0O1qIuAFdyRuVo?=
 =?us-ascii?Q?yEsN8dH2zfY4HvoIHSWn4AcKqdyllivuFFQ19sQqN6Kv+romUtbCpQN7Q0xC?=
 =?us-ascii?Q?s0dYrWjhFswC6iRoCw4ysziJWRZ6eR61Vm0OMwoy34+a6JMKIQGxMOM8dCNG?=
 =?us-ascii?Q?Xfrqo5JFwDvCflgKHbzpbPe21KNPUOxCs/oQUp2cE2DdvnRkI0QjmXzNf+bR?=
 =?us-ascii?Q?5faEbMq6naXYnEk=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 08:33:38.2765
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6859ada4-6a23-4e6b-9a95-08dd4688f439
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004687.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349

Intel's hwp Energy Performance Preference value is compatible with
CPPC's Energy Performance Preference value, so this commit abstracts
the value and re-place it in common header file cpufreq.h, to be
used not only for hwp in the future.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v1 -> v2:
- new commit
---
 xen/arch/x86/acpi/cpufreq/hwp.c    | 10 +++-------
 xen/include/acpi/cpufreq/cpufreq.h | 10 ++++++++++
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/xen/arch/x86/acpi/cpufreq/hwp.c b/xen/arch/x86/acpi/cpufreq/hwp.c
index 59b57a4cef..d5fa3d47ca 100644
--- a/xen/arch/x86/acpi/cpufreq/hwp.c
+++ b/xen/arch/x86/acpi/cpufreq/hwp.c
@@ -21,10 +21,6 @@ static bool __ro_after_init feature_hdc;
 
 static bool __ro_after_init opt_cpufreq_hdc = true;
 
-#define HWP_ENERGY_PERF_MAX_PERFORMANCE 0
-#define HWP_ENERGY_PERF_BALANCE         0x80
-#define HWP_ENERGY_PERF_MAX_POWERSAVE   0xff
-
 union hwp_request
 {
     struct
@@ -597,7 +593,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->minimum = data->hw.lowest;
         data->maximum = data->hw.lowest;
         data->activity_window = 0;
-        data->energy_perf = HWP_ENERGY_PERF_MAX_POWERSAVE;
+        data->energy_perf = CPPC_ENERGY_PERF_MAX_POWERSAVE;
         data->desired = 0;
         break;
 
@@ -605,7 +601,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->minimum = data->hw.highest;
         data->maximum = data->hw.highest;
         data->activity_window = 0;
-        data->energy_perf = HWP_ENERGY_PERF_MAX_PERFORMANCE;
+        data->energy_perf = CPPC_ENERGY_PERF_MAX_PERFORMANCE;
         data->desired = 0;
         break;
 
@@ -613,7 +609,7 @@ int set_hwp_para(struct cpufreq_policy *policy,
         data->minimum = data->hw.lowest;
         data->maximum = data->hw.highest;
         data->activity_window = 0;
-        data->energy_perf = HWP_ENERGY_PERF_BALANCE;
+        data->energy_perf = CPPC_ENERGY_PERF_BALANCE;
         data->desired = 0;
         break;
 
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index a6fb10ea27..3c2b951830 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -253,6 +253,16 @@ void cpufreq_dbs_timer_resume(void);
 
 void intel_feature_detect(struct cpufreq_policy *policy);
 
+/*
+ * If Energy Performance Preference(epp) is supported in the platform,
+ * OSPM may write a range of values from 0(performance preference)
+ * to 0xFF(energy efficiency perference) to control the platform's
+ * energy efficiency and performance optimization policies
+ */
+#define CPPC_ENERGY_PERF_MAX_PERFORMANCE 0
+#define CPPC_ENERGY_PERF_BALANCE         0x80
+#define CPPC_ENERGY_PERF_MAX_POWERSAVE   0xff
+
 int hwp_cmdline_parse(const char *s, const char *e);
 int hwp_register_driver(void);
 #ifdef CONFIG_INTEL
-- 
2.34.1


