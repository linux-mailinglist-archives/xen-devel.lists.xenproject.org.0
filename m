Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A18B31603
	for <lists+xen-devel@lfdr.de>; Fri, 22 Aug 2025 13:01:26 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.1089940.1447424 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWA-0006Nn-BK; Fri, 22 Aug 2025 11:01:10 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1089940.1447424; Fri, 22 Aug 2025 11:01:10 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1upPWA-0006Kp-4g; Fri, 22 Aug 2025 11:01:10 +0000
Received: by outflank-mailman (input) for mailman id 1089940;
 Fri, 22 Aug 2025 11:01:09 +0000
Received: from se1-gles-flk1-in.inumbo.com ([94.247.172.50]
 helo=se1-gles-flk1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=JeQb=3C=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1upPOW-00083s-Al
 for xen-devel@lists.xenproject.org; Fri, 22 Aug 2025 10:53:16 +0000
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2060f.outbound.protection.outlook.com
 [2a01:111:f403:2413::60f])
 by se1-gles-flk1.inumbo.com (Halon) with ESMTPS
 id 3157e0b9-7f46-11f0-b898-0df219b8e170;
 Fri, 22 Aug 2025 12:53:11 +0200 (CEST)
Received: from BN9PR03CA0085.namprd03.prod.outlook.com (2603:10b6:408:fc::30)
 by LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.15; Fri, 22 Aug
 2025 10:53:03 +0000
