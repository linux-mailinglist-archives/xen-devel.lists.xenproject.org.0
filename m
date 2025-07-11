Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id F026EB011D9
	for <lists+xen-devel@lfdr.de>; Fri, 11 Jul 2025 06:01:08 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1040251.1411721 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wa-0001fn-6X; Fri, 11 Jul 2025 04:01:04 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1040251.1411721; Fri, 11 Jul 2025 04:01:04 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1ua4wa-0001cQ-2Z; Fri, 11 Jul 2025 04:01:04 +0000
Received: by outflank-mailman (input) for mailman id 1040251;
 Fri, 11 Jul 2025 04:01:02 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=3q0+=ZY=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1ua4ny-0002Li-Kr
 for xen-devel@lists.xenproject.org; Fri, 11 Jul 2025 03:52:10 +0000
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062b.outbound.protection.outlook.com
 [2a01:111:f403:2412::62b])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 6a5617ff-5e0a-11f0-b894-0df219b8e170;
 Fri, 11 Jul 2025 05:52:09 +0200 (CEST)
Received: from SJ0PR05CA0188.namprd05.prod.outlook.com (2603:10b6:a03:330::13)
 by PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.20; Fri, 11 Jul
 2025 03:52:03 +0000
Received: from SJ1PEPF00001CE5.namprd03.prod.outlook.com
 (2603:10b6:a03:330:cafe::22) by SJ0PR05CA0188.outlook.office365.com
 (2603:10b6:a03:330::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.7 via Frontend Transport; Fri,
 11 Jul 2025 03:52:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF00001CE5.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Fri, 11 Jul 2025 03:52:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 10 Jul 2025 22:51:59 -0500
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
X-Inumbo-ID: 6a5617ff-5e0a-11f0-b894-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZYFA5LxbX+51Q+PfZFe9C0SkCpDSPvwg7rXKyOdtpKbx1v+zwlh+O0YViQfLO/h10ZhUj5aKdBhHCko4hD9VsVKo2ykt3gz4ezRDAu/Ypy2XWvC7Iei2IM+AeJjFJnzVNKckR54qvTJyV/DLyh8y09ErNwlxtaM6u6470LhhsgliCEivAh/r87cu8+m/2LNLS33p4KmxTt9NaJRWCVvx4/v7c+3hqNuGhP/DdD+ILYgg8ul7MoM6ErblotFFsQYwv4GT/iHVLuDlGKZRymXbuaSPAMcL5K8r2u3LsTenjhvYICy2bnh09JaUvjj8xuHRW8lsOeglM79BDis3ziniAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t3xVA3KdE1o525Bs+jAGrF2sREXD+fWa1Ior5V3zAjQ=;
 b=BHMP5yiljO7yJ55mhHcqqzatkwoOeHiuRa4LPu4PetzkVraFgeJzWvnZOrjQ6axBiUy1+Lr2mYngHj83yrf+sdZRxS6irnl9iZ19i2ZARyJVy9AN+UwDZgpGKjQKL4YDxJfBnVnhW0z+wwJVlC6XfWb3276CK/d8QuUD2pslWmH4TcyXvFX98Kv6w0/Ml+7Ut99osTU1xbTAIoIBzHhVlJ5Yg9rwVGMGqTaeau328XlyOE3RsKNOXRRelx83oovXRdSui+PPMPjAbBJ4YtL15NiRvuk8Gpe6WxhfkvRi0SARe9p8rMe0d0dlmq+DyyNx2Nkv74dIkB8HNrCT4hOXAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t3xVA3KdE1o525Bs+jAGrF2sREXD+fWa1Ior5V3zAjQ=;
 b=ZNVfuI+OsijtWPx6X4w4wyf19NvPNjIKGV5yyjqKcroJJCYvJiYIJgvi4R08N16ZKEqUc62yFCYEUdwq8Tu9zZUZdfp7xW53oiRDiURpn4ZLgGH3FhCXaF14mpsphr4CyEA8C28v82jHX/RqiKzpaIYD0cRw5GrMiFTPfRrp9jM=
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
From: Penny Zheng <Penny.Zheng@amd.com>
To: <xen-devel@lists.xenproject.org>
CC: <ray.huang@amd.com>, Penny Zheng <Penny.Zheng@amd.com>, Jan Beulich
	<jbeulich@suse.com>
Subject: [PATCH v6 17/19] xen/cpufreq: introduce helper cpufreq_in_cppc_passive_mode()
Date: Fri, 11 Jul 2025 11:51:04 +0800
Message-ID: <20250711035106.2540522-18-Penny.Zheng@amd.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00001CE5:EE_|PH7PR12MB8056:EE_
X-MS-Office365-Filtering-Correlation-Id: 2f17b3f8-e6a7-43ee-a91a-08ddc02e4c13
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FvoYklPSjE/Q0okb/syCKo0IMpe+NkQ4DXafY40mjf9rDnV2DTqYfVHbVzve?=
 =?us-ascii?Q?fdSI2efLiQAld12m3q0yj6eU/p7QtwHOKzqJVc2r7vhayEDcsk/Zeu3Dy0QE?=
 =?us-ascii?Q?BRfW6H7aHi1Uvy9GrjELguSFwB9OYwc2p8OjJeYiERGL0emMbj+SHbM+J5fe?=
 =?us-ascii?Q?QBj8dzWB+UMU8ICyCldSkTA96EQaOK5OyIDHyRioFluL7y5R2TwFKEyWg7DB?=
 =?us-ascii?Q?4RBPvenRqvLNOjiwae5SmZUy8YhSUKlPix8hq1cqL5CWxDvp9ySuyz6a+Lto?=
 =?us-ascii?Q?HPvGZ2hiMf5UO2gB4IY05csY7cc9HmVoLse3cbkwlNgedRAUv8Ivz+DNpDjQ?=
 =?us-ascii?Q?n/QJtul2XkhugJW1ruIpJCVjEOHOABiouMC85//jROLpiCtbhTOQHVRjXSo0?=
 =?us-ascii?Q?EquFswtQDoJLrQXXYBodX3c2loxV6NpZEB/PHwxc8dHjD/hiWdtTg6J420U2?=
 =?us-ascii?Q?C00fkLnydSdGLPq7y8mTvgjWoH5V4bi6MrXRrkY5na+reIeN1XzJqwlHe6j8?=
 =?us-ascii?Q?aEVlR+SF36bIJ1ux0AbEmf/EEUhta7NJaeWIC09ZStmfmKQC4lvc50qBuAbb?=
 =?us-ascii?Q?8bKhqPcCwxOBaKu4thnURZYXsSu9WMf2yi6vqXyT7aiv1AmzGi7V2586Yaqo?=
 =?us-ascii?Q?hOF67XhXw8a6OVQz8tMBfDuuTgIz06xM/8WJJttgEh17bPy46GvovtH6pVGL?=
 =?us-ascii?Q?dKOG0Lc3fPucF+njNliAnbf3ZAse5CwCl3TsJRlgc9fWHcJ5CLlAYS2ohblk?=
 =?us-ascii?Q?cYxWbODbuHggyvHWA7+1HzhCP3Rhx7q6gV5DI84+KG07cEjM2dKbTG6zy0+q?=
 =?us-ascii?Q?ZyyKMfOCs81sfUf0ixiPCxROkOFlffrskWfTDcWhhDkpspRY6MnBY3irZ/ig?=
 =?us-ascii?Q?kYMtGeuKKOYqRmfieVchQYMGFp7M2cLbSm9jS9KlxmJsMcpMsJnd9RhfV9C5?=
 =?us-ascii?Q?xP9yyZShxHqOGc/RP5Jf7RbRKzo5ULZBDpbvzIrOLNPGKb/Jt1tNy2LNoFrp?=
 =?us-ascii?Q?/LpS3kEefwQLzDli1XzDMIx+CPzLmIlM0O+xM84JTCYF10CBEnwyvquvclrx?=
 =?us-ascii?Q?ySz7QxTGx8Ya3m/E9yqrSFujAYBVTSWSov2HYDEnVc3a2mOuYvwfQq2DMG5p?=
 =?us-ascii?Q?+oLBOvurkB1U5ZTsenyjU6F6SrxA5eERTdjlIhZAOU78vgV6rxtPO7AOApWr?=
 =?us-ascii?Q?2kTvFoZySnsH6po5tTfkMODHfY3bsAS/E01AyLPzk254S41VsoUwddmHk6sL?=
 =?us-ascii?Q?mEyJPzKAjhngU+Mq8StCMZZQXBRezcclKH7/+ZZNHIk3BC0tTsVNm3CUnqje?=
 =?us-ascii?Q?ukPY5GpYYSvp6PJHzocMElikdDM97Rydq2lRFOgge2IDpn4su66QopfvXt7E?=
 =?us-ascii?Q?SGP1NT7S2O4G88GSSGly/JVyWHEMUR/vD984/lcTmV2+umI7Qof86rO1d5/q?=
 =?us-ascii?Q?vsCPpwBIPDkxI5UHHk/AzpvwmxrUsMkPvFrQkkaYtcwLS8RuRBOWp3cjMkYP?=
 =?us-ascii?Q?5Br4J+IRoXvt92v7e1deHNoWPLFGfJIWkQjF?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jul 2025 03:52:03.2526
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2f17b3f8-e6a7-43ee-a91a-08ddc02e4c13
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF00001CE5.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8056

When cpufreq driver in cppc passive mode, it has both cppc and governor
info. We need to invoke two sysctl sub-ops ("get-cpufreq-cppc" and
"get-cpufreq-para") to produce both info.

A new helper cpufreq_in_cppc_passive_mode() is introduced to tell whether
cpufreq driver supports cppc passive mode.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v5 -> v6
- new commit
---
 xen/drivers/acpi/pm-op.c           | 10 +++++++++-
 xen/drivers/cpufreq/cpufreq.c      |  6 ++++++
 xen/include/acpi/cpufreq/cpufreq.h |  2 ++
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 0723cea34c..077efdfc5c 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -152,7 +152,15 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    ret = get_cpufreq_cppc(op->cpuid, &op->u.get_para.u.cppc_para);
+    /*
+     * When cpufreq driver in cppc passive mode, it has both cppc and governor
+     * info. Users could only rely on "get-cpufreq-cppc" to acquire CPPC info.
+     * And it returns governor info in "get-cpufreq-para"
+     */
+    if ( cpufreq_in_cppc_passive_mode(op->cpuid) )
+        ret = -ENODEV;
+    else
+        ret = get_cpufreq_cppc(op->cpuid, &op->u.get_para.u.cppc_para);
     if ( ret == -ENODEV )
     {
         if ( !(scaling_available_governors =
diff --git a/xen/drivers/cpufreq/cpufreq.c b/xen/drivers/cpufreq/cpufreq.c
index cf1fcf1d22..431f2903f8 100644
--- a/xen/drivers/cpufreq/cpufreq.c
+++ b/xen/drivers/cpufreq/cpufreq.c
@@ -962,3 +962,9 @@ int __init cpufreq_register_driver(const struct cpufreq_driver *driver_data)
 
     return 0;
 }
+
+bool cpufreq_in_cppc_passive_mode(unsigned int cpuid)
+{
+    return processor_pminfo[cpuid]->init & XEN_CPPC_INIT &&
+           cpufreq_driver.target;
+}
diff --git a/xen/include/acpi/cpufreq/cpufreq.h b/xen/include/acpi/cpufreq/cpufreq.h
index b0b22d1c9c..dd55d268c0 100644
--- a/xen/include/acpi/cpufreq/cpufreq.h
+++ b/xen/include/acpi/cpufreq/cpufreq.h
@@ -295,4 +295,6 @@ int acpi_cpufreq_register(void);
 int amd_cppc_cmdline_parse(const char *s, const char *e);
 int amd_cppc_register_driver(void);
 
+bool cpufreq_in_cppc_passive_mode(unsigned int cpuid);
+
 #endif /* __XEN_CPUFREQ_PM_H__ */
-- 
2.34.1


