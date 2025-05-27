Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Original-To: lists+xen-devel@lfdr.de
Delivered-To: lists+xen-devel@lfdr.de
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	by mail.lfdr.de (Postfix) with ESMTPS id 86874AC4AAE
	for <lists+xen-devel@lfdr.de>; Tue, 27 May 2025 10:50:47 +0200 (CEST)
Received: from list by lists.xenproject.org with outflank-mailman.997991.1378848 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1B-00018j-J6; Tue, 27 May 2025 08:50:41 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 997991.1378848; Tue, 27 May 2025 08:50:41 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1uJq1B-00015q-Ca; Tue, 27 May 2025 08:50:41 +0000
Received: by outflank-mailman (input) for mailman id 997991;
 Tue, 27 May 2025 08:50:39 +0000
Received: from se1-gles-sth1-in.inumbo.com ([159.253.27.254]
 helo=se1-gles-sth1.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <SRS0=RJbA=YL=amd.com=penny.zheng@srs-se1.protection.inumbo.net>)
 id 1uJq0I-00031E-I6
 for xen-devel@lists.xenproject.org; Tue, 27 May 2025 08:49:46 +0000
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on20619.outbound.protection.outlook.com
 [2a01:111:f403:2418::619])
 by se1-gles-sth1.inumbo.com (Halon) with ESMTPS
 id 88161911-3ad7-11f0-a2fd-13f23c93f187;
 Tue, 27 May 2025 10:49:43 +0200 (CEST)