Received: from BN1PEPF00005FFC.namprd05.prod.outlook.com
 (2603:10b6:408:fc:cafe::be) by BN9PR03CA0085.outlook.office365.com
 (2603:10b6:408:fc::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9052.18 via Frontend Transport; Fri,
 22 Aug 2025 10:53:03 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN1PEPF00005FFC.mail.protection.outlook.com (10.167.243.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Fri, 22 Aug 2025 10:53:03 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 22 Aug 2025 05:52:58 -0500
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
X-Inumbo-ID: 3157e0b9-7f46-11f0-b898-0df219b8e170
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tyjZe7qMs0m+XKVryrv2uWD7t0o/ooenefI2R1r1ayGwMEuOreuwuYOTn8vKFgRPyYhXlrbR1T2Mg6atWjExJJKY+6/QpCwCdzlKiUlGl3zlGnO35PfufcofH6AGkrxJdIeS1jqOVmX/xCL/rJ/3OvjTpQeqG+ulSwl+4SVDLXjfXZtIFwLrm4vfEWFvF65IRSjWvx6Bq/+mlLbQHlOpruVyt/Ztt/SGiHT173d+4WTnlX8KSvjnznC/pSWE4bq5QC4bcYUkFh2dLY865SgLfCTPOrMeajEEK33TYcFZ1tUHN+diL71rg3ULI4ZKg1UmDuMzpFd6JcvV/3d6pHPGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xDAGWRtenbTe+kY1SMfwJ8G/4UAXKyN7dLr6a70sMqg=;
 b=xJYoFGq762yqgP3wv0JTyr8ogHRsrxVPb6NCYF/VstiupQLk/M22fl2RrRix2jrkbaZeTYXmCaP+tYwDHWEDFc0dWgiKMVaAxrJ/enMdvurnC9dqnzXBGsJbLk+4djLIgnW/YFnyhGkwd0VPOGzFUImZd+GE03OJESGVyRgCMjzR0m8srOcF2Q+yRc6qtYFW0iK2j9YtWZi4N5XYbilq7rDIG2lpC48pkkxp1WBkWtrp0wDNWfAFSIAmQoXG5Pp6xxiEuwKUVsm0koa/4+2dE9A54F80oSEhRxB7g1B802QAsPTTGptQEC4l+/yTi2nxvh8gVf6s8zML0mAWpchpjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xDAGWRtenbTe+kY1SMfwJ8G/4UAXKyN7dLr6a70sMqg=;
 b=EXHtlMPAyGbX8py1lf6snf8QJcvaOnGmL8R4hQcpDgoUBf/zIlaef7Vmeyf54ap1rQ485wNwDrOXQMOjw/stnazeUbYXJ4TFpDeNHC+n9fZ01C/FFGct2ZQzNnVFgV6v+SmzCXUwZCHJBZO7EOm8EVIw7tYURnEUNv5vQlb/F/s=
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
Subject: [PATCH v7 11/13] tools/cpufreq: extract CPPC para from cpufreq para
Date: Fri, 22 Aug 2025 18:52:16 +0800
Message-ID: <20250822105218.3601273-12-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250822105218.3601273-1-Penny.Zheng@amd.com>
References: <20250822105218.3601273-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00005FFC:EE_|LV3PR12MB9356:EE_
X-MS-Office365-Filtering-Correlation-Id: fde8d80c-b819-4069-1ff0-08dde16a1189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xoe4wS1Uxa+8dNf7T20Qw0vSEju1VM3Yi/dfMR885JutJwuby+aB4rffhQ5R?=
 =?us-ascii?Q?OafQ9CUCTSkTAlqVYKC2YAVy7FTztSq+nLyOw9vuh/j3v8zI538S0DfmoI/b?=
 =?us-ascii?Q?XSSCASS7824BHEju6+HVXhI5k7TM8jR3aSYReOXWY6ISE1y5krM6K7gkFnQ3?=
 =?us-ascii?Q?wUalHnqeyr0jMgsfo1MA0Pjfrc2LP4fEXHL2GBKI5NEuea+OzRA5cURTPC5P?=
 =?us-ascii?Q?S2sZhcSMa0yo1OLTDOlNImF4Rz4Zv/9uI/Ke73/IXpe5TAFJ9+ZZ54bEu72l?=
 =?us-ascii?Q?I7AvMVkJsVwqOXYJjWkmjxZY+g0pdNS1HNDMGKe41EX3slmeRxTHKzgdFGXP?=
 =?us-ascii?Q?xvU+KMaUfbh3Yy15eDnFXxukg96INf+5Sfaskb4kxv762XTxv5blK5jIxt3n?=
 =?us-ascii?Q?K3UulvjQSsWsK0SgI+NXdB45DeyzStWqSD8/vksfJVs8W/qFqiv1mdxZUlXO?=
 =?us-ascii?Q?AROUuBkRTgTe2OgjjTFv98TiUmwywKhfXCTGIBqMJNGHDgxQhH87Sla3vlm9?=
 =?us-ascii?Q?N7mNbbf//mIFDaiaKVzNg/VjfOrPXhfTqfZ4VeDKqbZN+sCAVlnYFMjrAkCU?=
 =?us-ascii?Q?Lal7E4JDjGUGZHbwlrm+871tGlPihNjUmHU2TDX3MJvvP+JIHkp384+T+XNu?=
 =?us-ascii?Q?ylS7x/FI4QtKSEGA9voXDzZyxc61BID5eTf+goCkvjoIXqUvXP8ouhgmlpE7?=
 =?us-ascii?Q?XePLewMut3Y8xmcAEHIbOHAa+xwHuSIvJSX34Jn/F1eUtm/48Kj6Row2tN73?=
 =?us-ascii?Q?SGD7/6Y87CLXouET7AYEFnE550dJYCbIfBNgjBj2vmvnBqeP8Qlx54u/bWQS?=
 =?us-ascii?Q?kVnWYbLyUuLlAx7DXNBrUcxZSTtYaWIkWzD+GXwSSya8qS+iZ7wGh/XZrCUo?=
 =?us-ascii?Q?u2+n2StOnZRIBQEZ03V3QQZfsaY4PZVeqfTzhu3lOuChumzYQwLJfdY///m3?=
 =?us-ascii?Q?9j/8SnhGVbqex2wBrSNJYfDX+2Jdud0MKfhsH5/7N7dAe84HYB0Hi7NXO3On?=
 =?us-ascii?Q?EtARG9q99ymlGMYy/W+1UIi8K3m/TgbmxtYJFLu4SgQi3zjHMvPL7Yqtt8pc?=
 =?us-ascii?Q?+ccPG8skPXQbkkYFap6mMaICIpmUrrtG2hJBeTRA5HnBHfdOtbvb4yK2UXPf?=
 =?us-ascii?Q?OBqBNQHY9/p8gYXorBSLQshWkfCFYjy+T3kbrXlO9HQDgvge9zRzsNSt596v?=
 =?us-ascii?Q?sjD0QtWejC9RyGd7F/09FLnTo4mxnSomRFiG36b7lb+NdXrU0cJYwCkwSewJ?=
 =?us-ascii?Q?cGaiLMcLjT2pdNNxTaKO2N2k7JJf4UtnCC7pMYUt3p/UAbcjlDLphVB1v4ER?=
 =?us-ascii?Q?eFCJCoH74vejKXH2GwFR+u0KMJkhqCp/MOtRoJNCSJyhynLp1Ls1c9dNfHrL?=
 =?us-ascii?Q?DqVvpyDqAg65Ac32JF3wxlfsapUYedQcY5YH2Qhx6hkwc7EeDsY/MlTWyryQ?=
 =?us-ascii?Q?Ca4KgV5ZM2a1+j3UhesJvKzM7/IwYNE0R0fv7jO0obf+kUN8QOhalKaxxBtW?=
 =?us-ascii?Q?FOY8Z+z68Nh2i3jS90xvY5OgJyKL409Y5yV4?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Aug 2025 10:53:03.3038
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fde8d80c-b819-4069-1ff0-08dde16a1189
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00005FFC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9356

We extract cppc info from "struct xen_get_cpufreq_para", where it acts as
a member of union, and share the space with governor info.
However, it may fail in amd-cppc passive mode, in which governor info and
CPPC info could co-exist, and both need to be printed together via xenpm tool.
If we tried to still put it in "struct xen_get_cpufreq_para" (e.g. just move
out of union), "struct xen_get_cpufreq_para" will enlarge too much to further
make xen_sysctl.u exceed 128 bytes.

So we introduce a new sub-field GET_CPUFREQ_CPPC to dedicatedly acquire
CPPC-related para, and make get-cpufreq-para invoke GET_CPUFREQ_CPPC
if available.
New helpers print_cppc_para() and get_cpufreq_cppc() are introduced to
extract CPPC-related parameters process from cpufreq para.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
v5 -> v6:
- remove the changes for get-cpufreq-para
---
v6 -> v7:
- make get-cpufreq-para invoke GET_CPUFREQ_CPPC
---
 tools/include/xenctrl.h     |  3 +-
 tools/libs/ctrl/xc_pm.c     | 28 ++++++++++++-
 tools/misc/xenpm.c          | 78 ++++++++++++++++++++++++-------------
 xen/drivers/acpi/pm-op.c    | 19 +++++++--
 xen/include/public/sysctl.h |  3 +-
 5 files changed, 98 insertions(+), 33 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 965d3b585a..e5103453a9 100644
--- a/tools/include/xenctrl.h
+++ b/tools/include/xenctrl.h
@@ -1938,7 +1938,6 @@ struct xc_get_cpufreq_para {
                 xc_ondemand_t ondemand;
             } u;
         } s;
-        xc_cppc_para_t cppc_para;
     } u;
 
     int32_t turbo_enabled;
@@ -1953,6 +1952,8 @@ int xc_set_cpufreq_para(xc_interface *xch, int cpuid,
                         int ctrl_type, int ctrl_value);
 int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
                         xc_set_cppc_para_t *set_cppc);
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para);
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq);
 
 int xc_set_sched_opt_smt(xc_interface *xch, uint32_t value);
diff --git a/tools/libs/ctrl/xc_pm.c b/tools/libs/ctrl/xc_pm.c
index 6fda973f1f..446ac0b911 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -288,7 +288,6 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
         CHK_FIELD(s.scaling_min_freq);
         CHK_FIELD(s.u.userspace);
         CHK_FIELD(s.u.ondemand);
-        CHK_FIELD(cppc_para);
 
 #undef CHK_FIELD
 
@@ -366,6 +365,33 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
     return ret;
 }
 
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para)
+{
+    int ret;
+    struct xen_sysctl sysctl = {};
+    struct xen_get_cppc_para *sys_cppc_para = &sysctl.u.pm_op.u.get_cppc;
+
+    if ( !xch  || !cppc_para )
+    {
+        errno = EINVAL;
+        return -1;
+    }
+
+    sysctl.cmd = XEN_SYSCTL_pm_op;
+    sysctl.u.pm_op.cmd = GET_CPUFREQ_CPPC;
+    sysctl.u.pm_op.cpuid = cpuid;
+
+    ret = xc_sysctl(xch, &sysctl);
+    if ( ret )
+        return ret;
+
+    BUILD_BUG_ON(sizeof(*cppc_para) != sizeof(*sys_cppc_para));
+    memcpy(cppc_para, sys_cppc_para, sizeof(*sys_cppc_para));
+
+    return ret;
+}
+
 int xc_get_cpufreq_avgfreq(xc_interface *xch, int cpuid, int *avg_freq)
 {
     int ret = 0;
diff --git a/tools/misc/xenpm.c b/tools/misc/xenpm.c
index 6b054b10a4..8fc1d7cc65 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -801,6 +801,34 @@ static unsigned int calculate_activity_window(const xc_cppc_para_t *cppc,
     return mantissa * multiplier;
 }
 
+/* print out parameters about cpu cppc */
+static void print_cppc_para(unsigned int cpuid,
+                            const xc_cppc_para_t *cppc)
+{
+    printf("cppc variables       :\n");
+    printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
+           cppc->lowest, cppc->lowest_nonlinear);
+    printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
+           cppc->nominal, cppc->highest);
+    printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
+           cppc->minimum, cppc->maximum, cppc->energy_perf);
+
+    if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
+    {
+        unsigned int activity_window;
+        const char *units;
+
+        activity_window = calculate_activity_window(cppc, &units);
+        printf("                     : activity_window [%"PRIu32" %s]\n",
+               activity_window, units);
+    }
+
+    printf("                     : desired [%"PRIu32"%s]\n",
+           cppc->desired,
+           cppc->desired ? "" : " hw autonomous");
+    printf("\n");
+}
+
 /* print out parameters about cpu frequency */
 static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 {
@@ -826,33 +854,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
     printf("scaling_driver       : %s\n", p_cpufreq->scaling_driver);
 
-    if ( hwp )
-    {
-        const xc_cppc_para_t *cppc = &p_cpufreq->u.cppc_para;
-
-        printf("cppc variables       :\n");
-        printf("  hardware limits    : lowest [%"PRIu32"] lowest nonlinear [%"PRIu32"]\n",
-               cppc->lowest, cppc->lowest_nonlinear);
-        printf("                     : nominal [%"PRIu32"] highest [%"PRIu32"]\n",
-               cppc->nominal, cppc->highest);
-        printf("  configured limits  : min [%"PRIu32"] max [%"PRIu32"] energy perf [%"PRIu32"]\n",
-               cppc->minimum, cppc->maximum, cppc->energy_perf);
-
-        if ( cppc->features & XEN_SYSCTL_CPPC_FEAT_ACT_WINDOW )
-        {
-            unsigned int activity_window;
-            const char *units;
-
-            activity_window = calculate_activity_window(cppc, &units);
-            printf("                     : activity_window [%"PRIu32" %s]\n",
-                   activity_window, units);
-        }
-
-        printf("                     : desired [%"PRIu32"%s]\n",
-               cppc->desired,
-               cppc->desired ? "" : " hw autonomous");
-    }
-    else
+    if ( !hwp )
     {
         if ( p_cpufreq->gov_num )
             printf("scaling_avail_gov    : %s\n",
@@ -898,6 +900,23 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
     printf("\n");
 }
 
+/* show cpu cppc parameters information on CPU cpuid */
+static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
+{
+    int ret;
+    xc_cppc_para_t cppc_para;
+
+    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
+    if ( !ret )
+        print_cppc_para(cpuid, &cppc_para);
+    else if ( errno == ENODEV )
+        ret = 0; /* Ignore unsupported platform */
+    else
+        fprintf(stderr, "[CPU%u] failed to get cppc parameter\n", cpuid);
+
+    return ret;
+}
+
 /* show cpu frequency parameters information on CPU cpuid */
 static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
 {
@@ -957,7 +976,12 @@ static int show_cpufreq_para_by_cpuid(xc_interface *xc_handle, int cpuid)
     } while ( ret && errno == EAGAIN );
 
     if ( ret == 0 )
+    {
         print_cpufreq_para(cpuid, p_cpufreq);
+
+        /* Show CPPC parameters if available */
+        ret = show_cppc_para_by_cpuid(xc_handle, cpuid);
+    }
     else if ( errno == ENODEV )
     {
         ret = -ENODEV;
diff --git a/xen/drivers/acpi/pm-op.c b/xen/drivers/acpi/pm-op.c
index 6991616c1d..bf4638927f 100644
--- a/xen/drivers/acpi/pm-op.c
+++ b/xen/drivers/acpi/pm-op.c
@@ -77,6 +77,17 @@ static int read_scaling_available_governors(char *scaling_available_governors,
     return 0;
 }
 
+static int get_cpufreq_cppc(unsigned int cpu,
+                            struct xen_get_cppc_para *cppc_para)
+{
+    int ret = -ENODEV;
+
+    if ( hwp_active() )
+        ret = get_hwp_para(cpu, cppc_para);
+
+    return ret;
+}
+
 static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
 {
     uint32_t ret = 0;
@@ -142,9 +153,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( hwp_active() )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    if ( !hwp_active() )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -381,6 +390,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         ret = set_cpufreq_para(op);
         break;
 
+    case GET_CPUFREQ_CPPC:
+        ret = get_cpufreq_cppc(op->cpuid, &op->u.get_cppc);
+        break;
+
     case SET_CPUFREQ_CPPC:
         ret = set_cpufreq_cppc(op);
         break;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index eb3a23b038..3f654f98ab 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -492,7 +492,6 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
-        struct xen_get_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
@@ -523,6 +522,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
     #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
+    #define GET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x06)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -547,6 +547,7 @@ struct xen_sysctl_pm_op {
     uint32_t cpuid;
     union {
         struct xen_get_cpufreq_para get_para;
+        struct xen_get_cppc_para    get_cppc;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
         struct xen_set_cppc_para    set_cppc;
-- 
2.34.1