Received: from BY5PR20CA0015.namprd20.prod.outlook.com (2603:10b6:a03:1f4::28)
 by BY5PR12MB4114.namprd12.prod.outlook.com (2603:10b6:a03:20c::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.26; Tue, 27 May
 2025 08:49:38 +0000
Received: from SJ5PEPF000001F4.namprd05.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::63) by BY5PR20CA0015.outlook.office365.com
 (2603:10b6:a03:1f4::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.40 via Frontend Transport; Tue,
 27 May 2025 08:49:38 +0000
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ5PEPF000001F4.mail.protection.outlook.com (10.167.242.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8769.18 via Frontend Transport; Tue, 27 May 2025 08:49:38 +0000
Received: from penny-System-Product-Name.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 27 May 2025 03:49:34 -0500
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
X-Inumbo-ID: 88161911-3ad7-11f0-a2fd-13f23c93f187
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LcIAPpNUuK1QalVq1OlHwlte4hKmqDq/eECqk4QxjrMsvrQnR39m41ZtWvW0HJ0UaM6u0mq4tVgyzbIOpeVM7WcPRfrQ/l5CIwbFPjjyHNchZ9g9n85WmO+yVr91Xp2btsCH131n47NcKChWrYRHoQ8rtS8JVenRNN9kuw9wI3dzOmJF4fUfKcMQooCj2iLAnwuQmgVlvsqBAY0ikq5CflMyqWQeJCfROtfl7UjJqcXUkHdQJYgHGJtjYJRq18L2d5/bihT9pv4+WZoAJmSiGwPDI0L5trZdX/vRm7HC9iROsUiq9QOnS4dtC2VJOLr6LVb6MzzKPQ7zN0p0RjKNlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXUlUm4d0wql5IcMZNTgxdbV0uwQON7fY64Zus5RrVI=;
 b=MwCaYnyTtXjkcu4Z3cFGmVXVyU8+XQrbddqLbzbF+1HrymDhP6ZCOVbt1XgRvIyX97e2/yg4nbs4qEaTUpkktrMLyreZRvuc3WYPVnaUpw6FVsgg1lapOcauhadsm9V+lFLJ9Eil5ASla+pdgZybc6iihaDqii5NQUeHU+K0LUgtP/nTHy6Fzmzy/AKANgW9mCnFgAtlpCVXvRwvwPRB9VD13MeENdtQGa0kviyJzMm9N+/+p3boNwHbkFqLpwZWkxvZhSx21w0swegQBdRoZlJoyl1PE6d1TDViUEnhh7RdGGYRGZhHAHNboSMNBTmXw+MVpvSGOgGV4fFd4ReWwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=lists.xenproject.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXUlUm4d0wql5IcMZNTgxdbV0uwQON7fY64Zus5RrVI=;
 b=IZd6nmDq5+g9M50YTUTxQ+dWFNTAlHHXBwmOaNkXHM5w9pZvuIqDYrs0plYdDGx9pjalQ3sfObCKqSuT8N8YCYq0FSfAQXUbFrzz/vR8g8eYtHWPPo9qn2hCkP8yXM7Iv89qmcR5UUHBvkfokDXDJ+nIp6mY8wY6M8OHpL3mD5U=
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
Subject: [PATCH v5 14/18] xen/cpufreq: introduce GET_CPUFREQ_CPPC sub-cmd
Date: Tue, 27 May 2025 16:48:29 +0800
Message-ID: <20250527084833.338427-15-Penny.Zheng@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250527084833.338427-1-Penny.Zheng@amd.com>
References: <20250527084833.338427-1-Penny.Zheng@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F4:EE_|BY5PR12MB4114:EE_
X-MS-Office365-Filtering-Correlation-Id: 03ad8595-4bea-4ada-6b23-08dd9cfb69d9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8c7J9+mnkKg15xE0pNV5pCkQM7W+XTe96cIrUWyPDC0nu6zGGX44DLXJG71b?=
 =?us-ascii?Q?sFJOfNGwENCiAtQd6wyv+hq9cfwLV2Hai9pHb5peWulMtrE5JCvsD5DwXeBk?=
 =?us-ascii?Q?mEh3GSPUlTxo6zLc84R8n2mSuuWX18YHkowCmChXdY7/wlortpm++/E05vl4?=
 =?us-ascii?Q?+h4PGK9UOFBKpWHWPIZqBPEmRWaPmFa7vZLYFv9Dw1FZFTYgpEwNuWwambia?=
 =?us-ascii?Q?EmC9X9wUl7rjk/TIsRUdV4LTC31lJigw5HNEdf6YwlaEdi1RLRtWCB/zP3hl?=
 =?us-ascii?Q?HiDiBb6y4CcQFCKB7+KErxYrAaTrji61n7BEKnSqKKkoBqTZeAxGkRP0EKu7?=
 =?us-ascii?Q?gosxLG/fJV5oC7NbFzGA8R3io9Q3bQvaO0fVPInyP5nJGNn9HygeA67O2Ep5?=
 =?us-ascii?Q?2cDGipVjqVeg68E4Hu0c6DqFHe+mOiHhndI5XtvKfHpN01VqGJEo+5YYSji4?=
 =?us-ascii?Q?S5V8rDKsnQR4aJDoVEkK7f5Jo2RxdlM8duRxijwBZXLHXhSYyowImJA312YN?=
 =?us-ascii?Q?BmVJiwIfy4p85Ju2IlOwsBSNxEB6nES3tH1Qmn1IDIT8pUrXsmA+uIrsSP6B?=
 =?us-ascii?Q?2JAnuIeBZ16pPtObybwWlx7Fo7NKa6FrIc7wRETMcg7jkFYoiT9r4s533pfu?=
 =?us-ascii?Q?ZkyUOj/GKDVzDGjDZl2s0m8+rlP+uh/aKKm7L2KbKnAkk5KvXgO4lwO380QB?=
 =?us-ascii?Q?vIgCJ63dUMx0WkFWO15VklrRFID2ku6eztvT/UdL6MSciAxQtNTDoR+rCWq2?=
 =?us-ascii?Q?nc/tAUlULZ7msTEm9XATNGxgQ2cQuTiY03FD0Ajq4ZyuNIkW89vbuoBlrSKN?=
 =?us-ascii?Q?bdCwC1Di6+PiamdfsXJ0C5ByEG5kZPK8dZ+QeIBgwS1I/maHxEylTKTwcKTk?=
 =?us-ascii?Q?/bW/M4DHJqS5m4w9Xw2cPxosu6tbbsF/rmn/c1BM+ya9xZfeb11WToWZ5j/N?=
 =?us-ascii?Q?yaBd4DeE62GETo6SmjBo5PFZULkk6OViL/OT3o1cD5MgOsmgfd3qq5WUpn7k?=
 =?us-ascii?Q?Ox617eUBsIq2fk3Mmc4uFUFzJUDq+DKpw8ezrKyGudR9QRqJvaNLQEDHuY8b?=
 =?us-ascii?Q?BGcTCLaWNYU5S40rr6HMTOri2fYOYE1WyeNoDgSZvJ9LhSY9irPP8BnagvZ5?=
 =?us-ascii?Q?+7xcQxIHIz98uYsrpiaClAYslyCwBw/Xn5TMqhL6w39EKt8RGeoGkXsrooae?=
 =?us-ascii?Q?rlRG4BvyHCzZySe54lgkV6CwyYaXahGImfl6Q2qJffC1ZHPsLk6sZ5uXFmEl?=
 =?us-ascii?Q?BVAz6aoo6LgNVJC2YiMoWPZX1wEnu+r7oK67suVZyfoMOUiB9ks/Us/sn1B/?=
 =?us-ascii?Q?6VSUeH2xOPolRPBlQBn08T7mtGykGZug90GvuufagHFg4p5iLQOAtq01BnXE?=
 =?us-ascii?Q?5whtv5GhzKXeJ/fJyZQ4l3vMh0UpSBVPlXBrTJR/K+O96JspIwXcfMBFAfBy?=
 =?us-ascii?Q?aue4aAoR4f8DJs/cqE56Kzw/ikdR1C9SIW4EwBxAqyEPlIaZBN6n/AQU/XrZ?=
 =?us-ascii?Q?VWKNaJ+79Ys9RSrbDUNKarRZGEtVUoNvtPtW?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 08:49:38.1797
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03ad8595-4bea-4ada-6b23-08dd9cfb69d9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4114

In amd-cppc passive mode, it's Xen governor which is responsible for
performance tuning, so governor and CPPC could co-exist. That is, both
governor-info and CPPC-info could be printed together via xenpm tool.

To achieve that, "struct xen_cppc_para" needs to be moved out of the union
and also "struct xen_get_cpufreq_para". Also if still putting it in
"struct xen_get_cpufreq_para" (e.g. just move out of union),
"struct xen_get_cpufreq_para" will enlarge too much to further make
xen_sysctl.u exceed 128 bytes.
We introduce a new sub-cmd GET_CPUFREQ_CPPC to specifically print
CPPC-related para and clear cppc print in GET_CPUFREQ_PARA.

Signed-off-by: Penny Zheng <Penny.Zheng@amd.com>
---
v4 -> v5:
- new commit
---
 tools/include/xenctrl.h     |  3 +-
 tools/libs/ctrl/xc_pm.c     | 28 ++++++++++-
 tools/misc/xenpm.c          | 97 ++++++++++++++++++++++++++-----------
 xen/drivers/acpi/pmstat.c   | 18 +++++--
 xen/include/public/sysctl.h |  3 +-
 5 files changed, 116 insertions(+), 33 deletions(-)

diff --git a/tools/include/xenctrl.h b/tools/include/xenctrl.h
index 4955981231..79523d2d73 100644
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
index ff7b5ada05..3c9e272aee 100644
--- a/tools/libs/ctrl/xc_pm.c
+++ b/tools/libs/ctrl/xc_pm.c
@@ -289,7 +289,6 @@ int xc_get_cpufreq_para(xc_interface *xch, int cpuid,
         CHK_FIELD(s.scaling_min_freq);
         CHK_FIELD(s.u.userspace);
         CHK_FIELD(s.u.ondemand);
-        CHK_FIELD(cppc_para);
 
 #undef CHK_FIELD
 
@@ -367,6 +366,33 @@ int xc_set_cpufreq_cppc(xc_interface *xch, int cpuid,
     return ret;
 }
 
+int xc_get_cppc_para(xc_interface *xch, unsigned int cpuid,
+                     xc_cppc_para_t *cppc_para)
+{
+    int ret;
+    struct xen_sysctl sysctl = {};
+    struct xen_cppc_para *sys_cppc_para = &sysctl.u.pm_op.u.cppc_para;
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
index db658ebadd..2a87f7ae8a 100644
--- a/tools/misc/xenpm.c
+++ b/tools/misc/xenpm.c
@@ -69,6 +69,7 @@ void show_help(void)
             " set-max-cstate        <num>|'unlimited' [<num2>|'unlimited']\n"
             "                                     set the C-State limitation (<num> >= 0) and\n"
             "                                     optionally the C-sub-state limitation (<num2> >= 0)\n"
+            " get-cpufreq-cppc      [cpuid]       list cpu cppc parameter of CPU <cpuid> or all\n"
             " set-cpufreq-cppc      [cpuid] [balance|performance|powersave] <param:val>*\n"
             "                                     set Hardware P-State (HWP) parameters\n"
             "                                     on CPU <cpuid> or all if omitted.\n"
@@ -812,33 +813,7 @@ static void print_cpufreq_para(int cpuid, struct xc_get_cpufreq_para *p_cpufreq)
 
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
@@ -981,6 +956,73 @@ void cpufreq_para_func(int argc, char *argv[])
         show_cpufreq_para_by_cpuid(xc_handle, cpuid);
 }
 
+/* print out parameters about cpu cppc */
+static void print_cppc_para(unsigned int cpuid,
+                            const xc_cppc_para_t *cppc)
+{
+    printf("cpu id               : %u\n", cpuid);
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
+/* show cpu cppc parameters information on CPU cpuid */
+static int show_cppc_para_by_cpuid(xc_interface *xc_handle, unsigned int cpuid)
+{
+    int ret;
+    xc_cppc_para_t cppc_para;
+
+    ret = xc_get_cppc_para(xc_handle, cpuid, &cppc_para);
+    if ( ret == 0 )
+        print_cppc_para(cpuid, &cppc_para);
+    else if ( errno == ENODEV )
+    {
+        ret = -ENODEV;
+        fprintf(stderr, "CPPC is not available!\n");
+    }
+    else
+        fprintf(stderr, "[CPU%u] failed to get cppc parameter\n", cpuid);
+
+    return ret;
+}
+
+static void cppc_para_func(int argc, char *argv[])
+{
+    int cpuid = -1;
+
+    if ( argc > 0 )
+        parse_cpuid(argv[0], &cpuid);
+
+    if ( cpuid < 0 )
+    {
+        /* show cpu cppc information on all cpus */
+        for ( unsigned int i = 0; i < max_cpu_nr; i++ )
+            if ( show_cppc_para_by_cpuid(xc_handle, i) == -ENODEV )
+                break;
+    }
+    else
+        show_cppc_para_by_cpuid(xc_handle, cpuid);
+}
+
 void scaling_max_freq_func(int argc, char *argv[])
 {
     int cpuid = -1, freq = -1;
@@ -1561,6 +1603,7 @@ struct {
     { "get-cpufreq-average", cpufreq_func },
     { "start", start_gather_func },
     { "get-cpufreq-para", cpufreq_para_func },
+    { "get-cpufreq-cppc", cppc_para_func },
     { "set-cpufreq-cppc", cppc_set_func },
     { "set-scaling-maxfreq", scaling_max_freq_func },
     { "set-scaling-minfreq", scaling_min_freq_func },
diff --git a/xen/drivers/acpi/pmstat.c b/xen/drivers/acpi/pmstat.c
index c09e001ec3..6e9178ade1 100644
--- a/xen/drivers/acpi/pmstat.c
+++ b/xen/drivers/acpi/pmstat.c
@@ -253,9 +253,7 @@ static int get_cpufreq_para(struct xen_sysctl_pm_op *op)
     else
         strlcpy(op->u.get_para.scaling_driver, "Unknown", CPUFREQ_NAME_LEN);
 
-    if ( hwp_active() )
-        ret = get_hwp_para(policy->cpu, &op->u.get_para.u.cppc_para);
-    else
+    if ( !hwp_active() )
     {
         if ( !(scaling_available_governors =
                xzalloc_array(char, gov_num * CPUFREQ_NAME_LEN)) )
@@ -328,6 +326,16 @@ static int set_cpufreq_gov(struct xen_sysctl_pm_op *op)
     return __cpufreq_set_policy(old_policy, &new_policy);
 }
 
+static int get_cpufreq_cppc(struct xen_sysctl_pm_op *op)
+{
+    int ret = -ENODEV;
+
+    if ( hwp_active() )
+        ret = get_hwp_para(op->cpuid, &op->u.cppc_para);
+
+    return ret;
+}
+
 static int set_cpufreq_para(struct xen_sysctl_pm_op *op)
 {
     int ret = 0;
@@ -498,6 +506,10 @@ int do_pm_op(struct xen_sysctl_pm_op *op)
         break;
     }
 
+    case GET_CPUFREQ_CPPC:
+        ret = get_cpufreq_cppc(op);
+        break;
+
     case SET_CPUFREQ_CPPC:
         ret = set_cpufreq_cppc(op);
         break;
diff --git a/xen/include/public/sysctl.h b/xen/include/public/sysctl.h
index fa431fd983..29872fe508 100644
--- a/xen/include/public/sysctl.h
+++ b/xen/include/public/sysctl.h
@@ -462,7 +462,6 @@ struct xen_get_cpufreq_para {
                 struct  xen_ondemand ondemand;
             } u;
         } s;
-        struct xen_cppc_para cppc_para;
     } u;
 
     int32_t turbo_enabled;
@@ -493,6 +492,7 @@ struct xen_sysctl_pm_op {
     #define SET_CPUFREQ_PARA           (CPUFREQ_PARA | 0x03)
     #define GET_CPUFREQ_AVGFREQ        (CPUFREQ_PARA | 0x04)
     #define SET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x05)
+    #define GET_CPUFREQ_CPPC           (CPUFREQ_PARA | 0x06)
 
     /* set/reset scheduler power saving option */
     #define XEN_SYSCTL_pm_op_set_sched_opt_smt    0x21
@@ -517,6 +517,7 @@ struct xen_sysctl_pm_op {
     uint32_t cpuid;
     union {
         struct xen_get_cpufreq_para get_para;
+        struct xen_cppc_para        cppc_para;
         struct xen_set_cpufreq_gov  set_gov;
         struct xen_set_cpufreq_para set_para;
         struct xen_set_cppc_para    set_cppc;
-- 
2.34.1


